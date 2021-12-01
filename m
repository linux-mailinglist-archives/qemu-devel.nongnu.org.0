Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE1465184
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:25:10 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRTp-0006Zq-Gt
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:25:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMv-0006af-5q; Wed, 01 Dec 2021 10:18:01 -0500
Received: from [2607:f8b0:4864:20::932] (port=34541
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMo-0003JP-U7; Wed, 01 Dec 2021 10:18:00 -0500
Received: by mail-ua1-x932.google.com with SMTP id n6so49825602uak.1;
 Wed, 01 Dec 2021 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jhZXop/qzKFJNcwdbfFYC9SLQnVP6TjDWUGCPJjEgA=;
 b=UQwnbQxJmoUcvELkblKVdBRyoSy6BoyDDvBghTDeBdyCEFNrX5/tBR8xNsx4x3xuwO
 biU96TvhUGNYU6ki2D9KdBzVRhGmO+NYBhjBAuWY+blLn3VuthD3ctUtEGEBh35Z/Og9
 oG/rpguY49mj5z6FOgNbCTBcFi9y7ecvm2KDdxjK5q6zv2huLgyDxZq4rmGoCnBjeNuA
 C+HSgrbPpiyGCpsZTlG8vKFUm1IVVNgeSTjnT3sNP0y4gYM/qMN4a5D/TnF4PMzTF8Tb
 /A2+X0n3D1i7B5+lhESFGXGFjbVDKK7o2Fk0Far14ygRr5cgoG8/+sTt06mft4yp6NJC
 6h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jhZXop/qzKFJNcwdbfFYC9SLQnVP6TjDWUGCPJjEgA=;
 b=3tpAr775vLUQ9f8AXzzEQzgtY/cZLTIFsNoWFd9izWC62Uq1d0tSArbE3bINVeHByu
 jItS7gsyk6yIX7jDDiTlyhlkasE1uRAnb9/bhlreCQz7FEtVklVoQSRFhhZwL9dU+zjF
 89c4KO8glHWwLjN1xbb7py6o0bNoeqYGVkKptClPFuDRr0fOHHS/ksnqucx8WkKnAfVR
 jWhEVciUv1zObQRvWbFx+vZZ0E7lUAOnXY23BZN+hiE4Nt4D2M884IjmoeWNfefNY7J+
 AUcJO9S9Oj3aIRR7LPQK8S9n2l74uDEavfvw2RGkaFe6/+O2EyUX6hcxRwnmrracsxNx
 ZJEw==
X-Gm-Message-State: AOAM5319vehetk+cxRX9gxR9yJ2s/ZkTIFQi0/4ohbnsBAa7FfQIlzvN
 upDV+UNmqPslYPjAPEedNmY2xinT0TE=
X-Google-Smtp-Source: ABdhPJyhfFJOi2oLiU8ssz1fQQlmPN8F69UEFguLTmK+4L4OqZmCkY5DEFU+kv+jEj46rxzAxsynew==
X-Received: by 2002:a67:d31c:: with SMTP id a28mr8289929vsj.20.1638371873457; 
 Wed, 01 Dec 2021 07:17:53 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:17:53 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 02/10] target/ppc: PMU basic cycle count for pseries TCG
Date: Wed,  1 Dec 2021 12:17:26 -0300
Message-Id: <20211201151734.654994-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
References: <20211201151734.654994-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

This patch adds the barebones of the PMU logic by enabling cycle
counting. The overall logic goes as follows:

- MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
having to spin the PMU right at system init;

- to retrieve the events that are being profiled, pmc_get_event() will
check the current MMCR0 and MMCR1 value and return the appropriate
PMUEventType. For PMCs 1-4, event 0x2 is the implementation dependent
value of PMU_EVENT_INSTRUCTIONS and event 0x1E is the implementation
dependent value of PMU_EVENT_CYCLES. These events are supported by IBM
Power chips since Power8, at least, and the Linux Perf driver makes use
of these events until kernel v5.15. For PMC1, event 0xF0 is the
architected PowerISA event for cycles. Event 0xFE is the architected
PowerISA event for instructions;

- if the counter is frozen, either via the global MMCR0_FC bit or its
individual frozen counter bits, PMU_EVENT_INACTIVE is returned;

- pmu_update_cycles() will go through each counter and update the
values of all PMCs that are counting cycles. This function will be
called every time a MMCR0 update is done to keep counters values
up to date. Upcoming patches will use this function to allow the
counters to be properly updated during read/write of the PMCs
and MMCR1 writes.

Given that the base CPU frequency is fixed at 1Ghz for both powernv and
pseries clock, cycle calculation assumes that 1 nanosecond equals 1 CPU
cycle. Cycle value is then calculated by adding the elapsed time, in
nanoseconds, of the last cycle update done via pmu_update_cycles().

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 |  20 ++++++
 target/ppc/cpu_init.c            |   6 +-
 target/ppc/helper.h              |   1 +
 target/ppc/power8-pmu-regs.c.inc |  23 ++++++-
 target/ppc/power8-pmu.c          | 110 +++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h             |   1 +
 6 files changed, 157 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6154f86a0a..0d9690c937 100644
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
     QEMUTimer *pmu_cyc_overflow_timers[PMU_COUNTERS_NUM];
+
+    /*
+     * PMU base time value used by the PMU to calculate
+     * running cycles.
+     */
+    uint64_t pmu_base_time;
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9610e65c76..e0b6fe4057 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6821,8 +6821,8 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
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
@@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
                  &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
                  &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
+                 0x80000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 627811cefc..ea60a7493c 100644
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
index d443bcb6c6..5e689144d7 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,116 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+static bool pmc_is_inactive(CPUPPCState *env, int sprn)
+{
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
+        return true;
+    }
+
+    if (sprn < SPR_POWER_PMC5) {
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_FC14;
+    }
+
+    return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
+}
+
+/*
+ * For PMCs 1-4, IBM POWER chips has support for an implementation
+ * dependent event, 0x1E, that enables cycle counting. The Linux kernel
+ * makes extensive use of 0x1E, so let's also support it.
+ *
+ * Likewise, event 0x2 is an implementation-dependent event that IBM
+ * POWER chips implement (at least since POWER8) that is equivalent to
+ * PM_INST_CMPL. Let's support this event on PMCs 1-4 as well.
+ */
+static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
+{
+    uint8_t mmcr1_evt_extr[] = { MMCR1_PMC1EVT_EXTR, MMCR1_PMC2EVT_EXTR,
+                                 MMCR1_PMC3EVT_EXTR, MMCR1_PMC4EVT_EXTR };
+    PMUEventType evt_type = PMU_EVENT_INVALID;
+    uint8_t pmcsel;
+    int i;
+
+    if (pmc_is_inactive(env, sprn)) {
+        return PMU_EVENT_INACTIVE;
+    }
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
+static void pmu_update_cycles(CPUPPCState *env)
+{
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t time_delta = now - env->pmu_base_time;
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        if (pmc_get_event(env, sprn) != PMU_EVENT_CYCLES) {
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
+    /* Update base_time for future calculations */
+    env->pmu_base_time = now;
+}
+
+void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
+{
+    pmu_update_cycles(env);
+
+    env->spr[SPR_POWER_MMCR0] = value;
+
+    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
+    hreg_compute_hflags(env);
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


