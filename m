Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD043F63C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:43:15 +0200 (CEST)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJjU-0001LB-Fk
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaJ-0003mf-Hf
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaG-0007uN-UO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:43 -0400
Received: by mail-pj1-x1031.google.com with SMTP id np13so6326083pjb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtIqRUcfOkY+GJe8JI9dBf6G7CRUHHnpPIR2B14bLgE=;
 b=xoQaJWApnbeQYO+Waxg/edICV2Pbi3ondw/Jy2deGY/cLCzJwPbPI1uNAYYJzx5HPP
 qZBd3nSZPsDHc8yV2MHA6bDS1mtGOe2J99i0TJUTwadWJyBvHaAbgeEKggQ43S4FcCqk
 Bn3NjvvVMWdtDlzj4kzxY0zm/m0PyRsiP1y368Us3kKZQqtDLuwKN3npZ1EzVBbQIHBO
 h41zMf4cqT5YUT/x8O0pyTEiebd9EG94dGHPwmm5l0mzeJesiJCwcQsQO/enluToudb1
 7hfynrsH0d8Bu7jxG4P1IFN//6PB1kkvQlfQpMPfnSgtMa0wK+iWTFtPVoPyUABazc4v
 jAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtIqRUcfOkY+GJe8JI9dBf6G7CRUHHnpPIR2B14bLgE=;
 b=QnLEeUfezjc7GCTh1pYpfQKT+NSl6PT2H8TT5ivx2td3ZRaSTaINSUhwJGQ66ZUUte
 s25YjceGJdEHE/HKPb0iTSEdySSx0XPT4GXrvNRd/9AdfvsAGkfLbHrPjbvb4/nlj3jD
 YMBaFXNnLdmrLmf04CElwIpn3GqkOOvOdNSTtN1/Z9iiSuyCeTNvdxiJW79CvdlbAMM6
 XT9p3tRH29/bNg3WSA/aEBrEthz9cgTimwZTgEl/FkR8ZTXvNw6/sc751wUUK28dF/YQ
 A+G0grXO306wFUMas0tw0ENTCKfl+JVeshLJ3sGz4tVlBNo5M1RYgxRETK/+UfKUUWYA
 V6Sg==
X-Gm-Message-State: AOAM5326jatgan01zKn3owdx3MFs2uOm1BrH5TLPkZFakJFMwuOZCIrN
 mc61zihIwb5FQH0t69aWMDr77Mq4TIRmMg==
X-Google-Smtp-Source: ABdhPJxYChkIBArdxFCU7VCINFXwEKuj2L7Sh9HmqHGJlX5rx6EWHeVRgIZfh+gHO6S3yvaCUgwbvA==
X-Received: by 2002:a17:903:2301:b0:141:6a7b:f3d with SMTP id
 d1-20020a170903230100b001416a7b0f3dmr7646440plh.51.1635482019298; 
 Thu, 28 Oct 2021 21:33:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/60] tcg/optimize: Move prev_mb into OptContext
Date: Thu, 28 Oct 2021 21:32:39 -0700
Message-Id: <20211029043329.1518029-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will expose the variable to subroutines that
will be broken out of tcg_optimize.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 627a5b39f6..b875d76354 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -46,6 +46,7 @@ typedef struct TempOptInfo {
 
 typedef struct OptContext {
     TCGContext *tcg;
+    TCGOp *prev_mb;
     TCGTempSet temps_used;
 } OptContext;
 
@@ -609,7 +610,7 @@ static bool swap_commutative2(TCGArg *p1, TCGArg *p2)
 void tcg_optimize(TCGContext *s)
 {
     int nb_temps, nb_globals, i;
-    TCGOp *op, *op_next, *prev_mb = NULL;
+    TCGOp *op, *op_next;
     OptContext ctx = { .tcg = s };
 
     /* Array VALS has an element for each temp.
@@ -1566,7 +1567,7 @@ void tcg_optimize(TCGContext *s)
         }
 
         /* Eliminate duplicate and redundant fence instructions.  */
-        if (prev_mb) {
+        if (ctx.prev_mb) {
             switch (opc) {
             case INDEX_op_mb:
                 /* Merge two barriers of the same type into one,
@@ -1580,7 +1581,7 @@ void tcg_optimize(TCGContext *s)
                  * barrier.  This is stricter than specified but for
                  * the purposes of TCG is better than not optimizing.
                  */
-                prev_mb->args[0] |= op->args[0];
+                ctx.prev_mb->args[0] |= op->args[0];
                 tcg_op_remove(s, op);
                 break;
 
@@ -1597,11 +1598,11 @@ void tcg_optimize(TCGContext *s)
             case INDEX_op_qemu_st_i64:
             case INDEX_op_call:
                 /* Opcodes that touch guest memory stop the optimization.  */
-                prev_mb = NULL;
+                ctx.prev_mb = NULL;
                 break;
             }
         } else if (opc == INDEX_op_mb) {
-            prev_mb = op;
+            ctx.prev_mb = op;
         }
     }
 }
-- 
2.25.1


