Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2DE5364F2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:51:06 +0200 (CEST)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucEy-0004zP-Lk
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0k-0000a9-8b
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:22 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:47102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0i-0002Rb-20
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:21 -0400
Received: by mail-ed1-x535.google.com with SMTP id j28so5864770eda.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0AlfMugTaFQHTR4RJLK1+Qt7o+3l0uz7su/UXX7nt4=;
 b=MVv9ZMU4J7mig/zEC2iQC9OuXuhZsgShZFoO5C8WvRI8O3JsErzVIEchSvMWDkGh6B
 L5KYPUCqsKt0bxMh8gt/EhdvZArGdhRVdT+Z2iEzeuBGS3iP7Tpp0GRyORnWJCEvuBpK
 VAXfzMl9ZtXZ0FA/haAiGnLEguC5fyd/RBchSB6xe2PhWS2b6/XzKuYyGnzNlHiX5g1r
 bJP+Zb00eKsc85rqkpfYyfb4bcU13HRO+d5GdlAwnUdkj6XvzbPQagyg1F3WbJ3GFsoO
 qWj8ixXlE64f7O2dJ7e9pk9y8Nzy8ITBzGoOZZLOPY4SFn+ckkEXzhzAyQSNx8r0EM/h
 9xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0AlfMugTaFQHTR4RJLK1+Qt7o+3l0uz7su/UXX7nt4=;
 b=mjMo7GFk42pWcKsDjcEUtNsRHnR+n2hS1gLfoBQa92KiQ7C+iEr3Kj6DcuG+5IPB9R
 8WgLg19mywSRnbaZrOvPCBRuKXJu/PZ+4pIK9X3cmxV4ppkxQF2Urmt3gdT4/4iH+dKm
 GO/82+ra8uB4Iu/VP7C7Ckg5badu4UfPPuBzlIOWNbPymmIGItRt+EK1X01ismVzRQjB
 OgwVbMCYsc0ZfZsc2aBFJ7fPvXwJxyAXWCcxu6UVNM8Cf5u2Bpyy5QGILFmPBbUBif4r
 CJHr60Q71XVcP8+WBuojJzqkuqAa2um4KUBLmd1SUMrw32uYWRbU3IWlXNSbmTddekoc
 +7cw==
X-Gm-Message-State: AOAM53236eD+vPFxBtEQqiQxw2eE8UFuqaPYNfu2XXW78OT91VukqvX6
 Jwux7fd7eOY8bGUUWXy8EeCFLA==
X-Google-Smtp-Source: ABdhPJzdPk3vZeGXkigunUc+95VZk7LfKCz+tFZNds0/4wUcc90Bd/qqWY4STGurpzw3ijE1HSQGNg==
X-Received: by 2002:a05:6402:2713:b0:42b:7127:8614 with SMTP id
 y19-20020a056402271300b0042b71278614mr25076040edd.317.1653665778545; 
 Fri, 27 May 2022 08:36:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090606cf00b006feaa22e367sm1590750ejb.165.2022.05.27.08.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABB741FFC1;
 Fri, 27 May 2022 16:36:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 09/33] tests/docker: update debian-mips64el-cross with
 lcitool
Date: Fri, 27 May 2022 16:35:39 +0100
Message-Id: <20220527153603.887929-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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

Use lcitool to update debian-mips64el-cross to a Debian 11 based system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |   3 +-
 tests/docker/Makefile.include                 |   1 -
 .../dockerfiles/debian-mips64el-cross.docker  | 177 +++++++++++++++---
 tests/lcitool/refresh                         |   5 +
 4 files changed, 159 insertions(+), 27 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 1a533e6fc0..411dc06bf8 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -88,8 +88,7 @@ mips64-debian-cross-container:
 
 mips64el-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-mips64el-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0ac5975419..d9f37ae8fa 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -93,7 +93,6 @@ docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
-docker-image-debian-mips64el-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index c990b683b7..b02dcb7fd9 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -1,33 +1,162 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker mips64el cross-compiler target
-#
-# This docker target builds on the debian Stretch base image.
+#  $ lcitool dockerfile --layers all --cross mips64el debian-11 qemu
 #
