Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66120364FEA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 03:38:07 +0200 (CEST)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYfL4-0006Je-F3
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 21:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYfGV-0004Ui-C9; Mon, 19 Apr 2021 21:33:23 -0400
Received: from [201.28.113.2] (port=21420 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYfGP-0007Au-Lf; Mon, 19 Apr 2021 21:33:22 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 19 Apr 2021 22:33:12 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 12510801107;
 Mon, 19 Apr 2021 22:33:12 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/docker: gcc-10 based images for ppc64{,le} tests
Date: Mon, 19 Apr 2021 22:33:07 -0300
Message-Id: <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2021 01:33:12.0446 (UTC)
 FILETIME=[2097C9E0:01D73585]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

A newer compiler is needed to build tests for Power10 instructions. As
done for arm64 on c729a99d2701, a new '-test-cross' image is created for
ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
is added to verify that the toolchain in use has '-mpower10'.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/docker/Makefile.include                   |  2 ++
 .../debian-powerpc-test-cross.docker            | 17 +++++++++++++++++
 tests/tcg/configure.sh                          | 12 ++++++++----
 3 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9f464cb92c..f1dbcc639f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -152,10 +152,12 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
+docker-image-debian-power-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
+DOCKER_PARTIAL_IMAGES += debian-power-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-cross debian-ppc64-cross
diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
new file mode 100644
index 0000000000..36b336f709
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
@@ -0,0 +1,17 @@
+#
+# Docker powerpc/ppc64/ppc64le cross-compiler target
+#
+# This docker target builds on the debian Bullseye base image.
+#
+FROM qemu/debian11
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        gcc-powerpc-linux-gnu \
+        libc6-dev-powerpc-cross \
+        gcc-10-powerpc64-linux-gnu \
+        libc6-dev-ppc64-cross \
+        gcc-10-powerpc64le-linux-gnu \
+        libc6-dev-ppc64el-cross
+
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index fa1a4261a4..a0be066499 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -170,13 +170,13 @@ for target in $target_list; do
       ;;
     ppc64-*)
       container_hosts=x86_64
-      container_image=debian-ppc64-cross
-      container_cross_cc=powerpc64-linux-gnu-gcc
+      container_image=debian-powerpc-test-cross
+      container_cross_cc=powerpc64-linux-gnu-gcc-10
       ;;
     ppc64le-*)
       container_hosts=x86_64
-      container_image=debian-ppc64el-cross
-      container_cross_cc=powerpc64le-linux-gnu-gcc
+      container_image=debian-powerpc-test-cross
+      container_cross_cc=powerpc64le-linux-gnu-gcc-10
       ;;
     riscv64-*)
       container_hosts=x86_64
@@ -280,6 +280,10 @@ for target in $target_list; do
                -mpower8-vector -o $TMPE $TMPC; then
                 echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
             fi
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+               -mpower10 -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+            fi
         ;;
         i386-linux-user)
             if do_compiler "$target_compiler" $target_compiler_cflags \
-- 
2.25.1


