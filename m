Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6024622A4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:58:19 +0100 (CET)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrnj8-0005bV-6u
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrneb-0002y9-0A
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:53:37 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:60903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrneX-0006Xb-Bs
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:53:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D23DD2044C;
 Mon, 29 Nov 2021 20:53:30 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 21:53:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002f98105e2-75fa-41d1-ae23-d65223ed7f17,
 5832CB413B33430C7B7B1B9ECA0BD44D35E8DE25) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 1/1] target/ppc: fix Hash64 MMU update of PTE bit R
Date: Mon, 29 Nov 2021 21:53:27 +0100
Message-ID: <20211129205327.489558-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211129205327.489558-1-clg@kaod.org>
References: <20211129205327.489558-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5f734bbb-e7e7-4c95-8a7f-8fe2a40f0206
X-Ovh-Tracer-Id: 4452371185773415206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddugedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
offset, causing the first byte of the adjacent PTE to be corrupted.
This caused a panic when booting FreeBSD, using the Hash MMU.

Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-hash64.h | 5 +++++
 hw/ppc/spapr.c          | 8 ++++----
 hw/ppc/spapr_softmmu.c  | 2 +-
 target/ppc/mmu-hash64.c | 4 ++--
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index c5b2f97ff74f..1496955d389b 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -97,6 +97,11 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
 #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
 #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
 
+/* PTE offsets */
+#define HPTE64_DW1              (HASH_PTE_SIZE_64 / 2)
+#define HPTE64_DW1_R            (HPTE64_DW1 + 6)
+#define HPTE64_DW1_C            (HPTE64_DW1 + 7)
+
 /* Format changes for ARCH v3 */
 #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
 #define HPTE64_R_3_0_SSIZE_SHIFT 58
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 163c90388af2..3b5fd749be89 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1414,7 +1414,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
         kvmppc_write_hpte(ptex, pte0, pte1);
     } else {
         if (pte0 & HPTE64_V_VALID) {
-            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
+            stq_p(spapr->htab + offset + HPTE64_DW1, pte1);
             /*
              * When setting valid, we write PTE1 first. This ensures
              * proper synchronization with the reading code in
@@ -1430,7 +1430,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
              * ppc_hash64_pteg_search()
              */
             smp_wmb();
-            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
+            stq_p(spapr->htab + offset + HPTE64_DW1, pte1);
         }
     }
 }
@@ -1438,7 +1438,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
 static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
                              uint64_t pte1)
 {
-    hwaddr offset = ptex * HASH_PTE_SIZE_64 + 15;
+    hwaddr offset = ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_C;
     SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
 
     if (!spapr->htab) {
@@ -1454,7 +1454,7 @@ static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
 static void spapr_hpte_set_r(PPCVirtualHypervisor *vhyp, hwaddr ptex,
                              uint64_t pte1)
 {
-    hwaddr offset = ptex * HASH_PTE_SIZE_64 + 14;
+    hwaddr offset = ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_R;
     SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
 
     if (!spapr->htab) {
diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
index f8924270eff5..4ee03c83e48e 100644
--- a/hw/ppc/spapr_softmmu.c
+++ b/hw/ppc/spapr_softmmu.c
@@ -426,7 +426,7 @@ static void new_hpte_store(void *htab, uint64_t pteg, int slot,
     addr += slot * HASH_PTE_SIZE_64;
 
     stq_p(addr, pte0);
-    stq_p(addr + HASH_PTE_SIZE_64 / 2, pte1);
+    stq_p(addr + HPTE64_DW1, pte1);
 }
 
 static int rehash_hpte(PowerPCCPU *cpu,
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46f2..da9fe99ff8bd 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
 
 static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 {
-    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
+    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_R;
 
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc =
@@ -803,7 +803,7 @@ static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 
 static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 {
-    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 15;
+    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_DW1_C;
 
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc =
-- 
2.31.1


