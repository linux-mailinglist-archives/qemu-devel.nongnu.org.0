Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B793FB19B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:08:54 +0200 (CEST)
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbPU-0003px-9U
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamO-0003BR-6I
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamK-0001n3-Aq
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so13106836pjr.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x5jnWfhN/K9yOEcW83E9baXKTpTAHwPLi+iPqdmm7II=;
 b=TrB12MssT84swJMXb24XpVu+YGX1Pj7fj1ATmhGcYcS2ZWojtoANi2bsoTuYeFqTa/
 UEA1Ly/nYazZ2W5OkqobMGFNk/bsr2SksVMWP+ttWygnuLxkBxN7gND/73wpbb7CniTS
 HbD8WyeQNBpdMqci99sEIdHy7X4ryHtDBhIJQTxsyUIVONtcQEJ3/j/E7WEzox1W5lG/
 EoGerUlknVMnuJhyfpk9WigGFxnxBmNl7BOI5jgc64m9og8hq8UlRwPt/ZHK1sTf/Gvg
 v4dSXyvKxThmU3k1qa+vURL6AT6bC97k/CrS7nj6hcE06s9Fhg4ca+ZfzWCELwXLwhLu
 SkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x5jnWfhN/K9yOEcW83E9baXKTpTAHwPLi+iPqdmm7II=;
 b=iY4l1M7ZxC8twalfMrmyofm/D3eABsR8ID3GM0gWK9JFEKJgsQWviXnGuUigF+Zq33
 2C5aeNoTIswqmVDgOejTT8SmPBzNbJ+IOY58UNSmqtkqRWoFD8IIyG+CHqHP55+acHed
 A5RaWYEg15o55+YnYWP3AAM7Gc16UK8VL6ryQTpTcv7UwmuJkT2Gffw9/2QVd0lhJ8cL
 esJAA6x2Ks2QGfKH8LH7I4pVExJOBnM8m/0WxDgYluy650uLkwUKexGYnOzgs4AD7MCr
 oaD6aBDDbgYCuwJMIFBv18zFZuDr5nVlR8QZVgfkdIj6lOlAPK9dZ+RKncaxhpTJaOQQ
 bdog==
X-Gm-Message-State: AOAM532wEcMR8dL9EPQj2C3Xf5+F0PCL/XO1srh4MiD1RGsjIJwh+y81
 E1VbsXOus0m75b0khY51tIs8q7m9J9HDvw==
X-Google-Smtp-Source: ABdhPJwijg8GG7/wzWb72lOeB0Ztaw/nvz1B/ZsEDnFQJW+J8ycWNHxpuvZHAFWXlmFR5I88rth58A==
X-Received: by 2002:a17:90a:49cb:: with SMTP id
 l11mr18478783pjm.142.1630304899027; 
 Sun, 29 Aug 2021 23:28:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/48] tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
Date: Sun, 29 Aug 2021 23:24:43 -0700
Message-Id: <20210830062451.639572-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Rename to fold_addsub2.
Use Int128 to implement the wider operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 64 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ae464339b4..ba1e5631c3 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -838,37 +838,59 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
+static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 {
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
         arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
-        uint32_t al = arg_info(op->args[2])->val;
-        uint32_t ah = arg_info(op->args[3])->val;
-        uint32_t bl = arg_info(op->args[4])->val;
-        uint32_t bh = arg_info(op->args[5])->val;
-        uint64_t a = ((uint64_t)ah << 32) | al;
-        uint64_t b = ((uint64_t)bh << 32) | bl;
+        uint64_t al = arg_info(op->args[2])->val;
+        uint64_t ah = arg_info(op->args[3])->val;
+        uint64_t bl = arg_info(op->args[4])->val;
+        uint64_t bh = arg_info(op->args[5])->val;
         TCGArg rl, rh;
-        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+        TCGOp *op2;
 
-        if (add) {
-            a += b;
+        if (ctx->type == TCG_TYPE_I32) {
+            uint64_t a = deposit64(al, 32, 32, ah);
+            uint64_t b = deposit64(bl, 32, 32, bh);
+
+            if (add) {
+                a += b;
+            } else {
+                a -= b;
+            }
+
+            al = sextract64(a, 0, 32);
+            ah = sextract64(a, 32, 32);
         } else {
-            a -= b;
+            Int128 a = int128_make128(al, ah);
+            Int128 b = int128_make128(bl, bh);
+
+            if (add) {
+                a = int128_add(a, b);
+            } else {
+                a = int128_sub(a, b);
+            }
+
+            al = int128_getlo(a);
+            ah = int128_gethi(a);
         }
 
         rl = op->args[0];
         rh = op->args[1];
-        tcg_opt_gen_movi(ctx, op, rl, (int32_t)a);
-        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(a >> 32));
+
+        /* The proper opcode is supplied by tcg_opt_gen_mov. */
+        op2 = tcg_op_insert_before(ctx->tcg, op, 0);
+
+        tcg_opt_gen_movi(ctx, op, rl, al);
+        tcg_opt_gen_movi(ctx, op2, rh, ah);
         return true;
     }
     return false;
 }
 
-static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_add2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, true);
+    return fold_addsub2(ctx, op, true);
 }
 
 static bool fold_and(OptContext *ctx, TCGOp *op)
@@ -1699,9 +1721,9 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_sub2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, false);
+    return fold_addsub2(ctx, op, false);
 }
 
 static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
@@ -1847,8 +1869,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
-        case INDEX_op_add2_i32:
-            done = fold_add2_i32(&ctx, op);
+        CASE_OP_32_64(add2):
+            done = fold_add2(&ctx, op);
             break;
         CASE_OP_32_64_VEC(and):
             done = fold_and(&ctx, op);
@@ -1983,8 +2005,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-        case INDEX_op_sub2_i32:
-            done = fold_sub2_i32(&ctx, op);
+        CASE_OP_32_64(sub2):
+            done = fold_sub2(&ctx, op);
             break;
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
-- 
2.25.1


