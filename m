Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA943D9A0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:03:59 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvhu-0005Ow-BB
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMX-0004pa-6y
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:53 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMT-0003Xh-Uo
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so6806583pje.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEAmAjtRAA8VTRQA9Y1dByLl7XumxO8Ow9/VzdNZDew=;
 b=oMZrCqxQmRxDOmHOtczHnOuAwu9q7TgeTyC//KBVBSfuooDp39a3tKv0WZ322Xeg6g
 ybGLvR61KywueuR1b0ckelnMA5zieNCN3sIfYPObMc6FHZF+2o1CFp6mEYTHkzqOb3DW
 eDJ841DahJu8+CRcCBXd+KJcgtGhlwrvtlPWp+XqQQR6AJP3DUBFMrbaCH83Vgt12O4X
 AGqSdCD3TRx/UCv73dxcNimP6reS3QpuYf1asZc48P5cd/Qs8un2mKE5l/N9x1V0I0BW
 wnzhN3/MhpoYvZbxpwY3nG5XC9RruhbGgvjjhuoBbUAH/p3g2vWIUQWak3VBzAYWsp+/
 bM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEAmAjtRAA8VTRQA9Y1dByLl7XumxO8Ow9/VzdNZDew=;
 b=JThthiNj7Bu9RWJH/KUsg8vZYwlA66msxeVQcQm3isVffDVnabModLBAyXCb9T9t/t
 Ozk33K7ipHMW0lSiKffOIsQFx/Vo5rz/8zFmZv3USF1S1BD/zDaROy81XP6Vok3Es5bR
 9TvduSrd7fAWQXDPBooQwRVDyEHf8ShLASmjsdQt/iRXJIc82V8pzVbUks7qqRNtuugC
 k+5dkFMCLM/PDqKbv9TIukVtb+I6eyKW/GAvQhusqYYuKDKVItoGw4XPwRXTAMkHrenB
 v40fqyHbxRISD5fzq8UGNo8JVNTGVxyive6yTWW4vvfFStQ7OrVrfjTdwSX9+ot72aFM
 7Eog==
X-Gm-Message-State: AOAM530ruXoFUvnX21qJ5SQKl4rh/Sx8hbYRqdEhU66bgxov+cWCjCSm
 qXBKxUCXEK2g2grKjP15FDzoWtCKhsbGDg==
X-Google-Smtp-Source: ABdhPJxh1Ak9eTa2Ly5ssx0Jm27lvipvcAzA4VzQMe9rjrWttA/Q0/3e9+iTtlPNl0E5vmE+S8Zt1A==
X-Received: by 2002:a17:90a:2fc7:: with SMTP id
 n7mr1550412pjm.141.1635388908693; 
 Wed, 27 Oct 2021 19:41:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/56] tcg/optimize: Split out fold_setcond
Date: Wed, 27 Oct 2021 19:40:59 -0700
Message-Id: <20211028024131.1492790-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 tcg/optimize.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 24ba6d2830..f79cb44944 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -948,6 +948,17 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_setcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[3];
+    int i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
+
+    if (i >= 0) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
@@ -1648,15 +1659,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(setcond):
-            i = do_constant_folding_cond(opc, op->args[1],
-                                         op->args[2], op->args[3]);
-            if (i >= 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
-                continue;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1817,6 +1819,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(shr):
             done = fold_shift(&ctx, op);
             break;
+        CASE_OP_32_64(setcond):
+            done = fold_setcond(&ctx, op);
+            break;
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
-- 
2.25.1


