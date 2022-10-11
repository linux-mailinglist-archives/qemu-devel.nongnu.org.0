Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BD5FBC9C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:05:07 +0200 (CEST)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMR0-0001hk-Im
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMBL-0006rf-JF; Tue, 11 Oct 2022 16:49:02 -0400
Received: from [200.168.210.66] (port=33314 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMBJ-0001Yb-OP; Tue, 11 Oct 2022 16:48:55 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 11 Oct 2022 17:48:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1C8D480077C;
 Tue, 11 Oct 2022 17:48:41 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v3 02/29] target/ppc: always use ppc_set_irq to set
 env->pending_interrupts
Date: Tue, 11 Oct 2022 17:48:02 -0300
Message-Id: <20221011204829.1641124-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Oct 2022 20:48:41.0450 (UTC)
 FILETIME=[D88D84A0:01D8DDB2]
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

Use ppc_set_irq to raise/clear interrupts to ensure CPU_INTERRUPT_HARD
will be set/reset accordingly.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/excp_helper.c | 17 +++++++----------
 target/ppc/misc_helper.c |  9 ++-------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 3f8ff9bcf3..c3c30c5d1b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "internal.h"
 #include "helper_regs.h"
+#include "hw/ppc/ppc.h"
 
 #include "trace.h"
 
@@ -2080,7 +2081,6 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
 static void do_ebb(CPUPPCState *env, int ebb_excp)
 {
     PowerPCCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
 
     /*
      * FSCR_EBB and FSCR_IC_EBB are the same bits used with
@@ -2098,8 +2098,7 @@ static void do_ebb(CPUPPCState *env, int ebb_excp)
     if (FIELD_EX64(env->msr, MSR, PR)) {
         powerpc_excp(cpu, ebb_excp);
     } else {
-        env->pending_interrupts |= PPC_INTERRUPT_EBB;
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        ppc_set_irq(cpu, PPC_INTERRUPT_EBB, 1);
     }
 }
 
@@ -2292,7 +2291,7 @@ void helper_msgclr(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~irq;
+    ppc_set_irq(env_archcpu(env), irq, 0);
 }
 
 void helper_msgsnd(target_ulong rb)
@@ -2311,8 +2310,7 @@ void helper_msgsnd(target_ulong rb)
         CPUPPCState *cenv = &cpu->env;
 
         if ((rb & DBELL_BRDCAST) || (cenv->spr[SPR_BOOKE_PIR] == pir)) {
-            cenv->pending_interrupts |= irq;
-            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+            ppc_set_irq(cpu, irq, 1);
         }
     }
     qemu_mutex_unlock_iothread();
@@ -2336,7 +2334,7 @@ void helper_book3s_msgclr(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
+    ppc_set_irq(env_archcpu(env), PPC_INTERRUPT_HDOORBELL, 0);
 }
 
 static void book3s_msgsnd_common(int pir, int irq)
@@ -2350,8 +2348,7 @@ static void book3s_msgsnd_common(int pir, int irq)
 
         /* TODO: broadcast message to all threads of the same  processor */
         if (cenv->spr_cb[SPR_PIR].default_value == pir) {
-            cenv->pending_interrupts |= irq;
-            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+            ppc_set_irq(cpu, irq, 1);
         }
     }
     qemu_mutex_unlock_iothread();
@@ -2377,7 +2374,7 @@ void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
+    ppc_set_irq(env_archcpu(env), PPC_INTERRUPT_HDOORBELL, 0);
 }
 
 /*
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 05e35572bc..a9bc1522e2 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -25,6 +25,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "mmu-book3s-v3.h"
+#include "hw/ppc/ppc.h"
 
 #include "helper_regs.h"
 
@@ -173,7 +174,6 @@ target_ulong helper_load_dpdes(CPUPPCState *env)
 void helper_store_dpdes(CPUPPCState *env, target_ulong val)
 {
     PowerPCCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
 
     helper_hfscr_facility_check(env, HFSCR_MSGP, "store DPDES", HFSCR_IC_MSGP);
 
@@ -184,12 +184,7 @@ void helper_store_dpdes(CPUPPCState *env, target_ulong val)
         return;
     }
 
-    if (val & 0x1) {
-        env->pending_interrupts |= PPC_INTERRUPT_DOORBELL;
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else {
-        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
-    }
+    ppc_set_irq(cpu, PPC_INTERRUPT_DOORBELL, val & 0x1);
 }
 #endif /* defined(TARGET_PPC64) */
 
-- 
2.25.1


