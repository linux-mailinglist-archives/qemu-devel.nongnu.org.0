Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671DA6AA469
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDvy-0005tQ-Dy; Fri, 03 Mar 2023 17:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYDvg-0005Rn-GG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:31:08 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYDvZ-0007vb-Di
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:31:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so7709903pjh.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 14:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677882660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p3fG4f/WbptHUCzZ+xxjE7jM7Pmvnki7ftb6PyqTKjk=;
 b=QDay1OksE6n8YpgBiktPBEmWYUlcSLyiRBD2X8FXAmb4FDEEFzluiCCrB0AbQkfCZM
 p/YI3O8DwULQ5F5SdzGh3xFxO07Pfs7AU6wubesb/rW8G+4mTgkm9v0HJNOWurX/M1w/
 7T7HC50P7pKCqMZfOpbpnAvd8ZoT42os6yVfcIk+BDlIigGsMLfj3/7HIgM3fcgxsJiW
 7bcGz28viOeYtlHIaPIGZ9im3Hz5aJh1gEmRsXss41RvlAxBv0d4tKuRiDRmlAfGNSb7
 6Bixy63Gat6emo1bsd13I027bsXMfIQi7YW9KibRvy5wHiWOl3xRmEW/bjmf8v9uBh1O
 v8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677882660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p3fG4f/WbptHUCzZ+xxjE7jM7Pmvnki7ftb6PyqTKjk=;
 b=mY/d7DNfVXWKsd3OrMgvquWJlRIEO+EY0vm2BgaMb5pUGnuqm/l7ITsvTCZC7r5bpK
 85b1ynqPK4oh6AQ/xs9OJfWZAj0z07sFGeokr3vnhYnp2EkgqCEEO6M22HN3dew6/u8b
 VfvZYcDh1h86QIkyvdOiV24z9vTamyZBWOj0fl0XXazYuO8hg4Zp25Yn9s43/CVWXaps
 5IxqpSxhw4e9bpNBT0QMStJknkHk8AJI4a+OCMRPztcY9WiJVGHBkNbE639MHi1AgroY
 w6pRNUUmeH4wMYCH221JLV9cjhHOO8Z5lCwrJMe8ZubCsVvyiwN2v74m9orR/EUv6kUG
 Vnmg==
X-Gm-Message-State: AO0yUKX1YK4RSKuPiR+pBCWh6/XPgZk35b51oW2fzENn1gzicqJqJvsc
 dlprdSMtXHkh/OqhRIUxRrvyERwaN3yTcvsIeVKoOw==
X-Google-Smtp-Source: AK7set+i0GNlc3DNfUoay/EvhQmSnjXx1o24h2p+oHaxqdo9RgP4pzPq6WOvjDh2h0oF/EavBQC/5Q==
X-Received: by 2002:a17:902:ecc1:b0:19e:23c1:4c2e with SMTP id
 a1-20020a170902ecc100b0019e23c14c2emr4014395plh.59.1677882659977; 
 Fri, 03 Mar 2023 14:30:59 -0800 (PST)
Received: from stoup.. (174-21-74-159.tukw.qwest.net. [174.21.74.159])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902b60500b0019a87ede846sm1963742pls.285.2023.03.03.14.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 14:30:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	tsimpson@quicinc.com
Subject: [PATCH 2/2] tcg: Merge two sequential labels
Date: Fri,  3 Mar 2023 14:30:56 -0800
Message-Id: <20230303223056.966286-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303223056.966286-1-richard.henderson@linaro.org>
References: <20230303223056.966286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Remove the first label and redirect all uses to the second.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a8ec11dfb9..88614102cd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2627,6 +2627,31 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
     return new_op;
 }
 
+static void move_label_uses(TCGLabel *to, TCGLabel *from)
+{
+    TCGLabelUse *u;
+
+    QSIMPLEQ_FOREACH(u, &from->branches, next) {
+        TCGOp *op = u->op;
+        switch (op->opc) {
+        case INDEX_op_br:
+            op->args[0] = label_arg(to);
+            break;
+        case INDEX_op_brcond_i32:
+        case INDEX_op_brcond_i64:
+            op->args[3] = label_arg(to);
+            break;
+        case INDEX_op_brcond2_i32:
+            op->args[5] = label_arg(to);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    QSIMPLEQ_CONCAT(&to->branches, &from->branches);
+}
+
 /* Reachable analysis : remove unreachable code.  */
 static void __attribute__((noinline))
 reachable_code_pass(TCGContext *s)
@@ -2642,6 +2667,24 @@ reachable_code_pass(TCGContext *s)
         case INDEX_op_set_label:
             label = arg_label(op->args[0]);
 
+            /*
+             * Note that the first op in the TB is always a load,
+             * so there is always something before a label.
+             */
+            op_prev = QTAILQ_PREV(op, link);
+
+            /*
+             * If we find two sequential labels, move all branches to
+             * reference the second label and remove the first label.
+             * Do this before branch to next optimization, so that the
+             * middle label is out of the way.
+             */
+            if (op_prev->opc == INDEX_op_set_label) {
+                move_label_uses(label, arg_label(op_prev->args[0]));
+                tcg_op_remove(s, op_prev);
+                op_prev = QTAILQ_PREV(op, link);
+            }
+
             /*
              * Optimization can fold conditional branches to unconditional.
              * If we find a label which is preceded by an unconditional
@@ -2649,7 +2692,6 @@ reachable_code_pass(TCGContext *s)
              * processing the branch because any dead code between the branch
              * and label had not yet been removed.
              */
-            op_prev = QTAILQ_PREV(op, link);
             if (op_prev->opc == INDEX_op_br &&
                 label == arg_label(op_prev->args[0])) {
                 tcg_op_remove(s, op_prev);
-- 
2.34.1


