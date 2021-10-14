Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6084B42E469
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:49:20 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9XL-00020X-GS
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Su-0002qX-Li
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:44 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Ss-0004Kj-B6
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:44 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c29so6748764pfp.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+KG/M2KkUzEvhFsL14D3+0KpP2ynUjE4kg8Sktouks=;
 b=Z3jAlijlsmpcZE2w/pKk//+TB7QCmRBbGAfrAPn4ZCqh632zZLxErq/D1SjqhQYFBb
 x7i4/Y/J/6nrafeiChN87/Bvmr7zJaXbe2l0Zhtmk3+AWOd72a4UHWF8418gvAfvHc0A
 HLmtBKyEg8mhr55v5DRlE4r0IEl8wGcGDfoeWUcZrg+IvrjkXwH7uQ4OGEnLsc8OEy8t
 ve8M5gValYEZsCJceBBuQiDgeWCE/zbU+0quYeZexQd0MKLJT+Bkgsg8hdv2BaBizwdX
 jUeHsgB5fE5cKCjj5e5JZhEbKOL2U3wtuQurMFkoPq7SX3WZspHs6aqAmv80/ktlH9R6
 pDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+KG/M2KkUzEvhFsL14D3+0KpP2ynUjE4kg8Sktouks=;
 b=ccPdurdVJlDvGwlgCX5K8P9mKTij5o9a3ho5amC8qcgXk2W6Ny9lAM1oT8o3r4da7G
 yK/CyhbbODFMWX3XBSxaGdd66l3BJwt2+eA84n5Hwq+LHl9lmHz86zdrg70JVRqZJJMz
 fxpVmttON29oSjVpvkcRgswdIsBxxt1IA8K+Fq2ipE7xyalkGK5ln8bOYFdFiPXneflE
 TLqjlS1ABYsuyZhgTx96YkxpOh1C/rpE7nhVH7WHgYhetWfr2TYqRdcC+omsJ1h70ohl
 jKH6iznDSOMuy1otg1Gk7md6Z9KuNbwHEXpayQ1c5YyVAr/APeW1+Y41b6HxmCQOf9+p
 0+Xg==
X-Gm-Message-State: AOAM530lnbCx4d4rmt7HlTWn1byVmSjzVeNOswN5an9YFZ2KD/P+i0hg
 Q1lc54q8iV+xOCHhfxXrXrXcWQya8zpgQg==
X-Google-Smtp-Source: ABdhPJyzPvusIQtSAfnfrSywmvbdcDNmH9cQoRZmHR+s8iQigBvoGKiqKGgyeneUxcWgaRXTIwUUTQ==
X-Received: by 2002:aa7:80d1:0:b029:399:ce3a:d617 with SMTP id
 a17-20020aa780d10000b0290399ce3ad617mr8105382pfn.16.1634251480913; 
 Thu, 14 Oct 2021 15:44:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] tests/docker: Update debian-hexagon-cross to a newer
 toolchain
Date: Thu, 14 Oct 2021 15:44:31 -0700
Message-Id: <20211014224435.2539547-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014224435.2539547-1-richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brian Cain <brian.cain@gmail.com>, alex.bennee@linaro.org,
 Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brian Cain <brian.cain@gmail.com>

The new dockerfile uses a complete toolchain built by CodeLinaro.
Remove the special casing that was necessary when the dockerfile
built the toolchain from source.

Suggested-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/Makefile.include                 |  24 +--
 .../dockerfiles/debian-hexagon-cross.docker   |  45 +-----
 .../build-toolchain.sh                        | 141 ------------------
 3 files changed, 9 insertions(+), 201 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh

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
+        curl \
+        xz-utils
 
-ENV TOOLCHAIN_INSTALL /usr/local
-ENV ROOTFS /usr/local
+RUN curl -#SL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/v2021.09.10/clang+llvm-Sept-2021-cross-hexagon-unknown-linux-musl.tar.xz \
+  | tar -xJC /opt
 
-ENV LLVM_URL https://github.com/llvm/llvm-project/archive/bfcd21876adc3498065e4da92799f613e730d475.tar.gz
-ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3691905aa1af6c0778c.tar.gz
-ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.tar.xz
-
-ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
-
-RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
-
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
2.25.1


