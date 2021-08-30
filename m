Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44AB3FB17F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:59:14 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbGE-0005fD-0f
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamP-0003Df-VS
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamM-0001oA-7g
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id x16so6285088pll.2
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BNq1ox8+rWVzst3iv6VIsSYBSdVmvqvfqZdAkCFh17E=;
 b=zOKEbGjcZUKdtyWroSTOS9W8p/2XCePlrJtl/bU48rkWcIM8BnBgKkqzNrVTDLfq15
 WfJ/HyMJakhtjtNXTEfhLbA26T0amxvmbRWCQQaiDJL2IQprRaUR2mtGh/uJmRxjgjmr
 iEaPun2JjcY/BMHujwWNjVuULyo19EcUMSCPPmW4r3pdadbu1xiHxZRxHcb2Kq89WR2+
 1UV11LMij05OcvM2m5Tcd4E2YZkuC175j1RZ8AcltL9IKGAW+UkGk39G8ChwA6hSES5w
 c7L+tzOMbrzqfLPP66TliEeCzcenQDdgvDX50VuHdIsqRZPbyo10qiPS7jf/HC9htc6R
 fQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BNq1ox8+rWVzst3iv6VIsSYBSdVmvqvfqZdAkCFh17E=;
 b=OsmmSZAYUV6Fsoz0eTI4wR7WMpfA98TH681pyhZjdIvzajO2F1KEOcBxXFDRKeCiGv
 vIkOhihGKDfTFuf0X3Z+Eg4Bn6XdM9F8y+KSJfSkZBXiCRyKWNja46i8jwClc98jOz8a
 GggGNIc5A12uzjy22J1VPBjeMKk3W/8IKGO0q8DYeY0wjij+OYM/rQ74c50DoGwuSpiz
 zU9LNsCRszyJ9Bqnat2chCR852nZhI/5qoUodvW3kbuJFlNhXO3h0PfsQFBAWPiruraq
 o0b+It9bd9G4pfaIS2h7St16Gu09Ty4L9cNP8Q2ix1P8RA7IjlHLnLmwRIjU0PzjGPZL
 hfMA==
X-Gm-Message-State: AOAM533F8aRsaFag9bfTBBaUbOoyuwZjGuPbQX7X44ouCHFF1sjfhkvK
 jUXOfYEjSUDFVtpLznlRDlIyOzHJ72mXUw==
X-Google-Smtp-Source: ABdhPJyFEX92Xy9y47LysBUzIa/QZZaszkd9STkpWXxoI3SZeNZ8JKA++I6P7MLNx27tV/TjZPHiow==
X-Received: by 2002:a17:90a:9511:: with SMTP id
 t17mr38092884pjo.194.1630304900843; 
 Sun, 29 Aug 2021 23:28:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 43/48] tcg/optimize: Stop forcing z_mask to "garbage" for
 32-bit values
Date: Sun, 29 Aug 2021 23:24:46 -0700
Message-Id: <20210830062451.639572-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index 6feaf905e7..334639339b 100644
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


