Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AED436CDD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:39:49 +0200 (CEST)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfmu-0006EO-53
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJO-0003wz-Ik
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJL-00006N-2T
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so1487733pjb.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQeaF7dr//8ZGCludsintmyDL9Pclz06Mhriys2K3H8=;
 b=vwOrU4uH4VYZgdI8Sd1Qo+USSiXpe5e5jbkXY2zzqx6Fry5G3gi2b/wtcdhYkN7MfY
 KWS0wexPW8SpWMGEOko2hOYP15OJOjaL8dwr0SxAEvKUWu279/sPDt0w6A0nYmSdPljl
 33TIjYIQA+FNIsNLmCJfkalQVZqldJnWkEclbI39WgO92dAaOQNxqDQcdeOd/8oe8lGc
 taMcTKleRez8L2rVo5Zns2OYEfnijMagYC4IkofjCcPBeoGJNjU+sWfrejxol0NO0ipu
 OZm5yk4K1valyCkxg0jQjdjSFNp4CFqAZjN5UfMcrN/TpKM6yg1RCj5RDcu2OOO5cBPy
 MZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQeaF7dr//8ZGCludsintmyDL9Pclz06Mhriys2K3H8=;
 b=z9i08bYBKzPc2erJnnY+MmVmxSrY4pZ0+GLTtnqjneMWW/w8CSCTshYKqtwQXX5axG
 OU8Y5+yShZtOyKoLLEefBKXt2cxDv/KLyQqZgAnR/CkEsuMhoeFcTYua9d47x3hIdsWg
 YXCQtQMjyqZ23jn3bzBTXu5Rd/jAfi65tSI0n5jERVI34WfyFxOQsTB1hdofKlUI+e29
 V04hdpWCA4VcccDzWMv7Vj0pQNKWam9oPH/Lv/S/cSQj4p6ff09cPw0mZg0H8jQ9lm7i
 1G1r/fyF5zQ1TEqHOJYndg9p1gqSZH7/XOOjT0OdYStqEvuy2DP9hMHswmjAdKoC8U+m
 BIYA==
X-Gm-Message-State: AOAM530ngvQ8SSZc2UxyJlqXj/GFRIXqpKZ2u5uoagU39uxGKC41r2X/
 ng9ppACdub3z0yJMS5+ehy6DOzw0N46o+Q==
X-Google-Smtp-Source: ABdhPJwN2X5gXKJ1HP9WrxPL18w6+LIuJASQ2liPoTlI9qkt6L9brwpwz71jRp8oRB+PjPHoINIL3w==
X-Received: by 2002:a17:90b:1646:: with SMTP id
 il6mr9132066pjb.129.1634850553762; 
 Thu, 21 Oct 2021 14:09:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 43/48] tcg/optimize: Stop forcing z_mask to "garbage" for
 32-bit values
Date: Thu, 21 Oct 2021 14:05:34 -0700
Message-Id: <20211021210539.825582-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
index dc7744d41a..89117dd420 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -124,10 +124,6 @@ static void init_ts_info(OptContext *ctx, TCGTemp *ts)
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
@@ -192,7 +188,6 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
     TCGTemp *src_ts = arg_temp(src);
     TempOptInfo *di;
     TempOptInfo *si;
-    uint64_t z_mask;
     TCGOpcode new_op;
 
     if (ts_are_copies(dst_ts, src_ts)) {
@@ -224,12 +219,7 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
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
@@ -247,9 +237,14 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
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
@@ -708,14 +703,16 @@ static bool fold_masks(OptContext *ctx, TCGOp *op)
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


