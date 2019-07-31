Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF9B7BB73
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 10:23:11 +0200 (CEST)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsjt8-00071R-Gb
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 04:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38519)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hsjsb-0006bc-78
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 04:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hsjsZ-0006xm-P6
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 04:22:37 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.77]:57621)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>) id 1hsjsZ-0006x9-GV
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 04:22:35 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 09:22:26 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 31 Jul 2019 09:22:33 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 31 Jul
 2019 09:22:33 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 1/1] configure: Define target access
 alignment in configure
Thread-Index: AQHVR3kaWD62otdC80mRnpYkYOhj4g==
Date: Wed, 31 Jul 2019 08:22:33 +0000
Message-ID: <1564561349027.20997@bt.com>
References: <2aaac4eafedb4aec979657993d00b8cd@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <2aaac4eafedb4aec979657993d00b8cd@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.77
Subject: [Qemu-devel] [PATCH v4 1/1] configure: Define target access
 alignment in configure
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
Cc: ehabkost@redhat.com, arikalo@wavecomp.com, mark.cave-ayland@ilande.co.uk,
 jcmvbkbc@gmail.com, aurelien@aurel32.net, amarkovic@wavecomp.com,
 atar4qemu@gmail.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename ALIGNED_ONLY to TARGET_ALIGNED_ONLY for clarity and move=0A=
defines out of target/foo/cpu.h into configure, as we do with=0A=
TARGET_WORDS_BIGENDIAN, so that it is always defined early.=0A=
=0A=
Poison TARGET_ALIGNED_ONLY to prevent use in common code.=0A=
=0A=
Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>=0A=
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>=0A=
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>=0A=
---=0A=
 configure             | 10 +++++++++-=0A=
 include/exec/poison.h |  1 +=0A=
 include/qom/cpu.h     |  2 +-=0A=
 target/alpha/cpu.h    |  2 --=0A=
 target/hppa/cpu.h     |  1 -=0A=
 target/mips/cpu.h     |  2 --=0A=
 target/sh4/cpu.h      |  2 --=0A=
 target/sparc/cpu.h    |  2 --=0A=
 target/xtensa/cpu.h   |  2 --=0A=
 tcg/tcg.c             |  2 +-=0A=
 tcg/tcg.h             |  8 +++++---=0A=
 11 files changed, 17 insertions(+), 17 deletions(-)=0A=
=0A=
diff --git a/configure b/configure=0A=
index 714e7fb6a1..482ba0b240 100755=0A=
--- a/configure=0A=
+++ b/configure=0A=
@@ -7431,8 +7431,13 @@ for target in $target_list; do=0A=
 target_dir=3D"$target"=0A=
 config_target_mak=3D$target_dir/config-target.mak=0A=
 target_name=3D$(echo $target | cut -d '-' -f 1)=0A=
+target_aligned_only=3D"no"=0A=
+case "$target_name" in=0A=
+  alpha|hppa|mips64el|mips64|mipsel|mips|mipsn32|mipsn32el|sh4|sh4eb|sparc=
|sparc64|sparc32plus|xtensa|xtensaeb)=0A=
+  target_aligned_only=3D"yes"=0A=
+  ;;=0A=
+esac=0A=
 target_bigendian=3D"no"=0A=
-=0A=
 case "$target_name" in=0A=
   armeb|aarch64_be|hppa|lm32|m68k|microblaze|mips|mipsn32|mips64|moxie|or1=
k|ppc|ppc64|ppc64abi32|s390x|sh4eb|sparc|sparc64|sparc32plus|xtensaeb)=0A=
   target_bigendian=3Dyes=0A=
@@ -7717,6 +7722,9 @@ fi=0A=
 if supported_whpx_target $target; then=0A=
     echo "CONFIG_WHPX=3Dy" >> $config_target_mak=0A=
 fi=0A=
+if test "$target_aligned_only" =3D "yes" ; then=0A=
+  echo "TARGET_ALIGNED_ONLY=3Dy" >> $config_target_mak=0A=
+fi=0A=
 if test "$target_bigendian" =3D "yes" ; then=0A=
   echo "TARGET_WORDS_BIGENDIAN=3Dy" >> $config_target_mak=0A=
 fi=0A=
diff --git a/include/exec/poison.h b/include/exec/poison.h=0A=
index b862320fa6..955eb863ab 100644=0A=
--- a/include/exec/poison.h=0A=
+++ b/include/exec/poison.h=0A=
@@ -35,6 +35,7 @@=0A=
 #pragma GCC poison TARGET_UNICORE32=0A=
 #pragma GCC poison TARGET_XTENSA=0A=
 =0A=
+#pragma GCC poison TARGET_ALIGNED_ONLY=0A=
 #pragma GCC poison TARGET_HAS_BFLT=0A=
 #pragma GCC poison TARGET_NAME=0A=
 #pragma GCC poison TARGET_SUPPORTS_MTTCG=0A=
diff --git a/include/qom/cpu.h b/include/qom/cpu.h=0A=
index 5ee0046b62..9b50b73339 100644=0A=
--- a/include/qom/cpu.h=0A=
+++ b/include/qom/cpu.h=0A=
@@ -89,7 +89,7 @@ struct TranslationBlock;=0A=
  * @do_unassigned_access: Callback for unassigned access handling.=0A=
  * (this is deprecated: new targets should use do_transaction_failed inste=
ad)=0A=
  * @do_unaligned_access: Callback for unaligned access handling, if=0A=
- * the target defines #ALIGNED_ONLY.=0A=
+ * the target defines #TARGET_ALIGNED_ONLY.=0A=
  * @do_transaction_failed: Callback for handling failed memory transaction=
