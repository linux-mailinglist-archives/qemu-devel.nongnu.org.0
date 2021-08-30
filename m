Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903A3FB15B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:47:09 +0200 (CEST)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb4W-0007sz-3G
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajI-0004F8-KB
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:12 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajH-0007bN-1I
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:12 -0400
Received: by mail-pl1-x62e.google.com with SMTP id m17so7933827plc.6
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qT3pJpxm/CMR3B4sc8UdNVvz1rKuoODGYwGab7PwTiE=;
 b=zrvJ0pS1XyWGP7RZUGwQHdfP2rfh+DKezcq5NYoQKXLN8j9yolITAXSgOC1RqJi9e4
 6r6vKFOcx27w+CqOOLMy7tBDU+HwHHLfh8rppQoI1B67+ZT9dkpDZ5nghEX567aNpoWk
 bYHaBQrD4vU9G5jIT3KignAScF+vLw7ywr7d47+erkMof/BLbWpaNynnid0HUI+1Wzau
 S7ZDfmGBi7GEH0UvKDu3y8KxiA0GlbeFMzULey70fOax/jO4XyCLsPT6Fa1Q7jGDsRS6
 18N/No7yGCi6YSngxHxuH1FQr+vtnQfyq32px0Sq9IUZdgeKUHhHH7KHCQwpKYC0TDgM
 zpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qT3pJpxm/CMR3B4sc8UdNVvz1rKuoODGYwGab7PwTiE=;
 b=CQ8aJBogIWOvFcdBgAG7VHCiN2jpgXuIfLuD/TMH+1/ytIhotkPt7vnMSnfbhY/UO2
 9FCr2RkSX/x9VRQuAIAvT3M+zgpbo/ycF/ZjctrWgS84V804f4SM9bH2YwahsrHOejJQ
 fJR4kGgUmu9Z8jIIvjvcjjTHx3XUdXeJgC/VDUdTPLBHH4od5qyGpkk6qJibqTXmJoXy
 gllErxPOnrDKDJ0V7Iu1ZcK8BbSVjrUvQWCBe1chslfHtwCFbDVl4pylbHGxi/0vuGI+
 kc3sJUjPJpyylUD86BJLU1h1OeVOQwrJxQ3SR+yZwN6kY3aHKHKwuk3oAieKkmS/UJSD
 wX8w==
X-Gm-Message-State: AOAM530QmI+Ou+e0ZXTvEzOrCGWfEVxEgWdpwnfhk4zGiB+zw3qpGNv6
 GdxAGLWYeMQTAjKWsKqwtjivVsVZa9PFgw==
X-Google-Smtp-Source: ABdhPJxCoxljn1VL8RVbHSblNxrRFob3JIqKOxYaqiu4YmrKVcUjZ1PiLW2S5Ar9/bNntJNyxaOvRg==
X-Received: by 2002:a17:90b:a48:: with SMTP id
 gw8mr38012348pjb.145.1630304709748; 
 Sun, 29 Aug 2021 23:25:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/48] tcg/optimize: Split out fold_count_zeros
Date: Sun, 29 Aug 2021 23:24:29 -0700
Message-Id: <20210830062451.639572-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 74c307951d..79e46fec23 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -875,6 +875,20 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+
+        if (t != 0) {
+            t = do_constant_folding(op->opc, t, 0);
+            return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+        }
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[2]);
+    }
+    return false;
+}
+
 static bool fold_ctpop(OptContext *ctx, TCGOp *op)
 {
     return fold_const1(ctx, op);
@@ -1726,20 +1740,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(clz):
-        CASE_OP_32_64(ctz):
-            if (arg_is_const(op->args[1])) {
-                TCGArg v = arg_info(op->args[1])->val;
-                if (v != 0) {
-                    tmp = do_constant_folding(opc, v, 0);
-                    tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                } else {
-                    tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[2]);
-                }
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1764,6 +1764,10 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
+        CASE_OP_32_64(clz):
+        CASE_OP_32_64(ctz):
+            done = fold_count_zeros(&ctx, op);
+            break;
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
-- 
2.25.1


