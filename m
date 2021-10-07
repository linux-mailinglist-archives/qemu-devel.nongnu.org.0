Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D11425D21
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:20:37 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZsa-0001Sa-Cs
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXI-0007WL-BV
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXG-0003se-5k
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:35 -0400
Received: by mail-pg1-x532.google.com with SMTP id s75so833523pgs.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UC2LKFhrfkUzhjx+eZIdhiCjTmdbw5drcvc+w7sedUw=;
 b=WpXuoM+tVzBCTBZJ7eis9c6395hkBGxMomRUjP/XdkL2hlXAt8aILMz5aMc40yaa4N
 T6iCB6wpdtqSEaTSGeaDEjoSgDskTy/fb3gSp8DM34QTOMnTMTzPdOXiBmD6vJQuxh+I
 04HX+k01pZtEuk8aUCZPqLOT8t0rtgiUHu4BPD9tOEiV+jkhEErOKRf0BiE42m3DDICF
 ZKlJ2yX7iVljwO3M/+su9Hx5gEYjNAN+7nWDUvNZYu4p0KTNopi5i30urYjJyxizxzCK
 T6NBiu9LOMn22uXlAdn/gMgpLwINeZ6XMViGYpeFxnNiBuJAwAjPzqxsRxkTU/q7scOQ
 lhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UC2LKFhrfkUzhjx+eZIdhiCjTmdbw5drcvc+w7sedUw=;
 b=H4wqp7I1Q6QgKp9DIDusgEj2SGPh5oXZ7bxLSdk5i2t/xQyhw3thd5uCE5+oQ06ecH
 3p9xCjWzC7lW4O+wu+1N6229+zmI/j01PwoHNYfiQzJj/K8M9t5tneL2fnb+D0UCoNgQ
 T25ajjPIgNaa8+/EbWvak1Y+5sFdnz4BKOMFqicasOZWyYt2T+YDVXvSAfgUxaOaew9H
 Bku5y7qhJd90do32cpGmqlS+zE2bz2QVynrQxUoFn2ElDc3WNX3e2GygpoBQot7vQZ7/
 D84NghFQcNq/x3Ltpue6ufEaQVOm3btozNVgzraN6d8FY3aimqfBSKOFWKmtnW805Bd+
 VIxA==
X-Gm-Message-State: AOAM531+sIMUsk6wGywV3EhIcDI82F7gukwswjb14211Rj83Mc5oc4uh
 dh+51bzSZzMZynJ0UZ56K3ATv4Uh6zKv8Q==
X-Google-Smtp-Source: ABdhPJyR5G1SpkoD24LdaDSg9iDbv6YQe91PNLFaoQALj/srMWvNKh6odThRBJGDKa5q6v19T0DwEA==
X-Received: by 2002:a62:dd84:0:b0:44b:b54a:c2a5 with SMTP id
 w126-20020a62dd84000000b0044bb54ac2a5mr6034408pff.11.1633636712717; 
 Thu, 07 Oct 2021 12:58:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 45/48] tcg/optimize: Propagate sign info for logical
 operations
Date: Thu,  7 Oct 2021 12:54:53 -0700
Message-Id: <20211007195456.1168070-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Sign repetitions are perforce all identical, whether they are 1 or 0.
Bitwise operations preserve the relative quantity of the repetitions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 06b178aa4a..71e97ccd99 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -952,6 +952,13 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
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
@@ -987,6 +994,8 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     }
     ctx->z_mask = z1;
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1278,6 +1287,9 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1465,6 +1477,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[3])->z_mask
                 | arg_info(op->args[4])->z_mask;
+    ctx->s_mask = arg_info(op->args[3])->s_mask
+                & arg_info(op->args[4])->s_mask;
 
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
@@ -1553,6 +1567,9 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1582,6 +1599,9 @@ static bool fold_nor(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1591,6 +1611,8 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
         return true;
     }
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask;
+
     /* Because of fold_to_not, we want to always return true, via finish. */
     finish_folding(ctx, op);
     return true;
@@ -1606,6 +1628,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1617,6 +1641,9 @@ static bool fold_orc(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1881,6 +1908,8 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
-- 
2.25.1


