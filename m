Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ACB45DD2D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:18:17 +0100 (CET)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGVs-0000pu-O6
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:18:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMc-00030D-RO; Thu, 25 Nov 2021 10:08:42 -0500
Received: from [2607:f8b0:4864:20::929] (port=34601
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMZ-00021p-No; Thu, 25 Nov 2021 10:08:42 -0500
Received: by mail-ua1-x929.google.com with SMTP id n6so12972156uak.1;
 Thu, 25 Nov 2021 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L15TyunQSPLpeyDwTDac2HcG6DjqdeVGyLe9GooXuGY=;
 b=dIMmzGYSdjQjsjv6AxqtX66pqqhAIjDR+N9mSOlcodba+GCInqYDgJZDdpym5L0q2c
 Eal0eym3wLd5eXNFEyotV440MZl5iWjCtcQ7v+yoAt2nT+IIf60uBdwd/7a8wNWfddID
 WDjMh9u/menOEA6wVaUqCuWD9OoT0QjZKzb5M23n5sxB+g15dwHPyasfUpBmFkCLI7by
 2Pz+MRiHFCN2rruyhunbRe5BRKx8Ak3D9nuP8Bv0m64paU+hJF7uzRfs/4oaZ+PxY3bz
 vuqulR3ajsvD2L/rvUDkNINj6D9ydRi4dMzUCa+HhKe536NP8P0KPZ0ZeaXmppwdvfzo
 IkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L15TyunQSPLpeyDwTDac2HcG6DjqdeVGyLe9GooXuGY=;
 b=I0RG/lGZQeVp0xPNHdX5kRe4DfoqZQfKmxFkkDtauITtanlZlLiuHxn/jYN3CjHdF6
 D+i7JgS8Hyz61O8j3DLWmDVzNWkSO0LDKo+nPZtXtVejgZIOpGkfIeMZsMOkAgYkHAuk
 I1g0AukF0YQIaT6yF/HAMCZT9MrfmQ7tb4hYJjgp69XRd4WXdrGHPBc4uOCVn/kVIt4G
 gEaTHQuh7xy0DkhLh8Hgj9Uo9yeReq8g07zkH8IXPyy88fz+NHTDgicr0WlRBhbSEMFe
 tBUQZXM7WEYLpZTTLrNBvKcy6bVuf3LHhmnIWMzZdQul2ZRht58vsNDDbSJylTQ7ReIK
 5usg==
X-Gm-Message-State: AOAM531Ol2aykt58u8rFC7VS5236Tr12F3fy1tB4rxUU2GzEYTjFRTxh
 OME5613RQ2uIyeC/zGfpuW6ygxH8KIo=
X-Google-Smtp-Source: ABdhPJz0zCJXVlbhRWas4ifNdZLffb84oPzxjq2E10kcx85V77f1hj8eIYJ2qJ4whsL5WKvdTveQ9g==
X-Received: by 2002:a05:6102:5489:: with SMTP id
 bk9mr10395388vsb.37.1637852918336; 
 Thu, 25 Nov 2021 07:08:38 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id i27sm2081057uab.8.2021.11.25.07.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:08:38 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/10] target/ppc: enable PMU counter overflow with cycle
 events
Date: Thu, 25 Nov 2021 12:08:12 -0300
Message-Id: <20211125150817.573204-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125150817.573204-1-danielhb413@gmail.com>
References: <20211125150817.573204-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
 target/ppc/cpu.h        |  2 ++
 target/ppc/power8-pmu.c | 80 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 9c732953f0..9b41b022e2 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -364,6 +364,8 @@ typedef enum {
 #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
 #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
+#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled */
+#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index acdaee7459..01e0b9b8fc 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,8 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
+
 static bool pmc_is_inactive(CPUPPCState *env, int sprn)
 {
     if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
@@ -36,6 +38,15 @@ static bool pmc_is_inactive(CPUPPCState *env, int sprn)
     return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
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
 /*
  * For PMCs 1-4, IBM POWER chips has support for an implementation
  * dependent event, 0x1E, that enables cycle counting. The Linux kernel
@@ -123,6 +134,70 @@ static void pmu_update_cycles(CPUPPCState *env)
     env->pmu_base_time = now;
 }
 
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
+static void pmc_update_overflow_timer(CPUPPCState *env, int sprn)
+{
+    QEMUTimer *pmc_overflow_timer;
+    int64_t timeout;
+
+    /* PMC5 does not have an overflow timer */
+    if (sprn == SPR_POWER_PMC5) {
+        return;
+    }
+
+    pmc_overflow_timer = get_cyc_overflow_timer(env, sprn);
+
+    if (pmc_get_event(env, sprn) != PMU_EVENT_CYCLES ||
+        !pmc_has_overflow_enabled(env, sprn)) {
+        /* Overflow timer is not needed for this counter */
+        timer_del(pmc_overflow_timer);
+        return;
+    }
+
+    if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL) {
+        timeout =  0;
+    } else {
+        timeout = PMC_COUNTER_NEGATIVE_VAL - env->spr[sprn];
+    }
+
+    /*
+     * Use timer_mod_anticipate() because an overflow timer might
+     * be already running for this PMC.
+     */
+    timer_mod_anticipate(pmc_overflow_timer, env->pmu_base_time + timeout);
+}
+
+static void pmu_update_overflow_timers(CPUPPCState *env)
+{
+    int sprn;
+
+    /*
+     * Scroll through all PMCs and start counter overflow timers for
+     * PM_CYC events, if needed.
+     */
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        pmc_update_overflow_timer(env, sprn);
+    }
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     target_ulong curr_value = env->spr[SPR_POWER_MMCR0];
@@ -143,6 +218,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
         (curr_FC != new_FC)) {
         hreg_compute_hflags(env);
     }
+
+    /* Update cycle overflow timers with the current MMCR0 state */
+    pmu_update_overflow_timers(env);
 }
 
 void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
@@ -164,6 +242,8 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
     pmu_update_cycles(env);
 
     env->spr[sprn] = value;
+
+    pmc_update_overflow_timer(env, sprn);
 }
 
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
-- 
2.31.1


