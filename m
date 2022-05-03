Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC785191AA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:49:31 +0200 (CEST)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1Kk-0005fT-9V
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz7e-0006wU-T7; Tue, 03 May 2022 16:27:53 -0400
Received: from [187.72.171.209] (port=8548 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz7d-0005tQ-HX; Tue, 03 May 2022 16:27:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 3 May 2022 17:25:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0490F800491;
 Tue,  3 May 2022 17:25:39 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v3 15/21] target/ppc: Remove msr_dr macro
Date: Tue,  3 May 2022 17:24:35 -0300
Message-Id: <20220503202441.129549-16-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2022 20:25:39.0431 (UTC)
 FILETIME=[F44C6770:01D85F2B]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

msr_dr macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

v3: Fix the difference check to use a xor
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/helper_regs.c |  3 +--
 target/ppc/mmu_common.c  | 10 ++++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 18d41e7af4..ff52eef304 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -364,6 +364,7 @@ FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, IR, MSR_IR, 1)
+FIELD(MSR, DR, MSR_DR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
@@ -485,7 +486,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
-#define msr_dr   ((env->msr >> MSR_DR)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 6cd7b5ece3..555ea73dc1 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -227,8 +227,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
         value &= ~MSR_HVB;
         value |= env->msr & MSR_HVB;
     }
-    if (((value ^ env->msr) & R_MSR_IR_MASK) ||
-        ((value >> MSR_DR) & 1) != msr_dr) {
+    if ((value ^ env->msr) & (R_MSR_IR_MASK | R_MSR_DR_MASK)) {
         cpu_interrupt_exittb(cs);
     }
     if ((env->mmu_model == POWERPC_MMU_BOOKE ||
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 30deca0425..89107a6af2 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -388,7 +388,8 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                   " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
                   " ir=%d dr=%d pr=%d %d t=%d\n",
                   eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr,
-                  (int)FIELD_EX64(env->msr, MSR, IR), (int)msr_dr, pr ? 1 : 0,
+                  (int)FIELD_EX64(env->msr, MSR, IR),
+                  (int)FIELD_EX64(env->msr, MSR, DR), pr ? 1 : 0,
                   access_type == MMU_DATA_STORE, type);
     pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
     hash = vsid ^ pgidx;
@@ -627,7 +628,8 @@ found_tlb:
 
     /* Check the address space */
     if ((access_type == MMU_INST_FETCH ?
-        FIELD_EX64(env->msr, MSR, IR) : msr_dr) != (tlb->attr & 1)) {
+        FIELD_EX64(env->msr, MSR, IR) :
+        FIELD_EX64(env->msr, MSR, DR)) != (tlb->attr & 1)) {
         qemu_log_mask(CPU_LOG_MMU, "%s: AS doesn't match\n", __func__);
         return -1;
     }
@@ -1170,8 +1172,8 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
                                      int mmu_idx)
 {
     int ret = -1;
-    bool real_mode = (type == ACCESS_CODE && !FIELD_EX64(env->msr, MSR, IR))
-        || (type != ACCESS_CODE && msr_dr == 0);
+    bool real_mode = (type == ACCESS_CODE && !FIELD_EX64(env->msr, MSR, IR)) ||
+                     (type != ACCESS_CODE && !FIELD_EX64(env->msr, MSR, DR));
 
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
-- 
2.25.1


