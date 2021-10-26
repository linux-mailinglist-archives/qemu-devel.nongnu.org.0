Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C14643BDA7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:13:05 +0200 (CEST)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVcu-0005ts-9d
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZo-0002mB-Ij
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:52 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZm-0001vL-LQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:52 -0400
Received: by mail-pf1-x42f.google.com with SMTP id t184so954528pfd.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtIqRUcfOkY+GJe8JI9dBf6G7CRUHHnpPIR2B14bLgE=;
 b=yRjGc0UGLzpZyTLL3VvohhNw9hl07uB1RCgWxGg2EAmRV7wRlx1kzkFVsgjba3cAXr
 L3af4Zocwj93czqVh1AIW3/3ESXAx8U7M/SqSCC/k9OAqVIKQjskgCf6UPzjnL30UpMs
 YcQFQhNFlDIEGNeDHvVLn9ouNP/Z/o9lVPGxssuTH1LuciawwM6EnXPoOUtMyPpRpXOy
 zgYjSnyL3Bzjv5vg6KkehZyM1vAYQDZafJ4KL1DDHpbNLhwaYLQujJikZDtGvN1DZl4m
 4QxWnCPQjX+TcZ9CEBWNk3sOGwjC0HFrrqISFOci4uzESvRRlD2rv+jUVGGUsaRaRrDd
 7lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtIqRUcfOkY+GJe8JI9dBf6G7CRUHHnpPIR2B14bLgE=;
 b=FMdDJOAQgLco5RnhlEL4Pl2U9GRFir+71YhvFbxetLd9x6bjospmdavIPISuAm7rTr
 EG+DVi09TRcOmlHkVi2e+70zOT5U/YlBaQ1P14UWMEMe7kkZjIvMrz5l1Iy53HEvgMIl
 UnK/mBZGjTKmWrblcVeaPFrxbfIy8IKPWc2h68bDR0ZN5MipvSbPjet01WGatS6NUUR9
 VMHGt3pMWXdR7rQODYMImT4EsWQXZ4fgsr8xwqst4X6WgijwVUH4qi98TaYaADN9EfJs
 IlLc7zoRQSOTcwBJprtYvYoeCBaR/jBkvxS2D4CJDU19sJo4+mvJljsAVIBUML0BsDgb
 ON/g==
X-Gm-Message-State: AOAM530gV1D+mtnA1nFOhMnPqCWF4+1c8y5JlnN4gb0VI/Ek5l4ron/3
 du7rDOqfYNNUiVECsnXScBzuDkJlp4sabg==
X-Google-Smtp-Source: ABdhPJxPHCn/oVQkM/X+CZ+7Gu+lApvZJUuHxTIhJ8/i8ImPnPC+cqXRhIxtghphLFPZ3r8U49j2yw==
X-Received: by 2002:a63:2c91:: with SMTP id
 s139mr20959342pgs.116.1635289789423; 
 Tue, 26 Oct 2021 16:09:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/51] tcg/optimize: Move prev_mb into OptContext
Date: Tue, 26 Oct 2021 16:08:57 -0700
Message-Id: <20211026230943.1225890-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
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


