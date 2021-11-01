Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC824424B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:23:22 +0100 (CET)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhaD-0006qB-Et
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAp-0003t4-B9; Mon, 01 Nov 2021 19:57:08 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAm-0006EY-JZ; Mon, 01 Nov 2021 19:57:06 -0400
Received: by mail-qt1-x832.google.com with SMTP id t40so17439878qtc.6;
 Mon, 01 Nov 2021 16:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBRZbZ6zm8+jDK7si5srEN74DxX+K4joZ8nlOmQJt/k=;
 b=TVqDhF5rJJXvDLVm5dDQlr2dWgmMH6L0UXKxfgKBcqHtSOTmSlcky+tiNCEpgm99J3
 /XDEOHmWn9xtkW/elHB8qDo2utjz2Mw4ZzUStaCj3DAkDQFMFF12pH73GGiovRi3EImj
 UefR6QuLWGwNmW68DZa8ng62EJqwypE230oa8N3PKRLtJe1Z6ngPNhkoW7cj7O+mClr4
 BDA854Rn3M8MfwDyWEkJf5/CqgZciLqge6HzasckJ92xAR+ZaOsRrL+oEKjYZlpnmAog
 rEDhbV/6gLVAkT5JnBdIAllUg0fAfl4u8koBSHsqvlD2THxF/4loAhYmXvpRz3IKfbF0
 A1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBRZbZ6zm8+jDK7si5srEN74DxX+K4joZ8nlOmQJt/k=;
 b=5JUnxMHfxssFkNhZ0X0ykNJZWCGLkwcH2XO2KRBZNmFBHlZTwrEnJCNpxzhAFOP5WT
 PKyWHU5bmilBtQjeOMru6sqaZdb2929DILIquf7TpmliHa+FBKN1Z0DSBeDaOb1gSLX9
 4GehAetkcCpe3r8q0h2jeDhBiyoQNEKy9f329H3sj9wMVXGreYptzSbTlCglT/XiDZww
 52X8HCvoZA+/sm0xY6U3NHrWzgR2Idl0pz8cCX/4a/NFIGCHOXdqVqJLBv5lj+rXqbb6
 41vAqUX2CleXf7PzY+G3nlDsASQcna6YU5zSg1in6GReOKTf64/ZlE7u+H7j8GIDGxHD
 114A==
X-Gm-Message-State: AOAM531lLOSfZk91fgHIKJUZ9MXLRELqNfAjDBkRuDBplqSwvpNKrFBe
 QjEYUlHoivkq0rb1340V6mp4hvsgBjE=
X-Google-Smtp-Source: ABdhPJzrtoHB0K9/lmTSB2F8lLiIo+eQRJfUcTgKC+gqXO/N616n9w3+fwG2g3exyn1WrnnEvqO3Bw==
X-Received: by 2002:ac8:7143:: with SMTP id h3mr34206767qtp.242.1635811023198; 
 Mon, 01 Nov 2021 16:57:03 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/10] target/ppc: introduce PMUEventType and PMU overflow
 timers
Date: Mon,  1 Nov 2021 20:56:33 -0300
Message-Id: <20211101235642.926773-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
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
 hw/ppc/spapr_cpu_core.c |  6 +++++
 target/ppc/cpu.h        | 15 +++++++++++
 target/ppc/meson.build  |  1 +
 target/ppc/power8-pmu.c | 57 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/power8-pmu.h | 25 ++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 58e7341cb7..45abffd891 100644
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
@@ -266,6 +267,11 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return false;
     }
 
+    /* Init PMU interrupt timer (TCG only) */
+    if (!kvm_enabled()) {
+        cpu_ppc_pmu_init(env);
+    }
+
     if (!sc->pre_3_0_migration) {
         vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
                          cpu->machine_data);
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0472ec9154..5aeaee8a9c 100644
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


