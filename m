Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C23F62F4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:43:35 +0200 (CEST)
Received: from localhost ([::1]:41180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZWQ-0005jv-5Y
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKc-0008Rq-W4; Tue, 24 Aug 2021 12:31:23 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKa-0000Ah-QA; Tue, 24 Aug 2021 12:31:22 -0400
Received: by mail-qk1-x736.google.com with SMTP id 22so23825903qkg.2;
 Tue, 24 Aug 2021 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SapuqFgdb9kbWwuHo3xaSJY2yv5JykkL87vlU3CnPdo=;
 b=aGnGn0lKeWtxjZJEd1A89OQmGplIOD6xAoxXtIPCtMP1Ogp9ERjY8hQkLl+NQvkGeI
 2RQb/LkQKyCNmX5eJxeQLY3PRczVZe3/sGwx9U5AqQv/ybY3MNQRNbuTRcEGOto+kBCD
 QuhMGb+gv2QDeNnTNiSh0LQYa3gXydIjwzA4aZFWtZe6f/OxHmIoyU+JdYzqYJmqunHJ
 dBrupOWKzfJJQTKXk1m0zaJk9JQBFn60Z5W9ajnjnT0ebiABLT4SbAsibQ4vbaWW7Vl6
 h2QSVt9GVWgmy8S97YqQmjtRyqztqUKd1MfSSFnyM+GDlodmDzROga2S20a11xWt+6+N
 Hhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SapuqFgdb9kbWwuHo3xaSJY2yv5JykkL87vlU3CnPdo=;
 b=Eu/SGC7Fmb4McO4WIQZnEpOXBM7OoawYCDlmY/Kmaq2HGxwfVDUb5emqGJZHZMQCfG
 cWXl12WOpgMrUPDfckEvHYR3y3avlqH8ixkR5XduW1jIh5gSN8CwtBcmVCzKeGGFpn+r
 Kt0kYD7Qp1a/o0+DXIqEvR1PLFeOQiJelP1V/ysX92qEf7DSfFkrqS1YXhRzWt/61Iu3
 5PioxnUZ4uYRh/tDeQw65IJUCMSg/h8A3acrTVG8ZGHkF4vj4PGUB49kjd1qs5GvAgtx
 u0555st5Z7UyZnhop6qIDRWFh/PbS5zNm9stT8prlxe7lCDKhfMullX7fZvmpEAENrHV
 8thA==
X-Gm-Message-State: AOAM5339VpYXvjwm+TjWb9PBJD6eM4OD2Nj+AMSFoYUIFv929D05j/8m
 BcCic9itb9rBd9CAjxeGpTNAQbMjC3I=
X-Google-Smtp-Source: ABdhPJwjb6mN2ywtsBjcnJAfymXUZkUfQIr/JWY/zoOvQsek4NNm0/qde/hvyIAhjvZMOzgJShaVIQ==
X-Received: by 2002:a37:a00b:: with SMTP id j11mr3239905qke.337.1629822679336; 
 Tue, 24 Aug 2021 09:31:19 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/16] target/ppc/power8_pmu.c: cycles overflow with all
 PMCs
Date: Tue, 24 Aug 2021 13:30:29 -0300
Message-Id: <20210824163032.394099-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
index b9d5dca983..f4337e1621 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,7 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_FC14 PPC_BIT(58)
 #define MMCR0_FC56 PPC_BIT(59)
 #define MMCR0_PMC1CE PPC_BIT(48)
+#define MMCR0_PMCjCE PPC_BIT(49)
 
 #define MMCR1_PMC1SEL_SHIFT (63 - 39)
 #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index d10f371b5f..690476051d 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -130,9 +130,81 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
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
@@ -143,7 +215,8 @@ static bool counter_negative_cond_enabled(uint64_t mmcr0)
 static void start_cycle_count_session(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    uint64_t timeout;
+    int64_t timeout;
+    int i;
 
     env->pmu_base_time = now;
 
@@ -151,30 +224,32 @@ static void start_cycle_count_session(CPUPPCState *env)
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
@@ -189,6 +264,13 @@ static void cpu_ppc_pmu_timer_cb(void *opaque)
     if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
         env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
         env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
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


