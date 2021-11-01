Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A5744247E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:07:33 +0100 (CET)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhKu-00037L-Q4
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAw-00046C-PU; Mon, 01 Nov 2021 19:57:14 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAu-0006G2-6a; Mon, 01 Nov 2021 19:57:14 -0400
Received: by mail-qt1-x836.google.com with SMTP id j1so10225536qtq.11;
 Mon, 01 Nov 2021 16:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WXFnmhDjuNgFs9Oakx/MwT1i8F7V5e44dx+cYlP5bIo=;
 b=om8nS1XzOZOmwdKaAUHQ3EI+O3ReVRudv2R1HS05a+qYeSYFgy9fU8jXhLHWp8xEPV
 1UBp/0GFeOf63In0bicVtPGgIL8J8K4lpLB/mi9oiYYPkfUx3CK91B1kgN4ozQdG+IV4
 SU02u5gF84aOPJwrodl7HNXGOiiFLTMysN1ZaKaiRXtiuUcMrO5EWLG7anhSK4IC5pMP
 /XkKeNqbwcq2KCJnt9XGpxUiU79d+zedHYYZCv+qU2p+0zgWXxZjxtlXCZuTTGYJ6u8p
 +YABF8tvnV0p0cq2gfIkPVXsTQdun8kbG8Ve/5knGgEIfatKUlg56H7QfRNafZMiBfLv
 4I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WXFnmhDjuNgFs9Oakx/MwT1i8F7V5e44dx+cYlP5bIo=;
 b=EaRAmjlAu6NbehX+mJfD3oAyUsbiX3wYRkAnpGmXAn9agXIKEFqdin9dYhG96+XKKV
 YLg7bdJmHYPiexl8/cQBX1MR/If5TYVv1aV9sP4BGIufVWKb8dgFjguuXa+TAsOTs5/A
 rnw7y90wDZLhxoQDbQjUMy+vF/Wj/QcGL06Ebd8CSH3Xw/2XnmvD65lFJO2fzrX3CQpK
 3/kcS+4sgueI/INImbINZwFkyL3BOmFk4sQTGdEPhwtY5NEmgbfqApQZpuHJ4MgmsDs2
 KOinP40kjPR37Kix9niZpQ4gVHkF4JYGyvxaWd3AiURz5qSX6uT9sikjbfOT3xpf4nm/
 zy9A==
X-Gm-Message-State: AOAM530XNvQ6lHuZtJ52c07WG+pomqndVkAmHzL1yDKUlmXpmbWXXmju
 /pjaqAYFNj+ZdXNYJQ8xyvuHwjcaFTk=
X-Google-Smtp-Source: ABdhPJw0erRO1vW4dLMKPFOiW7/o4o4axvhbHSD9sOHLb9gcYcO3jeAWuciwn7GnpvH7asmaCKJfWQ==
X-Received: by 2002:ac8:58c2:: with SMTP id u2mr25420319qta.413.1635811030789; 
 Mon, 01 Nov 2021 16:57:10 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/10] target/ppc: enable PMU instruction count
Date: Mon,  1 Nov 2021 20:56:36 -0300
Message-Id: <20211101235642.926773-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PMU is already counting cycles by calculating time elapsed in
nanoseconds. Counting instructions is a different matter and requires
another approach.

This patch adds the capability of counting completed instructions
(Perf event PM_INST_CMPL) by counting the amount of instructions
translated in each translation block right before exiting it.

A new pmu_count_insns() helper in translation.c was added to do that.
After verifying that the PMU is running (MMCR0_FC bit not set), call
helper_insns_inc(). This new helper from power8-pmu.c will add the
instructions to the relevant counters. It'll also be responsible for
triggering counter negative overflows as it is already being done with
cycles.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 |  1 +
 target/ppc/helper.h              |  1 +
 target/ppc/helper_regs.c         |  4 +++
 target/ppc/power8-pmu-regs.c.inc |  6 +++++
 target/ppc/power8-pmu.c          | 39 +++++++++++++++++++++++++++
 target/ppc/translate.c           | 46 ++++++++++++++++++++++++++++++++
 6 files changed, 97 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index bf718334a5..f965436d19 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -655,6 +655,7 @@ enum {
     HFLAGS_PR = 14,  /* MSR_PR */
     HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
     HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
+    HFLAGS_MMCR0FC = 17, /* MMCR0 FC bit */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8e3657afe1..b8a89f02f4 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_2(insns_inc, void, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 99562edd57..875c2fdfc6 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -115,6 +115,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
         hflags |= 1 << HFLAGS_PMCC1;
     }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
+        hflags |= 1 << HFLAGS_MMCR0FC;
+    }
+
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index fbb8977641..a92437b0c4 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -113,6 +113,12 @@ static void write_MMCR0_common(DisasContext *ctx, TCGv val)
      */
     gen_icount_io_start(ctx);
     gen_helper_store_mmcr0(cpu_env, val);
+
+    /*
+     * End the translation block because MMCR0 writes can change
+     * ctx->pmu_frozen.
+     */
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index fdc94d40b2..5f90828aed 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -104,6 +104,31 @@ static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
     return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
 }
 
+static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
+{
+    bool overflow_triggered = false;
+    int sprn;
+
+    /* PMC6 never counts instructions */
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
+        if (!pmc_is_active(env, sprn) ||
+            getPMUEventType(env, sprn) != PMU_EVENT_INSTRUCTIONS) {
+            continue;
+        }
+
+        env->spr[sprn] += num_insns;
+
+        if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL &&
+            pmc_has_overflow_enabled(env, sprn)) {
+
+            overflow_triggered = true;
+            env->spr[sprn] = COUNTER_NEGATIVE_VAL;
+        }
+    }
+
+    return overflow_triggered;
+}
+
 static void pmu_update_cycles(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -259,6 +284,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
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
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 659859ff5f..01bacb573d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -177,6 +177,7 @@ struct DisasContext {
     bool hr;
     bool mmcr0_pmcc0;
     bool mmcr0_pmcc1;
+    bool pmu_frozen;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -4170,6 +4171,31 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 #endif
 }
 
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+static void pmu_count_insns(DisasContext *ctx)
+{
+    /* Do not bother calling the helper if the PMU is frozen */
+    if (ctx->pmu_frozen) {
+        return;
+    }
+
+    /*
+     * The PMU insns_inc() helper stops the internal PMU timer if a
+     * counter overflows happens. In that case, if the guest is
+     * running with icount and we do not handle it beforehand,
+     * the helper can trigger a 'bad icount read'.
+     */
+    gen_icount_io_start(ctx);
+
+    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+}
+#else
+static void pmu_count_insns(DisasContext *ctx)
+{
+    return;
+}
+#endif
+
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
     return translator_use_goto_tb(&ctx->base, dest);
@@ -4180,6 +4206,14 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
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
@@ -4191,6 +4225,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         dest = (uint32_t) dest;
     }
     if (use_goto_tb(ctx, dest)) {
+        pmu_count_insns(ctx);
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
         tcg_gen_exit_tb(ctx->base.tb, n);
@@ -8464,6 +8499,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
     ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
     ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
+    ctx->pmu_frozen = (hflags >> HFLAGS_MMCR0FC) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
@@ -8570,6 +8606,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         if (use_goto_tb(ctx, nip)) {
+            pmu_count_insns(ctx);
             tcg_gen_goto_tb(0);
             gen_update_nip(ctx, nip);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -8580,6 +8617,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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
 
@@ -8587,6 +8632,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_EXIT:
+        pmu_count_insns(ctx);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-- 
2.31.1


