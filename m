Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B34651B7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:31:20 +0100 (CET)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRZm-0007zM-Ge
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:31:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMz-0006hz-QI; Wed, 01 Dec 2021 10:18:05 -0500
Received: from [2607:f8b0:4864:20::a36] (port=45995
 helo=mail-vk1-xa36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMw-0003LM-Q8; Wed, 01 Dec 2021 10:18:04 -0500
Received: by mail-vk1-xa36.google.com with SMTP id m19so16346046vko.12;
 Wed, 01 Dec 2021 07:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pQHoz/YRDxjdkdAhCEgsohHu3VNA78VpXWc5Ck1HNps=;
 b=Zqp4BsH+cIXElXQEla4GR4MEDq3UvvLfSrcLtKbDLkwy7L36a/y6qL+6i9eH9cQyUt
 /rS7UYtbSqUYK+K6XuF/OeL1vBK04l+Tg2/8mmTa/flgOO3yrLuKKQdTVpfkBx5RftrU
 FmJHNck+jvdiJNfxCZYntY4Bd3vFazXW4YeUSP8t80KzdCn8gu+9SNNXalnKkWuyAt5x
 gnN0zFMy8sh4VZ+DLPIAQ4AM3mA/7Z0jgf9RAOq4MFESlBcLLAn7j5ggJSwtc6lVeiaW
 GKFVhvcB51mm608tkaRCugjWIfJMdIbmvcNuXbv3yTNwarml8K09NlrUzByzzUgrVqqb
 CvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQHoz/YRDxjdkdAhCEgsohHu3VNA78VpXWc5Ck1HNps=;
 b=wID4NtwqUfdUwsG+Q8685NeeT0LYVqvIHlnbcEo58uUkujwYHFtKmg2urDXmbkRs1b
 pecq+bCUUtaxNvM/pz9/6pjojvLgwmEF88z8EVwKEQV8g0jpWgHyzSTxjW/e8k3lVpz0
 aqlMpP9bo9xEVH9lahUS1yk6EpabLBfnHwxgt6eUNV70+gflXovHqpIYnRDb1kz+dKgl
 e7+mxLXkx8sOjg61UvL857HXlgNDmtlMuUF8m1SviWE+1kBUSxsVKmLS3kgQljNtHaw7
 7nYq/4uQTlxpB2rzEf1tZd1SFL39b2XLo2iqVp9dkYRiPq14OvNVGlEhlQ8SnCM/P/q+
 NatQ==
X-Gm-Message-State: AOAM5317nhBRQTrh1Hoys2EKMVLmVn8XAlMKyoCyZvQIgdvVGKFKtSna
 WOo0KimlWuU+FdKI9ay80NG/vhnE4Cg=
X-Google-Smtp-Source: ABdhPJyocyJc5TY98pvAhve08WeQAQRncdjHe9kBDsgXU1sh0gb/IZU7pEcLCRRmDsdZIf0OaIb/gg==
X-Received: by 2002:a05:6122:1350:: with SMTP id
 f16mr8708113vkp.10.1638371881360; 
 Wed, 01 Dec 2021 07:18:01 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:18:01 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/10] target/ppc: enable PMU instruction count
Date: Wed,  1 Dec 2021 12:17:30 -0300
Message-Id: <20211201151734.654994-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
References: <20211201151734.654994-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PMU is already counting cycles by calculating time elapsed in
nanoseconds. Counting instructions is a different matter and requires
another approach.

This patch adds the capability of counting completed instructions (Perf
event PM_INST_CMPL) by counting the amount of instructions translated in
each translation block right before exiting it.

A new pmu_count_insns() helper in translation.c was added to do that.
After verifying that the PMU is counting instructions, call
helper_insns_inc(). This new helper from power8-pmu.c will add the
instructions to the relevant counters. It'll also be responsible for
triggering counter negative overflows as it is already being done with
cycles.

