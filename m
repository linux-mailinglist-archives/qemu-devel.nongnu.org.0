Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE215364D8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:44:08 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc8F-0000jK-CB
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0k-0000aF-A1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:22 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0e-0002Qn-KH
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:22 -0400
Received: by mail-ej1-x635.google.com with SMTP id f9so9590289ejc.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6Nhiu9OdQkcAGgiw21QAiI5TqsKe534R2D5NLjEbIE=;
 b=YWfjAMqD/ls5BTmWCABc4PLbEw5yS+e+ro+xwShwx34xeV9Kl748g+h8CHtv+OiBwl
 1UiigC3vqP5r3i2jmp0rw4+28qFnzFM7WZFa9YVO6EAz2DzI5F2bcg5OwJ1feV4hG0aV
 PsJ4C+jWqMmmFPzLTzeBuPCD5P9ud936gP4h851bUTw8zZr0Sr9DcEQtR+iWB78Tr9EC
 qkaQ+8GGe1O1CuC43SFd5Rg48SgIvGpl6d1StiKTZGSTRXqDnlA2dUtr4prKPTt++3jg
 HkVaR+jEx7ivja7Y0kfxrCtNAzJdyu3JPhSxCgHeXmbupNzaDxzdkwvJAhq31QctdDbF
 dL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6Nhiu9OdQkcAGgiw21QAiI5TqsKe534R2D5NLjEbIE=;
 b=Nh0K2RG7O2/rfTmcoIyIsPZ4za5n8De08vBdO5IRCemUWkwdMCWD9om8lkEl0SAw+m
 qAKLvDR9Xr/AQ5VG4UsmO7v5d2xkiB/iu53f/zsSJdCgYQDleq7paGXvrUOVP6f9815g
 iLsSK88V897W42PQzUECWvGkQHfGsMK6g6sDk884nRn2FyuQgVvlQ922gSM2mjLMTNM3
 /ZWdV7b6UeVPs8NbypkHRH94O38vWgX2xFn6lx8xLxddzJTqKHNUsEcLvdoj1R2kAEBK
 QRBvwHbzYN1J60ET7D9tPOfJ7vwQbcUCuhxw06zGlVG52rFZxhouwmU4bLD5zoh/UIOZ
 pc8w==
X-Gm-Message-State: AOAM5314EFOMxitBGYyfeDuIuJsMfvOLOaxjzJ0874Q/RaraZXNTes68
 jYBo7CFb2FafLOfBgtRT2W7vFA==
X-Google-Smtp-Source: ABdhPJz/gcN6io7gwn8VsliB0n8p0GOykINxEHnwGPiEui14USQih/i40QoD6BaXoVmU1Ebof3kVrg==
X-Received: by 2002:a17:907:7ea5:b0:6ff:1a57:28de with SMTP id
 qb37-20020a1709077ea500b006ff1a5728demr9738823ejc.60.1653665774922; 
 Fri, 27 May 2022 08:36:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 rh28-20020a17090720fc00b006f3ef214ddesm1542567ejb.68.2022.05.27.08.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 374771FFBE;
 Fri, 27 May 2022 16:36:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 06/33] tests/docker: update debian-armhf-cross with lcitool
Date: Fri, 27 May 2022 16:35:36 +0100
Message-Id: <20220527153603.887929-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lcitool to update debian-armhf-cross to a Debian 11 based system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |   3 +-
 tests/docker/Makefile.include                 |   1 -
 .../dockerfiles/debian-armhf-cross.docker     | 184 +++++++++++++++---
 tests/lcitool/refresh                         |   5 +
 4 files changed, 166 insertions(+), 27 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index ac15fce9b6..4d1830f3fc 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -34,8 +34,7 @@ armel-debian-cross-container:
 
 armhf-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-armhf-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ca2157db46..d6e0710554 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -90,7 +90,6 @@ endif
 
 docker-image-debian-alpha-cross: docker-image-debian10
 docker-image-debian-armel-cross: docker-image-debian10
-docker-image-debian-armhf-cross: docker-image-debian10
 docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 25d7618833..a2ebce96f8 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -1,29 +1,165 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker armhf cross-compiler target
+#  $ lcitool dockerfile --layers all --cross armv7l debian-11 qemu
 #
