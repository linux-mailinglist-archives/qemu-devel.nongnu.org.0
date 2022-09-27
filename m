Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C335ECE5D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 22:25:19 +0200 (CEST)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odH8m-0003co-VF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 16:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH0K-0008Iz-JL; Tue, 27 Sep 2022 16:16:48 -0400
Received: from [200.168.210.66] (port=41766 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH0H-0002mj-Uv; Tue, 27 Sep 2022 16:16:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 27 Sep 2022 17:15:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 45CCF800026;
 Tue, 27 Sep 2022 17:15:58 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH v2 03/29] target/ppc: split interrupt masking and delivery
 from ppc_hw_interrupt
Date: Tue, 27 Sep 2022 17:15:18 -0300
Message-Id: <20220927201544.4088567-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Sep 2022 20:15:58.0609 (UTC)
 FILETIME=[F4D34010:01D8D2AD]
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

Split ppc_hw_interrupt into an interrupt masking method,
ppc_next_unmasked_interrupt, and an interrupt processing method,
ppc_deliver_interrupt.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
  - ppc_hw_interrupt renamed as ppc_deliver_interrupt (farosas);
  - Handle the "Wakeup from PM state but interrupt Undelivered" case
    as an assert in ppc_deliver_interrupt (farosas).
---
 target/ppc/excp_helper.c | 207 +++++++++++++++++++++++++--------------
 1 file changed, 131 insertions(+), 76 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c3c30c5d1b..c6381489b6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1678,29 +1678,22 @@ void ppc_cpu_do_interrupt(CPUState *cs)
     powerpc_excp(cpu, cs->exception_index);
 }
 
-static void ppc_hw_interrupt(CPUPPCState *env)
+static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 {
-    PowerPCCPU *cpu = env_archcpu(env);
     bool async_deliver;
 
     /* External reset */
     if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
-        powerpc_excp(cpu, POWERPC_EXCP_RESET);
-        return;
+        return PPC_INTERRUPT_RESET;
     }
     /* Machine check exception */
     if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
-        env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
-        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
-        return;
+        return PPC_INTERRUPT_MCK;
     }
 #if 0 /* TODO */
     /* External debug exception */
     if (env->pending_interrupts & PPC_INTERRUPT_DEBUG) {
-        env->pending_interrupts &= ~PPC_INTERRUPT_DEBUG;
-        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
-        return;
+        return PPC_INTERRUPT_DEBUG;
     }
 #endif
 
@@ -1718,9 +1711,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
         if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
             /* HDEC clears on delivery */
-            env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
-            powerpc_excp(cpu, POWERPC_EXCP_HDECR);
-            return;
+            return PPC_INTERRUPT_HDECR;
         }
     }
 
@@ -1729,8 +1720,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
         if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
-            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
-            return;
+            return PPC_INTERRUPT_HVIRT;
         }
     }
 
@@ -1742,77 +1732,47 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
             !FIELD_EX64(env->msr, MSR, PR))) ||
             (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
-            if (books_vhyp_promotes_external_to_hvirt(cpu)) {
-                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
-            } else {
-                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
-            }
-            return;
+            return PPC_INTERRUPT_EXT;
         }
     }
     if (FIELD_EX64(env->msr, MSR, CE)) {
         /* External critical interrupt */
         if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
-            powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
-            return;
+            return PPC_INTERRUPT_CEXT;
         }
     }
     if (async_deliver != 0) {
         /* Watchdog timer on embedded PowerPC */
         if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
-            powerpc_excp(cpu, POWERPC_EXCP_WDT);
-            return;
+            return PPC_INTERRUPT_WDT;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
-            powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
-            return;
+            return PPC_INTERRUPT_CDOORBELL;
         }
         /* Fixed interval timer on embedded PowerPC */
         if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
-            powerpc_excp(cpu, POWERPC_EXCP_FIT);
-            return;
+            return PPC_INTERRUPT_FIT;
         }
         /* Programmable interval timer on embedded PowerPC */
         if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
-            powerpc_excp(cpu, POWERPC_EXCP_PIT);
-            return;
+            return PPC_INTERRUPT_PIT;
         }
         /* Decrementer exception */
         if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
-            if (ppc_decr_clear_on_delivery(env)) {
-                env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
-            }
-            powerpc_excp(cpu, POWERPC_EXCP_DECR);
-            return;
+            return PPC_INTERRUPT_DECR;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
-            if (is_book3s_arch2x(env)) {
-                powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
-            } else {
-                powerpc_excp(cpu, POWERPC_EXCP_DOORI);
-            }
-            return;
+            return PPC_INTERRUPT_DOORBELL;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
-            powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
-            return;
+            return PPC_INTERRUPT_HDOORBELL;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
-            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
-            return;
+            return PPC_INTERRUPT_PERFM;
         }
         /* Thermal interrupt */
         if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
