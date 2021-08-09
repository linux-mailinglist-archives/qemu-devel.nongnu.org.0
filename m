Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA36E3E4658
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:17:15 +0200 (CEST)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD59W-0003c7-FP
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD543-00035U-CG; Mon, 09 Aug 2021 09:11:35 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD541-0001Tf-AV; Mon, 09 Aug 2021 09:11:35 -0400
Received: by mail-qk1-x732.google.com with SMTP id t3so16936847qkg.11;
 Mon, 09 Aug 2021 06:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCIyX54y4ShaVWM1ZhhcHUrvK4nZlKNXjYkBC0xbZDY=;
 b=r4HpIk8x4+ksAsN3ReSbgX5wowz6bJgKTC1yyd+9e8YtNfBLtTqbGQkfcNXEOXTBVd
 sJcUxthnfsB/senPAEXuWnp1hEFtLURRe73xJcLbApir+ab2bYyxrC3nl2Kym7V2jA/q
 jzEztsIdQI16hjZ0UGWK5ArbIwhg6XSlkULXVg7p41fukWHeDSdRqoHaEUExkk8DGS3c
 Q0+QUYVz7E5hiM9zMb7ATGjkBfMNocFiGpKGG4L5Q4LQ/nCaN3z1SXxxPiEPkcqEwCaf
 emf4e1JQtR27mtp81LgP70XZdAxtz1eloc9BXvmZd8PmmuiJTmCTic8yaORfQb6z7yEB
 qPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCIyX54y4ShaVWM1ZhhcHUrvK4nZlKNXjYkBC0xbZDY=;
 b=IJqVLTJAIYfNxO5Bu7vPpgN6ioThGV05reQuAXyOYRSD3Q4TdOhs0p7F4Zt+H3VA4v
 CwfE5fD548pVCQy4urTs/Vy7ANAxnereROM65+7JRNaZuDbh2DjGAdAW2FckEdMTW71A
 fe+A/vdX6ne5qOR62rN89r/+mM1wmMzGNuK+EfzlZ/FuSSZp6ow1y9oDU/yMSgBxfEtO
 KXi9wskcI7vwqRk5D3RM8UhrkWC8x+gjqvyckKUyd4spplTxcRSbyXw9wOdvqzW8zTV5
 GQAtp3fOXJrhiC8wMKefeaTkB1v5RaRUxV7MwUilWI0QLzMVgvxIS1WnVeEFfOLsROFm
 Rfcw==
X-Gm-Message-State: AOAM533MUHwY4R5R1DA7a1CQACgAZbGq7+P9gME/BBZzegKDICpO45un
 8MARXk1XSI7GQvnXvTfUBdwDjbL3/ozxkA==
X-Google-Smtp-Source: ABdhPJyasUkxC15C/XX8PbfUi/fiJhz2vPNVJd/srnPqXKlWFdGK3MHfnMLXIC4LQT31YQRCbVpmgg==
X-Received: by 2002:a05:620a:319e:: with SMTP id
 bi30mr2334746qkb.138.1628514691849; 
 Mon, 09 Aug 2021 06:11:31 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/19] target/ppc: PMU Event-Based exception support
Date: Mon,  9 Aug 2021 10:10:48 -0300
Message-Id: <20210809131057.1694145-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
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

This patch sets the basic structure of interrupts and the timer. The
following patches will add the counter negative logic for the registers.
The goal is to use the EBB selftests of the powerpc kernel to validate
the EBB implementation, thus we'll add more PMU bits as we go along.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_cpu_core.c        |  6 ++++++
 target/ppc/cpu.h               |  9 +++++++-
 target/ppc/excp_helper.c       | 28 +++++++++++++++++++++++++
 target/ppc/pmu_book3s_helper.c | 38 ++++++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 4f316a6f9d..41b443bde2 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -20,6 +20,7 @@
 #include "target/ppc/kvm_ppc.h"
 #include "hw/ppc/ppc.h"
 #include "target/ppc/mmu-hash64.h"
+#include "target/ppc/pmu_book3s_helper.h"
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
index ae431e65be..1d38b8cf7a 100644
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
@@ -1201,6 +1202,11 @@ struct CPUPPCState {
      * instructions and cycles.
      */
     uint64_t pmu_base_icount;
+
+    /*
+     * Timer used to fire performance monitor alerts and interrupts.
+     */
+    QEMUTimer *pmu_intr_timer;
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
@@ -2417,6 +2423,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
+    PPC_INTERRUPT_PMC,            /* Performance Monitor Counter interrupt */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a79a0ed465..b866209b6e 100644
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
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 91bb82e699..43cc0eb722 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -10,12 +10,15 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "pmu_book3s_helper.h"
+
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "hw/ppc/ppc.h"
 
 /*
  * Set arbitrarily based on clock-frequency values used in PNV
@@ -96,6 +99,41 @@ static void update_PMCs(CPUPPCState *env, uint64_t icount_delta)
     update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
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
+
+    timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_pmu_timer_cb, cpu);
+    env->pmu_intr_timer = timer;
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     uint64_t curr_icount = (uint64_t)icount_get_raw();
-- 
2.31.1


