Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA243BDFB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:37:06 +0200 (CEST)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfW09-000157-Qo
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaL-0003UA-6O
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:25 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaF-00024U-KO
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:24 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so635020pjb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9WNRlGeOHz8VZWPjOaGMMZX6Dax33jheJzEQdYsE1k=;
 b=ByqZ2zAe/fPifm7gkBfqsX8MWvKMKMqyypb78oMbHvAh/Jdr2Dtar6Sb8dJSI0LZIk
 xiwcy/cVJbnCdwEkGPb3kpIhH4JXqFm9n8EQUT8W+T7BNv6uLe3+FrdGuKaNG00RWhxO
 OuZD/PIsF7qRzMF/EQN8pjjLYkUUvMa0UPKZJ8lsr5Tajn1ZGS902gwz6M4UJhaXesbX
 oW9yDZtjBntQL0jKs3WshZBm+oI1U/j0p/Xzj9PiwVcSy86YR/guuEnR1nopnHcI2eCX
 LfcRGNeqySqbdgX7rLMud9yQ71HK+Wg7NxeOf4SdzRLOCNtdd1WdcckYgmKo57O4WE4+
 c/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9WNRlGeOHz8VZWPjOaGMMZX6Dax33jheJzEQdYsE1k=;
 b=4zYFiIwakPxot0KMu/MNLVdUNrAam+obeyERVaVlvdK6/FDjFvk3kbp0eI+2GcuyBT
 nw0Y0y49RfZU2kctMKNTX+pLch4v/sumNStpuCy7d7zzWvnKDrmWLWWPkC4IlGrTtV/f
 38pxxXmuBWCD/9QgxuB8adY2FLgcDFw0txUrF7+W6QIKxtTHJsZEWCMleIgP+oxKLLzX
 gGHnufp7u65gGn5E+/6IO2Hex7GpLrG7B/nsWF4e3oiBgUfl4ftJ2qmf8nSRLeapbs56
 90nPbMKxEemggEg16z666LHNcJ1Z3zyJCSckPgQMXHyESosl884vmst9clOzXX46N4u4
 M3Wg==
X-Gm-Message-State: AOAM531E/WZjXmAJOJsi1SG/GwTs8bxeTwyK6EQaubQmxXyjj2LYGqoV
 fg/d0ARPk00NYrUDhg+i8AU3v38wj2qMtw==
X-Google-Smtp-Source: ABdhPJxlEnio4d9rS4zy/fa6dQuZYgg84QTM7AR2SR1SrhQZ6Zgx4Ab0U2X7ktBmt99kR4aVy9GoFw==
X-Received: by 2002:a17:90a:a581:: with SMTP id
 b1mr1890239pjq.21.1635289818281; 
 Tue, 26 Oct 2021 16:10:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/51] tcg/optimize: Split out fold_ix_to_i
Date: Tue, 26 Oct 2021 16:09:29 -0700
Message-Id: <20211026230943.1225890-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, 0, b => movi r, 0" optimization into a function,
and use it in fold_shift.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f5ab0500b7..bf74b77355 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -731,6 +731,15 @@ static bool fold_to_not(OptContext *ctx, TCGOp *op, int idx)
     return false;
 }
 
+/* If the binary operation has first argument @i, fold to @i. */
+static bool fold_ix_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[1]) && arg_info(op->args[1])->val == i) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /* If the binary operation has first argument @i, fold to NOT. */
 static bool fold_ix_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -1384,6 +1393,7 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_ix_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -1552,24 +1562,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expressions for "shift/rot r, 0, a => movi r, 0",
-           and "sub r, 0, a => neg r, a" case.  */
-        switch (opc) {
-        CASE_OP_32_64(shl):
-        CASE_OP_32_64(shr):
-        CASE_OP_32_64(sar):
-        CASE_OP_32_64(rotl):
-        CASE_OP_32_64(rotr):
-            if (arg_is_const(op->args[1])
-                && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /* Simplify using known-zero bits. Currently only ops with a single
            output argument is supported. */
         z_mask = -1;
-- 
2.25.1


