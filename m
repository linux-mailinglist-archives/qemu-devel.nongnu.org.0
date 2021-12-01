Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC72465185
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:25:15 +0100 (CET)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRTu-0006ve-LE
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:25:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRN7-0006p8-7Y; Wed, 01 Dec 2021 10:18:14 -0500
Received: from [2607:f8b0:4864:20::930] (port=42851
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRN5-0003NI-7V; Wed, 01 Dec 2021 10:18:12 -0500
Received: by mail-ua1-x930.google.com with SMTP id t13so49761459uad.9;
 Wed, 01 Dec 2021 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qB4Nup0KQWdp+rXCrJf6D86Y/j+OnRDiBjtPexJVfvI=;
 b=YrqK/yQC43ORZ4ccNmwSC2TFhlqc3UZEyc59i4UUR1gByldaB9arjjMzMjgOLn2Www
 EKZm4TTuHDLtPV1ib5PrdTrt6OXc6J/rPM9QDcKYi9HTqF3OctUiQwwDTNGJ3NkhwFsQ
 UXGMozXb1a19lh8zMNKQ747DfXDDrbZyGUrthm1oAo1H8/ZHrmeGzJnOGGXoS/qBIbwC
 bL7g59PKBHhw3g7D0asEUZeIrNzcyUV0LHhAeM/pVWu5U4YlbTpdpiYgRSt0Yc8TBusd
 923zbDMcG5izxGMbwtSvsoynxtsAIF81M7dWXLw95tIk5LfY1nYHx21bQsB1HVhztAKZ
 5S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qB4Nup0KQWdp+rXCrJf6D86Y/j+OnRDiBjtPexJVfvI=;
 b=PD1+Iv0CHdRtQtpoxKScE9XC/VJH6HZjDRxzLxqDInHsnyvvvcUxELSeMe8NpgKT1k
 TGmm9T3BtKTht2C9L4KVl/dyn7opc8D3S8qv7XZbCZxvw4K77Y6uq7LMd/98lqyOw/03
 47FmMqNyzmpryHAOIGYR08LQRDX9QiK6eYLwp7EVLkFb0yGlwjPB+F+auPXn1+REt0Ar
 wbAmOJ/jHnFaX49T0R3oiRbIZB2e6bakkLDKknBlR7PHlz/9AR1960MUydwoXOmSEa/i
 9eUuEri6DpoxcTwiB8sLML7XkHhIGmk9crQMpYaNs51UCnMVrEt4hSo+hRQE8+uncAap
 oslw==
X-Gm-Message-State: AOAM532z2OlV8yZBtRBZj06BrlrblHDEvqZFGvRuZ9TNGJ+g5aZ1Hkym
 /6ooLxusxnFAohOy2AkLUVVW6YnCIoI=
X-Google-Smtp-Source: ABdhPJzoz/ngMwLmjBZuld/FGSJ6BtwQeIFjcaGugx/+exb2AHGt2SHFnIjSlGERyySt/wxrvir/Rw==
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr8360125uae.110.1638371889872; 
 Wed, 01 Dec 2021 07:18:09 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:18:09 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/10] target/ppc: PMU Event-Based exception support
Date: Wed,  1 Dec 2021 12:17:33 -0300
Message-Id: <20211201151734.654994-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
References: <20211201151734.654994-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
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

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  5 ++++-
 target/ppc/excp_helper.c | 29 +++++++++++++++++++++++++++++
 target/ppc/power8-pmu.c  | 40 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 741b8baf4c..8e0e6319ee 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -129,8 +129,10 @@ enum {
     /* ISA 3.00 additions */
     POWERPC_EXCP_HVIRT    = 101,
     POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
+    POWERPC_EXCP_EBB = 103, /* Event-based branch exception                  */
+
     /* EOL                                                                   */
-    POWERPC_EXCP_NB       = 103,
+    POWERPC_EXCP_NB       = 104,
     /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
@@ -2452,6 +2454,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
+    PPC_INTERRUPT_PMC,            /* PMU interrupt  */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7ead32279c..a26d266fe6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -799,6 +799,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         cpu_abort(cs, "Non maskable external exception "
                   "is not implemented yet !\n");
         break;
+    case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
+        if ((env->spr[SPR_FSCR] & (1ull << FSCR_EBB)) &&
+            (env->spr[SPR_BESCR] & BESCR_GE) &&
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
@@ -1046,6 +1063,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 08d1902cd5..279b824c3f 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -297,6 +297,20 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
     pmc_update_overflow_timer(env, sprn);
 }
 
+static void pmu_delete_timers(CPUPPCState *env)
+{
+    QEMUTimer *pmc_overflow_timer;
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        pmc_overflow_timer = get_cyc_overflow_timer(env, sprn);
+
+        if (pmc_overflow_timer) {
+            timer_del(pmc_overflow_timer);
+        }
+    }
+}
+
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
@@ -305,8 +319,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
         return;
     }
 
-    /* PMC interrupt not implemented yet */
-    return;
+    pmu_update_cycles(env);
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
+
+        /* Changing MMCR0_FC demands a new hflags compute */
+        hreg_compute_hflags(env);
+
+        /*
+         * Delete all pending timers if we need to freeze
+         * the PMC. We'll restart them when the PMC starts
+         * running again.
+         */
+        pmu_delete_timers(env);
+    }
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
+    }
+
+    /* Fire the PMC hardware exception */
+    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
 }
 
 /* This helper assumes that the PMC is running. */
-- 
2.31.1


