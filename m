Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E5388F11
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:28:01 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMEy-00063w-MG
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhl-0002Hv-Nf; Wed, 19 May 2021 08:53:43 -0400
Received: from ozlabs.org ([203.11.71.1]:50731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhi-0001Xp-E2; Wed, 19 May 2021 08:53:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnp1JT1z9t9y; Wed, 19 May 2021 22:52:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428734;
 bh=YLQV41tCRO0Sn+ZD8X4LB0WgTPfP62gFsVq0Rcx24EI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n3KAM+HZOnlUAtSE3L4VD8o1tH3ngwXlVveTnBZe1HowlL/F0MW0DNJDefuFVNmuk
 Rr4C2hJvYm8gkTRne9PE3VRZotWJhSOHcjZe7LIh1n3IIljilvYZ3ufEJhl7b8GDMR
 PtoGKCXnUp83YbEi2G3J6oRyazJEspehcokACcsw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 40/48] target/ppc: Remove type argument from check_prot
Date: Wed, 19 May 2021 22:51:40 +1000
Message-Id: <20210519125148.27720-41-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We can now use MMU_INST_FETCH from access_type for this.
Use prot_for_access_type to simplify everything.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-8-richard.henderson@linaro.org>
[dwg: Remove a stray trailing whitespace]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2aa1b777de..2c813af924 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -32,6 +32,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
+#include "internal.h"
 #include "mmu-book3s-v3.h"
 #include "mmu-radix64.h"
 
@@ -126,31 +127,9 @@ static int pp_check(int key, int pp, int nx)
     return access;
 }
 
-static int check_prot(int prot, MMUAccessType access_type, int type)
+static int check_prot(int prot, MMUAccessType access_type)
 {
-    int ret;
-
-    if (type == ACCESS_CODE) {
-        if (prot & PAGE_EXEC) {
-            ret = 0;
-        } else {
-            ret = -2;
-        }
-    } else if (access_type == MMU_DATA_STORE) {
-        if (prot & PAGE_WRITE) {
-            ret = 0;
-        } else {
-            ret = -2;
-        }
-    } else {
-        if (prot & PAGE_READ) {
-            ret = 0;
-        } else {
-            ret = -2;
-        }
-    }
-
-    return ret;
+    return prot & prot_for_access_type(access_type) ? 0 : -2;
 }
 
 static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
@@ -182,7 +161,7 @@ static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
             /* Keep the matching PTE information */
             ctx->raddr = pte1;
             ctx->prot = access;
-            ret = check_prot(ctx->prot, access_type, type);
+            ret = check_prot(ctx->prot, access_type);
             if (ret == 0) {
                 /* Access granted */
                 qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -441,7 +420,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                     (virtual & 0x0001F000);
                 /* Compute access rights */
                 ctx->prot = prot;
-                ret = check_prot(ctx->prot, access_type, type);
+                ret = check_prot(ctx->prot, access_type);
                 if (ret == 0) {
                     LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=%c%c\n",
                              i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' : '-',
@@ -733,7 +712,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
         check_perms:
             /* Check from TLB entry */
             ctx->prot = tlb->prot;
-            ret = check_prot(ctx->prot, access_type, type);
+            ret = check_prot(ctx->prot, access_type);
             if (ret == -2) {
                 env->spr[SPR_40x_ESR] = 0;
             }
-- 
2.31.1


