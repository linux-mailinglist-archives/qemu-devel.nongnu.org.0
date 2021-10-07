Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF4425DB4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:38:51 +0200 (CEST)
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaAE-0007PX-Gc
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXG-0007W3-KY
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:36 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXD-0003qT-TA
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so7734449pjc.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dnSe3962IT7WFzPUDJo4zPb5duwUCMvhH1e2c+XS9Mk=;
 b=ShOu3QrH35Lawj7HcuhharPGWvR/bjeGjoB83bbcteaRpP9MUk3tUsWFiwXe3cCuI2
 Pby53dEAfAscTnYLLhYlUDypz9rAFsbbSafJDqTtlitJ5R7MLTSQEkrvjZkKeZ4vTdy0
 +F5ZZLX9ARB7MBjqUcjcCOlEj6UetxhQHyb0dXE/WigfQv3P4Eg/6ctpKJm4ADS8S93j
 7fgyaGv6X8HgrUHA/iCuN9l4z4iHk/ZzU9YWEnCkvZ/xw0xZfc1SgXtja0hLuWq1C+hG
 6AgrhizXb87JOCavWu0GCV8HaTTlPir6qRWGiexqGauectNklluof8im8gK3ySP9T4AI
 s1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnSe3962IT7WFzPUDJo4zPb5duwUCMvhH1e2c+XS9Mk=;
 b=PgWnZtUqem/nswD4ZT0+8TLraozZbuDz/R4nLMIFfuJf5ITe+eBN0WqkLUMIevBvwC
 emiOoqFTbaYjY467oqWaz1NJuumb6Zd7DFFSEnRM0U7FMSbkIqfckiu8VEdeR3huGiyU
 8WcErWVLM5Dl2uqh92QmGgZy3bBuWYj9u8MyIhXWg6Bdgaj+0B4pN2SHpgAq7Drmk3k8
 d4mYgWQSwJyhhEwejfEE44mw2nO7+lyx0O9aTDdQBl4324igX+DB4fSK77OIdIDuAyiO
 sTZ9Z37qZGJfP95hNDmkt8OkuyL8ZHbejExh4mUIAjcfnSVDa5ZiIUQOpij+iG71i0GW
 tAtw==
X-Gm-Message-State: AOAM531ln3JrbMRSpa+5dLcmAHx22Lc8BLvB3jldjSpYPrZQB/aBP9XH
 rRich/PQ2vA2FYaYIgAaYB81QbCfNyk/PA==
X-Google-Smtp-Source: ABdhPJznnjoDIZklZ3an/PGKzcSaGoq6oMet2W5k0LVbL4qqGYnxVqb4t2Jvy1SjejeloX3Kj8LFQw==
X-Received: by 2002:a17:90a:b288:: with SMTP id
 c8mr6962595pjr.67.1633636710687; 
 Thu, 07 Oct 2021 12:58:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/48] tcg/optimize: Stop forcing z_mask to "garbage" for
 32-bit values
Date: Thu,  7 Oct 2021 12:54:51 -0700
Message-Id: <20211007195456.1168070-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This "garbage" setting pre-dates the addition of the type
changing opcodes INDEX_op_ext_i32_i64, INDEX_op_extu_i32_i64,
and INDEX_op_extr{l,h}_i64_i32.

So now we have a definitive points at which to adjust z_mask
to eliminate such bits from the 32-bit operands.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9c11f83a4a..5ef41e2769 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -123,10 +123,6 @@ static void init_ts_info(OptContext *ctx, TCGTemp *ts)
         ti->is_const = true;
         ti->val = ts->val;
         ti->z_mask = ts->val;
-        if (TCG_TARGET_REG_BITS > 32 && ts->type == TCG_TYPE_I32) {
-            /* High bits of a 32-bit quantity are garbage.  */
-            ti->z_mask |= ~0xffffffffull;
-        }
     } else {
         ti->is_const = false;
         ti->z_mask = -1;
@@ -191,7 +187,6 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
     TCGTemp *src_ts = arg_temp(src);
     TempOptInfo *di;
     TempOptInfo *si;
-    uint64_t z_mask;
     TCGOpcode new_op;
 
     if (ts_are_copies(dst_ts, src_ts)) {
@@ -223,12 +218,7 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
     op->args[0] = dst;
     op->args[1] = src;
 
-    z_mask = si->z_mask;
-    if (TCG_TARGET_REG_BITS > 32 && new_op == INDEX_op_mov_i32) {
-        /* High bits of the destination are now garbage.  */
-        z_mask |= ~0xffffffffull;
-    }
-    di->z_mask = z_mask;
+    di->z_mask = si->z_mask;
 
     if (src_ts->type == dst_ts->type) {
         TempOptInfo *ni = ts_info(si->next_copy);
@@ -246,9 +236,14 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
 static bool tcg_opt_gen_movi(OptContext *ctx, TCGOp *op,
                              TCGArg dst, uint64_t val)
 {
-    /* Convert movi to mov with constant temp. */
-    TCGTemp *tv = tcg_constant_internal(ctx->type, val);
+    TCGTemp *tv;
 
+    if (ctx->type == TCG_TYPE_I32) {
+        val = (int32_t)val;
+    }
+
+    /* Convert movi to mov with constant temp. */
+    tv = tcg_constant_internal(ctx->type, val);
     init_ts_info(ctx, tv);
     return tcg_opt_gen_mov(ctx, op, dst, temp_arg(tv));
 }
@@ -707,14 +702,16 @@ static bool fold_masks(OptContext *ctx, TCGOp *op)
     uint64_t z_mask = ctx->z_mask;
 
     /*
-     * 32-bit ops generate 32-bit results.  For the result is zero test
-     * below, we can ignore high bits, but for further optimizations we
-     * need to record that the high bits contain garbage.
+     * 32-bit ops generate 32-bit results, which for the purpose of
+     * simplifying tcg are sign-extended.  Certainly that's how we
+     * represent our constants elsewhere.  Note that the bits will
+     * be reset properly for a 64-bit value when encountering the
+     * type changing opcodes.
      */
     if (ctx->type == TCG_TYPE_I32) {
-        ctx->z_mask |= MAKE_64BIT_MASK(32, 32);
-        a_mask &= MAKE_64BIT_MASK(0, 32);
-        z_mask &= MAKE_64BIT_MASK(0, 32);
+        a_mask = (int32_t)a_mask;
+        z_mask = (int32_t)z_mask;
+        ctx->z_mask = z_mask;
     }
 
     if (z_mask == 0) {
-- 
2.25.1


