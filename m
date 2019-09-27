Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA81C07B1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:35:45 +0200 (CEST)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDrLT-0001PG-KS
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iDqPT-0007xT-OK
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iDqPS-0002R6-3y
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:35:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iDqPR-0002R0-S2; Fri, 27 Sep 2019 09:35:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1205B3082135;
 Fri, 27 Sep 2019 09:58:43 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-169.ams2.redhat.com [10.36.116.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 154221001281;
 Fri, 27 Sep 2019 09:58:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] s390x/mmu: Drop debug logging from MMU code
Date: Fri, 27 Sep 2019 11:58:25 +0200
Message-Id: <20190927095831.23543-2-david@redhat.com>
In-Reply-To: <20190927095831.23543-1-david@redhat.com>
References: <20190927095831.23543-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 27 Sep 2019 09:58:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's get it out of the way to make some further refactorings easier.
Personally, I've never used these debug statements at all. And if I had
to debug issues, I used plain GDB instead (debug prints are just way too
much noise in the MMU). We might want to introduce tracing at some point
instead, so we can able selected events on demand.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 51 ---------------------------------------
 1 file changed, 51 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 7e6b0d0508..6a7ad33c4d 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -28,31 +28,6 @@
 #include "hw/hw.h"
 #include "hw/s390x/storage-keys.h"
