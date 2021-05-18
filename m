Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8076387C77
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:28:50 +0200 (CEST)
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1eL-0006Qq-TD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1JO-0005AN-Vv; Tue, 18 May 2021 11:07:11 -0400
Received: from [201.28.113.2] (port=38818 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1JJ-00087L-Ec; Tue, 18 May 2021 11:07:10 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 18 May 2021 12:05:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 93B0F801362;
 Tue, 18 May 2021 12:05:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] target/ppc: moved ppc_cpu_do_interrupt to cpu.c
Date: Tue, 18 May 2021 12:05:14 -0300
Message-Id: <20210518150515.57983-7-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 18 May 2021 15:05:39.0773 (UTC)
 FILETIME=[43D496D0:01D74BF7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moved the ppc_cpu_do_interrupt function to cpu.c file, where it makes
more sense, and turned powerpc_excp not static, as it now needs to be
accessed from outside of excp_helper.c

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu.c         | 20 ++++++++++++++++++++
 target/ppc/cpu.h         |  1 +
 target/ppc/excp_helper.c | 19 +------------------
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index a00ff2d5a3..eb4b705089 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -152,3 +152,23 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
         fpscr_set_rounding_mode(env);
     }
 }
+
+/* Exception processing */
+#if defined(CONFIG_USER_ONLY)
+void ppc_cpu_do_interrupt(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
+    cs->exception_index = POWERPC_EXCP_NONE;
+    env->error_code = 0;
+}
+#else
+void ppc_cpu_do_interrupt(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+
+    powerpc_excp(cpu, env->excp_model, cs->exception_index);
+}
+#endif
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b9eb2690cf..01dac2b12d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1258,6 +1258,7 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
 #endif /* CONFIG_USER_ONLY */
 
 void ppc_cpu_do_interrupt(CPUState *cpu);
+void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void ppc_cpu_dump_statistics(CPUState *cpu, int flags);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f4f15279eb..80bb6e70e9 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -38,15 +38,6 @@
 /*****************************************************************************/
 /* Exception processing */
 #if defined(CONFIG_USER_ONLY)
-void ppc_cpu_do_interrupt(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
-}
-
 static void ppc_hw_interrupt(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -324,7 +315,7 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
  */
-static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
+inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -968,14 +959,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 
-void ppc_cpu_do_interrupt(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    powerpc_excp(cpu, env->excp_model, cs->exception_index);
-}
-
 static void ppc_hw_interrupt(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
-- 
2.17.1


