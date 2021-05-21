Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553E38CEFC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 22:21:35 +0200 (CEST)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkBeH-0008ME-AT
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 16:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBbO-0005yv-TP; Fri, 21 May 2021 16:18:34 -0400
Received: from [201.28.113.2] (port=1319 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBbN-0001Nf-Eb; Fri, 21 May 2021 16:18:34 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 21 May 2021 17:18:19 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 3FE148013E3;
 Fri, 21 May 2021 17:18:19 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] target/ppc: moved ppc_store_lpcr and ppc_store_msr to
 cpu.c
Date: Fri, 21 May 2021 17:17:52 -0300
Message-Id: <20210521201759.85475-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 May 2021 20:18:19.0385 (UTC)
 FILETIME=[70AB7690:01D74E7E]
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

These functions are used in hw/ppc logic, during machine startup, which
means it must be compiled when --disable-tcg is selected, and so it has
been moved into a common code file

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.c         | 17 +++++++++++++++++
 target/ppc/misc_helper.c | 16 ----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 9cf3288b7a..c8e87e30f1 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -24,6 +24,7 @@
 #include "exec/log.h"
 #include "fpu/softfloat-helpers.h"
 #include "mmu-hash64.h"
+#include "helper_regs.h"
 
 target_ulong cpu_read_xer(CPUPPCState *env)
 {
@@ -92,3 +93,19 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
     env->spr[SPR_SDR1] = value;
 }
 #endif /* CONFIG_SOFTMMU */
+
+/* GDBstub can read and write MSR... */
+void ppc_store_msr(CPUPPCState *env, target_ulong value)
+{
+    hreg_store_msr(env, value, 0);
+}
+
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+
+    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
+    /* The gtse bit affects hflags */
+    hreg_compute_hflags(env);
+}
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 08a31da289..442b12652c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -255,22 +255,6 @@ target_ulong helper_clcs(CPUPPCState *env, uint32_t arg)
 /*****************************************************************************/
 /* Special registers manipulation */
 
-/* GDBstub can read and write MSR... */
-void ppc_store_msr(CPUPPCState *env, target_ulong value)
-{
-    hreg_store_msr(env, value, 0);
-}
-
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env = &cpu->env;
-
-    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
-    /* The gtse bit affects hflags */
-    hreg_compute_hflags(env);
-}
-
 /*
  * This code is lifted from MacOnLinux. It is called whenever THRM1,2
  * or 3 is read an fixes up the values in such a way that will make
-- 
2.17.1


