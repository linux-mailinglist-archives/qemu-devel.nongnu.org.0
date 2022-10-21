Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15570607985
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:25:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsxG-0005df-4G
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:24:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsx9-00075M-3d
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olswm-000346-Lf; Fri, 21 Oct 2022 10:24:29 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olswj-0004cV-4T; Fri, 21 Oct 2022 10:24:28 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 11:21:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E60B780020E;
 Fri, 21 Oct 2022 11:21:58 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v4 3/3] target/ppc: move the p*_interrupt_powersave methods to
 excp_helper.c
Date: Fri, 21 Oct 2022 11:21:56 -0300
Message-Id: <20221021142156.4134411-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
References: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2022 14:21:59.0252 (UTC)
 FILETIME=[7B189140:01D8E558]
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

Move the methods to excp_helper.c and make them static.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu_init.c    | 102 ---------------------------------------
 target/ppc/excp_helper.c | 102 +++++++++++++++++++++++++++++++++++++++
 target/ppc/internal.h    |   6 ---
 3 files changed, 102 insertions(+), 108 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 15d549ad38..6f3539f13a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5960,30 +5960,6 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
-int p7_interrupt_powersave(CPUPPCState *env)
-{
-    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
-        return PPC_INTERRUPT_EXT;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
-        return PPC_INTERRUPT_DECR;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-        return PPC_INTERRUPT_MCK;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-        return PPC_INTERRUPT_HMI;
-    }
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
-    return 0;
-}
-
 POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -6120,38 +6096,6 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
-int p8_interrupt_powersave(CPUPPCState *env)
-{
-    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
-        return PPC_INTERRUPT_EXT;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
-        return PPC_INTERRUPT_DECR;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-        return PPC_INTERRUPT_MCK;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-        return PPC_INTERRUPT_HMI;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
-        return PPC_INTERRUPT_DOORBELL;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
-        return PPC_INTERRUPT_HDOORBELL;
-    }
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
-    return 0;
-}
-
 POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -6325,52 +6269,6 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return false;
 }
 
-int p9_interrupt_powersave(CPUPPCState *env)
-{
-    /* External Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-        (env->spr[SPR_LPCR] & LPCR_EEE)) {
-        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-        if (!heic || !FIELD_EX64_HV(env->msr) ||
-            FIELD_EX64(env->msr, MSR, PR)) {
-            return PPC_INTERRUPT_EXT;
-        }
-    }
-    /* Decrementer Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-        (env->spr[SPR_LPCR] & LPCR_DEE)) {
-        return PPC_INTERRUPT_DECR;
-    }
-    /* Machine Check or Hypervisor Maintenance Exception */
-    if (env->spr[SPR_LPCR] & LPCR_OEE) {
-        if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
-            return PPC_INTERRUPT_MCK;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
-            return PPC_INTERRUPT_HMI;
-        }
-    }
-    /* Privileged Doorbell Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-        return PPC_INTERRUPT_DOORBELL;
-    }
-    /* Hypervisor Doorbell Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-        return PPC_INTERRUPT_HDOORBELL;
-    }
-    /* Hypervisor virtualization exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
-        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-        return PPC_INTERRUPT_HVIRT;
-    }
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
-    return 0;
-}
-
 POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 8b67053728..abe2669d8e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1692,6 +1692,30 @@ void ppc_cpu_do_interrupt(CPUState *cs)
      PPC_INTERRUPT_PIT | PPC_INTERRUPT_DOORBELL | PPC_INTERRUPT_HDOORBELL | \
      PPC_INTERRUPT_THERM | PPC_INTERRUPT_EBB)
 
+static int p7_interrupt_powersave(CPUPPCState *env)
+{
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
+        return PPC_INTERRUPT_EXT;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return PPC_INTERRUPT_MCK;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return PPC_INTERRUPT_HMI;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static int p7_next_unmasked_interrupt(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -1756,6 +1780,38 @@ static int p7_next_unmasked_interrupt(CPUPPCState *env)
     PPC_INTERRUPT_CEXT | PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL |  \
     PPC_INTERRUPT_FIT | PPC_INTERRUPT_PIT | PPC_INTERRUPT_THERM)
 
+static int p8_interrupt_powersave(CPUPPCState *env)
+{
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
+        return PPC_INTERRUPT_EXT;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return PPC_INTERRUPT_MCK;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return PPC_INTERRUPT_HMI;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
+        return PPC_INTERRUPT_DOORBELL;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
+        return PPC_INTERRUPT_HDOORBELL;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static int p8_next_unmasked_interrupt(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -1831,6 +1887,52 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
      PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL | PPC_INTERRUPT_FIT |  \
      PPC_INTERRUPT_PIT | PPC_INTERRUPT_THERM)
 
+static int p9_interrupt_powersave(CPUPPCState *env)
+{
+    /* External Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_EEE)) {
+        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
+        if (!heic || !FIELD_EX64_HV(env->msr) ||
+            FIELD_EX64(env->msr, MSR, PR)) {
+            return PPC_INTERRUPT_EXT;
+        }
+    }
+    /* Decrementer Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_DEE)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    /* Machine Check or Hypervisor Maintenance Exception */
+    if (env->spr[SPR_LPCR] & LPCR_OEE) {
+        if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
+            return PPC_INTERRUPT_MCK;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
+            return PPC_INTERRUPT_HMI;
+        }
+    }
+    /* Privileged Doorbell Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
+        return PPC_INTERRUPT_DOORBELL;
+    }
+    /* Hypervisor Doorbell Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
+        return PPC_INTERRUPT_HDOORBELL;
+    }
+    /* Hypervisor virtualization exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
+        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
+        return PPC_INTERRUPT_HVIRT;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static int p9_next_unmasked_interrupt(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 25827ebf6f..337a362205 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -306,10 +306,4 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
     return msk;
 }
 
-#if defined(TARGET_PPC64)
-int p9_interrupt_powersave(CPUPPCState *env);
-int p8_interrupt_powersave(CPUPPCState *env);
-int p7_interrupt_powersave(CPUPPCState *env);
-#endif
-
 #endif /* PPC_INTERNAL_H */
-- 
2.25.1


