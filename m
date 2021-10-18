Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E325E430D51
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:12:11 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcHCF-0004X4-0k
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2W-0006lY-Qc; Sun, 17 Oct 2021 21:02:13 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:37642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2U-0001NB-OU; Sun, 17 Oct 2021 21:02:08 -0400
Received: by mail-ua1-x934.google.com with SMTP id f4so2786778uad.4;
 Sun, 17 Oct 2021 18:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xxc0QrayLnTzdYodLLcQx5La71tqMn6pFlgKk9oNMCg=;
 b=MgS/yuk9fTpzg7/OKyoNKrAtR4pLN59Uya8VNeLS/hZmhdJLi+P1J1v7QqfcyLe6Hd
 JAnUNZwC2l5ITt9tdN9+jRdduPgxIMcYB20K5yD36JMLxy87Gar7ASfzNCxME1XYK4mo
 ti0DC6NsF9QfOhn4cVXoOmDbokZ1hsAGhyUWr5A0MLqxngBXYw31g97/LCG7F7EKrQpL
 S2e7q9cj+xKJfMuHA01N0KPoAoi+sejJAGtGWixnxEclik4xJ0Ch/Uc6tm4Mby9kuGVf
 kq2wvuUa/8ymCrzxkwBfOWtf7lXhjXep288sEZUtywIoFhWNbherh2MZsqBuzhcuQHVm
 AgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xxc0QrayLnTzdYodLLcQx5La71tqMn6pFlgKk9oNMCg=;
 b=TrbNk+9O/5l2k8BE7YFgbQ1aX7wgd965dgTbiD5w2TDffodxEUW8pJZo3e4Ki3ru6y
 UmAyxNmQS1+4MDRs401D5/wYi0TXYLmDMCowwWqQe0VBX8Hge03OXIlHMvcyiAH86lmS
 rOWDRkT7j2afqlLQqlU6ULHP4tMv+2aTstO7k0A7EFgNAUbIzwTQVePYqIwbey3MmrBn
 pbGqS+dIQgwOm3Opk8Xak0OpiTOSYcVZq+Mx5X0rcxtM0IyTiNdYL1gLRez3KRa2VMnp
 ZI4D22p2kJK7rm73axW7rn6VblwD75mfvpRyTJ9u/K6NhvBIvrvQxYQbWG362A5m3+f6
 rP/A==
X-Gm-Message-State: AOAM5315oCDKuIL9P0zPIP80EidjlSARwTVvtMtKKCMHevGI25zOgQZJ
 3GGBycabKV0AsHZG7zd6jBqyEYtyqv4=
X-Google-Smtp-Source: ABdhPJz2q3es2Q3voqMNzLTgnd2QcLaZHkyf7LBIRq0nXzn75hBlRHrw22EUfP+5wS0IUAqm9bK6TQ==
X-Received: by 2002:ab0:56c1:: with SMTP id c1mr23827281uab.6.1634518925209;
 Sun, 17 Oct 2021 18:02:05 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:02:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/15] target/ppc: enable PMU instruction count
Date: Sun, 17 Oct 2021 22:01:27 -0300
Message-Id: <20211018010133.315842-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
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
X-Mailman-Version: 2.1.23
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
 target/ppc/power8-pmu-regs.c.inc |  6 ++++
 target/ppc/power8-pmu.c          | 41 ++++++++++++++++++++++++++++
 target/ppc/translate.c           | 47 ++++++++++++++++++++++++++++++++
 6 files changed, 100 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 074d844741..185a6166aa 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -665,6 +665,7 @@ enum {
     HFLAGS_PR = 14,  /* MSR_PR */
     HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
     HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
+    HFLAGS_MMCR0FC = 17, /* MMCR0 FC bit */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ea82d08ad5..5814e2f251 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -22,6 +22,7 @@ DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
 DEF_HELPER_2(store_mmcr1, void, env, tl)
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
index 8b3ffd9c1a..f8ca44cfdc 100644
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
index 724a1a4038..e9c6b9dfec 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -102,6 +102,33 @@ static bool pmu_event_has_overflow_enabled(CPUPPCState *env, PMUEvent *event)
     return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
 }
 
+static bool pmu_events_increment_insns(CPUPPCState *env, uint32_t num_insns)
+{
+    bool overflow_triggered = false;
+    int i;
+
+    /* PMC6 never counts instructions. */
+    for (i = 0; i < PMU_EVENTS_NUM - 1; i++) {
+        PMUEvent *event = &env->pmu_events[i];
+
+        if (!pmu_event_is_active(env, event) ||
+            event->type != PMU_EVENT_INSTRUCTIONS) {
+            continue;
+        }
+
+        env->spr[event->sprn] += num_insns;
+
+        if (env->spr[event->sprn] >= COUNTER_NEGATIVE_VAL &&
+            pmu_event_has_overflow_enabled(env, event)) {
+
+            overflow_triggered = true;
+            env->spr[event->sprn] = COUNTER_NEGATIVE_VAL;
+        }
+    }
+
+    return overflow_triggered;
+}
+
 static void pmu_events_update_cycles(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -248,6 +275,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
     return;
 }
 
+/* This helper assumes that the PMC is running. */
+void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
+{
+    bool overflow_triggered;
+    PowerPCCPU *cpu;
+
+    overflow_triggered = pmu_events_increment_insns(env, num_insns);
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
index 96e8703dd1..acc0e50194 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -178,6 +178,7 @@ struct DisasContext {
     bool hr;
     bool mmcr0_pmcc0;
     bool mmcr0_pmcc1;
+    bool pmu_frozen;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -4304,6 +4305,31 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
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
@@ -4318,9 +4344,18 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
         } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
             gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_prep_dbgex(ctx)));
         } else {
+            pmu_count_insns(ctx);
             tcg_gen_exit_tb(NULL, 0);
         }
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
@@ -4332,6 +4367,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         dest = (uint32_t) dest;
     }
     if (use_goto_tb(ctx, dest)) {
+        pmu_count_insns(ctx);
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
         tcg_gen_exit_tb(ctx->base.tb, n);
@@ -8565,6 +8601,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
     ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
     ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
+    ctx->pmu_frozen = (hflags >> HFLAGS_MMCR0FC) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
@@ -8685,6 +8722,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         if (use_goto_tb(ctx, nip)) {
+            pmu_count_insns(ctx);
             tcg_gen_goto_tb(0);
             gen_update_nip(ctx, nip);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -8695,6 +8733,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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
 
@@ -8702,6 +8748,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_EXIT:
+        pmu_count_insns(ctx);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-- 
2.31.1


