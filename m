Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EBE43BE09
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:42:42 +0200 (CEST)
Received: from localhost ([::1]:46184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfW5W-0005fU-MI
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdF-0008VS-NQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:26 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdD-00036K-B2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:25 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r2so1005048pgl.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bPCnbyip9ASVZYiN9ZYrSvAto4Yhq99OKGRmORXFwds=;
 b=YMkO+vtxtF1IatR26Yb7Xi5ofOOAvkZgTGXi5CoLcV6yoI52mIQlG+IyuDlcQeo5Ta
 YYZH/BMLrZaFI1e+pRyEsxtnZ9mrv4hyl+2oJm9tpYNTph1lPLoXv1Zh3nhMLveN5mev
 cXpX2RSxPntafKaD2yYz0077Kiszq+sezHEWYpXYoiXsvjdz9C7nX2L+f7+y92G1GMcB
 NqYWnImBwb1Ua/ljJHopzcYY5SEPGDw4a3ltEoUVGMr5FxLv3uHI+huDJUc+e0Q0w++A
 3ZffK+HHLcYkbpXbrTrwj/GPQsD/yK6UxQo9SI6LEMJ47vdS4uDWBg8fux9OQzfaDifx
 3gEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bPCnbyip9ASVZYiN9ZYrSvAto4Yhq99OKGRmORXFwds=;
 b=roOPHsoULW1nEOXs6n8D/ybp0ioqQjItE+Qw2b80/4rBVXRzAAa2Hy1NN5W7zWuZuO
 tZxVDXopFZraMqu7um+nJ7skIKNtrclAv8iU9VqrV/GnnFE5TdV9sLXchtzkqHarQ+tm
 oW7KxkLeP9ZeN6iGvtu7aF5Ti/jC6Ehk01klojSi/5DGMfygTqJ7HRh4JBWIOMZn2mxH
 +3BnXAYDmFwtXNV80pz/l2Kww35NhVLRvXOOPBoTEUDZVWbdMnHHE9NzfL2Ul41Bz9Ua
 PcdKUm4/BbZCXLUqysxSriWbOEmk8Cho4Z64DAM1MN/vFbBCeAnNaYLjRVbUjjKHCXvd
 ct0w==
X-Gm-Message-State: AOAM5331vPUtyly7vhtCANqg2cr6RdcLjCM0vK4KWZDeWa9bPo0Hsdm+
 RIa3dMFgaOp66Ijp7xaiXbEapXMMm9jzXw==
X-Google-Smtp-Source: ABdhPJwMuRW+xhuDNOW+n1UZ7wPmdWQD3F+6MDSABWF1rROPHsOR0RwQPY9PfP81m/fJCfsYHW+fSw==
X-Received: by 2002:aa7:8718:0:b0:47b:f2ca:2e59 with SMTP id
 b24-20020aa78718000000b0047bf2ca2e59mr15505149pfo.21.1635290002001; 
 Tue, 26 Oct 2021 16:13:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/51] tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
Date: Tue, 26 Oct 2021 16:09:32 -0700
Message-Id: <20211026230943.1225890-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Rename to fold_addsub2.
Use Int128 to implement the wider operation.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 65 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 7597655a43..6189637dd8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/int128.h"
 #include "tcg/tcg-op.h"
 #include "tcg-internal.h"
 
@@ -838,37 +839,59 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
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
@@ -1725,9 +1748,9 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_sub2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, false);
+    return fold_addsub2(ctx, op, false);
 }
 
 static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
@@ -1873,8 +1896,8 @@ void tcg_optimize(TCGContext *s)
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
@@ -2011,8 +2034,8 @@ void tcg_optimize(TCGContext *s)
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


