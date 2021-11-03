Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC34446CA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:14:27 +0100 (CET)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJqE-0000yA-7f
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiF-0003c3-6H
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiA-0003Xx-MW
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2375244wmd.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtnjkaZPBasI3/4a9EGC8osxlwlyzz3NvP9JZJUVSlY=;
 b=V3BlD4fBNJkkmFpsUJtYSgtD2glDR2bN0qPpZqaM99viaf/xe+HmH52IvjY0IojU0o
 RO0iyWX/Ih4YP+tgHmekLQEnZ4nChhf1uNLrVw50YGe6fSqEipAmc1+95qyf29boD43V
 3y2EP+7EZzUzCD1P15twetPsMAJDil5Q8PO3w9rclzCYLW2o65eExFqVrVOeEmOtw4iC
 pZCKEesBvm7tFitXeBoswVr3S4ouZ4yOVY3oe0fZlvdIOVo0TiC45d6lYmjgyHjJYW9i
 TBs4xdzeuEGXYd62DmEE6H9W4Ib3YW4ORbmZ6lY6ItCCAQQTQsdM9ULlHf0uJnos6BWj
 yrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtnjkaZPBasI3/4a9EGC8osxlwlyzz3NvP9JZJUVSlY=;
 b=a7M89gbmxTqUnqVcISrPg2/R/cmuQV78G0ZR5fpnCNMKPgJH/OnCHCNwtF+l2mimAW
 93cfviFPWx2L18CI9l4mSRcLDHCU0eFZFsZWSRJS3/d2lSVlwG1uU92iORz5ekB+CIwV
 05klkmYqe4exggZ5kkUEb6Civ2dFC9Gsbwqe1EDjhxjN+xgz5nat11ojTw7pN5W+Z1LS
 xrHcNa4l/lkQS32JoGORyU0XsaLswuQsVV6LJvUjeSjbjtPyHTh7kBL1n+upgEBkvIaa
 AsZIqob+6AggwiaDQhksNx1e9G4L8u4LcVsADvC078NUlqtZKXPaG5GrJmwanRutaMcx
 3G6Q==
X-Gm-Message-State: AOAM530J5uJ8rpmOV/wwYmIrR/djUZ4uot3ejhVIH0wtSyV+zfqv+cqS
 0kYkg9E8J+9mOQwGG9e3qYtLEQ==
X-Google-Smtp-Source: ABdhPJxSWjhZtKQcKmvdBTr3rqSN6RzYQmAheV/6nqvCHnDuC5NbDzoC2414BZUFFZ8H8yDon7cu4w==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr17087305wmi.46.1635959163356; 
 Wed, 03 Nov 2021 10:06:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d9sm2457909wre.52.2021.11.03.10.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9B221FF9A;
 Wed,  3 Nov 2021 17:05:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/21] tests/docker: Add debian-nios2-cross image
Date: Wed,  3 Nov 2021 17:05:40 +0000
Message-Id: <20211103170558.717981-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[AJB: honour NOUSER in cached fetch and build, update MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-6-richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20211026102234.3961636-6-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index b7ef31e701..e07134aa28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -252,6 +252,7 @@ F: target/nios2/
 F: hw/nios2/
 F: disas/nios2.c
 F: configs/devices/nios2-softmmu/default.mak
+F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index d223100dff..24ed5c1f1d 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -148,11 +148,35 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
+debian-toolchain-run = \
+	$(if $(NOCACHE), 						\
+		$(call quiet-command,					\
+			$(DOCKER_SCRIPT) build -t qemu/$1 -f $< 	\
+			$(if $V,,--quiet) --no-cache 			\
+			--registry $(DOCKER_REGISTRY) --extra-files	\
+			$(DOCKER_FILES_DIR)/$1.d/build-toolchain.sh,	\
+			"BUILD", $1),				        \
+		$(call quiet-command,					\
+			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)	\
+				qemu/$1 $(DOCKER_REGISTRY),		\
+			"FETCH", $1)					\
+		$(call quiet-command,					\
+			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 	\
+				qemu/$1 				\
+				$(if $(NOUSER),,--add-current-user) 	\
+			"PREPARE", $1))
+debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
+
+docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
+    $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
 docker-image-debian-hexagon-cross: docker-image-debian10
+docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
@@ -161,6 +185,7 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
+DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
new file mode 100755
index 0000000000..ba3c9d8aff
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
@@ -0,0 +1,87 @@
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
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
new file mode 100644
index 0000000000..738d808aa6
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -0,0 +1,36 @@
+#
+# Docker toolchain cross-compiler
+#
+# This dockerfile is used for building a cross-compiler toolchain.
+# The script for building the toolchain is supplied via extra-files.
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
+        wget && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep -yy --arch-only gcc glibc
+
+ADD build-toolchain.sh /root/build-toolchain.sh
+
+RUN cd /root && ./build-toolchain.sh
+
+# Throw away the extra toolchain build deps, the downloaded source,
+# and the build trees by restoring the original debian10 image,
+# then copying the built toolchain from stage 0.
+FROM qemu/debian10
+COPY --from=0 /usr/local /usr/local
-- 
2.30.2


