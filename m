Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443BC47D339
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:54:40 +0100 (CET)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n024l-0001on-C7
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wN-0000Sf-MN; Wed, 22 Dec 2021 08:46:00 -0500
Received: from [2607:f8b0:4864:20::829] (port=44579
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wL-00056X-Tb; Wed, 22 Dec 2021 08:45:59 -0500
Received: by mail-qt1-x829.google.com with SMTP id a1so1897228qtx.11;
 Wed, 22 Dec 2021 05:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWx76eIFxNcmOFT7ycxKCFTXwj6bZRNiJ76QbW6TfM0=;
 b=gYOW7aD9hf8DuuYxeB/3Qzckw1YZ4K1Ato9BQ8dG2FqaxVaVhbAIBX4kjgVfkllLk5
 IVehBy5Y3f7vI18+viSzXU/+gUT3zWfzOxvghFmyvrvp2J3ZxN26iUMTEe7Tz2auPYFK
 M2Z5aRPqa3uEsnJCxE+9hFuqQaFvOQIk+ZeCCsTsx/X6sB3facKZkLYVP1roCJ0MYMpT
 7O/IIQlgvF3GfyD2MYe0xxZWTm953AO7UlLE/2/hYrRzXivIIyPQKGAVSnfZfuZaD/60
 ZW5+6bTEG30xWEJK9EPSOGLITj5wdRYbOxMX+9lWvObyxrI5/Y+33mqETCdGPGMV4KWj
 8SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWx76eIFxNcmOFT7ycxKCFTXwj6bZRNiJ76QbW6TfM0=;
 b=TpytId4iUbCf8PSYa4F6MfIVBGv0Wjs2myNNZRt5z1TBci4rjHhUjx46g9A/UDCGwN
 q4VvalAwd/TNe+ftJ6M3hPkG9raacEcKbNpCVoPra1BFCOv8kfOuHiqpugAF0oc/JANa
 1GRwZsH0O8w+5DHeC8pG9OdiimCSWYqp/ZlTJ0A/Hdh5Ai04Kp/9scH4Sm88Xa1qPpD1
 uexFFOkFSQIAqAOeB8Z6fsXYYB/DrQCRa8SzHcBiYLxvqFFijpjaUBWoPzT543licEUM
 WEb1saD3MH0AiBHpo4dTxwZMIFqVVMBLYMqnhDioSUv2Dz9bMfpgizORTCa3jwWVMcNR
 CZfw==
X-Gm-Message-State: AOAM533LPOW29AweTqogz3wcjrjwhU0UZsU6gmUzvb5MRGr7aTYgWZP9
 omFOY4cCdvctQegrBDZnS9mEQp4SzkE=
X-Google-Smtp-Source: ABdhPJwtUnDa3H0L+UjrLICaNsJsICmigtYUPDhx5tXSLL8flv6rLQOC2aYK96Glvms8ocftBrTX5w==
X-Received: by 2002:a05:622a:307:: with SMTP id
 q7mr2107905qtw.330.1640180756481; 
 Wed, 22 Dec 2021 05:45:56 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:56 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] target/ppc/power8-pmu-insn-cnt: add pmu_check_overflow()
Date: Wed, 22 Dec 2021 10:45:19 -0300
Message-Id: <20211222134520.587877-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

pmu_check_overflow() will verify for overflow in the PMC1-5 counters,
firing a performance monitor alert if an overflow happened with the
proper MMCR0 bits set.

The alert is fired by using helper_pmu_overflow().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                  |  1 +
 target/ppc/power8-pmu-insn-cnt.c.inc | 89 ++++++++++++++++++++++++++++
 target/ppc/power8-pmu.c              |  8 +++
 3 files changed, 98 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index fb6cac38b4..4d8193caab 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -26,6 +26,7 @@ DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
 DEF_HELPER_2(insns_inc, void, env, i32)
+DEF_HELPER_1(pmu_overflow, void, env)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index d3dd6d4685..7bd07d8105 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -19,6 +19,7 @@
 #define MMCR1_PMC4_INS_CNT        0x00000002
 #define MMCR1_PMC4_INS_LATCH_CNT  0x000000FA
 
