Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A243D994
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:57:16 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvbP-0002Rq-QT
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMW-0004pB-3d
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMT-0003Pt-Fu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id 187so4548335pfc.10
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4b6zM17cF3RrWL3jUN3e39U/QFtejbDytYKYLpCpWYI=;
 b=tjqoQZ9zyL2GasSXl+4swKPfmx2rdpmXifVx7BqsudB9VcrdcDOeDfD+0ap+bRjd/X
 Mve+zwlRyQR2+ULiULS8xXS3/clw+YlYaijLfojubEX2p+4evDSKdBjezpLOy/zAQvg7
 dsiYAHwRWIT3JG+V+1nqSj03HeKil1I3HpghHUXzrcj1pUhkGl4aNtZnED4Gb3UPjhSl
 3rn0e+Q5MHqOJ/LLaDlqY2DHgIRa+a0Xi9xnmYoqyDEgog0RoJdpwQusxGuz9hOXI5zU
 OpwKutirCAF/H2aL6wAC8Dd32fZrIdopO6IEkPjuJF+t7QnfOZE20vSdxYaGgJtPwqiE
 GV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4b6zM17cF3RrWL3jUN3e39U/QFtejbDytYKYLpCpWYI=;
 b=4g0Z691zWn0mcKgRchoVsWbOZk8muzsLKXp4g6rISLLBX9MtGnArqakR0f7MWbjJE8
 hhu6I7VvuxPCeeM1f/jwm60e81appteZurwh9125BEPnot4C7Nf5oM3GBcGxRef0std7
 FVfpyI2U7ZhmphaRV3X3E7ciEBo06ydlqWT3GaN7jEsnxynGM/TkWNul9xrXmLjXeOjG
 Y6yVE5+IWOnI9fWRFk0z3o7hT900A4Vdga1xEvhSNiOpE0DJLqLNTdTLlNvuc6ERxGKz
 Vq1exjH/uUB+9qqgJF5b9Ytl06qREa5mXq4QRYQoqm+0U11EVG732adiV0Hw5r71U3uo
 362w==
X-Gm-Message-State: AOAM530l4oHANznvnkzcFZLZcT06hVNlZxlVYA4UauibAXmYKDXtSfCt
 nsJ7EqEriK6h0vPdPjQWaPMKI76sZUQZjw==
X-Google-Smtp-Source: ABdhPJyQLg4pd6cnXDG5d7SAuh4P/GT3Tl67QdA68lPnDJocl9f2UjjwTamRPLAhtOij0UifNQXCBw==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id
 c8-20020a056a000ac8b0290320a6bb880dmr1574998pfl.41.1635388906485; 
 Wed, 27 Oct 2021 19:41:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/56] tcg/optimize: Split out fold_setcond2
Date: Wed, 27 Oct 2021 19:40:56 -0700
Message-Id: <20211028024131.1492790-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reduce some code duplication by folding the NE and EQ cases.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 145 ++++++++++++++++++++++++-------------------------
 1 file changed, 72 insertions(+), 73 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5c3f8e8fcd..80e43deb8e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -854,6 +854,75 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
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
@@ -1653,79 +1722,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1813,6 +1809,9 @@ void tcg_optimize(TCGContext *s)
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


