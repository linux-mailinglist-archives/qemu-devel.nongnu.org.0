Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A8449ED2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:55:40 +0100 (CET)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDYB-0000S6-NO
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:55:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDU2-0000qW-Hn; Mon, 08 Nov 2021 17:51:22 -0500
Received: from [2607:f8b0:4864:20::334] (port=45726
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDU0-0008FM-9B; Mon, 08 Nov 2021 17:51:22 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 l7-20020a0568302b0700b0055ae988dcc8so24785875otv.12; 
 Mon, 08 Nov 2021 14:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oO8MeUFmtu2u46mvu1cC1vaoB9UbZTBkoIz4rfLSPGQ=;
 b=EaUJo8WDQEYxTCZa64miT9mV7XLf/jZqhh4HOB6OhDGXxVOpg8GleCFB8Qo8GMBFV/
 4m1ozobpO1YmKrX8kmKn3QUgIwcDjnCLlPYHQywj3CPN0AZF+h9PRXD5K/4lrN83nlUy
 vbEzcL3j2tXPHOmEvJy1SYJPR2iyuABvApKtgfwCgMfbG1o5h+JTBPF1zjwbnotXCMTd
 ntCe04ClAddKppXccGfSVq8+MpJGDo/IBEHXgDIExgbixWY4Tz0Ch/oceqvAtrgPDJMM
 wvTsahl7D/IjdX0tD99dWuTOHf7A1BPJ97SnJBB/Pd2EKgZc+V0x2o1zFiRDE3kOr9ii
 p2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oO8MeUFmtu2u46mvu1cC1vaoB9UbZTBkoIz4rfLSPGQ=;
 b=6SNzYhJ59/deK7ekDhlFmIEz+H9LNAOVXNo+R9Waf/3GBGeFPKH/EKxDUyCnQy6LQU
 N49xjcJFLeKl39+ZSOKpwXAkKpUSmCndZ4b9bAhPq9Cfx+3nmdfPgHFKGqYUsbiI/CDZ
 xGP5N1hVUoRAqwkJa4n3Cq56va9SeKhAABGL1GVpzTkQVCRZ8FOjMC7TmVoHkxNscg5T
 EgE/nN9YM+eHqpMIOaBRSc4iVzOCW6RvZlr58ZnJdz2/BwPDBXJhaiFQdSdBIfdkOnDJ
 s9h1xX2LO0eBfj0ZX3qemk+q2V4kwNV3BGuVGfBLQyneYyBPO+3+ShWuTkpV3aZhPsQG
 rvjw==
X-Gm-Message-State: AOAM530CCS4ucRsjeB/FwXLwPikBMjrf9PAXq3pEkaKjyaTlg//e30o8
 PhKig60v49/paRV/iXUGcrkETNcsz4A=
X-Google-Smtp-Source: ABdhPJy7m7XkIFOmHrJnhQLcbQzcNs2kRCIjPRa/N6nFDFS1NDftLY1I++RD1bAvHh7EPSIMjAvFPA==
X-Received: by 2002:a9d:2646:: with SMTP id a64mr2216305otb.249.1636411878789; 
 Mon, 08 Nov 2021 14:51:18 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id h3sm6487249oih.23.2021.11.08.14.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 14:51:18 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/10] target/ppc: enable PMU counter overflow with cycle
 events
Date: Mon,  8 Nov 2021 19:50:40 -0300
Message-Id: <20211108225047.1733607-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108225047.1733607-1-danielhb413@gmail.com>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
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
index 233fd8a9ca..f6265be974 100644
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
index 8674b8f0d6..68409b2236 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,8 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
+
 /*
  * For PMCs 1-4, IBM POWER chips has support for an implementation
  * dependent event, 0x1E, that enables cycle counting. The Linux kernel
@@ -93,6 +95,15 @@ static bool pmc_is_active(CPUPPCState *env, int sprn, uint64_t mmcr0)
     return !(mmcr0 & MMCR0_FC56);
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
 static void pmu_update_cycles(CPUPPCState *env, uint64_t old_mmcr0)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -116,6 +127,63 @@ static void pmu_update_cycles(CPUPPCState *env, uint64_t old_mmcr0)
     env->pmu_base_time = now;
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
+     * Scroll through all PMCs and start counter overflow timers for
+     * PM_CYC events, if needed.
+     */
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        if (!pmc_is_active(env, sprn, env->spr[SPR_POWER_MMCR0]) ||
+            !(getPMUEventType(env, sprn) == PMU_EVENT_CYCLES) ||
+            !pmc_has_overflow_enabled(env, sprn)) {
+            continue;
+        }
+
+        if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL) {
+            timeout =  0;
+        } else {
+            timeout = PMC_COUNTER_NEGATIVE_VAL - env->spr[sprn];
+        }
+
+        timer_mod(get_cyc_overflow_timer(env, sprn), now + timeout);
+    }
+}
+
 /*
  * A cycle count session consists of the basic operations we
  * need to do to support PM_CYC events: redefine a new base_time
@@ -123,8 +191,22 @@ static void pmu_update_cycles(CPUPPCState *env, uint64_t old_mmcr0)
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


