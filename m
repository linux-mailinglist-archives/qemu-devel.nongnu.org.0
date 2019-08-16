Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6FD8FE84
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 10:49:46 +0200 (CEST)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyXvd-0000Rv-6I
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 04:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1hyXtL-00078k-5S
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 04:47:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hyXtJ-0003xc-Nk
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 04:47:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hyXtJ-0003x6-GD; Fri, 16 Aug 2019 04:47:21 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE49283F4C;
 Fri, 16 Aug 2019 08:47:20 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-249.ams2.redhat.com [10.36.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2DD1F6DF;
 Fri, 16 Aug 2019 08:47:18 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 10:47:05 +0200
Message-Id: <20190816084708.602-4-david@redhat.com>
In-Reply-To: <20190816084708.602-1-david@redhat.com>
References: <20190816084708.602-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 16 Aug 2019 08:47:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 3/6] s390x/tcg: Rework MMU selection for
 instruction fetches
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
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instructions are always fetched from primary address space, except when
in home address mode. Perform the selection directly in cpu_mmu_index().

get_mem_index() is only used to perform data access, instructions are
fetched via cpu_lduw_code(), which translates to cpu_mmu_index(env, true)=
.

We don't care about restricting the access permissions of the TLB
entries anymore, as we no longer enter PRIMARY entries into the
SECONDARY MMU. Cleanup related code a bit.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/cpu.h        |  7 +++++++
 target/s390x/mmu_helper.c | 38 +++++++++++++++-----------------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index a606547b4d..c34992bb2e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -332,6 +332,13 @@ static inline int cpu_mmu_index(CPUS390XState *env, =
bool ifetch)
         return MMU_REAL_IDX;
     }
=20
+    if (ifetch) {
+        if ((env->psw.mask & PSW_MASK_ASC) =3D=3D PSW_ASC_HOME) {
+            return MMU_HOME_IDX;
+        }
+        return MMU_PRIMARY_IDX;
+    }
+
     switch (env->psw.mask & PSW_MASK_ASC) {
     case PSW_ASC_PRIMARY:
         return MMU_PRIMARY_IDX;
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index b236196802..d22c6b9c81 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -349,8 +349,9 @@ int mmu_translate(CPUS390XState *env, target_ulong va=
ddr, int rw, uint64_t asc,
 {
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
-    int r =3D -1;
+    uint64_t asce;
     uint8_t key;
+    int r;
=20
     if (unlikely(!ss)) {
         ss =3D s390_get_skeys_device();
@@ -380,36 +381,21 @@ int mmu_translate(CPUS390XState *env, target_ulong =
vaddr, int rw, uint64_t asc,
=20
     if (!(env->psw.mask & PSW_MASK_DAT)) {
         *raddr =3D vaddr;
-        r =3D 0;
-        goto out;
+        goto nodat;
     }
=20
     switch (asc) {
     case PSW_ASC_PRIMARY:
         PTE_DPRINTF("%s: asc=3Dprimary\n", __func__);
-        r =3D mmu_translate_asce(env, vaddr, asc, env->cregs[1], raddr, =
flags,
-                               rw, exc);
+        asce =3D env->cregs[1];
         break;
     case PSW_ASC_HOME:
         PTE_DPRINTF("%s: asc=3Dhome\n", __func__);
-        r =3D mmu_translate_asce(env, vaddr, asc, env->cregs[13], raddr,=
 flags,
-                               rw, exc);
+        asce =3D env->cregs[13];
         break;
     case PSW_ASC_SECONDARY:
         PTE_DPRINTF("%s: asc=3Dsecondary\n", __func__);
-        /*
-         * Instruction: Primary
-         * Data: Secondary
-         */
-        if (rw =3D=3D MMU_INST_FETCH) {
-            r =3D mmu_translate_asce(env, vaddr, PSW_ASC_PRIMARY, env->c=
regs[1],
-                                   raddr, flags, rw, exc);
-            *flags &=3D ~(PAGE_READ | PAGE_WRITE);
-        } else {
-            r =3D mmu_translate_asce(env, vaddr, PSW_ASC_SECONDARY, env-=
>cregs[7],
-                                   raddr, flags, rw, exc);
-            *flags &=3D ~(PAGE_EXEC);
-        }
+        asce =3D env->cregs[7];
         break;
     case PSW_ASC_ACCREG:
     default:
@@ -417,11 +403,17 @@ int mmu_translate(CPUS390XState *env, target_ulong =
vaddr, int rw, uint64_t asc,
         break;
     }
=20
- out:
+    /* perform the DAT translation */
+    r =3D mmu_translate_asce(env, vaddr, asc, asce, raddr, flags, rw, ex=
c);
+    if (r) {
+        return r;
+    }
+
+nodat:
     /* Convert real address -> absolute address */
     *raddr =3D mmu_real2abs(env, *raddr);
=20
-    if (r =3D=3D 0 && *raddr < ram_size) {
+    if (*raddr < ram_size) {
         r =3D skeyclass->get_skeys(ss, *raddr / TARGET_PAGE_SIZE, 1, &ke=
y);
         if (r) {
             trace_get_skeys_nonzero(r);
@@ -443,7 +435,7 @@ int mmu_translate(CPUS390XState *env, target_ulong va=
ddr, int rw, uint64_t asc,
         }
     }
=20
-    return r;
+    return 0;
 }
=20
 /**
--=20
2.21.0


