Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD784838E4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:52:13 +0100 (CET)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4WBY-0003Nh-58
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:52:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7W-0003yr-Kc; Mon, 03 Jan 2022 17:48:02 -0500
Received: from [2607:f8b0:4864:20::72d] (port=36463
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7U-0001GS-Ps; Mon, 03 Jan 2022 17:48:02 -0500
Received: by mail-qk1-x72d.google.com with SMTP id i130so32157532qke.3;
 Mon, 03 Jan 2022 14:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pG0za5U7/L3QI5M2aZfqaNqDe3G+0GpLA4spQ+tDwhQ=;
 b=HeCivLfP9/Rn462ON8Rv26phWZVIRO0QvrBNRqakN9VEGB3pcwCSr5jiVql3Zz54VS
 TIVdHNwiz+z/awoAFaHmahQ5SrVBOoOgGvWVOaFlMByd1xODtOX5HnX8Oi8R0jW1ahoY
 VLJAJkWCryh+oZMAYyrxDURSsU/4NbN4prCa9ZjLB1lJ78yNm2WnQemffdvdr7cFgcRi
 5VfdTpb2yZOErQBZ8jOTAtYYK2Kd+XCoQ8YTUvKm7dIHj9XalGh8HaHVfYcGu1RUt0fD
 eC+9wBb+9vxQ/PGgk2MUdPT2noYy8sS9sySvmJEHbDKFmcpHvFILtkZ6LyJsZO2wtdyc
 7OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pG0za5U7/L3QI5M2aZfqaNqDe3G+0GpLA4spQ+tDwhQ=;
 b=GyRIgliwChxEr5gcBGui8lqOsw2NJlBZqknxSjpIzQyNqHoCUnL0U9xEl82i1H+K2z
 nr2ZIhKuQ0j5+cRtOBeTLENL2svdN6uPZr7wIVj3RMlLEg9E6caznlXnccLG0uXZgD3F
 60SDSynkc+Clrw7iMMmKgAI78tqC3ir4HGj/862UZTNNVJ0w6n5Gc9mv39tvvYvmvDRR
 iZ+e3xoFeduEH6GMyWHOStSSDPc+E+qZ8Jw4B4FbClUDIt4iEEaU+b0VRRVKL+bIeaWH
 0C1vbseZ6auOPSwmApb4faEgAK8AI9ao+j2mcH1fybFKZmd5ibXJvV+kwe2qWRGjd4vF
 8UQw==
X-Gm-Message-State: AOAM5325gZ7luXzHkwe8RZ4So6TgS9ileG9nw5bIIYZmlSY4xWhWchla
 CTJvjly48sFXemDWXIoGG4xT4mxbi+s=
X-Google-Smtp-Source: ABdhPJw0FW1zmkQutxKxHe5bDn4w/PXYeOZhvNcPrqYU6Vw56QtrBgTcDOgxWpQsk9co9pIM8N+zkQ==
X-Received: by 2002:a05:620a:4489:: with SMTP id
 x9mr33398470qkp.38.1641250079451; 
 Mon, 03 Jan 2022 14:47:59 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id t123sm22917176qkb.135.2022.01.03.14.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 14:47:59 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] target/ppc: Cache per-pmc insn and cycle count settings
Date: Mon,  3 Jan 2022 19:47:43 -0300
Message-Id: <20220103224746.167831-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103224746.167831-1-danielhb413@gmail.com>
References: <20220103224746.167831-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
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

This is the combination of frozen bit and counter type, on a per
counter basis. So far this is only used by HFLAGS_INSN_CNT, but
will be used more later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[danielhb: fixed PMC4 cyc_cnt shift, insn run latch code,
           MMCR0_FC handling, "PMC[1-6]" comment]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  3 +++
 target/ppc/cpu_init.c    |  1 +
 target/ppc/helper_regs.c |  2 +-
 target/ppc/machine.c     |  2 ++
 target/ppc/power8-pmu.c  | 56 ++++++++++++++++++++++++++++++++--------
 target/ppc/power8-pmu.h  | 14 +++++-----
 6 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fc66c3561d..fd187fe3dd 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1144,6 +1144,9 @@ struct CPUPPCState {
     /* Other registers */
     target_ulong spr[1024]; /* special purpose registers */
     ppc_spr_t spr_cb[1024];
+    /* Composite status for PMC[1-6] enabled and counting insns or cycles. */
+    uint8_t pmc_ins_cnt;
+    uint8_t pmc_cyc_cnt;
     /* Vector status and control register, minus VSCR_SAT */
     uint32_t vscr;
     /* VSX registers (including FP and AVR) */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 06ef15cd9e..63f9babfee 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8313,6 +8313,7 @@ static void ppc_cpu_reset(DeviceState *dev)
 #endif /* CONFIG_TCG */
 #endif
 
+    pmu_update_summaries(env);
     hreg_compute_hflags(env);
     env->reserve_addr = (target_ulong)-1ULL;
     /* Be sure no exception or interrupt is pending */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index b847928842..8671b7bb69 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -123,7 +123,7 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     }
 
 #if defined(TARGET_PPC64)
