Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF7593396
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:54:49 +0200 (CEST)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNdMV-0002aG-Ql
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrV-0000MJ-Sk; Mon, 15 Aug 2022 12:22:49 -0400
Received: from [200.168.210.66] (port=4179 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrT-0005wd-WC; Mon, 15 Aug 2022 12:22:45 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Aug 2022 13:20:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id AEE8980046B;
 Mon, 15 Aug 2022 13:20:45 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH 13/13] target/ppc: unify cpu->has_work based on
 cs->interrupt_request
Date: Mon, 15 Aug 2022 13:20:19 -0300
Message-Id: <20220815162020.2420093-14-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Aug 2022 16:20:45.0969 (UTC)
 FILETIME=[F9460810:01D8B0C2]
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

Now that cs->interrupt_request indicates if there is any unmasked
interrupt, checking if the CPU has work to do can be simplified to a
single check that works for all CPU models.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu_init.c | 212 +-----------------------------------------
 1 file changed, 1 insertion(+), 211 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 850334545a..303e81596d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5923,46 +5923,10 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
-static bool cpu_has_work_POWER7(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER7";
     dc->desc = "POWER7";
@@ -5971,7 +5935,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6087,54 +6050,10 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
-static bool cpu_has_work_POWER8(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER8";
     dc->desc = "POWER8";
@@ -6143,7 +6062,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6290,71 +6208,10 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
-static bool cpu_has_work_POWER9(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        uint64_t psscr = env->spr[SPR_PSSCR];
-
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-
-        /* If EC is clear, just return true on any pending interrupt */
-        if (!(psscr & PSSCR_EC)) {
-            return true;
-        }
-        /* External Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_EEE)) {
-            bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !FIELD_EX64_HV(env->msr) ||
-                FIELD_EX64(env->msr, MSR, PR)) {
-                return true;
-            }
-        }
-        /* Decrementer Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_DEE)) {
-            return true;
-        }
-        /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUPT_HMI))
-            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
-            return true;
-        }
-        /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-            return true;
-        }
-        /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-            return true;
-        }
-        /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
-            (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER9";
     dc->desc = "POWER9";
@@ -6364,7 +6221,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6507,71 +6363,10 @@ static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
-static bool cpu_has_work_POWER10(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        uint64_t psscr = env->spr[SPR_PSSCR];
-
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-
-        /* If EC is clear, just return true on any pending interrupt */
-        if (!(psscr & PSSCR_EC)) {
-            return true;
-        }
-        /* External Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_EEE)) {
-            bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !FIELD_EX64_HV(env->msr) ||
-                FIELD_EX64(env->msr, MSR, PR)) {
-                return true;
-            }
-        }
-        /* Decrementer Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_DEE)) {
-            return true;
-        }
-        /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUPT_HMI))
-            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
-            return true;
-        }
-        /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-            return true;
-        }
-        /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-            return true;
-        }
-        /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
-            (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER10";
     dc->desc = "POWER10";
@@ -6582,7 +6377,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7139,11 +6933,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool ppc_cpu_has_work(CPUState *cs)
 {
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    return FIELD_EX64(env->msr, MSR, EE) &&
-           (cs->interrupt_request & CPU_INTERRUPT_HARD);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void ppc_cpu_reset(DeviceState *dev)
-- 
2.25.1


