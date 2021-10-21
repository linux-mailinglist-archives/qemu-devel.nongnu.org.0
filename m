Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619D436CA2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:25:59 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfZW-0005xd-60
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGE-0007ZY-RW
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGA-0004Jo-4b
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:02 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v20so1280219plo.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlDz5NV39+/BiKwi9g2AHEtuJhk+VWM4jALC7rsCK2M=;
 b=jaoWJJUqBVnq1m3NhVt3sr8z1jDfglUP/xEYIL7Pf3tisX2lemHEJGcO6dx++RTMiH
 8ce47Z/i8IEH+AaIQjfrMs9M/nhw9wrI+X+OAlsunWbVgJ6BfnSInF/nhxkx1iehjXZF
 AA9EQBbGcqoZynuuNSX3mhIYeRy2/qhGZXY0rHszsfdG7bjfJzQfbBX2nvTucDkfZoUp
 EauqCpRLGCSpjFSmINIgk9e16TTOnYadv13kj3ddK16q7BPjplUk7dk/JKHHB4hoE7RA
 Qbe7SrLZDyFa0MfKFqJVTsSzGJIeInMO+DXveeJe77LF4IQTpnGWjlSCJS5sjXuJm3vR
 ZZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlDz5NV39+/BiKwi9g2AHEtuJhk+VWM4jALC7rsCK2M=;
 b=tO+HNubBdXrAPttx8Lj4qg/XqF0Dq7r9aVImv4r2+e4bHMGR/blZQf3BzBKl7rby70
 1lS2ntOmX5dCgm7YNEmmurCS0mieiwwaWprrVcWydqLkL4XGTn028KXJHtvzFhaBcDIf
 EuZPkOEDeoHBz9/Fo2bbi3JWq8GTK+GUASjEVHF/OSMv2rBE0PmtYVUZtFAK6d223gJs
 TkmHzgQ9fswdBHjK4EqDbEHn6tXwoysDM9lJqsG4g1o+HeZY+/sVwSL0FbtnoH042mPJ
 Ne5meQ6X8qPNt7Jr1ur9t+MSDOzcDetAvOfvhYURA8OlgtfrIiLFQaDeC4NHoHxBIXdD
 wPPw==
X-Gm-Message-State: AOAM530RzH47sh6KVZm0e5+vmMtvZZ/d2Uwhz0/Io5WtfeldteojCAwj
 SE0Ts8wAKbztXvQmrdcsfNTSq5fuUaOEow==
X-Google-Smtp-Source: ABdhPJxqDf4K77mcRUiq4sPw5CmvNoj2nsBvu6G3xOQFUw7U/YckmyrGprwerXYKl65kCEdfcYYmig==
X-Received: by 2002:a17:903:2341:b0:13e:ae30:412 with SMTP id
 c1-20020a170903234100b0013eae300412mr7387578plh.15.1634850355273; 
 Thu, 21 Oct 2021 14:05:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/48] tcg/optimize: Split out fold_mulu2_i32
Date: Thu, 21 Oct 2021 14:05:11 -0700
Message-Id: <20211021210539.825582-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 2086e894c6..142f445cb1 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -889,6 +889,24 @@ static bool fold_multiply(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
+        uint32_t a = arg_info(op->args[2])->val;
+        uint32_t b = arg_info(op->args[3])->val;
+        uint64_t r = (uint64_t)a * b;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)r);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(r >> 32));
+        return true;
+    }
+    return false;
+}
+
 static bool fold_nand(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1695,22 +1713,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_mulu2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])) {
-                uint32_t a = arg_info(op->args[2])->val;
-                uint32_t b = arg_info(op->args[3])->val;
-                uint64_t r = (uint64_t)a * b;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(r >> 32));
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1764,6 +1766,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_multiply(&ctx, op);
             break;
+        case INDEX_op_mulu2_i32:
+            done = fold_mulu2_i32(&ctx, op);
+            break;
         CASE_OP_32_64(nand):
             done = fold_nand(&ctx, op);
             break;
-- 
2.25.1


