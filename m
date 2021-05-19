Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DBC388EB7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:12:39 +0200 (CEST)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM06-0006Em-5V
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgu-0000yr-R9; Wed, 19 May 2021 08:52:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58367 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgn-0001GV-Qr; Wed, 19 May 2021 08:52:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXng1mDBz9t0p; Wed, 19 May 2021 22:52:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428727;
 bh=Xdw8XgkaWEWnfimzMa+ytAFrW3h36v/oUVgJ6xgTHHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FBXDgAb5mt+BhlLZdDVYfjZ23aEvbiyFgkUmcXN2FwagZZI/J6v27Tu6zIKuo/E3l
 dO9QzhCMujJAq9I+icQlF7ZfyH7joDshZWDMqQbcjGopslEcgQlrEVLFraTKTjBHx/
 DdpqgQSQfRp668q8sCA2Lg2LBVne2uzG/arNyRqw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 21/48] target/ppc: Simplify gen_debug_exception
Date: Wed, 19 May 2021 22:51:21 +1000
Message-Id: <20210519125148.27720-22-david@gibson.dropbear.id.au>
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Two of the call sites that use gen_debug_exception have already
updated NIP.  Only ppc_tr_breakpoint_check requires the update.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-7-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9626bea9d5..5590a93ad5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -329,19 +329,7 @@ static uint32_t gen_prep_dbgex(DisasContext *ctx)
 
 static void gen_debug_exception(DisasContext *ctx)
 {
-    TCGv_i32 t0;
-
-    /*
-     * These are all synchronous exceptions, we set the PC back to the
-     * faulting instruction
-     */
-    if ((ctx->exception != POWERPC_EXCP_BRANCH) &&
-        (ctx->exception != POWERPC_EXCP_SYNC)) {
-        gen_update_nip(ctx, ctx->base.pc_next);
-    }
-    t0 = tcg_const_i32(EXCP_DEBUG);
-    gen_helper_raise_exception(cpu_env, t0);
-    tcg_temp_free_i32(t0);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -9186,6 +9174,7 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
+    gen_update_nip(ctx, ctx->base.pc_next);
     gen_debug_exception(ctx);
     /*
      * The address covered by the breakpoint must be included in
-- 
2.31.1


