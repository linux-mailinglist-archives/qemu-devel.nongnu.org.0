Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2937B43D9C2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:17:31 +0200 (CEST)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvv0-0006Kg-7Y
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMb-0004rW-CW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:58 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMV-0003YA-Py
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:55 -0400
Received: by mail-pg1-x533.google.com with SMTP id m21so4887750pgu.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCdKX5lGX4jVtgmDyFNtAjJPKoYBkr5rEDOGi0sGeW8=;
 b=Ba+5shxRVqrXhOCC8juWkcImjLmDzkFGnX6KYgVTovn1BtqBhBIfZXqG2R3IUcrvTX
 szmgjtX2Qee4exsHLwBQs6WZof0AbVmiV1pQOiiIyMgGWceYmlGJC3Fwu8H4t2YPYgSJ
 W1Br9sp9RKbqzEPlVMaQc7x0QHrXYXPosm3Alb6jBRfqZnAE8+bdodaFjUHhzlJdnloJ
 mioa6qDef80Vi8U97oWHX//BfL/QhqTAJqDEVDaRUCvId6txuUuFcACTT+h9FuI9gGFJ
 6sxV8O/MCxlzLaOV9VbuYahOfasBZLSVY3RLeg1Z5XtZOyOcO9Y0bRdu+e1SNQ7O6+9t
 oi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCdKX5lGX4jVtgmDyFNtAjJPKoYBkr5rEDOGi0sGeW8=;
 b=E132BSTOGjOO7B0MH7T8VE1h9zdNX89Vt1EhyqIwETj1r9gDV1wBvWvMOkHTfh3+52
 5anlqmjDOm8c9Dt42hxRK/fHmIQUaxT4QMOJxsm7bQ+30vddHLJJncmrw9OFZcbw6mmK
 z7xYtSrERK+M4NB47N+JFlfaV8bKFXjSEwRgQTExtkz76SJOpfPUOK9AdhDfMN0D4eyH
 2CBEqeWtFyBI7y907+NrY+Ts63xrZRZj9PdPW1rmxq6B5F+DumxWl8jZbzsCBpsy1N18
 8PSTCpoMKRn4QTix949bmGuuO8ooLmxiBampt+f6ETsEXmQfJwI6a0/XkWCoeVRcrOLf
 HiKA==
X-Gm-Message-State: AOAM532LV5tmUztLGbw7feiiP96CyXhvdzEj37S00JzNVycSMBBgnfR0
 IH0yKY2f0lKEoBPqfaFtoBnB2pBfJeUxOQ==
X-Google-Smtp-Source: ABdhPJzVMc6xW5vFmdMBaf79yZ4wllZbWgjuvMJ8cP3UL2J4HBKPmUNM2AZZI2X5+J01cTcxdkt+RQ==
X-Received: by 2002:a05:6a00:140e:b0:444:b077:51ef with SMTP id
 l14-20020a056a00140e00b00444b07751efmr1565032pfu.61.1635388909898; 
 Wed, 27 Oct 2021 19:41:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/56] tcg/optimize: Split out fold_addsub2_i32
Date: Wed, 27 Oct 2021 19:41:01 -0700
Message-Id: <20211028024131.1492790-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Add two additional helpers, fold_add2_i32 and fold_sub2_i32
which will not be simple wrappers forever.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 70 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 805522f99d..9d1d045363 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -704,6 +704,39 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
+        arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
+        uint32_t al = arg_info(op->args[2])->val;
+        uint32_t ah = arg_info(op->args[3])->val;
+        uint32_t bl = arg_info(op->args[4])->val;
+        uint32_t bh = arg_info(op->args[5])->val;
+        uint64_t a = ((uint64_t)ah << 32) | al;
+        uint64_t b = ((uint64_t)bh << 32) | bl;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        if (add) {
+            a += b;
+        } else {
+            a -= b;
+        }
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)a);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(a >> 32));
+        return true;
+    }
+    return false;
+}
+
+static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, true);
+}
+
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1056,6 +1089,11 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, false);
+}
+
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1701,32 +1739,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_add2_i32:
-        case INDEX_op_sub2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])
-                && arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
-                uint32_t al = arg_info(op->args[2])->val;
-                uint32_t ah = arg_info(op->args[3])->val;
-                uint32_t bl = arg_info(op->args[4])->val;
-                uint32_t bh = arg_info(op->args[5])->val;
-                uint64_t a = ((uint64_t)ah << 32) | al;
-                uint64_t b = ((uint64_t)bh << 32) | bl;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                if (opc == INDEX_op_add2_i32) {
-                    a += b;
-                } else {
-                    a -= b;
-                }
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(a >> 32));
-                continue;
-            }
-            break;
 
         default:
             break;
@@ -1737,6 +1749,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
+        case INDEX_op_add2_i32:
+            done = fold_add2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(and):
             done = fold_and(&ctx, op);
             break;
@@ -1833,6 +1848,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
+        case INDEX_op_sub2_i32:
+            done = fold_sub2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
-- 
2.25.1


