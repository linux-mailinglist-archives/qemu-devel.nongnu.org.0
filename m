Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF642E46A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:49:50 +0200 (CEST)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9Xp-0002VN-LY
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sy-00030s-SA
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:48 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb9Sw-0004Ot-KS
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:44:48 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e65so4447432pgc.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9iF0kLWrrnXeaVvtPHxPaSy5Nma/QdJ8c+3ZFjg58o=;
 b=G+Juvk+nw8RL9mGzK+rPc/bMHU3PShfY4iMMayzIOIw2KA6mXi+0u8sPpGRM2UYioQ
 jASDt4ShcZs8lQIkWGa0ofQTJ6dHvKjPiVAIOYTy8RI1cFyo0WirFtNQub9y8vBowYHO
 j7Q7MsrPoCHEkKrUkh8pwHR2V8rmOK+uwU3XMtGKJ17CL9TK6leKj62GYZlx1/TxrpVZ
 MAp5UmlNe9GUjYLOq/O2jBMXzQJjbYR0udU27AFYR6TlSUIB2oqjLEvpJDMVmNpOyzCs
 ebwBDyi8RjKg5/c1/AqbN+Mh5OVNIvn4z6YrIQvbQNbz3zgZX/Fm/gIX/cxnhT40kjF7
 S6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9iF0kLWrrnXeaVvtPHxPaSy5Nma/QdJ8c+3ZFjg58o=;
 b=5BBsRnI3BFWiBuuE6RrBkw7Sr5sWrLfxAa13z6ZlJ3mExGcabqA3XLoputfkGguVCL
 B5/IdkoT2dOKrvM+h2uM2PNgg71RqbtmIj9b+RJk2HMObMQUTlZcwUd/yMvU5OAuYy4s
 YvEN6Br9qebi6ybp3GM5zYUpEK8471gYGbfUDOAuT7S/rw6C3t/kN9nL+MEPlrHyxG6q
 7gPi1jPpItRmUyYO21faWYXi/y/rUTg1cY1xrQPGIf8xy+1kLSz8DbgLRm4CSV/9sIHX
 Hf32f6yqDC2o3HTHt3FxgW4AtWhbdzng0J3Yjr3Rc3qe6Qf33jsdm7g3ayVDvdagYC1P
 g6GA==
X-Gm-Message-State: AOAM530us7Lo5nTi3GXoNZ0W+dwTWxrP7tGotqQyW+GcQg92LYTRujL5
 D2S1iMbEPUkZ6eMIFiCi5vZA8UbAjkYpSQ==
X-Google-Smtp-Source: ABdhPJwIR33ZxOVL0Djla9m3yBVApbvQLOeHKR4s4B+n5a1uVZdIM4kbs0wqbTrKbacCsNBn6qmq3Q==
X-Received: by 2002:a05:6a00:8c7:b0:44c:a7f9:d8d1 with SMTP id
 s7-20020a056a0008c700b0044ca7f9d8d1mr8107355pfu.49.1634251485243; 
 Thu, 14 Oct 2021 15:44:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm9506208pjs.21.2021.10.14.15.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:44:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] tests/docker: Add debian-microblaze-cross image
Date: Thu, 14 Oct 2021 15:44:34 -0700
Message-Id: <20211014224435.2539547-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014224435.2539547-1-richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/Makefile.include                 |  6 ++
 .../build-toolchain.sh                        | 88 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 772e0968aa..3594290b7f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -166,6 +166,10 @@ debian-toolchain-run = \
 			"PREPARE", $1))
 debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
 
+docker-image-debian-microblaze-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
+    $(DOCKER_FILES_DIR)/debian-microblaze-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+
 docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
@@ -175,6 +179,7 @@ docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
 docker-image-debian-hexagon-cross: docker-image-debian10
+docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 
@@ -184,6 +189,7 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
+DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
diff --git a/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
new file mode 100755
index 0000000000..23ec0aa9a7
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
@@ -0,0 +1,88 @@
+#!/bin/bash
+
+set -e
+
+TARGET=microblaze-linux-musl
+LINUX_ARCH=microblaze
+
+J=$(expr $(nproc) / 2)
+TOOLCHAIN_INSTALL=/usr/local
+TOOLCHAIN_BIN=${TOOLCHAIN_INSTALL}/bin
+CROSS_SYSROOT=${TOOLCHAIN_INSTALL}/$TARGET/sys-root
+
+export PATH=${TOOLCHAIN_BIN}:$PATH
+
+#
+# Grab all of the source for the toolchain bootstrap.
+#
+
+wget https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
+wget https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz
+wget https://www.musl-libc.org/releases/musl-1.2.2.tar.gz
+wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.70.tar.xz
+
+tar axf binutils-2.37.tar.xz
+tar axf gcc-11.2.0.tar.xz
+tar axf musl-1.2.2.tar.gz
+tar axf linux-5.10.70.tar.xz
+
+mv binutils-2.37 src-binu
+mv gcc-11.2.0 src-gcc
+mv musl-1.2.2 src-musl
+mv linux-5.10.70 src-linux
+
+mkdir -p bld-hdr bld-binu bld-gcc bld-musl
+mkdir -p ${CROSS_SYSROOT}/usr/include
+
+#
+# Install kernel headers
+#
+
+cd src-linux
+make headers_install ARCH=${LINUX_ARCH} INSTALL_HDR_PATH=${CROSS_SYSROOT}/usr
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
+# Build gcc, just the compiler so far.
+#
+
+cd bld-gcc
+../src-gcc/configure --disable-werror --disable-shared \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET} \
+  --enable-languages=c --disable-libssp --disable-libsanitizer \
+  --disable-libatomic --disable-libgomp --disable-libquadmath
+make -j${J} all-gcc
+make install-gcc
+cd ..
+
+#
+# Build musl.
+# We won't go through the extra step of building shared libraries
+# because we don't actually use them in QEMU docker testing.
+#
+
+cd bld-musl
+../src-musl/configure --prefix=/usr --host=${TARGET} --disable-shared
+make -j${j}
+make install DESTDIR=${CROSS_SYSROOT}
+cd ..
+
+#
+# Go back and build the compiler runtime
+#
+
+cd bld-gcc
+make -j${j}
+make install
+cd ..
-- 
2.25.1


