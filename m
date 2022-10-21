Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D032E607EA1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxJZ-0008U8-Ed; Fri, 21 Oct 2022 15:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvPI-0004Ot-E3; Fri, 21 Oct 2022 13:02:05 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvPF-0002Fr-Tv; Fri, 21 Oct 2022 13:02:03 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 14:01:34 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D5AAA80020E;
 Fri, 21 Oct 2022 14:01:33 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH 3/3] target/ppc: Increment PMC5 with inline insns
Date: Fri, 21 Oct 2022 14:01:12 -0300
Message-Id: <20221021170112.151393-4-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 21 Oct 2022 17:01:34.0346 (UTC)
 FILETIME=[C64BF6A0:01D8E56E]
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

Profiling QEMU during Fedora 35 for PPC64 boot revealed that
6.39% of total time was being spent in helper_insns_inc(), on a
POWER9 machine. To avoid calling this helper every time PMCs had
to be incremented, an inline implementation of PMC5 increment and
check for overflow was developed. This led to a reduction of
about 12% in Fedora's boot time.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/helper.h     |  1 +
 target/ppc/power8-pmu.c | 74 +++++++++++++++++++++--------------------
 target/ppc/power8-pmu.h |  3 ++
 target/ppc/translate.c  | 28 ++++++++++++++--
 4 files changed, 67 insertions(+), 39 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 57eee07256..f8cd00c976 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -29,6 +29,7 @@ DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
 DEF_HELPER_2(insns_inc, void, env, i32)
+DEF_HELPER_1(handle_pmc5_overflow, void, env)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index beeab5c494..1381072b9e 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -22,8 +22,6 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
-#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
-
 static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
 {
     if (sprn == SPR_POWER_PMC1) {
@@ -88,49 +86,47 @@ static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
     bool overflow_triggered = false;
     target_ulong tmp;
 
-    if (unlikely(ins_cnt & 0x1e)) {
-        if (ins_cnt & (1 << 1)) {
-            tmp = env->spr[SPR_POWER_PMC1];
-            tmp += num_insns;
-            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1CE)) {
-                tmp = PMC_COUNTER_NEGATIVE_VAL;
-                overflow_triggered = true;
-            }
-            env->spr[SPR_POWER_PMC1] = tmp;
+    if (ins_cnt & (1 << 1)) {
+        tmp = env->spr[SPR_POWER_PMC1];
+        tmp += num_insns;
+        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1CE)) {
+            tmp = PMC_COUNTER_NEGATIVE_VAL;
+            overflow_triggered = true;
         }
+        env->spr[SPR_POWER_PMC1] = tmp;
+    }
 
-        if (ins_cnt & (1 << 2)) {
-            tmp = env->spr[SPR_POWER_PMC2];
-            tmp += num_insns;
-            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
-                tmp = PMC_COUNTER_NEGATIVE_VAL;
-                overflow_triggered = true;
-            }
-            env->spr[SPR_POWER_PMC2] = tmp;
+    if (ins_cnt & (1 << 2)) {
+        tmp = env->spr[SPR_POWER_PMC2];
+        tmp += num_insns;
+        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+            tmp = PMC_COUNTER_NEGATIVE_VAL;
+            overflow_triggered = true;
+        }
+        env->spr[SPR_POWER_PMC2] = tmp;
+    }
+
+    if (ins_cnt & (1 << 3)) {
+        tmp = env->spr[SPR_POWER_PMC3];
+        tmp += num_insns;
+        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+            tmp = PMC_COUNTER_NEGATIVE_VAL;
+            overflow_triggered = true;
         }
+        env->spr[SPR_POWER_PMC3] = tmp;
+    }
 
-        if (ins_cnt & (1 << 3)) {
-            tmp = env->spr[SPR_POWER_PMC3];
+    if (ins_cnt & (1 << 4)) {
+        target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
+        int sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
+        if (sel == 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
+            tmp = env->spr[SPR_POWER_PMC4];
             tmp += num_insns;
             if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
                 tmp = PMC_COUNTER_NEGATIVE_VAL;
                 overflow_triggered = true;
             }
-            env->spr[SPR_POWER_PMC3] = tmp;
-        }
-
-        if (ins_cnt & (1 << 4)) {
-            target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
-            int sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
-            if (sel == 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
-                tmp = env->spr[SPR_POWER_PMC4];
-                tmp += num_insns;
-                if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
-                    tmp = PMC_COUNTER_NEGATIVE_VAL;
-                    overflow_triggered = true;
-                }
-                env->spr[SPR_POWER_PMC4] = tmp;
-            }
+            env->spr[SPR_POWER_PMC4] = tmp;
         }
     }
 
@@ -310,6 +306,12 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
     raise_ebb_perfm_exception(env);
 }
 
+void helper_handle_pmc5_overflow(CPUPPCState *env)
+{
+    env->spr[SPR_POWER_PMC5] = PMC_COUNTER_NEGATIVE_VAL;
+    fire_PMC_interrupt(env_archcpu(env));
+}
+
 /* This helper assumes that the PMC is running. */
 void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
 {
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 9692dd765e..c0093e2219 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -14,6 +14,9 @@
 #define POWER8_PMU_H
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
+
 void cpu_ppc_pmu_init(CPUPPCState *env);
 void pmu_update_summaries(CPUPPCState *env);
 #else
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 8fda2cf836..5c74684eee 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -36,6 +36,7 @@
 #include "exec/log.h"
 #include "qemu/atomic128.h"
 #include "spr_common.h"
+#include "power8-pmu.h"
 
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
@@ -4263,6 +4264,9 @@ static void pmu_count_insns(DisasContext *ctx)
     }
 
  #if !defined(CONFIG_USER_ONLY)
+    TCGLabel *l;
+    TCGv t0;
+
     /*
      * The PMU insns_inc() helper stops the internal PMU timer if a
      * counter overflows happens. In that case, if the guest is
@@ -4271,8 +4275,26 @@ static void pmu_count_insns(DisasContext *ctx)
      */
     gen_icount_io_start(ctx);
 
-    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
-#else
+    /* Avoid helper calls when only PMC5-6 are enabled. */
+    if (!ctx->pmc_other) {
+        l = gen_new_label();
+        t0 = tcg_temp_new();
+
+        gen_load_spr(t0, SPR_POWER_PMC5);
+        tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
+        gen_store_spr(SPR_POWER_PMC5, t0);
+        /* Check for overflow, if it's enabled */
+        if (ctx->mmcr0_pmcjce) {
+            tcg_gen_brcondi_tl(TCG_COND_LT, t0, PMC_COUNTER_NEGATIVE_VAL, l);
+            gen_helper_handle_pmc5_overflow(cpu_env);
+        }
+
+        gen_set_label(l);
+        tcg_temp_free(t0);
+    } else {
+        gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+    }
+  #else
     /*
      * User mode can read (but not write) PMC5 and start/stop
      * the PMU via MMCR0_FC. In this case just increment
@@ -4285,7 +4307,7 @@ static void pmu_count_insns(DisasContext *ctx)
     gen_store_spr(SPR_POWER_PMC5, t0);
 
     tcg_temp_free(t0);
-#endif /* #if !defined(CONFIG_USER_ONLY) */
+  #endif /* #if !defined(CONFIG_USER_ONLY) */
 }
 #else
 static void pmu_count_insns(DisasContext *ctx)
-- 
2.25.1


