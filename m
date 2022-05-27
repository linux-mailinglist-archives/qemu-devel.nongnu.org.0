Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92A5364D7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:44:08 +0200 (CEST)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc8F-0000g3-FD
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0m-0000kS-UD
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:24 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0k-0002S9-Nm
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id z43so1409299ede.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HMY4Vt85M7PzTk6qd69C5yIZHKs4b+tHZ6oLjpWmm4c=;
 b=kxa/p6yPAfXLFBfeuiU9CQBo5N8e/Duk+HjF+m77Roetu71YcornprV4+7Et+mUF9G
 we49m8KU8XAITFvPfMdgUkTEwut0yeCfOnp9tRKdyfHbB6DaOnp2ibtdmUNoaDirNB30
 wfOFGhJmW2jC0SFOD55wll61gIl7Y6CfXSjwG3zA3rv27RsD/uJaPTTFogOMytJwPRgk
 +8RqSRkaFL6CWHw3oTdWXRqKW+EpX2uTG/rCWeZNlSnoxvwYjTDTuHTx7L7yUbPbHM+1
 KgO2BaGCOe58AkDfxyBJitvHZuzDaV8jz3kMk2gLdGrlSYP3G/IYbbc9ch6F8Jl4w5y2
 XCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HMY4Vt85M7PzTk6qd69C5yIZHKs4b+tHZ6oLjpWmm4c=;
 b=I8t/vS7QDDpSRNQYs1KVAhIbtWoJMECP5hvRlVdwk5pAAb/N/m99hOydByZpwqeotN
 P0f/uRz9Ll5S/OyBjzVb/2SXZ38bSY41G3qx3wfxy/7ATeYhGh4t/Ut5M/G/7uHXm0pB
 XVgDY99CWRa76YveOOcUI/Ddzw8JeJmNUKY/N/5QvCxfV/jnpq5lCBrYANhioTf2NXxI
 ztSQCfF1OqZdw0GK0xrSJ+Yvm5BDbQnWUpQm9mGylQq3FWAV7gHsbLz8aDKuO1fUEnMB
 ZYCTHb6uPOcTFioZK2ws1G6vNpN+6WNgDr+TKFW0Mki3wOUpAdLlf611Q07Q+wii3PPu
 ArEQ==
X-Gm-Message-State: AOAM5325fG31hieGPt+6Aif18duR1fw/9Sqq6gLgHDqtWdndrj+HjXhd
 54htBdtlKh5EKb/CCgUNq3dQEQ==
X-Google-Smtp-Source: ABdhPJx8SPS1UFWKpWDn8vounkjeu7KWbNNkUQd/H0KJ9p0CImtVCAZRqxEPbgd7wexs03GXAUpXdQ==
X-Received: by 2002:a05:6402:5002:b0:42d:8b86:a8dc with SMTP id
 p2-20020a056402500200b0042d8b86a8dcmr366787eda.54.1653665781315; 
 Fri, 27 May 2022 08:36:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056402348500b0042b607daf7dsm2344795edc.45.2022.05.27.08.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C06601FFC2;
 Fri, 27 May 2022 16:36:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 10/33] tests/docker: update debian-ppc64el-cross with
 lcitool
Date: Fri, 27 May 2022 16:35:40 +0100
Message-Id: <20220527153603.887929-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

Use lcitool to update debian-ppc64el-cross to a Debian 11 based system.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |   3 +-
 tests/docker/Makefile.include                 |   1 -
 .../dockerfiles/debian-ppc64el-cross.docker   | 178 +++++++++++++++---
 tests/lcitool/refresh                         |   5 +
 4 files changed, 163 insertions(+), 24 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 411dc06bf8..147e667744 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -114,8 +114,7 @@ powerpc-test-cross-container:
 
 ppc64el-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  stage: containers
   variables:
     NAME: debian-ppc64el-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index d9f37ae8fa..e68f91b853 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -93,7 +93,6 @@ docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
-docker-image-debian-ppc64el-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 5de12b01cd..bcf04bc90b 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -1,28 +1,164 @@
+# THIS FILE WAS AUTO-GENERATED
 #
-# Docker ppc64el cross-compiler target
+#  $ lcitool dockerfile --layers all --cross ppc64le debian-11 qemu
 #
-# This docker target builds on the debian Stretch base image.
-#
-FROM qemu/debian10
+# https://gitlab.com/libvirt/libvirt-ci
+
+FROM docker.io/library/debian:11-slim
 
-# Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture ppc64el && \
-    apt update && \
-    apt install -yy crossbuild-essential-ppc64el
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
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy -a ppc64el --arch-only qemu
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    dpkg --add-architecture ppc64el && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
+    eatmydata apt-get install --no-install-recommends -y \
+            g++-powerpc64le-linux-gnu \
+            gcc-powerpc64le-linux-gnu \
+            libaio-dev:ppc64el \
+            libasan5:ppc64el \
+            libasound2-dev:ppc64el \
+            libattr1-dev:ppc64el \
+            libbpf-dev:ppc64el \
+            libbrlapi-dev:ppc64el \
+            libbz2-dev:ppc64el \
+            libc6-dev:ppc64el \
+            libcacard-dev:ppc64el \
+            libcap-ng-dev:ppc64el \
+            libcapstone-dev:ppc64el \
+            libcurl4-gnutls-dev:ppc64el \
+            libdaxctl-dev:ppc64el \
+            libdrm-dev:ppc64el \
+            libepoxy-dev:ppc64el \
+            libfdt-dev:ppc64el \
+            libffi-dev:ppc64el \
+            libfuse3-dev:ppc64el \
+            libgbm-dev:ppc64el \
+            libgcrypt20-dev:ppc64el \
+            libglib2.0-dev:ppc64el \
+            libglusterfs-dev:ppc64el \
+            libgnutls28-dev:ppc64el \
+            libgtk-3-dev:ppc64el \
+            libibumad-dev:ppc64el \
+            libibverbs-dev:ppc64el \
+            libiscsi-dev:ppc64el \
+            libjemalloc-dev:ppc64el \
+            libjpeg62-turbo-dev:ppc64el \
+            liblttng-ust-dev:ppc64el \
+            liblzo2-dev:ppc64el \
+            libncursesw5-dev:ppc64el \
+            libnfs-dev:ppc64el \
+            libnuma-dev:ppc64el \
+            libpam0g-dev:ppc64el \
+            libpixman-1-dev:ppc64el \
+            libpng-dev:ppc64el \
+            libpulse-dev:ppc64el \
+            librbd-dev:ppc64el \
+            librdmacm-dev:ppc64el \
+            libsasl2-dev:ppc64el \
+            libsdl2-dev:ppc64el \
+            libsdl2-image-dev:ppc64el \
+            libseccomp-dev:ppc64el \
+            libselinux1-dev:ppc64el \
+            libslirp-dev:ppc64el \
+            libsnappy-dev:ppc64el \
+            libspice-server-dev:ppc64el \
+            libssh-gcrypt-dev:ppc64el \
+            libsystemd-dev:ppc64el \
+            libtasn1-6-dev:ppc64el \
+            libubsan1:ppc64el \
+            libudev-dev:ppc64el \
+            liburing-dev:ppc64el \
+            libusb-1.0-0-dev:ppc64el \
+            libusbredirhost-dev:ppc64el \
+            libvdeplug-dev:ppc64el \
+            libvirglrenderer-dev:ppc64el \
+            libvte-2.91-dev:ppc64el \
+            libzstd-dev:ppc64el \
+            nettle-dev:ppc64el \
+            systemtap-sdt-dev:ppc64el \
+            xfslibs-dev:ppc64el \
+            zlib1g-dev:ppc64el && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y && \
+    mkdir -p /usr/local/share/meson/cross && \
+    echo "[binaries]\n\
+c = '/usr/bin/powerpc64le-linux-gnu-gcc'\n\
+ar = '/usr/bin/powerpc64le-linux-gnu-gcc-ar'\n\
+strip = '/usr/bin/powerpc64le-linux-gnu-strip'\n\
+pkgconfig = '/usr/bin/powerpc64le-linux-gnu-pkg-config'\n\
+\n\
+[host_machine]\n\
+system = 'linux'\n\
+cpu_family = 'ppc64'\n\
+cpu = 'powerpc64le'\n\
+endian = 'little'" > /usr/local/share/meson/cross/powerpc64le-linux-gnu && \
+    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-gcc
+
+ENV ABI "powerpc64le-linux-gnu"
+ENV MESON_OPTS "--cross-file=powerpc64le-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=powerpc64le-linux-gnu-
 ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user
-
-# Install extra libraries to increase code coverage
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        libbz2-dev:ppc64el \
-        liblzo2-dev:ppc64el \
-        librdmacm-dev:ppc64el \
-        libsnappy-dev:ppc64el
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 341a07e677..b947bb170d 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -125,6 +125,11 @@ try:
                         trailer=debian_cross_build("mipsel-linux-gnu-",
                                                    "mipsel-softmmu,mipsel-linux-user"))
 
+    generate_dockerfile("debian-ppc64el-cross", "debian-11",
+                        cross="ppc64le",
+                        trailer=debian_cross_build("powerpc64le-linux-gnu-",
+                                                   "ppc64-softmmu,ppc64-linux-user"))
+
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
                         trailer=debian_cross_build("s390x-linux-gnu-",
-- 
2.30.2


