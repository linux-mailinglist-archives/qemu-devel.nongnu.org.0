Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADAD43BDD8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:26:41 +0200 (CEST)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVq4-00010k-KV
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa4-00031d-NS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:08 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa0-0001yu-Kw
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:08 -0400
Received: by mail-pf1-x430.google.com with SMTP id m26so914575pff.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1Q9hVmZCD5h+WSzcvXil606EiQ6sWYW4OegtZB7+1g=;
 b=t2zJGdFpjGdBLZ2Ew6eukePKpQgIxDyGRpx4VM+gyN+xedGco717JytV5rs3WchecV
 sbC1HXBTuD002hP1vpGYLmK8lJDYug9UQ/C94rXpFoWtJfgHCAGVBDgJYmmYln9JTyzE
 L4cFs8IARcU64/HR3MPK5uCk5kzu/r7p7MWe2+/6b0H/ok5gIzv2TXC7J/w+44wIAmAv
 T+oqhUpj6jqY3cR5pOKb1wSX+i3dLYflbUMvGgJqLEaa0VXylE2UTCN91p6aKEGBwBjQ
 p9iyb3sECvSVg0f6UPqYKncSXLIYYMKfWTeokJrZAS9qktuvXY6QgZFrNGGyBeyVZplW
 H3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1Q9hVmZCD5h+WSzcvXil606EiQ6sWYW4OegtZB7+1g=;
 b=PtIt+5jeNlBM6j5bhqK1xskZSrw2F5PkpfR40NHHHY/ZWTvnfNXVH2a/lQvK72iyE7
 UnBHU3xSo5+yszDdNNhMYufi2HIORZ7q7mwgCJdvw9dR12mJIjHew2qxqch5omdmkGoh
 wGLRU7WoOOBogZYTlgyyWkaKYycLGZmW5e/4SV3/MY5rUz7yqLVqfELJ6yYnnO10EGuz
 trDE/Kmsa2uuJ1PwZ6QV6moCbAkum8hpAAeswRKiRfhiIBuRWFxGs3naEpFBdPb4+Nap
 edwTW63X/hegFYmeuQpEvGFxFv/8Yt7zVjwrhKx3rqNcs1Ox4DCVb0zYln/GKHduIIKH
 ooMg==
X-Gm-Message-State: AOAM533vDe/uwtQOlc4kklb+ptQJMtm7c7jYce8iEcQmtL9aBtqkxL3x
 NfSC82AvCy/Eb1KucLa0KkUCQX7BcgwtQg==
X-Google-Smtp-Source: ABdhPJxl6ib6VSFhHbmk0vR9+YaCUfLb3/Ud79kiB0IAimldxI+fWvAVkSNtAybxoqMTT8O1hzu7ng==
X-Received: by 2002:a63:1d58:: with SMTP id d24mr21663917pgm.316.1635289802865; 
 Tue, 26 Oct 2021 16:10:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/51] tcg/optimize: Split out fold_mulu2_i32
Date: Tue, 26 Oct 2021 16:09:12 -0700
Message-Id: <20211026230943.1225890-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f79cb44944..805522f99d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -899,6 +899,24 @@ static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
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
@@ -1710,22 +1728,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1781,6 +1783,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(muluh):
             done = fold_mul_highpart(&ctx, op);
             break;
+        case INDEX_op_mulu2_i32:
+            done = fold_mulu2_i32(&ctx, op);
+            break;
         CASE_OP_32_64(nand):
             done = fold_nand(&ctx, op);
             break;
-- 
2.25.1


