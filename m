Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C845445765B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:25:44 +0100 (CET)
Received: from localhost ([::1]:44484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8Zz-0006v5-JA
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:25:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8X4-0003zZ-UM; Fri, 19 Nov 2021 13:22:42 -0500
Received: from [2607:f8b0:4864:20::935] (port=41540
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8X2-0001mt-PV; Fri, 19 Nov 2021 13:22:42 -0500
Received: by mail-ua1-x935.google.com with SMTP id p37so22985336uae.8;
 Fri, 19 Nov 2021 10:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wSHS0gNcqyoWZqlpfy6mxufAy6lZaDqkdTDgM0zIxWg=;
 b=Y0pWbu+RiBroYpSeUVAOdHczKxwZKFPFo7b+PU0miMS3XUzktKBV4EC18Rm/QOkzhD
 P2ZyLvzoxQeBcBJKbr80/U7z02kAuZyxk2bcRPNwnszQl3f6Z7+LkrkEBGOw71YC2djb
 4EbLLVAVHpFZ42qFLDK+Wryr0t1vIqX/0sshKA3+7FetADctGHFmbGElvNDo97mTZrc7
 jbs3q6BTOKkbAzUXjBugCSREa9fJiRVfJKJdwAByjbA/dUIM6wWF0Q8tQE7T9RXvuBcC
 4gq9foQGfK2Q4rGYRKvCYtCbZDon55J+MeUb6AvuYvKp7YJtST4httSCaM9zI1SDKp0I
 EUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wSHS0gNcqyoWZqlpfy6mxufAy6lZaDqkdTDgM0zIxWg=;
 b=mbSjfQpP+lGZWj3Dj5q+DqYArXoJdYESESvw3x8oZN1JGWs8pg10m7Q6/8eCZWtGg8
 +eYoqu/81K2HfamnqIByUaS06TIJu6Cr14ivIHz3MXdVPjS0xiHqSWFGvM1S5ekyS2VE
 FYj2Chnz9+FF79TgLjZsPt7YpCKvFNoRaUwNJk7P/VdSzE24KkcsCsm1Ge0HDXEH2n1c
 Rwpe0VN8LXLlvulQIKftqW8eZWl/LWzDEUmCtXNJfBVMaYOwGIiTirQJDzYqHbqs8nHk
 5fU2xoY0RDrgz5pXdAqbiSV5n1r5wgAh/deTFPA0LbJ1rysrLHFKCdryAgIjluwPU8J7
 ONog==
X-Gm-Message-State: AOAM533HHxkoIduywJnaCBgxvb2OERCKDSgefiabK4plOl5Ts165Pllm
 0pzf4yPjCWV5RcZpxNUKz1E4YytY1wEvbA==
X-Google-Smtp-Source: ABdhPJz5cvt/QwKcjt5mbv1dL4hi6gYMy9Tynl5xtdXYPVplMQQA9i4VMsauxeOynMzgfv6dT0bqRA==
X-Received: by 2002:a05:6102:5109:: with SMTP id
 bm9mr94863028vsb.10.1637346159387; 
 Fri, 19 Nov 2021 10:22:39 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:22:39 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 01/10] target/ppc: introduce PMUEventType and PMU
 overflow timers
Date: Fri, 19 Nov 2021 15:22:07 -0300
Message-Id: <20211119182216.628676-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119182216.628676-1-danielhb413@gmail.com>
References: <20211119182216.628676-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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

This patch starts an IBM Power8+ compatible PMU implementation by adding
the representation of PMU events that we are going to sample,
PMUEventType. This enum represents a Perf event that is being sampled by
a specific counter 'sprn'. Events that aren't available (i.e. no event
was set in MMCR1) will be of type 'PMU_EVENT_INVALID'. Other types added
in this patch are PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS. More
types will be added later on.

Let's also add the required PMU cycle overflow timers. They will be used
to trigger cycle overflows when cycle events are being sampled. This
timer will call cpu_ppc_pmu_timer_cb(), which in turn calls
fire_PMC_interrupt().  Both functions are stubs that will be implemented
later on when EBB support is added.

Two new helper files are created to host this new logic.
cpu_ppc_pmu_init() will init all overflow timers during CPU init time.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_cpu_core.c |  1 +
 target/ppc/cpu.h        | 15 +++++++++++
 target/ppc/cpu_init.c   | 24 +++++++++++++++++
 target/ppc/meson.build  |  1 +
 target/ppc/power8-pmu.c | 57 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/power8-pmu.h | 25 ++++++++++++++++++
 6 files changed, 123 insertions(+)
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 58e7341cb7..a57ba70a87 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -20,6 +20,7 @@
 #include "target/ppc/kvm_ppc.h"
 #include "hw/ppc/ppc.h"
 #include "target/ppc/mmu-hash64.h"
