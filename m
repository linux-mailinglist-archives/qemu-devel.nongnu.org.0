Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84DA425CEE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:07:43 +0200 (CEST)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZg6-0005nB-G2
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000OF-5J
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:24 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU2-0007FM-Jq
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:20 -0400
Received: by mail-pf1-x429.google.com with SMTP id k26so6243832pfi.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X0u+P6N3QoO0mzhFL98YVpin8SoefjrzpBx/S+qocC4=;
 b=zuBS/4Y4IX/wxUq3h19pjt7LGY6VL9bX0WtLgvuK+BsHXhQ9egMRQGWu4bqqz4JUuv
 9HVMUq8EWPEBuM5jYrnjFyMMoX6juTzozMzf8Y57I+4vIAwxU3CMgKYnGikpfVVpvMaP
 suLYZ2/GxBHfdMRQQLNLAzoW5yx/zJsPJZOkJcleJNa1XAo4u9xl8CMQL2f3rmiCEDHT
 7ij2NePjCZERvhvor0Ka4QTHCklEeL7Fkxajsn3fYemFW02oONsryyxQwOdvi/ACvjVH
 M34OcedLsShN4rvi16f3GDQQ2ZShCaK5IpFL7/C7gvbYVc4sX+ZReMCamIA6VihvZVNO
 s+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0u+P6N3QoO0mzhFL98YVpin8SoefjrzpBx/S+qocC4=;
 b=C8cymJSdaZuX77UgcSyLozPu/L8KZUZJz0v6waoGLyiXQeqntnotWutvkUZBMEZmyG
 CvyVhu80oVVf6md4bBaqVSSs68AR233bwmHuIW8q7VXo/+e1CLejoPSZ0lC4KMjXOvlD
 K2BOS19DAn9Z3UDwkuh5HntHkJH9nbBpycKFjLnQRdPplsbSkJ7g8suW2AYu+iUeKhZp
 RzDd49eXeQ7Uu4ROmLuW3zRw25Qlx3lrp7pOPm/YxYRY3QEflg1bEmr+0ZwgOaRGHjQZ
 wGEMS846CYY7CTjgH/rf8i0irXo0X6EkYh1oCZsXLbA8wwURvxOu0749zuNPX5eYeAbt
 O4HA==
X-Gm-Message-State: AOAM5311Agj3UG5SjKheoQXWG0cnFEfwg3LHRzrLgX/ltFw9X57twphB
 HPbG7WbBziawCUdV6Xg98L9/N/mF+BcG4g==
X-Google-Smtp-Source: ABdhPJxmz86dYcEG/6gBqX43boDnQ/7V7WQ+tCfpNDDKiSKBkcK96hs+H0X+pjpW0WOe1//HPBnxfg==
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr4856409pfj.79.1633636513238; 
 Thu, 07 Oct 2021 12:55:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/48] tcg/optimize: Split out fold_addsub2_i32
Date: Thu,  7 Oct 2021 12:54:29 -0700
Message-Id: <20211007195456.1168070-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Add two additional helpers, fold_add2_i32 and fold_sub2_i32
which will not be simple wrappers forever.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 70 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 01a0925c89..1cec06aa81 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -704,6 +704,39 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
+        arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
+        uint32_t al = arg_info(op->args[2])->val;
+        uint32_t ah = arg_info(op->args[3])->val;
+        uint32_t bl = arg_info(op->args[4])->val;
+        uint32_t bh = arg_info(op->args[5])->val;
+        uint64_t a = ((uint64_t)ah << 32) | al;
+        uint64_t b = ((uint64_t)bh << 32) | bl;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        if (add) {
+            a += b;
+        } else {
+            a -= b;
+        }
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)a);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(a >> 32));
+        return true;
+    }
+    return false;
+}
+
+static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, true);
+}
+
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1043,6 +1076,11 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, false);
+}
+
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1688,32 +1726,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_add2_i32:
-        case INDEX_op_sub2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])
-                && arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
-                uint32_t al = arg_info(op->args[2])->val;
-                uint32_t ah = arg_info(op->args[3])->val;
-                uint32_t bl = arg_info(op->args[4])->val;
-                uint32_t bh = arg_info(op->args[5])->val;
-                uint64_t a = ((uint64_t)ah << 32) | al;
-                uint64_t b = ((uint64_t)bh << 32) | bl;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                if (opc == INDEX_op_add2_i32) {
-                    a += b;
-                } else {
-                    a -= b;
-                }
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(a >> 32));
-                continue;
-            }
-            break;
 
         default:
             break;
@@ -1724,6 +1736,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
+        case INDEX_op_add2_i32:
+            done = fold_add2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(and):
             done = fold_and(&ctx, op);
             break;
@@ -1818,6 +1833,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
+        case INDEX_op_sub2_i32:
+            done = fold_sub2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
-- 
2.25.1


