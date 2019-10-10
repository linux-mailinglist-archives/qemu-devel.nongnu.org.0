Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C6D2811
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 13:39:01 +0200 (CEST)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIWmY-0000E6-2a
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 07:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iIWiG-0003V7-07
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iIWiE-0005nH-Lu
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:34:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iIWiE-0005mn-Dn; Thu, 10 Oct 2019 07:34:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A55AC302246D;
 Thu, 10 Oct 2019 11:34:29 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-138.ams2.redhat.com [10.36.117.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 321855C1B5;
 Thu, 10 Oct 2019 11:34:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/31] s390x/mmu: Implement Instruction-Execution-Protection
 Facility
Date: Thu, 10 Oct 2019 13:33:35 +0200
Message-Id: <20191010113356.5017-11-david@redhat.com>
In-Reply-To: <20191010113356.5017-1-david@redhat.com>
References: <20191010113356.5017-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 10 Oct 2019 11:34:29 +0000 (UTC)
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IEP support in the mmu is fairly easy. Set the right permissions for TLB
entries and properly report an exception.

Make sure to handle EDAT-2 by setting bit 56/60/61 of the TEID (TEC) to
the right values.

Let's keep s390_cpu_get_phys_page_debug() working even if IEP is
active. Switch MMU_DATA_LOAD - this has no other effects any more as the
ASC to be used is now fully selected outside of mmu_translate().

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu.h        |  1 +
 target/s390x/helper.c     |  6 +++++-
 target/s390x/mmu_helper.c | 21 +++++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 2db54884b8..b907741858 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -315,6 +315,7 @@ extern const VMStateDescription vmstate_s390_cpu;
 #define CR0_EDAT                0x0000000000800000ULL
 #define CR0_AFP                 0x0000000000040000ULL
 #define CR0_VECTOR              0x0000000000020000ULL
+#define CR0_IEP                 0x0000000000100000ULL
 #define CR0_EMERGENCY_SIGNAL_SC 0x0000000000004000ULL
 #define CR0_EXTERNAL_CALL_SC    0x0000000000002000ULL
 #define CR0_CKC_SC              0x0000000000000800ULL
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 948c0398d4..bf503b56ee 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -63,7 +63,11 @@ hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vadd=
r vaddr)
         asc =3D PSW_ASC_PRIMARY;
     }
=20
-    if (mmu_translate(env, vaddr, MMU_INST_FETCH, asc, &raddr, &prot, fa=
lse)) {
+    /*
+     * We want to read code even if IEP is active. Use MMU_DATA_LOAD ins=
tead
+     * of MMU_INST_FETCH.
+     */
+    if (mmu_translate(env, vaddr, MMU_DATA_LOAD, asc, &raddr, &prot, fal=
se)) {
         return -1;
     }
     return raddr;
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 06502bd25d..4a794dadcf 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -121,6 +121,8 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
     const bool edat1 =3D (env->cregs[0] & CR0_EDAT) &&
                        s390_has_feat(S390_FEAT_EDAT);
     const bool edat2 =3D edat1 && s390_has_feat(S390_FEAT_EDAT_2);
+    const bool iep =3D (env->cregs[0] & CR0_IEP) &&
+                     s390_has_feat(S390_FEAT_INSTRUCTION_EXEC_PROT);
     const int asce_tl =3D asce & ASCE_TABLE_LENGTH;
     const int asce_p =3D asce & ASCE_PRIVATE_SPACE;
     hwaddr gaddr =3D asce & ASCE_ORIGIN;
@@ -225,6 +227,9 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
             *flags &=3D ~PAGE_WRITE;
         }
         if (edat2 && (entry & REGION3_ENTRY_FC)) {
+            if (iep && (entry & REGION3_ENTRY_IEP)) {
+                *flags &=3D ~PAGE_EXEC;
+            }
             *raddr =3D (entry & REGION3_ENTRY_RFAA) |
                      (vaddr & ~REGION3_ENTRY_RFAA);
             return 0;
@@ -252,6 +257,9 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
             *flags &=3D ~PAGE_WRITE;
         }
         if (edat1 && (entry & SEGMENT_ENTRY_FC)) {
+            if (iep && (entry & SEGMENT_ENTRY_IEP)) {
+                *flags &=3D ~PAGE_EXEC;
+            }
             *raddr =3D (entry & SEGMENT_ENTRY_SFAA) |
                      (vaddr & ~SEGMENT_ENTRY_SFAA);
             return 0;
@@ -272,6 +280,9 @@ static int mmu_translate_asce(CPUS390XState *env, tar=
get_ulong vaddr,
     if (entry & PAGE_ENTRY_P) {
         *flags &=3D ~PAGE_WRITE;
     }
+    if (iep && (entry & PAGE_ENTRY_IEP)) {
+        *flags &=3D ~PAGE_EXEC;
+    }
=20
     *raddr =3D entry & TARGET_PAGE_MASK;
     return 0;
@@ -430,6 +441,16 @@ int mmu_translate(CPUS390XState *env, target_ulong v=
addr, int rw, uint64_t asc,
         return -1;
     }
=20
+    /* check for Instruction-Execution-Protection */
+    if (unlikely(rw =3D=3D MMU_INST_FETCH && !(*flags & PAGE_EXEC))) {
+        if (exc) {
+            /* IEP sets bit 56 and 61 */
+            tec |=3D 0x84;
+            trigger_access_exception(env, PGM_PROTECTION, ilen, tec);
+        }
+        return -1;
+    }
+
 nodat:
     /* Convert real address -> absolute address */
     *raddr =3D mmu_real2abs(env, *raddr);
--=20
2.21.0


