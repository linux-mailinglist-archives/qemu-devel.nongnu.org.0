Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B04E5ECED1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 22:41:18 +0200 (CEST)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odHOE-0001Se-GC
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 16:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH28-0001uM-Us; Tue, 27 Sep 2022 16:18:24 -0400
Received: from [200.168.210.66] (port=34649 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH27-000305-0P; Tue, 27 Sep 2022 16:18:24 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 27 Sep 2022 17:15:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3C6D5800026;
 Tue, 27 Sep 2022 17:15:59 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH v2 12/29] target/ppc: create an interrupt masking method
 for POWER8
Date: Tue, 27 Sep 2022 17:15:27 -0300
Message-Id: <20220927201544.4088567-13-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Sep 2022 20:15:59.0531 (UTC)
 FILETIME=[F55FEFB0:01D8D2AD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The new method is identical to ppc_next_unmasked_interrupt_generic,
processor-specific code will be added/removed in the following patches.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
  - Renamed the method from ppc_pending_interrupt_p8 to
    p8_next_unmasked_interrupt
  - Processor-specific stuff were moved to the following patches to ease
    review.
---
 target/ppc/excp_helper.c | 114 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5a0d2c11a2..f60d9826d8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1679,6 +1679,118 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 }
 
 #if defined(TARGET_PPC64)
+static int p8_next_unmasked_interrupt(CPUPPCState *env)
+{
+    bool async_deliver;
+
+    /* External reset */
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    /* Machine check exception */
+    if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
+        return PPC_INTERRUPT_MCK;
+    }
+#if 0 /* TODO */
+    /* External debug exception */
+    if (env->pending_interrupts & PPC_INTERRUPT_DEBUG) {
+        return PPC_INTERRUPT_DEBUG;
+    }
+#endif
+
+    /*
+     * For interrupts that gate on MSR:EE, we need to do something a
+     * bit more subtle, as we need to let them through even when EE is
+     * clear when coming out of some power management states (in order
+     * for them to become a 0x100).
+     */
+    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
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
 #define P9_UNUSED_INTERRUPTS \
     (PPC_INTERRUPT_RESET | PPC_INTERRUPT_DEBUG | PPC_INTERRUPT_CEXT |   \
      PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL | PPC_INTERRUPT_FIT |  \
@@ -1891,6 +2003,8 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 {
     switch (env->excp_model) {
 #if defined(TARGET_PPC64)
+    case POWERPC_EXCP_POWER8:
+        return p8_next_unmasked_interrupt(env);
     case POWERPC_EXCP_POWER9:
     case POWERPC_EXCP_POWER10:
         return p9_next_unmasked_interrupt(env);
-- 
2.25.1


