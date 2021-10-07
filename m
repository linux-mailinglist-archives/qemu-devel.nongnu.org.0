Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E4425CE6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:07:01 +0200 (CEST)
Received: from localhost ([::1]:52504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZfQ-0003dG-Td
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTt-0000Go-2V
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:06 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTq-00074i-Qt
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:04 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s11so808434pgr.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bZjsDV3+PdEwghAz4tiS3FK0KdMqPyfVHay2I29+vhA=;
 b=WosyALx1t6l24kQR8bqSt55BuKJ4ggw5DN4hagvynywe9hoiNt/+BO0dhfJq1FoLZ8
 czMmwLjL60h3P0PXHPw3O0e6ss0CCqsEh84ivRp9LLeoco8WImH8GAlravsLT4oYCacp
 STnehKaOwDwizvCWvG2IMFn7xRVbqozbpnNN+a2Ka24MisK8CHhCC3IA4OPxTSCd+PyL
 Vi4czyMhG31Jy+KajygzC0jYBkzsuAJdx89Hx4jSEp5GJeGbJSID02i7Vt+qLV7fFz5I
 4XAvMAZIjnzRKGhg7oFyTssEbwS+6Ux+wpcHgOTHMLHUHgL/JxHK8VMntENm82/cBivg
 m/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZjsDV3+PdEwghAz4tiS3FK0KdMqPyfVHay2I29+vhA=;
 b=Lz4Ir8I6SgX+iqW2O8wJgFB9cfzB61Drk+KxgDGlFc8YaigQ2fFaMn0lQ+2Z5ORppL
 GeFFGhMoKtV7E1KLVOtjx44imPBBtrsP73WGGuDIenmT3M4N2w7BlCQPLAvUxXFTzhCn
 /x5LJtlDtTJA6WLh3V05LLXgM8lE2gfAT/m1bICq4rWmfGQd1r/Z20LlTvNfbHeF2sst
 aEvf5IU2xJj5ttjJF/LGuYotW9z4bTbY5gbrPhrIFyz2QRxFPKOYEbjVo4v8dmAY/Bbp
 8r/nbl66LEhKKjAEHzQG4P3l1ixCvk5Y8YmNpbMz/17Hxw/EfOJOiHFLo8dHkuyZ8XuZ
 IeKQ==
X-Gm-Message-State: AOAM530/30kZ3/02QZ5Yjtq+isjVoezJ1qRxdlQdpE8scveEyajriihO
 E7u+E1WUA8lRJ/rMd0kCZ7/NSsTJx0AtQA==
X-Google-Smtp-Source: ABdhPJyjDYQLzO6C4QA81MtTN4lJgFhsABC/LgDGog/cNkWv658zA/wAbWBV8Yg0Xy8yHfgMeEsk8w==
X-Received: by 2002:a63:1d7:: with SMTP id 206mr1207286pgb.387.1633636501322; 
 Thu, 07 Oct 2021 12:55:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/48] tcg/optimize: Move prev_mb into OptContext
Date: Thu,  7 Oct 2021 12:54:13 -0700
Message-Id: <20211007195456.1168070-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

This will expose the variable to subroutines that
will be broken out of tcg_optimize.

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


