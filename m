Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF1F45DCF9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:11:10 +0100 (CET)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGOz-0005fg-Id
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:11:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMT-0002ZA-MB; Thu, 25 Nov 2021 10:08:33 -0500
Received: from [2607:f8b0:4864:20::a32] (port=40800
 helo=mail-vk1-xa32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMR-00020U-2P; Thu, 25 Nov 2021 10:08:33 -0500
Received: by mail-vk1-xa32.google.com with SMTP id 70so4107769vkx.7;
 Thu, 25 Nov 2021 07:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=90A0I2S7okRovUezGDsi2nBN42VirmN9p2lN7iC2f7Q=;
 b=S9xapjzKzeGrqxTGUXEXn4vagr0c8Qw1WBhMU5m4s0IafqWu1KKf08V1+OOn4Mkpsc
 /lZizrTYB2HMhJDiPHkLAOS5puy5o7s+7S98ATvja9Sh4cuwhHKhCeVHkGX2f6oskFSv
 TN2olPAyeVizJKZ5KwpsmlI9dNof5A6RjgeUIy8XWsZcx6jgMA/tOV4GtNyvUWbfnDo4
 LM6PDwYdTqFrftEYWuur3V2PsRmjJJOdYr3UUE9K8S/zxHbXzx8dwp0jsnNFuo1PPZ/y
 2GxAzzT+luXjGyt5/pKpbTvyyRVsTl1U9SRRygSUmiOmtN8yG9RnXX3usFxAo3vq/sic
 NhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=90A0I2S7okRovUezGDsi2nBN42VirmN9p2lN7iC2f7Q=;
 b=xsM74tHuT4/XHQaa7dKJMZxurzCLbdrm1fiiQqVzK6Pjfpt25cr4hYFwZS9eXxUK+s
 yftLuD29pMymw7NfygSBlHxpbxBDvtW4qtcOW5vRIEaYfbiGzE7DETVt+Xbz7uATHHPb
 QCA9A3mqJ9ssPM97OuJFYnOfvIXGsjY/4znAYWSjf0D/OUuQnkQRF1NpbI5QTJxTwPHK
 5S3Vaox947uDfLAhDcQdqSyhq9jV5r8VqMfw/MMu0m8Enixoa2qTn5w22YARLvj/4A0r
 zrar8q91UaKEAFSTU/BE2um05vsuQFrbisKjpz3X3IDF2JyuX6H6Oh6k2VuVNemZ/X5j
 xr5g==
X-Gm-Message-State: AOAM533YfR1u3ht27Rw51T7PahuBfVMGo0Vwc402nEgpMmSUlYzhPssj
 kdugN9A2J0P3RcESq9HdthX3cmKa/hs=
X-Google-Smtp-Source: ABdhPJxlKf8yX0r78dBX804Rr0aFUmAPSp8/brw4opkqjX6h9UZd/x+f0hozwJm3vc2dnGpLyYnnkw==
X-Received: by 2002:a05:6122:997:: with SMTP id
 g23mr12328534vkd.15.1637852909559; 
 Thu, 25 Nov 2021 07:08:29 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id i27sm2081057uab.8.2021.11.25.07.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:08:29 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/10] target/ppc: introduce PMUEventType and PMU overflow
 timers
Date: Thu, 25 Nov 2021 12:08:08 -0300
Message-Id: <20211125150817.573204-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125150817.573204-1-danielhb413@gmail.com>
References: <20211125150817.573204-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
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
was set in MMCR1) will be of type 'PMU_EVENT_INVALID'. Events that are
inactive due to frozen counter bits state are of type
'PMU_EVENT_INACTIVE'. Other types added in this patch are
PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS.  More types will be added
later on.

Let's also add the required PMU cycle overflow timers. They will be used
to trigger cycle overflows when cycle events are being sampled. This
timer will call cpu_ppc_pmu_timer_cb(), which in turn calls
fire_PMC_interrupt().  Both functions are stubs that will be implemented
later on when EBB support is added.

Two new helper files are created to host this new logic.
cpu_ppc_pmu_init() will init all overflow timers during CPU init time.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_cpu_core.c |  1 +
 target/ppc/cpu.h        | 16 ++++++++++++
 target/ppc/cpu_init.c   | 24 ++++++++++++++++++
 target/ppc/meson.build  |  1 +
 target/ppc/power8-pmu.c | 56 +++++++++++++++++++++++++++++++++++++++++
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
index e946da5f3a..2ad47b06d0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -296,6 +296,16 @@ typedef struct ppc_v3_pate_t {
     uint64_t dw1;
 } ppc_v3_pate_t;
 
+/* PMU related structs and defines */
+#define PMU_COUNTERS_NUM 6
+#define PMU_TIMERS_NUM   (PMU_COUNTERS_NUM - 1) /* PMC5 doesn't count cycles */
+typedef enum {
+    PMU_EVENT_INVALID = 0,
+    PMU_EVENT_INACTIVE,
+    PMU_EVENT_CYCLES,
+    PMU_EVENT_INSTRUCTIONS,
+} PMUEventType;
+
 /*****************************************************************************/
 /* Machine state register bits definition                                    */
 #define MSR_SF   63 /* Sixty-four-bit mode                            hflags */
@@ -1191,6 +1201,12 @@ struct CPUPPCState {
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
index 0000000000..e66c152eb5
--- /dev/null
+++ b/target/ppc/power8-pmu.c
@@ -0,0 +1,56 @@
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


