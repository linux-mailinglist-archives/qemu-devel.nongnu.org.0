Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96D64C36CB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:21:44 +0100 (CET)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKcR-00022P-VO
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:21:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa8-0008Gt-Tg; Thu, 24 Feb 2022 15:19:20 -0500
Received: from [2607:f8b0:4864:20::22e] (port=42576
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa6-00030c-3L; Thu, 24 Feb 2022 15:19:20 -0500
Received: by mail-oi1-x22e.google.com with SMTP id a6so4717179oid.9;
 Thu, 24 Feb 2022 12:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ApxlYC2X2YZRpjp13l0ioB++YBkiwUxI4BVLzm9mRZ0=;
 b=ZfLH3Phzi0WohmJk/8lB6hlWbdI1sWtPLydhmd5Gju89Dk7fziT0xKK16j0O6uilCj
 c0MUdSPankyF3lqU0yUucY9L93YskMYFbnZLV3Qlf3iOyP8QrPdjQFJb5nXR9LMnLqV9
 Jh1ujXZ55jaK34/j1VEupyvCqlaMMl6xX9mCInyPseW7Cf7gm+TlMVkwSylJMKzsS05O
 UGcOD6RcqLmbfVqu9q7d/3UsFN4irqL12sxCCDlaTla/m5wO1b60l9EZBy1dHrGhfvD2
 uW3sEhGYgcMea88dAZRMZ4BKOnq7zFoBolfnTdr9XJVLiy4DVCwChrfscatW+Yk4NnvW
 +gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ApxlYC2X2YZRpjp13l0ioB++YBkiwUxI4BVLzm9mRZ0=;
 b=rTufUjy+3V0wh/imnbuerjdEGhq7jtbdSjRrt2ogx7++XUxDbzYUAEm7ceANUhfWSr
 HmySfi1ntEZBHYRG8rX7HMuhztJDPGdv3d0yBQw7rFP5tSJi+fDr9mqgBYZzGXiQx7X7
 TZOksPZjbN0CLj12RAraeeR3lGzHfembN/+nQd8VDIa7cQzIkQ9CrvlPj4ReCDV7BrTw
 WiLAvdMFT42da8YVZuT5ES1u6kyINMwDmioahUmRHnVEZZosHcCjY6gt8JOw/fEQQIXw
 ChFHvvMYitPliiEGQduPQGaC8SmZbsTT/bvf5P0219OuRa2g3fxSgBF1Fje6TE99fPEE
 Xm/g==
X-Gm-Message-State: AOAM532ZZWz4Cfwcxg3FkJbizD+KQbxtPjF5ZYsCsvV7kUatjq1V0zuB
 iRG85cHI9suo57k7qzCdJfZBPhgPsYQ=
X-Google-Smtp-Source: ABdhPJw77azwEro4IAh/PNUcfnXE5a/xKHlI4CUWSTLrg+bWTswsp/liYOtUnaIMS+mfFN1MZjCr4A==
X-Received: by 2002:aca:f241:0:b0:2cd:92b7:5640 with SMTP id
 q62-20020acaf241000000b002cd92b75640mr7912005oih.75.1645733956607; 
 Thu, 24 Feb 2022 12:19:16 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 bh42-20020a056808182a00b002d538a8d5afsm305775oib.7.2022.02.24.12.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:19:16 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 3/4] target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
Date: Thu, 24 Feb 2022 17:18:59 -0300
Message-Id: <20220224201900.1037465-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224201900.1037465-1-danielhb413@gmail.com>
References: <20220224201900.1037465-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PPC_INTERRUPT_EBB is a new interrupt that will be used to deliver EBB
exceptions that had to be postponed because the thread wasn't in problem
state at the time the event-based branch was supposed to occur.

ISA 3.1 also defines two EBB exceptions: Performance Monitor EBB
exception and External EBB exception. They are being added as
POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB.

PPC_INTERRUPT_EBB will check BESCR bits to see the EBB type that
occurred and trigger the appropriate exception. Both exceptions are
doing the same thing in this first implementation: clear BESCR_GE and
enter the branch with env->nip retrieved from SPR_EBBHR.

The checks being done by the interrupt code are msr_pr and BESCR_GE
states. All other checks (EBB facility check, BESCR_PME bit, specific
bits related to the event type) must be done beforehand.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  5 ++++-
 target/ppc/cpu_init.c    |  4 ++++
 target/ppc/excp_helper.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5b01d409b3..79375e8df4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -127,8 +127,10 @@ enum {
     /* ISA 3.00 additions */
     POWERPC_EXCP_HVIRT    = 101,
     POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
+    POWERPC_EXCP_PERFM_EBB = 103,    /* Performance Monitor EBB Exception    */
+    POWERPC_EXCP_EXTERNAL_EBB = 104, /* External EBB Exception               */
     /* EOL                                                                   */
-    POWERPC_EXCP_NB       = 103,
+    POWERPC_EXCP_NB       = 105,
     /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
@@ -2434,6 +2436,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
+    PPC_INTERRUPT_EBB,            /* Event-based Branch exception         */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 544e052290..073fd10168 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2060,6 +2060,10 @@ static void init_excp_POWER8(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_FU]       = 0x00000F60;
     env->excp_vectors[POWERPC_EXCP_HV_FU]    = 0x00000F80;
     env->excp_vectors[POWERPC_EXCP_SDOOR_HV] = 0x00000E80;
+
+    /* Userland exceptions without vector value in PowerISA v3.1 */
+    env->excp_vectors[POWERPC_EXCP_PERFM_EBB] = 0x0;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL_EBB] = 0x0;
 #endif
 }
 
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 6538c56ab0..5e7d29ae00 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1554,6 +1554,21 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         new_msr |= (target_ulong)MSR_HVB;
         new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
         break;
+    case POWERPC_EXCP_PERFM_EBB:        /* Performance Monitor EBB Exception  */
+    case POWERPC_EXCP_EXTERNAL_EBB:     /* External EBB Exception             */
+        env->spr[SPR_BESCR] &= ~BESCR_GE;
+
+        /*
+         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
+         * stored in the EBB Handler SPR_EBBHR.
+         */
+        env->spr[SPR_EBBRR] = env->nip;
+        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
+
+        /*
+         * This exception is handled in userspace. No need to proceed.
+         */
+        return;
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
     case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
@@ -1797,6 +1812,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             powerpc_excp(cpu, POWERPC_EXCP_THERM);
             return;
         }
+        /* EBB exception */
+        if (env->pending_interrupts & (1 << PPC_INTERRUPT_EBB)) {
+            /*
+             * EBB exception must be taken in problem state and
+             * with BESCR_GE set.
+             */
+            if (msr_pr == 1 && env->spr[SPR_BESCR] & BESCR_GE) {
+                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_EBB);
+
+                if (env->spr[SPR_BESCR] & BESCR_PMEO) {
+                    powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
+                } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
+                    powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
+                }
+
+                return;
+            }
+        }
     }
 
     if (env->resume_as_sreset) {
-- 
2.35.1


