Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E611347E8C0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:26:10 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0UfC-0007s4-2l
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:26:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXs-0003cw-Ur; Thu, 23 Dec 2021 15:18:37 -0500
Received: from [2607:f8b0:4864:20::92a] (port=41701
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXr-0004Nb-74; Thu, 23 Dec 2021 15:18:36 -0500
Received: by mail-ua1-x92a.google.com with SMTP id p37so11806815uae.8;
 Thu, 23 Dec 2021 12:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q+cJJo0Yu+hVDoZwEJif6PwX0qnJMxfhnSWTNhJ5kAQ=;
 b=HI/VCnmbFH02gOZEwvzrp/yyPOl1Y57/oIAcUx8h0QLLnVMoYCTYjJPG4yqSNw1SD1
 if6pZjYofoJITg2Laq8g1nN9/CcAyzUghxo8isaXvGspjIRTuyNT8wemn0orZ+0yorNt
 /1TlpE6GHTQ+nu0VvydxqBJkUjqJM4qsblwDtfJxd2QCaSLgdgjkRaq26ralYHFzJP5x
 CK96kPVAUzBxB2hZR54A/VgDy5oCPzAom9jSBP57htKvbfukVHR5LZtOwXfz2VpxXS1V
 Yyu9b6aXYMA99IQ8czJ2tFaUHha7Yx2YCMONVdlY5aXN8DYYTIxsDlGu56oy5TfS684n
 qQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q+cJJo0Yu+hVDoZwEJif6PwX0qnJMxfhnSWTNhJ5kAQ=;
 b=Apcr7hfYaaF5nlM9FXgKLD6XeKt7J6vAdqicA5qntAl8yQExpRpPN7XT6USyUmtk2Z
 xrD+G2fMJppzrbIChPTp8Wihb2Na3mE0RUi+XVF3XpCLhCTRYplJGlZ7lfYNZ54pP7Tk
 MucTLFWpv5vnCqHEMt5Zm0PixEl6awbYHtjbp4iNYpHottN6esjlv79Tx2MAQad4WllY
 M7t6AbBsgkoa7v9J1bdk4HTEx8/1e5xMnwGnO650aCbzsTU7xwMs9I/lpsudCHG2SicX
 KNS7hVQbna8D046EudKr/kC4qoytR9onwUObBbyJ1kS9OWCbvUKnyNV3inzi3+r4lVMP
 sj1g==
X-Gm-Message-State: AOAM533hj+OeUnXrqI8O2t1JueNGLEmp3lZrP8Qtk9MXQODDnXMm8eCK
 +hL4LMmhRb5gXBH4g+Z702sUcWvXKMw=
X-Google-Smtp-Source: ABdhPJyr30uliMxYNpzzaAeDX+fDvqh9yUHPX9sGVAcZ1XqsQagr2WVhmVXb5DolCSyLG1thvZdZhg==
X-Received: by 2002:a05:6102:2274:: with SMTP id
 v20mr1437254vsd.40.1640290713924; 
 Thu, 23 Dec 2021 12:18:33 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id f20sm1185114vsl.31.2021.12.23.12.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 12:18:33 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] target/ppc/power8-pmu.c: remove helper_insns_inc()
Date: Thu, 23 Dec 2021 17:18:12 -0300
Message-Id: <20211223201812.846495-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223201812.846495-1-danielhb413@gmail.com>
References: <20211223201812.846495-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
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

After moving all the instruction counting to TCG Ops code
this helper is not needed anymore.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                  |  1 -
 target/ppc/power8-pmu-insn-cnt.c.inc |  4 --
 target/ppc/power8-pmu.c              | 60 ----------------------------
 3 files changed, 65 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4d8193caab..de80e82ebe 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -25,7 +25,6 @@ DEF_HELPER_2(store_mmcr0, void, env, tl)
 DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
-DEF_HELPER_2(insns_inc, void, env, i32)
 DEF_HELPER_1(pmu_overflow, void, env)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index 6e0e4e1270..adb796c1c1 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -126,10 +126,6 @@ static void pmu_check_overflow(DisasContext *ctx)
 #if defined(TARGET_PPC64)
 static void pmu_count_insns(DisasContext *ctx)
 {
-    /*
-     * Do not bother calling the helper if the PMU isn't counting
-     * instructions.
-     */
     if (!ctx->pmu_insn_cnt) {
         return;
     }
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 6696c9b3ae..bfc052b49e 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -135,52 +135,6 @@ bool pmu_insn_cnt_enabled(CPUPPCState *env)
     return false;
 }
 
-static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
-{
-    bool overflow_triggered = false;
-    int sprn;
-
-    /* PMC6 never counts instructions */
-    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        PMUEventType evt_type = pmc_get_event(env, sprn);
-        bool insn_event = evt_type == PMU_EVENT_INSTRUCTIONS ||
-                          evt_type == PMU_EVENT_INSN_RUN_LATCH;
-
-        if (pmc_is_inactive(env, sprn) || !insn_event) {
-            continue;
-        }
-
-        if (evt_type == PMU_EVENT_INSTRUCTIONS) {
-            env->spr[sprn] += num_insns;
-        }
-
-        if (evt_type == PMU_EVENT_INSN_RUN_LATCH &&
-            env->spr[SPR_CTRL] & CTRL_RUN) {
-            env->spr[sprn] += num_insns;
-        }
-
-        if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL &&
-            pmc_has_overflow_enabled(env, sprn)) {
-
-            overflow_triggered = true;
-
-            /*
-             * The real PMU will always trigger a counter overflow with
-             * PMC_COUNTER_NEGATIVE_VAL. We don't have an easy way to
-             * do that since we're counting block of instructions at
-             * the end of each translation block, and we're probably
-             * passing this value at this point.
-             *
-             * Let's write PMC_COUNTER_NEGATIVE_VAL to the overflowed
-             * counter to simulate what the real hardware would do.
-             */
-            env->spr[sprn] = PMC_COUNTER_NEGATIVE_VAL;
-        }
-    }
-
-    return overflow_triggered;
-}
-
 static void pmu_update_cycles(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -309,20 +263,6 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
     return;
 }
 
-/* This helper assumes that the PMC is running. */
-void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
-{
-    bool overflow_triggered;
-    PowerPCCPU *cpu;
-
-    overflow_triggered = pmu_increment_insns(env, num_insns);
-
-    if (overflow_triggered) {
-        cpu = env_archcpu(env);
-        fire_PMC_interrupt(cpu);
-    }
-}
-
 /* Helper to fire a PMC interrupt from TCG code */
 void helper_pmu_overflow(CPUPPCState *env)
 {
-- 
2.33.1


