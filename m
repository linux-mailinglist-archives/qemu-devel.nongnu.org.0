Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D047DDFF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 04:04:20 +0100 (CET)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0EOx-0000EL-6X
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 22:04:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMi-0006BI-DN
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:02:00 -0500
Received: from [2607:f8b0:4864:20::629] (port=43630
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMf-00082b-8W
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:02:00 -0500
Received: by mail-pl1-x629.google.com with SMTP id m24so3246957pls.10
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 19:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDuAQPTVmudAI86lMWfLhpfjb3KuCOa/GoUZQb+Dyow=;
 b=X0VvfyZG+NI6MbmOHbdwvOrRR9nTsUf6PxSSi5XNhUiEnDQBixX7Yh7dAZra2VOc38
 JXYl+g4UXzDYBofQ+5qxKOkWSgTlEM8jaqj4CEf2O32IRM/J8NHUvEue944YG9/T2Tdm
 ARUUn2fsW6euK+MU9kMiyhneD3i08sc0EwgwfDxL6KR3oNmg7wyG5ZWimezNBiGFkXRp
 OUX59HhsvwFjw6azW33yE1ta1uo4CBonCgi8BT5ymOgn2eojIXJbIlgMDOetxL35uOlC
 IgC+d22/vOLbh8cS3mcUah/yFR1d9bwxesyAP42DJ8X7gt6bxvgS6oOZm/LozWh64Hj2
 kOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDuAQPTVmudAI86lMWfLhpfjb3KuCOa/GoUZQb+Dyow=;
 b=UVIziMEQn38QF3Q++8R2LYVhxAZdGcLL4pUDxJ4qVnQa6KAGoQOg1gkggQI3drcFnz
 dWeDLZJ3bUF63EkgLMnVsw9WGpPng1XYGPfd7bXrLekQ2VXrVUK3cZkAl9PC40y2CnSj
 BSqJW9sJ+PGSS0GPtAWHLeP47gAAFOWQ7nzvGFbW1oIVcgCKsJu5Q0TRFrd30TKQcZSM
 Kh7DtcCq6Vh5hzdnKTdVPlw/b0Ln3oWCUnYxDEjThNdxtzF0NOWg9xWIQ2eigEiJhjd1
 qPFGJ9hFaqiqFyAulubHMNnY324yQPsbW48QnbFNrPdTjMthmAlZYCqY7Y0aSAuHBhsF
 2uBQ==
X-Gm-Message-State: AOAM530xg/LXEizv7ebEW+RRDR6xJowFFcT92seLrw3FRwTd1PYqwRZJ
 L2djHsBTzUvcihscbFSRo+ekf8L2TmB4uQ==
X-Google-Smtp-Source: ABdhPJwTFDD6XH0FwTZu5sDQnyZ+vlMds7HCdkKuqOC0hpv/jIG87Yd4S/vm1j+intoXEIWQPlHKRg==
X-Received: by 2002:a17:902:d503:b0:149:16ed:d15f with SMTP id
 b3-20020a170902d50300b0014916edd15fmr568925plg.102.1640228513099; 
 Wed, 22 Dec 2021 19:01:53 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm4248513pfk.83.2021.12.22.19.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 19:01:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/ppc: Rewrite pmu_increment_insns
Date: Wed, 22 Dec 2021 19:01:48 -0800
Message-Id: <20211223030149.1947418-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223030149.1947418-1-richard.henderson@linaro.org>
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Use the cached pmc_ins_cnt value.  Unroll the loop over the
different PMC counters.  Treat the PMC4 run-latch specially.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/power8-pmu.c | 76 ++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 28 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index d547e4c99b..c60afa56a5 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -165,45 +165,65 @@ void pmu_update_summaries(CPUPPCState *env)
 
 static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
 {
+    target_ulong mmcr0 = env->spr[SPR_POWER_MMCR0];
+    unsigned ins_cnt = env->pmc_ins_cnt;
     bool overflow_triggered = false;
-    int sprn;
+    target_ulong tmp;
 
-    /* PMC6 never counts instructions */
-    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        PMUEventType evt_type = pmc_get_event(env, sprn);
-        bool insn_event = evt_type == PMU_EVENT_INSTRUCTIONS ||
-                          evt_type == PMU_EVENT_INSN_RUN_LATCH;
-
-        if (pmc_is_inactive(env, sprn) || !insn_event) {
-            continue;
+    if (unlikely(ins_cnt & 0x1e)) {
+        if (ins_cnt & (1 << 1)) {
+            tmp = env->spr[SPR_POWER_PMC1];
+            tmp += num_insns;
+            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1CE)) {
+                tmp = PMC_COUNTER_NEGATIVE_VAL;
+                overflow_triggered = true;
+            }
+            env->spr[SPR_POWER_PMC1] = tmp;
         }
 
-        if (evt_type == PMU_EVENT_INSTRUCTIONS) {
-            env->spr[sprn] += num_insns;
+        if (ins_cnt & (1 << 2)) {
+            tmp = env->spr[SPR_POWER_PMC2];
+            tmp += num_insns;
+            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+                tmp = PMC_COUNTER_NEGATIVE_VAL;
+                overflow_triggered = true;
+            }
+            env->spr[SPR_POWER_PMC2] = tmp;
         }
 
-        if (evt_type == PMU_EVENT_INSN_RUN_LATCH &&
-            env->spr[SPR_CTRL] & CTRL_RUN) {
-            env->spr[sprn] += num_insns;
+        if (ins_cnt & (1 << 3)) {
+            tmp = env->spr[SPR_POWER_PMC3];
+            tmp += num_insns;
+            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+                tmp = PMC_COUNTER_NEGATIVE_VAL;
+                overflow_triggered = true;
+            }
+            env->spr[SPR_POWER_PMC3] = tmp;
         }
 
-        if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL &&
-            pmc_has_overflow_enabled(env, sprn)) {
+        if (ins_cnt & (1 << 4)) {
+            target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
+            int sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
+            if (sel == 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
+                tmp = env->spr[SPR_POWER_PMC4];
+                tmp += num_insns;
+                if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+                    tmp = PMC_COUNTER_NEGATIVE_VAL;
+                    overflow_triggered = true;
+                }
+                env->spr[SPR_POWER_PMC4] = tmp;
+            }
+        }
+    }
 
+    if (ins_cnt & (1 << 5)) {
+        tmp = env->spr[SPR_POWER_PMC5];
+        tmp += num_insns;
+        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+            tmp = PMC_COUNTER_NEGATIVE_VAL;
             overflow_triggered = true;
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
         }
+        env->spr[SPR_POWER_PMC5] = tmp;
     }
 
     return overflow_triggered;
-- 
2.25.1


