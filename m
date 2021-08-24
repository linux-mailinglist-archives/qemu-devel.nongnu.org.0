Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C277B3F62C9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:37:30 +0200 (CEST)
Received: from localhost ([::1]:44630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZQX-0005k1-Nc
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKF-0007mq-NE; Tue, 24 Aug 2021 12:30:59 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKD-0008Nn-Lj; Tue, 24 Aug 2021 12:30:59 -0400
Received: by mail-qk1-x730.google.com with SMTP id 22so23824401qkg.2;
 Tue, 24 Aug 2021 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezDHkzb+En58u9ni/xJO1wYkKHvdFFwvu1F4IFieQLQ=;
 b=MpRWmxQTRYOq5xX5JSBuu4WXQ9IVwGx7fxfjCwzqFqosCx6EAtjcf61BzOJ58ArHML
 g99OXRGnIwX62fhvgSNBi9eT5Tf/ja6ovRHApywjWN7Hs8Rzb35KqRhKB03PEJVIjlaI
 sGBwpZ3SwxIF814ItHRWLLHNhjfzsuuIlip9RUgOQf5iTg2olAIojf32R4tZ0Ba0RlvK
 w02hqyy8u9Ge1tc2pz114oSGLvYQHZseXQkiaHZWHmu4rPaf/2C6Rw/lrsX1uPPfLcy2
 FvW1fkTcWxrtIX8d/0SlDK2sAntkBC7mLzqMQ8D9OUKloKJsK+k8j/AXXRK+5q5MZYA3
 luZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezDHkzb+En58u9ni/xJO1wYkKHvdFFwvu1F4IFieQLQ=;
 b=Q+F2lMWThh4/d2wL0IIoO9fAFiHW2+O18ZtZlIqetFjYo2YJm9YHAmXl6mN7p7W4om
 lHlVbxREnYBnUYontghRHlXmA3/0sjsA+5GA5gnW95WotLKoSSUlsICjfOml3QxMWC4R
 UiFXBy7hshfjzyIFeBfsqtzcGHm0BKyotCbcYDr9E5a2yNOWkeetpM+iJW8Ubbm8PxV3
 kCf5+i/Q5xeCc1oUMgRLOQLGOkmUf6CT6cJDsdIzZUCuO1ChurXSG+BwtH5hq+gYAJPi
 AsP2cwr6SxDlpNc8+zzZNDf1a0ppwCoc21jAlvGR/CciltbE4jdYW1duyeqi+R5pjHqu
 vzbQ==
X-Gm-Message-State: AOAM531uE7QnWamdBtRiubbrCJegByW9P7EEGQW2C2L8GCx2k2DNqwR7
 6rXGOBSPbw8PODP1U0OTyayqbFni9C4=
X-Google-Smtp-Source: ABdhPJxe4+vEPy+12d8Ee2xnxtNIHcb812PMnGL12Fh+IHpXiCieVm94iBXgBhuxkMJA06INIk3mOQ==
X-Received: by 2002:a05:620a:16c7:: with SMTP id
 a7mr26197971qkn.327.1629822656065; 
 Tue, 24 Aug 2021 09:30:56 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:30:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/16] target/ppc: PMU basic cycle count for pseries TCG
Date: Tue, 24 Aug 2021 13:30:20 -0300
Message-Id: <20210824163032.394099-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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

This patch adds the barebones of the PMU logic by enabling cycle
counting, done via the performance monitor counter 6. The overall logic
goes as follows:

- a helper is added to control the PMU state on each MMCR0 write. This
allows for the PMU to start/stop as the frozen counter bit (MMCR0_FC)
is cleared or set;

- MMCR0 reg initial value is set to 0x80000000 (MMCR0_FC set) to avoid
having to spin the PMU right at system init;

- the intended usage is to freeze the counters by setting MMCR0_FC, do
any additional setting of events to be counted via MMCR1 (not
implemented yet) and enable the PMU by zeroing MMCR0_FC. Software must
freeze counters to read the results - on the fly reading of the PMCs
will return the starting value of each one.

Since there will be more PMU exclusive code to be added next, put the
PMU logic in its own helper to keep all in the same place. The name of
the new helper file, power8_pmu.c, is an indicative that the PMU logic
has been tested with the IBM POWER chip family, POWER8 being the oldest
version tested. This doesn't mean that this PMU logic will break with
any other PPC64 chip that implements Book3s, but since we can't assert
that this PMU will work with all available Book3s emulated processors
we're choosing to be explicit.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  6 ++++
 target/ppc/cpu_init.c   |  6 ++--
 target/ppc/helper.h     |  1 +
 target/ppc/meson.build  |  1 +
 target/ppc/power8_pmu.c | 74 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h    |  1 +
 target/ppc/translate.c  | 17 +++++++++-
 7 files changed, 102 insertions(+), 4 deletions(-)
 create mode 100644 target/ppc/power8_pmu.c

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 739005ba29..6878d950de 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1176,6 +1176,12 @@ struct CPUPPCState {
     uint32_t tm_vscr;
     uint64_t tm_dscr;
     uint64_t tm_tar;
+
+    /*
+     * PMU base time value used by the PMU to calculate
+     * running cycles.
+     */
+    uint64_t pmu_base_time;
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 860716da18..71f052b052 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6821,8 +6821,8 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCR0, 0x00000000);
+                     &spr_read_generic, &spr_write_MMCR0_generic,
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
index 4076aa281e..5122632784 100644
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
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index b85f295703..278ce07da9 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
   'int_helper.c',
   'mem_helper.c',
   'misc_helper.c',
+  'power8_pmu.c',
   'timebase_helper.c',
   'translate.c',
 ))
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
new file mode 100644
index 0000000000..47de38a99e
--- /dev/null
+++ b/target/ppc/power8_pmu.c
@@ -0,0 +1,74 @@
+/*
+ * PMU emulation helpers for TCG IBM POWER chips
+ *
+ *  Copyright IBM Corp. 2021
+ *
+ * Authors:
+ *  Daniel Henrique Barboza      <danielhb413@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "helper_regs.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
+                              uint64_t time_delta)
+{
+    /*
+     * The pseries and pvn clock runs at 1Ghz, meaning that
+     * 1 nanosec equals 1 cycle.
+     */
+    env->spr[sprn] += time_delta;
+}
+
+static void update_cycles_PMCs(CPUPPCState *env)
+{
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t time_delta = now - env->pmu_base_time;
+
+    update_PMC_PM_CYC(env, SPR_POWER_PMC6, time_delta);
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
+    /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
+    if ((curr_value & MMCR0_PMCC) != (value & MMCR0_PMCC)) {
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
+            update_cycles_PMCs(env);
+        } else {
+            env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
+    }
+}
+
+#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 5c383dae3d..2c5b056fc1 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -25,6 +25,7 @@
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b48eec83e3..e4f75ba380 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -401,6 +401,19 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
     spr_store_dump_spr(sprn);
 }
 
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_icount_io_start(ctx);
+    gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
+}
+#else
+void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
+#endif
+
 #if !defined(CONFIG_USER_ONLY)
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 {
@@ -609,6 +622,8 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
     t0 = tcg_temp_new();
     t1 = tcg_temp_new();
 
+    gen_icount_io_start(ctx);
+
     /*
      * Filter out all bits but FC, PMAO, and PMAE, according
      * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
@@ -620,7 +635,7 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
     tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
     /* Keep all other bits intact */
     tcg_gen_or_tl(t1, t1, t0);
-    gen_store_spr(SPR_POWER_MMCR0, t1);
+    gen_helper_store_mmcr0(cpu_env, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
-- 
2.31.1


