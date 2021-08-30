Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897AE3FB162
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:49:07 +0200 (CEST)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb6Q-00053T-H2
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajF-00044W-J8
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:09 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajD-0007YC-Vm
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:09 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so13129991pjb.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0dD5yz6Ow9JmpIBkAzWLptNYpU84K+Wyiw4/8TdlkO4=;
 b=LN9XlWEKu2R+oSzQ8YUGpYqOWFDyRqGhKTT8813PHX2gD9MiOcyqp5/MSxb1ipu+lj
 3it9XSQm1C33h3uEFSq06+UCMA+ajosnSTSKemMTorMJm/uv4TFgfFV22LfQwUrONJqz
 E69CSm4w1x7d88ErzVgnrtr2Uie0xTE9zxg/La6xb33N5PsiEbvjMP4zpu19U1aNknXF
 zy+4EA0UqoVn+oM2tMJmmXHTZsEwiM4F854IapDCwqKF6b6APlG7oHeeOZL3sNR0TJIM
 Q5UL9VWIO+n4oeay6srN+fv2vP3skUgUPvgPryG1kN4PsytFrdLs9/9RWJJ7Xvcw64+W
 Yn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dD5yz6Ow9JmpIBkAzWLptNYpU84K+Wyiw4/8TdlkO4=;
 b=f/zthnavx4yhEIigoPGHKvu83sEFcQN+CFMnt3FRiW8ZjTty7DAGaCU0jDMU8Qng+U
 69Es1kny4ndDCfdfWQyPTGfb68jrCuD60YSWHd4t5/5Q5D8ypAdu+wiHLoNlbC7OFjSh
 gAmXd/+v0f8j+YX2a8BhTrbqByYHoyueKwA6SkEhU7WlsWu9WsLHw7dUYtO+esW9jUY5
 MqlIy2rLGhFk495oS+V5KJ8eDYjqfnxcU6AP8vmpoA1DYJKqLlXMPx8GJGNTE5n9gQua
 rmaa4yXRPP0k0lVFqr1WyhtiQKncNi0qOZzwdcww72tFgxiKTSSa9K8JsTbameH/yTfk
 2aRA==
X-Gm-Message-State: AOAM533dlKDrj9Uscr+H15xwbFWlLj4tlp+5Uw6J0Bh6Tlii3xorZ9sI
 ycIm8EO6acI0+UespbsOMq024cUCeNEZyw==
X-Google-Smtp-Source: ABdhPJwtGLYjrzqlo4RJLEKyOJhTxf+0Wb21wsv5bq0pkh70n7NtxEfHd/ExyQUjiVCo83iIRJk18Q==
X-Received: by 2002:a17:90a:ae12:: with SMTP id
 t18mr13137106pjq.211.1630304706700; 
 Sun, 29 Aug 2021 23:25:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/48] tcg/optimize: Split out fold_addsub2_i32
Date: Sun, 29 Aug 2021 23:24:24 -0700
Message-Id: <20210830062451.639572-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index dbe283cedb..b72fe6e847 100644
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


