Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07974006EE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:46:06 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG4b-0003qm-V7
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqk-0002O0-Fw; Fri, 03 Sep 2021 16:31:46 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqi-0001Yv-2r; Fri, 03 Sep 2021 16:31:46 -0400
Received: by mail-qk1-x736.google.com with SMTP id a66so358520qkc.1;
 Fri, 03 Sep 2021 13:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hpwQ7cw40k9HY/zRh2e0TCaBJdtAYmJpO4wld8jPCmo=;
 b=SINNUzjEZU4dJxIgYaW7/5qxNo90Wl+M1o0J7r0f79yF9AOjhIpw5khUsBMsLFQEC4
 mTNG4bb7UbihwtvIqk+0BuO8JjiLuvJ9y79joehn68rquSjb+8PNY5i7QprIqrjDsuFQ
 YBQqr5e6IBnreLWi7fdj2q0YcZL+uSK/Eke3KnNClalxdxxcPtfNN0sthm6G7M/8dtjl
 Wk+brEyjXTZq90xEl6nPeJVIpYs3o9weFAtWv8zPXdrRkDMj3/BFwdcD2Gle3iVCCG02
 v3QoDbFZUghwT80mcy9cHPuYUBw52nkiWW88mtSrLJjwQrkFLNfpaVMIbqQDoZT6fR14
 EE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hpwQ7cw40k9HY/zRh2e0TCaBJdtAYmJpO4wld8jPCmo=;
 b=Rsh6mJJHbRqoJnU40mNYfkbHSgdhE2JhMu5PsdpzrFW0U75qISBIf81Fzze+R6TPcu
 52XG7RIyJtcB84lK4VHNRiw6tHudX7zZUnLQkQ/KT+b9DtJHdk/2PDt+Y1dpXsYBqUsY
 89MVPEImMYQ7wWPLbenfA2LZtK3MXEMGIr0Tp/GnhCt0aE+JQ9Ifahk9XPVBEPyCOIpr
 +APVbivZDJdNbrbN/7r//fc9vu85ayUd/2hplZ8NfxzZ2rDvjtJOBV7jhBa3QaWMQx11
 9k1cNErn97+7u6JiCue9K2pPnkT6Zk/e1VkNbWk8Zu6WFdh+IJCbivh5SN4M5+t6tDkd
 5KfA==
X-Gm-Message-State: AOAM531Fp3JjHGsr+uSNP1a2yXzqhx8I6lvbFsg3JFTwMCPG4vJnSWpg
 XX4Lv6/qGZHYqHgTXJu+pOfY0787t+8=
X-Google-Smtp-Source: ABdhPJxr7nUfmLgxNrhuwCaOpZqtMHu2+WFtBJxFeAN16Xx69ukfx9YvuSUKvxS3oS+2TG+fE2pwmg==
X-Received: by 2002:a05:620a:4cf:: with SMTP id
 15mr675158qks.316.1630701102646; 
 Fri, 03 Sep 2021 13:31:42 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/15] target/ppc: PMU: add instruction counting
