Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682423FB159
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:47:08 +0200 (CEST)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb4V-0007qX-Cr
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajE-0003zq-CX
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajB-0007Wp-IU
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:08 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso9237800pjq.4
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=P94Y5dxSBpEMiLv8AoX01K+FSXvmiAd5JT5hA1ZV/Ms=;
 b=IFbaa++c9L1wLfJZCb1bFwUNy/NtQjGetF7oOOINx7K4ea2sklBqZ69UgsobSodBTz
 8Jaknr/FEko6S8PyZ86EglmWx1QxE0hORJ7fPW2ZxSdTllYPTdu29XYDFCrdP7TKpVDY
 qE1urRMiak/w1wABzy0QfJT3bTVZkxBjy3buCMqX7a6uiO6fNAwmfA8BT2PS6jxF0but
 vkVZUnEG1dt572LpEnWFwPR1BcWFtBIyr3CRF7nyjThxl3Jlw2+GoE6Z+hvxcaT10v/I
 SKjXuXYlEQHLP9/hSCjK7fxb9Ci8RRIMtTBuLWPWcELeolbaaX8QlNvkJlgjXcvjSyv6
 hiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P94Y5dxSBpEMiLv8AoX01K+FSXvmiAd5JT5hA1ZV/Ms=;
 b=iI0NV7T4L3UMCA1oc2pnpTXqKmv//+EuwjGtHJi2b+yq82uxP01ButVfxHO9Dbh7Eo
 HWNDEH9pu5DsTmGd9YKYnqmBY5Pad/eNposUtS3uuOth9B+EbYb3gKzIK6MfXMaAkCWS
 +aUYQ+xdwmOx7rkTE+XgjIwohkaXXUMeCoCHI7BiO+w1lVBYwXzZIA9tLHroj+KpII5s
 v9n0aLik1iEuX4HliudtNmg6RLJEYFhmWsENFWlTcM82kQdCWiV/EiLXjZnRR4pSFdSx
 dQFXBS63lvKx+jJw4sytmE/bW2frTBLws2LCeZJrP8i8jf3fwVoHo32WtFq23Gj0+amX
 TELg==
X-Gm-Message-State: AOAM532JGcVFCNGZJgcw5KhXg4sR7fEh8M9sbKtnnHfYPbDCMecy9oey
 hrWttDKUEJfG2XQSRhq6c4rPicpGUTJEWg==
X-Google-Smtp-Source: ABdhPJw4EmlyE+80BIqDAeqC3YKqK12HmcbfcPgHG4320/aX0kAQpRJijhVBrgD1cBqsXKF3OB34yw==
X-Received: by 2002:a17:902:7ed0:b0:138:d64c:7c4 with SMTP id
 p16-20020a1709027ed000b00138d64c07c4mr4553919plb.1.1630304704040; 
 Sun, 29 Aug 2021 23:25:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/48] tcg/optimize: Split out fold_brcond2
