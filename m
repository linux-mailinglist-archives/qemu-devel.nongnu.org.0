Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BCA43B00F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:32:22 +0200 (CEST)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJkj-00066a-E4
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbZ-0000wr-MG
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbQ-0007Pt-4D
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b82-20020a1c8055000000b0032ccc728d63so355308wmd.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iByIIAISngwwr4+RyxI8s9n0gUVPPkaN8MixOVXxCXM=;
 b=uxBoSLxt8i/WFneUYytm1WBv2MJDXOZSyaF7ckLpYWnp3RK+OdbJhw9Psh6+ERKzcx
 YI7OSmS6Xrvif2gl3GLJcji1Y6peh3aolT1B8FEY+ww5CFQoH/4+f3sxWaz6kcma25pk
 oFGl0uZqmg1GT+eP44vkF4sQNC69C/MZn2rtIFoyH4wS4JawVLAQ/p7Ju1Q1WRIVSPmk
 xH6cOxlr0urm/CMw7655J+x/fvEORC4sneEqSfOVyxSoffewSDZkk5rIpNO6x/hwATRk
 zX3wm5hiLk0gn5d6b9XmLyB+6XJpZ7z/h2rAlDS97oXEMjmxee4+jd8uynNzNt4FbdlI
 6kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iByIIAISngwwr4+RyxI8s9n0gUVPPkaN8MixOVXxCXM=;
 b=di90Lu8tMqONNYetjPmLM98RCh9QpvlmyuB7CFY6dojfs+qilyT9KGJq7J5OoiMrbu
 GziLxH0c7bqDughJziEhL4YYNu6SRgCa4MHf8LsxbHhRXj6PWHJcaMXQ4d1S1vyPi7ZT
 cFnP5WqraB0UrsCc8vHkHXbQMPIi+IJFUCCFPRmyaOOcEtjsz5/CwB8Ubj3NkkuA4HF3
 u5iPexQptNdsd8HEPGnH8x0xrhKiROZqnt5t4dRnfpu0lM7njU0NagEPaP2Zrcy4KXV7
 m5rkhOT1H2lOl2JqyPAaBbT73rb/kY3owXaYRdUCuvHl1wNCTj/lBGB67W93155L0dSY
 j+fg==
X-Gm-Message-State: AOAM531tlGj6jTxqWprvtcop2ahB6zXzxGx7uoAtQWcITsqFNANhMkhz
 lGmxAxu9zvDgbPEB7YQbVCYcsQ==
X-Google-Smtp-Source: ABdhPJy+JVmnm/PoVlnBOVu1P9Qw2t3ts579RZL1xZezzgQgBs2cZYHKVA2JwzoLXuBXKyN5i9GDRQ==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr9565753wml.178.1635243762379; 
 Tue, 26 Oct 2021 03:22:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm173626wmj.22.2021.10.26.03.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0AA9D1FF9A;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/28] tests/docker: Update debian-hexagon-cross to a newer
 toolchain
Date: Tue, 26 Oct 2021 11:22:09 +0100
Message-Id: <20211026102234.3961636-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Brian Cain <brian.cain@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brian Cain <brian.cain@gmail.com>

The new dockerfile uses a complete toolchain built by CodeLinaro.
Remove the special casing that was necessary when the dockerfile
built the toolchain from source.

Suggested-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[AJB: fix MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-4-richard.henderson@linaro.org>

squash! tests/docker: Update debian-hexagon-cross to a newer toolchain
---
 MAINTAINERS                                   |   1 -
 tests/docker/Makefile.include                 |  24 +--
 .../dockerfiles/debian-hexagon-cross.docker   |  45 +-----
 .../build-toolchain.sh                        | 141 ------------------
 4 files changed, 9 insertions(+), 202 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc43105..5423ae0cd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -199,7 +199,6 @@ F: tests/tcg/hexagon/
 F: disas/hexagon.c
 F: configs/targets/hexagon-linux-user/default.mak
 F: docker/dockerfiles/debian-hexagon-cross.docker
-F: docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
 HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index b9d4094c2e..d223100dff 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -148,33 +148,11 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
-
-#
-# The build rule for hexagon-cross is special in so far for most of
-# the time we don't want to build it. While dockers caching does avoid
-# this most of the time sometimes we want to force the issue.
-#
-docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker
-	$(if $(NOCACHE), 								\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) build -t qemu/debian-hexagon-cross -f $< 	\
-			$(if $V,,--quiet) --no-cache 					\
-			--registry $(DOCKER_REGISTRY) --extra-files			\
-			$(DOCKER_FILES_DIR)/debian-hexagon-cross.docker.d/build-toolchain.sh, \
-			"BUILD", "debian-hexagon-cross"),				\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
-				qemu/debian-hexagon-cross $(DOCKER_REGISTRY),		\
-			"FETCH", "debian-hexagon-cross")				\
-		$(call quiet-command,							\
-			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
-				qemu/debian-hexagon-cross --add-current-user,		\
-			"PREPARE", "debian-hexagon-cross"))
-
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
+docker-image-debian-hexagon-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index d5dc299dc1..f3d7110814 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -1,45 +1,16 @@
 #
 # Docker Hexagon cross-compiler target
 #
-# This docker target is used for building hexagon tests. As it also
-# needs to be able to build QEMU itself in CI we include it's
-# build-deps. It is also a "stand-alone" image so as not to be
-# triggered by re-builds on other base images given it takes a long
-# time to build.
-#
 FROM qemu/debian10
 
-# Install common build utilities
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
-        bison \
-        cmake \
-        flex \
-        lld \
-        rsync \
-        wget
-
-ENV TOOLCHAIN_INSTALL /usr/local
-ENV ROOTFS /usr/local
-
-ENV LLVM_URL https://github.com/llvm/llvm-project/archive/bfcd21876adc3498065e4da92799f613e730d475.tar.gz
-ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3691905aa1af6c0778c.tar.gz
-ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.tar.xz
-
-ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
+        curl \
+        xz-utils
 
-RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
+RUN curl -#SL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/v2021.09.10/clang+llvm-Sept-2021-cross-hexagon-unknown-linux-musl.tar.xz \
+  | tar -xJC /opt
 
-FROM debian:buster-slim
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
-# Install QEMU build deps for use in CI
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy git ninja-build && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy --arch-only qemu
-COPY --from=0 /usr/local /usr/local
-ENV PATH $PATH:/usr/local/bin/
+ENV PATH $PATH:/opt/clang+llvm-Sept-2021-cross-hexagon-unknown-linux-musl/x86_64-linux-gnu/bin
+ENV DEF_TARGET_LIST hexagon-linux-user
+ENV QEMU_CONFIGURE_OPTS --disable-docs --disable-tools --cross-cc-hexagon=hexagon-unknown-linux-musl-clang
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
deleted file mode 100755
index 19b1c9f83e..0000000000
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
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
-- 
2.30.2


