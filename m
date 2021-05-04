Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD053725AF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:09:10 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoF3-0000p7-Sv
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo04-0005IN-FP; Tue, 04 May 2021 01:53:42 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzy-0004ie-Uv; Tue, 04 May 2021 01:53:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK4BjVz9sX5; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=AE/4n5PGUFoays6zdARQ1IYd5KqZTCtHN4fMxuKqurw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CG/zmRBj11BgKHf0CMIk3b+0a/IQ3qoo7/funvWg9rGiqlypcfw4yItCqMdaSLEII
 dd/XWbcASUARDs4Hj/5xlSBdCmtovbYdh58aaIodPA6ZcmTO/v3bHjPqTudMVxn8Jp
 6vwWsW2239DGCFiGNX/9AzO4CKfhgufVnDyWfYDo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/46] target/ppc: Put dbcr0 single-step bits into hflags
Date: Tue,  4 May 2021 15:52:39 +1000
Message-Id: <20210504055312.306823-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Because these bits were not in hflags, the code generated
for single-stepping on BookE was essentially random.
Recompute hflags when storing to dbcr0.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-5-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/helper_regs.c | 24 +++++++++++++++++-------
 target/ppc/misc_helper.c |  3 +++
 target/ppc/translate.c   | 11 -----------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index df9673b90f..e345966b6b 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -114,13 +114,23 @@ void hreg_compute_hflags(CPUPPCState *env)
         hflags |= le << MSR_LE;
     }
 
-    if (ppc_flags & POWERPC_FLAG_BE) {
-        QEMU_BUILD_BUG_ON(MSR_BE != HFLAGS_BE);
-        msr_mask |= 1 << MSR_BE;
-    }
-    if (ppc_flags & POWERPC_FLAG_SE) {
-        QEMU_BUILD_BUG_ON(MSR_SE != HFLAGS_SE);
-        msr_mask |= 1 << MSR_SE;
+    if (ppc_flags & POWERPC_FLAG_DE) {
+        target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
+        if (dbcr0 & DBCR0_ICMP) {
+            hflags |= 1 << HFLAGS_SE;
+        }
+        if (dbcr0 & DBCR0_BRT) {
+            hflags |= 1 << HFLAGS_BE;
+        }
+    } else {
+        if (ppc_flags & POWERPC_FLAG_BE) {
+            QEMU_BUILD_BUG_ON(MSR_BE != HFLAGS_BE);
+            msr_mask |= 1 << MSR_BE;
+        }
+        if (ppc_flags & POWERPC_FLAG_SE) {
+            QEMU_BUILD_BUG_ON(MSR_SE != HFLAGS_SE);
+            msr_mask |= 1 << MSR_SE;
+        }
     }
 
     if (msr_is_64bit(env, msr)) {
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index b04b4d7c6e..002958be26 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -215,6 +215,9 @@ void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong value)
 
 void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
 {
+    /* Bits 26 & 27 affect single-stepping. */
+    hreg_compute_hflags(env);
+    /* Bits 28 & 29 affect reset or shutdown. */
     store_40x_dbcr0(env, val);
 }
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a85b890bb0..7912495f28 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7923,17 +7923,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     if ((hflags >> HFLAGS_BE) & 1) {
         ctx->singlestep_enabled |= CPU_BRANCH_STEP;
     }
-    if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
-        ctx->singlestep_enabled = 0;
-        target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
-        if (dbcr0 & DBCR0_ICMP) {
-            ctx->singlestep_enabled |= CPU_SINGLE_STEP;
-        }
-        if (dbcr0 & DBCR0_BRT) {
-            ctx->singlestep_enabled |= CPU_BRANCH_STEP;
-        }
-
-    }
     if (unlikely(ctx->base.singlestep_enabled)) {
         ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
     }
-- 
2.31.1


