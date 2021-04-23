Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8CB369BC0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:04:20 +0200 (CEST)
Received: from localhost ([::1]:45518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2yJ-0006yL-Sv
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1la2tO-0004Bc-PJ; Fri, 23 Apr 2021 16:59:15 -0400
Received: from [201.28.113.2] (port=3941 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1la2tL-0002OV-5t; Fri, 23 Apr 2021 16:59:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 23 Apr 2021 17:59:09 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5010680139F;
 Fri, 23 Apr 2021 17:59:09 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] tests/docker: gcc-10 based images for ppc64{, le} tests
Date: Fri, 23 Apr 2021 17:57:56 -0300
Message-Id: <20210423205757.1752480-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423205757.1752480-1-matheus.ferst@eldorado.org.br>
References: <20210423205757.1752480-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Apr 2021 20:59:09.0737 (UTC)
 FILETIME=[81A08190:01D73883]
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
is added to verify that the toolchain in use has '-mpower10'. Finally,
Unused images (docker-power-cross and docker-ppc64-cross) are removed.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 .gitlab-ci.d/containers.yml                   | 13 +++---------
 tests/docker/Makefile.include                 |  5 ++---
 .../dockerfiles/debian-powerpc-cross.docker   | 12 -----------
 .../debian-powerpc-test-cross.docker          | 17 ++++++++++++++++
 .../dockerfiles/debian-ppc64-cross.docker     | 11 ----------
 tests/tcg/configure.sh                        | 20 +++++++++----------
 6 files changed, 32 insertions(+), 46 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-powerpc-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-ppc64-cross.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e23..325191627d 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -144,19 +144,12 @@ mipsel-debian-cross-container:
   variables:
     NAME: debian-mipsel-cross
 
-powerpc-debian-cross-container:
+powerpc-test-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-powerpc-cross
-
-ppc64-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  needs: ['amd64-debian11-container']
   variables:
-    NAME: debian-ppc64-cross
+    NAME: debian-powerpc-test-cross
 
 ppc64el-debian-cross-container:
   <<: *container_job_definition
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9f464cb92c..3b692d67d7 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -140,8 +140,6 @@ docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-mips64el-cross: docker-image-debian10
 docker-image-debian-mipsel-cross: docker-image-debian10
-docker-image-debian-powerpc-cross: docker-image-debian10
-docker-image-debian-ppc64-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
 docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
@@ -152,13 +150,14 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-arm64-test-cross: docker-image-debian11
+docker-image-debian-powerpc-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
+DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
-DOCKER_PARTIAL_IMAGES += debian-powerpc-cross debian-ppc64-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
diff --git a/tests/docker/dockerfiles/debian-powerpc-cross.docker b/tests/docker/dockerfiles/debian-powerpc-cross.docker
deleted file mode 100644
index 07e1789650..0000000000
--- a/tests/docker/dockerfiles/debian-powerpc-cross.docker
+++ /dev/null
@@ -1,12 +0,0 @@
-#
-# Docker powerpc cross-compiler target
-#
-# This docker target builds on the debian Buster base image.
-#
-FROM qemu/debian10
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        gcc-powerpc-linux-gnu \
-        libc6-dev-powerpc-cross
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
diff --git a/tests/docker/dockerfiles/debian-ppc64-cross.docker b/tests/docker/dockerfiles/debian-ppc64-cross.docker
deleted file mode 100644
index 8efe68874e..0000000000
--- a/tests/docker/dockerfiles/debian-ppc64-cross.docker
+++ /dev/null
@@ -1,11 +0,0 @@
-#
-# Docker ppc64 cross-compiler target
-#
-# This docker target builds on the debian Buster base image.
-FROM qemu/debian10
-
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-       gcc-powerpc64-linux-gnu \
-       libc6-dev-ppc64-cross
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index fa1a4261a4..c859b618de 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -165,18 +165,14 @@ for target in $target_list; do
       ;;
     ppc-*|ppc64abi32-*)
       container_hosts=x86_64
-      container_image=debian-powerpc-cross
-      container_cross_cc=powerpc-linux-gnu-gcc
+      container_image=debian-powerpc-test-cross
+      container_cross_cc=powerpc-linux-gnu-gcc-10
       ;;
-    ppc64-*)
+    ppc64-*|ppc64le-*)
       container_hosts=x86_64
-      container_image=debian-ppc64-cross
-      container_cross_cc=powerpc64-linux-gnu-gcc
-      ;;
-    ppc64le-*)
-      container_hosts=x86_64
-      container_image=debian-ppc64el-cross
-      container_cross_cc=powerpc64le-linux-gnu-gcc
+      container_image=debian-powerpc-test-cross
+      container_cross_cc=${target%%-*}-linux-gnu-gcc-10
+      container_cross_cc=powerpc${container_cross_cc#ppc}
       ;;
     riscv64-*)
       container_hosts=x86_64
@@ -280,6 +276,10 @@ for target in $target_list; do
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


