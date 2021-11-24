Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B345C35A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:34:45 +0100 (CET)
Received: from [::1] (port=40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsQ8-0004QT-TX
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprvq-0006hh-1m
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprvn-00060n-HL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637759003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZgAxt7y3Mc3rQajYg9veKQdfcUP2x56PiS/B6C12iY=;
 b=Y1Nlfr3BgSL+Lkd3yMJHolIHQRujuFav/gRhAKFzFFHyxTwWOGp67U0C2aVgwzRbh/o53F
 colEeBFhq9pIrVlJLD9Oa4GNwiwmL8mdJflkcvROpAZZ+8Q4q3iNG3sIX788247hI9JrwD
 1DyfJMuVkwFVvDi6bqma1Z330m7RaZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-wTKwgS8SOFmvhEAJ-6rGDg-1; Wed, 24 Nov 2021 08:03:17 -0500
X-MC-Unique: wTKwgS8SOFmvhEAJ-6rGDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81C9E801B04;
 Wed, 24 Nov 2021 13:03:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 995F17945F;
 Wed, 24 Nov 2021 13:03:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/18] tests/docker: auto-generate alpine.docker with
 lcitool
Date: Wed, 24 Nov 2021 13:01:50 +0000
Message-Id: <20211124130150.268230-19-berrange@redhat.com>
In-Reply-To: <20211124130150.268230-1-berrange@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit is best examined using the "-b" option to diff.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 225 +++++++++++++------------
 tests/lcitool/refresh                  |   1 +
 2 files changed, 120 insertions(+), 106 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 0ac30c8014..97c7a88d1f 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,109 +1,122 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile alpine-edge qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
 
-FROM alpine:edge
+FROM docker.io/library/alpine:edge
 
-RUN apk update
-RUN apk upgrade
+RUN apk update && \
+    apk upgrade && \
+    apk add \
+        alsa-lib-dev \
+        attr-dev \
+        bash \
+        bc \
+        bzip2 \
+        bzip2-dev \
+        ca-certificates \
+        capstone-dev \
+        ccache \
+        cdrkit \
+        ceph-dev \
+        clang \
+        ctags \
+        curl-dev \
+        cyrus-sasl-dev \
+        dbus \
+        diffutils \
+        dtc-dev \
+        eudev-dev \
+        findutils \
+        g++ \
+        gcc \
+        gcovr \
+        gettext \
+        git \
+        glib-dev \
+        glib-static \
+        gnutls-dev \
+        gtk+3.0-dev \
+        libaio-dev \
+        libbpf-dev \
+        libcap-ng-dev \
+        libdrm-dev \
+        libepoxy-dev \
+        libffi-dev \
+        libgcrypt-dev \
+        libjpeg-turbo-dev \
+        libnfs-dev \
+        libpng-dev \
+        libseccomp-dev \
+        libselinux-dev \
+        libslirp-dev \
+        libssh-dev \
+        libtasn1-dev \
+        liburing-dev \
+        libusb-dev \
+        libxml2-dev \
+        linux-pam-dev \
+        llvm11 \
+        lttng-ust-dev \
+        lzo-dev \
+        make \
+        mesa-dev \
+        meson \
+        multipath-tools \
+        ncurses-dev \
+        ndctl-dev \
+        net-tools \
+        nettle-dev \
+        nmap-ncat \
+        numactl-dev \
+        openssh-client \
+        pcre-dev \
+        perl \
+        perl-test-harness \
+        pixman-dev \
+        pkgconf \
+        pulseaudio-dev \
+        py3-numpy \
+        py3-pillow \
+        py3-pip \
+        py3-sphinx \
+        py3-sphinx_rtd_theme \
+        py3-virtualenv \
+        py3-yaml \
+        python3 \
+        rpm2cpio \
+        samurai \
+        sdl2-dev \
+        sdl2_image-dev \
+        sed \
+        snappy-dev \
+        sparse \
+        spice-dev \
+        spice-protocol \
+        tar \
+        tesseract-ocr \
+        texinfo \
+        usbredir-dev \
+        util-linux \
+        vde2-dev \
+        virglrenderer-dev \
+        vte3-dev \
+        which \
+        xen-dev \
+        xfsprogs-dev \
+        zlib-dev \
+        zlib-static \
+        zstd-dev && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-	alsa-lib-dev \
-	attr-dev \
-	bash \
-	bc \
-	bzip2 \
-	bzip2-dev \
-	ca-certificates \
-	capstone-dev \
-	ccache \
-	cdrkit \
-	ceph-dev \
-	clang \
-	ctags \
-	curl-dev \
-	cyrus-sasl-dev \
-	dbus \
-	diffutils \
-	dtc-dev \
-	eudev-dev \
-	findutils \
-	g++ \
-	gcc \
-	gcovr \
-	gettext \
-	git \
-	glib-dev \
-	glib-static \
-	gnutls-dev \
-	gtk+3.0-dev \
-	libaio-dev \
-	libbpf-dev \
-	libcap-ng-dev \
-	libdrm-dev \
-	libepoxy-dev \
-	libffi-dev \
-	libgcrypt-dev \
-	libjpeg-turbo-dev \
-	libnfs-dev \
-	libpng-dev \
-	libseccomp-dev \
-	libselinux-dev \
-	libslirp-dev \
-	libssh-dev \
-	libtasn1-dev \
-	liburing-dev \
-	libusb-dev \
-	libxml2-dev \
-	linux-pam-dev \
-	llvm11 \
-	lttng-ust-dev \
-	lzo-dev \
-	make \
-	mesa-dev \
-	meson \
-	multipath-tools \
-	ncurses-dev \
-	ndctl-dev \
-	net-tools \
-	nettle-dev \
-	nmap-ncat \
-	numactl-dev \
-	openssh-client \
-	pcre-dev \
-	perl \
-	perl-test-harness \
-	pixman-dev \
-	pkgconf \
-	pulseaudio-dev \
-	py3-numpy \
-	py3-pillow \
-	py3-pip \
-	py3-sphinx \
-	py3-sphinx_rtd_theme \
-	py3-virtualenv \
-	py3-yaml \
-	python3 \
-	rpm2cpio \
-	samurai \
-	sdl2-dev \
-	sdl2_image-dev \
-	sed \
-	snappy-dev \
-	sparse \
-	spice-dev \
-	spice-protocol \
-	tar \
-	tesseract-ocr \
-	texinfo \
-	usbredir-dev \
-	util-linux \
-	vde2-dev \
-	virglrenderer-dev \
-	vte3-dev \
-	which \
-	xen-dev \
-	xfsprogs-dev \
-	zlib-dev \
-	zlib-static \
-	zstd-dev
-
-RUN apk add $PACKAGES
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index b8cf0a7386..033120e223 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -84,6 +84,7 @@ try:
    generate_dockerfile("ubuntu2004", "ubuntu-2004",
                        trailer="".join(ubuntu2004_tsanhack))
    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
+   generate_dockerfile("alpine", "alpine-edge")
 
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
-- 
2.33.1


