Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1282B43F6E7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:59:01 +0200 (CEST)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKuq-0001H2-74
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdr-0002dB-LK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:24 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdk-0000O0-Fg
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id om14so6337399pjb.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7PIUhClAKYoh5JUzZ+4sWh4Ck2Ifd+q7rxsEfop2hY=;
 b=l33dXss+kb+Q07ezTq4i+A1Z6G7MEWtadJBWXxbdninu/hDWDLRjXc9N+MMMGNI7u/
 01FBneya8NOgB6/Kdb49den//qgp3rDZkjf11cH1/0ygCBrk8Wpvup3p93d1txRSfSmb
 Pfz9fT41IaXsxJ0GJ6CBPohO958pzVs5VC0fA+8/3SqkmPp4Ftw6zejXamsoyeV8Sv+Q
 aROsYfWxIqi9xs60uRKABWSYJ+mVkQpfTNXruaRjtFzboxI+c7sIQ0P3gw8VHUzo6q/Q
 Uqng6hMnX1ruopQudTFSsj+d3kdd6h9IAOc3A5OmdW441nBYTzueVfdVrFR3dIdZFFGA
 h6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7PIUhClAKYoh5JUzZ+4sWh4Ck2Ifd+q7rxsEfop2hY=;
 b=WSSS/i4Js1L9vCyjhv/Nd9tzRwIA/u1ZFdkbT8H2nw2zI91ZWWoZu2jUtzvDmiQf8I
 LXrrkOSs689tCJlElyRbu1OStwQE5AQhMuhGi0zgtyibtE1VHnjZxCBeyEPqfDcLUKWW
 RiZdSbbW0haa8WKYH3a06ym/xKeQUsr5gBo+IpFP23p8JX9OGxIBsKtJYsXJCesNsupc
 b6yZzoRSxLJ0WiTkEbPtOAJgZ0zkVahY5SIs5/dB0lSrrJd4dsybFKjBykLujWg5kAtt
 MNVTu/yY/3LYF5dcjqZOG+TyqmWhXxunFZQDqRnpjzZGq0OCRYLhrCTwQnSj3kaLlhlm
 frRw==
X-Gm-Message-State: AOAM530EYUu1NKz0GY6q64TwT2QP62iQGTkp/uHO+N6eLYdDSdEifY6L
 MIaEHPbNQHu2t9/WraHhFGqNT8KXb2SG0A==
X-Google-Smtp-Source: ABdhPJxeJCtixFFqP0yABOc7isauD1AKURv8xY6AgsM6bAgXOgCBJ4wSf2IF1S0T0Vh55Wc9p8988A==
X-Received: by 2002:a17:90b:38ca:: with SMTP id
 nn10mr9015795pjb.190.1635482234720; 
 Thu, 28 Oct 2021 21:37:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 54/60] tcg/optimize: Propagate sign info for logical
 operations
Date: Thu, 28 Oct 2021 21:33:23 -0700
Message-Id: <20211029043329.1518029-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


