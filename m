Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF87850C03A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:20:33 +0200 (CEST)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhypU-0000SO-Ti
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyST-0005P7-2p; Fri, 22 Apr 2022 14:56:45 -0400
Received: from [187.72.171.209] (port=10601 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySR-0000Zc-9l; Fri, 22 Apr 2022 14:56:44 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 21CB980031F;
 Fri, 22 Apr 2022 15:54:55 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 14/20] target/ppc: Substitute msr_ir macro with new M_MSR_IR
 macro
Date: Fri, 22 Apr 2022 15:54:44 -0300
Message-Id: <20220422185450.107256-15-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:55.0452 (UTC)
 FILETIME=[74E3E1C0:01D8567A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/helper_regs.c |  2 +-
 target/ppc/mmu_common.c  | 11 ++++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e26530fa09..cc0b5d72de 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -362,6 +362,7 @@ typedef enum {
 #define M_MSR_PR (1ull << MSR_PR)
 #define M_MSR_FP (1ull << MSR_FP)
 #define M_MSR_ME (1ull << MSR_ME)
+#define M_MSR_IR (1ull << MSR_IR)
 #define M_MSR_DS (1ull << MSR_DS)
 #define M_MSR_LE (1ull << MSR_LE)
 
@@ -483,7 +484,6 @@ typedef enum {
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
-#define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 2742938abf..fa8f213cd5 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -227,7 +227,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
         value &= ~MSR_HVB;
         value |= env->msr & MSR_HVB;
     }
-    if (((value >> MSR_IR) & 1) != msr_ir ||
+    if (!(value & env->msr & M_MSR_IR) ||
         ((value >> MSR_DR) & 1) != msr_dr) {
         cpu_interrupt_exittb(cs);
     }
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index a82649f2ff..918c15f78d 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -388,7 +388,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                   " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
                   " ir=%d dr=%d pr=%d %d t=%d\n",
                   eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr,
-                  (int)msr_ir, (int)msr_dr, pr ? 1 : 0,
+                  !!(env->msr & M_MSR_IR), (int)msr_dr, pr ? 1 : 0,
                   access_type == MMU_DATA_STORE, type);
     pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
     hash = vsid ^ pgidx;
@@ -626,7 +626,8 @@ found_tlb:
     }
 
     /* Check the address space */
-    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb->attr & 1)) {
+    if ((access_type == MMU_INST_FETCH ?
+        !!(env->msr & M_MSR_IR) : msr_dr) != (tlb->attr & 1)) {
         qemu_log_mask(CPU_LOG_MMU, "%s: AS doesn't match\n", __func__);
         return -1;
     }
@@ -839,7 +840,7 @@ found_tlb:
     if (access_type == MMU_INST_FETCH) {
         /* There is no way to fetch code using epid load */
         assert(!use_epid);
-        as = msr_ir;
+        as = env->msr & M_MSR_IR;
     }
 
     if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
@@ -1169,7 +1170,7 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
                                      int mmu_idx)
 {
     int ret = -1;
-    bool real_mode = (type == ACCESS_CODE && msr_ir == 0)
+    bool real_mode = (type == ACCESS_CODE && !(env->msr & M_MSR_IR))
         || (type != ACCESS_CODE && msr_dr == 0);
 
     switch (env->mmu_model) {
@@ -1231,7 +1232,7 @@ static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
     bool use_epid = mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
 
     if (access_type == MMU_INST_FETCH) {
-        as = msr_ir;
+        as = env->msr & M_MSR_IR;
     }
     env->spr[SPR_BOOKE_MAS0] = env->spr[SPR_BOOKE_MAS4] & MAS4_TLBSELD_MASK;
     env->spr[SPR_BOOKE_MAS1] = env->spr[SPR_BOOKE_MAS4] & MAS4_TSIZED_MASK;
-- 
2.25.1


