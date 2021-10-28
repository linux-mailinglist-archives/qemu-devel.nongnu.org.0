Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEDC43D9EB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:40:53 +0200 (CEST)
Received: from localhost ([::1]:36142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfwHc-0003nj-RV
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPm-0001cb-VP
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:16 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPj-0006Ra-KI
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:14 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r28so5005812pga.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7PIUhClAKYoh5JUzZ+4sWh4Ck2Ifd+q7rxsEfop2hY=;
 b=CA7npjadsmtdJPqfOCvv+T/2hORKJG+XH+Ftw846pAUZDDPoDJrUowrNCtPWqktekk
 QO92wd0miH5YagzRdQaMvkBbmL8/ZVUYeSHLC8WP0eoOCMRAW0OKg2/v3loAa5jX4g9a
 k+LQz3N7L16Xjad8F/o8OSjxtalGcFGY+k16Dg9q9GzMqbY+Z8IpVsgRsu35oQR2AzxZ
 3HnBcAUhFzEumJlbNDt8R4drXxzB5y9TcP+DimiIDTHERtWAVGHCbzuBijMeX8nNU1nk
 Wa7/G7fDxxmOc3v3ZdAz2pbGW/B5XX0zyhWBQF2cw2CyoK0ksE1lHfaTay0F7J0iTCUR
 MAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7PIUhClAKYoh5JUzZ+4sWh4Ck2Ifd+q7rxsEfop2hY=;
 b=AdGMLBC4XgWUIF/RWRuiSi6i8f8KscEj0jNN2Ez32ZjTUosiW1+iJex/fSx+i8aA8H
 emcsJ8W3ie4z2LlLMDQM+k+l8m0Vj8jFHf0RuxckbyyJA+ruDxfmoIDQ5yxLsdOO5qrP
 VztTNJhz2LMd50JcBRdcRIBVizPo+6je2vuY/RxPz5QvD6MBj7Rx9GVBkKJm9zzNr1uF
 PnBMUhxBRxgJfTHfsWM7fBrcojx2k1xSuAdV0mlbtFSxaicFNWxadD+3fPtRSD/GGkHj
 PM3+d1/zEbwFvwN955jKHc3RymkrhMbJrcgiC9W4iH/M4ennyY7BswdQXmQr19/Z79Y1
 sesQ==
X-Gm-Message-State: AOAM533S3sCfog+2aifsl5p1rkllscLQ6rqULUg1jehDyJeGzurA9vIR
 k2cCzSpCY5yzjH/3Hk3E2rjkXoF/G27CVw==
X-Google-Smtp-Source: ABdhPJzLa3SBoVh/lW2viB+xK1R/HrlH1orpd9hNIMMUM0+tNOaYyflnDR4gCxEtdCt8Dvb/yRh3yA==
X-Received: by 2002:a62:5ec2:0:b0:44d:47e2:4b3b with SMTP id
 s185-20020a625ec2000000b0044d47e24b3bmr1536907pfb.38.1635389108627; 
 Wed, 27 Oct 2021 19:45:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/56] tcg/optimize: Propagate sign info for logical operations
Date: Wed, 27 Oct 2021 19:41:28 -0700
Message-Id: <20211028024131.1492790-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sign repetitions are perforce all identical, whether they are 1 or 0.
Bitwise operations preserve the relative quantity of the repetitions.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ef202abbcb..de1abd9cc3 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -967,6 +967,13 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
     z2 = arg_info(op->args[2])->z_mask;
     ctx->z_mask = z1 & z2;
 
+    /*
+     * Sign repetitions are perforce all identical, whether they are 1 or 0.
+     * Bitwise operations preserve the relative quantity of the repetitions.
+     */
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
+
     /*
      * Known-zeros does not imply known-ones.  Therefore unless
      * arg2 is constant, we can't infer affected bits from it.
@@ -1002,6 +1009,8 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     }
     ctx->z_mask = z1;
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1300,6 +1309,9 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1487,6 +1499,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[3])->z_mask
                 | arg_info(op->args[4])->z_mask;
+    ctx->s_mask = arg_info(op->args[3])->s_mask
+                & arg_info(op->args[4])->s_mask;
 
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
@@ -1585,6 +1599,9 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1614,6 +1631,9 @@ static bool fold_nor(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1623,6 +1643,8 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
         return true;
     }
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask;
+
     /* Because of fold_to_not, we want to always return true, via finish. */
     finish_folding(ctx, op);
     return true;
@@ -1638,6 +1660,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1649,6 +1673,9 @@ static bool fold_orc(OptContext *ctx, TCGOp *op)
         fold_ix_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1922,6 +1949,8 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
-- 
2.25.1


