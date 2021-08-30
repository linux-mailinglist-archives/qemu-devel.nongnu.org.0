Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510863FB140
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:34:55 +0200 (CEST)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKasb-0004Cl-Co
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajK-0004KF-GY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:14 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajI-0007da-UJ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:14 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so6118566pjc.3
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bFEHXckoWLl6WYBVU2oMHX0JRAtxLHgwzzCcXri0wL4=;
 b=LnrVPABpn12NqnW/VqN4Lbv2TlrDROhJaRi8yAUmmcSl/rP3RpyYZFbW1N6/hkDxGl
 s4RdcDYlzGDnqEQYgianK7WKbvaaI/S64AyV6/eEAZF4bIxu9zCs3xPAnuNl4fvQ2EzH
 WhBopTTi3oZK0ZEzcNunpsBI07KaOuK14C2OpGA3bRNqVj8uAOW4Yl+NQgae6X+uCtG+
 VOM5RqjC3ROvfliV15nNIXc/1Zoeagto7xFDrxtoaDmCkW+ZtU9G/L3Jyhuvz2yhupw8
 FGvM4b380gXXrqBeJXYrymv7tjojoX8FzdOQU0wDkmzlhctrvsjGaNBAN4XLxEBVyk+f
 nVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFEHXckoWLl6WYBVU2oMHX0JRAtxLHgwzzCcXri0wL4=;
 b=UYMNfUzufLQJNVMEgwER+uIGrRvgR5F2zYUwYZdWPOg0yY++U1+JspghJJDdtTpZex
 ynTLyjlMcaQiQ945lgh6X1f9n61WtHgvDBLXzDE7tUo+zqip6okKsfIQXiYXseFGMS/K
 d/euIcgHTIwsZixNxbNQHpncCL/DAQgEe9vt9lWr5nF8taa8tYYLcu3o6VMBehuLNpLN
 gbmTr+XI7VbSJpcbf7wsheHiNvktT9/1HwkIw2xCitf9evi2LnEaJ2O1sAEaM1Q77Qu6
 jSLPu5M7+J0Mre6mVZtutYmrOOpJ8AL6UKIjTNbYhviEXkIhmzOK6jkAQGWPqfRLo9/l
 JJjA==
X-Gm-Message-State: AOAM533dU3dfMm3jIlLYg97nubigvVd4U4umAJ9lqQPHMvrUJSFCDxgU
 73NP8EnqFu0eKxsgL5Llwd0vm+PvO6FLDA==
X-Google-Smtp-Source: ABdhPJypPXZ5uA6HeiIKleN2VNaaqLfWnmL7jgVEm1rlkR42kW7eyyTp9TnsC680YjaeUSyTJxxuLQ==
X-Received: by 2002:a17:90a:598e:: with SMTP id
 l14mr37190867pji.28.1630304711587; 
 Sun, 29 Aug 2021 23:25:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/48] tcg/optimize: Split out fold_mov
Date: Sun, 29 Aug 2021 23:24:32 -0700
Message-Id: <20210830062451.639572-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the final entry in the main switch that was in a
different form.  After this, we have the option to convert
the switch into a function dispatch table.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1361bffab9..ee674fe623 100644
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