Date: Sun, 29 Aug 2021 23:24:20 -0700
Message-Id: <20210830062451.639572-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reduce some code duplication by folding the NE and EQ cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 161 +++++++++++++++++++++++++------------------------
 1 file changed, 83 insertions(+), 78 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 7de76b6de9..0ddeaf7e4f 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -714,6 +714,86 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_brcond2(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[4];
+    int i = do_constant_folding_cond2(&op->args[0], &op->args[2], cond);
+    TCGArg label = op->args[5];
+    int inv = 0;
+
+    if (i == 0) {
+        goto do_brcond_false;
+    } else if (i > 0) {
+        goto do_brcond_true;
+    }
+
+    switch (cond) {
+    case TCG_COND_LT:
+    case TCG_COND_GE:
+        /*
+         * Simplify LT/GE comparisons vs zero to a single compare
+         * vs the high word of the input.
+         */
+        if (arg_is_const(op->args[2]) && arg_info(op->args[2])->val == 0 &&
+            arg_is_const(op->args[3]) && arg_info(op->args[3])->val == 0) {
+            goto do_brcond_high;
+        }
+        break;
+
+    case TCG_COND_NE:
+        inv = 1;
+        QEMU_FALLTHROUGH;
+    case TCG_COND_EQ:
+        /*
+         * Simplify EQ/NE comparisons where one of the pairs
+         * can be simplified.
+         */
+        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[0],
+                                     op->args[2], cond);
+        switch (i ^ inv) {
+        case 0:
+            goto do_brcond_false;
+        case 1:
+            goto do_brcond_high;
+        }
+
+        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[1],
+                                     op->args[3], cond);
+        switch (i ^ inv) {
+        case 0:
+            goto do_brcond_false;
+        case 1:
+            op->opc = INDEX_op_brcond_i32;
+            op->args[1] = op->args[2];
+            op->args[2] = cond;
+            op->args[3] = label;
+            break;
+        }
+        break;
+
+    default:
+        break;
+
+    do_brcond_true:
+        op->opc = INDEX_op_br;
+        op->args[0] = label;
+        break;
+
+    do_brcond_high:
+        op->opc = INDEX_op_brcond_i32;
+        op->args[0] = op->args[1];
+        op->args[1] = op->args[3];
+        op->args[2] = cond;
+        op->args[3] = label;
+        break;
+    }
+    return false;
+
+ do_brcond_false:
+    tcg_op_remove(ctx->tcg, op);
+    return true;
+}
+
 static bool fold_call(OptContext *ctx, TCGOp *op)
 {
     TCGContext *s = ctx->tcg;
@@ -1629,84 +1709,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_brcond2_i32:
-            i = do_constant_folding_cond2(&op->args[0], &op->args[2],
-                                          op->args[4]);
-            if (i == 0) {
-            do_brcond_false:
-                tcg_op_remove(s, op);
-                continue;
-            }
-            if (i > 0) {
-            do_brcond_true:
-                op->opc = opc = INDEX_op_br;
-                op->args[0] = op->args[5];
-                break;
-            }
-            if ((op->args[4] == TCG_COND_LT || op->args[4] == TCG_COND_GE)
-                 && arg_is_const(op->args[2])
-                 && arg_info(op->args[2])->val == 0
-                 && arg_is_const(op->args[3])
-                 && arg_info(op->args[3])->val == 0) {
-                /* Simplify LT/GE comparisons vs zero to a single compare
-                   vs the high word of the input.  */
-            do_brcond_high:
-                op->opc = opc = INDEX_op_brcond_i32;
-                op->args[0] = op->args[1];
-                op->args[1] = op->args[3];
-                op->args[2] = op->args[4];
-                op->args[3] = op->args[5];
-                break;
-            }
-            if (op->args[4] == TCG_COND_EQ) {
-                /* Simplify EQ comparisons where one of the pairs
-                   can be simplified.  */
-                i = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                             op->args[0], op->args[2],
-                                             TCG_COND_EQ);
-                if (i == 0) {
-                    goto do_brcond_false;
-                } else if (i > 0) {
-                    goto do_brcond_high;
-                }
-                i = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                             op->args[1], op->args[3],
-                                             TCG_COND_EQ);
-                if (i == 0) {
-                    goto do_brcond_false;
-                } else if (i < 0) {
-                    break;
-                }
-            do_brcond_low:
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                op->opc = INDEX_op_brcond_i32;
-                op->args[1] = op->args[2];
-                op->args[2] = op->args[4];
-                op->args[3] = op->args[5];
-                break;
-            }
-            if (op->args[4] == TCG_COND_NE) {
-                /* Simplify NE comparisons where one of the pairs
-                   can be simplified.  */
-                i = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                             op->args[0], op->args[2],
-                                             TCG_COND_NE);
-                if (i == 0) {
-                    goto do_brcond_high;
-                } else if (i > 0) {
-                    goto do_brcond_true;
-                }
-                i = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                             op->args[1], op->args[3],
-                                             TCG_COND_NE);
-                if (i == 0) {
-                    goto do_brcond_low;
-                } else if (i > 0) {
-                    goto do_brcond_true;
-                }
-            }
-            break;
-
         default:
             break;
 
@@ -1722,6 +1724,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(andc):
             done = fold_andc(&ctx, op);
             break;
+        case INDEX_op_brcond2_i32:
+            done = fold_brcond2(&ctx, op);
+            break;
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
-- 
2.25.1


