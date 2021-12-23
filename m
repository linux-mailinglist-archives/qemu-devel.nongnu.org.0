Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40B47DE01
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 04:06:57 +0100 (CET)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0ERU-0003UA-Gu
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 22:06:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMj-0006Ce-F4
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:02:01 -0500
Received: from [2607:f8b0:4864:20::630] (port=42592
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMf-00082q-97
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:02:01 -0500
Received: by mail-pl1-x630.google.com with SMTP id u16so3254271plg.9
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 19:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MwC8DfPxtCdA8CUKyYDPaon4yktbu90EwhN6j0mhd+Q=;
 b=H0wwabzm9z7VIWRw2eP9jJtp8HNh7d0BRi409AIIB0fmNfBdeC9ZqK9jDvXT6TJ1xM
 jz/KmxW4khR1KiAekJGhZclbNNAgtWsYPPjxClGm11j2BmMcyCXcul31cj0mdsmCLWtj
 xQvznvo2chkf5o2peEXS4Isw52yH+x8+9pPiL1PHmTiHXr22srFMHKQyT2bHs7RWyTSO
 +tgBO3+/3gHU5O2CYODpjhV75GRPug/iGfawRgYdW7OTqnmoBj0brVa9hTGNE2sv/AAY
 o53znBrkdKvdpoJGR2WPctEpjx9+aNnliIHp3xfNhLLfqupE4IXwf3e9VtY3rGfxXlTQ
 Ww1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MwC8DfPxtCdA8CUKyYDPaon4yktbu90EwhN6j0mhd+Q=;
 b=HPF7VQ/RuTn/ZJm/V0TjdhXTeNRMexNcJk5Bx15snVnzxpGgBeTZYsxbY+F2/aKcAj
 CQWa9m40QjCP2xqy1KucuDvf5pICmzVCx3D5vKhnoJVqsyOa6y7tMy4H/c1QpjO+TExP
 0YyCs8pX1L47pzG+JDhaEF8oiePzbwrANvNr1a/LPyqUE5W4+KP3ZeuJgo2Py2ujfNWI
 0awhz802l/0P0VOi5/iLubrVJOUSu876JqpswcEkdiRsYFEiy4X3DLN0tzQR6fmZrRUN
 Tu3aoq6eJZMQVztuHTSJeRXhPn/Cki2U6AUK8Iru7IrctG+ORBUSV47AQmUFVoifJza4
 nzMA==
X-Gm-Message-State: AOAM530LxQVBAr0Iy1sb9q/zRzNnxKMBaKXUOXRDyExRTodopROjqyHD
 o7AXqxtsTpvGUJQSPBglfu3UrSlz9hSc5Q==
X-Google-Smtp-Source: ABdhPJw+fHpiecv1MwBDIMMVKapd583LjTGvQVU4pj8kthHwclBBRQYu7H1C8cp5D/YXa06S6i4mvQ==
X-Received: by 2002:a17:902:b189:b0:143:8079:3d3b with SMTP id
 s9-20020a170902b18900b0014380793d3bmr610609plr.71.1640228514059; 
 Wed, 22 Dec 2021 19:01:54 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm4248513pfk.83.2021.12.22.19.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 19:01:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/ppc: Use env->pnc_cyc_cnt
Date: Wed, 22 Dec 2021 19:01:49 -0800
Message-Id: <20211223030149.1947418-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223030149.1947418-1-richard.henderson@linaro.org>
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the cached pmc_cyc_cnt value in pmu_update_cycles
and pmc_update_overflow_timer.  This leaves pmc_get_event
and pmc_is_inactive unused, so remove them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/power8-pmu.c | 107 ++++------------------------------------
 1 file changed, 9 insertions(+), 98 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index c60afa56a5..7859ea24f5 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -24,19 +24,6 @@
 
 #define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
 
-static bool pmc_is_inactive(CPUPPCState *env, int sprn)
-{
-    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
-        return true;
-    }
-
-    if (sprn < SPR_POWER_PMC5) {
-        return env->spr[SPR_POWER_MMCR0] & MMCR0_FC14;
-    }
-
-    return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
-}
-
 static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
 {
     if (sprn == SPR_POWER_PMC1) {
@@ -46,80 +33,6 @@ static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
     return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
 }
 
-/*
- * For PMCs 1-4, IBM POWER chips has support for an implementation
- * dependent event, 0x1E, that enables cycle counting. The Linux kernel
- * makes extensive use of 0x1E, so let's also support it.
- *
- * Likewise, event 0x2 is an implementation-dependent event that IBM
- * POWER chips implement (at least since POWER8) that is equivalent to
- * PM_INST_CMPL. Let's support this event on PMCs 1-4 as well.
- */
-static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
-{
-    uint8_t mmcr1_evt_extr[] = { MMCR1_PMC1EVT_EXTR, MMCR1_PMC2EVT_EXTR,
-                                 MMCR1_PMC3EVT_EXTR, MMCR1_PMC4EVT_EXTR };
-    PMUEventType evt_type = PMU_EVENT_INVALID;
-    uint8_t pmcsel;
-    int i;
-
-    if (pmc_is_inactive(env, sprn)) {
-        return PMU_EVENT_INACTIVE;
-    }
-
-    if (sprn == SPR_POWER_PMC5) {
-        return PMU_EVENT_INSTRUCTIONS;
-    }
-
-    if (sprn == SPR_POWER_PMC6) {
-        return PMU_EVENT_CYCLES;
-    }
-
-    i = sprn - SPR_POWER_PMC1;
-    pmcsel = extract64(env->spr[SPR_POWER_MMCR1], mmcr1_evt_extr[i],
-                       MMCR1_EVT_SIZE);
-
-    switch (pmcsel) {
-    case 0x2:
-        evt_type = PMU_EVENT_INSTRUCTIONS;
-        break;
-    case 0x1E:
-        evt_type = PMU_EVENT_CYCLES;
-        break;
-    case 0xF0:
-        /*
-         * PMC1SEL = 0xF0 is the architected PowerISA v3.1
-         * event that counts cycles using PMC1.
-         */
-        if (sprn == SPR_POWER_PMC1) {
-            evt_type = PMU_EVENT_CYCLES;
-        }
-        break;
-    case 0xFA:
-        /*
-         * PMC4SEL = 0xFA is the "instructions completed
-         * with run latch set" event.
-         */
-        if (sprn == SPR_POWER_PMC4) {
-            evt_type = PMU_EVENT_INSN_RUN_LATCH;
-        }
-        break;
-    case 0xFE:
-        /*
-         * PMC1SEL = 0xFE is the architected PowerISA v3.1
-         * event to sample instructions using PMC1.
-         */
-        if (sprn == SPR_POWER_PMC1) {
-            evt_type = PMU_EVENT_INSTRUCTIONS;
-        }
-        break;
-    default:
-        break;
-    }
-
-    return evt_type;
-}
-
 void pmu_update_summaries(CPUPPCState *env)
 {
     target_ulong mmcr0 = env->spr[SPR_POWER_MMCR0];
@@ -233,18 +146,16 @@ static void pmu_update_cycles(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint64_t time_delta = now - env->pmu_base_time;
-    int sprn;
+    int sprn, cyc_cnt = env->pmc_cyc_cnt;
 
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
-        if (pmc_get_event(env, sprn) != PMU_EVENT_CYCLES) {
-            continue;
+        if (cyc_cnt & (1 << (sprn - SPR_POWER_PMC1 + 1))) {
+            /*
+             * The pseries and powernv clock runs at 1Ghz, meaning
+             * that 1 nanosec equals 1 cycle.
+             */
+            env->spr[sprn] += time_delta;
         }
-
-        /*
-         * The pseries and powernv clock runs at 1Ghz, meaning
-         * that 1 nanosec equals 1 cycle.
-         */
-        env->spr[sprn] += time_delta;
     }
 
     /* Update base_time for future calculations */
@@ -273,7 +184,7 @@ static void pmc_update_overflow_timer(CPUPPCState *env, int sprn)
         return;
     }
 
-    if (pmc_get_event(env, sprn) != PMU_EVENT_CYCLES ||
+    if (!(env->pmc_cyc_cnt & (1 << (sprn - SPR_POWER_PMC1 + 1))) ||
         !pmc_has_overflow_enabled(env, sprn)) {
         /* Overflow timer is not needed for this counter */
         timer_del(pmc_overflow_timer);
@@ -281,7 +192,7 @@ static void pmc_update_overflow_timer(CPUPPCState *env, int sprn)
     }
 
     if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL) {
-        timeout =  0;
+        timeout = 0;
     } else {
         timeout = PMC_COUNTER_NEGATIVE_VAL - env->spr[sprn];
     }
-- 
2.25.1


