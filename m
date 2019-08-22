Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060C995FE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 16:11:13 +0200 (CEST)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0no0-0004mI-1D
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 10:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1i0ncE-0000CN-Ji
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1i0ncD-0004J0-AI
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 09:59:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51350)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1i0ncD-0004IE-3D; Thu, 22 Aug 2019 09:59:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 650B48D6CC6;
 Thu, 22 Aug 2019 13:59:00 +0000 (UTC)
Received: from localhost (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB4E160606;
 Thu, 22 Aug 2019 13:58:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Aug 2019 15:58:36 +0200
Message-Id: <20190822135839.32340-6-cohuck@redhat.com>
In-Reply-To: <20190822135839.32340-1-cohuck@redhat.com>
References: <20190822135839.32340-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 22 Aug 2019 13:59:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/7] s390x/tcg: Rework MMU selection for
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20190816084708.602-4-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu.h        |  7 +++++++
 target/s390x/mmu_helper.c | 38 +++++++++++++++-----------------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 3d9de25f7ce3..79202c098096 100644
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
index 6cf74502ef1e..40b6c1fc36a9 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -350,8 +350,9 @@ int mmu_translate(CPUS390XState *env, target_ulong va=
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
@@ -381,36 +382,21 @@ int mmu_translate(CPUS390XState *env, target_ulong =
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
@@ -418,11 +404,17 @@ int mmu_translate(CPUS390XState *env, target_ulong =
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
@@ -444,7 +436,7 @@ int mmu_translate(CPUS390XState *env, target_ulong va=
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
2.20.1


