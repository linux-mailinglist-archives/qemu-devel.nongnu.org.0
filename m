Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299F6A2808
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:02:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPQ-0000NG-Ti; Sat, 25 Feb 2023 04:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPO-0000MI-DT
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:59 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPN-0004pK-0J
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:58 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so1621922pjq.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KgU8jRRsy/4dDTOMKHuklv2pdjkeQjC0sYzVe39pJ+4=;
 b=QIKkmIpc6Z3Xmc110LJe5rbi0YY89jxj2bDY9lg50WkyBHD4ud/2GeALV/qzs1McxF
 THhqQ3QetjQoOYk7BsPEiNclrjbOsakB4BqeCI8qU0KOFmPWgaqMwsdAMp8ZqKMB3acR
 3ZzMcD8jg4jGBuhQVA49oGarMJn2isgirw9RGtf646rIIIJrY5nm70rEJWteEm59RVKr
 2qMtJyJgn5sJqDPq5lSNYykjHNGAfvCZLpINXtrsU7dX7Wrj4oNC1P/l6NffkOz6cUC1
 WMweLpuEiCQ118Z7vaM2KisqSvOJlj11DQfDEg1HIGj1Bq8CLZbxQthEUeO1h0eflQER
 7Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KgU8jRRsy/4dDTOMKHuklv2pdjkeQjC0sYzVe39pJ+4=;
 b=kMSoPsIjeY4ds4rjok6+Bs9pYzyJSVeHr36eTeCgDKMzewc2Q5w7y0aK4JzvRfKKAB
 1pwY+zmve+4Dll1F+q4lv+bawT99r2yaUCVF0/0IRZ4weY0zeWkRBGPxVyxmkCMoACzp
 5mJzmR9WVcbXXUcOq1ccPwUUekY0gdzpCIDxBB/H7bF1sSa2wOXOoAUmXBnlVSn14//2
 7m6clLnmxLW+7zPFOyC8pWa+kTcCwNgDr7oIXW1Hwu4FVobVDSgL7mPyOCZvAeF/obR2
 RlNpdoRrEO1Sklqg4CuBHrc6/PoGZ8VK4D8gUzgzoZOo1pLHeKvYaz1TRd/RbpJKMeCK
 MKxg==
X-Gm-Message-State: AO0yUKXpGSyJnbde35/9m7qkVnlFBijGzWkJnN4wQGsWcqTQc1N5MurL
 Y386J6k/9kJGcykQANF3raEHZmKWQoGWQ/JqxmU=
X-Google-Smtp-Source: AK7set/8EMqetalPFIoFy8MNNNWkrqKMLDiOLvm4PEOqCRusB0zCNgD551jfPtK+WpiVBNe+cxB1Cw==
X-Received: by 2002:a17:902:ec86:b0:196:11b1:101d with SMTP id
 x6-20020a170902ec8600b0019611b1101dmr21029494plg.28.1677315595510; 
 Sat, 25 Feb 2023 00:59:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.00.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 00:59:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 04/30] tcg: Remove branch-to-next regardless of reference
 count
Date: Fri, 24 Feb 2023 22:59:19 -1000
Message-Id: <20230225085945.1798188-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just because the label reference count is more than 1 does
not mean we cannot remove a branch-to-next.  By doing this
first, the label reference count may drop to 0, and then
the label itself gets removed as before.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 06209e6160..0992fb4f31 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2638,7 +2638,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 /* Reachable analysis : remove unreachable code.  */
 static void reachable_code_pass(TCGContext *s)
 {
-    TCGOp *op, *op_next;
+    TCGOp *op, *op_next, *op_prev;
     bool dead = false;
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
@@ -2648,6 +2648,22 @@ static void reachable_code_pass(TCGContext *s)
         switch (op->opc) {
         case INDEX_op_set_label:
             label = arg_label(op->args[0]);
+
+            /*
+             * Optimization can fold conditional branches to unconditional.
+             * If we find a label which is preceded by an unconditional
+             * branch to next, remove the branch.  We couldn't do this when
+             * processing the branch because any dead code between the branch
+             * and label had not yet been removed.
+             */
+            op_prev = QTAILQ_PREV(op, link);
+            if (op_prev->opc == INDEX_op_br &&
+                label == arg_label(op_prev->args[0])) {
+                tcg_op_remove(s, op_prev);
+                /* Fall through means insns become live again.  */
+                dead = false;
+            }
+
             if (label->refs == 0) {
                 /*
                  * While there is an occasional backward branch, virtually
@@ -2661,21 +2677,6 @@ static void reachable_code_pass(TCGContext *s)
                 /* Once we see a label, insns become live again.  */
                 dead = false;
                 remove = false;
-
-                /*
-                 * Optimization can fold conditional branches to unconditional.
-                 * If we find a label with one reference which is preceded by
-                 * an unconditional branch to it, remove both.  This needed to
-                 * wait until the dead code in between them was removed.
-                 */
-                if (label->refs == 1) {
-                    TCGOp *op_prev = QTAILQ_PREV(op, link);
-                    if (op_prev->opc == INDEX_op_br &&
-                        label == arg_label(op_prev->args[0])) {
-                        tcg_op_remove(s, op_prev);
-                        remove = true;
-                    }
-                }
             }
             break;
 
-- 
2.34.1


