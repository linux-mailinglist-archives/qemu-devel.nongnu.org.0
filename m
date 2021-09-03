Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C20400721
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:53:32 +0200 (CEST)
Received: from localhost ([::1]:52792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGBm-0002E1-Vp
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqz-0003Ad-Fs; Fri, 03 Sep 2021 16:32:01 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:47027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqx-0001nl-FC; Fri, 03 Sep 2021 16:32:01 -0400
Received: by mail-qt1-x833.google.com with SMTP id x5so260409qtq.13;
 Fri, 03 Sep 2021 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QiaLw3ttAYzImtdSxh74F0vopWZmtiBkAEsqI6H/wLY=;
 b=Aabur5/tAL3vM9STwPTwXv3Qk8oul9/rGSt8mu/X/XgnXfYCix2l/Javx08kOeSxsw
 Y1iKGyw7YYqTxvsdIzE2pT2aKy8c0khE4imCeOgEStQAg08siN08FTrUo/Nxjq1xtn0w
 VGjLIPGGtLRcJ9lKD+p3ljH9LVCYZw42BUD44i9PStBm39Sk37gpOpNi+40wKOCNaeWE
 3gFIEYn606+eK68EOyGDhI8g4aYIfCaarkt1iJ5NpxtNqTDdfavVywmwQkZOvfYrA9LD
 EoLBTwCJ3frWMywV+vHgufgiJ1UTQA2DYnFLhs9mzvPOiON0sIV1ZiD7kp6uTZtT/ZGr
 quAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QiaLw3ttAYzImtdSxh74F0vopWZmtiBkAEsqI6H/wLY=;
 b=XSNzTsz6Qg5fMjiYz8Y2/pfvep+5GXz8OmYNm+8W0G9a7bzpDe/rU9aWBXWiGuU3hQ
 qF0ZLO/dXPeVNQeLzDwk9ZNFEgq/nJd3mV/4n26WGzY+yQBU59SqWSBfzMQ0wwGCmOu2
 pTYI96ko7ZfyCi++GVU8GnWWx2cgCifApADuQUTaAcaHGwPvm1tfrj+780aLvwbTkiCM
 39WyM1H3hAU0J8e7aLyzkq2r02q2LQXKvEzk9KEHRnZWewRJDQ678eHKG/xwNf5MQAbA
 DV2pC8vcUbUnkIz5STpzbRykZ5I+t0ojUKRQzB2FxelxdvvoKgHwbiWv8UspEeYKiiMM
 /qdQ==
X-Gm-Message-State: AOAM531h04l9Q9aN1oJsSFvv5V4nmytXT+d/hbMNLP3mczRzCnkRrdjw
 B29Do6AWV2dtiI/vk9k+oG+tQEVm9to=
X-Google-Smtp-Source: ABdhPJx7UdCIzw5t+su13zdMQfLAZH3SQgBrtWLPCfnYnM7aPnkFVq4N09dD5IWavWXkg+kdCGcRVw==
X-Received: by 2002:ac8:5ec8:: with SMTP id s8mr832277qtx.26.1630701118164;
 Fri, 03 Sep 2021 13:31:58 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/15] target/ppc/power8_pmu.c: cycles overflow with all
 PMCs
Date: Fri,  3 Sep 2021 17:31:13 -0300
Message-Id: <20210903203116.80628-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
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

All performance monitor counters can trigger a counter negative
condition if the proper MMCR0 bits are set. This patch does that
for all PMCs that can count cycles by doing the following:

- pmc_counter_negative_enabled() will check whether a given PMC is
eligible to trigger the counter negative alert;

- get_counter_neg_timeout() will return the timeout for the counter
negative condition for a given PMC, or -1 if the PMC is not able to
trigger this alert;

- the existing counter_negative_cond_enabled() now must consider the
counter negative bit for PMCs 2-6, MMCR0_PMCjCE;

- start_cycle_count_session() will start overflow timers for all eligible
PMCs.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |   1 +
 target/ppc/power8_pmu.c | 116 ++++++++++++++++++++++++++++++++++------
 2 files changed, 100 insertions(+), 17 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ba93b30ae2..02177e584e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -355,6 +355,7 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_FC14 PPC_BIT(58) /* MMCR0 Freeze Counters 1-4 bit */
 #define MMCR0_FC56 PPC_BIT(59) /* MMCR0 Freeze Counters 5-6 bit */
 #define MMCR0_PMC1CE PPC_BIT(48) /* MMCR0 PMC1 Condition Enabled */
