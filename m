Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D789943F652
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:54:29 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJuO-0001h8-Tg
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaX-0004Qs-QU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:57 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaU-0007yc-H2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:56 -0400
Received: by mail-pg1-x529.google.com with SMTP id e65so8694283pgc.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C2TgxQz1GB819hSkndrC8NaNVJWCUo0QsMgOlWylEw4=;
 b=T9Ho4vprV8lqk46ruk7+f9vKtTBcDc2LhQrOfarf7gP7IT47UorqLgIaHu+HCLm7IK
 1uBK0Pk0SrJOhiySsn3hk/ih14m9S4fhiULsP8KpaTNUtfbOpcg5sNRiwZx2G/Qt7lfZ
 YgjKuPYLoXUdP0vD4msRuZUoqkatVrGy9j5Y5cSLE/VQPy3zUf+DPzb84HW+l596x5OS
 SZ3eIByNZz12uuhJvJ4w5hUrFuu+j6FnzOGO8mFIbXVgbj5X0cuvJKMOQAUJPjUH/KxN
 S3VNu61OqcgjA/ucfXGGSQIFhMLKXiQLXG5mDMGc0QaWxZxYtw8gzWxhUWta7g+o1ePL
 2bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2TgxQz1GB819hSkndrC8NaNVJWCUo0QsMgOlWylEw4=;
 b=h6AchHXlUB4cLU37i2BxE1sEB+FXMd21pmJKJx7YFbgz7os+0WXhd1O+f4iPGupgwu
 6imVh7DH2QICbZorugp26BQH4XlMpFDKhKyS47T+TwYc5ZVsodOmWvTmzG32QLVqK0+s
 EHJcDYR6AkrSUhX/MPe1WuArb3LKvUXo/IpgNqKyNjcKLa8S8AgBo094CeKSqpnJnZ8O
 f+yXixe3IdbIGHRr/Gh4e6TLyXRMvc5RUOoM8HKGvq3P/JQGVtHepNsWPKy1EuvO5qtB
 dW3VJz67e6V7XUdfNr0KCgasn4JC22f64BJEW3iv5Hg6AMDyaoXq3S9MdG7Jl79J2UJl
 knGg==
X-Gm-Message-State: AOAM530bZznPEpQ4jHvpHT+k5eg4DblPvl9KNGrMtbYQH63vH5C3QOxj
 uIQFyGnxrKjFrYXNf0XZB9x5r9n008F6Ow==
X-Google-Smtp-Source: ABdhPJwZlNsFrwXjpL4xkOE1u2NNeyoL2J7wl/xNHQzRwNSs8We7s0YPZI5qdprfaf8A6n9n/6NxNQ==
X-Received: by 2002:a62:b606:0:b0:47b:e32f:9ca with SMTP id
 j6-20020a62b606000000b0047be32f09camr8504925pff.57.1635482033180; 
 Thu, 28 Oct 2021 21:33:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 27/60] tcg/optimize: Split out fold_movcond
Date: Thu, 28 Oct 2021 21:32:56 -0700
Message-Id: <20211029043329.1518029-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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