+#define PMC_COUNTER_NEGATIVE_VAL  0x80000000UL
 /*
  * Increments PMC1 checking if MMCR1_PMC1SEL has one of the following
  * events:
@@ -211,6 +212,92 @@ static void pmu_inc_pmc5(DisasContext *ctx)
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
+
+/*
+ * Check for overflow of PMC1-PMC5 counters and call the overflow
+ * helper in case any counter has overflown.
+ */
+static void pmu_check_overflow(DisasContext *ctx)
+{
+    TCGv t_pmc1, t_pmc2, t_pmc3, t_pmc4, t_pmc5;
+    TCGv t0, t1;
+    TCGLabel *l_pmc_overflow;
+    TCGLabel *l_skip_pmc1_overflow;
+    TCGLabel *l_skip_overflow;
+
+    /*
+     * Check if we have overflow bits set and fire an overflow
+     * event if necessary. Skip directly to 'l_pmc_overflow'
+     * right after finding the first overflow.
+     */
+    l_pmc_overflow = gen_new_label();
+    l_skip_pmc1_overflow = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t0, t0, MMCR0_PMC1CE);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t0, MMCR0_PMC1CE, l_skip_pmc1_overflow);
+
+    t_pmc1 = tcg_temp_new();
+    gen_load_spr(t_pmc1, SPR_POWER_PMC1);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t_pmc1, PMC_COUNTER_NEGATIVE_VAL,
+                       l_pmc_overflow);
+
+    gen_set_label(l_skip_pmc1_overflow);
+
+    l_skip_overflow = gen_new_label();
+
+    /*
+     * At this point we're sure PMC1 didn't overflow. If MMCR0_PMCjCE
+     * isn't set we can skip everything since PMC2-5 overflow is
+     * disabled.
+     */
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t1, t1, MMCR0_PMCjCE);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, MMCR0_PMCjCE, l_skip_overflow);
+
+    t_pmc2 = tcg_temp_new();
+    gen_load_spr(t_pmc2, SPR_POWER_PMC2);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t_pmc2, PMC_COUNTER_NEGATIVE_VAL,
+                       l_pmc_overflow);
+
+    t_pmc3 = tcg_temp_new();
+    gen_load_spr(t_pmc3, SPR_POWER_PMC3);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t_pmc3, PMC_COUNTER_NEGATIVE_VAL,
+                       l_pmc_overflow);
+
+    t_pmc4 = tcg_temp_new();
+    gen_load_spr(t_pmc4, SPR_POWER_PMC4);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t_pmc4, PMC_COUNTER_NEGATIVE_VAL,
+                       l_pmc_overflow);
+
+    t_pmc5 = tcg_temp_new();
+    gen_load_spr(t_pmc5, SPR_POWER_PMC5);
+    tcg_gen_brcondi_tl(TCG_COND_LE, t_pmc5, PMC_COUNTER_NEGATIVE_VAL,
+                       l_skip_overflow);
+
+    gen_set_label(l_pmc_overflow);
+
+    /*
+     * The PMU overflow helper manipuilates the internal PMU timer.
+     * In that case, if the guest is running with icount and we do not
+     * handle it beforehand, the helper can trigger a 'bad icount
+     * read'.
+     */
+    gen_icount_io_start(ctx);
+    gen_helper_pmu_overflow(cpu_env);
+
+    gen_set_label(l_skip_overflow);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t_pmc1);
+    tcg_temp_free(t_pmc2);
+    tcg_temp_free(t_pmc3);
+    tcg_temp_free(t_pmc4);
+    tcg_temp_free(t_pmc5);
+}
 #endif /* #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
 
 #if defined(TARGET_PPC64)
@@ -254,6 +341,8 @@ static void pmu_count_insns(DisasContext *ctx)
 
     gen_set_label(l_skip_pmc14);
 
+    pmu_check_overflow(ctx);
+
     tcg_temp_free(t_mmcr0);
     tcg_temp_free(t_mmcr1);
 
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 08d1902cd5..6696c9b3ae 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -323,6 +323,14 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
     }
 }
 
+/* Helper to fire a PMC interrupt from TCG code */
+void helper_pmu_overflow(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    fire_PMC_interrupt(cpu);
+}
+
 static void cpu_ppc_pmu_timer_cb(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
-- 
2.33.1


