Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8030593375
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:47:26 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNdFN-0005VO-UJ
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrA-0008IP-4N; Mon, 15 Aug 2022 12:22:24 -0400
Received: from [200.168.210.66] (port=4179 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcr4-0005wd-KM; Mon, 15 Aug 2022 12:22:20 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Aug 2022 13:20:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 65DE380046B;
 Mon, 15 Aug 2022 13:20:44 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH 07/13] target/ppc: create an interrupt masking method for
 POWER8
Date: Mon, 15 Aug 2022 13:20:13 -0300
Message-Id: <20220815162020.2420093-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Aug 2022 16:20:44.0704 (UTC)
 FILETIME=[F8850200:01D8B0C2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create an interrupt masking method for POWER8. The new method is based
on cpu_has_work_POWER8 and ppc_pending_interrupt_legacy.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/excp_helper.c | 138 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 42b57019ba..13c2d5e2ce 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1678,6 +1678,142 @@ void ppc_cpu_do_interrupt(CPUState *cs)
     powerpc_excp(cpu, cs->exception_index);
 }
 
+static int ppc_pending_interrupt_p8(CPUPPCState *env)
+{
+    CPUState *cs = env_cpu(env);
+    bool async_deliver = false;
+
+    /* External reset */
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+
+    if (cs->halted) {
+        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+            (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
+            return PPC_INTERRUPT_EXT;
+        }
+        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+            (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
+            return PPC_INTERRUPT_DECR;
+        }
+        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
+            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+            return PPC_INTERRUPT_MCK;
+        }
+        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
+            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+            return PPC_INTERRUPT_HMI;
+        }
+        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
+            (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
+            return PPC_INTERRUPT_DOORBELL;
+        }
+        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
+            (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
+            return PPC_INTERRUPT_HDOORBELL;
+        }
+        return 0;
+    }
+
+    /* Machine check exception */
+    if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
+        return PPC_INTERRUPT_MCK;
+    }
+
+    /*
+     * For interrupts that gate on MSR:EE, we need to do something a
+     * bit more subtle, as we need to let them through even when EE is
+     * clear when coming out of some power management states (in order
+     * for them to become a 0x100).
+     */
+    async_deliver |= FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
+
+    /* Hypervisor decrementer exception */
+    if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
+        /* LPCR will be clear when not supported so this will work */
+        bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
+            /* HDEC clears on delivery */
+            return PPC_INTERRUPT_HDECR;
+        }
+    }
+
+    /* Hypervisor virtualization interrupt */
+    if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
+        /* LPCR will be clear when not supported so this will work */
+        bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
+            return PPC_INTERRUPT_HVIRT;
+        }
+    }
+
+    /* External interrupt can ignore MSR:EE under some circumstances */
+    if (env->pending_interrupts & PPC_INTERRUPT_EXT) {
+        bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
+        /* HEIC blocks delivery to the hypervisor */
+        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
+            !FIELD_EX64(env->msr, MSR, PR))) ||
+            (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
+            return PPC_INTERRUPT_EXT;
+        }
+    }
+    if (FIELD_EX64(env->msr, MSR, CE)) {
+        /* External critical interrupt */
+        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
+            return PPC_INTERRUPT_CEXT;
+        }
+    }
+    if (async_deliver != 0) {
+        /* Watchdog timer on embedded PowerPC */
+        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
+            return PPC_INTERRUPT_WDT;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
+            return PPC_INTERRUPT_CDOORBELL;
+        }
+        /* Fixed interval timer on embedded PowerPC */
+        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
+            return PPC_INTERRUPT_FIT;
+        }
+        /* Programmable interval timer on embedded PowerPC */
+        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
+            return PPC_INTERRUPT_PIT;
+        }
+        /* Decrementer exception */
+        if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
+            return PPC_INTERRUPT_DECR;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
+            return PPC_INTERRUPT_DOORBELL;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
+            return PPC_INTERRUPT_HDOORBELL;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
+            return PPC_INTERRUPT_PERFM;
+        }
+        /* Thermal interrupt */
+        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
+            return PPC_INTERRUPT_THERM;
+        }
+        /* EBB exception */
+        if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
+            /*
+             * EBB exception must be taken in problem state and
+             * with BESCR_GE set.
+             */
+            if (FIELD_EX64(env->msr, MSR, PR) &&
+                (env->spr[SPR_BESCR] & BESCR_GE)) {
+                return PPC_INTERRUPT_EBB;
+            }
+        }
+    }
+
+    return 0;
+}
+
 static int ppc_pending_interrupt_p9(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -1932,6 +2068,8 @@ static int ppc_pending_interrupt_legacy(CPUPPCState *env)
 static int ppc_pending_interrupt(CPUPPCState *env)
 {
     switch (env->excp_model) {
+    case POWERPC_EXCP_POWER8:
+        return ppc_pending_interrupt_p8(env);
     case POWERPC_EXCP_POWER9:
     case POWERPC_EXCP_POWER10:
         return ppc_pending_interrupt_p9(env);
-- 
2.25.1


