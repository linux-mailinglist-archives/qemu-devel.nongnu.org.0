Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F4343F661
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:58:05 +0200 (CEST)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJxs-0007mG-QP
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaa-0004cq-1s
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:34:00 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaY-0007zL-4Q
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:59 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i5so6002977pla.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6H+U1ruTrcwXeKIJx0xdeAaOvB86vmaSGOOcxgJmqQ=;
 b=vdgKXEMngBBJJx9j/2pjwQBZ8J4++Heqa2KX/H8P4OzRWmo+r57B8fbBePCBzWLMd5
 3tu5gKuODPKNnBTAmk/Wvpk0wO5AXhKwqlJuCyfgogxP+78v0RvkyMA3YL+Lof+rvqLF
 QNeZ7ski5f7Nlyo+orZp0r7WZuuZ9Vd/m0yI1ApUmM7/OeZgwqE7suLY738hq/bxKYWb
 Qdkm4QESlIJIAJNRdUXd6zMLi6tXtNsweeR3KvRVXuMtpAliy8yY8ElyYPopLr+4nW7O
 Z95qERZ0NSoCr6zw94QY7H4UqtG6DOMGYb3Dzf6b475pqMAE+GA+aAGx8GkxZptjM/cl
 IgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6H+U1ruTrcwXeKIJx0xdeAaOvB86vmaSGOOcxgJmqQ=;
 b=AI2H8WpnmZzZtT4GISTYu2qF4xJzrwku84d34yKN6Y0jnd0muqUvyaDMMgWzUhcUbW
 2pT9toqJ1SN1vZpe1mOgtGzZ8fGEPPR5q/MF0qZ6mRN6ssWWrRYFbwzNiYhYlq2cQfmp
 FdG1sb3gTkcBpw+kJBhjutjajodEvy3ZV9Buw0JCbg7gXQBSa4lKtf/c8IcJkl/i0EMy
 QKdLByZY+TQqzCnW002PH9VEabsXb4Y42eH9GYexFrlVTOyCWg61JIVvCin6na30lF0Y
 z8W0cKxw86bYPbch8fu7Xpal9E9BxmrLetNsK+9URO6BbHeaV3FEXIyRmLQljahEGcqL
 MGew==
X-Gm-Message-State: AOAM532z/2TyJUqeUkIU8bUt6jLnj+QLaFeHUc/j2mqUaK5RnKO/Phx5
 VayrZnDQGayCXr7aCzFlZjUy957nFAft7g==
X-Google-Smtp-Source: ABdhPJz8sYQQK2NDNdrvkW76bvwESRb+c91xEI0jM6tsuW9Lj1nfI/prGVSM1TCQjbiK8twa4SHCiw==
X-Received: by 2002:a17:90b:164b:: with SMTP id
 il11mr17504966pjb.98.1635482036879; 
 Thu, 28 Oct 2021 21:33:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 31/60] tcg/optimize: Split out fold_count_zeros
Date: Thu, 28 Oct 2021 21:33:00 -0700
Message-Id: <20211029043329.1518029-32-richard.henderson@linaro.org>
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


