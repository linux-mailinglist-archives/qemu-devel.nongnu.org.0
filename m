Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357AB3FB174
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:55:59 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbCz-0008CP-7z
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajR-0004Te-87
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajP-0007iU-1Z
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:20 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 mj9-20020a17090b368900b001965618d019so2981621pjb.4
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yfpZ/fdkPfR6dqyP4UUc4G6qa/1YFyufh1SETcM1ayE=;
 b=isNYICw+VDadWzuZfgUV4Zv445sRHS7VeO//04wzSvAeopnB82jGOhawTwUr8MVT91
 6PfKr+UWqUJiSaw2XLdF+b5QEBDpXNt/yzAqE4D2rqjWba0xrENyQNEMNn9s/NBcOyel
 eigZb7RlsXw5zmqVxVEOodHM9tKheLXNRZsEbmCcIjjWKv8a+1ihc2z8ma57IbZTMdlg
 mIWOHslmzkb8R0RR6Lpl10boNVW0aXSsmfPHj3lNmob2E58yDdGDsmpqB3CBTEP+hxKH
 3DrPDHkVTOfAwMJBFPh15ViDKnL5Q4W+JjA08EO6knUexIuKDySrdxmLvj1ZLU1HqXSt
 QU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yfpZ/fdkPfR6dqyP4UUc4G6qa/1YFyufh1SETcM1ayE=;
 b=HKsyMq5Ls67uMAtyrw/earq1fg5LYLAVmRhUG3TPk8CjQo5kupzBIHosgBmEzORb/N
 fvsRBPDBehgj8L2sMqvQ03UYGCEMb2eIMf6ulTBaQAM7riY72qFsQYvg5rRwtsneoJqC
 n4M3I9qSc4llu08jMziY4XjVseEdh038xcnHx7zsACIC6PP2GIQIumH/3uNsELpCB4Oe
 vqYh6ptW3ZrPHQIZNPyUQCLhCcO4i5ncW8FX7aazbM1wXUrphrreXRvcLINYEByegsx4
 9S8O+TtXWaSVIhzJDwF4tu/Uby97hzRLdpXih4XASUIi+FcZXB9qrbtw077Qz/g8c7eM
 Nykg==
X-Gm-Message-State: AOAM533/KSmp4v3djJMRiFUoWApqv0QBnqrm4VgBYh900elh+GKTPf3Z
 iDSQu5dE0wwGYlLkkECDgM7upCJ91+MVZg==
X-Google-Smtp-Source: ABdhPJzT9/lBRaDgMU78DpII0KdhparPWnQ0dU2/zZbPObqWZvnO9PePgAYLp5bRThiIJetmuMnbmA==
X-Received: by 2002:a17:90a:8905:: with SMTP id
 u5mr24801677pjn.95.1630304717924; 
 Sun, 29 Aug 2021 23:25:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/48] tcg/optimize: Expand fold_mulu2_i32 to all 4-arg
 multiplies
Date: Sun, 29 Aug 2021 23:24:42 -0700
Message-Id: <20210830062451.639572-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to fold_multiply2, and handle muls2_i32, mulu2_i64,
and muls2_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 735eec6462..ae464339b4 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1392,19 +1392,44 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_multiply2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
-        uint32_t a = arg_info(op->args[2])->val;
-        uint32_t b = arg_info(op->args[3])->val;
-        uint64_t r = (uint64_t)a * b;
+        uint64_t a = arg_info(op->args[2])->val;
+        uint64_t b = arg_info(op->args[3])->val;
+        uint64_t h, l;
         TCGArg rl, rh;
-        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+        TCGOp *op2;
+
+        switch (op->opc) {
+        case INDEX_op_mulu2_i32:
+            l = (uint64_t)(uint32_t)a * (uint32_t)b;
+            h = (int32_t)(l >> 32);
+            l = (int32_t)l;
+            break;
+        case INDEX_op_muls2_i32:
+            l = (int64_t)(int32_t)a * (int32_t)b;
+            h = l >> 32;
+            l = (int32_t)l;
+            break;
+        case INDEX_op_mulu2_i64:
+            mulu64(&l, &h, a, b);
+            break;
+        case INDEX_op_muls2_i64:
+            muls64(&l, &h, a, b);
+            break;
+        default:
+            g_assert_not_reached();
+        }
 
         rl = op->args[0];
         rh = op->args[1];
-        tcg_opt_gen_movi(ctx, op, rl, (int32_t)r);
-        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(r >> 32));
+
+        /* The proper opcode is supplied by tcg_opt_gen_mov. */
+        op2 = tcg_op_insert_before(ctx->tcg, op, 0);
+
+        tcg_opt_gen_movi(ctx, op, rl, l);
+        tcg_opt_gen_movi(ctx, op2, rh, h);
         return true;
     }
     return false;
@@ -1904,8 +1929,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_multiply(&ctx, op);
             break;
-        case INDEX_op_mulu2_i32:
-            done = fold_mulu2_i32(&ctx, op);
+        CASE_OP_32_64(muls2):
+        CASE_OP_32_64(mulu2):
+            done = fold_multiply2(&ctx, op);
             break;
         CASE_OP_32_64(nand):
             done = fold_nand(&ctx, op);
-- 
2.25.1


