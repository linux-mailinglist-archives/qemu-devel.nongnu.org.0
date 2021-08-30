Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC933FB16F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:53:59 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbB3-0004h2-3t
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajN-0004On-8A
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajK-0007fB-ML
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so11459483pjb.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8VyjiCk35dVBOAey05f2F0yRnc6SKld30EqhfRoEcOY=;
 b=eOmzO6muFOnocyf4wX9qzJjP2XmAUdlY1aUiqPLuO3qu9upDxaUx96p0m5NvNE/OZK
 Dkby5ci7AWSLs3bRBuRlfEWLqsnnQiTHWekmEf8DLuIr9JfkJGaU8/otuVuFK3cHiPx+
 +Vn2g7I83/eaVEWhtFevQ5ps72ehfqY7lvl+i8eS0uF11oLVxq2hJwtu1qbqdqaitpPU
 Bl5RXfTNfgXo4Nbrh0xXWWdUEydutQbUmW6wixlkfypi7jXeoiy0hnGTyU2bthg+6sMl
 Kl99u1DKmG7I9Uy42kAd+ICLFdK0+/42rAgW915a92Wnsx7Y4DyKTOzWBXfVaHdSJwVk
 eOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VyjiCk35dVBOAey05f2F0yRnc6SKld30EqhfRoEcOY=;
 b=GeaS1ehqPO7S7nB3NgCW3UmTO7PBf1Sbs6R+Fa/6MzmE/MgRTr/pEaA73MrXrm1y5F
 tWS8N4SoltQHm3SRrDKs60jlOe6M1jgmG8E3xAz5BcDNKW8kEldJ4ionG9rvJoxKMNkG
 AcR0p9hLZqELkO3tf4o3IptlA5jbtyA0FxBE80wmKsWm5DPOC64WOM9/bxPse8OE7MBw
 gzMNml2AuVGoNj1wTFUxe86/nmujffI0LgO53Hkb1XTB4UDi6/z7UtYf0/6YMSA+5gOf
 XDBXERxRplICAoFUxa6WCIf8/P1cqoZEHV3pv7xMgxpJw7jHH5oMt2FhoaThEDO5tNeD
 v+gg==
X-Gm-Message-State: AOAM531B0ZeLreEfzR1pQYUWzTRelnax/k+3ksxIfZVRuNsTfdKVLZK/
 MDZw7GkatrNwQ/LQash1qxVQA6GnLBRRzQ==
X-Google-Smtp-Source: ABdhPJwn2JV3tWweng0isN1yYHz1CNO3pd8jjHNXi9Ph9vo5EXUL5y40VIJIrO6Qc7eDUhuLngslxg==
X-Received: by 2002:a17:90a:5411:: with SMTP id
 z17mr37453580pjh.67.1630304713445; 
 Sun, 29 Aug 2021 23:25:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/48] tcg/optimize: Split out fold_xi_to_i
Date: Sun, 29 Aug 2021 23:24:35 -0700
Message-Id: <20210830062451.639572-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, 0 => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index cb05da7b39..343fb7590a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -695,6 +695,15 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/* If the binary operation has second argument @i, fold to @i. */
+static bool fold_xi_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[2]) && arg_info(op->args[2])->val == i) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /* If the binary operation has both arguments equal, fold to @i. */
 static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -763,6 +772,7 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -1078,7 +1088,11 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
 static bool fold_multiply(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
@@ -1740,22 +1754,6 @@ void tcg_optimize(TCGContext *s)
             continue;
         }
 
-        /* Simplify expression for "op r, a, 0 => movi r, 0" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(and):
-        CASE_OP_32_64_VEC(mul):
-        CASE_OP_32_64(muluh):
-        CASE_OP_32_64(mulsh):
-            if (arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /*
          * Process each opcode.
          * Sorted alphabetically by opcode as much as possible.
-- 
2.25.1


