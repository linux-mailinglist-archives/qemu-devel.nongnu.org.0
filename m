Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA00425D05
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:13:49 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZm0-00071d-5b
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXE-0007Ux-9t
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXB-0003ov-BB
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:31 -0400
Received: by mail-pj1-x1035.google.com with SMTP id on6so5709499pjb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXYOXdBBhu+PFiEaUei1HZkdWwxN5pXliAXyOtaR620=;
 b=H+oxasSvNkKSEj6plXgulPfArKjXZubKZiJeqM5E9JrlGP0LhAgAmuKhQimDtwEGuk
 kTcS0Eo6mAfifuh/U2UAmO5sWATTfmzVXxemHVpA+njgfiniZOZXpn+W8xJ5A0Ah8Xgc
 VCfby6N5UOqfGB6R5VRf7I6I1k7SqZqMQ/HhlFuC3LwDrnmlsJdHJMkcIwoS+DeGhU8u
 7xexGCb+BIN9GqXLCZecivC16IN4O//5ZlnFmPV06MUi9X3Pb+1IzTl7/Wh09qL8AjhP
 ic0PXDXtP6gKRnNYzDgnNVEAepirDGGGHFqoxV4FgladWxEBd5Np1Nv8Omu0UwXIxtp4
 TrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXYOXdBBhu+PFiEaUei1HZkdWwxN5pXliAXyOtaR620=;
 b=Y00vaVjTBPCvtoYlDqnoPNg1UxleRWyjZZxU1cClQ/WqYMQU8jaltF/26twVo2cNca
 NepVwGK5P7f1ziDpCxbvlD38434gMcJI4baVIzMiQ5og2pXqV/YFzSd2Gbzzbaw23V+Y
 p1kFmp+ypRXHHgqiNc7tuqkg8Mq1/I5oV0thDnKfQl6Ph1XlonOeJt55PZAtnX0XaO7M
 a5etazuD7Y/kBNKHGQgxSc9EasfmpeWo9CffXrWwIESxJn3C7pebopPFB1NDDUsBUxBj
 okvsZdJiAUKksl+WhVh9QcWHKMdFv87jbBc/iy4M7Ykb95sw+oEIq2wZ10ZQPPFmCrza
 EzQA==
X-Gm-Message-State: AOAM533zFjc5YPeh1/BKS/6IV7jBxlOETk3YYYbRXVDXHji5QVjuRsX7
 /Cslio/znsUEn0k+WaeFdd8LCCVAc+uvPQ==
X-Google-Smtp-Source: ABdhPJxoaNXiXYnchzCsp32XBxokkinDfG2qMt1bsOEGOfrCf8Y9/MXw5NNO12a89t3kMOvN/gX0BA==
X-Received: by 2002:a17:90b:3782:: with SMTP id
 mz2mr7727606pjb.160.1633636707730; 
 Thu, 07 Oct 2021 12:58:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/48] tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
Date: Thu,  7 Oct 2021 12:54:48 -0700
Message-Id: <20211007195456.1168070-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to fold_addsub2.
Use Int128 to implement the wider operation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 64 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 0011ac31ec..5e662ad8f7 100644
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
@@ -1707,9 +1729,9 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_sub2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, false);
+    return fold_addsub2(ctx, op, false);
 }
 
 static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
@@ -1855,8 +1877,8 @@ void tcg_optimize(TCGContext *s)
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
@@ -1991,8 +2013,8 @@ void tcg_optimize(TCGContext *s)
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


