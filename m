Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3445F55D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 20:45:01 +0100 (CET)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqh9Y-0002vy-H6
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 14:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mqh5y-0008BW-Ay; Fri, 26 Nov 2021 14:41:18 -0500
Received: from [201.28.113.2] (port=26909 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mqh5v-0002PV-RB; Fri, 26 Nov 2021 14:41:18 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 26 Nov 2021 16:40:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5F9FC800CFF;
 Fri, 26 Nov 2021 16:40:02 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3] target/ppc: fix Hash64 MMU update of PTE bit R
Date: Fri, 26 Nov 2021 16:39:40 -0300
Message-Id: <20211126193940.52513-2-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Nov 2021 19:40:02.0696 (UTC)
 FILETIME=[67CF4880:01D7E2FD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
offset, causing the first byte of the adjacent PTE to be corrupted.
This caused a panic when booting FreeBSD, using the Hash MMU.

Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
Changes from v2:
- Add new defines for the byte offset of PTE bit C and
  HASH_PTE_SIZE_64 / 2 (pte1)
- Use new defines in hash64 and spapr code
---
 hw/ppc/spapr.c          | 8 ++++----
 hw/ppc/spapr_softmmu.c  | 2 +-
 target/ppc/mmu-hash64.c | 4 ++--
 target/ppc/mmu-hash64.h | 5 +++++
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 163c90388a..8ebf85bad8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1414,7 +1414,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
         kvmppc_write_hpte(ptex, pte0, pte1);
     } else {
         if (pte0 & HPTE64_V_VALID) {
-            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
+            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);
             /*
              * When setting valid, we write PTE1 first. This ensures
              * proper synchronization with the reading code in
@@ -1430,7 +1430,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
              * ppc_hash64_pteg_search()
              */
             smp_wmb();
-            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
+            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);
         }
     }
 }
@@ -1438,7 +1438,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
 static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
                              uint64_t pte1)
 {
-    hwaddr offset = ptex * HASH_PTE_SIZE_64 + 15;
+    hwaddr offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_C_BYTE_OFFSET;
     SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
 
     if (!spapr->htab) {
@@ -1454,7 +1454,7 @@ static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
 static void spapr_hpte_set_r(PPCVirtualHypervisor *vhyp, hwaddr ptex,
                              uint64_t pte1)
 {
-    hwaddr offset = ptex * HASH_PTE_SIZE_64 + 14;
+    hwaddr offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OFFSET;
     SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
 
     if (!spapr->htab) {
diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
index f8924270ef..03676c4448 100644
--- a/hw/ppc/spapr_softmmu.c
+++ b/hw/ppc/spapr_softmmu.c
@@ -426,7 +426,7 @@ static void new_hpte_store(void *htab, uint64_t pteg, int slot,
     addr += slot * HASH_PTE_SIZE_64;
 
     stq_p(addr, pte0);
-    stq_p(addr + HASH_PTE_SIZE_64 / 2, pte1);
+    stq_p(addr + HPTE64_R_BYTE_OFFSET, pte1);
 }
 
 static int rehash_hpte(PowerPCCPU *cpu,
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46..168d397c26 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
 
 static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 {
-    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
+    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OFFSET;
 
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc =
@@ -803,7 +803,7 @@ static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 
 static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 {
-    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 15;
+    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_C_BYTE_OFFSET;
 
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc =
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index c5b2f97ff7..2a46763f70 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -97,6 +97,11 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
 #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
 #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
 
+/* PTE byte offsets */
+#define HPTE64_R_R_BYTE_OFFSET  14
+#define HPTE64_R_C_BYTE_OFFSET  15
+#define HPTE64_R_BYTE_OFFSET    (HASH_PTE_SIZE_64 / 2)
+
 /* Format changes for ARCH v3 */
 #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
 #define HPTE64_R_3_0_SSIZE_SHIFT 58
-- 
2.25.1


