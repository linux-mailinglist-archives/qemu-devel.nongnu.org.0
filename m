Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B83F62BF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:35:37 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZOi-0007jY-40
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKX-0008IS-LW; Tue, 24 Aug 2021 12:31:17 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:34575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKT-000061-Dw; Tue, 24 Aug 2021 12:31:17 -0400
Received: by mail-qk1-x729.google.com with SMTP id a66so5045731qkc.1;
 Tue, 24 Aug 2021 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ignNHRuSvp0k5PoyT5xcRKDFadczzDUxCmcJmkI2Is=;
 b=BzmggeKBToUJ8sNzQe6ccFX++01AcYTnPjoU8LjwUx2Xh5ZLukaAO+F0sqdhkv1wfe
 OnzlqXXiXNUYFSSQGbzRGIkSgRArEBqKFgOJ3vKGIOM7BA5qly7elDXje6UkuklBANW5
 Wn7ltyjq0rd6Xun7ykB0pBNlhWKWHLvzOFZvJUxvzAy6q4rEkVSW9cm06S2gH8bYGQu0
 IyxK7+JgQnmojV1y0xqgV6LQcinkuldeQh9AACwb9lgtdwmP3v2XdCSr9ibZUWRG4GZu
 Llwf1BTuf72p+EFdrLFApPpFcTexHt+GYvh4evDtoSFil8tAQGwrC8/ag0+Xu8JAOV63
 38nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ignNHRuSvp0k5PoyT5xcRKDFadczzDUxCmcJmkI2Is=;
 b=ufe8Qo7rfH6Mp+t7Dl0cNtOK1nmG9XKJb+WwNDbCAjOA5vhWHCOEnejZtE2pHtbqrs
 qSnZNhBVXWBxuLadvBJ4L2vkT/ia6qnrHkTXsoRW0C07yV3vae7feoXDhVAvtbhphPfr
 8VWvjjdUnlI3wm4qqc9tQet3xo0nvCKES+uQ8OjHxJHdnWNxRBZDpzvoI7U9RwwtEt20
 78M4lMwGP+ZMoa+Umo2iQ8g3MRhpD/9NJjTPnW0t5eBNKeipexpFYlmkvwdJs7ijpt+X
 zOkP4dC8ra3EK9dniQAJrLTqF8QRnbQ2AwYYgLFDctgpx++JXc/oqsr4Af8AptTt52ft
 4IGA==
X-Gm-Message-State: AOAM5312rp1Mob0uGYW/P/VXEzEUy17hd4D7AcYdH1xDNbjO9pdkbJOo
 yXcDsI2MPUSFuAW0GFNKPQAb9YYH+Iw=
X-Google-Smtp-Source: ABdhPJyyIrVoJ97MQn3Z/mFS2yFpStacHG261Be1ByaC8KJ3R9flSGaASAkzmdoSuNajTK1SE3xs4A==
X-Received: by 2002:a37:84c3:: with SMTP id
 g186mr26516158qkd.276.1629822671941; 
 Tue, 24 Aug 2021 09:31:11 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/16] target/ppc: PMU Event-Based exception support
Date: Tue, 24 Aug 2021 13:30:26 -0300
Message-Id: <20210824163032.394099-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x729.google.com
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
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
index 9d5eb9ead4..535754ddff 100644
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
@@ -1047,6 +1048,8 @@ struct ppc_radix_page_info {
 #define PPC_CPU_OPCODES_LEN          0x40
 #define PPC_CPU_INDIRECT_OPCODES_LEN 0x20
 
+#define PMU_TIMERS_LEN 5
+
 struct CPUPPCState {
     /* Most commonly used resources during translated code execution first */
     target_ulong gpr[32];  /* general purpose registers */
@@ -1208,6 +1211,12 @@ struct CPUPPCState {
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
@@ -2424,6 +2433,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
+    PPC_INTERRUPT_PMC,            /* Performance Monitor Counter interrupt */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 058b063d8a..e97898c5f4 100644
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
index 4545fe7810..a57b602125 100644
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
 
@@ -114,6 +116,45 @@ static void update_cycles_PMCs(CPUPPCState *env)
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


