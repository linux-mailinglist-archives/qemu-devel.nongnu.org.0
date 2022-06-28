Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F0255E52E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:04:17 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BpA-0000Dv-S0
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o6Bif-0003XW-T8; Tue, 28 Jun 2022 09:57:33 -0400
Received: from [200.168.210.66] (port=7716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o6Bid-0008KX-Ah; Tue, 28 Jun 2022 09:57:33 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 28 Jun 2022 10:40:18 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 34B3F80009B;
 Tue, 28 Jun 2022 10:40:18 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH v3 3/3] target/ppc: Check page dir/table base alignment
Date: Tue, 28 Jun 2022 10:39:59 -0300
Message-Id: <20220628133959.15131-4-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
References: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 28 Jun 2022 13:40:18.0594 (UTC)
 FILETIME=[9B153020:01D88AF4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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

According to PowerISA 3.1B, Book III 6.7.6 programming note, the
page directory base addresses are expected to be aligned to their
size. Real hardware seems to rely on that and will access the
wrong address if they are misaligned. This results in a
translation failure even if the page tables seem to be properly
populated.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/mmu-radix64.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 705bff76be..00f2e9fa2e 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -265,7 +265,7 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
                                   uint64_t *pte_addr, uint64_t *nls,
                                   int *psize, uint64_t *pte, int *fault_cause)
 {
-    uint64_t index, pde;
+    uint64_t index, mask, nlb, pde;
 
     /* Read page <directory/table> entry from guest address space */
     pde = ldq_phys(as, *pte_addr);
@@ -280,7 +280,17 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
         *nls = pde & R_PDE_NLS;
         index = eaddr >> (*psize - *nls);       /* Shift */
         index &= ((1UL << *nls) - 1);           /* Mask */
-        *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
+        nlb = pde & R_PDE_NLB;
+        mask = MAKE_64BIT_MASK(0, *nls + 3);
+
+        if (nlb & mask) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: misaligned page dir/table base: 0x"TARGET_FMT_lx
+                " page dir size: 0x"TARGET_FMT_lx"\n",
+                __func__, nlb, mask + 1);
+            nlb &= ~mask;
+        }
+        *pte_addr = nlb + index * sizeof(pde);
     }
     return 0;
 }
@@ -294,8 +304,18 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
     int level = 0;
 
     index = eaddr >> (*psize - nls);    /* Shift */
-    index &= ((1UL << nls) - 1);       /* Mask */
-    *pte_addr = base_addr + (index * sizeof(pde));
+    index &= ((1UL << nls) - 1);        /* Mask */
+    mask = MAKE_64BIT_MASK(0, nls + 3);
+
+    if (base_addr & mask) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: misaligned page dir base: 0x"TARGET_FMT_lx
+            " page dir size: 0x"TARGET_FMT_lx"\n",
+            __func__, base_addr, mask + 1);
+        base_addr &= ~mask;
+    }
+    *pte_addr = base_addr + index * sizeof(pde);
+
     do {
         int ret;
 
-- 
2.25.1


