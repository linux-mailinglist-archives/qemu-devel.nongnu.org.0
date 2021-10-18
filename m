Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE5430D42
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:09:19 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH9S-0007Aj-7V
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2S-0006cB-6n; Sun, 17 Oct 2021 21:02:04 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:41956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2P-0000za-V6; Sun, 17 Oct 2021 21:02:03 -0400
Received: by mail-ua1-x936.google.com with SMTP id r17so4674372uaf.8;
 Sun, 17 Oct 2021 18:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGiyPnLuA/xqUZQq9SktNT0IPulutKDntAZtHFZNn7A=;
 b=LYhtnEYiMMVe9RfatcGtK+fUg6HZ3dDLuZevQtUdOcZ64f6XT7R8GQpvgUIpjvpfv+
 G+kOPHTi4ME5/L7/7vD9A8zg2Jl/uG1/nluatFqQybZdWikvVm88QmWnOql4EbYxzgT9
 eU88WXlng6qfpxarWhjs4CtHeU6AUKc1SbKdaSSNKIpVJG+PDZFDG2Steu4AZjF07tKV
 lLpRFtC8rxO1Z3/rzuRsrmdILOZ6Wjociy5W9PHhafIjA7LVA6nCiz4yEp6/v0mX8qd6
 H658iUZahjA47YFTrtM172uJpFWaMGM9IT1IGs+BSSOplN6TtBv/rxTbgVzJsI2dbHef
 IA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGiyPnLuA/xqUZQq9SktNT0IPulutKDntAZtHFZNn7A=;
 b=wTgyG93goHU+jVDjjTzN11MPJxQWDD6ZYjGtTihAkPNGfBcFKC+8AyPsOazlPlUqEk
 W/2uZeognXZ4ZpnCMlSQg9cscNUrYdx+dx5H8krb1kSgbizDEGctlbmlItQm+gy5FC9L
 PhMb8V9qTq1J4nOX8/9P68xdqHvovrw0xxMhqYIeBZxTqFEPwbSSTMubLcwL1KkbnbwP
 pHNZTyT0nIN/kAgKp3LnakEF2p9/QUgkDOZWB+xhxwmt4XDotrd5bfHbfGX2d6+rryvX
 H5NgoRt57cm3p86ZKEBpg9ZcHHqORBU+vziSu4/mgoJ6JBs3dv4ArhLzv6N4Wi70AnMy
 A8Dg==
X-Gm-Message-State: AOAM533U/6Rp1YSaPqtucuP8Sf2R8iMcWqbtuqSeio2BNbw7OMJ9oSDx
 M7cE7kFKBs++sCAARwKeYBMkpBIg9NQ=
X-Google-Smtp-Source: ABdhPJwhxkcBXq8eSylnJepo+dhtteYzBgUFKzhrfJ/6CK3SBK8cSbShlBlQ2yxtO7USoUX9uY1vOQ==
X-Received: by 2002:a67:e0d1:: with SMTP id m17mr25353015vsl.22.1634518920461; 
 Sun, 17 Oct 2021 18:02:00 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:02:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/15] target/ppc: PMU basic cycle count for pseries TCG
Date: Sun, 17 Oct 2021 22:01:25 -0300
Message-Id: <20211018010133.315842-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
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

This patch adds the barebones of the PMU logic by enabling cycle
counting. The overall logic goes as follows:

- a helper is added to control the PMU state on each MMCR0 write. This
allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
is cleared or set;

- MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
having to spin the PMU right at system init;

- the intended usage is to freeze the counters by setting MMCR0_FC, do
any additional setting of events to be counted via MMCR1 and enable
the PMU by zeroing MMCR0_FC. Software must freeze counters to read the
results - on the fly reading of the PMCs will return the starting value
of each one. This act of unfreezing the PMU, counting cycles and then
freezing the PMU again is being called a cycle count session.

Our base CPU frequency is fixed at 1Ghz for both powernv and pseries
clock, so this assumption is also carried on here to determine that 1
nanosecond equals 1 CPU cycle. Cycle value is then calculated by
subtracting the current time the PMU was frozen against the time in
which the PMU started spining.

The counter specific frozen bits MMCR0_FC14 and MMCR0_FC56 were also
added as a mean to further control which PMCs were supposed to be
counting cycles during the session.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 |  9 ++++
 target/ppc/cpu_init.c            |  6 +--
 target/ppc/helper.h              |  1 +
 target/ppc/power8-pmu-regs.c.inc | 23 ++++++++-
 target/ppc/power8-pmu.c          | 83 ++++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h             |  1 +
 6 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index aaf503c8ff..e6bb55cb1a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -370,6 +370,9 @@ typedef struct PMUEvent {
 #define MMCR0_FCECE  PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC0  PPC_BIT(44)         /* PMC Control bit 0 */
 #define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
+#define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
+#define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
+#define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
@@ -1223,6 +1226,12 @@ struct CPUPPCState {
     uint64_t tm_tar;
 
     PMUEvent pmu_events[PMU_EVENTS_NUM];
+
+    /*
+     * PMU base time value used by the PMU to calculate
+     * running cycles.
+     */
+    uint64_t pmu_base_time;
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7c9ed5dfe1..ffcd08a947 100644
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
                      &spr_read_generic, &spr_write_MMCR1,
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
index fc5bae8330..ea82d08ad5 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
+DEF_HELPER_2(store_mmcr0, void, env, tl)
 DEF_HELPER_2(store_mmcr1, void, env, tl)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index a0a64e76ad..8b3ffd9c1a 100644
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
@@ -220,6 +231,11 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
     spr_write_PMC14_ureg(ctx, sprn, gprn);
 }
 
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
+{
+    write_MMCR0_common(ctx, cpu_gpr[gprn]);
+}
+
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_mmcr1(cpu_env, cpu_gpr[gprn]);
@@ -271,6 +287,11 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
     spr_noaccess(ctx, gprn, sprn);
 }
 
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
+
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 9a0b544b04..55906c70a2 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -82,6 +82,89 @@ void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
     define_enabled_events(env);
 }
 
+static bool pmu_event_is_active(CPUPPCState *env, PMUEvent *event)
+{
+    if (event->sprn < SPR_POWER_PMC5) {
+        return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
+    }
+
+    return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
+}
+
+static void pmu_events_update_cycles(CPUPPCState *env)
+{
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t time_delta = now - env->pmu_base_time;
+    int i;
+
+    for (i = 0; i < PMU_EVENTS_NUM; i++) {
+        PMUEvent *event = &env->pmu_events[i];
+
+        if (!pmu_event_is_active(env, event) ||
+            event->type != PMU_EVENT_CYCLES) {
+            continue;
+        }
+
+        /*
+         * The pseries and powernv clock runs at 1Ghz, meaning
+         * that 1 nanosec equals 1 cycle.
+         */
+        env->spr[event->sprn] += time_delta;
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
+            pmu_events_update_cycles(env);
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
index 85852f236e..82f9dc16a4 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -25,6 +25,7 @@
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
-- 
2.31.1


