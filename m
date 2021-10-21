Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4457436C9A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:23:03 +0200 (CEST)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfWg-0000IY-Lp
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGD-0007WO-RR
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:01 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG8-0004I1-CK
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:01 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso1506320pjb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62+zPauvo8dmkFSo5HfqNH4WMNSWbCXPYmp4tePSarg=;
 b=Pnp3jfqKuJvVcsh6fumIa3ZNuYvxPRFASB2MnPJtiLdjhE0LjsiQ6F1uQUBizTc+1K
 RXsIVGzUYutvX+qISw4nCczZX+O0mwQQu6vhYH30y/L3jCGKdXHqNAYgftNbJgdl/i47
 L7ZLFQTtzCOPPw2UrFlL4pYNVbsHef6JNMBo+1nWAyrHdDEQR9BWOO06nOI7FxDJyyyQ
 PXivuA/oY571W+i7XFjO3IGgf4eNSfxSgri/UryZzOXnyFQys04QC0eQOZW7QTLb95MW
 hTG6FKcoWF4NNpdkl8NkzKTQOr9j5cbhUSwLVnXa2G/AcXD6lq1+W6jV3UL82EkXE1Rs
 0nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62+zPauvo8dmkFSo5HfqNH4WMNSWbCXPYmp4tePSarg=;
 b=4aOescmUNC92lyaY04JRTTDhV8CYLSYKFIbNZ+VNYgn1MZZt+CdleuoprhhWFyWc+y
 BxsD5zSUBXVrXpj+sZ6eNQ6cF3RAgjOp2h+kyBfeSSjHlPbHCm9M3UJUpbV0NNSTDwTU
 u92hsrTL+mVdTBpQLHWqg6x7LRfi3oluXN40uMGjZ/puFQ4SDPUATia0Pd126kikdnWM
 0vs2V8sEfnv+D9QKy0Ru0wDNh9ZEghpesuUk9hc365ro7g3ohLdQkF0E46nHeNJJRnQ1
 YItzZ9r6tQUf2SB06CSIEnfvolH61d3MsTaASxGhV82vwm3OBBHYyB3nNh2ItOMr2Si5
 g01w==
X-Gm-Message-State: AOAM533n8+A5HakAMY3E7N6Kgdy2PjdARsml9xDEPBrVo0ObTfSZkau6
 JfsCrlzsOLJHJArFf/wJsXiglV7e4Pg09w==
X-Google-Smtp-Source: ABdhPJxYFdXxIdQgbLR2eGsJ1lOyvTE4ztAfI9Lq6AZIW/ISb88iQd4kU9ImLUpoFR0H2b4Y3EaaKQ==
X-Received: by 2002:a17:902:8211:b0:13f:afe5:e4fb with SMTP id
 x17-20020a170902821100b0013fafe5e4fbmr7519389pln.20.1634850352295; 
 Thu, 21 Oct 2021 14:05:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/48] tcg/optimize: Split out fold_setcond2
Date: Thu, 21 Oct 2021 14:05:07 -0700
Message-Id: <20211021210539.825582-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Reduce some code duplication by folding the NE and EQ cases.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
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


