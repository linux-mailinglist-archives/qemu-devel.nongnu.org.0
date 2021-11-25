Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8913545E096
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 19:37:35 +0100 (CET)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqJcj-0008DE-Qn
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 13:37:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mqJYt-0005lc-Je; Thu, 25 Nov 2021 13:33:35 -0500
Received: from [201.28.113.2] (port=25544 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mqJYr-0004S7-Fe; Thu, 25 Nov 2021 13:33:35 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 25 Nov 2021 15:33:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B5906800A6B;
 Thu, 25 Nov 2021 15:33:24 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2] target/ppc: fix Hash64 MMU update of PTE bit R
Date: Thu, 25 Nov 2021 15:33:22 -0300
Message-Id: <20211125183322.47230-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Nov 2021 18:33:25.0029 (UTC)
 FILETIME=[EE99F550:01D7E22A]
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
Changes from v1:
- Add and use a new define for the byte offset of PTE bit R
---
 target/ppc/mmu-hash64.c | 2 +-
 target/ppc/mmu-hash64.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46..0968927744 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
 
 static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
 {
-    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
+    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OFFSET;
 
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc =
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index c5b2f97ff7..40bb901262 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -97,6 +97,9 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
 #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
 #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
 
+/* PTE byte offsets */
+#define HPTE64_R_R_BYTE_OFFSET  14
+
 /* Format changes for ARCH v3 */
 #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
 #define HPTE64_R_3_0_SSIZE_SHIFT 58
-- 
2.25.1


