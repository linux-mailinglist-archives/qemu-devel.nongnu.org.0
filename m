Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BFC43BDDC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:28:01 +0200 (CEST)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVrL-0002tj-0S
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaK-0003Rm-31
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:24 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaD-00023d-L8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso3550759pjm.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGhVKVJSDxY3HmMJpb1bjuDxl1XBH/ImqPdvrbNQikQ=;
 b=l1og1Z6nPaVBU96SSlW5jEQKSVxtlfL04YvGW3A6EFpCJ/tgxRG2tXzTfv+WhP/d1L
 WSWbhhOk4Lqwoz9gP4Vevsf+VAKByIPpFkDstylV1azOaM4BZzOz/8S4Kmp3hS7gTyIa
 mhzJOnovWrEDgX9Gw7Epkv3ZqTJ4RNUGZd2+zkdZhIOdXASOd5Qc9q2m1lYp6UciPGL5
 mofVbUqoOAdTiXD23LQV9qLY0gleb++dnM86VlGSPyLrF0CV07iZEgYMQQzd/kF3KmOv
 DQfikaanE9G36zfVvsWQS2SwKJxRR4dM9Vud3Dpjlawhi3EEziKhtsvGvdMjM7saA1uh
 t7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGhVKVJSDxY3HmMJpb1bjuDxl1XBH/ImqPdvrbNQikQ=;
 b=08LHRZd2eXDNrg8HyGCKjWft1O4YU9TKiWhg+UJWZERoZmCpFkVIk+gycqQ5IBaG2n
 pQxbyyr4gqktSKHJ6TcoEwYUN5asRmstnG77zQirYvqWK+IcjfcO1v8eq1jQ//zhRHD9
 LxBbS8afiAu0NBfphCZt2Scp1rDRFA8Np7Vt+i3hEWkTEBAWiSFhSqxgRhxQKAitajX8
 wOQrwWcBkXgoJjCTEx5907wA+1yP+EMHOxAEPLCwBc/ZTWn1JGxSdLFq/agVBqpZmx/V
 LgVoddTwhmUgwJoR8OImrVWhqLxeh2km+mcXHyREzGJkUITefbManyeAY6etTJXuJI1s
 DUHQ==
X-Gm-Message-State: AOAM531DnfgFJijXkzt5uJXlFJZOjx4xYEzOuCLACZgamXGoIyJ5ixKg
 NRTthUP/Mx+0XMy/Au9pTDmM6cK9vOFFAA==
X-Google-Smtp-Source: ABdhPJzxiKHdNfj5G4qAU+labWmrDgU+bnohrHzgvu18svZjA96JruKXe+meXExAKlSRbx0OXaM2bw==
X-Received: by 2002:a17:902:868c:b0:140:f6f:8a10 with SMTP id
 g12-20020a170902868c00b001400f6f8a10mr24821374plo.77.1635289816314; 
 Tue, 26 Oct 2021 16:10:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/51] tcg/optimize: Split out fold_sub_to_neg
Date: Tue, 26 Oct 2021 16:09:27 -0700
Message-Id: <20211026230943.1225890-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
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