=20
-/* #define DEBUG_S390 */
-/* #define DEBUG_S390_PTE */
-/* #define DEBUG_S390_STDOUT */
-
-#ifdef DEBUG_S390
-#ifdef DEBUG_S390_STDOUT
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, fmt, ## __VA_ARGS__); \
-         if (qemu_log_separate()) qemu_log(fmt, ##__VA_ARGS__); } while =
(0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { qemu_log(fmt, ## __VA_ARGS__); } while (0)
-#endif
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
-#ifdef DEBUG_S390_PTE
-#define PTE_DPRINTF DPRINTF
-#else
-#define PTE_DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 /* Fetch/store bits in the translation exception code: */
 #define FS_READ  0x800
 #define FS_WRITE 0x400
@@ -80,8 +55,6 @@ static void trigger_prot_fault(CPUS390XState *env, targ=
et_ulong vaddr,
=20
     tec =3D vaddr | (rw =3D=3D MMU_DATA_STORE ? FS_WRITE : FS_READ) | 4 =
| asc >> 46;
=20
-    DPRINTF("%s: trans_exc_code=3D%016" PRIx64 "\n", __func__, tec);
-
     if (!exc) {
         return;
     }
@@ -97,8 +70,6 @@ static void trigger_page_fault(CPUS390XState *env, targ=
et_ulong vaddr,
=20
     tec =3D vaddr | (rw =3D=3D MMU_DATA_STORE ? FS_WRITE : FS_READ) | as=
c >> 46;
=20
-    DPRINTF("%s: trans_exc_code=3D%016" PRIx64 "\n", __func__, tec);
-
     if (!exc) {
         return;
     }
@@ -162,7 +133,6 @@ static int mmu_translate_pte(CPUS390XState *env, targ=
et_ulong vaddr,
                              target_ulong *raddr, int *flags, int rw, bo=
ol exc)
 {
     if (pt_entry & PAGE_INVALID) {
-        DPRINTF("%s: PTE=3D0x%" PRIx64 " invalid\n", __func__, pt_entry)=
;
         trigger_page_fault(env, vaddr, PGM_PAGE_TRANS, asc, rw, exc);
         return -1;
     }
@@ -175,9 +145,6 @@ static int mmu_translate_pte(CPUS390XState *env, targ=
et_ulong vaddr,
     }
=20
     *raddr =3D pt_entry & ASCE_ORIGIN;
-
-    PTE_DPRINTF("%s: PTE=3D0x%" PRIx64 "\n", __func__, pt_entry);
-
     return 0;
 }
=20
@@ -197,7 +164,6 @@ static int mmu_translate_segment(CPUS390XState *env, =
target_ulong vaddr,
     if ((st_entry & SEGMENT_ENTRY_FC) && (env->cregs[0] & CR0_EDAT)) {
         /* Decode EDAT1 segment frame absolute address (1MB page) */
         *raddr =3D (st_entry & 0xfffffffffff00000ULL) | (vaddr & 0xfffff=
);
-        PTE_DPRINTF("%s: SEG=3D0x%" PRIx64 "\n", __func__, st_entry);
         return 0;
     }
=20
@@ -205,8 +171,6 @@ static int mmu_translate_segment(CPUS390XState *env, =
target_ulong vaddr,
     origin =3D st_entry & SEGMENT_ENTRY_ORIGIN;
     offs  =3D (vaddr & VADDR_PX) >> 9;
     pt_entry =3D ldq_phys(cs->as, origin + offs);
-    PTE_DPRINTF("%s: 0x%" PRIx64 " + 0x%" PRIx64 " =3D> 0x%016" PRIx64 "=
\n",
-                __func__, origin, offs, pt_entry);
     return mmu_translate_pte(env, vaddr, asc, pt_entry, raddr, flags, rw=
, exc);
 }
=20
@@ -223,17 +187,12 @@ static int mmu_translate_region(CPUS390XState *env,=
 target_ulong vaddr,
         PGM_REG_SEC_TRANS, PGM_REG_FIRST_TRANS
     };
=20
-    PTE_DPRINTF("%s: 0x%" PRIx64 "\n", __func__, entry);
-
     origin =3D entry & REGION_ENTRY_ORIGIN;
     offs =3D (vaddr >> (17 + 11 * level / 4)) & 0x3ff8;
=20
     new_entry =3D ldq_phys(cs->as, origin + offs);
-    PTE_DPRINTF("%s: 0x%" PRIx64 " + 0x%" PRIx64 " =3D> 0x%016" PRIx64 "=
\n",
-                __func__, origin, offs, new_entry);
=20
     if ((new_entry & REGION_ENTRY_INV) !=3D 0) {
-        DPRINTF("%s: invalid region\n", __func__);
         trigger_page_fault(env, vaddr, pchks[level / 4], asc, rw, exc);
         return -1;
     }
@@ -252,7 +211,6 @@ static int mmu_translate_region(CPUS390XState *env, t=
arget_ulong vaddr,
     offs =3D (vaddr >> (28 + 11 * (level - 4) / 4)) & 3;
     if (offs < ((new_entry & REGION_ENTRY_TF) >> 6)
         || offs > (new_entry & REGION_ENTRY_LENGTH)) {
-        DPRINTF("%s: invalid offset or len (%lx)\n", __func__, new_entry=
);
         trigger_page_fault(env, vaddr, pchks[level / 4 - 1], asc, rw, ex=
c);
         return -1;
     }
@@ -289,8 +247,6 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
         break;
     case ASCE_TYPE_REGION2:
         if (vaddr & 0xffe0000000000000ULL) {
-            DPRINTF("%s: vaddr doesn't fit 0x%16" PRIx64
-                    " 0xffe0000000000000ULL\n", __func__, vaddr);
             trigger_page_fault(env, vaddr, PGM_ASCE_TYPE, asc, rw, exc);
             return -1;
         }
@@ -301,8 +257,6 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
         break;
     case ASCE_TYPE_REGION3:
         if (vaddr & 0xfffffc0000000000ULL) {
-            DPRINTF("%s: vaddr doesn't fit 0x%16" PRIx64
-                    " 0xfffffc0000000000ULL\n", __func__, vaddr);
             trigger_page_fault(env, vaddr, PGM_ASCE_TYPE, asc, rw, exc);
             return -1;
         }
@@ -313,8 +267,6 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
         break;
     case ASCE_TYPE_SEGMENT:
         if (vaddr & 0xffffffff80000000ULL) {
-            DPRINTF("%s: vaddr doesn't fit 0x%16" PRIx64
-                    " 0xffffffff80000000ULL\n", __func__, vaddr);
             trigger_page_fault(env, vaddr, PGM_ASCE_TYPE, asc, rw, exc);
             return -1;
         }
@@ -449,15 +401,12 @@ int mmu_translate(CPUS390XState *env, target_ulong =
vaddr, int rw, uint64_t asc,
=20
     switch (asc) {
     case PSW_ASC_PRIMARY:
-        PTE_DPRINTF("%s: asc=3Dprimary\n", __func__);
         asce =3D env->cregs[1];
         break;
     case PSW_ASC_HOME:
-        PTE_DPRINTF("%s: asc=3Dhome\n", __func__);
         asce =3D env->cregs[13];
         break;
     case PSW_ASC_SECONDARY:
-        PTE_DPRINTF("%s: asc=3Dsecondary\n", __func__);
         asce =3D env->cregs[7];
         break;
     case PSW_ASC_ACCREG:
--=20
2.21.0


