Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8825607986
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:25:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsxI-00055k-NJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:25:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsx8-0006uk-Co
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olswh-0002GR-WB; Fri, 21 Oct 2022 10:24:24 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olswe-0004cV-OM; Fri, 21 Oct 2022 10:24:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 11:21:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C3EF58001F1;
 Fri, 21 Oct 2022 11:21:58 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v4 2/3] target/ppc: unify cpu->has_work based on
 cs->interrupt_request
Date: Fri, 21 Oct 2022 11:21:55 -0300
Message-Id: <20221021142156.4134411-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
References: <20221021142156.4134411-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2022 14:21:59.0112 (UTC)
 FILETIME=[7B033480:01D8E558]
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

Now that cs->interrupt_request indicates if there is any unmasked
interrupt, checking if the CPU has work to do can be simplified to a
single check that works for all CPU models.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu_init.c | 94 +------------------------------------------
 1 file changed, 1 insertion(+), 93 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0adc866485..15d549ad38 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5984,27 +5984,10 @@ int p7_interrupt_powersave(CPUPPCState *env)
     return 0;
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
-        return p7_interrupt_powersave(env) != 0;
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
@@ -6013,7 +5996,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6170,27 +6152,10 @@ int p8_interrupt_powersave(CPUPPCState *env)
     return 0;
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
-        return p8_interrupt_powersave(env) != 0;
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
@@ -6199,7 +6164,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6407,35 +6371,10 @@ int p9_interrupt_powersave(CPUPPCState *env)
     return 0;
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
-
-        return p9_interrupt_powersave(env) != 0;
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
@@ -6445,7 +6384,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6604,35 +6542,10 @@ static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
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
-
-        return p9_interrupt_powersave(env) != 0;
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
@@ -6643,7 +6556,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7207,11 +7119,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
 
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


