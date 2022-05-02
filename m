Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9751722F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 17:05:42 +0200 (CEST)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXcL-0002wd-ES
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 11:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXFV-0005ao-Kk; Mon, 02 May 2022 10:42:05 -0400
Received: from [187.72.171.209] (port=26627 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXFT-0003MH-94; Mon, 02 May 2022 10:42:05 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 2 May 2022 11:40:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CE9748001CD;
 Mon,  2 May 2022 11:40:04 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 15/21] target/ppc: Remove msr_dr macro
Date: Mon,  2 May 2022 11:39:28 -0300
Message-Id: <20220502143934.71908-16-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 May 2022 14:40:05.0261 (UTC)
 FILETIME=[835B63D0:01D85E32]
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

msr_dr macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

v2: Remove M_MSR_DR and use FIELD_EX64 instead
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/helper_regs.c |  2 +-
 target/ppc/mmu_common.c  | 10 ++++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

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
index 7f3f6ce5c1..8c2b8acb60 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -228,7 +228,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
         value |= env->msr & MSR_HVB;
     }
     if (!(value & env->msr & R_MSR_IR_MASK) ||
-        ((value >> MSR_DR) & 1) != msr_dr) {
+        !(value & env->msr & R_MSR_DR_MASK)) {
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


