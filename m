Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EBC399D09
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:47:52 +0200 (CEST)
Received: from localhost ([::1]:49646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj15-0001G2-UB
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidb-0007gf-ET; Thu, 03 Jun 2021 04:23:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50687 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidX-0000Gh-SH; Thu, 03 Jun 2021 04:23:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5p5xFbz9t1Q; Thu,  3 Jun 2021 18:22:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708558;
 bh=xI0yU8K+AIE6+Ph7gQtn9MOOEp3goTTC14cj4zuAKiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGQn5EEhMcr2EubEFcITB1dWpgiCT/fWjFQ/7pc51DButk7FsBBV//zmfkbP2p/w7
 zb9hW2x+tSOoO1EO8Y7YuJ3rFC6bNIWNk1cu1xUERXuF0J7vrhSV+LMc8r7xUnnquc
 aiHQZ4YcyjPqMZJH6FO8/T3QyxBeKgd1UAzIaRlA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 29/42] target/ppc: Move page crossing check to
 ppc_tr_translate_insn
Date: Thu,  3 Jun 2021 18:22:18 +1000
Message-Id: <20210603082231.601214-30-david@gibson.dropbear.id.au>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

With prefixed instructions, the number of instructions
remaining until the page crossing is no longer constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-3-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 11fd3342a0..d2c9fd9dd7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8821,9 +8821,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP)) {
         ctx->base.max_insns = 1;
-    } else {
-        int bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-        ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
     }
 }
 
@@ -8874,6 +8871,12 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         gen_invalid(ctx);
     }
 
+    /* End the TB when crossing a page boundary. */
+    if (ctx->base.is_jmp == DISAS_NEXT &&
+        !(ctx->base.pc_next & ~TARGET_PAGE_MASK)) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
+
     translator_loop_temp_check(&ctx->base);
 }
 
-- 
2.31.1