+# https://gitlab.com/libvirt/libvirt-ci
 
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
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
-RUN dpkg --add-architecture mips64el && \
-    apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        gcc-mips64el-linux-gnuabi64
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a mips64el --arch-only qemu
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture mips64el && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-mips64el-linux-gnuabi64 \
+            gcc-mips64el-linux-gnuabi64 \
+            libaio-dev:mips64el \
+            libasound2-dev:mips64el \
+            libattr1-dev:mips64el \
+            libbpf-dev:mips64el \
+            libbrlapi-dev:mips64el \
+            libbz2-dev:mips64el \
+            libc6-dev:mips64el \
+            libcacard-dev:mips64el \
+            libcap-ng-dev:mips64el \
+            libcapstone-dev:mips64el \
+            libcurl4-gnutls-dev:mips64el \
+            libdaxctl-dev:mips64el \
+            libdrm-dev:mips64el \
+            libepoxy-dev:mips64el \
+            libfdt-dev:mips64el \
+            libffi-dev:mips64el \
+            libfuse3-dev:mips64el \
+            libgbm-dev:mips64el \
+            libgcrypt20-dev:mips64el \
+            libglib2.0-dev:mips64el \
+            libglusterfs-dev:mips64el \
+            libgnutls28-dev:mips64el \
+            libgtk-3-dev:mips64el \
+            libibumad-dev:mips64el \
+            libibverbs-dev:mips64el \
+            libiscsi-dev:mips64el \
+            libjemalloc-dev:mips64el \
+            libjpeg62-turbo-dev:mips64el \
+            liblttng-ust-dev:mips64el \
+            liblzo2-dev:mips64el \
+            libncursesw5-dev:mips64el \
+            libnfs-dev:mips64el \
+            libnuma-dev:mips64el \
+            libpam0g-dev:mips64el \
+            libpixman-1-dev:mips64el \
+            libpng-dev:mips64el \
+            libpulse-dev:mips64el \
+            librbd-dev:mips64el \
+            librdmacm-dev:mips64el \
+            libsasl2-dev:mips64el \
+            libsdl2-dev:mips64el \
+            libsdl2-image-dev:mips64el \
+            libseccomp-dev:mips64el \
+            libselinux1-dev:mips64el \
+            libslirp-dev:mips64el \
+            libsnappy-dev:mips64el \
+            libspice-server-dev:mips64el \
+            libssh-gcrypt-dev:mips64el \
+            libsystemd-dev:mips64el \
+            libtasn1-6-dev:mips64el \
+            libudev-dev:mips64el \
+            liburing-dev:mips64el \
+            libusb-1.0-0-dev:mips64el \
+            libusbredirhost-dev:mips64el \
+            libvdeplug-dev:mips64el \
+            libvirglrenderer-dev:mips64el \
+            libvte-2.91-dev:mips64el \
+            libzstd-dev:mips64el \
+            nettle-dev:mips64el \
+            systemtap-sdt-dev:mips64el \
+            xfslibs-dev:mips64el \
+            zlib1g-dev:mips64el && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/mips64el-linux-gnuabi64-gcc'\n\
+ar = '/usr/bin/mips64el-linux-gnuabi64-gcc-ar'\n\
+strip = '/usr/bin/mips64el-linux-gnuabi64-strip'\n\
+pkgconfig = '/usr/bin/mips64el-linux-gnuabi64-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'mips64'\n\
+cpu = 'mips64el'\n\
+endian = 'little'" > /usr/local/share/meson/cross/mips64el-linux-gnuabi64 && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-gcc
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV ABI "mips64el-linux-gnuabi64"
+ENV MESON_OPTS "--cross-file=mips64el-linux-gnuabi64"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=mips64el-linux-gnuabi64-
 ENV DEF_TARGET_LIST mips64el-softmmu,mips64el-linux-user
-
-# Install extra libraries to increase code coverage
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:mips64el \
-        liblzo2-dev:mips64el \
-        librdmacm-dev:mips64el \
-        libsnappy-dev:mips64el
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index a4b7452189..341a07e677 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -115,6 +115,11 @@ try:
                         trailer=debian_cross_build("arm-linux-gnueabihf-",
                                                    "arm-softmmu,arm-linux-user"))
 
+    generate_dockerfile("debian-mips64el-cross", "debian-11",
+                        cross="mips64el",
+                        trailer=debian_cross_build("mips64el-linux-gnuabi64-",
+                                                  "mips64el-softmmu,mips64el-linux-user"))
+
     generate_dockerfile("debian-mipsel-cross", "debian-11",
                         cross="mipsel",
                         trailer=debian_cross_build("mipsel-linux-gnu-",
-- 
2.30.2


