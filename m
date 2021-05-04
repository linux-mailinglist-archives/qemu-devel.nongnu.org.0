Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87E3725A9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:04:01 +0200 (CEST)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoA3-0005Tt-CE
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo02-0005Hc-IK; Tue, 04 May 2021 01:53:39 -0400
Received: from ozlabs.org ([203.11.71.1]:39851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzz-0004kR-Cw; Tue, 04 May 2021 01:53:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK4VJQz9sX3; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=EOPu6ADeRLGhAyKKyY2SdVCCjqq706WI0Er+aWaZJ8o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AnXHInv5jo+304cUKO5rozSV2twH5FZNjMPDqQ4PAZRhJgM4jHLFwt1z0eNg/9RT2
 fNu0Oj2NiodXUeoBknFdWAjIyrrOF7DHnKcQLiJTxC3KkWJX3jk1k/uIxZ6QVfD+V6
 aPgE1SI5CLnU+ej1HgXGKMmtGt8a+TsF1/h3Uz78=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 15/46] target/ppc: Put LPCR[GTSE] in hflags
Date: Tue,  4 May 2021 15:52:41 +1000
Message-Id: <20210504055312.306823-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

Because this bit was not in hflags, the privilege check
for tlb instructions was essentially random.
Recompute hflags when storing to LPCR.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-7-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         | 1 +
 target/ppc/helper_regs.c | 3 +++
 target/ppc/mmu-hash64.c  | 3 +++
 target/ppc/translate.c   | 2 +-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index d5f362506a..3c28ddb331 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -596,6 +596,7 @@ enum {
     HFLAGS_LE = 0,   /* MSR_LE -- comes from elsewhere on 601 */
     HFLAGS_HV = 1,   /* computed from MSR_HV and other state */
     HFLAGS_64 = 2,   /* computed from MSR_CE and MSR_SF */
+    HFLAGS_GTSE = 3, /* computed from SPR_LPCR[GTSE] */
     HFLAGS_DR = 4,   /* MSR_DR */
     HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index e345966b6b..f85bb14d1d 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -149,6 +149,9 @@ void hreg_compute_hflags(CPUPPCState *env)
     if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
         hflags |= 1 << HFLAGS_TM;
     }
+    if (env->spr[SPR_LPCR] & LPCR_GTSE) {
+        hflags |= 1 << HFLAGS_GTSE;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 0fabc10302..d517a99832 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 #include "hw/hw.h"
 #include "mmu-book3s-v3.h"
+#include "helper_regs.h"
 
 /* #define DEBUG_SLB */
 
@@ -1125,6 +1126,8 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
     CPUPPCState *env = &cpu->env;
 
     env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
+    /* The gtse bit affects hflags */
+    hreg_compute_hflags(env);
 }
 
 void helper_store_lpcr(CPUPPCState *env, target_ulong val)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d48c554290..5e629291d3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7908,7 +7908,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->altivec_enabled = (hflags >> HFLAGS_VR) & 1;
     ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
-    ctx->gtse = !!(env->spr[SPR_LPCR] & LPCR_GTSE);
+    ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
-- 
2.31.1


