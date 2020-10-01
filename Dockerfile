FROM lsiobase/guacgui:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="wastingaeons"
ENV APPNAME="deluge-gtk"

RUN \
 echo "**** install deps ****" && \
 sed -i 's/bionic/eoan/g' /etc/apt/sources.list && \
 apt-get update && \
 apt-get install -qy --no-install-recommends \
	python python-xdg deluge-common deluge-gtk && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3389
EXPOSE 8080
VOLUME /config

