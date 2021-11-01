Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26A4424C3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:29:53 +0100 (CET)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhgX-0003sS-14
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAs-0003vO-9R; Mon, 01 Nov 2021 19:57:10 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAp-0006Ep-9V; Mon, 01 Nov 2021 19:57:10 -0400
Received: by mail-qt1-x82d.google.com with SMTP id 19so15873143qtt.7;
 Mon, 01 Nov 2021 16:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imvem+hnorzhHPYhH22InPHngTo8hZAZdMkiERIhEbw=;
 b=Jl2uEekhz5XDXNi7LDXHPuQXGorbkY7/+OKvhIUnKmR2nCmGaA9p+3WURVJHmH6Rbq
 ydqSuRf35k/h3mrOAfQvoD6MkC1yAvYEgIIcsaWhHpMUDAxrTBvCsVzij02iQtLniBEe
 MS3sG5BG8YO4lXtniPGSQ56aCxWNXo0OMWH/2tkKqzc3xqZxD0ynWLdg5ttGufOqHE1q
 TDwXFJqGxNci8dyo1iXwPr5q59kYt56hdRFRg+C6LejUzQk40KPfmiUJipshu3a3cogF
 pDZwfkRXiiBzWHngjkeFBKUIZQHy4HfS/4ANjMGqdS43pPb2K4K4jga0dNzWKvgC/Ym7
 cz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imvem+hnorzhHPYhH22InPHngTo8hZAZdMkiERIhEbw=;
 b=Peu7RhvyfwHQubAzEsO0OCfkD9CnSVWRx3hMf1YCRQlNEhw7FwqRTkVYCfJwvTamNO
 QHWVcbbbxwKRrMswEL5o+zeUDzSLmpXcFqtsjohLBdd/3WzgyzmhMXW5p8rtxvee4Jpn
 E/JGgCPjWq/rl94+Yt3NxIt9kCSytbYTrlbDGPPKDp87/HtVJ17QmSJ56vNoVzz/esfo
 ecu+L3qO4V2zM6uWRgYIPyJ3rsO/3xPTgAttxJ6JXPCHM5S0dyOSiY0AE1K58I8hCXAJ
 5iygbE/pGCLME3YtOPizTQYz/lU6U+qe79zHFAVDNr6qcF8gsx5yvcZyi/B+nMuyFK6Y
 0Cyg==
X-Gm-Message-State: AOAM5331j8gNEKIn8TsDtT2MFgqSszjMAI9+5aVeUmn3T+1eQGaaRt9z
 IKh/JbEgDAzdRaqWfMQT0iR7d3pkoFI=
X-Google-Smtp-Source: ABdhPJwNyqoVeEU4mfeS0IQR2EcwKOOxgkdxUixfbCfSwYgiWIYXiwldOU51+CLV/qNhCW95bhRvtw==
X-Received: by 2002:a05:622a:50a:: with SMTP id
 l10mr34475707qtx.73.1635811025569; 
 Mon, 01 Nov 2021 16:57:05 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/10] target/ppc: PMU basic cycle count for pseries TCG
Date: Mon,  1 Nov 2021 20:56:34 -0300
Message-Id: <20211101235642.926773-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
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

This patch adds the barebones of the PMU logic by enabling cycle
counting. The overall logic goes as follows:

- a helper is added to control the PMU state on each MMCR0 write. This
allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
is cleared or set;

- MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
having to spin the PMU right at system init;

- to retrieve the events that are being profiled, getPMUEventType() will
check the current MMCR1 value and return the appropriate PMUEventType.
For PMCs 1-4, event 0x2 is the implementation dependent value of
PMU_EVENT_INSTRUCTIONS and event 0x1E is the implementation dependent
value of PMU_EVENT_CYCLES. These events are supported by IBM Power chips
since Power8, at least, and the Linux Perf driver makes use of these
events until kernel v5.15. For PMC1, event 0xF0 is the architected
PowerISA event for cycles. Event 0xFE is the architected PowerISA event
for instructions;

- the intended usage is to freeze the counters by setting MMCR0_FC, do
any additional setting of events to be counted via MMCR1 and enable
the PMU by zeroing MMCR0_FC. Software must freeze counters to read the
results - on the fly reading of the PMCs will return the starting value
of each one. This act of unfreezing the PMU, counting cycles and then
freezing the PMU again is being called a cycle count session.

