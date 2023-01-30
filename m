Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A09C681C04
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFz-0008EL-JG; Mon, 30 Jan 2023 16:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFm-0007Vf-9A
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:52 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFk-0005EY-Mq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:50 -0500
Received: by mail-pg1-x531.google.com with SMTP id r18so8566498pgr.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0QQj1V4HE3kyNzJq2NL4R3goe68TydpAVl4hV+umL8=;
 b=yRAcliXnSwbAEuxzit2uequ++G4dzmh94UIF+X26a8N64+vEebPbQvfKGU41x3blnX
 Pq0zWaoDCzZ7EvF22ej0Ubl3gXDjQ0VCGV4qomElNslvFvpPro8IYSeJ/HWwFOcN1oNw
 /AJ1K6ApMtK+EXP4HDszrYjXKaje7za/9sxYz9D0S+6MJJcc/0P/lbS25ObH0/wmGHaU
 TEd0teXJsHViXMYy0u//0VcE0lbvoxD6zq+mr6nN7F0gUkP037awJlm+lp+Zoi5YJIU8
 z1yVGytSaycUOi/Pibg7j8FQrDLlUkyDNY044SgCpjr3E36jzGrCiiyW88yhMFIVs7OS
 PjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0QQj1V4HE3kyNzJq2NL4R3goe68TydpAVl4hV+umL8=;
 b=Qi+z/X+5ayPBLYzaEh8rkGtJ4Y+Zi0lPiQBA4rvYgLeyt77BwL3+w6T1YLGYdniR/I
 ufIHAcrPtO12ZHkfnhk44gSKE5uaVu84GOHJC1urASTfQAqOcopFV2LBmbVzagc/SnEy
 zFwq4/hUog2crYZv8Vji6x75QUne/zLyvmTzHlNY4Y6kiED63Wmh/ndqW1LrI1dSMj5S
 gdRVLtQ3mx9b3sFecJO0qIBbDiXs+JDxiesNWuqfVbXwCTkU+MkGm0fvC1xF1t+wJ5TU
 lYh3+RSDGMHjBpg3id97zoPqR3O8SEJDurVZ1PqYPNrO7I3vMAVXYxMZQAY7TqM17zDV
 jaqg==
X-Gm-Message-State: AFqh2kqm1xsPRMpAWgNhVO8Qew8rfcvghgN+taywE0Yo4Cc9hGHdL59c
 EwNm4QAFU74gF4TbNiaMpFWxHt0BDVHzKnF0
X-Google-Smtp-Source: AMrXdXtL7itEulAkjBF0m8Lr7R3oXyPsCzvoulhkYmIFzqjG6c/Uf80Yuq+BFbttG6j2Tp3ghnPJdQ==
X-Received: by 2002:a62:4e8e:0:b0:580:fb8e:3044 with SMTP id
 c136-20020a624e8e000000b00580fb8e3044mr52621079pfb.22.1675112387233; 
 Mon, 30 Jan 2023 12:59:47 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 04/27] tcg: Remove branch-to-next regardless of reference count
Date: Mon, 30 Jan 2023 10:59:12 -1000
Message-Id: <20230130205935.1157347-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0bb0bdbe43..fc0de1dccc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2636,7 +2636,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 /* Reachable analysis : remove unreachable code.  */
 static void reachable_code_pass(TCGContext *s)
 {
-    TCGOp *op, *op_next;
+    TCGOp *op, *op_next, *op_prev;
     bool dead = false;
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
@@ -2646,6 +2646,22 @@ static void reachable_code_pass(TCGContext *s)
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
@@ -2659,21 +2675,6 @@ static void reachable_code_pass(TCGContext *s)
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