To verify whether the PMU is counting instructions or now, a new hflags
named 'HFLAGS_INSN_CNT' is introduced. This flag will match the internal
state of the PMU. We're be using this flag to avoid calling
helper_insn_inc() when we do not have a valid instruction event being
sampled.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 |  1 +
 target/ppc/helper.h              |  1 +
 target/ppc/helper_regs.c         |  7 ++++
 target/ppc/power8-pmu-regs.c.inc |  6 +++
 target/ppc/power8-pmu.c          | 67 +++++++++++++++++++++++++++++++-
 target/ppc/power8-pmu.h          |  1 +
 target/ppc/translate.c           | 64 ++++++++++++++++++++++++++++++
 7 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f562d5b933..28a185fb25 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -655,6 +655,7 @@ enum {
     HFLAGS_PR = 14,  /* MSR_PR */
     HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
     HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
+    HFLAGS_INSN_CNT = 17, /* PMU instruction count enabled */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 94b4690375..d8a23e054a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -24,6 +24,7 @@ DEF_HELPER_2(store_mmcr0, void, env, tl)
 DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
+DEF_HELPER_2(insns_inc, void, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 99562edd57..b847928842 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "helper_regs.h"
+#include "power8-pmu.h"
 
 /* Swap temporary saved registers with GPRs */
 void hreg_swap_gpr_tgpr(CPUPPCState *env)
@@ -121,6 +122,12 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
         hflags |= 1 << HFLAGS_HV;
     }
 
+#if defined(TARGET_PPC64)
+    if (pmu_insn_cnt_enabled(env)) {
+        hflags |= 1 << HFLAGS_INSN_CNT;
+    }
+#endif
+
     /*
      * This is our encoding for server processors. The architecture
      * specifies that there is no such thing as userspace with
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 25b13ad564..2bab6cece7 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -113,6 +113,12 @@ static void write_MMCR0_common(DisasContext *ctx, TCGv val)
      */
     gen_icount_io_start(ctx);
     gen_helper_store_mmcr0(cpu_env, val);
+
+    /*
+     * End the translation block because MMCR0 writes can change
+     * ctx->pmu_insn_cnt.
+     */
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 399234a2fc..e163ba5640 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -112,6 +112,54 @@ static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
     return evt_type;
 }
 
+bool pmu_insn_cnt_enabled(CPUPPCState *env)
+{
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
+        if (pmc_get_event(env, sprn) == PMU_EVENT_INSTRUCTIONS) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
+{
+    bool overflow_triggered = false;
+    int sprn;
+
+    /* PMC6 never counts instructions */
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
+        if (pmc_get_event(env, sprn) != PMU_EVENT_INSTRUCTIONS) {
+            continue;
+        }
+
+        env->spr[sprn] += num_insns;
+
+        if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL &&
+            pmc_has_overflow_enabled(env, sprn)) {
+
+            overflow_triggered = true;
+
+            /*
+             * The real PMU will always trigger a counter overflow with
+             * PMC_COUNTER_NEGATIVE_VAL. We don't have an easy way to
+             * do that since we're counting block of instructions at
+             * the end of each translation block, and we're probably
+             * passing this value at this point.
+             *
+             * Let's write PMC_COUNTER_NEGATIVE_VAL to the overflowed
+             * counter to simulate what the real hardware would do.
+             */
+            env->spr[sprn] = PMC_COUNTER_NEGATIVE_VAL;
+        }
+    }
+
+    return overflow_triggered;
+}
+
 static void pmu_update_cycles(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -195,7 +243,7 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 
     env->spr[SPR_POWER_MMCR0] = value;
 
-    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
+    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_INSN_CNT */
     hreg_compute_hflags(env);
 
     /* Update cycle overflow timers with the current MMCR0 state */
@@ -207,6 +255,9 @@ void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
     pmu_update_cycles(env);
 
     env->spr[SPR_POWER_MMCR1] = value;
+
+    /* MMCR1 writes can change HFLAGS_INSN_CNT */
+    hreg_compute_hflags(env);
 }
 
 target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
