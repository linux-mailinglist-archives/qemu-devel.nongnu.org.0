Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B78F4006DA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:43:45 +0200 (CEST)
Received: from localhost ([::1]:53446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG2K-000829-Mc
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqu-0002pw-E2; Fri, 03 Sep 2021 16:31:56 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:34753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqr-0001hW-04; Fri, 03 Sep 2021 16:31:56 -0400
Received: by mail-qv1-xf33.google.com with SMTP id e18so379710qvo.1;
 Fri, 03 Sep 2021 13:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aT2WlgTKnGi2oZocc4ux2kXX10PJpvKinJPHa7w7pzk=;
 b=jqifl/NC47LQ4UQFdSDemuVvXbskNo3C34miEOwWxo7Omgm0Vt/9ThfAZmt+XnR+N4
 RfIwskIQs8MOSTz8eQfmQ775wgdOzwb6q2dUVlzLthkUDDgqNJ1y8EGxPPp5SgqLjyzs
 9dDWp/VOwCrzSU2MY+hBUfClEpZuE6NQ6ZOfoRO48oiJS/LXjt3NTIoltRyMrMUZ1m7z
 w2LSx7gUaS0cnYuH7Ic556ZxCBORD44iuLrqjnpIgdQejCvy6il2RoXd6Rp9AEolRNnu
 wpuQlxP/Ailf2ImgOzFEMgmftF0Iy9H6ym5I59NuZFJbzhLFRkOYeVliKNCVqNZQ01/w
 pXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aT2WlgTKnGi2oZocc4ux2kXX10PJpvKinJPHa7w7pzk=;
 b=i6Mua0vfs5EUCcjH8z9Xrg0ym9oI4bNIRz4/xi1Mw871SYsgSPMA/xtJewSnaLhUtJ
 m19N2Gt/YecVikfCwuO/lFFXrx2HUDNRQRJsAkzM7pOV7FE1exeKzuckDjI05x1HnqXy
 7gwLHEfUI88nAgFNAcOJfb5ZPjIST45UvAMkxq2bJT3/1UFDrvz6kjOYzuo+kQHZmF5a
 wD261DLGEjfOtGwmsV7K7YZdN67EA61/JCDX52FJnekEG98Yp5BWrItNzgSgQG79LO24
 Qknlyy9MTtltOwdwQjO/z9YC5XbRBb2/FbPzmSC0UoFPJ05huyq+kZq4k5zPTmkor59K
 1H6g==
X-Gm-Message-State: AOAM531ObZMAvtiMgvYdgjBGyiTgqoJrVSAHXjLDERDjhWAk8ceIg5Dw
 q5lPoQwPZwnxaa57xC8XuaCWHdNkwN8=
X-Google-Smtp-Source: ABdhPJyapDov1A7CEBuKa4Ku8OVme9I5P+YQuZS0vDWbWjay+pUiuVaJoHZiO0JazF3M7AjvULOSVQ==
X-Received: by 2002:a05:6214:b11:: with SMTP id
 u17mr966381qvj.40.1630701111612; 
 Fri, 03 Sep 2021 13:31:51 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] target/ppc: PMU Event-Based exception support
Date: Fri,  3 Sep 2021 17:31:10 -0300
Message-Id: <20210903203116.80628-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

Following up the rfebb implementation, this patch adds the EBB exception
support that are triggered by Performance Monitor alerts. This exception
occurs when an enabled PMU condition or event happens and both MMCR0_EBE
and BESCR_PME are set.

The supported PM alerts will consist of counter negative conditions of
the PMU counters. This will be achieved by a timer mechanism that will
predict when a counter becomes negative. The PMU timer callback will set
the appropriate bits in MMCR0 and fire a PMC interrupt. The EBB
exception code will then set the appropriate BESCR bits, set the next
instruction pointer to the address pointed by the return register
(SPR_EBBRR), and redirect execution to the handler (pointed by
SPR_EBBHR).

This patch sets the basic structure of interrupts and timers. The
following patches will add the counter negative logic for the registers.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_cpu_core.c  |  6 ++++++
 target/ppc/cpu.h         | 12 +++++++++++-
 target/ppc/excp_helper.c | 28 +++++++++++++++++++++++++++
 target/ppc/power8_pmu.c  | 41 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/power8_pmu.h  | 25 ++++++++++++++++++++++++
 5 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 target/ppc/power8_pmu.h

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 4f316a6f9d..c7a342c4aa 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -20,6 +20,7 @@
 #include "target/ppc/kvm_ppc.h"
 #include "hw/ppc/ppc.h"
 #include "target/ppc/mmu-hash64.h"
+#include "target/ppc/power8_pmu.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/hw_accel.h"
@@ -266,6 +267,11 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return false;
     }
 
