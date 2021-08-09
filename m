Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FDB3E4665
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:21:19 +0200 (CEST)
Received: from localhost ([::1]:38954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5D7-00018i-Vb
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD548-0003Cy-51; Mon, 09 Aug 2021 09:11:40 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:33576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD546-0001Z7-4i; Mon, 09 Aug 2021 09:11:39 -0400
Received: by mail-qk1-x736.google.com with SMTP id t66so18291001qkb.0;
 Mon, 09 Aug 2021 06:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j2uvG6HBmpLasY++HQP7vXGUVNU+74JMyPkqgUgyOQs=;
 b=ovzc91Lf5OdgLQa0inEGLdaW3Vxd1j7DRpl3aV+mOxxM4BJeUgoWJLBTt9FtdrWz66
 mfXVpMeU7Fl0rwlhp5fxrTN7X5Ge6+tYiPH7MfUbz12aOZHCmvoZraAwElx7Q2cnfl6W
 0UWLzhlyTNIkP/WNHzfW+HOt/2JpPN2qdsp2aVgoxrmywOBLeKm2erkkZVgVcoAVZPvr
 FmrC/gwYDAVutnn5bwT7PnuJ8h6qA2HBU7A0XzOK+XQX5degv7nug2wLG++z6W+v5a2O
 hejyo1WET+J4wGF7ItgCKe5nHpw0j8hMYkdM7aobL306IQrpZ5x9fbWWvrNdCSpoMSYt
 dPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2uvG6HBmpLasY++HQP7vXGUVNU+74JMyPkqgUgyOQs=;
 b=NAvycdJ76Vo+t/ac9If1W770KkNeWW/9iOVClvlOkSqjer+rC7qFfedJI2W/5bigZY
 G/rXG9DZhgjAvPk1kVgYQ0xteqVS1SwjOESs1QjuovVUYEf6ZQ8cU/zzQDh9WtwzkAc6
 1P1T+OmmAQc/fmjcHVfn7HZLFA0xsC5iPR9Z4+rH2ye6mTlVKUiKnRscZ56c5krKq9Nm
 dnkT8q8ZptT8lSCfHlt/0QzrqvYUTfDrOhsA94XYfOg9yPYUgMe4NrWGRGAamXyAU9sb
 oVxkUU1YBot/IEp21G2voyHi1SKi7OOzTGM1Xj50rqvMp/6kaMWeYhjPRvrPYEaOznP7
 A8Uw==
X-Gm-Message-State: AOAM533quVzfi9Z+++hDp6n8gklW7ITuSnOi8yHWGkWFM2tz7lNnAcIc
 U2iyOxhKpfd+d8B0m+e09rlSGlRHRRD5HA==
X-Google-Smtp-Source: ABdhPJybuKS9OlNyvRfjPBywl7gtRVlOPvl0bdzr+rD5U/QSzutEvXdSUjNRUgMI6aCV+otbq6NDEA==
X-Received: by 2002:a37:9f0b:: with SMTP id i11mr1311963qke.458.1628514696727; 
 Mon, 09 Aug 2021 06:11:36 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
Date: Mon,  9 Aug 2021 10:10:50 -0300
Message-Id: <20210809131057.1694145-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
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
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch starts the counter negative EBB support by enabling PMC1
counter negative condition.

A counter negative condition happens when a performance monitor counter
reaches the value 0x80000000. When that happens, if a counter negative
condition is enabled in that counter, a performance monitor alert is
triggered. For PMC1, this condition is enabled by MMCR0_PMC1CE.

An icount-based logic is used to predict when we need to wake up the timer
to trigger the alert in both PM_INST_CMPL (0x2) and PM_CYC (0x1E) events.
The timer callback will then trigger a PPC_INTERRUPT_PMC which will become a
event-based exception later.

Some EBB powerpc kernel selftests are passing after this patch, but a
substancial amount of them relies on other PMCs to be enabled and events
that we don't support at this moment. We'll address that in the next
patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h               |   1 +
 target/ppc/pmu_book3s_helper.c | 127 +++++++++++++++++++++++----------
 2 files changed, 92 insertions(+), 36 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1d38b8cf7a..5c81d459f4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -350,6 +350,7 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
 #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
+#define MMCR0_PMC1CE PPC_BIT(48)
 
 #define MMCR1_PMC1SEL_SHIFT (63 - 39)
 #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 43cc0eb722..58ae65e22b 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -25,6 +25,7 @@
  * and SPAPR code.
  */
 #define PPC_CPU_FREQ 1000000000
+#define COUNTER_NEGATIVE_VAL 0x80000000
 
 static uint64_t get_cycles(uint64_t icount_delta)
 {
@@ -32,22 +33,9 @@ static uint64_t get_cycles(uint64_t icount_delta)
                     NANOSECONDS_PER_SECOND);
 }
 
