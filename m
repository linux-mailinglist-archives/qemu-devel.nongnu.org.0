Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331F3F62D2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:39:12 +0200 (CEST)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZSB-000344-EQ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKL-000866-4e; Tue, 24 Aug 2021 12:31:05 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:42931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKI-0008RU-Se; Tue, 24 Aug 2021 12:31:04 -0400
Received: by mail-qk1-x733.google.com with SMTP id t4so9426415qkb.9;
 Tue, 24 Aug 2021 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=An7gS3IkB4TXiUnZwrrpHIr+cVxxviucVHiwYv6zpKc=;
 b=WzLsitmt0CLravgb0jvRIB5LFJaUJtc4t5ZtaNcI1Y2XlaI+tMHFrA+2GVd3ivDFuV
 N424G2fY0uNkgSPZeKRcTMB2s719Efk0uoQNfzQ7HW5kkzgmZlepsdxlBg/5rfd5sq5g
 IivsevW7h4HBuJSW+A+5nXg5sYQoLgbSGALtpax0/pm1r4RK5ZIQBOf1ocfI7l+3TN1F
 J4CrW4a05j+/16urVBFMSOxz7ovo3tddzjCA43K41o0hOiG8Qivp8++uVUvEcZ9YO4Jz
 U7IroIHS20AZ4hfEP6mDswf3ZR06pKtY0SivheF6wEsX41VeqPwyeOTUfM4wbt4Qa3ek
 Wl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=An7gS3IkB4TXiUnZwrrpHIr+cVxxviucVHiwYv6zpKc=;
 b=YJpRtGHHlEwXkpleowNh5KJZ+T/9UjMa/0i0QKPAjc3cuTc66LNGWRVqQW9QyvltHf
 4rT9B5qKdefPdGkfn5Kxgcr3R6fsPccoNtsXbJMlClSg1LcJgUMnUYoulW4oXDdCuNh6
 2v7zObqJFjaIInrGDGnW0Q3jtph1oxJO70b3YaNjLJ/xCZ7wQdjcmJpJw057SORfFm/G
 FhwhPl0t9OOtRIWbGvMyy58hAwHIV+dgPey7agiTd/Zy+cekbVNu5NsJhYIZ/P8Clkpe
 42oX3TLaAQdg3+pEFSQeIGCJfZY2Z1saDovuZHr7E/TdEykuIeXybMXN8SN3gE843YB/
 K/Yg==
X-Gm-Message-State: AOAM532+pmsZgK+n4qVTefUsOtF9r6HCnvJxC/xF1uJZB23SN8lTGkzK
 CAKp8Nu392ENJdy5OaMApKcq7J/zkY0=
X-Google-Smtp-Source: ABdhPJwZo84+tVP6YrDsEUH42T2ugVY+vcmi27J1x785fD86mmlXnWJOsIVFXtnUcCrPwK4VI0T41g==
X-Received: by 2002:a05:620a:2215:: with SMTP id
 m21mr14996794qkh.86.1629822661313; 
 Tue, 24 Aug 2021 09:31:01 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/16] target/ppc: PMU: add instruction counting
Date: Tue, 24 Aug 2021 13:30:22 -0300
Message-Id: <20210824163032.394099-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
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
After verifying that the PMU is running (MMCR0_FC bit not set), we
call helper_insns_inc(). This is new helper from power8_pmu.c that
will add the instructions to the relevant counters.

At this moment helper_insns_inc() is just summing instructions to
counters, but it will also trigger counter negative overflow in a
later patch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h     |  1 +
 target/ppc/power8_pmu.c | 61 ++++++++++++++++++++++++++++++++++++++---
 target/ppc/translate.c  | 46 +++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+), 4 deletions(-)

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
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 007007824d..311eaa358f 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -31,10 +31,9 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
     env->spr[sprn] += time_delta;
 }
 
-static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
-                                        uint64_t time_delta)
+static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
 {
-    uint8_t event;
+    int event = 0x0;
 
     switch (sprn) {
     case SPR_POWER_PMC1:
@@ -53,9 +52,17 @@ static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
         event = MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
         break;
     default:
-        return;
+        break;
     }
 
+    return event;
+}
+
+static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
+                                        uint64_t time_delta)
+{
+    uint8_t event = get_PMC_event(env, sprn);
+
     /*
      * MMCR0_PMC1SEL = 0xF0 is the architected PowerISA v3.1 event
      * that counts cycles using PMC1.
@@ -124,4 +131,50 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
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
index e4f75ba380..d45ce79a3e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4425,6 +4425,30 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 #endif
 }
 
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+static void pmu_count_insns(DisasContext *ctx)
+{
+    TCGv t_mmcr0FC = tcg_constant_i64(MMCR0_FC);
+    TCGv t0 = tcg_temp_new();
+    TCGLabel *l_exit = gen_new_label();
+
+    /* Do not bother calling the helper if the PMU is frozen */
+    gen_load_spr(t0, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t0, t0, MMCR0_FC);
+    tcg_gen_brcond_tl(TCG_COND_EQ, t0, t_mmcr0FC, l_exit);
+
+    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+
+    gen_set_label(l_exit);
+    tcg_temp_free(t_mmcr0FC);
+    tcg_temp_free(t0);
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
@@ -4439,9 +4463,17 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
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
@@ -4453,6 +4485,8 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         dest = (uint32_t) dest;
     }
     if (use_goto_tb(ctx, dest)) {
+        pmu_count_insns(ctx);
+
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
         tcg_gen_exit_tb(ctx->base.tb, n);
@@ -8785,6 +8819,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         if (use_goto_tb(ctx, nip)) {
+            pmu_count_insns(ctx);
+
             tcg_gen_goto_tb(0);
             gen_update_nip(ctx, nip);
             tcg_gen_exit_tb(ctx->base.tb, 0);
@@ -8795,6 +8831,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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
 
@@ -8802,6 +8846,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_update_nip(ctx, nip);
         /* fall through */
     case DISAS_EXIT:
+        pmu_count_insns(ctx);
+
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-- 
2.31.1


