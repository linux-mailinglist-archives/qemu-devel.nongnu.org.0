Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB843F644
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:48:36 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJoh-00077G-Uf
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaN-0003zo-M6
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:48 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaL-0007wj-8e
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id s24so6045477plp.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zc1IgJRz5A0yD9nF3ZiBVbKqRZed+SZjiAB2N3QmjLE=;
 b=LiCa1VlGPkPhqB92eyjbZTLCVRUHOI/4n1d7p/bePVdVHKsME13PMRK0ZaI6SqjdLa
 WUpv34SgMckNilh1jtJUtN0JGEbg2HsjZ+D+DvW+XA1nnlqUQFbU3OZ63UuYHLQby6ue
 5NVjBxa9XGrtfxrlVpTK34a+N206h/8aTreyv/ob4sxUMos8pBlB1lIpZMSkVibxFhSI
 ht9aSoJ9mGrD8LJXZe0IlDEkeInCgp9UYDkLth//Rp3MYEl4Ie09nvz5WsH4ll3xlbDW
 RTCnLrBLGzQdx6YQZwQSgaK/SjAsgzb0vsEPLA3G93uHcB7gxWQSByXA35ulGes5ibRV
 T/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zc1IgJRz5A0yD9nF3ZiBVbKqRZed+SZjiAB2N3QmjLE=;
 b=W6pi+4vIrzEYPL/9XKPAWalaakPxKdtvqSA7ZD//RfaRsNQT90ya3gBipPTH64w5zi
 lN/wHylVwQNL9vQLKqeFVfYq/n+xjoR1UPFoqvn2kN/uR/v0S6YSUPMJf/rgYfoBKPXz
 ItDfLCUwiVJzW56uGZARvo45EIbLGpn0alQ6zFIqbuu0ZIK3KKsXz+42YreVoZouzgZE
 +pdGzEqVm5pjQhNBQau7JvbrbCZ7w+e1VvmRVYhiYPR17qm7TTd/Z60x3GqcaWT+ynyx
 geDmwi4lG07ZNK3OMjR66pJFT3gvvH84/tEonXDwiJfllyA58X/sV7Y7VoPkuTDyo1S8
 dkSA==
X-Gm-Message-State: AOAM530jVHanqlL1L/zjtg/9FYOKFMLJEovLPQB9TFlUCZfI1AcSE/3f
 MJrkNQR4bwZKVBIWRr+5iB3M10S2/J7gLA==
X-Google-Smtp-Source: ABdhPJyg2TuRsVFohsds08MBbIxjkOvk2bFoFNEswqkiyvNqIQ6GPbJUVcy2Ajf6HTkF1d63i/XASg==
X-Received: by 2002:a17:90a:8592:: with SMTP id
 m18mr2173664pjn.184.1635482023828; 
 Thu, 28 Oct 2021 21:33:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/60] tcg/optimize: Change fail return for
 do_constant_folding_cond*
Date: Thu, 28 Oct 2021 21:32:44 -0700
Message-Id: <20211029043329.1518029-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return -1 instead of 2 for failure, so that we can
use comparisons against 0 for all cases.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 145 +++++++++++++++++++++++++------------------------
 1 file changed, 74 insertions(+), 71 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 77cdffaaef..19c01687b4 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -502,10 +502,12 @@ static bool do_constant_folding_cond_eq(TCGCond c)
     }
 }
 
-/* Return 2 if the condition can't be simplified, and the result
-   of the condition (0 or 1) if it can */
-static TCGArg do_constant_folding_cond(TCGOpcode op, TCGArg x,
-                                       TCGArg y, TCGCond c)
+/*
+ * Return -1 if the condition can't be simplified,
+ * and the result of the condition (0 or 1) if it can.
+ */
+static int do_constant_folding_cond(TCGOpcode op, TCGArg x,
+                                    TCGArg y, TCGCond c)
 {
     uint64_t xv = arg_info(x)->val;
     uint64_t yv = arg_info(y)->val;
@@ -527,15 +529,17 @@ static TCGArg do_constant_folding_cond(TCGOpcode op, TCGArg x,
         case TCG_COND_GEU:
             return 1;
         default:
-            return 2;
+            return -1;
         }
     }
