Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD95ECEF4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 22:50:35 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odHXH-0002Im-1h
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH2Q-0002H1-D5; Tue, 27 Sep 2022 16:18:44 -0400
Received: from [200.168.210.66] (port=34649 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH2O-000305-PV; Tue, 27 Sep 2022 16:18:42 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 27 Sep 2022 17:16:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id DC52E800026;
 Tue, 27 Sep 2022 17:15:59 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH v2 18/29] target/ppc: add power-saving interrupt masking
 logic to p8_next_unmasked_interrupt
Date: Tue, 27 Sep 2022 17:15:33 -0300
Message-Id: <20220927201544.4088567-19-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Sep 2022 20:16:00.0187 (UTC)
 FILETIME=[F5C408B0:01D8D2AD]
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

Export p8_interrupt_powersave and use it in p8_next_unmasked_interrupt.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 24 ++++++++++++------------
 target/ppc/internal.h    |  1 +
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 59e4c325c5..319d2355ec 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6133,7 +6133,7 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
-static int p8_interrupt_powersave(CPUPPCState *env)
+int p8_interrupt_powersave(CPUPPCState *env)
 {
     if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
         (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2e8d4699a9..609579f45f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1687,28 +1687,28 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 
 static int p8_next_unmasked_interrupt(CPUPPCState *env)
 {
-    bool async_deliver;
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = CPU(cpu);
+    /* Ignore MSR[EE] when coming out of some power management states */
+    bool msr_ee = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
 
     assert((env->pending_interrupts & P8_UNUSED_INTERRUPTS) == 0);
 
+    if (cs->halted) {
+        /* LPCR[PECE] controls which interrupts can exit power-saving mode */
+        return p8_interrupt_powersave(env);
+    }
+
     /* Machine check exception */
     if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
         return PPC_INTERRUPT_MCK;
     }
 
-    /*
-     * For interrupts that gate on MSR:EE, we need to do something a
-     * bit more subtle, as we need to let them through even when EE is
-     * clear when coming out of some power management states (in order
-     * for them to become a 0x100).
-     */
-    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
-
     /* Hypervisor decrementer exception */
     if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
         /* LPCR will be clear when not supported so this will work */
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
-        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
+        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hdice) {
             /* HDEC clears on delivery */
             return PPC_INTERRUPT_HDECR;
         }
@@ -1719,13 +1719,13 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
         /* HEIC blocks delivery to the hypervisor */
-        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
+        if ((msr_ee && !(heic && FIELD_EX64_HV(env->msr) &&
             !FIELD_EX64(env->msr, MSR, PR))) ||
             (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
             return PPC_INTERRUPT_EXT;
         }
     }
-    if (async_deliver != 0) {
+    if (msr_ee != 0) {
         /* Decrementer exception */
         if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
             return PPC_INTERRUPT_DECR;
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 41e79adfdb..9069874adb 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -308,6 +308,7 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
 
 #if defined(TARGET_PPC64)
 int p9_interrupt_powersave(CPUPPCState *env);
+int p8_interrupt_powersave(CPUPPCState *env);
 #endif
 
 #endif /* PPC_INTERNAL_H */
-- 
2.25.1


