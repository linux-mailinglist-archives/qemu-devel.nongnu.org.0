Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586FC3F94E6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:13:43 +0200 (CEST)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJW3a-0004Hl-CF
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW00-0000ry-08; Fri, 27 Aug 2021 03:10:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52633 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJVzv-0007Ju-1k; Fri, 27 Aug 2021 03:09:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ04xyz9sW4; Fri, 27 Aug 2021 17:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=Vw8GPh18zltcR7LLwN7Oyua6GnbwIkWEuRcPyNWJV38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QCoUiGG6CPhjaFIWdIfPWbnaEuIkPqPog9pBDukTPudJ02fOPZHwrLK4xkc99QB+g
 FBR4UWipaTu6bOK03PGIy4H4MELtm6DYxqTP1mgtid67BhOtEfNgi3vRR5XayZYCpX
 N/qu1c6jMyT9WA4fbRo//inDvCO3Q8UQQ2ycDtYA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/18] target/ppc: moved ppc_store_sdr1 to mmu_common.c
Date: Fri, 27 Aug 2021 17:09:32 +1000
Message-Id: <20210827070946.219970-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

ppc_store_sdr1 was at first in mmu_helper.c and was moved as part
the patches to enable the disable-tcg option, now it's being moved
back to a file that will be compiled with that option

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20210723175627.72847-3-lucas.araujo@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
index ec4dce4ddc..a0518f611b 100644
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
2.31.1


