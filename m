Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78743F654
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:54:37 +0200 (CEST)
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJuW-0001vG-3n
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaS-0004CS-UG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:52 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaQ-0007xw-Qw
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n18so6018617plc.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwLC3SIjtchiXP//8YOMxzaxe2iWQlOarPylhYlRTg4=;
 b=h8L84g00QwjgjZdoVee38DFClmBdaUrUTvnIApDQDjAJ3yTCGGAtXfBqceV+OU0w7v
 rdzHKJDBvj72k+hYTC7EJvddCqH7vBzc0ZR0xJ14tWkFU8MliyrCZt9VyQFXlXNcdT+a
 IcQIlLMLg9p0+44HM1tp3lloylUnv3bzq+3oNdUBnzNqAQUq2/G9MEseQUT10p9lYxIj
 whuHofraFDd6/0v/Nm+iBtrfVYON618anJPXus6g2zxnSlnARaPnyNTl1zLf2rdZkGp+
 QTk4Oa1U3zYHfXFp5fbRVSqie9T2sbZmNVTHh+GDGxVqb7qwvl70B7UjzGjeQ8qECdcp
 UDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwLC3SIjtchiXP//8YOMxzaxe2iWQlOarPylhYlRTg4=;
 b=QaHLgG9SB2/Tinm5r73vPaFMbtFjQ0eG88MEckQ3z7/Aw55zEQxFtpvJqVzRQpiVXk
 q6VE8y3AEV/HAEQv5O4+ZhDRYXOyd0y0XKPnT/+9eq92CjrdjzNuYZ4IYEtca57W3eJn
 55SXm2V+h2aaN38IYIW9Wz4KJpMvyteIU3XFmWKGWUfBMkVjn319nf3OFHoQJmeZYB/X
 O3lSsilMTaFogYzOiOM6GS5Ri06bLOrIQs/XFfV4Z+MujB9ZFMwgHtzocjth+oFjrZ9r
 CnXD+GHr4dbA6NN2Hwucda7M93IUKdWDyIpt7seX8WUV9Yj22NNJtIBMr4xGTinhd+wH
 ntJw==
X-Gm-Message-State: AOAM530AzgYqqL9jKYEGv8w+P4mTyZBLFuEom6Eiebf+Io20nCCodVX+
 pTF6i3ywFR8xxrNZmtTNU5s/SIQjp0fKmA==
X-Google-Smtp-Source: ABdhPJw1JHvEmpXSwsXOUeHUa3fgm+Bn6o7MMlyMgRHF7zXClvjuzAjHPddx1mUqmI8GFs4M2PegbA==
X-Received: by 2002:a17:902:ec8d:b0:140:2a5e:d224 with SMTP id
 x13-20020a170902ec8d00b001402a5ed224mr7730638plg.27.1635482029562; 
 Thu, 28 Oct 2021 21:33:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/60] tcg/optimize: Split out fold_brcond2
Date: Thu, 28 Oct 2021 21:32:51 -0700
Message-Id: <20211029043329.1518029-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Reduce some code duplication by folding the NE and EQ cases.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 159 +++++++++++++++++++++++++------------------------
 1 file changed, 81 insertions(+), 78 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 80e43deb8e..c9db14f1d0 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -714,6 +714,84 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_brcond2(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[4];
+    int i = do_constant_folding_cond2(&op->args[0], &op->args[2], cond);
+    TCGArg label = op->args[5];
+    int inv = 0;
+
+    if (i >= 0) {
+        goto do_brcond_const;
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
+            goto do_brcond_const;
+        case 1:
+            goto do_brcond_high;
+        }
+
+        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[1],
+                                     op->args[3], cond);
+        switch (i ^ inv) {
+        case 0:
+            goto do_brcond_const;
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
+    do_brcond_high:
+        op->opc = INDEX_op_brcond_i32;
+        op->args[0] = op->args[1];
+        op->args[1] = op->args[3];
+        op->args[2] = cond;
+        op->args[3] = label;
+        break;
+
+    do_brcond_const:
+        if (i == 0) {
+            tcg_op_remove(ctx->tcg, op);
+            return true;
+        }
+        op->opc = INDEX_op_br;
+        op->args[0] = label;
+        break;
+    }
+    return false;
+}
+
 static bool fold_call(OptContext *ctx, TCGOp *op)
 {
     TCGContext *s = ctx->tcg;
@@ -1644,84 +1722,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1737,6 +1737,9 @@ void tcg_optimize(TCGContext *s)
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


