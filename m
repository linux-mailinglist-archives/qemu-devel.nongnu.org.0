Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C643F6BD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:39:48 +0200 (CEST)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKcF-0005Rm-41
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdl-0002Wz-SE
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:17 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdf-0000Mh-TE
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:16 -0400
Received: by mail-pl1-x634.google.com with SMTP id v20so5994081plo.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cFuKKvQtYwjGDR/SL40zlWOoRmbGI/uezw/kXXNgdBQ=;
 b=JthHRRGkRjl9KAyBuABrZp8hM0Ax5VPbCU/cZMVtTnULJXfurWvNe5UOq3ZWjafVxQ
 TB6354UQkJeVuyMLb8gPxxCVAxz3LRqOm5gSYJ0bh9F66a13gyNeSjgzKRF9X7AdWW1n
 5zgW1oRNHsm1bRyW/0FYPnwf2BC/m3gfkVDyCrInL1M2TbkY0UeF2DnQMl/cCEzUBOYb
 HAxwR2RoSBXUkuJQ2ehKiZxV62jk25sGZfbVYjWOJLRaGmwYEICwoDJp/ZoblWudpl0u
 f0cnPJr7prLxnapzOF9cq+XkcR3coAFjnGvTHt+No58gs/kCCK3cgASvF/fyVufcPvc2
 X3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cFuKKvQtYwjGDR/SL40zlWOoRmbGI/uezw/kXXNgdBQ=;
 b=TO/UqfB9YjFYMkkvcR7p1y5Vsi3uZJR1e4dFrLapGPpDShqZ65av+g1imAj7CHW5cD
 +Wb1O052NhFDSjEFRQdbIXlWFSH5yVCoMQ+5acvvSLpp8XKj6QOBvKnml0h7FTmhcEDk
 bsdAZrhgAjkqykP6ND/kctEGqvbSOmJB/8QrX7mMv2djWPYYi+Leu0oATjmm6acnQmou
 qVAlVH5IoUSCj2Jclx5xKlGfgWLmP7hs0K+Mz/55tkSLQ9Rez5g4MCeawMCTBdKPoH4e
 gCgREdIki6ldthzZySLN4yJJwX9LchlTZ9bKkpiVxy0zHEKiW4HOq0YYPKRemsrTQNlb
 VLzw==
X-Gm-Message-State: AOAM530fRcciAAHl2oaTvf2XtP7E8FtbrrtPVFXzcvnG47Q1da1yE9HA
 QlaC+EKf1tG1m976VJPw/C+yzQnq9oNUrA==
X-Google-Smtp-Source: ABdhPJzGbCpSDy2CGRIQ2J+v+8Mpop+OvQsGK5OK7YSKHeHdRUELDNKRdryD9T8zP/4Kh0cH06c+1g==
X-Received: by 2002:a17:90a:aa0e:: with SMTP id
 k14mr9161421pjq.88.1635482229701; 
 Thu, 28 Oct 2021 21:37:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 48/60] tcg/optimize: Stop forcing z_mask to "garbage" for
 32-bit values
Date: Thu, 28 Oct 2021 21:33:17 -0700
Message-Id: <20211029043329.1518029-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


