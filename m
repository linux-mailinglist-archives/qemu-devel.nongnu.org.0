Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E595960800E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:44:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxSi-0006LH-Cj; Fri, 21 Oct 2022 15:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvPD-0004OP-2N; Fri, 21 Oct 2022 13:02:00 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvPB-0002Fr-Dt; Fri, 21 Oct 2022 13:01:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 14:01:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 848508001F1;
 Fri, 21 Oct 2022 14:01:33 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH 2/3] target/ppc: Add new PMC HFLAGS
Date: Fri, 21 Oct 2022 14:01:11 -0300
Message-Id: <20221021170112.151393-3-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 21 Oct 2022 17:01:34.0002 (UTC)
 FILETIME=[C6177920:01D8E56E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add 2 new PMC related HFLAGS:
- HFLAGS_PMCJCE - value of MMCR0 PMCjCE bit
- HFLAGS_PMC_OTHER - set if a PMC other than PMC5-6 is enabled

These flags allow further optimization of PMC5 update code, by
allowing frequently tested conditions to be performed at
translation time.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/cpu.h         | 4 +++-
 target/ppc/helper_regs.c | 6 ++++++
 target/ppc/translate.c   | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cca6c4e51c..28b9b8d4e3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -696,7 +696,9 @@ enum {
     HFLAGS_PR = 14,  /* MSR_PR */
     HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
     HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
-    HFLAGS_INSN_CNT = 17, /* PMU instruction count enabled */
+    HFLAGS_PMCJCE = 17, /* MMCR0 PMCjCE bit */
+    HFLAGS_PMC_OTHER = 18, /* PMC other than PMC5-6 is enabled */
+    HFLAGS_INSN_CNT = 19, /* PMU instruction count enabled */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 12235ea2e9..65f5f7b2c0 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -109,6 +109,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
         hflags |= 1 << HFLAGS_PMCC1;
     }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE) {
+        hflags |= 1 << HFLAGS_PMCJCE;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
@@ -119,6 +122,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->pmc_ins_cnt) {
         hflags |= 1 << HFLAGS_INSN_CNT;
     }
+    if (env->pmc_ins_cnt & 0x1e) {
+        hflags |= 1 << HFLAGS_PMC_OTHER;
+    }
 #endif
 
     /*
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e810842925..8fda2cf836 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -177,6 +177,8 @@ struct DisasContext {
     bool hr;
     bool mmcr0_pmcc0;
     bool mmcr0_pmcc1;
+    bool mmcr0_pmcjce;
+    bool pmc_other;
     bool pmu_insn_cnt;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
@@ -7574,6 +7576,8 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
     ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
     ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
+    ctx->mmcr0_pmcjce = (hflags >> HFLAGS_PMCJCE) & 1;
+    ctx->pmc_other = (hflags >> HFLAGS_PMC_OTHER) & 1;
     ctx->pmu_insn_cnt = (hflags >> HFLAGS_INSN_CNT) & 1;
 
     ctx->singlestep_enabled = 0;
-- 
2.25.1


