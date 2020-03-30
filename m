Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A3197811
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 11:53:52 +0200 (CEST)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIr79-0006Ky-79
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 05:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jIr4C-0001jY-CO
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 05:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jIr4B-0005yA-4O
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 05:50:48 -0400
Received: from 10.mo173.mail-out.ovh.net ([46.105.74.148]:55439)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jIr4A-0005xK-UR
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 05:50:47 -0400
Received: from player729.ha.ovh.net (unknown [10.110.115.229])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 318621362F6
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 11:50:45 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 5F365110F5312;
 Mon, 30 Mar 2020 09:50:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 5/7] target/ppc: Rework ppc_radix64_walk_tree() for
 partition-scoped translation
Date: Mon, 30 Mar 2020 11:49:44 +0200
Message-Id: <20200330094946.24678-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200330094946.24678-1-clg@kaod.org>
References: <20200330094946.24678-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13904019426076888038
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeihedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.74.148
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
Cc: Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ppc_radix64_walk_tree() routine walks through the nested radix
tables to look for a PTE.

Split it two and introduce a new routine ppc_radix64_next_level()
which we will use for partition-scoped Radix translation when
translating the process tree addresses.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-radix64.c | 50 ++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index b4e6abcd2d35..136498111f60 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -162,44 +162,60 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, int=
 rwx, uint64_t pte,
     }
 }
=20
-static uint64_t ppc_radix64_walk_tree(PowerPCCPU *cpu, vaddr eaddr,
-                                      uint64_t base_addr, uint64_t nls,
-                                      hwaddr *raddr, int *psize,
-                                      int *fault_cause, hwaddr *pte_addr=
)
+static uint64_t ppc_radix64_next_level(PowerPCCPU *cpu, vaddr eaddr,
+                                       uint64_t *pte_addr, uint64_t *nls=
,
+                                       int *psize, int *fault_cause)
 {
     CPUState *cs =3D CPU(cpu);
     uint64_t index, pde;
=20
-    if (nls < 5) { /* Directory maps less than 2**5 entries */
+    if (*nls < 5) { /* Directory maps less than 2**5 entries */
         *fault_cause |=3D DSISR_R_BADCONFIG;
         return 0;
     }
=20
     /* Read page <directory/table> entry from guest address space */
-    index =3D eaddr >> (*psize - nls); /* Shift */
-    index &=3D ((1UL << nls) - 1); /* Mask */
-    pde =3D ldq_phys(cs->as, base_addr + (index * sizeof(pde)));
-    if (!(pde & R_PTE_VALID)) { /* Invalid Entry */
+    pde =3D ldq_phys(cs->as, *pte_addr);
+    if (!(pde & R_PTE_VALID)) {         /* Invalid Entry */
         *fault_cause |=3D DSISR_NOPTE;
         return 0;
     }
=20
-    *psize -=3D nls;
+    *psize -=3D *nls;
+    if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
+        *nls =3D pde & R_PDE_NLS;
+        index =3D eaddr >> (*psize - *nls);       /* Shift */
+        index &=3D ((1UL << *nls) - 1);           /* Mask */
+        *pte_addr =3D (pde & R_PDE_NLB) + (index * sizeof(pde));
+    }
+    return pde;
+}
+
+static uint64_t ppc_radix64_walk_tree(PowerPCCPU *cpu, vaddr eaddr,
+                                      uint64_t base_addr, uint64_t nls,
+                                      hwaddr *raddr, int *psize,
+                                      int *fault_cause, hwaddr *pte_addr=
)
+{
+    uint64_t index, pde;
+
+    index =3D eaddr >> (*psize - nls);    /* Shift */
+    index &=3D ((1UL << nls) - 1);       /* Mask */
+    *pte_addr =3D base_addr + (index * sizeof(pde));
+    do {
+        pde =3D ppc_radix64_next_level(cpu, eaddr, pte_addr, &nls, psize=
,
+                                     fault_cause);
+    } while ((pde & R_PTE_VALID) && !(pde & R_PTE_LEAF));
=20
-    /* Check if Leaf Entry -> Page Table Entry -> Stop the Search */
-    if (pde & R_PTE_LEAF) {
+    /* Did we find a valid leaf? */
+    if ((pde & R_PTE_VALID) && (pde & R_PTE_LEAF)) {
         uint64_t rpn =3D pde & R_PTE_RPN;
         uint64_t mask =3D (1UL << *psize) - 1;
=20
         /* Or high bits of rpn and low bits to ea to form whole real add=
r */
         *raddr =3D (rpn & ~mask) | (eaddr & mask);
-        *pte_addr =3D base_addr + (index * sizeof(pde));
-        return pde;
     }
=20
-    /* Next Level of Radix Tree */
-    return ppc_radix64_walk_tree(cpu, eaddr, pde & R_PDE_NLB, pde & R_PD=
E_NLS,
-                                 raddr, psize, fault_cause, pte_addr);
+    return pde;
 }
=20
 static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t =
*pate)
--=20
2.21.1


