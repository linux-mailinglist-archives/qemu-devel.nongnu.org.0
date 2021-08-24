Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBF3F6301
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:45:32 +0200 (CEST)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZYE-0002Vi-41
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKb-0008Mz-DH; Tue, 24 Aug 2021 12:31:21 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKY-00009p-IW; Tue, 24 Aug 2021 12:31:21 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id v1so12014030qva.7;
 Tue, 24 Aug 2021 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wW0MdMhFaeYhiFUBYH99bJNN0Mi2H1RT/x8RtX+6cl8=;
 b=cgQMtOZvQVYV+fnoyGR1wY9TMYIlmCRP52r1eyFlS0VS2vS7308xqJhUDg6Cv4bNt5
 E56EF8Q/VGT3C+TxtBP/DDYEGDET8wklo561PqYt8pcWlclqvw5MzZsids6v/SgUVwsh
 y+t+zkUXlo4zbjC49HQNatEsnrkxuoPnyt3NoG+3QQApV78winZMUt5IEKgxjMEMXxYo
 khwWPRXDC07+WHVT3DBIPvY6cOXNEB8HEz/FiAL5fwk2VCUXqlE/OdiRGHRkYd7s+5fS
 g35E5Uq7Ht4ZbKVdpCx06ONGjl/TX8dp1X9RtYdwsD74tjBO40ILCVEhIag7UO6jbriz
 AmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wW0MdMhFaeYhiFUBYH99bJNN0Mi2H1RT/x8RtX+6cl8=;
 b=Byy8CIoMLmadPwEQfCRMJzu93zzbPnvr3GppZGO5dkNuz9CyCTFTsNtEUtlXZ2MM7l
 E90djVBkfX50fvQHPvP8O/UADEJSVbEZ0kTq04t/ED32Vzlv6Fn9uwHq3G0L8IQEAUuM
 +de7kQvxRGEmB3sXaQmJgOkd4owZm6Ueqzhd5aWwZPLNYyCIzpXDwAcQYHFtqOgkoBzv
 wu9YIOEuEoEdrv7x1cDUk3BaBDPTkCQJ6Xb36GM28wvtC1SnqIX1EiLF7qnTqe0cmCIl
 V/MtNx0xwAeFeO6MmXjUa6X4yK8Sv8hOQ7vBZ2G0LGcTvpz9CB4TLrj1XIgTGz9BTJsR
 kNRg==
X-Gm-Message-State: AOAM530ywpahoLgilMaeC4WAqVpgnkMbsUo2k5u762utENpLo369vpAf
 pz1I5JDXegjSiCjJ1GUbZepltdmc65o=
X-Google-Smtp-Source: ABdhPJwpmzp5M9hkNqFbeDOygGiXQXUaJ9z9kLnqDClJsaatwrhRVktihCknVgR5NbaL9g86Q97MaQ==
X-Received: by 2002:a05:6214:332:: with SMTP id
 j18mr8891039qvu.12.1629822676999; 
 Tue, 24 Aug 2021 09:31:16 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/16] target/ppc/power8_pmu.c: enable PMC1 counter
 negative overflow
Date: Tue, 24 Aug 2021 13:30:28 -0300
Message-Id: <20210824163032.394099-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2b.google.com
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
 target/ppc/power8_pmu.c | 96 +++++++++++++++++++++++++++++++++--------
 2 files changed, 79 insertions(+), 18 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 535754ddff..b9d5dca983 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -352,6 +352,7 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_FC14 PPC_BIT(58)
 #define MMCR0_FC56 PPC_BIT(59)
+#define MMCR0_PMC1CE PPC_BIT(48)
 
 #define MMCR1_PMC1SEL_SHIFT (63 - 39)
 #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index a57b602125..d10f371b5f 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -33,6 +33,8 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
     env->spr[sprn] += time_delta;
 }
 
+#define COUNTER_NEGATIVE_VAL 0x80000000
+
 static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
 {
     int event = 0x0;
@@ -116,30 +118,88 @@ static void update_cycles_PMCs(CPUPPCState *env)
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
     }
+
+    update_cycles_PMCs(env);
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
+    }
+
+    /* Fire the PMC hardware exception */
+    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
 }
 
 void cpu_ppc_pmu_timer_init(CPUPPCState *env)
@@ -182,7 +242,7 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
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


