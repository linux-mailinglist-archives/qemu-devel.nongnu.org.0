Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B368425D40
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:28:47 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa0U-0007Li-Nq
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUJ-0000RT-PZ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0007YC-Us
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id oa4so5016821pjb.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NJiP9E9UTrwkSex6qRTi4cqhNeIGM1dhrJ93PMdgdnM=;
 b=t7IWdWhQZ7dxZDYE0pEk/9kikjEZS8/8Izyst2GE3h6Fe7suPQiL+eX1C6CHG2QrIG
 CqbZ9h8LrARExWv7yIZy+rtejsJB+f7dXSTRofcaFwxCDItZJ+NvyYstfw6fivxKlg0B
 5Is/Ai4TIuKIFKublp1+phfbLwyE2gw4RWw88Cm9GVKe2BeVy7i9SSSDGXzYdeeO45fg
 dqLopQljqHPcW5skRFP7zb+sanRGQ3K2XH3/dq+q1xtr8MUjwtx15pjMa+lwKWgqrLOW
 K70XX75SPcZqUH8I3FTNwrjdfUbfmsgQsQMIqmC3CmTHFFx0u8z2BaIQcyfkA293BMsd
 POMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJiP9E9UTrwkSex6qRTi4cqhNeIGM1dhrJ93PMdgdnM=;
 b=39ZPAe0kCNcFA5SleT3JnoXPmvkS01eistLarxsM21jkxkEdF95qFa9VOUVAA4UIjN
 Ho1euzDkJVyOJWB1FYydH8H3kNWrf1wiKkvqMZV9UsXx6s6zTWJGdpydxDvWPJ76FZin
 oFkOtwYMzrICFBqyu0tAgBZoy1H/S2LCgWzVg1mFf/TVKg72QW+/qiuQpbYZtsABrRYo
 bj7GOYqswHyKgM9H9HZIgg+Pp3vzUHUgZUNKjiQWqB5JUiuAykfCtkUHC+xyCHzGnFHN
 E99h82+XJ4ruBVj0HBTl13bW8Y1kCO8lg5dLe7rGjFp6jBSln9pHD0tNe+GKpyH/QI8r
 +Y6Q==
X-Gm-Message-State: AOAM531AkBxfs0KjHC+YJm9W2+XdcHDHZibhs9mcFPl/Q62J6g5zsfo6
 9MMTSqqHOH0p6uw9C3NEH129bs4ppApXkQ==
X-Google-Smtp-Source: ABdhPJy6tzf1YDm+Rp7obeF/bzre5Z33/j3VuVDGLytBbxUzzrcRDJ0M6tUCZdd6pTstJo2k2o9dVA==
X-Received: by 2002:a17:90b:1bce:: with SMTP id
 oa14mr6850727pjb.191.1633636523625; 
 Thu, 07 Oct 2021 12:55:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/48] tcg/optimize: Split out fold_sub_to_neg
Date: Thu,  7 Oct 2021 12:54:43 -0700
Message-Id: <20211007195456.1168070-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though there is only one user, place this more complex
conversion into its own helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 84 ++++++++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1574954668..9d7b174443 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1191,7 +1191,15 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
 
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
@@ -1343,10 +1351,47 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
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
@@ -1480,41 +1525,6 @@ void tcg_optimize(TCGContext *s)
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
-                default:
-                    neg_op = INDEX_op_neg_vec;
-                    have_neg = tcg_can_emit_vec_op(neg_op, ctx.type, TCGOP_VECE(op)) > 0;
-                    break;
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


