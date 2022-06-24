Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B9559F39
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:25:46 +0200 (CEST)
Received: from localhost ([::1]:52086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4n3x-00031R-N8
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4mw9-0007hZ-6u; Fri, 24 Jun 2022 13:17:41 -0400
Received: from [187.72.171.209] (port=15972 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o4mw7-0008Lo-A8; Fri, 24 Jun 2022 13:17:40 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 24 Jun 2022 14:17:20 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0B0F580003F;
 Fri, 24 Jun 2022 14:17:20 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH v2 3/3] target/ppc: Check page dir/table base alignment
Date: Fri, 24 Jun 2022 14:16:53 -0300
Message-Id: <20220624171653.143740-4-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
References: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 24 Jun 2022 17:17:20.0400 (UTC)
 FILETIME=[43081900:01D887EE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check if each page dir/table base address is properly aligned and
log a guest error if not, as real hardware behave incorrectly in
this case.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/mmu-radix64.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 339cf5b4d8..1e7d932893 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -280,6 +280,14 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
     *psize -= *nls;
     if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
         *nls = pde & R_PDE_NLS;
+
+        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
+                " page dir size: 0x"TARGET_FMT_lx"\n",
+                __func__, (pde & R_PDE_NLB), BIT(*nls + 3));
+        }
+
         index = eaddr >> (*psize - *nls);       /* Shift */
         index &= ((1UL << *nls) - 1);           /* Mask */
         *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
@@ -295,6 +303,13 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
     uint64_t index, pde, rpn, mask;
     int level = 0;
 
+    if (base_addr & MAKE_64BIT_MASK(0, nls + 3)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: misaligned page dir base: 0x%"VADDR_PRIx
+            " page dir size: 0x"TARGET_FMT_lx"\n",
+            __func__, base_addr, BIT(nls + 3));
+    }
+
     index = eaddr >> (*psize - nls);    /* Shift */
     index &= ((1UL << nls) - 1);       /* Mask */
     *pte_addr = base_addr + (index * sizeof(pde));
-- 
2.25.1


