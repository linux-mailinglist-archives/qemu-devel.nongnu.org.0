Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE068F3CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 17:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPnei-0007xJ-Hq; Wed, 08 Feb 2023 11:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPneh-0007wt-Cy
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:50:47 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPnef-0004rA-9m
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:50:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6x/lX2fc+g3Xm0gI9b3J+PeMVU3g8f16Shijlo3uko=; b=LTOxojyHRKQoZNeQYYSzmwJSKq
 86Vlptcu6BP5JSA2l2LpaklJFidwkGXTfxr3Kf7sb0KdzYplcVE9y28h71MBzddlNTYPCB+gMh/7Z
 EScd/B/YVpXB8lO1eP/Ag1zDMhkaTKXGiRrviU+iOgwOnGOCYjTzGS8+iBYbStr5eyMk=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH] target/hexagon: Access `pkt/insn` through `ctx`
Date: Wed,  8 Feb 2023 17:50:34 +0100
Message-Id: <20230208165034.21510-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In code emitted by idef-parser, access insn and pkt through DisasContext
instead of explicitly taking them as arguments.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/hexagon/gen_tcg_funcs.py             |  2 +-
 target/hexagon/idef-parser/parser-helpers.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index 7e8ba17ca2..1d0ff29c5e 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -635,7 +635,7 @@ def gen_tcg_func(f, tag, regs, imms):
         for immlett,bits,immshift in imms:
             declared.append(hex_common.imm_name(immlett))

-        arguments = ", ".join(["ctx", "ctx->insn", "ctx->pkt"] + declared)
+        arguments = ", ".join(["ctx"] + declared)
         f.write("    emit_%s(%s);\n" % (tag, arguments))

     elif ( hex_common.skip_qemu_helper(tag) ):
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 8110686c51..3917c6ae89 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -189,7 +189,7 @@ void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
         EMIT(c, "ctx->npc");
         break;
     case IMM_CONSTEXT:
-        EMIT(c, "insn->extension_valid");
+        EMIT(c, "ctx->insn->extension_valid");
         break;
     default:
         yyassert(c, locp, false, "Cannot print this expression!");
@@ -1822,8 +1822,7 @@ void gen_inst(Context *c, GString *iname)
     c->inst.allocated = g_array_new(FALSE, FALSE, sizeof(Var));
     c->inst.init_list = g_array_new(FALSE, FALSE, sizeof(HexValue));
     c->inst.strings = g_array_new(FALSE, FALSE, sizeof(GString *));
-    EMIT_SIG(c, "void emit_%s(DisasContext *ctx, Insn *insn, Packet *pkt",
-             c->inst.name->str);
+    EMIT_SIG(c, "void emit_%s(DisasContext *ctx", c->inst.name->str);
 }


@@ -1903,13 +1902,13 @@ void gen_pred_assign(Context *c, YYLTYPE *locp, HexValue *left_pred,

 void gen_cancel(Context *c, YYLTYPE *locp)
 {
-    OUT(c, locp, "gen_cancel(insn->slot);\n");
+    OUT(c, locp, "gen_cancel(ctx->insn->slot);\n");
 }

 void gen_load_cancel(Context *c, YYLTYPE *locp)
 {
     gen_cancel(c, locp);
-    OUT(c, locp, "if (insn->slot == 0 && pkt->pkt_has_store_s1) {\n");
+    OUT(c, locp, "if (ctx->insn->slot == 0 && ctx->pkt->pkt_has_store_s1) {\n");
     OUT(c, locp, "ctx->s1_store_processed = false;\n");
     OUT(c, locp, "process_store(ctx, 1);\n");
     OUT(c, locp, "}\n");
@@ -1933,7 +1932,7 @@ void gen_load(Context *c, YYLTYPE *locp, HexValue *width,
     snprintf(size_suffix, 4, "%" PRIu64, width->imm.value * 8);
     /* Lookup the effective address EA */
     find_variable(c, locp, ea, ea);
-    OUT(c, locp, "if (insn->slot == 0 && pkt->pkt_has_store_s1) {\n");
+    OUT(c, locp, "if (ctx->insn->slot == 0 && ctx->pkt->pkt_has_store_s1) {\n");
     OUT(c, locp, "probe_noshuf_load(", ea, ", ", width, ", ctx->mem_idx);\n");
     OUT(c, locp, "process_store(ctx, 1);\n");
     OUT(c, locp, "}\n");
@@ -1962,7 +1961,7 @@ void gen_store(Context *c, YYLTYPE *locp, HexValue *width, HexValue *ea,
     find_variable(c, locp, ea, ea);
     src_m = rvalue_materialize(c, locp, &src_m);
     OUT(c, locp, "gen_store", &mem_width, "(cpu_env, ", ea, ", ", &src_m);
-    OUT(c, locp, ", insn->slot);\n");
+    OUT(c, locp, ", ctx->insn->slot);\n");
     gen_rvalue_free(c, locp, &src_m);
     /* If the var in ea was truncated it is now a tmp HexValue, so free it. */
     gen_rvalue_free(c, locp, ea);
--
2.39.1

