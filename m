Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82E43BDCE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:23:55 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVnO-0003gR-Hw
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa3-0002zp-BU
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:07 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZz-0001y2-7K
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:07 -0400
Received: by mail-pf1-x431.google.com with SMTP id a26so869734pfr.11
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwLC3SIjtchiXP//8YOMxzaxe2iWQlOarPylhYlRTg4=;
 b=RkYy9Jj7zaqXS+PVurc6xwhGiWKpAPiFvIVVTKeB9rKWgjiAul4MsSYg0AkIthJVrg
 gbwS2XrWm30PJ8RpvlfTMNri4gjDMrpKVBRJ4PNqRsBrVSE73Bt3T7bvk1c56m1yEcGg
 SifuoqyNf96RrTJtNOEuJ48FQT8C0lKtUTqJEzL1L2F+03ie1Nikc0qMsa67POavUXH+
 Z/HdeDLwdmBiwMytjWaFdCsoCyEt2Ys97RqUgmXBjBsZiJeDHs3i7iw2gcMYO1oFAkeM
 kPSQ7JvXw2LXRORSuO+S8GHJScDC1BwPNma0aLeqb03xV505GIKr5RKJe8+DwjYZQiwF
 0v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwLC3SIjtchiXP//8YOMxzaxe2iWQlOarPylhYlRTg4=;
 b=6baN19bxp+91Rk6/VVBDFPybS+8KK0f94sq8RiNTGAHjoWuP78nCOu/Hrsu7Mp6Rq6
 9cOfrQUwfLlpPz6qYkkTvF0yTTyoBSwPLOaJYGGz9HhsPyc8tTCngRg7/cO9RPPlp3J5
 kpbFnuH2EiufzzyqEX2FfIHwP2+Ly9hkkT62jP2wIjA9O0RpNEXU042V/SlWgc74ZKx2
 yJEdqQU3a8NZtLeE7eV9rB02FyMLZi48QYfwKRJzghiohDiVL1Y0/hUqd06+knVM+25c
 Oe3PUab8srCetGdOFjwGIRX+Ypqna17JgYXtdqpI+3sn+//AlKn+jpd1P9AWSTK15gr/
 daNQ==
X-Gm-Message-State: AOAM532AZFrNTmk77uogVx1ObKevHU1Yicoj885IoulGdppTjwzJXHk9
 brcD47wTirg/vtnYCrdh9ODEgqZi4j986g==
X-Google-Smtp-Source: ABdhPJw7faS1drL2Metv45DI8UNo7l/z+Ua/0LYiHT6e4x9QEWeZmJdwGroRO+EwN5UI0pP3qYUrJw==
X-Received: by 2002:a05:6a00:22c1:b0:47c:28f5:7b9c with SMTP id
 f1-20020a056a0022c100b0047c28f57b9cmr1379387pfj.80.1635289799833; 
 Tue, 26 Oct 2021 16:09:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/51] tcg/optimize: Split out fold_brcond2
Date: Tue, 26 Oct 2021 16:09:09 -0700
Message-Id: <20211026230943.1225890-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
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


