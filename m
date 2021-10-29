Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5743F676
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:11:55 +0200 (CEST)
Received: from localhost ([::1]:38244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKBG-0008Hv-Hp
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJac-0004jk-Px
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaR-0007y3-F2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:02 -0400
Received: by mail-pl1-x633.google.com with SMTP id v20so5988929plo.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFsfCOujg6xp28y0o9M8YysK5F5Ff4YXOa1Luu+j29I=;
 b=LoCd2Smiga09ZF/ko5VfSorUw71pWb0TdTeqB/Q8dix3Blx2yv3vxSI/bZ1saeymup
 pT9KUKeFgLIqOzc0zUDIPj1WOUBI+geeowPgPupE+dIH1+8SOwqBNthclmkkYHwocNTj
 hIbM2rD3Elgoesbb5q1+yCa0vVeKkDwxunphJOARnT4zNLn2ZdDeyTCYYw1vGzy1h1oF
 oYWXtolGWtiCIPunNpYEFV6Yr+iQzEqY5kCMoEtFHdPBiOO9ruHBitOiGSFrR0wPoTY5
 nhXPlzVS+t5zNvx8NSKPMUOA7wavibk/QgxTN0JTMWdP8a99iZGSHso3+9RowtgHBM7s
 O4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFsfCOujg6xp28y0o9M8YysK5F5Ff4YXOa1Luu+j29I=;
 b=EcimCtMmQ+3zvH9PGhXzBSymi2ojIfaq4qUfWFU70kFa4MoGfZ5LWsbG7zD7a4+EKS
 YkB4UPoHD6/WllYlHFFImKADK/5E5c4FrRyEWH9o1QokURPNxbYYvqUANj5reT+48eBB
 nOmXaaKSQAUv/5IrigywgqzzuASkCP57/x1Bao6fdcHmnESJuJpJIK+Za47XRkjbTULA
 EEznIFmS415Ngpm4EPKAP5fHD9btEe18kfoPY1Ur8hNx2+9lk0DkUDAu0Zf2+ARZAMzM
 i678bZP3EjYxW8hs/zm/QUYUh/XFnOWDL2kLnFOvcZm/e8RNIIpH+No6VfXtIacnyEOC
 5hqA==
X-Gm-Message-State: AOAM530xVN7NO8EH9b5z2CGn62TmBbauuvVfDP2JGRv66WhrH8xI+hIE
 9uN5NAXuT5gy6XfHQvzvircgDtG4+n/o5A==
X-Google-Smtp-Source: ABdhPJzNuQHMG2CBXzvRMA4r5PVrFEQF3GdTG4LNwbNsJOqGV7YZgFAwJ8DNRsaKBJipVtkNc4vP4w==
X-Received: by 2002:a17:902:b583:b0:13d:e495:187a with SMTP id
 a3-20020a170902b58300b0013de495187amr7711538pls.9.1635482030148; 
 Thu, 28 Oct 2021 21:33:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 23/60] tcg/optimize: Split out fold_brcond
Date: Thu, 28 Oct 2021 21:32:52 -0700
Message-Id: <20211029043329.1518029-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 tcg/optimize.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c9db14f1d0..24ba6d2830 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -714,6 +714,22 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_brcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[2];
+    int i = do_constant_folding_cond(op->opc, op->args[0], op->args[1], cond);
+
+    if (i == 0) {
+        tcg_op_remove(ctx->tcg, op);
+        return true;
+    }
+    if (i > 0) {
+        op->opc = INDEX_op_br;
+        op->args[0] = op->args[3];
+    }
+    return false;
+}
+
 static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[4];
@@ -1641,20 +1657,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(brcond):
-            i = do_constant_folding_cond(opc, op->args[0],
-                                         op->args[1], op->args[2]);
-            if (i == 0) {
-                tcg_op_remove(s, op);
-                continue;
-            } else if (i > 0) {
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                op->opc = opc = INDEX_op_br;
-                op->args[0] = op->args[3];
-                break;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1737,6 +1739,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(andc):
             done = fold_andc(&ctx, op);
             break;
+        CASE_OP_32_64(brcond):
+            done = fold_brcond(&ctx, op);
+            break;
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
-- 
2.25.1