Date: Fri,  3 Sep 2021 17:31:06 -0300
Message-Id: <20210903203116.80628-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
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
helper_insns_inc(). This new helper from power8_pmu.c will add the
instructions to the relevant counters. It'll also be responsible for
triggering counter negative overflows later on.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  1 +
 target/ppc/helper.h      |  1 +
 target/ppc/helper_regs.c |  3 ++
 target/ppc/power8_pmu.c  | 70 ++++++++++++++++++++++++++++++++++++----
 target/ppc/translate.c   | 46 ++++++++++++++++++++++++++
 5 files changed, 114 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 74698a3600..4d4886ac74 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -628,6 +628,7 @@ enum {
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_PR = 14,  /* MSR_PR */
     HFLAGS_PMCCCLEAR = 15, /* PMU MMCR0 PMCC equal to 0b00 */
+    HFLAGS_MMCR0FC = 16, /* MMCR0 FC bit */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5122632784..47dbbe6da1 100644
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
index 4c1d9575ac..27d139edd8 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -109,6 +109,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (((env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) == 0) {
         hflags |= 1 << HFLAGS_PMCCCLEAR;
     }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
+        hflags |= 1 << HFLAGS_MMCR0FC;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 3f7b305f4f..9769c0ff35 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -31,10 +31,13 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
     env->spr[sprn] += time_delta;
 }
 
-static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
-                                        uint64_t time_delta)
+static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
 {
-    uint8_t event, evt_extr;
+    uint8_t evt_extr = 0;
+
+    if (env->spr[SPR_POWER_MMCR1] == 0) {
+        return 0;
+    }
 
     switch (sprn) {
     case SPR_POWER_PMC1:
@@ -50,10 +53,16 @@ static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
         evt_extr = MMCR1_PMC4EVT_EXTR;
         break;
     default:
-        return;
+        return 0;
     }
 
-    event = extract64(env->spr[SPR_POWER_MMCR1], evt_extr, MMCR1_EVT_SIZE);
+    return extract64(env->spr[SPR_POWER_MMCR1], evt_extr, MMCR1_EVT_SIZE);
+}
+
+static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
+                                        uint64_t time_delta)
+{
+    uint8_t event = get_PMC_event(env, sprn);
 
     /*
      * MMCR0_PMC1SEL = 0xF0 is the architected PowerISA v3.1 event
@@ -99,8 +108,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 
     env->spr[SPR_POWER_MMCR0] = value;
 
-    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
-    if ((curr_value & MMCR0_PMCC) != (value & MMCR0_PMCC)) {
+    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_MMCR0FC */
+    if (((curr_value & MMCR0_PMCC) != (value & MMCR0_PMCC)) ||
+        (curr_FC != new_FC)) {
         hreg_compute_hflags(env);
     }
 
@@ -123,4 +133,50 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
     }
 }
 
+static bool pmc_counting_insns(CPUPPCState *env, int sprn)
+{
+    bool ret = false;
+    uint8_t event;
+
+    if (sprn == SPR_POWER_PMC5) {
+        return true;
+    }
+
+    event = get_PMC_event(env, sprn);
+
+    /*
+     * Event 0x2 is an implementation-dependent event that IBM
+     * POWER chips implement (at least since POWER8) that is
+     * equivalent to PM_INST_CMPL. Let's support this event on
+     * all programmable PMCs.
+     *
+     * Event 0xFE is the PowerISA v3.1 architected event to
+     * sample PM_INST_CMPL using PMC1.
+     */
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+        return event == 0x2 || event == 0xFE;
+    case SPR_POWER_PMC2:
+    case SPR_POWER_PMC3:
+    case SPR_POWER_PMC4:
+        return event == 0x2;
+    default:
+        break;
+    }
+
+    return ret;
+}
+
+/* This helper assumes that the PMC is running. */
+void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
+{
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
+        if (pmc_counting_insns(env, sprn)) {
+            env->spr[sprn] += num_insns;
+        }
+    }
+}
+
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c3e2e3d329..b7235a2be0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -176,6 +176,7 @@ struct DisasContext {
     bool tm_enabled;
     bool gtse;
     bool pmcc_clear;
+    bool pmu_frozen;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -411,6 +412,12 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
      */
     gen_icount_io_start(ctx);
     gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
+
+    /*
+     * End the translation block because MMCR0 writes can change
+     * ctx->pmu_frozen.
+     */
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
 #else
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
@@ -4407,6 +4414,22 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
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
+    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+}
+#else
+static void pmu_count_insns(DisasContext *ctx)
+{
+    return;
+}
+#endif
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
     return translator_use_goto_tb(&ctx->base, dest);
@@ -4421,9 +4444,17 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
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
         tcg_gen_lookup_and_goto_ptr();
     }
 }
@@ -4435,6 +4466,8 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         dest = (uint32_t) dest;
     }
     if (use_goto_tb(ctx, dest)) {
+        pmu_count_insns(ctx);
+
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
         tcg_gen_exit_tb(ctx->base.tb, n);
@@ -8648,6 +8681,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
     ctx->pmcc_clear = (hflags >> HFLAGS_PMCCCLEAR) & 1;
+    ctx->pmu_frozen = (hflags >> HFLAGS_MMCR0FC) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
@@ -8767,6 +8801,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         if (use_goto_tb(ctx, nip)) {
+            pmu_count_insns(ctx);
+
             tcg_gen_goto_tb(0);
             gen_update_nip(ctx, nip);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -8777,6 +8813,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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
 
@@ -8784,6 +8828,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_EXIT:
+        pmu_count_insns(ctx);
+
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-- 
2.31.1