Given that the base CPU frequency is fixed at 1Ghz for both powernv and
pseries clock, cycle calculation assumes that 1 nanosecond equals 1 CPU
cycle. Cycle value is then calculated by subtracting the current time
the PMU was frozen against the time in which the PMU started spining.

The counter specific frozen bits MMCR0_FC14 and MMCR0_FC56 were also
added as a mean to further control which PMCs were supposed to be
counting cycles during the session.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 |  20 +++++
 target/ppc/cpu_init.c            |   6 +-
 target/ppc/helper.h              |   1 +
 target/ppc/power8-pmu-regs.c.inc |  23 ++++-
 target/ppc/power8-pmu.c          | 142 +++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h             |   1 +
 6 files changed, 189 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5aeaee8a9c..6c4643044b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -360,6 +360,9 @@ typedef enum {
 #define MMCR0_FCECE  PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC0  PPC_BIT(44)         /* PMC Control bit 0 */
 #define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
+#define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
+#define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
+#define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
@@ -372,6 +375,17 @@ typedef enum {
 #define MMCR2_UREG_MASK (MMCR2_FC1P0 | MMCR2_FC2P0 | MMCR2_FC3P0 | \
                          MMCR2_FC4P0 | MMCR2_FC5P0 | MMCR2_FC6P0)
 
+#define MMCR1_EVT_SIZE 8
+/* extract64() does a right shift before extracting */
+#define MMCR1_PMC1SEL_START 32
+#define MMCR1_PMC1EVT_EXTR (64 - MMCR1_PMC1SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC2SEL_START 40
+#define MMCR1_PMC2EVT_EXTR (64 - MMCR1_PMC2SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC3SEL_START 48
+#define MMCR1_PMC3EVT_EXTR (64 - MMCR1_PMC3SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC4SEL_START 56
+#define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
@@ -1206,6 +1220,12 @@ struct CPUPPCState {
      * when counting cycles.
      */
     QEMUTimer *pmu_cyc_overflow_timers[PMU_TIMERS_NUM];
+
+    /*
+     * PMU base time value used by the PMU to calculate
+     * running cycles.
+     */
+    uint64_t pmu_base_time;
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 65545ba9ca..6c384c3ac2 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6820,8 +6820,8 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCR0, 0x00000000);
+                     &spr_read_generic, &spr_write_MMCR0,
+                     KVM_REG_PPC_MMCR0, 0x80000000);
     spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_generic,
@@ -6869,7 +6869,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
                  &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
                  &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
+                 0x80000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 72e66c5fe8..8e3657afe1 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
+DEF_HELPER_2(store_mmcr0, void, env, tl)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 7391851238..fbb8977641 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -104,6 +104,17 @@ void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
     tcg_temp_free(t0);
 }
 
+static void write_MMCR0_common(DisasContext *ctx, TCGv val)
+{
+    /*
+     * helper_store_mmcr0 will make clock based operations that
+     * will cause 'bad icount read' errors if we do not execute
+     * gen_icount_io_start() beforehand.
+     */
+    gen_icount_io_start(ctx);
+    gen_helper_store_mmcr0(cpu_env, val);
+}
+
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv masked_gprn;
@@ -119,7 +130,7 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
      */
     masked_gprn = masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR0,
                                             MMCR0_UREG_MASK);
-    gen_store_spr(SPR_POWER_MMCR0, masked_gprn);
+    write_MMCR0_common(ctx, masked_gprn);
 
     tcg_temp_free(masked_gprn);
 }
@@ -219,6 +230,11 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
     /* The remaining steps are similar to PMCs 1-4 userspace write */
     spr_write_PMC14_ureg(ctx, sprn, gprn);
 }