s=0A=
  * (ie bus faults or external aborts; not MMU faults)=0A=
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports=
=0A=
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h=0A=
index b3e8a823e1..16eb8047cf 100644=0A=
--- a/target/alpha/cpu.h=0A=
+++ b/target/alpha/cpu.h=0A=
@@ -23,8 +23,6 @@=0A=
 #include "cpu-qom.h"=0A=
 #include "exec/cpu-defs.h"=0A=
 =0A=
-#define ALIGNED_ONLY=0A=
-=0A=
 /* Alpha processors have a weak memory model */=0A=
 #define TCG_GUEST_DEFAULT_MO      (0)=0A=
 =0A=
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h=0A=
index aab251bc4b..2be67c289a 100644=0A=
--- a/target/hppa/cpu.h=0A=
+++ b/target/hppa/cpu.h=0A=
@@ -30,7 +30,6 @@=0A=
    basis.  It's probably easier to fall back to a strong memory model.  */=
=0A=
 #define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL=0A=
 =0A=
-#define ALIGNED_ONLY=0A=
 #define MMU_KERNEL_IDX   0=0A=
 #define MMU_USER_IDX     3=0A=
 #define MMU_PHYS_IDX     4=0A=
diff --git a/target/mips/cpu.h b/target/mips/cpu.h=0A=
index 21c0615e02..c13cd4eb31 100644=0A=
--- a/target/mips/cpu.h=0A=
+++ b/target/mips/cpu.h=0A=
@@ -1,8 +1,6 @@=0A=
 #ifndef MIPS_CPU_H=0A=
 #define MIPS_CPU_H=0A=
 =0A=
-#define ALIGNED_ONLY=0A=
-=0A=
 #include "cpu-qom.h"=0A=
 #include "exec/cpu-defs.h"=0A=
 #include "fpu/softfloat.h"=0A=
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h=0A=
index aee733eaaa..ecaa7a18a9 100644=0A=
--- a/target/sh4/cpu.h=0A=
+++ b/target/sh4/cpu.h=0A=
@@ -23,8 +23,6 @@=0A=
 #include "cpu-qom.h"=0A=
 #include "exec/cpu-defs.h"=0A=
 =0A=
-#define ALIGNED_ONLY=0A=
-=0A=
 /* CPU Subtypes */=0A=
 #define SH_CPU_SH7750  (1 << 0)=0A=
 #define SH_CPU_SH7750S (1 << 1)=0A=
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h=0A=
index 8ed2250cd0..1406f0ba2e 100644=0A=
--- a/target/sparc/cpu.h=0A=
+++ b/target/sparc/cpu.h=0A=
@@ -5,8 +5,6 @@=0A=
 #include "cpu-qom.h"=0A=
 #include "exec/cpu-defs.h"=0A=
 =0A=
-#define ALIGNED_ONLY=0A=
-=0A=
 #if !defined(TARGET_SPARC64)=0A=
 #define TARGET_DPREGS 16=0A=
 #else=0A=
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h=0A=
index 2c277134f1..0459243e6b 100644=0A=
--- a/target/xtensa/cpu.h=0A=
+++ b/target/xtensa/cpu.h=0A=
@@ -32,8 +32,6 @@=0A=
 #include "exec/cpu-defs.h"=0A=
 #include "xtensa-isa.h"=0A=
 =0A=
-#define ALIGNED_ONLY=0A=
-=0A=
 /* Xtensa processors have a weak memory model */=0A=
 #define TCG_GUEST_DEFAULT_MO      (0)=0A=
 =0A=
diff --git a/tcg/tcg.c b/tcg/tcg.c=0A=
index be2c33c400..8d23fb0592 100644=0A=
--- a/tcg/tcg.c=0A=
+++ b/tcg/tcg.c=0A=
@@ -1926,7 +1926,7 @@ static const char * const ldst_name[] =3D=0A=
 };=0A=
 =0A=
 static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] =3D =
{=0A=
-#ifdef ALIGNED_ONLY=0A=
+#ifdef TARGET_ALIGNED_ONLY=0A=
     [MO_UNALN >> MO_ASHIFT]    =3D "un+",=0A=
     [MO_ALIGN >> MO_ASHIFT]    =3D "",=0A=
 #else=0A=
diff --git a/tcg/tcg.h b/tcg/tcg.h=0A=
index b411e17a28..529acb2ed8 100644=0A=
--- a/tcg/tcg.h=0A=
+++ b/tcg/tcg.h=0A=
@@ -333,10 +333,12 @@ typedef enum TCGMemOp {=0A=
     MO_TE    =3D MO_LE,=0A=
 #endif=0A=
 =0A=
-    /* MO_UNALN accesses are never checked for alignment.=0A=
+    /*=0A=
+     * MO_UNALN accesses are never checked for alignment.=0A=
      * MO_ALIGN accesses will result in a call to the CPU's=0A=
      * do_unaligned_access hook if the guest address is not aligned.=0A=
-     * The default depends on whether the target CPU defines ALIGNED_ONLY.=
=0A=
+     * The default depends on whether the target CPU defines=0A=
+     * TARGET_ALIGNED_ONLY.=0A=
      *=0A=
      * Some architectures (e.g. ARMv8) need the address which is aligned=
=0A=
      * to a size more than the size of the memory access.=0A=
@@ -353,7 +355,7 @@ typedef enum TCGMemOp {=0A=
      */=0A=
     MO_ASHIFT =3D 4,=0A=
     MO_AMASK =3D 7 << MO_ASHIFT,=0A=
-#ifdef ALIGNED_ONLY=0A=
+#ifdef TARGET_ALIGNED_ONLY=0A=
     MO_ALIGN =3D 0,=0A=
     MO_UNALN =3D MO_AMASK,=0A=
 #else=0A=
-- =0A=
2.22.0=0A=