-    return 2;
+    return -1;
 }
 
-/* Return 2 if the condition can't be simplified, and the result
-   of the condition (0 or 1) if it can */
-static TCGArg do_constant_folding_cond2(TCGArg *p1, TCGArg *p2, TCGCond c)
+/*
+ * Return -1 if the condition can't be simplified,
+ * and the result of the condition (0 or 1) if it can.
+ */
+static int do_constant_folding_cond2(TCGArg *p1, TCGArg *p2, TCGCond c)
 {
     TCGArg al = p1[0], ah = p1[1];
     TCGArg bl = p2[0], bh = p2[1];
@@ -565,7 +569,7 @@ static TCGArg do_constant_folding_cond2(TCGArg *p1, TCGArg *p2, TCGCond c)
     if (args_are_copies(al, bl) && args_are_copies(ah, bh)) {
         return do_constant_folding_cond_eq(c);
     }
-    return 2;
+    return -1;
 }
 
 static bool swap_commutative(TCGArg dest, TCGArg *p1, TCGArg *p2)
@@ -1321,22 +1325,21 @@ void tcg_optimize(TCGContext *s)
             break;
 
         CASE_OP_32_64(setcond):
-            tmp = do_constant_folding_cond(opc, op->args[1],
-                                           op->args[2], op->args[3]);
-            if (tmp != 2) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
+            i = do_constant_folding_cond(opc, op->args[1],
+                                         op->args[2], op->args[3]);
+            if (i >= 0) {
+                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
                 continue;
             }
             break;
 
         CASE_OP_32_64(brcond):
-            tmp = do_constant_folding_cond(opc, op->args[0],
-                                           op->args[1], op->args[2]);
-            switch (tmp) {
-            case 0:
+            i = do_constant_folding_cond(opc, op->args[0],
+                                         op->args[1], op->args[2]);
+            if (i == 0) {
                 tcg_op_remove(s, op);
                 continue;
-            case 1:
+            } else if (i > 0) {
                 memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
                 op->opc = opc = INDEX_op_br;
                 op->args[0] = op->args[3];
@@ -1345,10 +1348,10 @@ void tcg_optimize(TCGContext *s)
             break;
 
         CASE_OP_32_64(movcond):
-            tmp = do_constant_folding_cond(opc, op->args[1],
-                                           op->args[2], op->args[5]);
-            if (tmp != 2) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[4-tmp]);
+            i = do_constant_folding_cond(opc, op->args[1],
+                                         op->args[2], op->args[5]);
+            if (i >= 0) {
+                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[4 - i]);
                 continue;
             }
             if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
@@ -1412,14 +1415,14 @@ void tcg_optimize(TCGContext *s)
             break;
 
         case INDEX_op_brcond2_i32:
-            tmp = do_constant_folding_cond2(&op->args[0], &op->args[2],
-                                            op->args[4]);
-            if (tmp == 0) {
+            i = do_constant_folding_cond2(&op->args[0], &op->args[2],
+                                          op->args[4]);
+            if (i == 0) {
             do_brcond_false:
                 tcg_op_remove(s, op);
                 continue;
             }
-            if (tmp == 1) {
+            if (i > 0) {
             do_brcond_true:
                 op->opc = opc = INDEX_op_br;
                 op->args[0] = op->args[5];
@@ -1443,20 +1446,20 @@ void tcg_optimize(TCGContext *s)
             if (op->args[4] == TCG_COND_EQ) {
                 /* Simplify EQ comparisons where one of the pairs
                    can be simplified.  */
-                tmp = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                               op->args[0], op->args[2],
-                                               TCG_COND_EQ);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_brcond_i32,
+                                             op->args[0], op->args[2],
+                                             TCG_COND_EQ);
+                if (i == 0) {
                     goto do_brcond_false;
-                } else if (tmp == 1) {
+                } else if (i > 0) {
                     goto do_brcond_high;
                 }
-                tmp = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                               op->args[1], op->args[3],
-                                               TCG_COND_EQ);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_brcond_i32,
+                                             op->args[1], op->args[3],
+                                             TCG_COND_EQ);
+                if (i == 0) {
                     goto do_brcond_false;
-                } else if (tmp != 1) {
+                } else if (i < 0) {
                     break;
                 }
             do_brcond_low:
