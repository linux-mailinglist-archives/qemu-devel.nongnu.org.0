Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEE436CA5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:27:06 +0200 (CEST)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfab-0000PB-NZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGI-0007eA-8F
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:07 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGD-0004On-Mh
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:05 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e10so1275677plh.8
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=92C7m0Qw6lhImsxb8iBceS142UxxpCSN6cHa6VVF6VA=;
 b=MivuJ0GxTE6P4EqmoLtzgDHGTGoLemMz6Au2L14um892aZLfWaCiZf0FMvjJT+VcOs
 XyE73hsT/yoctWm7+jZpVYHtYrOoGnUF9hyoZbLgJPkS94F/ayrS2UgqpcayhBMRL89G
 pGNLXtR+fNjA9+XbeE8HvvfO2yVCMVPG5WpW2nbyqr8YIi+gsDuAi0unDgTyqKesbLVb
 vmexEtOrRGJ1eCOR8kRFGoRmOLrOna9LPMsCMlh7yNSdhyjX0N3fYDuknVBKpG7hTFIs
 9yZldomPZX0mD7BcC+xqmVVCdBr9Zqbw7hzTPJ38ofZGj7rtqqtBPZ2jRCjKxp3uS6W5
 uqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=92C7m0Qw6lhImsxb8iBceS142UxxpCSN6cHa6VVF6VA=;
 b=LGyJ8cPx4NTm0+7u4YjXr7R3FddDiConAGXxeLe4DuZzhMxxWUJPZbrV6vk3dFh+d7
 JfEa35tmCtJWyl7IRYQAN8wavEZ7bNyZz8YnjvF842synM8Liq6i/ZuyVCKrWRAA81i9
 tJovchCuEL7PLeAKgHWoT/0ebE2bixypXF6+nMiT1dpfMocG/0X/QwnLbY4szuqHLdQQ
 K62mHVm1Ule+3dyM7W97djpAhifIozTDWo7spoELPWsU2MVsKRScsliwTKR0Z4FH+5mw
 kngtzBzO9ov1n8EEhdBDLw3mZ+GcKPDMaUKlFXdMVCSlQGmrSErU1r4JSdRokqio3ZaY
 XWGQ==
X-Gm-Message-State: AOAM5322Li2CVdvzOv+CP3oVTwlt267JXsCFAKICLxP/b8L5WTI6aUO1
 OZk9XfyI3R2xdbiVwF2W1ijG5xFV7UHs3A==
X-Google-Smtp-Source: ABdhPJzT5x0jzOOjGrZDtOS5sd02u5ON0TcGbai06NGxAuD+/TVsUUjsvUVvOdl1v33ztqAenzMHcQ==
X-Received: by 2002:a17:90b:110d:: with SMTP id
 gi13mr9442423pjb.1.1634850360398; 
 Thu, 21 Oct 2021 14:06:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/48] tcg/optimize: Split out fold_bswap
Date: Thu, 21 Oct 2021 14:05:18 -0700
Message-Id: <20211021210539.825582-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c54f839434..77b31680f1 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -841,6 +841,17 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_bswap(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+
+        t = do_constant_folding(op->opc, t, op->args[2]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_call(OptContext *ctx, TCGOp *op)
 {
     TCGContext *s = ctx->tcg;
@@ -1727,17 +1738,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(bswap16):
-        CASE_OP_32_64(bswap32):
-        case INDEX_op_bswap64_i64:
-            if (arg_is_const(op->args[1])) {
-                tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
-                                          op->args[2]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1762,6 +1762,11 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
+        CASE_OP_32_64(bswap16):
+        CASE_OP_32_64(bswap32):
+        case INDEX_op_bswap64_i64:
+            done = fold_bswap(&ctx, op);
+            break;
         CASE_OP_32_64(clz):
         CASE_OP_32_64(ctz):
             done = fold_count_zeros(&ctx, op);
-- 
2.25.1


