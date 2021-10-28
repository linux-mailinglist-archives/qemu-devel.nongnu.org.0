Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368EF43D9CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:20:03 +0200 (CEST)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvxS-0003Zk-9j
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMb-0004re-Du
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMX-0003c1-R9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so6754618pji.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F1AVpbG5TP2qMj+ELcN61uRCpwzeIi0grwtPZKRIVFo=;
 b=YS2QI95FDAof3Qb3soSPPKDYgYDnS82Xed+0nljPLJv8x4o+pOoPXugVbNJACE7byW
 fC1PvMMWZQbvO5A9l+f8NbKzFZ1TbrrAXvjgNVxfWWLNcToUuBwXpk5IUki75ziFdlN5
 dQHVIS9JqYnv2biLZrHLykpN//IdBoZu6LniWzrYJdD2vUcRwaz9McVxPn3AZdtb86Cy
 LYV8HM4asIiRhfn4W2cwJ6VS9YJVAKj3Xsv3/hqo/d/xSNCV21OEoSlmYCxOX6EuqAH6
 utWA3y0WslGYDT95Hci0TBC/En7tMWUn+Du+gb/ALA/sL6iPaW6QRALlR698wNhkulLJ
 j6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1AVpbG5TP2qMj+ELcN61uRCpwzeIi0grwtPZKRIVFo=;
 b=QMVl2k5zK+FZY5CgoMagng8KPFpW2qTnstL76Jc5t1Y8MsouOEN3/Ct+q9dkW/ztVB
 0ag6GSFHABXbVePvnZpFLtjIebj+vlVP4zayqS4LiilYSAHkSEbLIl7hZGNsvsArl3J+
 LbjqbFZPkDLrjjysB/K7/rSNOQyzBL3pwj9J6wn8D1JGhLjfS6u5KU5nkQTbZ8XN14is
 xdwghn43yeu4fEUuLnnI/IJLtpgns8rKahWnOd5TUAWIuS83jLMmUWOfQj85uBfmB5mE
 omL6udF+kXpH+GvSfvFfEh/wdxLW0ghpEoXzGlCVKrz2W8c6fQ1FRtV5yuK8sOJFSqDB
 5aSw==
X-Gm-Message-State: AOAM531vTX2Tur8bXkED801spdfcz9PWzStuRHT3nQafl0YIDdwsor98
 jR3hrSUxxqE2agMyPITweznDckz6ad2pcg==
X-Google-Smtp-Source: ABdhPJzO7/i/Q7dhE9WHv9fMXfx+ybEyEnPtdZ+T3NbPH6Czkx1j8bGCF7FomZjO6aYdiyW/aCDXAg==
X-Received: by 2002:a17:90a:4f41:: with SMTP id
 w1mr1574003pjl.117.1635388911981; 
 Wed, 27 Oct 2021 19:41:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/56] tcg/optimize: Split out fold_extract, fold_sextract
Date: Wed, 27 Oct 2021 19:41:04 -0700
Message-Id: <20211028024131.1492790-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index faedbdbfb8..3bd5f043c8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -888,6 +888,18 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = extract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_extract2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1126,6 +1138,18 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     return tcg_opt_gen_movi(ctx, op, op->args[0], i);
 }
 
+static bool fold_sextract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = sextract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1727,24 +1751,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract):
-            if (arg_is_const(op->args[1])) {
-                tmp = extract64(arg_info(op->args[1])->val,
-                                op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        CASE_OP_32_64(sextract):
-            if (arg_is_const(op->args[1])) {
-                tmp = sextract64(arg_info(op->args[1])->val,
-                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1779,6 +1785,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract):
+            done = fold_extract(&ctx, op);
+            break;
         CASE_OP_32_64(extract2):
             done = fold_extract2(&ctx, op);
             break;
@@ -1856,6 +1865,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
+        CASE_OP_32_64(sextract):
+            done = fold_sextract(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