+#define MMCR0_PMCjCE PPC_BIT(49) /* MMCR0 PMCj Condition Enabled */
 
 #define MMCR1_EVT_SIZE 8
 /* extract64() does a right shift before extracting */
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index b2224d363a..9125ba29ae 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -131,9 +131,81 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
     return remaining_cyc;
 }
 
+static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
+{
+    if (!pmc_is_running(env, sprn)) {
+        return false;
+    }
+
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
+
+    case SPR_POWER_PMC2:
+    case SPR_POWER_PMC3:
+    case SPR_POWER_PMC4:
+    case SPR_POWER_PMC5:
+    case SPR_POWER_PMC6:
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
+
+    default:
+        break;
+    }
+
+    return false;
+}
+
+static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
+{
+    int64_t timeout = -1;
+
+    if (!pmc_counter_negative_enabled(env, sprn)) {
+        return -1;
+    }
+
+    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
+        return 0;
+    }
+
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+    case SPR_POWER_PMC2:
+    case SPR_POWER_PMC3:
+    case SPR_POWER_PMC4:
+        switch (get_PMC_event(env, sprn)) {
+        case 0xF0:
+            if (sprn == SPR_POWER_PMC1) {
+                timeout = get_CYC_timeout(env, sprn);
+            }
+            break;
+        case 0x1E:
+            timeout = get_CYC_timeout(env, sprn);
+            break;
+        }
+
+        break;
+    case SPR_POWER_PMC6:
+        timeout = get_CYC_timeout(env, sprn);
+        break;
+    default:
+        break;
+    }
+
+    return timeout;
+}
+
 static bool counter_negative_cond_enabled(uint64_t mmcr0)
 {
-    return mmcr0 & MMCR0_PMC1CE;
+    return mmcr0 & (MMCR0_PMC1CE | MMCR0_PMCjCE);
+}
+
+static void pmu_delete_timers(CPUPPCState *env)
+{
+    int i;
+
+    for (i = 0; i < PMU_TIMERS_LEN; i++) {
+        timer_del(env->pmu_intr_timers[i]);
+    }
 }
 
 /*
@@ -144,7 +216,8 @@ static bool counter_negative_cond_enabled(uint64_t mmcr0)
 static void start_cycle_count_session(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    uint64_t timeout;
+    int64_t timeout;
+    int i;
 
     env->pmu_base_time = now;
 
@@ -152,30 +225,32 @@ static void start_cycle_count_session(CPUPPCState *env)
      * Always delete existing overflow timers when starting a
      * new cycle counting session.
      */
-    timer_del(env->pmu_intr_timers[0]);
+    pmu_delete_timers(env);
 
     if (!counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
         return;
     }
 
-    if (!pmc_is_running(env, SPR_POWER_PMC1)) {
-        return;
-    }
+    /*
+     * Scroll through all programmable PMCs start counter overflow
+     * timers for PM_CYC events, if needed.
+     */
+    for (i = SPR_POWER_PMC1; i < SPR_POWER_PMC5; i++) {
+        timeout = get_counter_neg_timeout(env, i);
 
-    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
-        return;
-    }
+        if (timeout == -1) {
+            continue;
+        }
 
-    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
-    case 0xF0:
-    case 0x1E:
-        timeout = get_CYC_timeout(env, SPR_POWER_PMC1);
-        break;
-    default:
-        return;
+        timer_mod(env->pmu_intr_timers[i - SPR_POWER_PMC1],
+                                       now + timeout);
     }
 
-    timer_mod(env->pmu_intr_timers[0], now + timeout);
+    /* Check for counter neg timeout in PMC6 */
+    timeout = get_counter_neg_timeout(env, SPR_POWER_PMC6);
+    if (timeout != -1) {
+        timer_mod(env->pmu_intr_timers[PMU_TIMERS_LEN - 1], now + timeout);
+    }
 }
 
 static void cpu_ppc_pmu_timer_cb(void *opaque)
@@ -193,6 +268,13 @@ static void cpu_ppc_pmu_timer_cb(void *opaque)
 
         /* Changing MMCR0_FC demands a new hflags compute */
         hreg_compute_hflags(env);
+
+        /*
+         * Delete all pending timers if we need to freeze
+         * the PMC. We'll restart them when the PMC starts
+         * running again.
+         */
+        pmu_delete_timers(env);
     }
 
     update_cycles_PMCs(env);
-- 
2.31.1


