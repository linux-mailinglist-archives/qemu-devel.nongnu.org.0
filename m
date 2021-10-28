Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E643D993
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:57:15 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvbO-0002Lc-2E
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMM-0004ZD-KV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:42 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMK-00035a-Lu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:42 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f11so4536914pfc.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtIqRUcfOkY+GJe8JI9dBf6G7CRUHHnpPIR2B14bLgE=;
 b=qFJdqN4LOaouE3wtL9zmlsHnuxxeKaE4Inrmb5VHlX0Fepd4qWfO0eyEwrA5eQr+CP
 Ve85c3P4fNHewi4BRB32Yk/s8F3yt3qp2awtY84/0KfxglDLn0Lgcz2vMQOgbCftfvGv
 qKXsTGpMgOZj1/qNOTPgiLxYyIklnccKPO6XXNA9zoAxiQ/LuO5oXLiwcQJcgSs3FdbY
 D42iQxAyJzISJwC5GPb+zWLeoElDfJwB+KMGuC/ES98BBwbdI80700PFkL+pyVyvaQnr
 4x9c4AEvecj5ViCVgefcAjxeRuyPitiFuiQPxYIPeIBPBpmB0rzlRdkIX5zNhqLL4FLz
 KJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtIqRUcfOkY+GJe8JI9dBf6G7CRUHHnpPIR2B14bLgE=;
 b=MS7lTrbh7/mZiZNLYa24QShOeowozvRB7vnaUB7mCFFZwSNYfCjiAWbf/0QtqBgU0J
 jy9L8fepZOVK6X5+4jCn4CoRTWaksjTzU7CpxTush21CLOWmwUUOf2R43XAX546zLlCm
 L1cs383HY03qr18jem80NgEc1sihxROQAIuaMotL//4sh6IZLI2AyJhpWtcsPw6gHLLB
 Wx3n53lgd/mWxdUgBt1zI7ihr/oLNC1HihU6s9EjI5FjMVarvQWloIG0lzzL2soHfFYc
 IIwvgeozXBXDbMY6OzC1W8D8Anap3+6dh9hiCIKvV+iQSQQKwKxh59+eqSkxm6/l1kuc
 f0cw==
X-Gm-Message-State: AOAM5335SY+a1FLlW6v9/UUGCeou0s0w16yAUeHso6tFyVuzKC5Hp0A7
 Bs4gPr1M4BHbsAk/iBny8ozWr+ukvEuhQQ==
X-Google-Smtp-Source: ABdhPJxoFTh6vNo0ORlt15iI5K8nx6i2UDJ4APpj1F17Z2ZUk+CB5nrde9cifEOZBLzuw0Bcgxu3BA==
X-Received: by 2002:a05:6a00:1348:b0:47c:e8f1:69a3 with SMTP id
 k8-20020a056a00134800b0047ce8f169a3mr1519446pfu.86.1635388899329; 
 Wed, 27 Oct 2021 19:41:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/56] tcg/optimize: Move prev_mb into OptContext
Date: Wed, 27 Oct 2021 19:40:45 -0700
Message-Id: <20211028024131.1492790-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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


