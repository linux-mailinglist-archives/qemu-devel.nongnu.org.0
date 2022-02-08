Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74AD4AE275
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:00:07 +0100 (CET)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWek-0006rC-P8
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:00:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWU5-0007Y1-Hr; Tue, 08 Feb 2022 14:49:05 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=41943
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWU3-0002tb-RC; Tue, 08 Feb 2022 14:49:05 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so18879728ooq.8; 
 Tue, 08 Feb 2022 11:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fuf/DlTcO0lDbHFTa7165tVyHOjPjiKqfW6tCeQK50o=;
 b=Dwry1ZyxFvNSviRCaNlN9vJbRgSh+DIWv2N1XZ8oqQZLcScOOQIxdjNsYpczssbsKj
 aqIqEo68qzinjbdko66XKWPBU+bd0CkDZqUPxyRO5JhqklOOBMGFuWBWFIviLnrlLNjZ
 +/QifogX9hBrFBHrCDCaeKq/fHk7S0HVEBKXt8Y5QgKqjIN13CqdmaeivIEc3fG6uwKr
 fCV+r3tELwFnygZGU/8WwKUqzZlCvYRto0FW2feiqhNr+VqajYDHo+C4yJdMIFCqc9ET
 z7G58lst+d0GSPah1IdghC+LFaANT5P4B3/zzLpzWdV6QD/8s0U6PUwRyS1sfYIa9zJB
 mfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fuf/DlTcO0lDbHFTa7165tVyHOjPjiKqfW6tCeQK50o=;
 b=pJsMo75X5eqC9BF/THKY7Iqw09AxodwIHkNA1/ssRZCxjEBmTdkhYNINX8gbhIblgQ
 50ura80xNm+kyJB7+ytrCf0YfdffJP+T5Dl25Oq265apo6+Zo4qKVYtHrbJ0bhlTfjb8
 1Vp1CNJWPFO3MgbgjplcvaGHVwYIvAz6pp+BvY1tmIjDbkrbhp91hSOry707051VodcC
 vy/cHCQIGsZub+4imYxHJBU+6UuUESA3Vy/7gb2LhKgfEgp93xcaisLj5d3jWG2qe1zm
 0Gxl1wC0k82K/JqqKozXdQKXJuq8TfDpqwSm9wr1Q431ZzzK4OxT62WuYs0iYveztxPG
 KBnA==
X-Gm-Message-State: AOAM533smRifz9A8l5Dw+5yO8c1zYZOUQK2SRisuAvHx9ni5Ykg3TuEY
 QfGdAJSkYiz5ZwA/7HJaXHNUeUbajvU=
X-Google-Smtp-Source: ABdhPJx1SBMhaitGth+u4KACNaIoedzENhlwv+O2ou23dSOsOnT9XUuk90KvrpOP7xfNxDpQdmuAxA==
X-Received: by 2002:a05:6870:1843:: with SMTP id
 u3mr951346oaf.30.1644349742185; 
 Tue, 08 Feb 2022 11:49:02 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id s14sm6012592oiw.42.2022.02.08.11.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:49:01 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 3/3] target/ppc: EBB exception implementation
Date: Tue,  8 Feb 2022 16:48:38 -0300
Message-Id: <20220208194838.169257-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208194838.169257-1-danielhb413@gmail.com>
References: <20220208194838.169257-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
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

This patch adds the EBB exception support that are triggered by
Performance Monitor alerts. This happens when a Performance Monitor
alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.

A 'ebb_excp_enabled' helper is called at the end of fire_PMC_interrupt()
to fire the EBB exception, checking for FSCR and HFSCR support
beforehand.

In ppc_hw_interrupt() the generated EBB exception will be taken only if
running in problem state and with BESCR_GE set. The check for BESCR_GE
bit in this step is needed to avoid race conditions where we take an
EBB, while the previous EBB is still inflight (BESCR_GE cleared), and
SPR_EBBHR is not set yet. In this case we'll branch to env->nip = 0 and the
guest will crash. The Linux kernel selftest 'lost_exception_test' is an
example where this racing will occur.

