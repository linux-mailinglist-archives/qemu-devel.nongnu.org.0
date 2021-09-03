Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144AD400727
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:54:44 +0200 (CEST)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGCx-0005XQ-4L
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqx-00030i-4m; Fri, 03 Sep 2021 16:31:59 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqv-0001l8-9O; Fri, 03 Sep 2021 16:31:58 -0400
Received: by mail-qt1-x82d.google.com with SMTP id 2so299202qtw.1;
 Fri, 03 Sep 2021 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uqcSlIEE8XrqdIcGnOwQvr9HriWwUwyJcTcJyqHtZqE=;
 b=IuL90r8alo+/+C0xjXLq66TJ5RQHSmBdE7lMHNBXfQmn18mSk3ijwAkcI9cJxvs5Oq
 /r3NsluVl1StOnZSbi5AS4Na3nj2EDUqL4YH8PoOBixUAEFfytN7bKfgD9aY9AVuhe7+
 92a2IXEdyeEbLUNn8fAda6MyesXlk4jOoql+gTgQlAdFqaP019HTBTimzOCYyU7WiyeS
 p0CY616uZ1RQjl7XFCTRGoG/Ef74J999ErKn3P/aoW/Qs4GWEZEEPs7FHNLeHUjyvf6S
 Aja1L47Nf9IkVYBaAHeT1Hn5KCqH++RJECotYDWtjJc07RewOG2Uq6fw4K9M5Uy2XpAM
 IVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqcSlIEE8XrqdIcGnOwQvr9HriWwUwyJcTcJyqHtZqE=;
 b=Mf/2Uf5Buid12CnU4VlG3Yxwq1MsLURzwf1M15er7zasSoLJSIKaCyFibmsEYjSYwU
 yYFatQSEAzQbSCrQ+FLs30hT36bX0V3yLHcHOUg7txH2iQRoHB4ANbyJkSIREKARzaO5
 X5NRqZLrD3mZSzRoB5sKXp3Ef0Br3poCPA8FRrE7DlFEx2CQrR5b4KXS3+FcHbaGEIAz
 u5Vfs9VisaEjb+q104YUTjG+xGNXTfvbNDqeevHX9bzUHhBI7YbkNOgkA/so0KpK6Zcl
 Nq7pSLZAiu7dColrSj3uyIdFo4aRPmyTK8DQlGA4kvDEgfuvouOSWxSgTfGGnS7ZK+jB
 QZOw==
X-Gm-Message-State: AOAM531mxFtxtf/BYrVQ1BExq3YDTVofL3Y2SQ3+CnNYyjyxBBqYvSTx
 26BL5p3J6FUEXk1KUG6zO2E7iu+xOcM=
X-Google-Smtp-Source: ABdhPJzV1k0OTcBLsUXqJnRM2wuLYZpQLoilxcqFFWEqLsOqvkeZ9MhHtkOzN+qbGt6ujKc6DCoiow==
X-Received: by 2002:ac8:44b4:: with SMTP id a20mr824970qto.166.1630701115933; 
 Fri, 03 Sep 2021 13:31:55 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/15] target/ppc/power8_pmu.c: enable PMC1 counter
 negative overflow
Date: Fri,  3 Sep 2021 17:31:12 -0300
Message-Id: <20210903203116.80628-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
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

This patch starts the counter negative EBB support by enabling PMC1
counter negative overflow when PMC1 is counting cycles.

A counter negative overflow happens when a performance monitor counter
reaches the value 0x80000000. When that happens, if counter negative
condition events are enabled in that counter, a performance monitor
alert is triggered. For PMC1, this condition is enabled by MMCR0_PMC1CE.

Cycle counting is done by calculating elapsed time between the time
the PMU started to run and when the PMU is shut down. Our clock is
fixed in 1Ghz, so 1 cycle equals 1 nanoseconds. The same idea is used to
predict a counter negative overflow: calculate the amount of nanoseconds
for the timer to reach 0x80000000, start a timer with it and trigger the
performance monitor alert. If event-based exceptions are enabled (bit
MMCR0_EBE), we'll go ahead and fire a PPC_INTERRUPT_PMC.

