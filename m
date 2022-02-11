Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7494B2D1E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:49:46 +0100 (CET)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIazB-0003Nt-W9
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakQ-0004LH-5X; Fri, 11 Feb 2022 13:34:22 -0500
Received: from [2607:f8b0:4864:20::22c] (port=39657
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakO-000477-4k; Fri, 11 Feb 2022 13:34:21 -0500
Received: by mail-oi1-x22c.google.com with SMTP id s24so10540924oic.6;
 Fri, 11 Feb 2022 10:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XbK9vwhUAJP4GnL6F682SGz8zy//HAXVrusxdUQyDmg=;
 b=quCd2T1X5MIWUrtFTaCiVgCGaCmEL5NplIMbW2kj4IuVMCM9Yr8kauPwHWPWtkhHxa
 WfsBlzljR6WKfDynwJtaqdHafNDsBvdHy72RWuYnZCJ+AfdUWH5GxegdAjhzR+dsZpVl
 gMO90+tbjwzB772zRTMx7WjVJ7IPGivRvJZxiVM30bYKIhhAHQ19q+A5qF7Ez1gkwQZC
 rValjrm+YPosKF1mn9S79VLBpp01iXKQ0ZaBz2gJ1a6XTiTvRkDLxbsytT5qAJBwJlJs
 jFx8+roDi544pl3OlQWhYsJTrXmmM6P6m1SerSGnsvgYuB+i5FzCNQqfxWA2vSq2W3ul
 DVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XbK9vwhUAJP4GnL6F682SGz8zy//HAXVrusxdUQyDmg=;
 b=NWpcfDCp2NMCAl09pidWeqo/Ryg2oN7ayu4Q8lMghNTMIqEpXMMIs6QEzlTxHApcD7
 1Ja6qGtG+9K4K+rq5KfejmrC0ro4t1TTUQx80EbXhX4BlM6Bg3qf8qeouX/vwwtaD+q5
 6V6PuWRSOWCpACHFVM1J95S57vlEhtrsStVzFLiUgOC4usQN/QGXJFzx6yp0fDuqYe4j
 bdZ+LclXL3rZ0asoC0cpRT3bXLp6qIiO7JAvhD9jJbgoeDD79MzdRsmzi8Z5zzyIqkUU
 Ap0ert1K0JB8xyfT5GpszwyXWYAIvU8dvRBBWOVR/SK5ZFcecbqDHI4eVTymhxoyEHLS
 81ww==
X-Gm-Message-State: AOAM530i9Y56AWm6wzxQR1Mlk/+VIX0ejuFARdhj7G4MZPPz/bbsru1s
 etszVeuEedL64BO2PVwIOeIMZ+9NSKM=
X-Google-Smtp-Source: ABdhPJwWpEq5h2YaWhJ91S7tB19bCwFfbfKzgCKs3F0rQDYPLZk8SGsTRbXhJQGl4aIxcX3sxxX1Ug==
X-Received: by 2002:a05:6808:552:: with SMTP id
 i18mr858121oig.289.1644604458102; 
 Fri, 11 Feb 2022 10:34:18 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id t22sm10008145oiw.2.2022.02.11.10.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 10:34:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 3/4] target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
Date: Fri, 11 Feb 2022 15:33:53 -0300
Message-Id: <20220211183354.563602-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211183354.563602-1-danielhb413@gmail.com>
References: <20220211183354.563602-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  5 ++++-
 target/ppc/cpu_init.c    |  4 ++++
 target/ppc/excp_helper.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index dcd83b503c..3962c8f6f4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -129,8 +129,10 @@ enum {
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
@@ -2453,6 +2455,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
+    PPC_INTERRUPT_EBB,            /* Event-based Branch exception         */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index bf60529d37..136d8ca8b5 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2336,6 +2336,10 @@ static void init_excp_POWER8(CPUPPCState *env)
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
index 8a49a4ab90..ad40a0f8e6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -990,6 +990,21 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
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
@@ -1681,6 +1696,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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
2.34.1