The code in powerpc_excp_books() is the default EBB handling described
in the PowerISA v3.1: clear BESCR_GE, set BESCR_PMEO, save env->nip in
SPR_EBBRR and redirect the execution to the address pointed by
SPR_EBBHR. The already implemented 'rbebb' instruction is then able to
return from the EBB by retrieving the NIP in SPR_EBBRR.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 51 +++++++++++++++++++++++++++++++++++++---
 target/ppc/helper.h      |  1 +
 target/ppc/power8-pmu.c  | 12 ++++++++--
 3 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 8a49a4ab90..2a95cec39e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "hw/ppc/ppc.h"
 #include "exec/exec-all.h"
 #include "internal.h"
 #include "helper_regs.h"
@@ -990,8 +991,22 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         new_msr |= (target_ulong)MSR_HVB;
         new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
         break;
-    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
+        env->spr[SPR_BESCR] &= ~BESCR_GE;
+        env->spr[SPR_BESCR] |= BESCR_PMEO;
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
+    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
     case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
     case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
     case POWERPC_EXCP_SDOOR:     /* Doorbell interrupt                       */
@@ -1671,8 +1686,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
             return;
         }
         if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
-            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
-            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
+            /*
+             * PERFM EBB must be taken in problem state and
+             * with BESCR_GE set.
+             */
+            if (msr_pr == 1 && env->spr[SPR_BESCR] & BESCR_GE) {
+                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
+                powerpc_excp(cpu, POWERPC_EXCP_PERFM);
+            }
             return;
         }
         /* Thermal interrupt */
@@ -1915,6 +1936,30 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
         env->spr[SPR_BESCR] &= ~BESCR_GE;
     }
 }
+
+void helper_ebb_perfm_int(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    /*
+     * FSCR_EBB and FSCR_IC_EBB are the same bits used with
+     * HFSCR.
+     */
+    helper_fscr_facility_check(env, FSCR_EBB, 0, FSCR_IC_EBB);
+    helper_hfscr_facility_check(env, FSCR_EBB, "EBB", FSCR_IC_EBB);
+
+    /*
+     * Setting "env->pending_interrupts |= 1 << PPC_INTERRUPT_PERFM"
+     * instead of calling "ppc_set_irq()"" works in most cases, but under
+     * certain race conditions (e.g. lost_exception_test EBB kernel
+     * selftest) this hits an assert when dealing with the BQL:
+     *
+     * tcg_handle_interrupt: assertion failed: (qemu_mutex_iothread_locked())
+     *
+     * We ended up using ppc_set_irq() because it handles the BQL.
+     */
+    ppc_set_irq(cpu, PPC_INTERRUPT_PERFM, 1);
+}
 #endif
 
 /*****************************************************************************/
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f2e5060910..bb26da6176 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -19,6 +19,7 @@ DEF_HELPER_1(rfid, void, env)
 DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(rfebb, void, env, tl)
+DEF_HELPER_1(ebb_perfm_int, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index d245663158..41409e609f 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -281,6 +281,13 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
     pmc_update_overflow_timer(env, sprn);
 }
 
+static bool ebb_excp_enabled(CPUPPCState *env)
+{
+    return env->spr[SPR_POWER_MMCR0] & MMCR0_EBE &&
+           env->spr[SPR_BESCR] & BESCR_PME &&
+           env->spr[SPR_BESCR] & BESCR_GE;
+}
+
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
@@ -307,8 +314,9 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
         env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
     }
 
-    /* PMC interrupt not implemented yet */
-    return;
+    if (ebb_excp_enabled(env)) {
+        helper_ebb_perfm_int(env);
+    }
 }
 
 /* This helper assumes that the PMC is running. */
-- 
2.34.1


