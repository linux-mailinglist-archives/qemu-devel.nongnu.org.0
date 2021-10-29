Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CBD43F66D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:02:19 +0200 (CEST)
Received: from localhost ([::1]:49164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgK1y-000582-DR
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJab-0004f1-6A
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:01 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaY-0007zW-N0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:00 -0400
Received: by mail-pg1-x52a.google.com with SMTP id l186so8683556pge.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5pO8srHxeyy8XfwYL1eqggORkYu4mPynLSww9CDHj/M=;
 b=cKCFMBn7SETIcNtEsbfkxzN9yWBTJ9LDa07WMzUFHu4l6bQnGtGYlFN8hZSuC+PoUs
 J9PEAPSnTz1e/wjAa/k10oRA7z3JPQz+xyo4yC9ufDT+gezd2KYmaoq5p7SbFB3pYJxx
 cWkYs24rHDGGtHeesLFxYiC0c+G0mqj/wqTdKYZbDhPt+8hFsQQL9bBl9YI2ONq7dzHr
 1wmkkiap6dP/7Ch/KwMnVnzb54Uf2FP5zVqfmZeivzqBEGK5gw+DdPP/LcyWwuXK5qhI
 h6ROmR3RTM1AjleqbwDFdtLdU1oS619dbmsRqbp4zzwQLwfNxhkIZzZmrkidivpEZTDz
 +kJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5pO8srHxeyy8XfwYL1eqggORkYu4mPynLSww9CDHj/M=;
 b=a4/Je1/e80oRjutZ1DeRKnMb4cRGpRsxwJv/oAhro+HYG0HjwPVWTBzeDv8F258+/u
 VZbyNdheSoYWntCGwkV8RRHlwz4DCQqAan77e+cIlLPzwNT0Qjv/H621+/AiW1GrM1Y/
 29V0Nz4cwMt9FYAvNsYRbB1l7y4r7ccWm67hlgP7NoT9ZR78ZSbblk/OSEJR64HsrWox
 GQ355wWMJOVrjBIrz40chpUgZ0euOcgSI1LS6+HYr7dkEPEJJhr5bPm7lrPo3SFjdGQv
 vK5ntUZ/JCjV+5RvUemmy2XzZ0p5ywzEVQptt8tONFgtK0LdJnixEGVZGVq4TeRKmWJR
 EXvg==
X-Gm-Message-State: AOAM532DQ0DIdl1IsGWXSmSJQX3/1DpUVIphMB+7kYSYl+iGzZoYZ0qY
 P81e5ds/LwnxX+Kzn7aqYuA8n0lmYFZqCA==
X-Google-Smtp-Source: ABdhPJyZBS8UvptKpzFavFclDFzEEsGAfvD/8SyKm733ZyQrM7jlFDQoIAaYGUMO1wjVtJege9DHyw==
X-Received: by 2002:a05:6a00:10c5:b0:47c:1d9a:c1d with SMTP id
 d5-20020a056a0010c500b0047c1d9a0c1dmr8475062pfu.75.1635482037429; 
 Thu, 28 Oct 2021 21:33:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 32/60] tcg/optimize: Split out fold_bswap
Date: Thu, 28 Oct 2021 21:33:01 -0700
Message-Id: <20211029043329.1518029-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 tcg/optimize.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index dd65f1afcd..5374c230da 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -841,6 +841,17 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_bswap(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+
+        t = do_constant_folding(op->opc, t, op->args[2]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_call(OptContext *ctx, TCGOp *op)
 {
     TCGContext *s = ctx->tcg;
@@ -1742,17 +1753,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(bswap16):
-        CASE_OP_32_64(bswap32):
-        case INDEX_op_bswap64_i64:
-            if (arg_is_const(op->args[1])) {
-                tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
-                                          op->args[2]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1777,6 +1777,11 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
+        CASE_OP_32_64(bswap16):
+        CASE_OP_32_64(bswap32):
+        case INDEX_op_bswap64_i64:
+            done = fold_bswap(&ctx, op);
+            break;
         CASE_OP_32_64(clz):
         CASE_OP_32_64(ctz):
             done = fold_count_zeros(&ctx, op);
-- 
2.25.1