-    if (pmu_insn_cnt_enabled(env)) {
+    if (env->pmc_ins_cnt) {
         hflags |= 1 << HFLAGS_INSN_CNT;
     }
 #endif
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 93972df58e..756d8de5d8 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "kvm_ppc.h"
+#include "power8-pmu.h"
 
 static void post_load_update_msr(CPUPPCState *env)
 {
@@ -19,6 +20,7 @@ static void post_load_update_msr(CPUPPCState *env)
      */
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
+    pmu_update_summaries(env);
 }
 
 static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 08d1902cd5..1f4f611994 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -11,8 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-
-#include "power8-pmu.h"
 #include "cpu.h"
 #include "helper_regs.h"
 #include "exec/exec-all.h"
@@ -20,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
+#include "power8-pmu.h"
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
@@ -121,18 +120,52 @@ static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
     return evt_type;
 }
 
-bool pmu_insn_cnt_enabled(CPUPPCState *env)
+void pmu_update_summaries(CPUPPCState *env)
 {
-    int sprn;
+    target_ulong mmcr0 = env->spr[SPR_POWER_MMCR0];
+    target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
+    int ins_cnt = 0;
+    int cyc_cnt = 0;
 
-    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        if (pmc_get_event(env, sprn) == PMU_EVENT_INSTRUCTIONS ||
-            pmc_get_event(env, sprn) == PMU_EVENT_INSN_RUN_LATCH) {
-            return true;
+    if (mmcr0 & MMCR0_FC) {
+        goto hflags_calc;
+    }
+
+    if (!(mmcr0 & MMCR0_FC14) && mmcr1 != 0) {
+        target_ulong sel;
+
+        sel = extract64(mmcr1, MMCR1_PMC1EVT_EXTR, MMCR1_EVT_SIZE);
+        switch (sel) {
+        case 0x02:
+        case 0xfe:
+            ins_cnt |= 1 << 1;
+            break;
+        case 0x1e:
+        case 0xf0:
+            cyc_cnt |= 1 << 1;
+            break;
         }
+
+        sel = extract64(mmcr1, MMCR1_PMC2EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |= (sel == 0x02) << 2;
+        cyc_cnt |= (sel == 0x1e) << 2;
+
+        sel = extract64(mmcr1, MMCR1_PMC3EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |= (sel == 0x02) << 3;
+        cyc_cnt |= (sel == 0x1e) << 3;
+
+        sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |= ((sel == 0xfa) || (sel == 0x2)) << 4;
+        cyc_cnt |= (sel == 0x1e) << 4;
     }
 
-    return false;
+    ins_cnt |= !(mmcr0 & MMCR0_FC56) << 5;
+    cyc_cnt |= !(mmcr0 & MMCR0_FC56) << 6;
+
+ hflags_calc:
+    env->pmc_ins_cnt = ins_cnt;
+    env->pmc_cyc_cnt = cyc_cnt;
+    env->hflags = deposit32(env->hflags, HFLAGS_INSN_CNT, 1, ins_cnt != 0);
 }
 
 static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
@@ -264,8 +297,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 
     env->spr[SPR_POWER_MMCR0] = value;
 
-    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_INSN_CNT */
+    /* MMCR0 writes can change HFLAGS_PMCC[01] and HFLAGS_INSN_CNT */
     hreg_compute_hflags(env);
+    pmu_update_summaries(env);
 
     /* Update cycle overflow timers with the current MMCR0 state */
     pmu_update_overflow_timers(env);
@@ -278,7 +312,7 @@ void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
     env->spr[SPR_POWER_MMCR1] = value;
 
     /* MMCR1 writes can change HFLAGS_INSN_CNT */
-    hreg_compute_hflags(env);
+    pmu_update_summaries(env);
 }
 
 target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 3ee4b4cda5..a839199561 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -13,14 +13,12 @@
 #ifndef POWER8_PMU
 #define POWER8_PMU
 
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "exec/helper-proto.h"
-#include "qemu/error-report.h"
-#include "qemu/main-loop.h"
-
 void cpu_ppc_pmu_init(CPUPPCState *env);
-bool pmu_insn_cnt_enabled(CPUPPCState *env);
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void pmu_update_summaries(CPUPPCState *env);
+#else
+static inline void pmu_update_summaries(CPUPPCState *env) { }
+#endif
 
 #endif
-- 
2.33.1