-# This docker target builds on the debian Stretch base image.
-#
-FROM qemu/debian10
+# https://gitlab.com/libvirt/libvirt-ci
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture armhf
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        crossbuild-essential-armhf
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a armhf --arch-only qemu
+FROM docker.io/library/debian:11-slim
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
-ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user,armeb-linux-user
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+            bash \
+            bc \
+            bsdextrautils \
+            bzip2 \
+            ca-certificates \
+            ccache \
+            dbus \
+            debianutils \
+            diffutils \
+            exuberant-ctags \
+            findutils \
+            gcovr \
+            genisoimage \
+            gettext \
+            git \
+            hostname \
+            libpcre2-dev \
+            libspice-protocol-dev \
+            llvm \
+            locales \
+            make \
+            meson \
+            ncat \
+            ninja-build \
+            openssh-client \
+            perl-base \
+            pkgconf \
+            python3 \
+            python3-numpy \
+            python3-opencv \
+            python3-pillow \
+            python3-pip \
+            python3-sphinx \
+            python3-sphinx-rtd-theme \
+            python3-venv \
+            python3-yaml \
+            rpm2cpio \
+            sed \
+            sparse \
+            tar \
+            tesseract-ocr \
+            tesseract-ocr-eng \
+            texinfo && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
+    dpkg-reconfigure locales
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:armhf \
-        liblzo2-dev:armhf \
-        librdmacm-dev:armhf \
-        libsnappy-dev:armhf \
-        libxen-dev:armhf
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture armhf && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-arm-linux-gnueabihf \
+            gcc-arm-linux-gnueabihf \
+            libaio-dev:armhf \
+            libasan5:armhf \
+            libasound2-dev:armhf \
+            libattr1-dev:armhf \
+            libbpf-dev:armhf \
+            libbrlapi-dev:armhf \
+            libbz2-dev:armhf \
+            libc6-dev:armhf \
+            libcacard-dev:armhf \
+            libcap-ng-dev:armhf \
+            libcapstone-dev:armhf \
+            libcurl4-gnutls-dev:armhf \
+            libdaxctl-dev:armhf \
+            libdrm-dev:armhf \
+            libepoxy-dev:armhf \
+            libfdt-dev:armhf \
+            libffi-dev:armhf \
+            libfuse3-dev:armhf \
+            libgbm-dev:armhf \
+            libgcrypt20-dev:armhf \
+            libglib2.0-dev:armhf \
+            libglusterfs-dev:armhf \
+            libgnutls28-dev:armhf \
+            libgtk-3-dev:armhf \
+            libibumad-dev:armhf \
+            libibverbs-dev:armhf \
+            libiscsi-dev:armhf \
+            libjemalloc-dev:armhf \
+            libjpeg62-turbo-dev:armhf \
+            liblttng-ust-dev:armhf \
+            liblzo2-dev:armhf \
+            libncursesw5-dev:armhf \
+            libnfs-dev:armhf \
+            libnuma-dev:armhf \
+            libpam0g-dev:armhf \
+            libpixman-1-dev:armhf \
+            libpng-dev:armhf \
+            libpulse-dev:armhf \
+            librbd-dev:armhf \
+            librdmacm-dev:armhf \
+            libsasl2-dev:armhf \
+            libsdl2-dev:armhf \
+            libsdl2-image-dev:armhf \
+            libseccomp-dev:armhf \
+            libselinux1-dev:armhf \
+            libslirp-dev:armhf \
+            libsnappy-dev:armhf \
+            libspice-server-dev:armhf \
+            libssh-gcrypt-dev:armhf \
+            libsystemd-dev:armhf \
+            libtasn1-6-dev:armhf \
+            libubsan1:armhf \
+            libudev-dev:armhf \
+            liburing-dev:armhf \
+            libusb-1.0-0-dev:armhf \
+            libusbredirhost-dev:armhf \
+            libvdeplug-dev:armhf \
+            libvirglrenderer-dev:armhf \
+            libvte-2.91-dev:armhf \
+            libxen-dev:armhf \
+            libzstd-dev:armhf \
+            nettle-dev:armhf \
+            systemtap-sdt-dev:armhf \
+            xfslibs-dev:armhf \
+            zlib1g-dev:armhf && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/arm-linux-gnueabihf-gcc'\n\
+ar = '/usr/bin/arm-linux-gnueabihf-gcc-ar'\n\
+strip = '/usr/bin/arm-linux-gnueabihf-strip'\n\
+pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'arm'\n\
+cpu = 'armhf'\n\
+endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-gcc
+
+ENV ABI "arm-linux-gnueabihf"
+ENV MESON_OPTS "--cross-file=arm-linux-gnueabihf"
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
+ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index dc1fc21ef9..7e4a92f630 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -105,6 +105,11 @@ try:
                         trailer=debian_cross_build("aarch64-linux-gnu-",
                                                    "aarch64-softmmu,aarch64-linux-user"))
 
+    generate_dockerfile("debian-armhf-cross", "debian-11",
+                        cross="armv7l",
+                        trailer=debian_cross_build("arm-linux-gnueabihf-",
+                                                   "arm-softmmu,arm-linux-user"))
+
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
                         trailer=debian_cross_build("s390x-linux-gnu-",
-- 
2.30.2


