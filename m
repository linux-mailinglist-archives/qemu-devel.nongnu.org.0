Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04C4838E0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:49:37 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4W92-0007sK-QE
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:49:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7Y-00045U-N6; Mon, 03 Jan 2022 17:48:04 -0500
Received: from [2607:f8b0:4864:20::f33] (port=33587
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7X-0001Gk-2X; Mon, 03 Jan 2022 17:48:04 -0500
Received: by mail-qv1-xf33.google.com with SMTP id kk22so32680190qvb.0;
 Mon, 03 Jan 2022 14:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g5JctA83b5oApx0G6IghG/MSrBOtGp57pk/joPCEciY=;
 b=W+yHf49z869nVyZj+IIJMMMpzdo2BBCCXCX8h/DpQKXFteiITx63aZDWc0AfQqso/U
 c3SJdjjLNmeASZXrnpht/BN/3ZkTpXRFlt8rwukXLjOKARW5Fs+rgdkkxg8PWlvTysG0
 hrbIakYStfTxobpwo0EPMBjvF+hWO92z9FXBRT/DHztFbTP/GSjHwc3kBr8LSgoM97ct
 ib+a4R6KMAvznlcZD5nl+hDk0pG0bi1xfQRiwGuH651NZXpdxmSaJRKGk2TNt5fYQlZq
 8MJZ1VtIBJMK/cPrTLuvsQrlS8PzArQ1UCtsvG/ZnevXR3SKJGXis8/RgQn4Vx7D+xTE
 PGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5JctA83b5oApx0G6IghG/MSrBOtGp57pk/joPCEciY=;
 b=0xhxT+Q/oAEHGwn24h8doJwTqYPhYADnR5eYYG3q+bSTtCdisbru54Cz3AnqZd/zup
 mAqg2+IUopfaWr+LapPx6cn0cbnyZqXquhIlW1/8LnZYwAc0KKsEo17V5ZxoZwXkQbwh
 pzYV3ry0wCRHSg/HFS8+NyJT1dMNuAh0uIlAL60ZyqnweJMvdB5gFKZOJdPNvCRuRk34
 KlbiJZTEcsof/Y2FjkwszSLYhcJdqE1o4gLJzou+9qwA4V2J3nBVH4RcUMn4+Jl/A50P
 PbSxph4A5PrgmU4d1MueGBpGg/tymknXfhdBC8TYgk9EFtzGn+3af+9m3ervQ+BMyzg0
 O6Kw==
X-Gm-Message-State: AOAM530WfQ7+r19xdWSI5467vPe/i/GmLhaFx+UB46Xw+VrgGgSNJRXy
 5lrWjQne03P/Mon8677BwJeoX0Nmlps=
X-Google-Smtp-Source: ABdhPJzPLcr/shQHFjipT+34CgfR5/L/RZ1IkvgrhTTsvYTRpS8Ovpe/pO3aXaO3mx7Xf9jFAuddDA==
X-Received: by 2002:a05:6214:2aaa:: with SMTP id
 js10mr40503264qvb.38.1641250081855; 
 Mon, 03 Jan 2022 14:48:01 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id t123sm22917176qkb.135.2022.01.03.14.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 14:48:01 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] target/ppc: Rewrite pmu_increment_insns
Date: Mon,  3 Jan 2022 19:47:44 -0300
Message-Id: <20220103224746.167831-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103224746.167831-1-danielhb413@gmail.com>
References: <20220103224746.167831-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
index 1f4f611994..27c4c7915b 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -170,45 +170,65 @@ void pmu_update_summaries(CPUPPCState *env)
 
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


