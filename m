Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6643D9CD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:21:12 +0200 (CEST)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvyV-0004hG-UZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPl-0001bP-5P
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:13 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPf-0006Cd-BY
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:12 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g184so4932375pgc.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cFuKKvQtYwjGDR/SL40zlWOoRmbGI/uezw/kXXNgdBQ=;
 b=z8AGwKcrcZ5obu4BKMxFiM1A4OG+LN5gJ5rcfGhUCpFfA35PQNYr84H30TdAcdakYU
 KqJcPg+2XY+J97pn2wyQ3ZQZaK4t4aGFZPp6MkVWuBr8LWCzWiEGBxGIb0knobbMslJ1
 1hb257+q9WPlx3S2dtXmLbOnhZe/JEa/y/MwughobDvWqYQYSPw4So7VL6ggV6a9oLbj
 XqVFgkVh6xp43b3YZyVKvpwxpSJUHNyvUbkaNXuycXRwm6kI78tvBTvJY7UB2LsuaCiK
 SQelGHOxDyKZtazU2Mdtq5KkBLoOjn1p23F4R4+XOE10Y5p3vPRArJ32raZC0POs0tUd
 o3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cFuKKvQtYwjGDR/SL40zlWOoRmbGI/uezw/kXXNgdBQ=;
 b=XQHYMT/eMosWZ+E2NNWovHQUnWeQlmMcwrMVAGabkjFO8UbYKRfQkrG95Ay2zRsbYp
 fkeJrVNNIq0DEsNKgvNQxxF8fHW35SKFrDmn8C8i/MNAirvSnChnxcyqg7ryXDoPd4p0
 FWK/Vkbqn8UtNoQOZ5a47S2j6skL/HKncJKWd+XDMlTzr9rTNFVFfMUaFM1iMWOGV4eh
 L6bnBMERJ7tZJPKrtftzdVWMyVGXgr7AOPkYXQHkmicm+yRu+ebdKPTWkDOlB6HCYPEf
 EukRp240nBbB8SBUuJLk1UKOQdNN1v+8zuzMpOmuIro2YvYDinieuSdC89jrm+w6ghxc
 J50g==
X-Gm-Message-State: AOAM533azk7kR8FujcnKH3MrIqnVCmEl48UyGi1U67gC77FFOyDR1VXN
 F526ObgdjtomjYrTv9tgp6co7A7Lmes6mQ==
X-Google-Smtp-Source: ABdhPJwrseMcALTeDfyjNliafoc5tVZEAcbtQruFZpQCk3mWMOUOkqWucdGpnDmDYzY/S/0is9u23g==
X-Received: by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9 with SMTP id
 b11-20020a056a000a8b00b0044def7c94b9mr1540747pfl.36.1635389103909; 
 Wed, 27 Oct 2021 19:45:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/56] tcg/optimize: Stop forcing z_mask to "garbage" for
 32-bit values
Date: Wed, 27 Oct 2021 19:41:22 -0700
Message-Id: <20211028024131.1492790-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This "garbage" setting pre-dates the addition of the type
changing opcodes INDEX_op_ext_i32_i64, INDEX_op_extu_i32_i64,
and INDEX_op_extr{l,h}_i64_i32.

So now we have a definitive points at which to adjust z_mask
to eliminate such bits from the 32-bit operands.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e42f5a145f..e0abf769d0 100644
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
@@ -721,14 +716,16 @@ static bool fold_masks(OptContext *ctx, TCGOp *op)
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


