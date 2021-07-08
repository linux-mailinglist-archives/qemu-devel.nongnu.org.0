Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C603C1813
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:27:00 +0200 (CEST)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xnf-0006Zr-6m
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m1XFS-0000DS-Ia; Thu, 08 Jul 2021 12:51:38 -0400
Received: from [201.28.113.2] (port=18772 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m1XFR-0003G3-1d; Thu, 08 Jul 2021 12:51:38 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 8 Jul 2021 13:50:25 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 86F5B800976;
 Thu,  8 Jul 2021 13:50:25 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 3/4] target/ppc: moved ppc_store_sdr1 to mmu_common.c
Date: Thu,  8 Jul 2021 13:49:56 -0300
Message-Id: <20210708164957.28096-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708164957.28096-1-lucas.araujo@eldorado.org.br>
References: <20210708164957.28096-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 08 Jul 2021 16:50:25.0657 (UTC)
 FILETIME=[59939E90:01D77419]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ppc_store_sdr1 was at first in mmu_helper.c and was moved as part
the patches to enable the disable-tcg option, now it's being moved
back to a file that will be compiled with that option

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/cpu.c        | 28 ----------------------------
 target/ppc/mmu_common.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index a29299882a..7ad9bd6044 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -67,34 +67,6 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     return env->vscr | (sat << VSCR_SAT);
 }
 
-#ifdef CONFIG_SOFTMMU
-void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
-    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
-#if defined(TARGET_PPC64)
-    if (mmu_is_64bit(env->mmu_model)) {
-        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
-        target_ulong htabsize = value & SDR_64_HTABSIZE;
-
-        if (value & ~sdr_mask) {
-            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
-                     " set in SDR1", value & ~sdr_mask);
-            value &= sdr_mask;
-        }
-        if (htabsize > 28) {
-            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
-                     " stored in SDR1", htabsize);
-            return;
-        }
-    }
-#endif /* defined(TARGET_PPC64) */
-    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
-    env->spr[SPR_SDR1] = value;
-}
-#endif /* CONFIG_SOFTMMU */
-
 /* GDBstub can read and write MSR... */
 void ppc_store_msr(CPUPPCState *env, target_ulong value)
 {
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 8e3f2b01a9..c9da3f856a 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -58,6 +58,32 @@
 #  define LOG_BATS(...) do { } while (0)
 #endif
 
+void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
+    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
+#if defined(TARGET_PPC64)
+    if (mmu_is_64bit(env->mmu_model)) {
+        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
+        target_ulong htabsize = value & SDR_64_HTABSIZE;
+
+        if (value & ~sdr_mask) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
+                     " set in SDR1", value & ~sdr_mask);
+            value &= sdr_mask;
+        }
+        if (htabsize > 28) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
+                     " stored in SDR1", htabsize);
+            return;
+        }
+    }
+#endif /* defined(TARGET_PPC64) */
+    /* FIXME: Should check for valid HTABMASK values in 32-bit case */
+    env->spr[SPR_SDR1] = value;
+}
+
 /*****************************************************************************/
 /* PowerPC MMU emulation */
 
-- 
2.17.1