@@ -237,6 +288,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
     return;
 }
 
+/* This helper assumes that the PMC is running. */
+void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
+{
+    bool overflow_triggered;
+    PowerPCCPU *cpu;
+
+    overflow_triggered = pmu_increment_insns(env, num_insns);
+
+    if (overflow_triggered) {
+        cpu = env_archcpu(env);
+        fire_PMC_interrupt(cpu);
+    }
+}
+
 static void cpu_ppc_pmu_timer_cb(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 49a813a443..3ee4b4cda5 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -21,5 +21,6 @@
 #include "qemu/main-loop.h"
 
 void cpu_ppc_pmu_init(CPUPPCState *env);
+bool pmu_insn_cnt_enabled(CPUPPCState *env);
 
 #endif
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9960df6e18..896b916021 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -177,6 +177,7 @@ struct DisasContext {
     bool hr;
     bool mmcr0_pmcc0;
     bool mmcr0_pmcc1;
+    bool pmu_insn_cnt;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -4170,6 +4171,49 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 #endif
 }
 
+#if defined(TARGET_PPC64)
+static void pmu_count_insns(DisasContext *ctx)
+{
+    /*
+     * Do not bother calling the helper if the PMU isn't counting
+     * instructions.
+     */
+    if (!ctx->pmu_insn_cnt) {
+        return;
+    }
+
+ #if !defined(CONFIG_USER_ONLY)
+    /*
+     * The PMU insns_inc() helper stops the internal PMU timer if a
+     * counter overflows happens. In that case, if the guest is
+     * running with icount and we do not handle it beforehand,
+     * the helper can trigger a 'bad icount read'.
+     */
+    gen_icount_io_start(ctx);
+
+    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+#else
+    /*
+     * User mode can read (but not write) PMC5 and start/stop
+     * the PMU via MMCR0_FC. In this case just increment
+     * PMC5 with base.num_insns.
+     */
+    TCGv t0 = tcg_temp_new();
+
+    gen_load_spr(t0, SPR_POWER_PMC5);
+    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC5, t0);
+
+    tcg_temp_free(t0);
+#endif /* #if !defined(CONFIG_USER_ONLY) */
+}
+#else
+static void pmu_count_insns(DisasContext *ctx)
+{
+    return;
+}
+#endif /* #if defined(TARGET_PPC64) */
+
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
     return translator_use_goto_tb(&ctx->base, dest);
@@ -4180,6 +4224,14 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
     if (unlikely(ctx->singlestep_enabled)) {
         gen_debug_exception(ctx);
     } else {
+        /*
+         * tcg_gen_lookup_and_goto_ptr will exit the TB if
+         * CF_NO_GOTO_PTR is set. Count insns now.
+         */
+        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
+            pmu_count_insns(ctx);
+        }
+
         tcg_gen_lookup_and_goto_ptr();
     }
 }
@@ -4191,6 +4243,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         dest = (uint32_t) dest;
     }
     if (use_goto_tb(ctx, dest)) {
+        pmu_count_insns(ctx);
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
         tcg_gen_exit_tb(ctx->base.tb, n);
@@ -8458,6 +8511,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
     ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
     ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
+    ctx->pmu_insn_cnt = (hflags >> HFLAGS_INSN_CNT) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
@@ -8564,6 +8618,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         if (use_goto_tb(ctx, nip)) {
+            pmu_count_insns(ctx);
             tcg_gen_goto_tb(0);
             gen_update_nip(ctx, nip);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -8574,6 +8629,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_CHAIN:
+        /*
+         * tcg_gen_lookup_and_goto_ptr will exit the TB if
+         * CF_NO_GOTO_PTR is set. Count insns now.
+         */
+        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
+            pmu_count_insns(ctx);
+        }
+
         tcg_gen_lookup_and_goto_ptr();
         break;
 
@@ -8581,6 +8644,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_EXIT:
+        pmu_count_insns(ctx);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-- 
2.31.1