+    /* Init PMU interrupt timer (TCG only) */
+    if (!kvm_enabled()) {
+        cpu_ppc_pmu_timer_init(env);
+    }
+
     if (!sc->pre_3_0_migration) {
         vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
                          cpu->machine_data);
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 26624508fa..780eab6f92 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -129,8 +129,9 @@ enum {
     /* ISA 3.00 additions */
     POWERPC_EXCP_HVIRT    = 101,
     POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
+    POWERPC_EXCP_EBB = 103, /* Event-based branch exception                  */
     /* EOL                                                                   */
-    POWERPC_EXCP_NB       = 103,
+    POWERPC_EXCP_NB       = 104,
     /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
@@ -1053,6 +1054,8 @@ struct ppc_radix_page_info {
 #define PPC_CPU_OPCODES_LEN          0x40
 #define PPC_CPU_INDIRECT_OPCODES_LEN 0x20
 
+#define PMU_TIMERS_LEN 5
+
 struct CPUPPCState {
     /* Most commonly used resources during translated code execution first */
     target_ulong gpr[32];  /* general purpose registers */
@@ -1214,6 +1217,12 @@ struct CPUPPCState {
      * running cycles.
      */
     uint64_t pmu_base_time;
+
+    /*
+     * Timers used to fire performance monitor alerts and
+     * interrupts. All PMCs but PMC5 has a timer.
+     */
+    QEMUTimer *pmu_intr_timers[PMU_TIMERS_LEN];
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
@@ -2430,6 +2439,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
+    PPC_INTERRUPT_PMC,            /* Performance Monitor Counter interrupt */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 22f9835383..d20447f171 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -821,6 +821,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         cpu_abort(cs, "Non maskable external exception "
                   "is not implemented yet !\n");
         break;
+    case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
+        if ((env->spr[SPR_BESCR] & BESCR_GE) &&
+            (env->spr[SPR_BESCR] & BESCR_PME)) {
+            target_ulong nip;
+
+            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
+            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
+            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
+            nip = env->spr[SPR_EBBHR];          /* EBB handler */
+            powerpc_set_excp_state(cpu, nip, env->msr);
+        }
+        /*
+         * This interrupt is handled by userspace. No need
+         * to proceed.
+         */
+        return;
     default:
     excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -1068,6 +1084,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
             return;
         }
+        /* PMC -> Event-based branch exception */
+        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
+            /*
+             * Performance Monitor event-based exception can only
+             * occur in problem state.
+             */
+            if (msr_pr == 1) {
+                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PMC);
+                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
+                return;
+            }
+        }
     }
 
     if (env->resume_as_sreset) {
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index dd58f57f52..aa5df6f51f 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -12,12 +12,14 @@
 
 #include "qemu/osdep.h"
 
+#include "power8_pmu.h"
 #include "cpu.h"
 #include "helper_regs.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "hw/ppc/ppc.h"
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
@@ -115,6 +117,45 @@ static void update_cycles_PMCs(CPUPPCState *env)
     }
 }
 
+static void cpu_ppc_pmu_timer_cb(void *opaque)
+{
+    PowerPCCPU *cpu = opaque;
+    CPUPPCState *env = &cpu->env;
+    uint64_t mmcr0;
+
+    mmcr0 = env->spr[SPR_POWER_MMCR0];
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_EBE) {
+        /* freeeze counters if needed */
+        if (mmcr0 & MMCR0_FCECE) {
+            mmcr0 &= ~MMCR0_FCECE;
+            mmcr0 |= MMCR0_FC;
+        }
+
+        /* Clear PMAE and set PMAO */
+        if (mmcr0 & MMCR0_PMAE) {
+            mmcr0 &= ~MMCR0_PMAE;
+            mmcr0 |= MMCR0_PMAO;
+        }
+        env->spr[SPR_POWER_MMCR0] = mmcr0;
+
+        /* Fire the PMC hardware exception */
+        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
+    }
+}
+
+void cpu_ppc_pmu_timer_init(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    QEMUTimer *timer;
+    int i;
+
+    for (i = 0; i < PMU_TIMERS_LEN; i++) {
+        timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_pmu_timer_cb,
+                             cpu);
+        env->pmu_intr_timers[i] = timer;
+    }
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     target_ulong curr_value = env->spr[SPR_POWER_MMCR0];
diff --git a/target/ppc/power8_pmu.h b/target/ppc/power8_pmu.h
new file mode 100644
index 0000000000..34a9d0e8a2
--- /dev/null
+++ b/target/ppc/power8_pmu.h
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
+#ifndef PMU_BOOK3S_HELPER
+#define PMU_BOOK3S_HELPER
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+
+void cpu_ppc_pmu_timer_init(CPUPPCState *env);
+
+#endif
-- 
2.31.1


