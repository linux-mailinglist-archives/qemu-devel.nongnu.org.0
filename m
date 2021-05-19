Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0E388EA0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:06:55 +0200 (CEST)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLuY-0001wW-2A
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgn-0000pQ-Nj; Wed, 19 May 2021 08:52:41 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgh-0001Df-RW; Wed, 19 May 2021 08:52:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnb4pr4z9ssP; Wed, 19 May 2021 22:52:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428723;
 bh=LInd8rsPdruPGaJISGZyoKNIhPakN+eNtSkr6SgZ2zU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m1Gcf+n+rOzHbl6FG1Zn3Y5VUHT2C8xLzsmdru+Ds3jT41DM7uhUMKO51V0qjSbxU
 DGN0cfbcek9ZCq/p7DXPn7P4Wprw0PZ7n0sxTkwNXxQsLe5NHRXwyeKJZgzcv7Wziw
 nJ9gkp1DOQX6IcFRgTtUct3Y7fMzikInRKL2rSgE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/48] target/ppc: moved ppc_store_sdr1 to cpu.c
Date: Wed, 19 May 2021 22:51:14 +1000
Message-Id: <20210519125148.27720-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Moved this function that is required in !TCG cases into a
common code file

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[dwg: Fixed compile error with linux-user targets]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.c        | 31 +++++++++++++++++++++++++++++++
 target/ppc/mmu_helper.c | 26 --------------------------
 2 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index cb794e9f4f..d957d1a687 100644
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
@@ -61,3 +64,31 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     uint32_t sat = (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) != 0;
     return env->vscr | (sat << VSCR_SAT);
 }
+
+#ifdef CONFIG_SOFTMMU
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
+#endif /* CONFIG_SOFTMMU */
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
2.31.1


