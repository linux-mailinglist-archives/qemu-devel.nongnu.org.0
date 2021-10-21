Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39430436CFA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:45:13 +0200 (CEST)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfs8-00076Y-3u
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGQ-0007jj-89
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:14 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGK-0004ih-Vd
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:12 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j190so1454102pgd.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8qSSp1O3nQ4Zrbf5HQygFzBwx3etjTYPekNRv8Tm6Mg=;
 b=G9xeefDj1ry8nYF2hRSuGrG1lGO0pNGRnmDavqHABfrY5EskdqDt2R0TOPNoLtdN7N
 DFKhChbdv6Yr03x3Lu6e5h89e3Ejit+n95Ygk3XMRlcTFlcBhIJpDbBHsYtcBQnwWHUc
 EDxrv8a/H6O4DWPzBlyYI6OHa1ksx1u6CtijCz1wSpG7R73Y63LBAd+3wl4YQinGjWM2
 1R0N/ASN4QBGZpvfroxDnjyr705bqgRMnTxQRrK2kRmVVJyh1aYFvSZtvfHBIogjZzl5
 ZgPTb5bnBq2TUV9AAbNgmLFZFOzb9iUWLftr9OWP5Ik0wxfRiMUJ0cjkSAgdKCdsZlTa
 q53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8qSSp1O3nQ4Zrbf5HQygFzBwx3etjTYPekNRv8Tm6Mg=;
 b=bK8NVafWmZxBBFi/QNZCvU07rxqXi4Ax6rUXkYyWOWJJmBtuph0Q9GNgOde/6Q6tfs
 igG/HeSG2DUptF314zEgwQF5Q8kaT9Vhfe4vgUP8IFKOVPjtMFw2Pyv9EQmYoF03TWi5
 8XbfWqTTTG0zZPZULOUTeNIJxYZBfUk/v3KQgruZ+sOJfVUddYJmu+FGLeKS9jLVIAJZ
 SMH7YdwOD2hY846ZKlQ7zQsAze1Rgo4hPBFquoj8sicB4CAF0e/fArtivIqSKAm7+NPP
 7jyW9Aa5dxppj5uw148Vayj/32qvolawROy77Tcu8n2yxL75npYZwUZTq5uvzeQ2eIwH
 tTrg==
X-Gm-Message-State: AOAM530ammZBk9n1WWbxFcnToLH6+nuJ9CDpSN0uBunuyb7pHCGTns71
 2G9dJvLfPo9Nb5jgrUMfLGqtHYuEzhHfUw==
X-Google-Smtp-Source: ABdhPJzF8XwMbm/kue1LaxbXy6A9hN5VT8VhCnnQ/wPL78I6EdToy/ycfw3APiDqpRWOGFMnRpJXiQ==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id
 c6-20020a056a000ac6b0290374a33b0a74mr8529426pfl.51.1634850366620; 
 Thu, 21 Oct 2021 14:06:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/48] tcg/optimize: Split out fold_sub_to_neg
Date: Thu, 21 Oct 2021 14:05:26 -0700
Message-Id: <20211021210539.825582-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though there is only one user, place this more complex
conversion into its own helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 84 ++++++++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 71b4c3edb4..e4cf746321 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1189,7 +1189,15 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
 
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
@@ -1341,10 +1349,47 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
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
@@ -1478,41 +1523,6 @@ void tcg_optimize(TCGContext *s)
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


