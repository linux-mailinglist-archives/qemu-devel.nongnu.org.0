Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A7388EA7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:10:59 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLyU-0001rg-JL
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgv-00013f-VJ; Wed, 19 May 2021 08:52:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41919 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgo-0001Hi-8i; Wed, 19 May 2021 08:52:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXng45kdz9t10; Wed, 19 May 2021 22:52:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428727;
 bh=uNWtWZMeGVAzANT243kMUW21wxxT7EYTMKvQONb/t3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YDfCL1z1YBx7fQ8uZ6GZqDAOSFroN2mbUgHrUg3wJsL9Vlq0WenYKw4psjGDbrKUp
 RiMeETKPBXYLkdD95/6p2sKtV4ir/s5hWWyfXT2+55gHHv8uV2kVS65Pl6I25Tnu+q
 3b/GY45/go3nlz+5DrHvNXi1BJSWvg6xAxmHDsbU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 22/48] target/ppc: Introduce DISAS_{EXIT,CHAIN}{,_UPDATE}
Date: Wed, 19 May 2021 22:51:22 +1000
Message-Id: <20210519125148.27720-23-david@gibson.dropbear.id.au>
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

Rewrite ppc_tr_tb_stop to handle these new codes.

Convert ctx->exception into these new codes at the end of
ppc_tr_translate_insn, prior to pushing the change back
throughout translate.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210512185441.3619828-8-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 75 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5590a93ad5..c879b47dc6 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -185,6 +185,11 @@ struct DisasContext {
     uint64_t insns_flags2;
 };
 
+#define DISAS_EXIT         DISAS_TARGET_0  /* exit to main loop, pc updated */
+#define DISAS_EXIT_UPDATE  DISAS_TARGET_1  /* exit to main loop, pc stale */
+#define DISAS_CHAIN        DISAS_TARGET_2  /* lookup next tb, pc updated */
+#define DISAS_CHAIN_UPDATE DISAS_TARGET_3  /* lookup next tb, pc stale */
+
 /* Return true iff byteswap is needed in a scalar memop */
 static inline bool need_byteswap(const DisasContext *ctx)
 {
@@ -9226,28 +9231,78 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                  opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
     }
 
-    if (ctx->base.is_jmp == DISAS_NEXT
-        && ctx->exception != POWERPC_EXCP_NONE) {
-        ctx->base.is_jmp = DISAS_TOO_MANY;
+    if (ctx->base.is_jmp == DISAS_NEXT) {
+        switch (ctx->exception) {
+        case POWERPC_EXCP_NONE:
+            break;
+        case POWERPC_EXCP_BRANCH:
+            ctx->base.is_jmp = DISAS_NORETURN;
+            break;
+        case POWERPC_EXCP_SYNC:
+        case POWERPC_EXCP_STOP:
+            ctx->base.is_jmp = DISAS_EXIT;
+            break;
+        default:
+            /* Every other ctx->exception should have set NORETURN. */
+            g_assert_not_reached();
+        }
     }
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    DisasJumpType is_jmp = ctx->base.is_jmp;
+    target_ulong nip = ctx->base.pc_next;
 
-    if (ctx->base.is_jmp == DISAS_NORETURN) {
+    if (is_jmp == DISAS_NORETURN) {
+        /* We have already exited the TB. */
         return;
     }
 
-    if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_goto_tb(ctx, 0, ctx->base.pc_next);
-    } else if (ctx->exception != POWERPC_EXCP_BRANCH) {
-        if (unlikely(ctx->base.singlestep_enabled)) {
-            gen_debug_exception(ctx);
+    /* Honor single stepping. */
+    if (unlikely(ctx->base.singlestep_enabled)) {
+        switch (is_jmp) {
+        case DISAS_TOO_MANY:
+        case DISAS_EXIT_UPDATE:
+        case DISAS_CHAIN_UPDATE:
+            gen_update_nip(ctx, nip);
+            break;
+        case DISAS_EXIT:
+        case DISAS_CHAIN:
+            break;
+        default:
+            g_assert_not_reached();
         }
-        /* Generate the return instruction */
+        gen_debug_exception(ctx);
+        return;
+    }
+
+    switch (is_jmp) {
+    case DISAS_TOO_MANY:
+        if (use_goto_tb(ctx, nip)) {
+            tcg_gen_goto_tb(0);
+            gen_update_nip(ctx, nip);
+            tcg_gen_exit_tb(ctx->base.tb, 0);
+            break;
+        }
+        /* fall through */
+    case DISAS_CHAIN_UPDATE:
+        gen_update_nip(ctx, nip);
+        /* fall through */
+    case DISAS_CHAIN:
+        tcg_gen_lookup_and_goto_ptr();
+        break;
+
+    case DISAS_EXIT_UPDATE:
+        gen_update_nip(ctx, nip);
+        /* fall through */
+    case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.31.1


