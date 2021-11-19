Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48198457668
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:29:37 +0100 (CET)
Received: from localhost ([::1]:53996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8dj-00051b-RE
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:29:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XB-0004BZ-Lx; Fri, 19 Nov 2021 13:22:49 -0500
Received: from [2607:f8b0:4864:20::92b] (port=35787
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8X9-0001nz-64; Fri, 19 Nov 2021 13:22:48 -0500
Received: by mail-ua1-x92b.google.com with SMTP id l24so23071540uak.2;
 Fri, 19 Nov 2021 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZvO1jek7qpGJN+NUZ+/2K6rGSSpFZuwXwJWkfnP0wI=;
 b=q695Jsjzs3ljAr/J6HM2Nv/UjB/SI3B5z0h5Y8wzToiRhL0ncHWBGFltPmreH3HioI
 ypcF9//JMsuoNorcI/7ro6hFfO2JtaDUh2ASkWUbD6CVzNiPXoLu/osfJY1QQcEJ2y7J
 hvaXssA/o8UIVPkjrChon5nzhGR+Tc/ts/yGs5FFwty0ZxOOOPil/gdAQTw9u7E5+pJU
 TN3RPXsIPCl14Q/qvOaD+grHiwTq6kQcYihZxKV5iJWORgpmIhTn7oCAIwqeXMFiAmm1
 1WPBkmeOtjBuUo44KsvrNcQbWoNvOOXHogRa/d/N9OK0aB1abko0zSWxbnvBetpTqZJe
 FGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZvO1jek7qpGJN+NUZ+/2K6rGSSpFZuwXwJWkfnP0wI=;
 b=kHi+3oUKs9QBf0zC+xDlBl9uHM7wnd2FwccJN3hYtASZ1lRhWXTmKgZwNcYCJyMgGu
 ATy23oP6ka4itbKPpKWmlvOD2R+qZWbXlOOPu+XAoTIdbuqi+32+AAhnoCo7PrYFElI7
 sRi//BSUvUF3vs/Drl4xJHO+FUayGKvCT9t+ktl7Xe6HkqkTFklw4OpLoIbNYIx83E8k
 BmKw0uey8kSwteDt35vWvTkC3nPhbJZP+tbZiX0XcmpkKaB1qNi3AFYX1f82AZEch+LQ
 PMOIjWsS+S/kHEFsGDUOdPY9BxRnUUKMb5TG3MqAfg9aHXoF2ErmmF4z+C7E5mW1yx1t
 b/lw==
X-Gm-Message-State: AOAM531vowW/IwifahuzR8NJNal2rgblmzJITvtZZdbqEwz6LxPQRpNw
 geOKMV95GxNwRLeLlUCyODrBKzPb8SICSA==
X-Google-Smtp-Source: ABdhPJxY/LI3IOhj5I5Bz/XHp2S6eOEZY72wKZ6VBoKPT7+a/qWKEb8NQ9V965eyoUeVoBp8fJQT6Q==
X-Received: by 2002:ab0:6998:: with SMTP id t24mr52563874uaq.60.1637346165910; 
 Fri, 19 Nov 2021 10:22:45 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:22:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 04/10] target/ppc: enable PMU instruction count
Date: Fri, 19 Nov 2021 15:22:10 -0300
Message-Id: <20211119182216.628676-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119182216.628676-1-danielhb413@gmail.com>
References: <20211119182216.628676-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
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
index f6265be974..1b74916faf 100644
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
index ea60a7493c..f397c05f65 100644
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
index 68409b2236..fb44e6bc56 100644
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
+        if (!pmc_is_active(env, sprn, env->spr[SPR_POWER_MMCR0]) ||
+            getPMUEventType(env, sprn) != PMU_EVENT_INSTRUCTIONS) {
+            continue;
+        }
+
+        env->spr[sprn] += num_insns;
+
+        if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL &&
+            pmc_has_overflow_enabled(env, sprn)) {
+
+            overflow_triggered = true;
+            env->spr[sprn] = PMC_COUNTER_NEGATIVE_VAL;
+        }
+    }
+
+    return overflow_triggered;
+}
+
 static void pmu_update_cycles(CPUPPCState *env, uint64_t old_mmcr0)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -266,6 +291,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
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
index 9960df6e18..ccc83d0603 100644
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
@@ -8458,6 +8493,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
     ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
     ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
+    ctx->pmu_frozen = (hflags >> HFLAGS_MMCR0FC) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
@@ -8564,6 +8600,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         if (use_goto_tb(ctx, nip)) {
+            pmu_count_insns(ctx);
             tcg_gen_goto_tb(0);
             gen_update_nip(ctx, nip);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -8574,6 +8611,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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
 
@@ -8581,6 +8626,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_EXIT:
+        pmu_count_insns(ctx);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-- 
2.31.1