+
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
+{
+    write_MMCR0_common(ctx, cpu_gpr[gprn]);
+}
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
@@ -259,4 +275,9 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 3c2f73896f..a0a42b666c 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,148 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+/*
+ * For PMCs 1-4, IBM POWER chips has support for an implementation
+ * dependent event, 0x1E, that enables cycle counting. The Linux kernel
+ * makes extensive use of 0x1E, so let's also support it.
+ *
+ * Likewise, event 0x2 is an implementation-dependent event that IBM
+ * POWER chips implement (at least since POWER8) that is equivalent to
+ * PM_INST_CMPL. Let's support this event on PMCs 1-4 as well.
+ */
+static PMUEventType getPMUEventType(CPUPPCState *env, int sprn)
+{
+    uint8_t mmcr1_evt_extr[] = { MMCR1_PMC1EVT_EXTR, MMCR1_PMC2EVT_EXTR,
+                                 MMCR1_PMC3EVT_EXTR, MMCR1_PMC4EVT_EXTR };
+    PMUEventType evt_type = PMU_EVENT_INVALID;
+    uint8_t pmcsel;
+    int i;
+
+    if (sprn == SPR_POWER_PMC5) {
+        return PMU_EVENT_INSTRUCTIONS;
+    }
+
+    if (sprn == SPR_POWER_PMC6) {
+        return PMU_EVENT_CYCLES;
+    }
+
+    i = sprn - SPR_POWER_PMC1;
+    pmcsel = extract64(env->spr[SPR_POWER_MMCR1], mmcr1_evt_extr[i],
+                       MMCR1_EVT_SIZE);
+
+    switch (pmcsel) {
+    case 0x2:
+        evt_type = PMU_EVENT_INSTRUCTIONS;
+        break;
+    case 0x1E:
+        evt_type = PMU_EVENT_CYCLES;
+        break;
+    case 0xF0:
+        /*
+         * PMC1SEL = 0xF0 is the architected PowerISA v3.1
+         * event that counts cycles using PMC1.
+         */
+        if (sprn == SPR_POWER_PMC1) {
+            evt_type = PMU_EVENT_CYCLES;
+        }
+        break;
+    case 0xFE:
+        /*
+         * PMC1SEL = 0xFE is the architected PowerISA v3.1
+         * event to sample instructions using PMC1.
+         */
+        if (sprn == SPR_POWER_PMC1) {
+            evt_type = PMU_EVENT_INSTRUCTIONS;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return evt_type;
+}
+
+static bool pmc_is_active(CPUPPCState *env, int sprn)
+{
+    if (sprn < SPR_POWER_PMC5) {
+        return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
+    }
+
+    return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
+}
+
+static void pmu_update_cycles(CPUPPCState *env)
+{
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t time_delta = now - env->pmu_base_time;
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        if (!pmc_is_active(env, sprn) ||
+            getPMUEventType(env, sprn) != PMU_EVENT_CYCLES) {
+            continue;
+        }
+
+        /*
+         * The pseries and powernv clock runs at 1Ghz, meaning
+         * that 1 nanosec equals 1 cycle.
+         */
+        env->spr[sprn] += time_delta;
+    }
+
+    /*
+     * Update base_time for future calculations if we updated
+     * the PMCs while the PMU was running.
+     */
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_FC)) {
+        env->pmu_base_time = now;
+    }
+}
+
+/*
+ * A cycle count session consists of the basic operations we
+ * need to do to support PM_CYC events: redefine a new base_time
+ * to be used to calculate PMC values and start overflow timers.
+ */
+static void start_cycle_count_session(CPUPPCState *env)
+{
+    /* Just define pmu_base_time for now */
+    env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+}
+
+void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
+{
+    target_ulong curr_value = env->spr[SPR_POWER_MMCR0];
+    bool curr_FC = curr_value & MMCR0_FC;
+    bool new_FC = value & MMCR0_FC;
+
+    env->spr[SPR_POWER_MMCR0] = value;
+
+    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_MMCR0FC */
+    if (((curr_value & MMCR0_PMCC) != (value & MMCR0_PMCC)) ||
+        (curr_FC != new_FC)) {
+        hreg_compute_hflags(env);
+    }
+
+    /*
+     * In an frozen count (FC) bit change:
+     *
+     * - if PMCs were running (curr_FC = false) and we're freezing
+     * them (new_FC = true), save the PMCs values in the registers.
+     *
+     * - if PMCs were frozen (curr_FC = true) and we're activating
+     * them (new_FC = false), set the new base_time for future cycle
+     * calculations.
+     */
+    if (curr_FC != new_FC) {
+        if (!curr_FC) {
+            pmu_update_cycles(env);
+        } else {
+            start_cycle_count_session(env);
+        }
+    }
+}
+
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 520f1ef233..eb1d0c2bf0 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -25,6 +25,7 @@
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
-- 
2.31.1


