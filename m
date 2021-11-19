Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F927457661
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:26:42 +0100 (CET)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8av-00008j-M4
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:26:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XT-0004Lm-Op; Fri, 19 Nov 2021 13:23:07 -0500
Received: from [2607:f8b0:4864:20::a2d] (port=43596
 helo=mail-vk1-xa2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XR-0001qD-OK; Fri, 19 Nov 2021 13:23:07 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id f7so6395552vkf.10;
 Fri, 19 Nov 2021 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J+VdvTwh0Mb2RQRkV+qUAAbu7AZHuwZQgM2d5bVtET8=;
 b=LnYuUXS/KoGGXFjRpG6wivxThssvxnLwebnET7RQbLSQdv+pjJPioaeuUahB2iXPgB
 vjch8s5b8j1T1lr2F8bZ5im6g7WhWuY5y3mJ7AZ2OR31LwlpeSQq36NitkCpaAr3P1RY
 vvxwOXAhYqq33fpmhYgxcj5A4Q+qfi9c3+0DFr+aJAtmLik/VhOyhhadtqm6N2rPDCvA
 jHWHHz8hvd5BhL2Il2fJpiQ5J1qjYILwFakSnMTFiB0b7UR+Uvj27u5TlII7v6bvZKUZ
 8yOXsyklj1GYwm/ldm+D53ZAJFX6Gfgc8KuM8ltaQks1Z1bOaVa+tsabyq19985Rbw19
 uHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J+VdvTwh0Mb2RQRkV+qUAAbu7AZHuwZQgM2d5bVtET8=;
 b=rZ1xC+LcbkoCPk40PTUsc0p21cMZdu9s/t5VcTm6vHDu+0nwHoC6GQBnq3djbhQAGo
 b0fSjFU1TRz8Jcqlxl2KDT3hkPD8yLhF8hWvqSL5XTg8ZBHBvGYHN2eGOzzZ+hhMfnSz
 JyhgeInPYQff2PyiJCh854VOJc/4N1i8zGapLT3IP7mPTAnjb1Bp6YfPFkVs0jpWCPST
 nxkjVToFBgZOSbABdsHpzMcaRkE6ZqdjA0U7ceqL0hqSsQf00gsdVIyQML+58xa0p+Jv
 xkGE2zAou9DHv15yqTzfbs34LbqXhxmbFxRy54KjJx+BoshVwAAvEd4Ckyfn7+6FVIuC
 xEgA==
X-Gm-Message-State: AOAM531BcpfMUOXJLgM4ROjBgiRQ7JMpZ4MD/CR0AbH8to5ywwRdwOkz
 13sP+XcuC4Y637WSzziRLVwX27JesrOoeg==
X-Google-Smtp-Source: ABdhPJwzkzTjG7ocWHRZBNxlHAb40AgIA/3vVja7UYJ/44+bnAeE8/WvSbMyF4wcsvTmq9WtGjHh4g==
X-Received: by 2002:a05:6122:130f:: with SMTP id
 e15mr18167563vkp.14.1637346178849; 
 Fri, 19 Nov 2021 10:22:58 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:22:58 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 09/10] target/ppc: PMU Event-Based exception support
Date: Fri, 19 Nov 2021 15:22:15 -0300
Message-Id: <20211119182216.628676-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119182216.628676-1-danielhb413@gmail.com>
References: <20211119182216.628676-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2d.google.com
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
 target/ppc/power8-pmu.c  | 26 ++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index bd807aa7ea..46289f33f2 100644
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
+    PPC_INTERRUPT_PMC,            /* Hypervisor virtualization interrupt  */
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
index 1dfe4bc930..3aaf465d5b 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -323,8 +323,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
         return;
     }
 
-    /* PMC interrupt not implemented yet */
-    return;
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
+    pmu_update_cycles(env, env->spr[SPR_POWER_MMCR0]);
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


