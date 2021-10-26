Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF3B43B016
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:34:07 +0200 (CEST)
Received: from localhost ([::1]:55578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJmQ-0001UA-43
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbZ-0000wc-Iy
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbU-0007QI-2P
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v17so16956343wrv.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACIp9F0Nh15Gaf/v0m8OCT5cDDHld1MVNF1OSbxE2lw=;
 b=TnHV42rk3YnbDKaEiurIXtpRjjO7pME//+BwInVmNSIMygImu/FMbZt9tFolFv3ecN
 2yeg2faoVf9AMRwWyzdOhiHrm3iwvS1yMD+GZTbxV45XQhDiVKUt8zGGxdoeMUOMlwNi
 1VfLiQJq2KpMw3Acd1Hz8Rtan/eX7Wo4FFHqiaYkLk1LoPfE9uVf2tvmYpa9LNSYZEis
 hlhsypu4Vt1FKDs5i0f66ITI4eulR3YqJ6CSCOaSGu4EszkrvTgPYJKvjvM93bK44qy7
 HGitCtKt+nsAbOs+t4nvA/WsAirjzI+zo7QeS7keldk6WEMHLUP17rVKxCl67MPB8TP7
 SeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACIp9F0Nh15Gaf/v0m8OCT5cDDHld1MVNF1OSbxE2lw=;
 b=Ya3b2OF+smrMXSFhZlJ2YATxKVftVRSgQXPB3jOyFITxFXitOdufyQBiLZ3r0IvXeM
 OYfJKBGXhZoRArt19qTf3kwNXAw6E4CRUJDY3ScCl1gxv9GJhXVWAqgKs8aeDuIuhdDN
 awPcC1yuwUfK0G6lXUPKP1imn1msYMXc4pFt09pL2xi+c08n/oB4eO44LFGlG0AwuX/B
 gm5eyVvH0Om7YRFfYIS+ktd2WUHE7gKcSAO9UIUKWRkLcYmzWS1/dqtGv/+VOBHDvzRD
 7GdMEs1qNMwIDsACkPMNNGCmXMfFZS8/QqbJ6Tb+LycJ7jk0JX3E5xsKot9ktsfMX7vW
 eDDg==
X-Gm-Message-State: AOAM5323ENeGrt9Qq19cDw7CalPYOS54MmR1e+iJUQ8n+3KYfZZrSTem
 FvJRARw/V0iroCOPcLai4ODOVA==
X-Google-Smtp-Source: ABdhPJzCk1d1/SS+kh6mlEi+G9XEFGHeuVgiP6ee/AmPJ/9GiIQLartgNe2z0A1oyetO8XjlO0ijCQ==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr30450592wrg.282.1635243765136; 
 Tue, 26 Oct 2021 03:22:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y5sm9120250wrd.75.2021.10.26.03.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A5F01FF9C;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/28] tests/docker: Add debian-nios2-cross image
Date: Tue, 26 Oct 2021 11:22:11 +0100
Message-Id: <20211026102234.3961636-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: fam@euphon.net, Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 minyihh@uci.edu, berrange@redhat.com, kuhn.chenqun@huawei.com,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Build the entire cross tool chain from source.
For this reason, default to caching.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[AJB: honour NOUSER in cached fetch and build, update MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-6-richard.henderson@linaro.org>
---
 MAINTAINERS                                   |  1 +
 tests/docker/Makefile.include                 | 25 ++++++
 .../debian-nios2-cross.d/build-toolchain.sh   | 87 +++++++++++++++++++
 .../dockerfiles/debian-toolchain.docker       | 36 ++++++++
 4 files changed, 149 insertions(+)
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker

diff --git a/MAINTAINERS b/MAINTAINERS
index 5423ae0cd4..aa515bd313 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -256,6 +256,7 @@ F: target/nios2/
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


