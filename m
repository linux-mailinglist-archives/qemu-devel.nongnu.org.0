Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953F430D45
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:09:26 +0200 (CEST)
Received: from localhost ([::1]:49332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH9Z-0007R7-KG
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2N-0006Ye-9P; Sun, 17 Oct 2021 21:01:59 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2L-0000bl-8w; Sun, 17 Oct 2021 21:01:58 -0400
Received: by mail-vk1-xa33.google.com with SMTP id u206so946687vke.10;
 Sun, 17 Oct 2021 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CfzFuoci4sUi/wHAUja0jOT8nYXJtzL6smP+zg6/Z0I=;
 b=PWiZGERMgzyUGwbL/dbz2a9dOdC8a85y0ysfIkhJhmoKgLS701Didz550opJ8DpElO
 E8ojPeRyfWAWN2eqjE40UgU+c3pALnNyhUVM/qbBofdkH00+/h9dx4vFrpC+mkm5Md2n
 foyuOEnZVu0+iVisOA64+PjbJG1oXt2v+3HQY1FUB26v6yZSuZV2F2Suy/7HRcn2Jk+f
 UE9irV4eMO7kfToGvCj6H953uFjF0qe20FwmWftLy5pOUg/NHFesY0w5UHvkFTBhKaXG
 elqLA+xMJQVxht+CZwSo0OO1OlVSVk9LSpSc7u9nNxQBrSbY4dlMk+vLpwuMhxke5I5Y
 L7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CfzFuoci4sUi/wHAUja0jOT8nYXJtzL6smP+zg6/Z0I=;
 b=3kzylNfyV5lA5BFaX3HPHDViQEUHkDNGB1MaSsw5UU27EVlK2fn2Jnp+D3MyO+k8b1
 MbhXGDZbZy5KrB69fBDXVszVdBFi+8twM3QM3e4BzllHnYrETEUEfrqISRDnjhJBegQ/
 rvkK0SPrvmq6PkAcT9rz7ujCjAwSQs8qA0BbZ8ylzCVvAuOE1rhCm3J1mVBGHmB6R5MN
 SXh7hRytsT0mu8TnMcSd30qgl7TeFGDSl46WzdE2Zj/Cp6wICbnVKc+GHOHwnwHI4eGk
 oPCClxxsHfiWXHS8oFJg3UExUTGplRht/SAUr0fUfGRx/6k/rvfbwImXsp4h9IGD+ACo
 CeYg==
X-Gm-Message-State: AOAM532C+H4gBWKbmVl9hGPRDEvZhULPmJYSBo2oFXLx9VuLGC6iK2Qv
 0ihtnmFooCLoOpZGE0l641fijRxISWs=
X-Google-Smtp-Source: ABdhPJwaMlx+nSy38oAuG1luVCXZkEGwlW6AQPTedEtiMP2HSOYb2mdEMptUAejCzf5Tzzc5oYcCqg==
X-Received: by 2002:a05:6122:d05:: with SMTP id
 az5mr6033152vkb.19.1634518915830; 
 Sun, 17 Oct 2021 18:01:55 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:01:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/15] target/ppc: introduce PMU events
Date: Sun, 17 Oct 2021 22:01:23 -0300
Message-Id: <20211018010133.315842-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa33.google.com
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

This patch starts an IBM Power8+ compatible PMU implementation by adding
the representation of PMU events that we are going to sample, PMUEvent.
This struct represents a Perf event, determined by the PMUEventType
enum, that is being sampled by a specific counter 'sprn'. PMUEvent also
contains an overflow timer that will be used to trigger cycle overflows
when cycle events are being sampled. This timer will call
cpu_ppc_pmu_timer_cb(), which in turn calls fire_PMC_interrupt(). Both
functions are stubs that will be implemented later on when EBB support
is added.

The PMU has 6 PMUEvents all the time, one for each counter. Events that
aren't available (i.e. the counter isn't running) will be of type
'PMU_EVENT_INVALID'. Other types added in this patch are
PMU_EVENT_CYCLES and PMU_EVENT_INSTRUCTIONS. More types will be added
later on.

Two new helper files are created to host this new logic.
cpu_ppc_pmu_init() will init all PMUEvents during CPU init time.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_cpu_core.c |  6 ++++
 target/ppc/cpu.h        | 22 ++++++++++++
 target/ppc/meson.build  |  1 +
 target/ppc/power8-pmu.c | 75 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/power8-pmu.h | 25 ++++++++++++++
 5 files changed, 129 insertions(+)
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
index 33e3a91f6f..21591ec725 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -296,6 +296,26 @@ typedef struct ppc_v3_pate_t {
     uint64_t dw1;
 } ppc_v3_pate_t;
 
+/* PMU related structs and defines */
+#define PMU_EVENTS_NUM 6
+typedef enum {
+    PMU_EVENT_INVALID = 0,
+    PMU_EVENT_CYCLES,
+    PMU_EVENT_INSTRUCTIONS,
+} PMUEventType;
+
+typedef struct PMUEvent {
+    int sprn;
+    PMUEventType type;
+
+    /*
+     * Timer used to fire performance monitor alerts
+     * when counting cycles.
+     */
+    QEMUTimer *cyc_overflow_timer;
+
+} PMUEvent;
+
 /*****************************************************************************/
 /* Machine state register bits definition                                    */
 #define MSR_SF   63 /* Sixty-four-bit mode                            hflags */
@@ -1190,6 +1210,8 @@ struct CPUPPCState {
     uint32_t tm_vscr;
     uint64_t tm_dscr;
     uint64_t tm_tar;
+
+    PMUEvent pmu_events[PMU_EVENTS_NUM];
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
index 0000000000..42452b5870
--- /dev/null
+++ b/target/ppc/power8-pmu.c
@@ -0,0 +1,75 @@
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
+    /*
+     * PMC1 event first, PMC2 second and so on. PMC5 and PMC6
+     * PMUEvent are always the same regardless of MMCR1.
+     */
+    for (i = 0; i < PMU_EVENTS_NUM; i++) {
+        PMUEvent *event = &env->pmu_events[i];
+
+        event->sprn = SPR_POWER_PMC1 + i;
+        event->type = PMU_EVENT_INVALID;
+
+        if (event->sprn == SPR_POWER_PMC5) {
+            event->type = PMU_EVENT_INSTRUCTIONS;
+            continue;
+        }
+
+        if (event->sprn == SPR_POWER_PMC6) {
+            event->type = PMU_EVENT_CYCLES;
+        }
+
+        event->cyc_overflow_timer =  timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                                  &cpu_ppc_pmu_timer_cb,
+                                                  cpu);
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


