Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F27388F3B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:35:39 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMMM-00049b-RD
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhr-0002cK-RJ; Wed, 19 May 2021 08:53:47 -0400
Received: from ozlabs.org ([203.11.71.1]:41239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhq-0001dC-0U; Wed, 19 May 2021 08:53:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnr2bndz9s1l; Wed, 19 May 2021 22:52:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428736;
 bh=HvzS/W9peBFoqRQMJFUOSjaaY1iY7OVTY37oKn+DsfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VjXOUHaeck5kPa6GfIghQUtC6wZ9CCbz66C/SVvnhZ0ZyAEXd+TrJI3TuBT0+rnZ/
 mvV3YowDsqa/QNU6I8uMGS9vJ+Ck5Kv7axhgMUfsvjn7Z5sSIwZRDO6PV5H4iDVQYG
 Y9IGi4vMVY9xGFhRztrOXLLoUpCk64pzQk/tu/BQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 43/48] target/ppc: Remove type argument from get_bat_6xx_tlb
Date: Wed, 19 May 2021 22:51:43 +1000
Message-Id: <20210519125148.27720-44-david@gibson.dropbear.id.au>
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
Message-Id: <20210518201146.794854-11-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2f00955b80..0eba8302ee 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -379,25 +379,22 @@ static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
 }
 
 static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
-                           target_ulong virtual, MMUAccessType access_type,
-                           int type)
+                           target_ulong virtual, MMUAccessType access_type)
 {
     target_ulong *BATlt, *BATut, *BATu, *BATl;
     target_ulong BEPIl, BEPIu, bl;
     int i, valid, prot;
     int ret = -1;
+    bool ifetch = access_type == MMU_INST_FETCH;
 
     LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
-             type == ACCESS_CODE ? 'I' : 'D', virtual);
-    switch (type) {
-    case ACCESS_CODE:
+             ifetch ? 'I' : 'D', virtual);
+    if (ifetch) {
         BATlt = env->IBAT[1];
         BATut = env->IBAT[0];
-        break;
-    default:
+    } else {
         BATlt = env->DBAT[1];
         BATut = env->DBAT[0];
-        break;
     }
     for (i = 0; i < env->nb_BATs; i++) {
         BATu = &BATut[i];
@@ -407,7 +404,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
         bat_size_prot(env, &bl, &valid, &prot, BATu, BATl);
         LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                  " BATl " TARGET_FMT_lx "\n", __func__,
-                 type == ACCESS_CODE ? 'I' : 'D', i, virtual, *BATu, *BATl);
+                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
         if ((virtual & 0xF0000000) == BEPIu &&
             ((virtual & 0x0FFE0000) & ~bl) == BEPIl) {
             /* BAT matches */
@@ -441,7 +438,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                          " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
                          TARGET_FMT_lx " " TARGET_FMT_lx "\n",
-                         __func__, type == ACCESS_CODE ? 'I' : 'D', i, virtual,
+                         __func__, ifetch ? 'I' : 'D', i, virtual,
                          *BATu, *BATl, BEPIu, BEPIl, bl);
             }
         }
@@ -1415,7 +1412,7 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
         } else {
             /* Try to find a BAT */
             if (env->nb_BATs != 0) {
-                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type, type);
+                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type);
             }
             if (ret < 0) {
                 /* We didn't match any BAT entry or don't have BATs */
-- 
2.31.1


