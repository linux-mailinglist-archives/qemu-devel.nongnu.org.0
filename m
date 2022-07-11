Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A455E532
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:06:53 +0200 (CEST)
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Brg-0004TZ-Iz
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o6Bic-0003LZ-62; Tue, 28 Jun 2022 09:57:30 -0400
Received: from [200.168.210.66] (port=7716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o6Bia-0008KX-JB; Tue, 28 Jun 2022 09:57:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 28 Jun 2022 10:40:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 132D380009B;
 Tue, 28 Jun 2022 10:40:16 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH v3 2/3] target/ppc: Improve Radix xlate level validation
Date: Tue, 28 Jun 2022 10:39:58 -0300
Message-Id: <20220628133959.15131-3-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
References: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 28 Jun 2022 13:40:16.0469 (UTC)
 FILETIME=[99D0F050:01D88AF4]
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

Check if the number and size of Radix levels are valid on
POWER9/POWER10 CPUs, according to the supported Radix Tree
Configurations described in their User Manuals.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/mmu-radix64.c | 49 +++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 9a8a2e2875..705bff76be 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -236,17 +236,37 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
     }
 }
 
+static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
+{
+    /*
+     * Check if this is a valid level, according to POWER9 and POWER10
+     * Processor User's Manuals, sections 4.10.4.1 and 5.10.6.1, respectively:
+     * Supported Radix Tree Configurations and Resulting Page Sizes.
+     *
+     * Note: these checks are specific to POWER9 and POWER10 CPUs. Any future
+     * CPUs that supports a different Radix MMU configuration will need their
+     * own implementation.
+     */
+    switch (level) {
+    case 0:     /* Root Page Dir */
+        return psize == 52 && nls == 13;
+    case 1:
+    case 2:
+        return nls == 9;
+    case 3:
+        return nls == 9 || nls == 5;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix level: %d\n", level);
+        return false;
+    }
+}
+
 static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
                                   uint64_t *pte_addr, uint64_t *nls,
                                   int *psize, uint64_t *pte, int *fault_cause)
 {
     uint64_t index, pde;
 
-    if (*nls < 5) { /* Directory maps less than 2**5 entries */
-        *fault_cause |= DSISR_R_BADCONFIG;
-        return 1;
-    }
-
     /* Read page <directory/table> entry from guest address space */
     pde = ldq_phys(as, *pte_addr);
     if (!(pde & R_PTE_VALID)) {         /* Invalid Entry */
@@ -270,12 +290,8 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
                                  hwaddr *raddr, int *psize, uint64_t *pte,
                                  int *fault_cause, hwaddr *pte_addr)
 {
-    uint64_t index, pde, rpn , mask;
-
-    if (nls < 5) { /* Directory maps less than 2**5 entries */
-        *fault_cause |= DSISR_R_BADCONFIG;
-        return 1;
-    }
+    uint64_t index, pde, rpn, mask;
+    int level = 0;
 
     index = eaddr >> (*psize - nls);    /* Shift */
     index &= ((1UL << nls) - 1);       /* Mask */
@@ -283,6 +299,11 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
     do {
         int ret;
 
+        if (!ppc_radix64_is_valid_level(level++, *psize, nls)) {
+            *fault_cause |= DSISR_R_BADCONFIG;
+            return 1;
+        }
+
         ret = ppc_radix64_next_level(as, eaddr, pte_addr, &nls, psize, &pde,
                                      fault_cause);
         if (ret) {
@@ -456,6 +477,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         }
     } else {
         uint64_t rpn, mask;
+        int level = 0;
 
         index = (eaddr & R_EADDR_MASK) >> (*g_page_size - nls); /* Shift */
         index &= ((1UL << nls) - 1);                            /* Mask */
@@ -475,6 +497,11 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                 return ret;
             }
 
+            if (!ppc_radix64_is_valid_level(level++, *g_page_size, nls)) {
+                fault_cause |= DSISR_R_BADCONFIG;
+                return 1;
+            }
+
             ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK, &h_raddr,
                                          &nls, g_page_size, &pte, &fault_cause);
             if (ret) {
-- 
2.25.1


