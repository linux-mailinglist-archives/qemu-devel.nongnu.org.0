Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6843F679
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:12:58 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKCH-0001tf-ED
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJab-0004h6-R2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaZ-0007zj-E3
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:01 -0400
Received: by mail-pf1-x42f.google.com with SMTP id p40so3262153pfh.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwDfuaHLd2phF2WKQRX+NWoB84U/ilhRWeGAC07+3IE=;
 b=UVNUDCIi8oo7GgsRAPn4roqf63wNKHhN97v7vTQz/K8xRLkVyGuR0XRr2TEQIHUT05
 6LMlL6NoxZEp1F4vcJnx4UevWLcT+uVQna0fnF2JOO2mJlNkjm1Of0qELHyT7Pmd2eQ5
 L9PpmFSBhbXFBFi0wNQa0o1ZSZYbiFL/lWfD947PSSXvg4SKMll9GyVwIMtaBl3ue7uo
 m+ZnHj4ffPfKBykpE/nHZNpGxO0oDncaBUxVi7oheY4q3uJiIsu0TzeTmhepfEVce3i2
 s8vJRoe0KbgmsRjsPlmbEFt1A8X9yWfRDDltsZCyqU2lchkycGI6Msq9HEraPrspLtUs
 b1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwDfuaHLd2phF2WKQRX+NWoB84U/ilhRWeGAC07+3IE=;
 b=YFglWLM7XdvNv611voqzd/cLlWKyKVRNcmpHgXNKJhVCrQdZImU3OIRmc1Eyr4qbCW
 /KWXmDwcMusxu9XjVII3Ze/aEFskvpeWsS4UIFi/zf46rFkLMyMZVQgRM5D/htBIKs7q
 NWnZD/+R4nHY6btHds2qL3EW8ZejuEbpSLbmTQBvWYC9sRWosecYJs0JwlnGrFD5hv+K
 Ap7MXiWDeos8dT5xsomFqcfnpw+cR7WisrschVOCDkNC0tXcMHt41X1K7ftG3lQceoiq
 gEKwxgONCJbmWfLft9ycJhn7Zrq/E3dJHYU5+KGeReNcQKMnLTe2c2taG6fNji0mqvBL
 sq+w==
X-Gm-Message-State: AOAM532lWHpv/uoRaesPEKIiRiyGHRmEKoMqi8zlDz8zOjORNbGDNVrg
 R8vp5OFjSlbc/s9YSNiB4cNjNWp5RVf0hg==
X-Google-Smtp-Source: ABdhPJyQDGUOarTSaw6jkHQQxDV0P4ahhAJHQ80d4uC4i+I5Dd+LeN1RmyPmDoMHdrLGAHy9yaMPAw==
X-Received: by 2002:a63:874a:: with SMTP id i71mr6421336pge.200.1635482038129; 
 Thu, 28 Oct 2021 21:33:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 33/60] tcg/optimize: Split out fold_dup, fold_dup2
Date: Thu, 28 Oct 2021 21:33:02 -0700
Message-Id: <20211029043329.1518029-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 tcg/optimize.c | 53 +++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5374c230da..8524fe1f8a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -920,6 +920,31 @@ static bool fold_divide(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_dup(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+        t = dup_const(TCGOP_VECE(op), t);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
+static bool fold_dup2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t = deposit64(arg_info(op->args[1])->val, 32, 32,
+                               arg_info(op->args[2])->val);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+
+    if (args_are_copies(op->args[1], op->args[2])) {
+        op->opc = INDEX_op_dup_vec;
+        TCGOP_VECE(op) = MO_32;
+    }
+    return false;
+}
+
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1731,28 +1756,6 @@ void tcg_optimize(TCGContext *s)
             done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             break;
 
-        case INDEX_op_dup_vec:
-            if (arg_is_const(op->args[1])) {
-                tmp = arg_info(op->args[1])->val;
-                tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        case INDEX_op_dup2_vec:
-            assert(TCG_TARGET_REG_BITS == 32);
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0],
-                                 deposit64(arg_info(op->args[1])->val, 32, 32,
-                                           arg_info(op->args[2])->val));
-                continue;
-            } else if (args_are_copies(op->args[1], op->args[2])) {
-                op->opc = INDEX_op_dup_vec;
-                TCGOP_VECE(op) = MO_32;
-            }
-            break;
-
         default:
             break;
 
@@ -1796,6 +1799,12 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(divu):
             done = fold_divide(&ctx, op);
             break;
+        case INDEX_op_dup_vec:
+            done = fold_dup(&ctx, op);
+            break;
+        case INDEX_op_dup2_vec:
+            done = fold_dup2(&ctx, op);
+            break;
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
-- 
2.25.1


