Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E7436C8C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:17:44 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfRX-0005rJ-3D
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGA-0007PE-E4
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG4-0004GJ-7B
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id i1so1254816plr.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pb59zgt3BJOK/6jo6ZxRJgBUW76Zvxuzd+Eqm9jcKsI=;
 b=fm0Px4XkrXQk6B4sFKKTz4skTlouOcr1uSGgktYlPE9XF40XFGrI+R7+eyC4+TSZCP
 KdEMkTD/0tKmQZQts48Zt0CDfkH8Egix0+bRjVN6Txgpb9xCl9FzpKv6LmeeF+Jyn3tv
 5Lyg22oNe8f9lwaZ6zouEB0XpUnwH343nJa27DGRvw3Keec4UXY2pLXvkXKMT+KqFS8Y
 f+PoCuLHb3/doIhbH2hzwGsV+9lH7obsvS5mcRhIjtaBaL/bC2QrT/J9f3ASGUGMGJ54
 AJ4xtWDQgfFLwAXbynXD18PrUB/OV9fDUah1aehvFK6n7pNYRzrwL+4lnUQrwlgCsGi8
 C9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pb59zgt3BJOK/6jo6ZxRJgBUW76Zvxuzd+Eqm9jcKsI=;
 b=rUi/5CrmMg8V7iTmnXCMMr4/mih7nwFelJS5PWKtzXvSupwgJeOOBAOkT+sHXmBekH
 JzUIXKbkoxTWhizDhUsRl34yux3MltElmWixfC7CEt3eHR9L+bCs+kPzRxQe12iLXKBY
 ajne05mlqrP3e1mFI2/mmzHO95+XEW4mKObyfxcRwQ5qPry9XXimmze9Fg74x+e1kz8F
 1Cv/h9E2AuOIqeM1JdInEo5JZ2m0G7tKQE3LVPaxK9GKpuZB/jX7yC2W/6L/DN9QOyBj
 F+PWr7Qpr8VNf3/81RKnEBqnaX4fvHXgDOrrZN+4vETyumD5nXaCeWdndYT+90xoUfbN
 jRnA==
X-Gm-Message-State: AOAM533aUidO7q9dCseHpxP8axXM7b/m2DYq7YFdQWuR3YRyGqyuqiUC
 Fy7URP0jngoFfUxcGX3hRlDCNhKiCbl0WA==
X-Google-Smtp-Source: ABdhPJwgL7Q1vhy57rF5PZ5R6jMvSgu4I71uooYCaZsw908eOVNnaoxgOckAsuOAboZMpLE7z3miqg==
X-Received: by 2002:a17:902:6ac7:b0:140:14d5:cfb6 with SMTP id
 i7-20020a1709026ac700b0014014d5cfb6mr628725plt.58.1634850350202; 
 Thu, 21 Oct 2021 14:05:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/48] tcg/optimize: Use a boolean to avoid a mass of
 continues
Date: Thu, 21 Oct 2021 14:05:04 -0700
Message-Id: <20211021210539.825582-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 368457f4a2..699476e2f1 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -713,6 +713,7 @@ void tcg_optimize(TCGContext *s)
         uint64_t z_mask, partmask, affected, tmp;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def;
+        bool done = false;
 
         /* Calls are special. */
         if (opc == INDEX_op_call) {
@@ -1212,8 +1213,8 @@ void tcg_optimize(TCGContext *s)
            allocator where needed and possible.  Also detect copies. */
         switch (opc) {
         CASE_OP_32_64_VEC(mov):
-            tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-            continue;
+            done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
+            break;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
@@ -1602,7 +1603,9 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        finish_folding(&ctx, op);
+        if (!done) {
+            finish_folding(&ctx, op);
+        }
 
         /* Eliminate duplicate and redundant fence instructions.  */
         if (ctx.prev_mb) {
-- 
2.25.1


