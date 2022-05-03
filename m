Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE4D518FD9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:17:03 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlztG-0001AZ-Rs
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZt-0000hU-FU
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZr-0006Nr-Ab
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:56 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 15so14810581pgf.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PoRUGz2szMDJicl6LiDwHi+o01/ArFupEpZx2x6+ISI=;
 b=UWXG/xvTRELgCqD7Gj4fW+QmJxBn2ZB/mOEaOoejrI1RBqJp67tXD/jrzjpW1MTtdW
 KjWko7slI/iP/Wg633Aez2qxKzeRUVUpEbzG5IEl08F0TnqAmlJV5GgFe5hMyaSN8t5S
 J5CkstPWLUeSLJL79fky1Y+JguYSk5/R2AsEHIFlZ4Rl/1uFw42ft/Yjism0c72GEq7m
 jwi7p3o4hRQRiepmKZdnbo+GBWIkECfNI4vr8Y/iB4DsvBgkGHPghM2HHK3uBycFMDk6
 moHeibuFGpXdzmQsDiAmtAabxu/f4HcZ8u0pevB6RpQcBcP7XkCmm3kPfEdQLzOl/oEX
 soyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PoRUGz2szMDJicl6LiDwHi+o01/ArFupEpZx2x6+ISI=;
 b=4EdLsIe4GkLPCsWEfSsYl3Ein1IbzaH3R71GLb7yh42M2Jq4nlLH/iJC8LDMJ6sLY/
 MVqf0vTum9b+R6ACW0zED9pI9HBjQJZ2TLb12u5+0+ji19rH5ycsJOLO1irisInpJHUd
 AfptcW4MXJ2ZD0uo2b3FbjC0E9sTJHgzmYx4vwKM4/rMreEVqC0106gvyDFthcnjG686
 6Ts5AY3IuYiusVcvQG1Ecw/78Fux+YRQ4AxxWwDriODsbEh+GKYjoOtF+vka+eccDQ7D
 OIoqteVURhSq0ROxDBbPXAECYt6nCZ5bUa1gmVzXcWy/GP5uToVrUu4SW80myBxvd0N5
 UmKg==
X-Gm-Message-State: AOAM533LcRxR96qplncoM65qAUgUPwnWZR/fNHNI/0U++JUs8Q1ESWEE
 hVmE0pK5B5+qfL27J/DE4znp1k94ZU6MpA==
X-Google-Smtp-Source: ABdhPJxtBnI6SPcYQH6TjrJbVPkOhuaqWpl/WjLOH3E/euSL+L4/BlMmVbi/IOiWxTEEOBzmwi+egQ==
X-Received: by 2002:a63:fa41:0:b0:3c2:1941:5894 with SMTP id
 g1-20020a63fa41000000b003c219415894mr9272333pgk.296.1651607573045; 
 Tue, 03 May 2022 12:52:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 67/74] tests/docker: Add debian-rx-cross image
Date: Tue,  3 May 2022 12:48:36 -0700
Message-Id: <20220503194843.1379101-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                                   |  1 +
 tests/docker/Makefile.include                 |  6 ++
 .../debian-rx-cross.d/build-toolchain.sh      | 58 +++++++++++++++++++
 tests/tcg/configure.sh                        |  6 ++
 4 files changed, 71 insertions(+)
 create mode 100755 tests/docker/dockerfiles/debian-rx-cross.d/build-toolchain.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 294c88ace9..62d2640f35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -297,6 +297,7 @@ RENESAS RX CPUs
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
 S: Orphan
 F: target/rx/
+F: tests/docker/dockerfiles/debian-rx-cross.d/build-toolchain.sh
 
 S390 TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ca2157db46..1795a49da2 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -142,6 +142,10 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
 
+docker-image-debian-rx-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
+    $(DOCKER_FILES_DIR)/debian-rx-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
@@ -149,6 +153,7 @@ docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 docker-image-debian-riscv64-test-cross: docker-image-debian11
+docker-image-debian-rx-cross: docker-image-debian10
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
@@ -158,6 +163,7 @@ DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
+DOCKER_PARTIAL_IMAGES += debian-rx-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-rx-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-rx-cross.d/build-toolchain.sh
new file mode 100755
index 0000000000..0d22280dee
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-rx-cross.d/build-toolchain.sh
@@ -0,0 +1,58 @@
+#!/bin/bash
+
+set -e
+
+TARGET=rx-elf
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
+
+tar axf binutils-2.37.tar.xz
+tar axf gcc-11.2.0.tar.xz
+
+git clone --depth 1 --branch newlib-4.1.0 \
+  https://sourceware.org/git/newlib-cygwin.git newlib-4.1.0
+
+# Create a combined gcc/newlib source tree
+
+mkdir -p src/include
+cd src
+ln -s ../gcc*/* . || true
+ln -s ../newlib*/* . || true
+cd include
+ln -s ../../gcc*/include/* . || true
+ln -s ../../newlib*/include/* . || true
+cd ../../
+
+# Build binutils
+
+mkdir -p bld-b
+cd bld-b
+../binu*/configure --disable-werror \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET}
+make -j${J}
+make install
+cd ..
+
+# Build gcc+newlib
+
+mkdir -p bld
+cd bld
+../src/configure --disable-werror --disable-shared \
+  --prefix=${TOOLCHAIN_INSTALL} --with-sysroot --target=${TARGET} \
+  --enable-languages=c --disable-libssp --disable-libsanitizer \
+  --disable-libatomic --disable-libgomp --disable-libquadmath
+make -j${J}
+make install
+cd ..
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 691d90abac..34c94f3045 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -68,6 +68,7 @@ fi
 : ${cross_cc_ppc64le="$cross_cc_ppc64"}
 : ${cross_cc_cflags_ppc64le="-m64 -mlittle-endian"}
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
+: ${cross_cc_rx="rx-elf-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
@@ -192,6 +193,11 @@ for target in $target_list; do
       container_image=debian-riscv64-test-cross
       container_cross_cc=riscv64-linux-gnu-gcc
       ;;
+    rx-*)
+      container_hosts=x86_64
+      container_image=debian-rx-cross
+      container_cross_cc=rx-elf-gcc
+      ;;
     s390x-*)
       container_hosts=x86_64
       container_image=debian-s390x-cross
-- 
2.34.1


