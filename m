Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2140D6AB3D9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:44:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYytb-0004OC-Qn; Sun, 05 Mar 2023 19:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytW-0004Mx-G2
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:02 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytU-0006Mr-2g
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:01 -0500
Received: by mail-pl1-x62e.google.com with SMTP id i3so8503667plg.6
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PIh01pdanEa91gX26Vw7wtWJvOaRYVbGbF+LBe5kMQ=;
 b=r7aBiMMf1Cihe/iS5fxH5oCZGO0kVuCgObcydyhupIaWsI9KRpvrkgDRFQM0s4/3zz
 qFieje9ssmoG2wlhq9S/MeF7Agpwe3KNvefg9AmwXYIyb0ZjzyvStKsq8U4eTqVYntoH
 3/1No+xAh1fdZuz5jM6590JQdFclyWLIlANi+hCTofKfWQi4nvsP2iYURJ7jcgIgkKSI
 G66eRsozp0cstlW3m7KiKt4u9uUV8R7rIo22OwwuNTR2eg3bdC0y7N4220FNom/mcBxG
 cHh/qME+5cOTxoyuTWnGfAorYvpj8wRVHR2Vit3jJ+B6Uzf44hDjmSKF222Ca5RWRa5i
 CY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PIh01pdanEa91gX26Vw7wtWJvOaRYVbGbF+LBe5kMQ=;
 b=ZEmplir42oKtQajfHv4zjO9eEceAcAPPqsi3fkyegp+6lLLz3sL7ZoVQRGysVyCbDb
 lXNrU7AASHcUekR1FBbOwNg3ZQh5wGwb45SlglBuvw2UZzMGE07kdVMClsXvl+IWxvrh
 oVzKmfRHCVURhA50Qsywf7ieMfNVWfwYbOO+RASJ1kT2JauCmnIH+gQUyBO1C3iJNhXs
 p9slSHrpTa7HiMbXd1gvQnyz5u6BIMg0c5uEJmSfgjTcEF6HFiwZ3hIfk6kDqFBOpRY4
 AmGaTfRxTUuE+qvMClk5VIhsh0x8E2IoBzvgFrH5iyQ1LLM6/kv4s43jHculyRvdKDI1
 aslg==
X-Gm-Message-State: AO0yUKXwG61iqcnjHPxM7bYsjSbPy0u4Czg8BhrNSM3jn1N4bfk/pzxY
 KKbRkhguSYXMM2YMfGaEfpEVlceDRt+9ar3UiQfRNg==
X-Google-Smtp-Source: AK7set/rrOOzH88Mj5Tenupc5NfrCneuRnslONLoTxH4Tzw2VILLj/dFleEN79u/Vj0xv1geGbo8eQ==
X-Received: by 2002:a17:90b:4d85:b0:235:b712:4180 with SMTP id
 oj5-20020a17090b4d8500b00235b7124180mr8464163pjb.24.1678063198549; 
 Sun, 05 Mar 2023 16:39:58 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:39:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 03/84] tcg: Merge two sequential labels
Date: Sun,  5 Mar 2023 16:38:33 -0800
Message-Id: <20230306003954.1866998-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Tested-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0b93359d3c..cd8f356adb 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2628,6 +2628,31 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
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
@@ -2643,6 +2668,24 @@ reachable_code_pass(TCGContext *s)
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
@@ -2650,7 +2693,6 @@ reachable_code_pass(TCGContext *s)
              * processing the branch because any dead code between the branch
              * and label had not yet been removed.
              */
-            op_prev = QTAILQ_PREV(op, link);
             if (op_prev->opc == INDEX_op_br &&
                 label == arg_label(op_prev->args[0])) {
                 tcg_op_remove(s, op_prev);
-- 
2.34.1


