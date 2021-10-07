Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DD425CF8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:09:59 +0200 (CEST)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZiH-0000kA-J0
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU2-0000MY-NS
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:16 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTz-0007C9-0x
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:14 -0400
Received: by mail-pf1-x42a.google.com with SMTP id s16so6285761pfk.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BeOygzL1rbJik2l6R84kwhGkxx7uBGOtHSBNQ+6+Wr8=;
 b=UmX5qVD5LnaDCOwicWT7h0VN7Y0AOEulXi+0oudS5iBwvKHCkQsHJiVkrG5I+z1wsj
 12TapG173KoWupwHFg7e/XqJNhQTcbhi0id9J4AMFa1B6RUMNP/ULi7Qi3Xblr9+Wg5x
 w6uOmfx+skyH1W8bZYeQe4kcvL8W0BU3CG2FEeY7/a9p+BBT4GGP3WDebvXxaBhSIKDG
 Kp+amTJwmr+VEII/ZPDCaDYk/SG4rxvyrIHO6Vt7Fc9YDuBYkiWEQKA5g4zIk3y9SMNf
 208Ua8bFFF3l8DGRo3bh5xr46tZVBlY1L3oGjXtlvcthEg75bWHqA68JtVHp1Ard2bVH
 +IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BeOygzL1rbJik2l6R84kwhGkxx7uBGOtHSBNQ+6+Wr8=;
 b=reO5LU5a5UnqjyuUlovF5EEG9/omcFZpm2Rl9iDUqT4VyNWwA0s/uwWkNzX7sY+zQ+
 xFnF2cEGFRu1EFUMBs0794igIl4FBAR+HzG9PW2rXuMDih+Ict6KithUoa13Ea6FtS2x
 2843Mtxsi3hWETn2f4XtOqtLH93k6FsoTgaKqBFebg2PbrAO7zYDWdlCpGZwntcn7yc6
 eA32rhngTA6Pplbad5RxAPrHiQdlB8bOfZZYgl0c9+Z5yb64sWpsy7gk2oCWAGV/gva9
 aZdpMGkRJXlQqOORnmrKLK9DYUmV6s6vWvSnHyQlLCvGbCq8UXOBrb4M9aZeKitqxYm2
 g+eg==
X-Gm-Message-State: AOAM532CfrPWVk3jdMIqDm3V63uOjfQHa2wx4cjSAJAXsxgql3kortlD
 fq6SwzqR7EOxsrtsJyern7sW7deDgYAjhA==
X-Google-Smtp-Source: ABdhPJyauFen4z1k3ZCaRktrRorpQ2yn3hv4r33UQ3DsWAbbFF1Lss8ehHtRKs2z/di29utXa7stTw==
X-Received: by 2002:aa7:8439:0:b0:44c:80da:fc39 with SMTP id
 q25-20020aa78439000000b0044c80dafc39mr6232411pfn.47.1633636509650; 
 Thu, 07 Oct 2021 12:55:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/48] tcg/optimize: Split out fold_setcond2
Date: Thu,  7 Oct 2021 12:54:24 -0700
Message-Id: <20211007195456.1168070-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 tcg/optimize.c | 145 ++++++++++++++++++++++++-------------------------
 1 file changed, 72 insertions(+), 73 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e66d935808..0eaa0127f3 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -839,6 +839,75 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_setcond2(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[5];
+    int i = do_constant_folding_cond2(&op->args[1], &op->args[3], cond);
+    int inv = 0;
+
+    if (i >= 0) {
+        goto do_setcond_const;
+    }
+
+    switch (cond) {
+    case TCG_COND_LT:
+    case TCG_COND_GE:
+        /*
+         * Simplify LT/GE comparisons vs zero to a single compare
+         * vs the high word of the input.
+         */
+        if (arg_is_const(op->args[3]) && arg_info(op->args[3])->val == 0 &&
+            arg_is_const(op->args[4]) && arg_info(op->args[4])->val == 0) {
+            goto do_setcond_high;
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
+        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[1],
+                                     op->args[3], cond);
+        switch (i ^ inv) {
+        case 0:
+            goto do_setcond_const;
+        case 1:
+            goto do_setcond_high;
+        }
+
+        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[2],
+                                     op->args[4], cond);
+        switch (i ^ inv) {
+        case 0:
+            goto do_setcond_const;
+        case 1:
+            op->args[2] = op->args[3];
+            op->args[3] = cond;
+            op->opc = INDEX_op_setcond_i32;
+            break;
+        }
+        break;
+
+    default:
+        break;
+
+    do_setcond_high:
+        op->args[1] = op->args[2];
+        op->args[2] = op->args[4];
+        op->args[3] = cond;
+        op->opc = INDEX_op_setcond_i32;
+        break;
+    }
+    return false;
+
+ do_setcond_const:
+    return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1638,79 +1707,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_setcond2_i32:
-            i = do_constant_folding_cond2(&op->args[1], &op->args[3],
-                                          op->args[5]);
-            if (i >= 0) {
-            do_setcond_const:
-                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
-                continue;
-            }
-            if ((op->args[5] == TCG_COND_LT || op->args[5] == TCG_COND_GE)
-                 && arg_is_const(op->args[3])
-                 && arg_info(op->args[3])->val == 0
-                 && arg_is_const(op->args[4])
-                 && arg_info(op->args[4])->val == 0) {
-                /* Simplify LT/GE comparisons vs zero to a single compare
-                   vs the high word of the input.  */
-            do_setcond_high:
-                reset_temp(op->args[0]);
-                arg_info(op->args[0])->z_mask = 1;
-                op->opc = INDEX_op_setcond_i32;
-                op->args[1] = op->args[2];
-                op->args[2] = op->args[4];
-                op->args[3] = op->args[5];
-                break;
-            }
-            if (op->args[5] == TCG_COND_EQ) {
-                /* Simplify EQ comparisons where one of the pairs
-                   can be simplified.  */
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[1], op->args[3],
-                                             TCG_COND_EQ);
-                if (i == 0) {
-                    goto do_setcond_const;
-                } else if (i > 0) {
-                    goto do_setcond_high;
-                }
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[2], op->args[4],
-                                             TCG_COND_EQ);
-                if (i == 0) {
-                    goto do_setcond_high;
-                } else if (i < 0) {
-                    break;
-                }
-            do_setcond_low:
-                reset_temp(op->args[0]);
-                arg_info(op->args[0])->z_mask = 1;
-                op->opc = INDEX_op_setcond_i32;
-                op->args[2] = op->args[3];
-                op->args[3] = op->args[5];
-                break;
-            }
-            if (op->args[5] == TCG_COND_NE) {
-                /* Simplify NE comparisons where one of the pairs
-                   can be simplified.  */
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[1], op->args[3],
-                                             TCG_COND_NE);
-                if (i == 0) {
-                    goto do_setcond_high;
-                } else if (i > 0) {
-                    goto do_setcond_const;
-                }
-                i = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                             op->args[2], op->args[4],
-                                             TCG_COND_NE);
-                if (i == 0) {
-                    goto do_setcond_low;
-                } else if (i > 0) {
-                    goto do_setcond_const;
-                }
-            }
-            break;
-
         default:
             break;
 
@@ -1796,6 +1792,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(shr):
             done = fold_shift(&ctx, op);
             break;
+        case INDEX_op_setcond2_i32:
+            done = fold_setcond2(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


