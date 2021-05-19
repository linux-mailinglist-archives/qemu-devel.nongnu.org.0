Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D4388EE9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:21:36 +0200 (CEST)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM8l-00004q-Dv
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhr-0002bh-MG; Wed, 19 May 2021 08:53:47 -0400
Received: from ozlabs.org ([203.11.71.1]:35001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhp-0001cx-Qf; Wed, 19 May 2021 08:53:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnq3ZW1z9tD4; Wed, 19 May 2021 22:52:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428735;
 bh=8tUdgfIdEqkaF1Yz6xbubshybQ+yxSkeZ1Oy1ZBYEZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eqeovtGt5ESQZ/vJ6AwRVrww1wUL/H0mh2vKh8z37U2Qzco+hypwDbvP+WJIz0wza
 wCl+60GzgLJ87Dls1c928FxILpU3o9VogHy0JwwD2vZsJ3Gst4fzLlfG4SRg5vH3ag
 Qd7CZMIGoiFj435S362prwcl8vq4KiZM84i2aqt0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 42/48] target/ppc: Remove type argument from ppc6xx_tlb_check
Date: Wed, 19 May 2021 22:51:42 +1000
Message-Id: <20210519125148.27720-43-david@gibson.dropbear.id.au>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-10-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 0c10677ade..2f00955b80 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -288,8 +288,7 @@ static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
 }
 
 static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
-                            target_ulong eaddr,
-                            MMUAccessType access_type, int type)
+                            target_ulong eaddr, MMUAccessType access_type)
 {
     ppc6xx_tlb_t *tlb;
     int nr, best, way;
@@ -298,8 +297,7 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
     best = -1;
     ret = -1; /* No TLB found */
     for (way = 0; way < env->nb_ways; way++) {
-        nr = ppc6xx_tlb_getnum(env, eaddr, way,
-                               type == ACCESS_CODE ? 1 : 0);
+        nr = ppc6xx_tlb_getnum(env, eaddr, way, access_type == MMU_INST_FETCH);
         tlb = &env->tlb.tlb6[nr];
         /* This test "emulates" the PTE index match for hardware TLBs */
         if ((eaddr & TARGET_PAGE_MASK) != tlb->EPN) {
@@ -314,7 +312,7 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
                   pte_is_valid(tlb->pte0) ? "valid" : "inval",
                   tlb->EPN, eaddr, tlb->pte1,
                   access_type == MMU_DATA_STORE ? 'S' : 'L',
-                  type == ACCESS_CODE ? 'I' : 'D');
+                  access_type == MMU_INST_FETCH ? 'I' : 'D');
         switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
                                      0, access_type)) {
         case -3:
@@ -503,7 +501,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
             /* Initialize real address with an invalid value */
             ctx->raddr = (hwaddr)-1ULL;
             /* Software TLB search */
-            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type, type);
+            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type);
 #if defined(DUMP_PAGE_TABLES)
             if (qemu_loglevel_mask(CPU_LOG_MMU)) {
                 CPUState *cs = env_cpu(env);
-- 
2.31.1


