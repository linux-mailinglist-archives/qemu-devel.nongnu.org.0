Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329C43F655
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:56:13 +0200 (CEST)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJw4-0003Cr-5D
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaW-0004O1-6F
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaT-0007yH-Gu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:55 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so9647722pjl.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEAmAjtRAA8VTRQA9Y1dByLl7XumxO8Ow9/VzdNZDew=;
 b=jcemJCA1dshd5Jh2/buSAru7aAjoGMu8+q9lgcr2AUwSWqbCOOQSsrGc7YSQim7Jbj
 PVpGoDc1dDE/pdhClz5JQfvdGmXohPid6NmV/4kojUiQmepBxSToMDuyLo0cM/Y5ArGw
 laA7lmZc0MzCSCNdjy9+BersWCu8dkQFopTehp9RXVEONRKZRaD8Acd9j+COb8G1Gl95
 LCO2vvrEU6L+cvonpC0gCpXpa+sIi+ZgDjPtQqJx7jRIQo8P1m3PlFVZj9to84TWRqbG
 7VzHgg57pd5jqlVpfu9j8BghNfawLsviB9FFuF2+uPs/CZjoCPJCxwGVfiNU748inE1a
 cQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEAmAjtRAA8VTRQA9Y1dByLl7XumxO8Ow9/VzdNZDew=;
 b=SRtj7jN9B+iGK36PoOPEsje351m+yyMv1AHWqEfrpCicRjaNLCplAPRhf/Ip4TYIiK
 /4mbRSjLfKYq+vszXdEFh751nzfoJMGobKHzwKqHulCeNVLxATePYXmSLtoooYtwpxsU
 GaBrc5ghaoCPQZ14sRyURm0S/x5MzF8jj3NK3KNTJ3YuVOnznea8cfibQmlSRoEfGlbj
 qFqoLptBFaWdAD5POKgo2HcSx6vY6tp8P20tktJ7Fbi4znJUu/kQV4KCfYKOvCAVB2p8
 vWcqDhZPBoIDw3iOtRpYKD+nERefafziY0daWZ7T1e6W7P/g+S/Ucw2ka2Z+LzGyF3dZ
 Gysw==
X-Gm-Message-State: AOAM532Adh0EOExIcSuRqSz3PoNG2XUpui+44lzM8J7owep0Qz2FXyFt
 rirfpGhWXiSLlf6VhxM8zCxQgsrjhqt9xg==
X-Google-Smtp-Source: ABdhPJwXlpw+bHxSBKJ87qdzj+o6MOA3syoxrP4XtJMWW0WmKuaBBfWyHBtp/dPZfJ5JCLdRBCAQrA==
X-Received: by 2002:a17:902:6b86:b0:13f:8d7a:397c with SMTP id
 p6-20020a1709026b8600b0013f8d7a397cmr7959483plk.50.1635482031172; 
 Thu, 28 Oct 2021 21:33:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/60] tcg/optimize: Split out fold_setcond
Date: Thu, 28 Oct 2021 21:32:53 -0700
Message-Id: <20211029043329.1518029-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 24ba6d2830..f79cb44944 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -948,6 +948,17 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_setcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[3];
+    int i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
+
+    if (i >= 0) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
@@ -1648,15 +1659,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(setcond):
-            i = do_constant_folding_cond(opc, op->args[1],
-                                         op->args[2], op->args[3]);
-            if (i >= 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
-                continue;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1817,6 +1819,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(shr):
             done = fold_shift(&ctx, op);
             break;
+        CASE_OP_32_64(setcond):
+            done = fold_setcond(&ctx, op);
+            break;
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
-- 
2.25.1


