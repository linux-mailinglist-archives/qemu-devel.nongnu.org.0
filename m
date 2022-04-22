Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B670C50C039
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:19:38 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyob-0007rN-QR
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySA-0004SV-2U; Fri, 22 Apr 2022 14:56:26 -0400
Received: from [187.72.171.209] (port=10601 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyS8-0000Zc-AH; Fri, 22 Apr 2022 14:56:25 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 59E5080060F;
 Fri, 22 Apr 2022 15:54:54 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 07/20] target/ppc: Substitute msr_ee macro with new M_MSR_EE
 macro
Date: Fri, 22 Apr 2022 15:54:37 -0300
Message-Id: <20220422185450.107256-8-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:54.0624 (UTC)
 FILETIME=[74658A00:01D8567A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/cpu_init.c    | 15 ++++++++++-----
 target/ppc/excp_helper.c |  2 +-
 target/ppc/kvm.c         |  3 ++-
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 95c28c3c1b..bfde66ed66 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 #define M_MSR_ILE (1ull << MSR_ILE)
+#define M_MSR_EE (1ull << MSR_EE)
 #define M_MSR_PR (1ull << MSR_PR)
 #define M_MSR_DS (1ull << MSR_DS)
 #define M_MSR_LE (1ull << MSR_LE)
@@ -477,7 +478,6 @@ typedef enum {
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
 #define msr_ce   ((env->msr >> MSR_CE)   & 1)
-#define msr_ee   ((env->msr >> MSR_EE)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9dddc0e8f6..4d949ab1f1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5949,7 +5949,8 @@ static bool cpu_has_work_POWER7(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return (env->msr & M_MSR_EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -6120,7 +6121,8 @@ static bool cpu_has_work_POWER8(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return (env->msr & M_MSR_EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -6337,7 +6339,8 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return (env->msr & M_MSR_EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -6551,7 +6554,8 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         }
         return false;
     } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+        return (env->msr & M_MSR_EE) &&
+               (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
 
@@ -7119,7 +7123,8 @@ static bool ppc_cpu_has_work(CPUState *cs)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
 
-    return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
+    return (env->msr & M_MSR_EE) &&
+           (cs->interrupt_request & CPU_INTERRUPT_HARD);
 }
 
 static void ppc_cpu_reset(DeviceState *dev)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 10cd381be2..39d1c2a543 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1709,7 +1709,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
      * clear when coming out of some power management states (in order
      * for them to become a 0x100).
      */
-    async_deliver = (msr_ee != 0) || env->resume_as_sreset;
+    async_deliver = (env->msr & M_MSR_EE) || env->resume_as_sreset;
 
     /* Hypervisor decrementer exception */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDECR)) {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index a3c31b4e48..1ca18f21b2 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1351,7 +1351,8 @@ static int kvmppc_handle_halt(PowerPCCPU *cpu)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD) && (msr_ee)) {
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+        (env->msr & M_MSR_EE)) {
         cs->halted = 1;
         cs->exception_index = EXCP_HLT;
     }
-- 
2.25.1


