Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9011D436CA9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:29:54 +0200 (CEST)
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfdJ-00062V-G8
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGG-0007dp-PQ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:07 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGA-0004IU-1H
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:04 -0400
Received: by mail-pf1-x42f.google.com with SMTP id o133so1754302pfg.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=22jk084Ht2aDDriMLcF4JyJ4faz6WKunCCcyD0GHKRg=;
 b=bKhqNmXL60n4HFJCILoCOBbxjaK+YbtoeEI6pFTCI9l1xuBVNETaJnN/ALzNWxAByq
 wNmaIPSfxL+Lk1nSHWoasg/aJM6k0bEaKLzcCyec+CmsaGvhPT/xcmYrFPMyM6uIQ8rA
 LAoVO2OdyhJfajVpPmMM5FlJOUhiwePBD46mYo+yEfMI5heFDj2mjOhdLg5wsT8rjp/z
 SrrRNGaO8SiS0/gfRbxRYPAhX+tF9zUPSrR0ATMfy6zAfObumrYQ0whzX2zevVrnVHcJ
 VzJ9MhredxA729APannR5ln/YaUm4L5H4lPa+MPtX6ldU5pxotvpAKlo4kaXA7uSo5nH
 cBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=22jk084Ht2aDDriMLcF4JyJ4faz6WKunCCcyD0GHKRg=;
 b=Kiikr8n5ZDGoOawkE6LBqHarodVlqFt0jw6ylXEOroQv6mVRk+sGL6pdyACU8phpxK
 V0Smpr5ZOU535tn30yW5TOCmklQSQxo7Os5vuAGswM0D24v2OdtOh36wkfQ7SM6duLCw
 WH0RLktt7EmMD0sJCAaiHvI1LFJ3PHGyxVld3EJ0xR9BMxh6iEpqAaIp2JgxxGxNIO++
 W5YQPx0EBIQLMGSB4mqPss7QKxYLLymhbkFxPVwzCUyWpizvHqmv/LTOIljzCQM+qunB
 d3s4Q+JYJ5jZYs5o7ZbSKDZhvOkzaqiGNq7+JBVvnUdvf0sjX+B8QbSlbknDh28GyhM8
 o2Sg==
X-Gm-Message-State: AOAM5308HKQoussIG6f0bbsEA6fDlixJlIDGxhNsEW0O1qnsUcXqw/az
 52qsGcQ3RrFp9rCrF2B92Ai3j8qcnqM1pg==
X-Google-Smtp-Source: ABdhPJyXORwp8xKH8mHXQaxAUPQiZByrfC9zojCfq5mFYl5DUR6MzRjhrmkxQCRQqWsBj5yGDtSFYw==
X-Received: by 2002:a05:6a00:1681:b0:46f:6fc0:e515 with SMTP id
 k1-20020a056a00168100b0046f6fc0e515mr5557423pfc.11.1634850352969; 
 Thu, 21 Oct 2021 14:05:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/48] tcg/optimize: Split out fold_brcond2
Date: Thu, 21 Oct 2021 14:05:08 -0700
Message-Id: <20211021210539.825582-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reduce some code duplication by folding the NE and EQ cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 159 +++++++++++++++++++++++++------------------------
 1 file changed, 81 insertions(+), 78 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 0eaa0127f3..61a6221ad2 100644
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
@@ -1629,84 +1707,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1722,6 +1722,9 @@ void tcg_optimize(TCGContext *s)
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


