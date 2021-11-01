Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0779442486
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:13:21 +0100 (CET)
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhQP-0007Lq-FX
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAu-0003yz-22; Mon, 01 Nov 2021 19:57:12 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAr-0006F5-He; Mon, 01 Nov 2021 19:57:11 -0400
Received: by mail-qt1-x82c.google.com with SMTP id n2so17475216qta.2;
 Mon, 01 Nov 2021 16:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K1ql/mIIoqVJi+X067ncr0Ny0IrIx5b5vPGqxKzIt2s=;
 b=P7bjoCQCKpokLs2K6vV/iJlNEV4kI/vec9typlW8t1a3JFS6X9+6Na7fgAxg+cyuWZ
 WVGAgnAyN5By9JMsfvuOygHK7KLsSYgehuMAt57E8ec/E4guKX+zZuDlXERIwzaHJod3
 RTm+setHlTf9ar46zzQeTAjtrZNu3CFQzo8w/2jGSYamJmkHMKzbnWn7dy+ZOXciCvBy
 W1GFg0Zz7TJTRknmNsnfg4G0Q18hY2cCq6wOz0Vwk2sKbBKm1yYesk6U5Rt56sgzjcxb
 zWSqAQN005G0JIwMxSOqtnbNMCXUKuDhY7vA+4pVKDI8qO9gMoWVmCfZJzumvETmciQy
 fZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K1ql/mIIoqVJi+X067ncr0Ny0IrIx5b5vPGqxKzIt2s=;
 b=W4/ZzpIHksDfLh3VrOw7h18QND+CWJxe2xhnXWR6lsn/BIN3KtTBcuxLCCM5AXB6nh
 feSzeJwC+/xRJagOUURli5oS8eVKf70zRZHSU7N/N6EaiIGDjH0f+nVlCrGv5Hl4jpxc
 JtxQxUB2FOzsrwEywwQx1zuo9mxCionQWkZhYaUaafX/w/x1YW91xwCQ93tlciv0uzYA
 b8Z1k2wevjWVcMZk5mX+tFOfufWkcFb1tX0W+nnPc3h/gbyikeauHcbeJu8duC7YvDGL
 kZmbiE88+VRXSKB/jexysitGEQKCqIizQD24ciqp6cDDAX836ALmGacYxCy2E2ch5Vmp
 u20g==
X-Gm-Message-State: AOAM530s7VnjmzduvLLzadY0sSyxa9VwhKC0jAIin6a2E1E9ksluT5Cd
 Y9jcm6x/+monOqBemaGmgZt4u6MFpAs=
X-Google-Smtp-Source: ABdhPJx91u4YUWZr6Y1u5x8yzp/fheye2pUaqVG8NSqVCOVwMpMfFAargwhd2Oi+yh//PjET3BF/7g==
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr13141198qtp.414.1635811028255; 
 Mon, 01 Nov 2021 16:57:08 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/10] target/ppc: enable PMU counter overflow with cycle
 events
Date: Mon,  1 Nov 2021 20:56:35 -0300
Message-Id: <20211101235642.926773-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerISA v3.1 defines that if the proper bits are set (MMCR0_PMC1CE
for PMC1 and MMCR0_PMCjCE for the remaining PMCs), counter negative
conditions are enabled. This means that if the counter value overflows
(i.e. exceeds 0x80000000) a performance monitor alert will occur. This alert
can trigger an event-based exception (to be implemented in the next patches)
if the MMCR0_EBE bit is set.

For now, overflowing the counter when the PMC is counting cycles will
just trigger a performance monitor alert. This is done by starting the
overflow timer to expire in the moment the overflow would be occuring. The
timer will call fire_PMC_interrupt() (via cpu_ppc_pmu_timer_cb) which will
trigger the PMU alert and, if the conditions are met, an EBB exception.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  2 +
 target/ppc/power8-pmu.c | 86 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6c4643044b..bf718334a5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,8 @@ typedef enum {
 #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
 #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
+#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled */
+#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index a0a42b666c..fdc94d40b2 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,8 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+#define COUNTER_NEGATIVE_VAL 0x80000000
+
 /*
  * For PMCs 1-4, IBM POWER chips has support for an implementation
  * dependent event, 0x1E, that enables cycle counting. The Linux kernel
@@ -93,6 +95,15 @@ static bool pmc_is_active(CPUPPCState *env, int sprn)
     return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
 }
 
+static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
+{
+    if (sprn == SPR_POWER_PMC1) {
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
+    }
+
+    return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
+}
+
 static void pmu_update_cycles(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -121,6 +132,63 @@ static void pmu_update_cycles(CPUPPCState *env)
     }
 }
 
+static void pmu_delete_timers(CPUPPCState *env)
+{
+    int i;
+
+    for (i = 0; i < PMU_TIMERS_NUM; i++) {
+        timer_del(env->pmu_cyc_overflow_timers[i]);
+    }
+}
+
+/*
+ * Helper function to retrieve the cycle overflow timer of the
+ * 'sprn' counter. Given that PMC5 doesn't have a timer, the
+ * amount of timers is less than the total counters and the PMC6
+ * timer is the last of the array.
+ */
+static QEMUTimer *get_cyc_overflow_timer(CPUPPCState *env, int sprn)
+{
+    if (sprn == SPR_POWER_PMC5) {
+        return NULL;
+    }
+
+    if (sprn == SPR_POWER_PMC6) {
+        return env->pmu_cyc_overflow_timers[PMU_TIMERS_NUM - 1];
+    }
+
+    return env->pmu_cyc_overflow_timers[sprn - SPR_POWER_PMC1];
+}
+
+static void pmu_start_overflow_timers(CPUPPCState *env)
+{
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t timeout;
+    int sprn;
+
+    env->pmu_base_time = now;
+
+    /*
+     * Scroll through all PMCs ad start counter overflow timers for
+     * PM_CYC events, if needed.
+     */
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        if (!pmc_is_active(env, sprn) ||
+            !(getPMUEventType(env, sprn) == PMU_EVENT_CYCLES) ||
+            !pmc_has_overflow_enabled(env, sprn)) {
+            continue;
+        }
+
+        if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
+            timeout =  0;
+        } else {
+            timeout  = COUNTER_NEGATIVE_VAL - env->spr[sprn];
+        }
+
+        timer_mod(get_cyc_overflow_timer(env, sprn), now + timeout);
+    }
+}
+
 /*
  * A cycle count session consists of the basic operations we
  * need to do to support PM_CYC events: redefine a new base_time
@@ -128,8 +196,22 @@ static void pmu_update_cycles(CPUPPCState *env)
  */
 static void start_cycle_count_session(CPUPPCState *env)
 {
-    /* Just define pmu_base_time for now */
-    env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    bool overflow_enabled = env->spr[SPR_POWER_MMCR0] &
+                            (MMCR0_PMC1CE | MMCR0_PMCjCE);
+
+    /*
+     * Always delete existing overflow timers when starting a
+     * new cycle counting session.
+     */
+    pmu_delete_timers(env);
+
+    if (!overflow_enabled) {
+        /* Define pmu_base_time and leave */
+        env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        return;
+    }
+
+    pmu_start_overflow_timers(env);
 }
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
-- 
2.31.1


