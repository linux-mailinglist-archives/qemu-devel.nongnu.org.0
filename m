Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0081E43D9BE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:16:15 +0200 (CEST)
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvtn-0003AI-38
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPb-0001QY-4G
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPY-0005wN-Kr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id m14so4557929pfc.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGhVKVJSDxY3HmMJpb1bjuDxl1XBH/ImqPdvrbNQikQ=;
 b=zGlsgN95Re40ShmurealoFx0hEER4AQNEyMlf9+B5jkpLiVuvLCWUZasonl9lzQkob
 9axCtqpx/6QUjR20Y5jzhIF3ThSiKFu7D7IM0CPsX9+g7LcXbKlyrUZsKcXaGTEc7P4c
 76DUrvqfS7lt//OsDNMpCDNu4vNGVNdNN15xCFra9WLgA0klNTWo0mRsBD9eqm731v/7
 DoB+ZkS69HtOxcH95x3bXxa2jjeSFofQ6JTlTBdMGKzycUlqbSLBfBKociJYd8oMAL5X
 l+80yLAq5yVQ4XS+UCGiM38ijq29JQRpJGY39tP2nIwZblATFKkqfBfcibbUMFs+d0lf
 6JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGhVKVJSDxY3HmMJpb1bjuDxl1XBH/ImqPdvrbNQikQ=;
 b=hywTedv6pnfvACB1EGfqs3rDp1FaKfwQvQ81/2iStU0z4G7/EsxJ3NZpKAzNEYQayH
 8j8iRFaNDWALzcuekAxtbITgm0LNO/bPBxZ5dCV0wNTA4YIyTYNAWIk/sPP9TMwdVpje
 d8z9/VWH7L+kHTaJDis6ocWBy2ExCnC1phQmoqE/L7RX5GxWZYFgm4KJNpQc6Sjlht/K
 ShGh9corucrrdY5bwtldP5FObm8jhiO+c9ythMEPexKGZxsvIVz9A8h6nuoyh0na5QWL
 5+Z891qgJk8yRqn4spnjRrxMkjzlkwQFYAJ9W9OSNVHFEHbFKErAcKh5XLSwHrmW3fvn
 co1g==
X-Gm-Message-State: AOAM533ElAgBrSANb/6Ocpf51Z+F5jhdrE/d/FVIoz+HdRv13ZclMV/h
 se6EfZJnTHIDKswfxe+bpY2oPfXb00QlGg==
X-Google-Smtp-Source: ABdhPJxTz/L14V5SsjbbHBVE1kMuYJQ+J+j2he1/HUXLwTzX0zncoZ2lBqgJACJd33WFaBJiO4DMgw==
X-Received: by 2002:a63:9550:: with SMTP id t16mr1160364pgn.318.1635389099370; 
 Wed, 27 Oct 2021 19:44:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:44:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/56] tcg/optimize: Split out fold_sub_to_neg
Date: Wed, 27 Oct 2021 19:41:15 -0700
Message-Id: <20211028024131.1492790-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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


