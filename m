Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7747D348
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:58:41 +0100 (CET)
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n028d-00079E-QY
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wP-0000VA-NE; Wed, 22 Dec 2021 08:46:02 -0500
Received: from [2607:f8b0:4864:20::f33] (port=34456
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wO-0005Gl-0N; Wed, 22 Dec 2021 08:46:01 -0500
Received: by mail-qv1-xf33.google.com with SMTP id ke6so2360779qvb.1;
 Wed, 22 Dec 2021 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+N1THvPQsi/qwwxs7P5fuA3pJp7S9ZSXzZY2TSQO7U=;
 b=GDTp0lFIDpbL5bnXvZPTNKW6kQM2Iosts5bdr6igmosWvrUYY/h6kiAAE8YKRSPtLb
 vYrvEEBesxZccjrHIHmT6swmeeXHu7ZMkDrAXgIPXtlH+j428kG0Iv1Xrenb/UYl/XP6
 IkrrbhHwibrk3qx+miMfjA96IWBPdubxkHeKOheSZ/Exv39lXuv3M3wntr9khBX4+HAL
 WzdoSeb0gVSDAlyrt7l6LA+iTZxYWSg+qVSsue4rbOpn59PdoGlVulW5f5E25Mt4STV7
 5IUxjzpaAX+wLYYoxUS6YgjfvCc2jcBgBEGY8WZXXEFmKC0FqE0tdHDD8rIYlPdnYl7J
 z/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+N1THvPQsi/qwwxs7P5fuA3pJp7S9ZSXzZY2TSQO7U=;
 b=68tnJYZ5gpejUDW33t1hU3lzW5ZEmoExoibR+knfka+Ow8XsK+B10O/CPdd8i/CD0n
 nCCk26LID8hUqd6iyAmf55NBoOaj7kcsfuPSjTpcaKV5v8hD3O15gj64bCSxw8EY/ZYo
 q0lb391QbILcRAK0/KX8q2JUHpbeSOmpTEaYet27gvRUBRkKjpGuhKaez1OBY/fJ8Svc
 +/mYYFxYPIQJV6kYqDMQFU+2SUbfEClUCJO/N/OBHw87NRnzY9yubdYUU0w5ZOznP7OU
 0b4la6y2txZ+nT5M9fgVNOTssVhYGqxtxaJSWPsJa3Acj3frLc8bwUjosf2vMrw9FSyP
 +9sg==
X-Gm-Message-State: AOAM531Ud2CPcM8ycATjPGi7V9qmliSoh+4sjvepxk96sMYJGO1PEdv1
 EJ/ZD3rses9ztkzT7K31nDS8ViDDF4g=
X-Google-Smtp-Source: ABdhPJx3zaewI4nqpTjE9lqteFtnj+FjO9r7Hd3moD5VCR506hVCARiUa8Q6FL5BP66/ux+eDNaagQ==
X-Received: by 2002:ad4:44a3:: with SMTP id n3mr2363304qvt.72.1640180758785;
 Wed, 22 Dec 2021 05:45:58 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:58 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/ppc/power8-pmu.c: remove helper_insns_inc()
Date: Wed, 22 Dec 2021 10:45:20 -0300
Message-Id: <20211222134520.587877-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
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
index 7bd07d8105..8b1604b4c7 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -303,10 +303,6 @@ static void pmu_check_overflow(DisasContext *ctx)
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


