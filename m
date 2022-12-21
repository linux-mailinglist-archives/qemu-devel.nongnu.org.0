Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6B652D65
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tku-00074K-Dy; Wed, 21 Dec 2022 02:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkj-00070S-Uf
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:43:02 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkg-000496-53
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:43:01 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i7so14039433wrv.8
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSgcOKzfMlu/kSupvx1vHgH6RK/e2Urq97zQ5/WEL0k=;
 b=s0GxdbiJCN6+iCxu8FJQpR44vxKKpk+TuYBz17TaaZp+DJsc/lPB94fbqvZ/ioz7yp
 /xdn1/nAMhl1cE8oEkwW2Dep7hHAJTluT6hRWldt5F6pj4ichHUbJBYcOiVIBKTFkV5m
 tuifC0y2BBh7B6TPgq+awxLSAOWpepEpPOxOwegVAZ0ifS3v5eoPZhqXBk72c57CAEi4
 LrPwUUUePz8AFfv9us/7McV1RrsQcQSOMxLf2vOux6Hd2wTQWeVV/uzDwqWxec+Oehf5
 cYc4l8p1iQjZVHE/pbJ0QlCXeBV3vjyeLiMZvWWFcv1WxgYZnYxQ40ekDmcDZT1Sj0qe
 psMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jSgcOKzfMlu/kSupvx1vHgH6RK/e2Urq97zQ5/WEL0k=;
 b=uZ9IxDLbl75HRG2x1Kg6T3i8J1pr0ySmhSuCUCQiUCCCHfkTBDvmz4oTOGItLeDk2T
 2/YwolWjRFickXnX2aE8Tlvmm68DMuLjVelCyN8nqcBtcfFB61r0WcDPVjomF7chnAs/
 qV2+3Tk1WjQg8PEmYTKjm9S8k2C5CUqpq2/ze7dJZ8bpytWNKKy94HbV0w97ulBVHjlc
 40v723vhWDYnIRqW2GSA8CxG/JLDKXs7RllZQ2Rdugvf61WVeKn9ADr7FcHTSy5P63Du
 UPMKvj7qZxCgI9VjKbAXawADVSsJth/sZ9C3KmsItFyw5TiN9YsxRTCeTW4gU6sMz+Ku
 KNKA==
X-Gm-Message-State: AFqh2koNgFB++3bjn9zbl0KKBa72j0cZ3u6An1oMq1PU0tpWnJ/2IEis
 GiIpBcQPc6WoYbYkTQrzZbBADQ==
X-Google-Smtp-Source: AMrXdXtDmiJLOtva4Z1A8eRsM/CgLRyI8IEv3eD6g8V8vAMFiEz3P7ZNMMVYMkVeQYq4PC/i86x5+g==
X-Received: by 2002:adf:fa0d:0:b0:242:661b:a20 with SMTP id
 m13-20020adffa0d000000b00242661b0a20mr463616wrr.20.1671608576594; 
 Tue, 20 Dec 2022 23:42:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d5611000000b002424b695f7esm14477723wrv.46.2022.12.20.23.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:42:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2F1D1FFBD;
 Wed, 21 Dec 2022 07:42:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [[PATCH]--edit 5/6] tests/docker: use prebuilt toolchain for
 debian-hexagon-cross
Date: Wed, 21 Dec 2022 07:42:51 +0000
Message-Id: <20221221074252.1962896-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221074252.1962896-1-alex.bennee@linaro.org>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>

The current docker image for cross compiling hexagon guests
is manually built since it takes >2 hours to build from source.

This patch:
 1. Solves the above issue by using the prebuilt clang
    toolchain hosted on CodeLinaro [1] and maintained by QUIC [2].
 2. The dockerfile is also switched from multi-stage to single stage
    build to allow the CI docker engine to reuse the layer cache.
 3. Re-enables the hexagon-cross-container job to be always run in
    CI and makes it a non-optional dependency for the
    build-user-hexagon job.

The changes for 1 & 2 together bring down the build time to
~3 minutes in GitLab CI when cache is reused and ~9 minutes
when cache cannot be reused.

[1]: https://github.com/CodeLinaro/hexagon-builder
[2]: https://github.com/quic/toolchain_for_hexagon/releases/

