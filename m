Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B811B43D98F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:53:53 +0200 (CEST)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvY8-0005FU-Gt
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMU-0004mh-A8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:50 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMS-0003U6-Jy
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:49 -0400
Received: by mail-pj1-x1030.google.com with SMTP id np13so3564145pjb.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwLC3SIjtchiXP//8YOMxzaxe2iWQlOarPylhYlRTg4=;
 b=If4nJ+GAxXCODPYh/oAV0AsMZkNaGJU0C7YGyRH9pbyt/Y8p2Y5bNxm5+zkkvS9CTh
 MM2Da7+WFKtALpUrvvp/8CmePHZMahimGE2MFJOBJVxnJhMk97URDREOA9itu2MoQJoH
 Fhj8Hey9CXutqPmzk2OuRHcPltxC4t5k6LKfj2sJe9gEbsk9ESp7ISrICO8UtgWTJ3DX
 tJjPFUjShCi4y/2ZNXuBp0GrESjFv8ETG5tA5JowXDelhZy5adRlf5GkLInah6HwyyiK
 ksU32qGk83LsP9C6qgi7HR34xV1PnM6NigE6BFinqPYf4fytEDiT9YRf7pucKLx2uPT7
 qSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwLC3SIjtchiXP//8YOMxzaxe2iWQlOarPylhYlRTg4=;
 b=ZwAaOPMAAzE+t/behVP7siLmrcYXAj3PumvqtFwwwVuTgdk1T9WUamL8ABxwiMz/9a
 hJab0jlAMF18tGgm+8E4+aT/e6I2YrLCNj6/UfqyXasCLtH99W+AHWBV9YFDDPyS1xgw
 wEUsJzPVRp45VB5k+WuVSX+f4BRqKRhFhiWXm9A7K2McuJl5nj9yL06Tbq180af513rE
 BQ1P6cNhqH6gvjsiiYO2ItrpBhl9x8RP7FDRKCjhO0CdtClSt4hjXN6b2YEUDgXRgqlI
 r80bosySPD+MfcMI2gKnFUQTtywxt8ixTU2h9QNTHvnVFLi47U3CeN4oUL+Zlnb/aAIC
 ahzg==
X-Gm-Message-State: AOAM533K/GNcdSgbO4q+da9u7+hMpXx7QAp8psELjaoBIEeOj8c5zm82
 cSxupUl/Ii0n/Pstnxj3Mmc154e/s/d6gg==
X-Google-Smtp-Source: ABdhPJxLvMxP1nBsEJR0xykXLwwPXdLB3Gj1qOdJp1Ce2qwn5XwNMYM1q6fepNIP5Cpl6o9VB/Ngeg==
X-Received: by 2002:a17:90b:4f8c:: with SMTP id
 qe12mr1531183pjb.237.1635388907315; 
 Wed, 27 Oct 2021 19:41:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/56] tcg/optimize: Split out fold_brcond2
Date: Wed, 27 Oct 2021 19:40:57 -0700
Message-Id: <20211028024131.1492790-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


