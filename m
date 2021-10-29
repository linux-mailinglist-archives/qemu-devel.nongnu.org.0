Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DD43F680
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:21:40 +0200 (CEST)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKKh-0003Z0-9S
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdd-0002NM-JU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdZ-0000LH-Fa
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:07 -0400
Received: by mail-pg1-x532.google.com with SMTP id c4so8673668pgv.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGhVKVJSDxY3HmMJpb1bjuDxl1XBH/ImqPdvrbNQikQ=;
 b=GHjNNfnuoaGYTZsmMYYLqRW5ljOyuL70MDAmdiJFgqn1qrAcFTbUyCv2eccVJQr3ga
 h27Cd0XXhOgl4TqMLtxC+JrdMpXqIZchUR7CK3DlcdVycdW5sUmlwYO2TfCn814SbUzd
 ioxalOsVqu5BNXBtam8tzI8BgEfsi4E0Kf/nrK+xgJTKPdfzZD+Tsug8nbyhylEIiqXk
 54+Ag3ugJWaZMeQv/3dg0ywp1W6KMbMsa+ipBbiXHwBVPFnityrUzpWEFIGU7nkmNzcE
 AZAbR8R0ALgLaSxCrDT2kX2v/n6WPtBHpRR7t4yPhea881PzfHr1wL+HpZhh7ZBen5vi
 3hRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGhVKVJSDxY3HmMJpb1bjuDxl1XBH/ImqPdvrbNQikQ=;
 b=fOxI9+YLbYhF+6M1k+kjiI4zwIGI/m+NJkMONPfRg7BgccB845m4eph5uK5FSIirPp
 EOx5H7fHcOWXXTEwfk1AzdsrtCWslwHYCz8HIP/ueVIlo29Hl35xV1gGgQiRsj4GAyr5
 mOPVrbMQEzSG5H+PjEGx4NdUuwgvnWi/lIYYFUqClhxw7Sb/89SfeaCHgZ8NNbG9ccve
 g+TtKX43Y+8mAPioApOr77lqd90sdjPP9BJDfgfJDVkC5hG2v4jifoZB7ksSSv/fUoTh
 JamHRdCwnUu6pmliWt/MvAd5EYiTOB1X9yxnqnuofa1IjXEO7l/f3VQhDok1Y8XJeFy+
 GxQw==
X-Gm-Message-State: AOAM530qOMF/DrbndHAZimpM7ch0z1vF68dvABhuAKdTnpL7OoAf3W0u
 YTJk7CUVFpxOzCK7KMS6t7b9B6c1+hkPTg==
X-Google-Smtp-Source: ABdhPJwGwvj3/RZXGdV1ciIF5eqUpDU46TSfl+xtsXJSj32vIas/+BZJ0u6uXKusaSDz/1VFkgznaA==
X-Received: by 2002:a62:6d86:0:b0:448:152d:83a4 with SMTP id
 i128-20020a626d86000000b00448152d83a4mr8561258pfc.38.1635482224198; 
 Thu, 28 Oct 2021 21:37:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 40/60] tcg/optimize: Split out fold_sub_to_neg
Date: Thu, 28 Oct 2021 21:33:09 -0700
Message-Id: <20211029043329.1518029-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though there is only one user, place this more complex
conversion into its own helper.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 89 ++++++++++++++++++++++++++------------------------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 21f4251b4f..e0d850ffe4 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1203,7 +1203,15 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
 
 static bool fold_neg(OptContext *ctx, TCGOp *op)
 {
-    return fold_const1(ctx, op);
+    if (fold_const1(ctx, op)) {
+        return true;
+    }
+    /*
+     * Because of fold_sub_to_neg, we want to always return true,
+     * via finish_folding.
+     */
+    finish_folding(ctx, op);
+    return true;
 }
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
@@ -1360,10 +1368,47 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_sub_to_neg(OptContext *ctx, TCGOp *op)
+{
+    TCGOpcode neg_op;
+    bool have_neg;
+
+    if (!arg_is_const(op->args[1]) || arg_info(op->args[1])->val != 0) {
+        return false;
+    }
+
+    switch (ctx->type) {
+    case TCG_TYPE_I32:
+        neg_op = INDEX_op_neg_i32;
+        have_neg = TCG_TARGET_HAS_neg_i32;
+        break;
+    case TCG_TYPE_I64:
+        neg_op = INDEX_op_neg_i64;
+        have_neg = TCG_TARGET_HAS_neg_i64;
+        break;
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+    case TCG_TYPE_V256:
+        neg_op = INDEX_op_neg_vec;
+        have_neg = (TCG_TARGET_HAS_neg_vec &&
+                    tcg_can_emit_vec_op(neg_op, ctx->type, TCGOP_VECE(op)) > 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (have_neg) {
+        op->opc = neg_op;
+        op->args[1] = op->args[2];
+        return fold_neg(ctx, op);
+    }
+    return false;
+}
+
 static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0)) {
+        fold_xx_to_i(ctx, op, 0) ||
+        fold_sub_to_neg(ctx, op)) {
         return true;
     }
     return false;
@@ -1497,46 +1542,6 @@ void tcg_optimize(TCGContext *s)
                 continue;
             }
             break;
-        CASE_OP_32_64_VEC(sub):
-            {
-                TCGOpcode neg_op;
-                bool have_neg;
-
-                if (arg_is_const(op->args[2])) {
-                    /* Proceed with possible constant folding. */
-                    break;
-                }
-                switch (ctx.type) {
-                case TCG_TYPE_I32:
-                    neg_op = INDEX_op_neg_i32;
-                    have_neg = TCG_TARGET_HAS_neg_i32;
-                    break;
-                case TCG_TYPE_I64:
-                    neg_op = INDEX_op_neg_i64;
-                    have_neg = TCG_TARGET_HAS_neg_i64;
-                    break;
-                case TCG_TYPE_V64:
-                case TCG_TYPE_V128:
-                case TCG_TYPE_V256:
-                    neg_op = INDEX_op_neg_vec;
-                    have_neg = tcg_can_emit_vec_op(neg_op, ctx.type,
-                                                   TCGOP_VECE(op)) > 0;
-                    break;
-                default:
-                    g_assert_not_reached();
-                }
-                if (!have_neg) {
-                    break;
-                }
-                if (arg_is_const(op->args[1])
-                    && arg_info(op->args[1])->val == 0) {
-                    op->opc = neg_op;
-                    reset_temp(op->args[0]);
-                    op->args[1] = op->args[2];
-                    continue;
-                }
-            }
-            break;
         default:
             break;
         }
-- 
2.25.1