-static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
-                                    uint64_t icount_delta)
-{
-    env->spr[sprn] += icount_delta;
-}
-
-static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
-                              uint64_t icount_delta)
-{
-    env->spr[sprn] += get_cycles(icount_delta);
-}
-
-static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
-                                        uint64_t icount_delta)
+static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
 {
-    int event;
+    int event = 0x0;
 
     switch (sprn) {
     case SPR_POWER_PMC1:
@@ -65,11 +53,35 @@ static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
     case SPR_POWER_PMC4:
         event = MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
         break;
+    case SPR_POWER_PMC5:
+        event = 0x2;
+        break;
+    case SPR_POWER_PMC6:
+        event = 0x1E;
+        break;
     default:
-        return;
+        break;
     }
 
-    switch (event) {
+    return event;
+}
+
+static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
+                                    uint64_t icount_delta)
+{
+    env->spr[sprn] += icount_delta;
+}
+
+static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
+                              uint64_t icount_delta)
+{
+    env->spr[sprn] += get_cycles(icount_delta);
+}
+
+static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
+                                        uint64_t icount_delta)
+{
+    switch (get_PMC_event(env, sprn)) {
     case 0x2:
         update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
         break;
@@ -99,30 +111,57 @@ static void update_PMCs(CPUPPCState *env, uint64_t icount_delta)
     update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
 }
 
+static void set_PMU_excp_timer(CPUPPCState *env)
+{
+    uint64_t timeout, now, remaining_val;
+
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
+        return;
+    }
+
+    remaining_val = COUNTER_NEGATIVE_VAL - env->spr[SPR_POWER_PMC1];
+
+    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
+    case 0x2:
+        timeout = icount_to_ns(remaining_val);
+        break;
+    case 0x1e:
+        timeout = muldiv64(remaining_val, NANOSECONDS_PER_SECOND,
+                           PPC_CPU_FREQ);
+        break;
+    default:
+        return;
+    }
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    timer_mod(env->pmu_intr_timer, now + timeout);
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
+    uint64_t icount_delta = (uint64_t)icount_get_raw() - env->pmu_base_icount;
 
-        /* Clear PMAE and set PMAO */
-        if (mmcr0 & MMCR0_PMAE) {
-            mmcr0 &= ~MMCR0_PMAE;
-            mmcr0 |= MMCR0_PMAO;
-        }
-        env->spr[SPR_POWER_MMCR0] = mmcr0;
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
+        return;
+    }
+
+    update_PMCs(env, icount_delta);
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
+    }
 
-        /* Fire the PMC hardware exception */
-        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
     }
+
+    /* Fire the PMC hardware exception */
+    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
 }
 
 void cpu_ppc_pmu_timer_init(CPUPPCState *env)
@@ -134,12 +173,19 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
     env->pmu_intr_timer = timer;
 }
 
+static bool mmcr0_counter_neg_cond_enabled(uint64_t mmcr0)
+{
+    return mmcr0 & MMCR0_PMC1CE;
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     uint64_t curr_icount = (uint64_t)icount_get_raw();
     bool curr_FC = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
     bool new_FC = value & MMCR0_FC;
 
+    env->spr[SPR_POWER_MMCR0] = value;
+
     /*
      * In an frozen count (FC) bit change:
      *
@@ -163,10 +209,19 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
              * until the freeze.
              */
             update_PMCs(env, icount_delta);
+
+            /* delete pending timer */
+            timer_del(env->pmu_intr_timer);
         } else {
             env->pmu_base_icount = curr_icount;
+
+            /*
+             * Start performance monitor alert timer for counter negative
+             * events, if needed.
+             */
+            if (mmcr0_counter_neg_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
+                set_PMU_excp_timer(env);
+            }
         }
     }
-
-    env->spr[SPR_POWER_MMCR0] = value;
 }
-- 
2.31.1


