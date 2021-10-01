Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3D41F173
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:46:26 +0200 (CEST)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKjx-00082d-T0
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKY2-0006jP-Vt
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:07 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXo-0007dm-3z
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:06 -0400
Received: by mail-qt1-x832.google.com with SMTP id j13so9316394qtq.6
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eKs5F3DTNeKWBjaCjlRA/nvZMPsiEvhhDz2Zi1xH6yM=;
 b=CWuACNM3ysfACLXK6GZn3do6W6jvDkccNkOjhxjcZ8WAIPKl0wKbteTHKc86lX+TQi
 jPXGK1yz2KpQJzTt060QbhXqFVUMSG3HNGLobr3A9yYbCa/QApJbhvSUIxrWCN1gxAtx
 do3Xrx2zyj/EkMRJ4f98DaqBSstfkAwSyz+YDF++DE1qL15a3MBaQVleydMWNkXqwg9H
 skOrIru+ym1Ch63CmlREjlRFghvC8jrPzNqGWlLpAw7Jk+uAZzrEJqC+h+TgIZuLByBM
 w6XwKtamjxaRBE8lKvSafAOQWhwR5ajqYuYbBqAFvCyQMfDzecmZl1XXUkIkQOn+HBHC
 k00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eKs5F3DTNeKWBjaCjlRA/nvZMPsiEvhhDz2Zi1xH6yM=;
 b=sKmnvkpTNGkTi2TpeqOVH3wqWXiEhly+gFGudUS1U6ukJPIDCTApcIiZaRj4x88xhT
 ph/5g59rD83Lf/HMD3L8wTzXoD17mm888EPU11GJhEwPpwQ/59VJhP+d5b/RISJjnY3L
 MyBFXiL0bZr7LJgi4SIq2m3dnS0tayFSUxfhzJCFYB9a0C7KRapQAG3rlpc14vgN52gf
 Zi4h8iDb++/RWqCIs0kmCOwBsDRWR6LmrwanHxXGtaWmBAzvWJw8Viy2+0d9aIBKNbZS
 9AMt5G0IYw9WxZA+THLlJj2p9tNyegLtuk+ox+96xw0PjguvFHIf8k15Nzk0jlpRYnA+
 Pa9w==
X-Gm-Message-State: AOAM532Ng91LoZ/Il1Omg1VM2B2q/xU8lUsHUPIye0sLZ7rw/Pql+4Dj
 tycsd6AILbnZOzhp/DPkEPic3fZdUxTybg==
X-Google-Smtp-Source: ABdhPJw8UPD44/eVJIMfVNrgVPXVG74e4WMXi5W+XJt50RIEC9THfvk+uIHqPPuamhsJz2mjajFTuw==
X-Received: by 2002:ac8:6683:: with SMTP id d3mr14089339qtp.291.1633102430473; 
 Fri, 01 Oct 2021 08:33:50 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] tests/docker: Add debian-nios2-cross image
Date: Fri,  1 Oct 2021 11:33:37 -0400
Message-Id: <20211001153347.1736014-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/Makefile.include                 | 19 ++++
 .../dockerfiles/debian-nios2-cross.docker     | 34 +++++++
 .../build-toolchain.sh                        | 97 +++++++++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 tests/docker/dockerfiles/debian-nios2-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.docker.d/build-toolchain.sh

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ff5d732889..2ccd93caa4 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -168,10 +168,28 @@ docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.dock
 				qemu/debian-hexagon-cross --add-current-user,		\
 			"PREPARE", "debian-hexagon-cross"))
 
+docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-nios2-cross.docker
+	$(if $(NOCACHE), 								\
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) build -t qemu/debian-nios2-cross -f $< 	\
+			$(if $V,,--quiet) --no-cache 					\
+			--registry $(DOCKER_REGISTRY) --extra-files			\
+			$(DOCKER_FILES_DIR)/debian-nios2-cross.docker.d/build-toolchain.sh, \
+			"BUILD", "debian-nios2-cross"),				        \
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
+				qemu/debian-nios2-cross $(DOCKER_REGISTRY),		\
+			"FETCH", "debian-nios2-cross")				        \
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
+				qemu/debian-nios2-cross --add-current-user,		\
+			"PREPARE", "debian-nios2-cross"))
+
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
+docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
@@ -180,6 +198,7 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
+DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
diff --git a/tests/docker/dockerfiles/debian-nios2-cross.docker b/tests/docker/dockerfiles/debian-nios2-cross.docker
new file mode 100644
index 0000000000..208737fc5e
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-nios2-cross.docker
@@ -0,0 +1,34 @@
+#
+# Docker NIOS2 cross-compiler target
+#
+# This docker target is used for building tests. As it also needs to be
+# able to build QEMU itself in CI we include it's build-deps. It is also
+# a "stand-alone" image so as not to be triggered by re-builds on other
+# base images given it takes a long time to build.
+#
+FROM qemu/debian10
+
+# Install build utilities for building gcc and glibc.
+# ??? The build-dep isn't working, missing a number of
+# minimal build dependiencies, e.g. libmpc.
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        bison \
+        flex \
+        gawk \
+        libmpc-dev \
+        libmpfr-dev \
+        rsync \
+        texinfo \
+        wget \
+        $(apt-get -s build-dep --arch-only gcc | egrep ^Inst | fgrep '[all]' | cut -d\  -f2) \
+        $(apt-get -s build-dep --arch-only glibc | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
+
+ADD build-toolchain.sh /root/build-toolchain.sh
+
+RUN cd /root && ./build-toolchain.sh
+
+ENV PATH $PATH:/usr/local/bin/
diff --git a/tests/docker/dockerfiles/debian-nios2-cross.docker.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-nios2-cross.docker.d/build-toolchain.sh
new file mode 100755
index 0000000000..d8cb428dab
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-nios2-cross.docker.d/build-toolchain.sh
@@ -0,0 +1,97 @@
+#!/bin/bash
+
+set -e
+
+TARGET=nios2-linux-gnu
+LINUX_ARCH=nios2
+
+J=$(expr $(nproc) / 2)
+TOOLCHAIN_INSTALL=/usr/local
+TOOLCHAIN_BIN=${TOOLCHAIN_INSTALL}/bin
+CROSS_SYSROOT=${TOOLCHAIN_INSTALL}/$TARGET/sys-root
+
+export PATH=${TOOLCHAIN_BIN}:$PATH
+
+mkdir cross
+cd cross
+
+#
+# Grab all of the source for the toolchain bootstrap.
+#
+
+wget https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
+wget https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz
+wget https://ftp.gnu.org/gnu/glibc/glibc-2.34.tar.xz
+wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.70.tar.xz
+
+tar axf binutils-2.37.tar.xz
+tar axf gcc-11.2.0.tar.xz
+tar axf glibc-2.34.tar.xz
+tar axf linux-5.10.70.tar.xz
+
+mv binutils-2.37 src-binu
+mv gcc-11.2.0 src-gcc
+mv glibc-2.34 src-glibc
+mv linux-5.10.70 src-linux
+
+mkdir -p bld-hdr bld-binu bld-gcc bld-glibc
+mkdir -p ${CROSS_SYSROOT}/usr/include
+
+#
+# Install kernel and glibc headers
+#
+
+cd src-linux
+make headers_install ARCH=${LINUX_ARCH} INSTALL_HDR_PATH=${CROSS_SYSROOT}/usr
+cd ..
+
+cd bld-hdr
+../src-glibc/configure --prefix=/usr --host=${TARGET}
+make install-headers DESTDIR=${CROSS_SYSROOT}
+touch ${CROSS_SYSROOT}/usr/include/gnu/stubs.h
+cd ..
+
+#
+# Build binutils
+#
+
+cd bld-binu
+../src-binu/configure --disable-werror \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET}
+make -j${J}
+make install
+cd ..
+
+#
+# Build gcc, without shared libraries, because we do not yet
+# have a shared libc against which to link.
+#
+
+cd bld-gcc
+../src-gcc/configure --disable-werror --disable-shared \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET} \
+  --enable-languages=c --disable-libssp --disable-libsanitizer \
+  --disable-libatomic --disable-libgomp --disable-libquadmath
+make -j${J}
+make install
+cd ..
+
+#
+# Build glibc
+# There are a few random things that use c++ but we didn't build that
+# cross-compiler.  We can get away without them.  Disable CXX so that
+# glibc doesn't try to use the host c++ compiler.
+#
+
+cd bld-glibc
+CXX=false ../src-glibc/configure --prefix=/usr --host=${TARGET}
+make -j${j}
+make install DESTDIR=${CROSS_SYSROOT}
+cd ..
+
+#
+# Clean up
+#
+
+cd ..
+rm -rf cross build-toolchain.sh
-- 
2.25.1