A new function 'start_cycle_count_session' was added to encapsulate the
most common steps of cycle calculation: redefine base time and start
overflow timers. This will avoid code repetition in the next patches.

Counter overflow for the remaining counters will be added shortly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  1 +
 target/ppc/power8_pmu.c | 99 +++++++++++++++++++++++++++++++++--------
 2 files changed, 82 insertions(+), 18 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 780eab6f92..ba93b30ae2 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 #define MMCR0_FC14 PPC_BIT(58) /* MMCR0 Freeze Counters 1-4 bit */
 #define MMCR0_FC56 PPC_BIT(59) /* MMCR0 Freeze Counters 5-6 bit */
+#define MMCR0_PMC1CE PPC_BIT(48) /* MMCR0 PMC1 Condition Enabled */
 
 #define MMCR1_EVT_SIZE 8
 /* extract64() does a right shift before extracting */
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index aa5df6f51f..b2224d363a 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -33,6 +33,8 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
     env->spr[sprn] += time_delta;
 }
 
+#define COUNTER_NEGATIVE_VAL 0x80000000
+
 static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
 {
     uint8_t evt_extr = 0;
@@ -117,30 +119,91 @@ static void update_cycles_PMCs(CPUPPCState *env)
     }
 }
 
+static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
+{
+    int64_t remaining_cyc;
+
+    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
+        return 0;
+    }
+
+    remaining_cyc = COUNTER_NEGATIVE_VAL - env->spr[sprn];
+    return remaining_cyc;
+}
+
+static bool counter_negative_cond_enabled(uint64_t mmcr0)
+{
+    return mmcr0 & MMCR0_PMC1CE;
+}
+
+/*
+ * A cycle count session consists of the basic operations we
+ * need to do to support PM_CYC events: redefine a new base_time
+ * to be used to calculate PMC values and start overflow timers.
+ */
+static void start_cycle_count_session(CPUPPCState *env)
+{
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t timeout;
+
+    env->pmu_base_time = now;
+
+    /*
+     * Always delete existing overflow timers when starting a
+     * new cycle counting session.
+     */
+    timer_del(env->pmu_intr_timers[0]);
+
+    if (!counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
+        return;
+    }
+
+    if (!pmc_is_running(env, SPR_POWER_PMC1)) {
+        return;
+    }
+
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
+        return;
+    }
+
+    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
+    case 0xF0:
+    case 0x1E:
+        timeout = get_CYC_timeout(env, SPR_POWER_PMC1);
+        break;
+    default:
+        return;
+    }
+
+    timer_mod(env->pmu_intr_timers[0], now + timeout);
+}
+
 static void cpu_ppc_pmu_timer_cb(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
-    uint64_t mmcr0;
-
-    mmcr0 = env->spr[SPR_POWER_MMCR0];
-    if (env->spr[SPR_POWER_MMCR0] & MMCR0_EBE) {
-        /* freeeze counters if needed */
-        if (mmcr0 & MMCR0_FCECE) {
-            mmcr0 &= ~MMCR0_FCECE;
-            mmcr0 |= MMCR0_FC;
-        }
 
-        /* Clear PMAE and set PMAO */
-        if (mmcr0 & MMCR0_PMAE) {
-            mmcr0 &= ~MMCR0_PMAE;
-            mmcr0 |= MMCR0_PMAO;
-        }
-        env->spr[SPR_POWER_MMCR0] = mmcr0;
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
+        return;
+    }
 
-        /* Fire the PMC hardware exception */
-        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
+
+        /* Changing MMCR0_FC demands a new hflags compute */
+        hreg_compute_hflags(env);
+    }
+
+    update_cycles_PMCs(env);
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
     }
+
+    /* Fire the PMC hardware exception */
+    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
 }
 
 void cpu_ppc_pmu_timer_init(CPUPPCState *env)
@@ -184,7 +247,7 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
         if (!curr_FC) {
             update_cycles_PMCs(env);
         } else {
-            env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            start_cycle_count_session(env);
         }
     }
 }
-- 
2.31.1