-            powerpc_excp(cpu, POWERPC_EXCP_THERM);
-            return;
+            return PPC_INTERRUPT_THERM;
         }
         /* EBB exception */
         if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
@@ -1822,20 +1782,106 @@ static void ppc_hw_interrupt(CPUPPCState *env)
              */
             if (FIELD_EX64(env->msr, MSR, PR) &&
                 (env->spr[SPR_BESCR] & BESCR_GE)) {
-                env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
-
-                if (env->spr[SPR_BESCR] & BESCR_PMEO) {
-                    powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
-                } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
-                    powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
-                }
-
-                return;
+                return PPC_INTERRUPT_EBB;
             }
         }
     }
 
-    if (env->resume_as_sreset) {
+    return 0;
+}
+
+static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+
+    switch (interrupt) {
+    case PPC_INTERRUPT_RESET: /* External reset */
+        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
+        powerpc_excp(cpu, POWERPC_EXCP_RESET);
+        break;
+    case PPC_INTERRUPT_MCK: /* Machine check exception */
+        env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
+        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
+        break;
+#if 0 /* TODO */
+    case PPC_INTERRUPT_DEBUG: /* External debug exception */
+        env->pending_interrupts &= ~PPC_INTERRUPT_DEBUG;
+        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
+        break;
+#endif
+
+    case PPC_INTERRUPT_HDECR: /* Hypervisor decrementer exception */
+        /* HDEC clears on delivery */
+        env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
+        powerpc_excp(cpu, POWERPC_EXCP_HDECR);
+        break;
+    case PPC_INTERRUPT_HVIRT: /* Hypervisor virtualization interrupt */
+        powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+        break;
+
+    case PPC_INTERRUPT_EXT:
+        if (books_vhyp_promotes_external_to_hvirt(cpu)) {
+            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+        } else {
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+        }
+        break;
+    case PPC_INTERRUPT_CEXT: /* External critical interrupt */
+        powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
+        break;
+
+    case PPC_INTERRUPT_WDT: /* Watchdog timer on embedded PowerPC */
+        env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
+        powerpc_excp(cpu, POWERPC_EXCP_WDT);
+        break;
+    case PPC_INTERRUPT_CDOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
+        powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
+        break;
+    case PPC_INTERRUPT_FIT: /* Fixed interval timer on embedded PowerPC */
+        env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
+        powerpc_excp(cpu, POWERPC_EXCP_FIT);
+        break;
+    case PPC_INTERRUPT_PIT: /* Programmable interval timer on embedded PowerPC */
+        env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
+        powerpc_excp(cpu, POWERPC_EXCP_PIT);
+        break;
+    case PPC_INTERRUPT_DECR: /* Decrementer exception */
+        if (ppc_decr_clear_on_delivery(env)) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
+        }
+        powerpc_excp(cpu, POWERPC_EXCP_DECR);
+        break;
+    case PPC_INTERRUPT_DOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
+        if (is_book3s_arch2x(env)) {
+            powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
+        } else {
+            powerpc_excp(cpu, POWERPC_EXCP_DOORI);
+        }
+        break;
+    case PPC_INTERRUPT_HDOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
+        powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
+        break;
+    case PPC_INTERRUPT_PERFM:
+        env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
+        powerpc_excp(cpu, POWERPC_EXCP_PERFM);
+        break;
+    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
+        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
+        powerpc_excp(cpu, POWERPC_EXCP_THERM);
+        break;
+    case PPC_INTERRUPT_EBB: /* EBB exception */
+        env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
+        if (env->spr[SPR_BESCR] & BESCR_PMEO) {
+            powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
+        } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
+        }
+        break;
+    case 0:
         /*
          * This is a bug ! It means that has_work took us out of halt without
          * anything to deliver while in a PM state that requires getting
@@ -1847,8 +1893,10 @@ static void ppc_hw_interrupt(CPUPPCState *env)
          * It generally means a discrepancy between the wakeup conditions in the
          * processor has_work implementation and the logic in this function.
          */
-        cpu_abort(env_cpu(env),
-                  "Wakeup from PM state but interrupt Undelivered");
+        assert(env->resume_as_sreset != 0);
+        break;
+    default:
+        cpu_abort(cs, "Invalid PowerPC interrupt %d. Aborting\n", interrupt);
     }
 }
 
@@ -1884,15 +1932,22 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    int interrupt;
 
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        ppc_hw_interrupt(env);
-        if (env->pending_interrupts == 0) {
-            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
-        }
-        return true;
+    if ((interrupt_request & CPU_INTERRUPT_HARD) == 0) {
+        return false;
     }
-    return false;
+
+    interrupt = ppc_next_unmasked_interrupt(env);
+    if (interrupt == 0) {
+        return false;
+    }
+
+    ppc_deliver_interrupt(env, interrupt);
+    if (env->pending_interrupts == 0) {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+    return true;
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


