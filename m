Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0358648373B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:55:18 +0100 (CET)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SUH-0001Wc-0L
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:55:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSu-0007KG-SF; Mon, 03 Jan 2022 13:53:53 -0500
Received: from [2607:f8b0:4864:20::82a] (port=38909
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSt-0006Gw-6U; Mon, 03 Jan 2022 13:53:52 -0500
Received: by mail-qt1-x82a.google.com with SMTP id 8so31334100qtx.5;
 Mon, 03 Jan 2022 10:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dahHqnMxceDbQ74I84xFv3w02NM0JbWTAXBZEs59W+g=;
 b=HwygmsqKagS4/1u/wmwDtqnIopi548KVsdvuWfE28cvHuaYGRqk+4a71OKuznCqvED
 kJ9uYLE00WQoa4gmdmyk2pP7iaiaAqg1DS2/sJlHzspAM2LyLhX17CsuJzVS6Z/a+1+s
 4lOS/YRivRuWLS9o+vtH6+sC34aanZtuFC+eRpEOlFoMQHKAqMvZFm6HhIgPJVv5QCiJ
 Rhi4gt3yMu2Y7tgI8s3Qy5PX5DZEAT1FeDrik4+V8pWWYZCo4Wrsop74FKfv7otXAKBV
 syku2I7adfL+jIyaDv6cUERXFN3/aqHX7wM2tuFOAq1NxoM+z7DxvBweG2DmQPam5gP0
 4qHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dahHqnMxceDbQ74I84xFv3w02NM0JbWTAXBZEs59W+g=;
 b=mNhOwmeKtgPZcK1XgVNA7EjrGBECdDNn4IhW3ZSvMuofwRhFTJz41CcUvE7q7Otirm
 pA5xy+B4mX1Rv3g7G+wOpnmVKdJMVVlVZOem0wIYktN5OMnuNfXPztKTqhvcd+BePvyc
 I/4eNMVaxcQfoTMvhmHrc8Y4158Vmje6J374JXfevdVpRDv/sJt9QW525+k2ZFCBuK0O
 fguaLQNWHa/KrDzSf8fEZZ91pNh4tTmoOxkb2dpC+EwTn1XSqCZTlpyzTOiMyTuiinWO
 DzRlDp3DHP5T8TSALwEa7ZiDiO3TBearQo5jeWvn5oxH0bQyZbt+LmFUkfqJYVWNHwyp
 l8cA==
X-Gm-Message-State: AOAM5338e89ycK3a5/7XvtpXFdPgeH0NgnKCGvr4CPT6cXNx+NfTeHVN
 jeKSBPxSVw6gBpQp9rk7cjUnmuv9RoA=
X-Google-Smtp-Source: ABdhPJyQT+KN8QIuV4dShyP6/pCZ7luynKjjCRXd6QtomW+riaKHQJh6noOlA3Dtobxd+qOzkkKAnw==
X-Received: by 2002:a05:622a:1114:: with SMTP id
 e20mr41750945qty.279.1641236030059; 
 Mon, 03 Jan 2022 10:53:50 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id w9sm29002867qko.71.2022.01.03.10.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 10:53:49 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] target/ppc: Use env->pnc_cyc_cnt
Date: Mon,  3 Jan 2022 15:53:30 -0300
Message-Id: <20220103185332.117878-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103185332.117878-1-danielhb413@gmail.com>
References: <20220103185332.117878-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use the cached pmc_cyc_cnt value in pmu_update_cycles
and pmc_update_overflow_timer.  This leaves pmc_get_event
and pmc_is_inactive unused, so remove them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/power8-pmu.c | 107 ++++------------------------------------
 1 file changed, 9 insertions(+), 98 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 8f01934c15..7fc7d91109 100644
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
2.33.1


