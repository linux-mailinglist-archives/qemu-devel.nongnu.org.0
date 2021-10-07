Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF46E425D2A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:23:36 +0200 (CEST)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZvT-0007Af-PJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUD-0000Oq-9w
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU8-0007JR-Ak
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:25 -0400
Received: by mail-pj1-x102f.google.com with SMTP id on6so5703287pjb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/Pjl5+kFZRB+zzLoh9Xly2d8xwka239nWBklw8zSY4=;
 b=wvk10FIbgZh+gifZnY2xmMFxlRh5ukADShhAReIv16Tyz7AiOFJsKg5SedpjRUwzG8
 9wZiPjtSplrrw8X0CUPRRCtfddWjH5nMvKwtKD6Kwxmc1jK9D3E7pFi9v+LNjURf0hKm
 iattPiYRWvlN0J8uXYHOzB7wQP3xE1Cqj1+q93oGlCJtF3GpHI9Bcxn75F13xhw6er0s
 /oyjqreV4pjp2tHvWH1BzhELecNLCDj9tzMBww4PyD1fchO+TtRAbfk9LG0qjdTwA+Bg
 xrVhYDBXG/XjA4vLe119CYTDw0tbJgXj3DJnHYHqVMJ55Sr/MyliS1SJX/wJoTv0IRgL
 g38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/Pjl5+kFZRB+zzLoh9Xly2d8xwka239nWBklw8zSY4=;
 b=52nZIYUW/+o9rosLCY/BAMoCDaXvOv+puUyds1sYsoPLzgZhodeNDWMIU76gU5nQwD
 ze496spWV4X8/hZbtkP1p9z4CSdJU+1Q2ENQFXCCpeiGUlsI/yX7HKwoPgF6sMItdXf9
 57FKKJEcyG7b1mWfM8mPKTutlNfSbEFAicyjgn9Bq/A0G5pmLYy7WhOe6+LZhJm0HCXK
 HnFwWN//+4UNhAgwJcI1LLK0rcYdLC8D06Glu03gO2oP+/Q13EBn0FP9eQOMHJWgqrhS
 yVwAYWf+DXkJMGfk6M8Fn799kWU3r64e2HBC/azl2Z7rA7l7QpAdtUgcF+0h6DIBY8yA
 vMzg==
X-Gm-Message-State: AOAM530SsQXUmH6TKZ2ZIJcl3GP1MT00WW+kjvkKcdGZmopq25j9W5O/
 Et+BavGGQi84klP4uT7z+MJFd/mV8HNq/Q==
X-Google-Smtp-Source: ABdhPJwYXk1fcTDmt33mmoS4qhotjTRQjNY8u9ElUaxIxNAX1v+EeTWbO3reBGRuFeW8sdFzBrrXgw==
X-Received: by 2002:a17:90a:7d0f:: with SMTP id
 g15mr7586924pjl.227.1633636518795; 
 Thu, 07 Oct 2021 12:55:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/48] tcg/optimize: Split out fold_mov
Date: Thu,  7 Oct 2021 12:54:37 -0700
Message-Id: <20211007195456.1168070-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the final entry in the main switch that was in a
different form.  After this, we have the option to convert
the switch into a function dispatch table.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index db50cf6499..3a923fda10 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1012,6 +1012,11 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_mov(OptContext *ctx, TCGOp *op)
+{
+    return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+}
+
 static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
     TCGOpcode opc = op->opc;
@@ -1735,20 +1740,11 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Propagate constants through copy operations and do constant
-           folding.  Constants will be substituted to arguments by register
-           allocator where needed and possible.  Also detect copies. */
+        /*
+         * Process each opcode.
+         * Sorted alphabetically by opcode as much as possible.
+         */
         switch (opc) {
-        CASE_OP_32_64_VEC(mov):
-            done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-            break;
-
-        default:
-            break;
-
-        /* ---------------------------------------------------------- */
-        /* Sorted alphabetically by opcode as much as possible. */
-
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
@@ -1818,6 +1814,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64_VEC(mov):
+            done = fold_mov(&ctx, op);
+            break;
         CASE_OP_32_64(movcond):
             done = fold_movcond(&ctx, op);
             break;
@@ -1885,6 +1884,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
+        default:
+            break;
         }
 
         if (!done) {
-- 
2.25.1