@@ -1470,31 +1473,31 @@ void tcg_optimize(TCGContext *s)
             if (op->args[4] == TCG_COND_NE) {
                 /* Simplify NE comparisons where one of the pairs
                    can be simplified.  */
-                tmp = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                               op->args[0], op->args[2],
-                                               TCG_COND_NE);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_brcond_i32,
+                                             op->args[0], op->args[2],
+                                             TCG_COND_NE);
+                if (i == 0) {
                     goto do_brcond_high;
-                } else if (tmp == 1) {
+                } else if (i > 0) {
                     goto do_brcond_true;
                 }
-                tmp = do_constant_folding_cond(INDEX_op_brcond_i32,
-                                               op->args[1], op->args[3],
-                                               TCG_COND_NE);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_brcond_i32,
+                                             op->args[1], op->args[3],
+                                             TCG_COND_NE);
+                if (i == 0) {
                     goto do_brcond_low;
-                } else if (tmp == 1) {
+                } else if (i > 0) {
                     goto do_brcond_true;
                 }
             }
             break;
 
         case INDEX_op_setcond2_i32:
-            tmp = do_constant_folding_cond2(&op->args[1], &op->args[3],
-                                            op->args[5]);
-            if (tmp != 2) {
+            i = do_constant_folding_cond2(&op->args[1], &op->args[3],
+                                          op->args[5]);
+            if (i >= 0) {
             do_setcond_const:
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
                 continue;
             }
             if ((op->args[5] == TCG_COND_LT || op->args[5] == TCG_COND_GE)
@@ -1516,20 +1519,20 @@ void tcg_optimize(TCGContext *s)
             if (op->args[5] == TCG_COND_EQ) {
                 /* Simplify EQ comparisons where one of the pairs
                    can be simplified.  */
-                tmp = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                               op->args[1], op->args[3],
-                                               TCG_COND_EQ);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_setcond_i32,
+                                             op->args[1], op->args[3],
+                                             TCG_COND_EQ);
+                if (i == 0) {
                     goto do_setcond_const;
-                } else if (tmp == 1) {
+                } else if (i > 0) {
                     goto do_setcond_high;
                 }
-                tmp = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                               op->args[2], op->args[4],
-                                               TCG_COND_EQ);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_setcond_i32,
+                                             op->args[2], op->args[4],
+                                             TCG_COND_EQ);
+                if (i == 0) {
                     goto do_setcond_high;
-                } else if (tmp != 1) {
+                } else if (i < 0) {
                     break;
                 }
             do_setcond_low:
@@ -1543,20 +1546,20 @@ void tcg_optimize(TCGContext *s)
             if (op->args[5] == TCG_COND_NE) {
                 /* Simplify NE comparisons where one of the pairs
                    can be simplified.  */
-                tmp = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                               op->args[1], op->args[3],
-                                               TCG_COND_NE);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_setcond_i32,
+                                             op->args[1], op->args[3],
+                                             TCG_COND_NE);
+                if (i == 0) {
                     goto do_setcond_high;
-                } else if (tmp == 1) {
+                } else if (i > 0) {
                     goto do_setcond_const;
                 }
-                tmp = do_constant_folding_cond(INDEX_op_setcond_i32,
-                                               op->args[2], op->args[4],
-                                               TCG_COND_NE);
-                if (tmp == 0) {
+                i = do_constant_folding_cond(INDEX_op_setcond_i32,
+                                             op->args[2], op->args[4],
+                                             TCG_COND_NE);
+                if (i == 0) {
                     goto do_setcond_low;
-                } else if (tmp == 1) {
+                } else if (i > 0) {
                     goto do_setcond_const;
                 }
             }
-- 
2.25.1


