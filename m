Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD04443BE2B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:52:26 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWEz-0006s0-Up
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdO-0000Cj-AZ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:34 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdL-00037d-GA
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:34 -0400
Received: by mail-pg1-x536.google.com with SMTP id h193so1064529pgc.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a4njDfQC9JoQ4EGmKy2OjsF/31HmyACHskOdXQZvxJE=;
 b=nubpKN6GG6qvhWGG3WFKDD/OwCP+Eg7vNKX4Tu7dm111qVz/z5oc3NxFC6mCpBl/MA
 stRWiUHON5At7noRC4UHaLcfzd5nuEa9Ol9YfR1ydvLL+y1UpCTZm2zI3wXhyr0D48+3
 +fHLMX5XuKejBdfk0rFo4E1N+78AgfdMRxz+BaoU39Mvc9h/y3dRuEkZDB0NW4P5v436
 ALHJMesWztNjfDrz6nXrRiaLdnZJ6Z0GUXvKj8VUPi3+mDQNNu8Yd6GUJmZJBHch4Rg5
 jz9kTGikwMmueVrYJnShkQobBUkVvI3izz2nSeZLHRJRgNRtFrjnsQNnk5TV3tz6CYvv
 Fd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a4njDfQC9JoQ4EGmKy2OjsF/31HmyACHskOdXQZvxJE=;
 b=qVRLj6e/T9LaX5g3teN0KOQq5tjpJmuGvCQoSoFC/Ee06lmmJsVZ0mwtVJirUo8ns4
 T6sOzRYtP85Ono4WgugRUCzDa6rpF4Gd+sNP8iLZ6x6TBoUHBM4LnFCokDHvRmO4zO1G
 He99w/Eo6RTz1dl831KM+2dH3f3DPY1ghDJwhUmiemHtwisViX+UZJjvSWJHkwuv62Rb
 TW4Jm3T8HqlSKASyWNqOR6ZOwfV59NmJq4b0n1hbyR3TuzNKjANBaY96Dm+CJ4xFXMXd
 Jb8LNkusHUHPOrjgfVNu7ysSiO6/atrEvtgIY+LeoCIhUiLtFsMXLxQYoaCWfRtyA2hA
 XZVA==
X-Gm-Message-State: AOAM532Zec6KCUdd6ZbHeDlweToB2AdzbX1TWkkvwbGy6Bhn8/TM+KtB
 X4t337qJNmuljZsoDnMW0BXQZKNqvwiSIw==
X-Google-Smtp-Source: ABdhPJwW2KNs45FwDGwXuxx0w0oM7z8c1tviKQa8wa1IkZrZRuJEDuq9S0vW1h3xrtX5phagj6jpRg==
X-Received: by 2002:a63:7b5c:: with SMTP id k28mr18495615pgn.158.1635290010118; 
 Tue, 26 Oct 2021 16:13:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 48/51] tcg/optimize: Propagate sign info for logical
 operations
Date: Tue, 26 Oct 2021 16:09:40 -0700
Message-Id: <20211026230943.1225890-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Sign repetitions are perforce all identical, whether they are 1 or 0.
Bitwise operations preserve the relative quantity of the repetitions.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 742417ca1e..311d9779f2 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -966,6 +966,13 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
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
@@ -1001,6 +1008,8 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     }
     ctx->z_mask = z1;
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1299,6 +1308,9 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1486,6 +1498,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[3])->z_mask
                 | arg_info(op->args[4])->z_mask;
+    ctx->s_mask = arg_info(op->args[3])->s_mask
+                & arg_info(op->args[4])->s_mask;
 
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
@@ -1584,6 +1598,9 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1613,6 +1630,9 @@ static bool fold_nor(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1622,6 +1642,8 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
         return true;
     }
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask;
+
     /* Because of fold_to_not, we want to always return true, via finish. */
     finish_folding(ctx, op);
     return true;
@@ -1637,6 +1659,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1648,6 +1672,9 @@ static bool fold_orc(OptContext *ctx, TCGOp *op)
         fold_ix_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1921,6 +1948,8 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
-- 
2.25.1


