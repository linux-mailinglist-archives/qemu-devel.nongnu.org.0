Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F6038E83E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:02:43 +0200 (CEST)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBAI-0005Kb-PT
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llB78-0003Bg-6B; Mon, 24 May 2021 09:59:26 -0400
Received: from [201.28.113.2] (port=6892 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llB76-000159-NI; Mon, 24 May 2021 09:59:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 24 May 2021 10:59:18 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id EEF0D80144E;
 Mon, 24 May 2021 10:59:17 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] target/ppc: moved ppc_cpu_do_interrupt to cpu.c
Date: Mon, 24 May 2021 10:59:04 -0300
Message-Id: <20210524135908.47505-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
References: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 24 May 2021 13:59:18.0106 (UTC)
 FILETIME=[FD0CEBA0:01D750A4]
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
index 19d67b5b07..95898f348b 100644
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
index 203f07e48e..65a08cc424 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1254,6 +1254,7 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
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


