Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855C388F35
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:33:13 +0200 (CEST)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMK0-0006t6-1i
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhn-0002J5-LC; Wed, 19 May 2021 08:53:43 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhj-0001jA-Um; Wed, 19 May 2021 08:53:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXns2D0kz9tD5; Wed, 19 May 2021 22:52:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428737;
 bh=lZKRM89jGQ5fffSDCjTPVVHmFfPRAxQ0VWRr7ZbUmek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dTq63/dnxdnJ8svWNTKPFtTaN6B+QQw6VzCuV4Gk7592eqP/B7hHWk+4zZQNPwwPq
 MhTqE2lvsyL8i+PYKfRP/AR4lD1VfmlqiYiEygvRtLnN0TOVPWsuEt3BjcJYBaJTH0
 4osCzByZSn4H7ddAVi8U9x8nabFvsmaTbM273T+8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 44/48] target/ppc: Remove type argument from
 mmu40x_get_physical_address
Date: Wed, 19 May 2021 22:51:44 +1000
Message-Id: <20210519125148.27720-45-david@gibson.dropbear.id.au>
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

It is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-12-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 0eba8302ee..1426973b4d 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -662,8 +662,7 @@ static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
 
 static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                        target_ulong address,
-                                       MMUAccessType access_type,
-                                       int type)
+                                       MMUAccessType access_type)
 {
     ppcemb_tlb_t *tlb;
     hwaddr raddr;
@@ -1426,8 +1425,7 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
         if (real_mode) {
             ret = check_physical(env, ctx, eaddr, access_type);
         } else {
-            ret = mmu40x_get_physical_address(env, ctx, eaddr,
-                                              access_type, type);
+            ret = mmu40x_get_physical_address(env, ctx, eaddr, access_type);
         }
         break;
     case POWERPC_MMU_BOOKE:
-- 
2.31.1