Based-on: <20221215095820.13374-1-quic._5Fmthiyaga@quicinc.com>
 tests/tcg/multiarch: remove unused variable in linux-test
Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
[AJB: also tweak MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221219144354.11659-1-quic_mthiyaga@quicinc.com>
---
 .gitlab-ci.d/buildtest.yml                    |   4 -
 .gitlab-ci.d/container-cross.yml              |  19 +--
 MAINTAINERS                                   |   1 -
 tests/docker/Makefile.include                 |   4 -
 .../debian-hexagon-cross.d/build-toolchain.sh | 141 ------------------
 .../dockerfiles/debian-hexagon-cross.docker   |  53 +++----
 6 files changed, 20 insertions(+), 202 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d21b4a1fd4..93302a96e2 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -275,14 +275,10 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
-# Because the hexagon cross-compiler takes so long to build we don't rely
-# on the CI system to build it and hence this job has an optional dependency
-# declared. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
   needs:
     job: hexagon-cross-container
-    optional: true
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 2d560e9764..5486dc43c6 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -37,28 +37,11 @@ armhf-debian-cross-container:
 # We never want to build hexagon in the CI system and by default we
 # always want to refer to the master registry where it lives.
 hexagon-cross-container:
-  extends: .base_job_template
-  image: docker:stable
+  extends: .container_job_template
   stage: containers
   variables:
     NAME: debian-hexagon-cross
-    GIT_DEPTH: 1
     QEMU_JOB_ONLY_FORKS: 1
-  services:
-    - docker:dind
-  before_script:
-    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
-  script:
-    - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
-    - docker pull $COMMON_TAG
-    - docker tag $COMMON_TAG $TAG
-    - docker push "$TAG"
-  after_script:
-    - docker logout
 
 hppa-debian-cross-container:
   extends: .container_job_template
diff --git a/MAINTAINERS b/MAINTAINERS
index 716d5a24ad..005a2d3ed2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -204,7 +204,6 @@ F: tests/tcg/hexagon/
 F: disas/hexagon.c
 F: configs/targets/hexagon-linux-user/default.mak
 F: docker/dockerfiles/debian-hexagon-cross.docker
-F: docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
 Hexagon idef-parser
 M: Alessandro Di Federico <ale@rev.ng>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fc7a3b7e71..665ddde518 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -109,10 +109,6 @@ debian-toolchain-run = \
 			"PREPARE", $1))
 debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
 
-docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker \
-	$(DOCKER_FILES_DIR)/debian-hexagon-cross.d/build-toolchain.sh
-	$(call debian-toolchain, $@)
-
 docker-image-debian-microblaze-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-microblaze-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
