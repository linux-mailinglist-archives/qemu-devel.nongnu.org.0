Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C5443D9B1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:11:40 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvpL-0000Av-EA
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMe-0004sl-6Y
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:02 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMZ-0003ie-2U
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:59 -0400
Received: by mail-pg1-x529.google.com with SMTP id 75so4951147pga.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6H+U1ruTrcwXeKIJx0xdeAaOvB86vmaSGOOcxgJmqQ=;
 b=W4jjc5T2G9pC8gRpKmVDcEmJQ3Q/tyaNss8sb3fL/Z4b2r84mUJ7UqoTGbehRIkVrF
 vxP6kZEX0YBRaQIQ84abFJ2E8fw0mA0AiuW7oxhmAtWsoO5siHh5HVSUq63zoQL6phAv
 mdn+0wblrR1pYckDbtH0jWm47wEkUEMXjnbqSIV1W9DwB18axdEZlQ1GQVLn07uQmIT8
 AJbEgk+R+SQtHJEi9LYnmfiERB1Gmzf8DaqH7dYwP0Br0Osfcxsnmzir+PvgjeqvWh4D
 kdVCk3dDOvtPrfvvO0uPnVaTGsYUpddFqXavA+L9lFX0EHPszDVI0tgDt4l2glE4Dk4e
 dDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6H+U1ruTrcwXeKIJx0xdeAaOvB86vmaSGOOcxgJmqQ=;
 b=voR1VVR3mXhzXz60y092Nuk/WOq87nEIhYD3OunyBJ0mjQx7+XVZOkb9bszvFG5m6e
 MzeExZlvoIReeMXQLkD5FK3dAgosMqIg935hf5aiqgCVYEfL13eVDlhRX2/qmcvlC25X
 qUBHauHiLgV3JGM9/8IkkBd46RLn0wS+z3oP3YaCYsX+a/uTskU2AGbO9/hl0o3AKZJE
 r5UPfHNoUyjn3Uj/DSzjcoDbyqBA9ARRQBl5jRdaPUskni7AG5wZDU30uvxD6Tf38Phd
 icC8i1f3LD4QNPPUT8kinUP0fRwWkJjyHv9mOdbZfbwOVnktqQCQT7719xeTtWftsoG+
 qkaw==
X-Gm-Message-State: AOAM533/DnWaWbkn9M6kU8cGnFvbJIXJjb6GONpg/YHCwCIKBFWmUtpa
 qkb7lmH0jZLplIctkvMGndyUpqBwMDew9A==
X-Google-Smtp-Source: ABdhPJyW7ZqlA1Yte+mNpRHOXctdQj+7h5h0kiCb05iWPAsSHUUR7y8L5vw/7E1OnuK4F3k4VP3hEQ==
X-Received: by 2002:a05:6a00:bc1:b0:47b:f093:eb4e with SMTP id
 x1-20020a056a000bc100b0047bf093eb4emr1353814pfu.55.1635388913196; 
 Wed, 27 Oct 2021 19:41:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/56] tcg/optimize: Split out fold_count_zeros
Date: Wed, 27 Oct 2021 19:41:06 -0700
Message-Id: <20211028024131.1492790-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 2c57d08760..dd65f1afcd 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -873,6 +873,20 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
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
@@ -1739,20 +1753,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1777,6 +1777,10 @@ void tcg_optimize(TCGContext *s)
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


