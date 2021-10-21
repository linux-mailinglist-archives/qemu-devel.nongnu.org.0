Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2A436C6F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:09:42 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfJj-00020v-QA
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG1-0007M0-HE
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:50 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfFy-00049H-3E
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:49 -0400
Received: by mail-pf1-x435.google.com with SMTP id k26so1762376pfi.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZmHWabMz/Svl6FBRGNCHM8oJgsBIVJuEYsKye/EvNU=;
 b=PFbJ95A9vw4TObjrwNE2PX5QPsAQhkoO5LgUqQtQpi0/AQQO8JrJFVO2+7Mu72gilx
 Xml7ybpU5pY64ybrbLrgoi+hIiB+hl1xUylE4dCk2g5c4cFuaK+7yP7ehaN23jnZKHcH
 1UhGXDxrFpEAS1fm5STJAR52/gY+XpxFI/xw9E3UADqNA9yaNZSrVorbLDsDieWg6iAW
 HvnxzVkXVduDWXV4Pa2nb79vaS1HUTDQ8SzYVwmhESKOhE1kuhEDrKBYXxf0cDAPptBW
 umIHF6cfXMiHa/s0sdEK7fgM6RRNN2Q1M2HwOp8UZ/E12mNSr6SL1D1dxs0kHLngPYJV
 ciwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZmHWabMz/Svl6FBRGNCHM8oJgsBIVJuEYsKye/EvNU=;
 b=JSOurcrLAiPvqAVOcrQavnEyFw8Jnzb8g0fyQxrooGfYxtW4nj8UMph/BaDRBNvlUI
 5E/YkyEODaCJVUbbBb+XSEw3RByRavw38NP0DhpBLsSbkjcBONveh7Yg3toied6VwXFh
 90xnkNOrXuw5Qi53ZNZAOiEp/1c3TB+1sU4srJFJVwWsfsSJIjBsZ/Nf84mF9PDIoxs5
 89+2wEGYn6qesUzx7OuBmUajcjZ9uUP9q3nUc8es0x5N870nFMOByK2d/W+BY84UW/XI
 Q1D1phgAWw4WWNcFJW7RJmRaJu3WZYKQf2YvPMdLWOUB25GL4MIu4h23s8539uj21k/o
 IGAA==
X-Gm-Message-State: AOAM533WW9YeSnj10PYiriy1uRoTVQPU7G0cKfUebLAzfelvnTOqJ2EQ
 LDKz3mltc9gIACFBYE6mQ7kRzGx7kEZJ8g==
X-Google-Smtp-Source: ABdhPJwb02GGlvERJSxPx+/bMiOOpFZIpEVRiPWAzPWU/PpfjejEzKZyJr+C/qa5e/HrbPnpUGxCpw==
X-Received: by 2002:aa7:978b:0:b0:44c:abf1:a8b8 with SMTP id
 o11-20020aa7978b000000b0044cabf1a8b8mr8425434pfp.35.1634850344418; 
 Thu, 21 Oct 2021 14:05:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/48] tcg/optimize: Move prev_mb into OptContext
Date: Thu, 21 Oct 2021 14:04:56 -0700
Message-Id: <20211021210539.825582-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

This will expose the variable to subroutines that
will be broken out of tcg_optimize.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
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


