Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875AB5364DF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:47:17 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucBH-0006eT-VB
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0r-0000yF-Fy
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0o-0002Ue-A2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:28 -0400
Received: by mail-ed1-x52b.google.com with SMTP id u20so5893988edd.6
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZEKIIba+5DTGLqJM4LLlrBY0K9lHCHw3dRtdpn4RGOo=;
 b=xYR71gRaAQJXYDWS6t0U1sqfB9g6Kg5rQTf08D1aVOmfFKHxd4K1CeuuW19K1vi7cT
 8h4xjOk8PWe2rePZpbQwBuA4OpRxoX7jkHhgGcWHAZ+INbD44bWuT07YCnoHTeNv3XpT
 D5A5dKRd2hsnH400vSPb3frnXiySqNmOrDNDKKQgJSTHpsIN0X/LK1Npc5Hx7rkzechn
 oPg0XM3mIAj07oyLJB/G4RC6nzRTQuf3/GjG060a8c/NGA8BoKOxoIzbKSSiQkxO48J6
 8DRBG6ZiV287ePrLaxLZf625o+Y7v9NaR/O7NpTuSKlR6PX9HYffSrVJ2u9vPYD7H/GQ
 I1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZEKIIba+5DTGLqJM4LLlrBY0K9lHCHw3dRtdpn4RGOo=;
 b=wpIxzt7G9NiQ1UMYRoKjHhFDkwU9Xt6JB57rBdiRXDQQcoaikXcl88u7xQU5+3peql
 llxGbweKQuNIdCCX26Mb5q+mWDpK/z9BOspDvxiLxv7QZNOyp6VCkgK7+x6nOTnYrqlQ
 HziSpiRn+88tgHtKIc65ZkKBsSf7acrIsUXm6KnjoTBs8r0NWA1XSzrET4ZJV6hBMQfe
 jNjl523Vwum3GCC56efX8u5F9y+OFYk14WbKKnxZcj65UxtYi511Mx3FAEoG8GBcuhXa
 LYI8zGjPvNGw/jJvXqRuYU+YbqpEJcg5SUkmv7oXFxmUrRBIrYJ2gPfuzRcp5P2nsGjg
 1mmA==
X-Gm-Message-State: AOAM532RH2ZsyLqu+CQ6mEeUg9s8/O8XARQQH6i4udwd0ddlWgrXwVqC
 iRmzPyw8np4DvqHJfX75u2sOiA==
X-Google-Smtp-Source: ABdhPJwVlzKYxTSX4lQB3Wk67fRFccq5bwjQz/YrRF5XQ4XqZwDhslXrRKqdlNfrnh7Q79dqBKFJlA==
X-Received: by 2002:a05:6402:741:b0:42a:8fad:8f67 with SMTP id
 p1-20020a056402074100b0042a8fad8f67mr45491042edy.285.1653665784463; 
 Fri, 27 May 2022 08:36:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a50aad9000000b0042bda1327ddsm2216327edc.73.2022.05.27.08.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 770871FFBF;
 Fri, 27 May 2022 16:36:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 07/33] tests/docker: update debian-armel-cross with lcitool
Date: Fri, 27 May 2022 16:35:37 +0100
Message-Id: <20220527153603.887929-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use lcitool to update debian-armel-cross to a Debian 11 based system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |   3 +-
 tests/docker/Makefile.include                 |   1 -
 .../dockerfiles/debian-armel-cross.docker     | 178 ++++++++++++++++--
 tests/lcitool/refresh                         |   5 +
 4 files changed, 164 insertions(+), 23 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 4d1830f3fc..caef7decf4 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -27,8 +27,7 @@ arm64-debian-cross-container:
 
 armel-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-armel-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index d6e0710554..d9109bcc77 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-alpha-cross: docker-image-debian10
-docker-image-debian-armel-cross: docker-image-debian10
 docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index b7b1a3585f..a6153e5a83 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -1,26 +1,164 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker armel cross-compiler target
+#  $ lcitool dockerfile --layers all --cross armv6l debian-11 qemu
 #
