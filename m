Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94148373A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:55:07 +0100 (CET)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SU6-00011S-HT
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSt-0007HP-11; Mon, 03 Jan 2022 13:53:51 -0500
Received: from [2607:f8b0:4864:20::831] (port=34518
 helo=mail-qt1-x831.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSr-0006Gd-9H; Mon, 03 Jan 2022 13:53:50 -0500
Received: by mail-qt1-x831.google.com with SMTP id o17so31362354qtk.1;
 Mon, 03 Jan 2022 10:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L0OeVrJS6kMoBDCVPLb8crS8ryqPaT8r+Qs7TZGVG+E=;
 b=hLmfG5nWYwLuD93aip9YqwZMZvfB0u+7SZ7WbCST5GodFejdzKtt3bMEQhwST3f8TY
 YKuFs1CXmiSc8Tjjqg6cnc3XmtepACq4KOqc0ICesJCZZEa9bSOiy3dUTnml0t3GkVNd
 sCyB6O5K9YlgwMtlIgJUo7YQmnhqkN7V3jGLc1b9cz9tXd1WEv0X2ItTkwzUm/2t7blT
 LNogk9piBfl1Nh66rpuXJ0/Nxfc9DttiO1sydkm326VLQZbBvi5liZxLENbmztySRc2J
 NXnIT/7UnXuqhd6jr2V7xJNNTqqu7nW8nu2hjihyhJMUtmtXzJG57fWnftkZXBzxaSaF
 AYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L0OeVrJS6kMoBDCVPLb8crS8ryqPaT8r+Qs7TZGVG+E=;
 b=mR1g7eeBBP3drIFU3x5xxXBOAKP9AaXaRL1my10mhZV1TLcnfcoqmu8egftSRjZkIO
 gxUWu1r0QpSEbcCvcd4LXnkqkpifDkdnxi/GAd6C7COPW3VtmGdVIexSwukCRUpwNmty
 iDeKfqSrqHx8LXB6dSKu2KbO2kEcha3cIYQ28j9ChApP4oGm4bdfpOdIogfnizaXtowz
 tQ+KDzoDKW+8//pWUOnRD3Q4OLAyFk0r7eG4dRVfa32nQD1riV0uWdRHWJ3+8B/t0amp
 Brc7uYjP62FT3lul3es9hUIQR9gw7k/M6v07LNZ2Hv3Ae8kYZLTCA2cMph9DhxGSp1mu
 Mr4w==
X-Gm-Message-State: AOAM533+6dONeuz8efwq4zuiEX08tZk4hjikFIuITR6IBsX1cCiiuJzo
 GHUAAswmv4eQ7QWj9GwdCGY8WjypoRE=
X-Google-Smtp-Source: ABdhPJy2wpJaPz2Nz2tW58e7+WZxXrcz/z3/KppVkjEgpFWuR5hsluWDpugw2uEldyvGNicKio8JsQ==
X-Received: by 2002:ac8:7f8b:: with SMTP id z11mr41026718qtj.513.1641236027006; 
 Mon, 03 Jan 2022 10:53:47 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id w9sm29002867qko.71.2022.01.03.10.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 10:53:46 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] target/ppc: Rewrite pmu_increment_insns
Date: Mon,  3 Jan 2022 15:53:29 -0300
Message-Id: <20220103185332.117878-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103185332.117878-1-danielhb413@gmail.com>
References: <20220103185332.117878-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::831
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
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

Use the cached pmc_ins_cnt value.  Unroll the loop over the
different PMC counters.  Treat the PMC4 run-latch specially.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/power8-pmu.c | 78 ++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 29 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 4fce6e8de8..8f01934c15 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -165,45 +165,65 @@ void pmu_update_summaries(CPUPPCState *env)
 
 static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
 {
+    target_ulong mmcr0 = env->spr[SPR_POWER_MMCR0];
+    unsigned ins_cnt = env->pmc_ins_cnt;
     bool overflow_triggered = false;
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
+    target_ulong tmp;
+
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
2.33.1