deleted file mode 100755
index 19b1c9f83e..0000000000
--- a/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
+++ /dev/null
@@ -1,141 +0,0 @@
-#!/bin/bash
-
-set -e
-
-BASE=$(readlink -f ${PWD})
-
-TOOLCHAIN_INSTALL=$(readlink -f "$TOOLCHAIN_INSTALL")
-ROOTFS=$(readlink -f "$ROOTFS")
-
-TOOLCHAIN_BIN=${TOOLCHAIN_INSTALL}/bin
-HEX_SYSROOT=${TOOLCHAIN_INSTALL}/hexagon-unknown-linux-musl
-HEX_TOOLS_TARGET_BASE=${HEX_SYSROOT}/usr
-
-function cdp() {
-  DIR="$1"
-  mkdir -p "$DIR"
-  cd "$DIR"
-}
-
-function fetch() {
-  DIR="$1"
-  URL="$2"
-  TEMP="$(readlink -f "$PWD/tmp.tar.gz")"
-  wget --quiet "$URL" -O "$TEMP"
-  cdp "$DIR"
-  tar xaf "$TEMP" --strip-components=1
-  rm "$TEMP"
-  cd -
-}
-
-build_llvm_clang() {
-  fetch "$BASE/llvm-project" "$LLVM_URL"
-  cdp "$BASE/build-llvm"
-
-  cmake -G Ninja \
-    -DCMAKE_BUILD_TYPE=Release \
-    -DCMAKE_INSTALL_PREFIX=${TOOLCHAIN_INSTALL} \
-    -DLLVM_ENABLE_LLD=ON \
-    -DLLVM_TARGETS_TO_BUILD="Hexagon" \
-    -DLLVM_ENABLE_PROJECTS="clang;lld" \
-    "$BASE/llvm-project/llvm"
-  ninja all install
-  cd ${TOOLCHAIN_BIN}
-  ln -sf clang hexagon-unknown-linux-musl-clang
-  ln -sf clang++ hexagon-unknown-linux-musl-clang++
-  ln -sf llvm-ar hexagon-unknown-linux-musl-ar
-  ln -sf llvm-objdump hexagon-unknown-linux-musl-objdump
-  ln -sf llvm-objcopy hexagon-unknown-linux-musl-objcopy
-  ln -sf llvm-readelf hexagon-unknown-linux-musl-readelf
-  ln -sf llvm-ranlib hexagon-unknown-linux-musl-ranlib
-
-  # workaround for now:
-  cat <<EOF > hexagon-unknown-linux-musl.cfg
--G0 --sysroot=${HEX_SYSROOT}
-EOF
-}
-
-build_clang_rt() {
-  cdp "$BASE/build-clang_rt"
-  cmake -G Ninja \
-    -DCMAKE_BUILD_TYPE=Release \
-    -DLLVM_CONFIG_PATH="$BASE/build-llvm/bin/llvm-config" \
-    -DCMAKE_ASM_FLAGS="-G0 -mlong-calls -fno-pic --target=hexagon-unknown-linux-musl " \
-    -DCMAKE_SYSTEM_NAME=Linux \
-    -DCMAKE_C_COMPILER="${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang" \
-    -DCMAKE_ASM_COMPILER="${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang" \
-    -DCMAKE_INSTALL_PREFIX=${HEX_TOOLS_TARGET_BASE} \
-    -DCMAKE_CROSSCOMPILING=ON \
-    -DCMAKE_C_COMPILER_FORCED=ON \
-    -DCMAKE_CXX_COMPILER_FORCED=ON \
-    -DCOMPILER_RT_BUILD_BUILTINS=ON \
-    -DCOMPILER_RT_BUILTINS_ENABLE_PIC=OFF \
-    -DCMAKE_SIZEOF_VOID_P=4 \
-    -DCOMPILER_RT_OS_DIR= \
-    -DCAN_TARGET_hexagon=1 \
-    -DCAN_TARGET_x86_64=0 \
-    -DCOMPILER_RT_SUPPORTED_ARCH=hexagon \
-    -DLLVM_ENABLE_PROJECTS="compiler-rt" \
-    "$BASE/llvm-project/compiler-rt"
-  ninja install-compiler-rt
-}
-
-build_musl_headers() {
-  fetch "$BASE/musl" "$MUSL_URL"
-  cd "$BASE/musl"
-  make clean
-  CC=${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
-    CROSS_COMPILE=hexagon-unknown-linux-musl \
-    LIBCC=${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
-    CROSS_CFLAGS="-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --target=hexagon-unknown-linux-musl" \
-    ./configure --target=hexagon --prefix=${HEX_TOOLS_TARGET_BASE}
-  PATH=${TOOLCHAIN_BIN}:$PATH make CROSS_COMPILE= install-headers
-
-  cd ${HEX_SYSROOT}/..
-  ln -sf hexagon-unknown-linux-musl hexagon
-}
-
-build_kernel_headers() {
-  fetch "$BASE/linux" "$LINUX_URL"
-  mkdir -p "$BASE/build-linux"
-  cd "$BASE/linux"
-  make O=../build-linux ARCH=hexagon \
-   KBUILD_CFLAGS_KERNEL="-mlong-calls" \
-   CC=${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
-   LD=${TOOLCHAIN_BIN}/ld.lld \
-   KBUILD_VERBOSE=1 comet_defconfig
-  make mrproper
-
-  cd "$BASE/build-linux"
-  make \
-    ARCH=hexagon \
-    CC=${TOOLCHAIN_BIN}/clang \
-    INSTALL_HDR_PATH=${HEX_TOOLS_TARGET_BASE} \
-    V=1 \
-    headers_install
-}
-
-build_musl() {
-  cd "$BASE/musl"
-  make clean
-  CROSS_COMPILE=hexagon-unknown-linux-musl- \
-    AR=llvm-ar \
-    RANLIB=llvm-ranlib \
-    STRIP=llvm-strip \
-    CC=clang \
-    LIBCC=${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
-    CFLAGS="-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --target=hexagon-unknown-linux-musl" \
-    ./configure --target=hexagon --prefix=${HEX_TOOLS_TARGET_BASE}
-  PATH=${TOOLCHAIN_BIN}/:$PATH make CROSS_COMPILE= install
-  cd ${HEX_TOOLS_TARGET_BASE}/lib
-  ln -sf libc.so ld-musl-hexagon.so
-  ln -sf ld-musl-hexagon.so ld-musl-hexagon.so.1
-  cdp ${HEX_TOOLS_TARGET_BASE}/../lib
-  ln -sf ../usr/lib/ld-musl-hexagon.so.1
-}
-
-build_llvm_clang
-build_kernel_headers
-build_musl_headers
-build_clang_rt
-build_musl
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index c4238e893f..8a0d748343 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -7,44 +7,29 @@
 #
 FROM docker.io/library/debian:11-slim
 
-# Install common build utilities
-RUN apt update && \
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        bison \
+# Install common build utilities
+    apt-get install -y --no-install-recommends \
+        curl \
+        xz-utils \
         ca-certificates \
-        clang \
-        cmake \
+        bison \
         flex \
-        gcc \
-        lld \
-        make \
-        ninja-build \
-        python3 \
-        rsync \
-        wget \
-        xz-utils
-
-ENV TOOLCHAIN_INSTALL /usr/local
-ENV ROOTFS /usr/local
-
-ENV LLVM_URL https://github.com/llvm/llvm-project/archive/bfcd21876adc3498065e4da92799f613e730d475.tar.gz
-ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3691905aa1af6c0778c.tar.gz
-ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.tar.xz
-
-ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
-
-RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
-
-FROM docker.io/library/debian:11-slim
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+        git \
+        ninja-build && \
 # Install QEMU build deps for use in CI
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy bison flex git ninja-build && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
-COPY --from=0 /usr/local /usr/local
-ENV PATH $PATH:/usr/local/bin/
+
+
+ENV TOOLCHAIN_INSTALL /opt
+ENV TOOLCHAIN_RELEASE 15.0.3
+ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl"
+ENV TOOLCHAIN_URL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/v${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
+
+RUN curl -#SL "$TOOLCHAIN_URL" | tar -xJC "$TOOLCHAIN_INSTALL"
+ENV PATH $PATH:${TOOLCHAIN_INSTALL}/${TOOLCHAIN_BASENAME}/x86_64-linux-gnu/bin
-- 
2.34.1


