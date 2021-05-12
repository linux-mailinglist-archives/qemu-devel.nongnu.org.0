Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85CE37D3B8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:02:28 +0200 (CEST)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgu7n-0001Mv-T7
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1y-0005pM-Ov; Wed, 12 May 2021 14:56:26 -0400
Received: from [201.28.113.2] (port=20812 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu1x-0007uU-17; Wed, 12 May 2021 14:56:26 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 37A1280139F;
 Wed, 12 May 2021 15:56:01 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 07/31] target/ppc: Introduce DISAS_{EXIT,CHAIN}{,_UPDATE}
Date: Wed, 12 May 2021 15:54:17 -0300
Message-Id: <20210512185441.3619828-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:01.0546 (UTC)
 FILETIME=[73C546A0:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rewrite ppc_tr_tb_stop to handle these new codes.

Convert ctx->exception into these new codes at the end of
ppc_tr_translate_insn, prior to pushing the change back
throughout translate.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 75 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 7b23f85c11..4bebb00bb2 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -182,6 +182,11 @@ struct DisasContext {
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
@@ -9417,28 +9422,78 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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
2.25.1


