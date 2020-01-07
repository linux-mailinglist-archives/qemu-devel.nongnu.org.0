Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232FE131EC3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 06:08:47 +0100 (CET)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioh6i-0004KQ-AN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 00:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iognO-0005PY-Oa
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iognM-0004iE-Uj
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42311 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iognM-0004d1-J6; Mon, 06 Jan 2020 23:48:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47sKdY0JTvz9sSH; Tue,  7 Jan 2020 15:48:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578372513;
 bh=Rxx2qkydXpS+SLgpGEY+gkMtWzxEvGQpLzM+4rL4q54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KSgeKko3TEPuy6VlolqIa9oT06CfVwwoIZwxgO3QkzcqXxkuWIKw5n2FkIen/PIce
 58cd/Zll3iAwfMLZEHgzpVs/pIDPOvHiC+iLouYAUzIhg60fdenlHRyskS7BJb6EYQ
 LkvDuALOTe48leeJUiAXIdT7o9R/VHPZ3bZOiVK0=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	groug@kaod.org,
	philmd@redhat.com,
	clg@kaod.org
Subject: [PATCH v2 08/10] target/ppc: Streamline calculation of RMA limit from
 LPCR[RMLS]
Date: Tue,  7 Jan 2020 15:48:25 +1100
Message-Id: <20200107044827.471355-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107044827.471355-1-david@gibson.dropbear.id.au>
References: <20200107044827.471355-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 paulus@samba.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we use a big switch statement in ppc_hash64_update_rmls() to wo=
rk
out what the right RMA limit is based on the LPCR[RMLS] field.  There's n=
o
formula for this - it's just an arbitrary mapping defined by the existing
CPU implementations - but we can make it a bit more readable by using a
lookup table rather than a switch.  In addition we can use the MiB/GiB
symbols to make it a bit clearer.

While there we add a bit of clarity and rationale to the comment about
what happens if the LPCR[RMLS] doesn't contain a valid value.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash64.c | 71 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 127b7250ae..bb9ebeaf48 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -18,6 +18,7 @@
  * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -755,6 +756,39 @@ static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr=
 ptex, uint64_t pte1)
     stb_phys(CPU(cpu)->as, base + offset, (pte1 & 0xff) | 0x80);
 }
=20
+static target_ulong rmls_limit(PowerPCCPU *cpu)
+{
+    CPUPPCState *env =3D &cpu->env;
+    /*
+     * This is the full 4 bits encoding of POWER8. Previous
+     * CPUs only support a subset of these but the filtering
+     * is done when writing LPCR
+     */
+    const target_ulong rma_sizes[] =3D {
+        [0] =3D 0,
+        [1] =3D 16 * GiB,
+        [2] =3D 1 * GiB,
+        [3] =3D 64 * MiB,
+        [4] =3D 256 * MiB,
+        [5] =3D 0,
+        [6] =3D 0,
+        [7] =3D 128 * MiB,
+        [8] =3D 32 * MiB,
+    };
+    target_ulong rmls =3D (env->spr[SPR_LPCR] & LPCR_RMLS) >> LPCR_RMLS_=
SHIFT;
+
+    if (rmls < ARRAY_SIZE(rma_sizes)) {
+        return rma_sizes[rmls];
+    } else {
+        /*
+         * Bad value, so the OS has shot itself in the foot.  Return a
+         * 0-sized RMA which we expect to trigger an immediate DSI or
+         * ISI
+         */
+        return 0;
+    }
+}
+
 int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                                 int rwx, int mmu_idx)
 {
@@ -1004,41 +1038,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, ta=
rget_ulong ptex,
     cpu->env.tlb_need_flush =3D TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_F=
LUSH;
 }
=20
-static void ppc_hash64_update_rmls(PowerPCCPU *cpu)
-{
-    CPUPPCState *env =3D &cpu->env;
-    uint64_t lpcr =3D env->spr[SPR_LPCR];
-
-    /*
-     * This is the full 4 bits encoding of POWER8. Previous
-     * CPUs only support a subset of these but the filtering
-     * is done when writing LPCR
-     */
-    switch ((lpcr & LPCR_RMLS) >> LPCR_RMLS_SHIFT) {
-    case 0x8: /* 32MB */
-        env->rmls =3D 0x2000000ull;
-        break;
-    case 0x3: /* 64MB */
-        env->rmls =3D 0x4000000ull;
-        break;
-    case 0x7: /* 128MB */
-        env->rmls =3D 0x8000000ull;
-        break;
-    case 0x4: /* 256MB */
-        env->rmls =3D 0x10000000ull;
-        break;
-    case 0x2: /* 1GB */
-        env->rmls =3D 0x40000000ull;
-        break;
-    case 0x1: /* 16GB */
-        env->rmls =3D 0x400000000ull;
-        break;
-    default:
-        /* What to do here ??? */
-        env->rmls =3D 0;
-    }
-}
-
 static void ppc_hash64_update_vrma(PowerPCCPU *cpu)
 {
     CPUPPCState *env =3D &cpu->env;
@@ -1097,7 +1096,7 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong v=
al)
     CPUPPCState *env =3D &cpu->env;
=20
     env->spr[SPR_LPCR] =3D val & pcc->lpcr_mask;
-    ppc_hash64_update_rmls(cpu);
+    env->rmls =3D rmls_limit(cpu);
     ppc_hash64_update_vrma(cpu);
 }
=20
--=20
2.24.1


