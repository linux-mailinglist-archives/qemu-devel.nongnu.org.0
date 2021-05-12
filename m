Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380EC37BFBA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:18:29 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpgy-0006gY-7G
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXe-0004GR-Oh; Wed, 12 May 2021 10:08:50 -0400
Received: from [201.28.113.2] (port=48830 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXd-00081F-5C; Wed, 12 May 2021 10:08:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:38 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id C37408000C2;
 Wed, 12 May 2021 11:08:38 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] target/ppc: moved ppc_store_sdr1 to cpu.c
Date: Wed, 12 May 2021 11:08:04 -0300
Message-Id: <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2021 14:08:38.0972 (UTC)
 FILETIME=[4E6547C0:01D74738]
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

Moved this function that is required in !TCG cases into a
common code file

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu.c        | 29 +++++++++++++++++++++++++++++
 target/ppc/mmu_helper.c | 26 --------------------------
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index cb794e9f4f..0ab7ac1af1 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -20,7 +20,10 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "cpu-models.h"
+#include "cpu-qom.h"
+#include "exec/log.h"
 #include "fpu/softfloat-helpers.h"
+#include "mmu-hash64.h"
 
 target_ulong cpu_read_xer(CPUPPCState *env)
 {
@@ -61,3 +64,29 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     uint32_t sat = (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) != 0;
     return env->vscr | (sat << VSCR_SAT);
 }
+
+void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
+    assert(!cpu->vhyp);
+#if defined(TARGET_PPC64)
+    if (mmu_is_64bit(env->mmu_model)) {
+        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
+        target_ulong htabsize = value & SDR_64_HTABSIZE;
+
+        if (value & ~sdr_mask) {
+            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
+                         value & ~sdr_mask);
+            value &= sdr_mask;
+        }
+        if (htabsize > 28) {
+            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in SDR1",
+                         htabsize);
+            return;
+        }
+    }
+#endif /* defined(TARGET_PPC64) */
+    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
+    env->spr[SPR_SDR1] = value;
+}
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ca88658cba..06e1ebdcbc 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2085,32 +2085,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 
 /*****************************************************************************/
 /* Special registers manipulation */
-void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
-    assert(!cpu->vhyp);
-#if defined(TARGET_PPC64)
-    if (mmu_is_64bit(env->mmu_model)) {
-        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
-        target_ulong htabsize = value & SDR_64_HTABSIZE;
-
-        if (value & ~sdr_mask) {
-            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
-                         value & ~sdr_mask);
-            value &= sdr_mask;
-        }
-        if (htabsize > 28) {
-            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in SDR1",
-                         htabsize);
-            return;
-        }
-    }
-#endif /* defined(TARGET_PPC64) */
-    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
-    env->spr[SPR_SDR1] = value;
-}
-
 #if defined(TARGET_PPC64)
 void ppc_store_ptcr(CPUPPCState *env, target_ulong value)
 {
-- 
2.17.1


