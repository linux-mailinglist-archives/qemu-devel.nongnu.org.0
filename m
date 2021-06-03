Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8247399C9F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:33:54 +0200 (CEST)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loinZ-0006xI-Qx
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid1-0006Ht-C2; Thu, 03 Jun 2021 04:22:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44805 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicy-0008Ti-7V; Thu, 03 Jun 2021 04:22:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l5pkKz9sXS; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=3GWslL8pQ1dQy2K6BpFHFxFuBQVHitpzrqC1llhg8MU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L3WoP5F9YpJV49fXQmibwkyv1xku6SD7C2XkaoKLZZ8bqf4MABxjNKpFMm3BMcj37
 EJC0S5Gy18w97F8wh3Em7Rtz544JWuZAs81F6ieh6kslg+vAKiq6w9Fb06XQSF4j9M
 jyELrSPsub7xiN6pn8JZV24lUum0p+LH8eS9xjhk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/42] target/ppc: fold ppc_store_ptcr into it's only caller
Date: Thu,  3 Jun 2021 18:21:58 +1000
Message-Id: <20210603082231.601214-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

ppc_store_ptcr, defined in mmu_helper.c, was only used by
helper_store_ptcr, in misc_helper.c. To avoid possible confusion,
the function was folded into the helper.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210526143516.125582-1-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         |  1 -
 target/ppc/misc_helper.c | 24 +++++++++++++++++++++++-
 target/ppc/mmu_helper.c  | 28 ----------------------------
 3 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cab33a3680..27e4661dce 100644
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
index 37986c59ba..475d9f81b4 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2030,34 +2030,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 
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
2.31.1