-# This docker target builds on the debian Stretch base image.
-#
-FROM qemu/debian10
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
+
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
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture armel && \
-    apt update && \
-    apt install -yy crossbuild-essential-armel && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a armel --arch-only qemu
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture armel && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-arm-linux-gnueabi \
+            gcc-arm-linux-gnueabi \
+            libaio-dev:armel \
+            libasan5:armel \
+            libasound2-dev:armel \
+            libattr1-dev:armel \
+            libbpf-dev:armel \
+            libbrlapi-dev:armel \
+            libbz2-dev:armel \
+            libc6-dev:armel \
+            libcacard-dev:armel \
+            libcap-ng-dev:armel \
+            libcapstone-dev:armel \
+            libcurl4-gnutls-dev:armel \
+            libdaxctl-dev:armel \
+            libdrm-dev:armel \
+            libepoxy-dev:armel \
+            libfdt-dev:armel \
+            libffi-dev:armel \
+            libfuse3-dev:armel \
+            libgbm-dev:armel \
+            libgcrypt20-dev:armel \
+            libglib2.0-dev:armel \
+            libglusterfs-dev:armel \
+            libgnutls28-dev:armel \
+            libgtk-3-dev:armel \
+            libibumad-dev:armel \
+            libibverbs-dev:armel \
+            libiscsi-dev:armel \
+            libjemalloc-dev:armel \
+            libjpeg62-turbo-dev:armel \
+            liblttng-ust-dev:armel \
+            liblzo2-dev:armel \
+            libncursesw5-dev:armel \
+            libnfs-dev:armel \
+            libnuma-dev:armel \
+            libpam0g-dev:armel \
+            libpixman-1-dev:armel \
+            libpng-dev:armel \
+            libpulse-dev:armel \
+            librbd-dev:armel \
+            librdmacm-dev:armel \
+            libsasl2-dev:armel \
+            libsdl2-dev:armel \
+            libsdl2-image-dev:armel \
+            libseccomp-dev:armel \
+            libselinux1-dev:armel \
+            libslirp-dev:armel \
+            libsnappy-dev:armel \
+            libspice-server-dev:armel \
+            libssh-gcrypt-dev:armel \
+            libsystemd-dev:armel \
+            libtasn1-6-dev:armel \
+            libubsan1:armel \
+            libudev-dev:armel \
+            liburing-dev:armel \
+            libusb-1.0-0-dev:armel \
+            libusbredirhost-dev:armel \
+            libvdeplug-dev:armel \
+            libvirglrenderer-dev:armel \
+            libvte-2.91-dev:armel \
+            libzstd-dev:armel \
+            nettle-dev:armel \
+            systemtap-sdt-dev:armel \
+            xfslibs-dev:armel \
+            zlib1g-dev:armel && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/arm-linux-gnueabi-gcc'\n\
+ar = '/usr/bin/arm-linux-gnueabi-gcc-ar'\n\
+strip = '/usr/bin/arm-linux-gnueabi-strip'\n\
+pkgconfig = '/usr/bin/arm-linux-gnueabi-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'arm'\n\
+cpu = 'arm'\n\
+endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-gcc
+
+ENV ABI "arm-linux-gnueabi"
+ENV MESON_OPTS "--cross-file=arm-linux-gnueabi"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabi-
 ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user,armeb-linux-user
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:armel \
-        liblzo2-dev:armel \
-        librdmacm-dev:armel \
-        libsnappy-dev:armel
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 7e4a92f630..4dc5527234 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -105,6 +105,11 @@ try:
                         trailer=debian_cross_build("aarch64-linux-gnu-",
                                                    "aarch64-softmmu,aarch64-linux-user"))
 
+    generate_dockerfile("debian-armel-cross", "debian-11",
+                        cross="armv6l",
+                        trailer=debian_cross_build("arm-linux-gnueabi-",
+                                                   "arm-softmmu,arm-linux-user,armeb-linux-user"))
+
     generate_dockerfile("debian-armhf-cross", "debian-11",
                         cross="armv7l",
                         trailer=debian_cross_build("arm-linux-gnueabihf-",
-- 
2.30.2