+#include "target/ppc/power8-pmu.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e946da5f3a..04ef9300af 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -296,6 +296,15 @@ typedef struct ppc_v3_pate_t {
     uint64_t dw1;
 } ppc_v3_pate_t;
 
+/* PMU related structs and defines */
+#define PMU_COUNTERS_NUM 6
+#define PMU_TIMERS_NUM   (PMU_COUNTERS_NUM - 1) /* PMC5 doesn't count cycles */
+typedef enum {
+    PMU_EVENT_INVALID = 0,
+    PMU_EVENT_CYCLES,
+    PMU_EVENT_INSTRUCTIONS,
+} PMUEventType;
+
 /*****************************************************************************/
 /* Machine state register bits definition                                    */
 #define MSR_SF   63 /* Sixty-four-bit mode                            hflags */
@@ -1191,6 +1200,12 @@ struct CPUPPCState {
     uint32_t tm_vscr;
     uint64_t tm_dscr;
     uint64_t tm_tar;
+
+    /*
+     * Timers used to fire performance monitor alerts
+     * when counting cycles.
+     */
+    QEMUTimer *pmu_cyc_overflow_timers[PMU_TIMERS_NUM];
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6695985e9b..9610e65c76 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -45,6 +45,7 @@
 #include "helper_regs.h"
 #include "internal.h"
 #include "spr_tcg.h"
+#include "power8-pmu.h"
 
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
@@ -7377,6 +7378,20 @@ static void register_power9_mmu_sprs(CPUPPCState *env)
 #endif
 }
 
+/*
+ * Initialize PMU counter overflow timers for Power8 and
+ * newer Power chips when using TCG.
+ */
+static void init_tcg_pmu_power8(CPUPPCState *env)
+{
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+    /* Init PMU overflow timers */
+    if (!kvm_enabled()) {
+        cpu_ppc_pmu_init(env);
+    }
+#endif
+}
+
 static void init_proc_book3s_common(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
@@ -7694,6 +7709,9 @@ static void init_proc_POWER8(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_book3s_207_dbg_sprs(env);
 
+    /* Common TCG PMU */
+    init_tcg_pmu_power8(env);
+
     /* POWER8 Specific Registers */
     register_book3s_ids_sprs(env);
     register_rmor_sprs(env);
@@ -7888,6 +7906,9 @@ static void init_proc_POWER9(CPUPPCState *env)
     init_proc_book3s_common(env);
     register_book3s_207_dbg_sprs(env);
 
+    /* Common TCG PMU */
+    init_tcg_pmu_power8(env);
+
     /* POWER8 Specific Registers */
     register_book3s_ids_sprs(env);
     register_amr_sprs(env);
@@ -8104,6 +8125,9 @@ static void init_proc_POWER10(CPUPPCState *env)
     init_proc_book3s_common(env);
     register_book3s_207_dbg_sprs(env);
 
+    /* Common TCG PMU */
+    init_tcg_pmu_power8(env);
+
     /* POWER8 Specific Registers */
     register_book3s_ids_sprs(env);
     register_amr_sprs(env);
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index b85f295703..a49a8911e0 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -51,6 +51,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'mmu-book3s-v3.c',
   'mmu-hash64.c',
   'mmu-radix64.c',
+  'power8-pmu.c',
 ))
 
 target_arch += {'ppc': ppc_ss}
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
new file mode 100644
index 0000000000..3c2f73896f
--- /dev/null
+++ b/target/ppc/power8-pmu.c
@@ -0,0 +1,57 @@
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
+#include "power8-pmu.h"
+#include "cpu.h"
+#include "helper_regs.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "hw/ppc/ppc.h"
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+static void fire_PMC_interrupt(PowerPCCPU *cpu)
+{
+    CPUPPCState *env = &cpu->env;
+
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
+        return;
+    }
+
+    /* PMC interrupt not implemented yet */
+    return;
+}
+
+static void cpu_ppc_pmu_timer_cb(void *opaque)
+{
+    PowerPCCPU *cpu = opaque;
+
+    fire_PMC_interrupt(cpu);
+}
+
+void cpu_ppc_pmu_init(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    int i;
+
+    for (i = 0; i < PMU_TIMERS_NUM; i++) {
+        env->pmu_cyc_overflow_timers[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                                       &cpu_ppc_pmu_timer_cb,
+                                                       cpu);
+    }
+}
+
+#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
new file mode 100644
index 0000000000..49a813a443
--- /dev/null
+++ b/target/ppc/power8-pmu.h
@@ -0,0 +1,25 @@
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
+#ifndef POWER8_PMU
+#define POWER8_PMU
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+
+void cpu_ppc_pmu_init(CPUPPCState *env);
+
+#endif
-- 
2.31.1


