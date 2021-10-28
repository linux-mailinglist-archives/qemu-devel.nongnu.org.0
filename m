Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC343D9A8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:07:49 +0200 (CEST)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvlc-0002kv-Rr
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMb-0004rY-Cl
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:58 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMV-0003YH-QE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gn3so3607420pjb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C2TgxQz1GB819hSkndrC8NaNVJWCUo0QsMgOlWylEw4=;
 b=eBZfyWaOaVGiJrjxhJ9/tur8vlKhAw+HojgHDDdMbzeJlZFlpSJx8LlWPfBoXkI/MC
 jpWu/J+Ly2C5LCkhTxui9IjutIPimvTs8sNSuZN02OScXvKsIJ5aTQv2VHGhTT/rN7d1
 WLj+vcIZxRz8CTCkr5Ep3fxEyGMjpSmO+SITqe+YpI/pjZAGi5ikncczPjl3cUaJ0v+F
 TapRb9mvN6hQW3hIxTdnIuf6kDYYGVb5RahvCML/WRj9ha8kEwps1WLvuo0HktngfzSO
 AZczq/UQO7gIzfRa/w2ywEkU3DUw38grKVhzQOyQX81qjFUhwcd9dELcXEXA9B0pYgsp
 u9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2TgxQz1GB819hSkndrC8NaNVJWCUo0QsMgOlWylEw4=;
 b=vCfAGpcieL1gGDEWD5QfJvqqa8SxP8Zsx4QI862J4H35LKpF8fbJw3D+59bsS3a0N4
 T3dep1OZ4SOsmTPtPMZ9Wq+P+h3ik/9+mWKKpoXNIVf5TVGh2QaF/nixLz75PsBmIM1L
 uCOZLp+tbJrXVexv1QtTMSvbF5BOsZfQ0lJXhp2GXBjLoK7ss5TWloyBMSLANiEhiumA
 QhPoxkiF8UUqpYhifaM8JrMI1oQ4AfnAc90nPf/pkeTi/HZBiVNEyGAKumJVL/GP514J
 4iLH8/zHIeeHX7E7WL8mYK0uvZ1I5vaIqU2lek5A8LPArQD3hYSDicbTkxPaEBuCwCB8
 lqNw==
X-Gm-Message-State: AOAM532wv1y6yjdXU1v0aIaR5+prarqy2xHOfekNAroIaudoYLTtbH5x
 oeQt2FBng4cAL/DQStnFL43DjOjZEgs1pg==
X-Google-Smtp-Source: ABdhPJxeU/36KfHZiOoku/kBpqYtbap97pRH0Xfz3EV4aT4bLtZJMSSu17qyZlZw6oSxq3sWSmXQbw==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr9639673pjp.191.1635388910551; 
 Wed, 27 Oct 2021 19:41:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/56] tcg/optimize: Split out fold_movcond
Date: Wed, 27 Oct 2021 19:41:02 -0700
Message-Id: <20211028024131.1492790-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 tcg/optimize.c | 56 ++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9d1d045363..110b3d1cc2 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -922,6 +922,34 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_movcond(OptContext *ctx, TCGOp *op)
+{
+    TCGOpcode opc = op->opc;
+    TCGCond cond = op->args[5];
+    int i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
+
+    if (i >= 0) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
+    }
+
+    if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
+        uint64_t tv = arg_info(op->args[3])->val;
+        uint64_t fv = arg_info(op->args[4])->val;
+
+        opc = (opc == INDEX_op_movcond_i32
+               ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64);
+
+        if (tv == 1 && fv == 0) {
+            op->opc = opc;
+            op->args[3] = cond;
+        } else if (fv == 1 && tv == 0) {
+            op->opc = opc;
+            op->args[3] = tcg_invert_cond(cond);
+        }
+    }
+    return false;
+}
+
 static bool fold_mul(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1715,31 +1743,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(movcond):
-            i = do_constant_folding_cond(opc, op->args[1],
-                                         op->args[2], op->args[5]);
-            if (i >= 0) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[4 - i]);
-                continue;
-            }
-            if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
-                uint64_t tv = arg_info(op->args[3])->val;
-                uint64_t fv = arg_info(op->args[4])->val;
-                TCGCond cond = op->args[5];
-
-                if (fv == 1 && tv == 0) {
-                    cond = tcg_invert_cond(cond);
-                } else if (!(tv == 1 && fv == 0)) {
-                    break;
-                }
-                op->args[3] = cond;
-                op->opc = opc = (opc == INDEX_op_movcond_i32
-                                 ? INDEX_op_setcond_i32
-                                 : INDEX_op_setcond_i64);
-            }
-            break;
-
-
         default:
             break;
 
@@ -1791,6 +1794,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64(movcond):
+            done = fold_movcond(&ctx, op);
+            break;
         CASE_OP_32_64(mul):
             done = fold_mul(&ctx, op);
             break;
-- 
2.25.1


