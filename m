Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E380391A71
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:38:14 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llufl-00017Z-3w
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lludJ-0008IQ-Gd; Wed, 26 May 2021 10:35:42 -0400
Received: from [201.28.113.2] (port=57152 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lludH-0004YG-F2; Wed, 26 May 2021 10:35:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 11:35:33 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 9C5368013CA;
 Wed, 26 May 2021 11:35:33 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: fold ppc_store_ptcr into it's only caller
Date: Wed, 26 May 2021 11:35:16 -0300
Message-Id: <20210526143516.125582-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 26 May 2021 14:35:33.0812 (UTC)
 FILETIME=[62B2CF40:01D7523C]
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
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ppc_store_ptcr, defined in mmu_helper.c, was only used by
helper_store_ptcr, in misc_helper.c. To avoid possible confusion,
the function was folded into the helper.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu.h         |  1 -
 target/ppc/misc_helper.c | 24 +++++++++++++++++++++++-
 target/ppc/mmu_helper.c  | 28 ----------------------------
 3 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 203f07e48e..f39f5e0fff 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1290,7 +1290,6 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #if !defined(CONFIG_USER_ONLY)
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
-void ppc_store_ptcr(CPUPPCState *env, target_ulong value);
 #endif /* !defined(CONFIG_USER_ONLY) */
 void ppc_store_msr(CPUPPCState *env, target_ulong value);
 void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 442b12652c..c33f5f39b9 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "mmu-book3s-v3.h"
 
 #include "helper_regs.h"
 
@@ -116,7 +117,28 @@ void helper_store_sdr1(CPUPPCState *env, target_ulong val)
 void helper_store_ptcr(CPUPPCState *env, target_ulong val)
 {
     if (env->spr[SPR_PTCR] != val) {
-        ppc_store_ptcr(env, val);
+        PowerPCCPU *cpu = env_archcpu(env);
+        target_ulong ptcr_mask = PTCR_PATB | PTCR_PATS;
+        target_ulong patbsize = val & PTCR_PATS;
+
+        qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, val);
+
+        assert(!cpu->vhyp);
+        assert(env->mmu_model & POWERPC_MMU_3_00);
+
+        if (val & ~ptcr_mask) {
+            error_report("Invalid bits 0x"TARGET_FMT_lx" set in PTCR",
+                         val & ~ptcr_mask);
+            val &= ptcr_mask;
+        }
+
+        if (patbsize > 24) {
+            error_report("Invalid Partition Table size 0x" TARGET_FMT_lx
+                         " stored in PTCR", patbsize);
+            return;
+        }
+
+        env->spr[SPR_PTCR] = val;
         tlb_flush(env_cpu(env));
     }
 }
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 5395e5ee5a..d45936be49 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1987,34 +1987,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 
 /*****************************************************************************/
 /* Special registers manipulation */
-#if defined(TARGET_PPC64)
-void ppc_store_ptcr(CPUPPCState *env, target_ulong value)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    target_ulong ptcr_mask = PTCR_PATB | PTCR_PATS;
-    target_ulong patbsize = value & PTCR_PATS;
-
-    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
-
-    assert(!cpu->vhyp);
-    assert(env->mmu_model & POWERPC_MMU_3_00);
-
-    if (value & ~ptcr_mask) {
-        error_report("Invalid bits 0x"TARGET_FMT_lx" set in PTCR",
-                     value & ~ptcr_mask);
-        value &= ptcr_mask;
-    }
-
-    if (patbsize > 24) {
-        error_report("Invalid Partition Table size 0x" TARGET_FMT_lx
-                     " stored in PTCR", patbsize);
-        return;
-    }
-
-    env->spr[SPR_PTCR] = value;
-}
-
-#endif /* defined(TARGET_PPC64) */
 
 /* Segment registers load and store */
 target_ulong helper_load_sr(CPUPPCState *env, target_ulong sr_num)
-- 
2.17.1


