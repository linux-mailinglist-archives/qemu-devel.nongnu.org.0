Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B451C4B854C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:14:28 +0100 (CET)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHKN-0007nk-RD
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHS-0004fs-JW; Wed, 16 Feb 2022 05:11:26 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=46014
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHQ-0002A5-TR; Wed, 16 Feb 2022 05:11:26 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so1851611oor.12; 
 Wed, 16 Feb 2022 02:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afcW9NjHxvKYiIPUrAUv9u2+Pl3fFq4NpoJePFp6Ykc=;
 b=gcByH1D9AvX2yVcyFXZSSERXksYvFUqcps72Xdaxm8ZHV0GNg/aJDNAgCcuKNlsbN6
 sLpdQrXhr/CJPl6t8+5YGV2Ezsogw2cuyCM9fI1dQ/VsQxK+ahsfXQC7a+FM6XI6nse+
 aIEHwdTzwqmv0W2rpgqMUaimtuzkj9CBhxXHQv6a/yaRs3lWUS3cDsT2ULE4W1x+rDs/
 eKffG5bb262geq5YXj3zaLa2s/4Tc07SHOg6D9u8E0Ihnkg7R2s4/E7JY13k12FzeujU
 f+t/ULZSUqBgsO6BE0cpjEGtBPGvKDG3k7YA7x8Mg3EbJ7HsdBi2jpSTj02bTatEUofU
 Mpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afcW9NjHxvKYiIPUrAUv9u2+Pl3fFq4NpoJePFp6Ykc=;
 b=JaaLS/uLV3PuAzrrZzvZtoz0zSAov7ct4Qxr45ob1d+UnzEhbQEInmKNuqMK34FIRF
 wid3VuEEiKCKkhhnpwJj0x7olho46r39yGav58oZoquSPI5ON0kOqfJQi+UcridKKLZi
 /a0eusBXai/3Q8aY72ANqytctj5TaJE+HX01DYP54EZItcyw9je9cd12Xi82Ihbu/4BB
 UgvVJWLPFgNvo6A7Qd03gtmC0MYb/ke62STARE/2/LHgsRe1N4XPY8kthS2fhiDYvQvt
 NcoCnj1/lp5UZKTIHLiXtvy8O3OqlzZCZ2XT7tYL+pI5lKsWU3sAdPVx+QA5Jr8GnouZ
 Ah2g==
X-Gm-Message-State: AOAM532bna5JtXujUq3mBmlEhtl7i0u7xre6dS8KLuaWGYpc6jlupLk6
 mD5vrCMOK1Q649lAJW9Rgigb0YwQ3f8=
X-Google-Smtp-Source: ABdhPJzamHaJUJWykyzRxlRFRdXUGT8YUcf9Vn0QL2cJgGULignak5aikuZb0czs8H7qIgOpajemoA==
X-Received: by 2002:a05:6870:54c7:b0:c4:7dc0:d6e5 with SMTP id
 g7-20020a05687054c700b000c47dc0d6e5mr215193oan.184.1645006283384; 
 Wed, 16 Feb 2022 02:11:23 -0800 (PST)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id
 y1sm17612689oad.38.2022.02.16.02.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:11:23 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 4/5] target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
Date: Wed, 16 Feb 2022 07:11:01 -0300
Message-Id: <20220216101102.179158-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216101102.179158-1-danielhb413@gmail.com>
References: <20220216101102.179158-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
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
index 555c6b9245..e8a423d14d 100644
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
@@ -2426,6 +2428,7 @@ enum {
     PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
     PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
+    PPC_INTERRUPT_EBB,            /* Event-based Branch exception         */
 };
 
 /* Processor Compatibility mask (PCR) */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 8fc644f8d6..8ddac4e2fe 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2239,6 +2239,10 @@ static void init_excp_POWER8(CPUPPCState *env)
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
index bbc75afbc0..04c61cff39 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1513,6 +1513,21 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
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
@@ -1742,6 +1757,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
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


