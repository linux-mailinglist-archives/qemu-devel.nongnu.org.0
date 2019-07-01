Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B125D67
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:12:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJYV-0000Xe-8H
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:12:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9k-00049F-Q7
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9j-000791-CV
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:12 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37957 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9h-0006yb-Tj; Wed, 22 May 2019 00:47:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T20q0dz9sPp; Wed, 22 May 2019 14:46:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500374;
	bh=K39eTPMxj78aP5BGFsBiRFak42glNHpHZQs21KFAfSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KdxXM31iMV2skMk+i0vxTKKJXtEQOp9Thpzph/sBtgA1fLBFqJBMZ87IMlI+GrrYR
	M7VpXuIUKY8naNm3aLq0e8dLLLJbx/g5h9wYoh3h8QHmYxC6osL8GB8LlDyj7oihzQ
	IT2hysn1COh6mPoCDkb6lWAeEvQABYNne4nRYd9g=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:24 +1000
Message-Id: <20190522044600.16534-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 02/38] configure: Distinguish ppc64 and ppc64le
 hosts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
	clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We cannot use the ppc64le host compiler to build ppc64(be) guest code.
Clean up confusion between cross_cc_powerpc and cross_cc_ppc; make use
of the cflags variable as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190501223819.8584-2-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 configure | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index d2fc346302..69402f18b8 100755
--- a/configure
+++ b/configure
@@ -198,7 +198,7 @@ supported_kvm_target() {
         i386:i386 | i386:x86_64 | i386:x32 | \
         x86_64:i386 | x86_64:x86_64 | x86_64:x32 | \
         mips:mips | mipsel:mips | \
-        ppc:ppc | ppc64:ppc | ppc:ppc64 | ppc64:ppc64 | \
+        ppc:ppc | ppc64:ppc | ppc:ppc64 | ppc64:ppc64 | ppc64:ppc64le | =
\
         s390x:s390x)
             return 0
         ;;
@@ -502,8 +502,11 @@ cross_cc_arm=3D"arm-linux-gnueabihf-gcc"
 cross_cc_cflags_armeb=3D"-mbig-endian"
 cross_cc_i386=3D"i386-pc-linux-gnu-gcc"
 cross_cc_cflags_i386=3D""
-cross_cc_powerpc=3D"powerpc-linux-gnu-gcc"
-cross_cc_powerpc=3D"powerpc-linux-gnu-gcc"
+cross_cc_ppc=3D"powerpc-linux-gnu-gcc"
+cross_cc_cflags_ppc=3D"-m32"
+cross_cc_ppc64=3D"powerpc-linux-gnu-gcc"
+cross_cc_cflags_ppc64=3D"-m64"
+cross_cc_ppc64le=3D"powerpc64le-linux-gnu-gcc"
=20
 enabled_cross_compilers=3D""
=20
@@ -700,7 +703,11 @@ elif check_define __sparc__ ; then
   fi
 elif check_define _ARCH_PPC ; then
   if check_define _ARCH_PPC64 ; then
-    cpu=3D"ppc64"
+    if check_define _LITTLE_ENDIAN ; then
+      cpu=3D"ppc64le"
+    else
+      cpu=3D"ppc64"
+    fi
   else
     cpu=3D"ppc"
   fi
@@ -731,10 +738,14 @@ ARCH=3D
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
   ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
-    cpu=3D"$cpu"
     supported_cpu=3D"yes"
     eval "cross_cc_${cpu}=3D\$host_cc"
   ;;
+  ppc64le)
+    ARCH=3D"ppc64"
+    supported_cpu=3D"yes"
+    cross_cc_ppc64le=3D$host_cc
+  ;;
   i386|i486|i586|i686|i86pc|BePC)
     cpu=3D"i386"
     supported_cpu=3D"yes"
@@ -1538,8 +1549,8 @@ case "$cpu" in
     ppc)
            CPU_CFLAGS=3D"-m32"
            LDFLAGS=3D"-m32 $LDFLAGS"
-           cross_cc_powerpc=3D$cc
-           cross_cc_cflags_powerpc=3D$CPU_CFLAGS
+           cross_cc_ppc=3D$cc
+           cross_cc_cflags_ppc=3D"$CPU_CFLAGS"
            ;;
     ppc64)
            CPU_CFLAGS=3D"-m64"
@@ -6164,7 +6175,7 @@ if { test "$cpu" =3D "i386" || test "$cpu" =3D "x86=
_64"; } && \
         fi
     done
 fi
-if test "$cpu" =3D "ppc64" && test "$targetos" !=3D "Darwin" ; then
+if test "$ARCH" =3D "ppc64" && test "$targetos" !=3D "Darwin" ; then
   roms=3D"$roms spapr-rtas"
 fi
=20
@@ -7349,7 +7360,7 @@ if test "$linux" =3D "yes" ; then
   i386|x86_64|x32)
     linux_arch=3Dx86
     ;;
-  ppc|ppc64)
+  ppc|ppc64|ppc64le)
     linux_arch=3Dpowerpc
     ;;
   s390x)
@@ -7510,7 +7521,8 @@ case "$target_name" in
   ;;
   ppc)
     gdb_xml_files=3D"power-core.xml power-fpu.xml power-altivec.xml powe=
r-spe.xml"
-    target_compiler=3D$cross_cc_powerpc
+    target_compiler=3D$cross_cc_ppc
+    target_compiler_cflags=3D"$cross_cc_cflags_ppc"
   ;;
   ppc64)
     TARGET_BASE_ARCH=3Dppc
@@ -7518,6 +7530,7 @@ case "$target_name" in
     mttcg=3Dyes
     gdb_xml_files=3D"power64-core.xml power-fpu.xml power-altivec.xml po=
wer-spe.xml power-vsx.xml"
     target_compiler=3D$cross_cc_ppc64
+    target_compiler_cflags=3D"$cross_cc_cflags_ppc64"
   ;;
   ppc64le)
     TARGET_ARCH=3Dppc64
@@ -7533,7 +7546,8 @@ case "$target_name" in
     TARGET_ABI_DIR=3Dppc
     echo "TARGET_ABI32=3Dy" >> $config_target_mak
     gdb_xml_files=3D"power64-core.xml power-fpu.xml power-altivec.xml po=
wer-spe.xml power-vsx.xml"
-    target_compiler=3D$cross_cc_ppc64abi32
+    target_compiler=3D$cross_cc_ppc
+    target_compiler_cflags=3D"$cross_cc_cflags_ppc"
   ;;
   riscv32)
     TARGET_BASE_ARCH=3Driscv
--=20
2.21.0


