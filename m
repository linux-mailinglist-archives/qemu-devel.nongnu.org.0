Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA89C43D99F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:02:10 +0200 (CEST)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvg9-0001qO-NU
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMY-0004qg-3F
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:57 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMT-0003Xc-IE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:53 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 75so4950983pga.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFsfCOujg6xp28y0o9M8YysK5F5Ff4YXOa1Luu+j29I=;
 b=VFU0B8LdkcQvzKhkrtEYYu4a0OGFTQlxuSa6lxDZUbnJSmqfX6kW9pXK4V7IDIUSta
 ihVx/D2oMOHqdzMd+FlFDMTuPNNk1aWyDO3i+MqutfCgx+KscngoWrIruKhF5gHdAMVV
 eRbnsl/jurbXOpfcDySdWWa2oYHC4mhgwvO88Ujy6/t+z97qbYN4yWiMeXOss2RD9ls8
 slmleMbIGdCMoutdDWCGPTD3v/EBB6DbCnSeNaKtTTtM66u0v6pVB7cmomilrY8amhal
 BXuUg7byQC55fEb6cdFBQvN79sYiaDOLUJO6Bny5t0NNXZJnAAUQCGo53JKRax7dMoJ+
 PNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFsfCOujg6xp28y0o9M8YysK5F5Ff4YXOa1Luu+j29I=;
 b=E9+DUZeAMBAoOMJ6VPUueGO+7CpyVYJzma2Sc2dF0G4+BeS7yhA/DmBdlOqeJ3h2Zl
 JxbgM/zTZqhS7bgZwfkLD/NHqCG2dIwnaOPkK904zRCYPfMRc8NQ2mR+MfhTQhVubVrT
 KMjYKOCchexwyn3dmzdA9CD0JX13OsIEiNoTCDPdu27zh0nFy2P0y4mYWMxMyyKNl5M8
 f9U3mmPYWDyxgTOji6xbGLb4Byd5bpVDzqNsvhop0/wUQHxI4aV/H+uDuwOs/iLe60b5
 iLxyBOVN4GRyia+MXHslltJD+tns6K+LdSeG+itP65DLc2wEnUj9buYQIuNf6iQN5yyv
 kVlg==
X-Gm-Message-State: AOAM531TjJamWYQGS3i1EVCQQfHv81gd1oac/S1d6DE0ZP6+PtsclPtn
 z6TXOcs7i4nj6HmxkdHh0i7/Hol5U7Li1w==
X-Google-Smtp-Source: ABdhPJxE48Ii3zyPd4kFjtE7X/bywbea2OIACF62j5626nFNzzzxY1NIBLtfLJWk73vIn6CSvlQL+Q==
X-Received: by 2002:a63:374c:: with SMTP id g12mr1187986pgn.35.1635388908072; 
 Wed, 27 Oct 2021 19:41:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/56] tcg/optimize: Split out fold_brcond
Date: Wed, 27 Oct 2021 19:40:58 -0700
Message-Id: <20211028024131.1492790-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 tcg/optimize.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c9db14f1d0..24ba6d2830 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -714,6 +714,22 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_brcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[2];
+    int i = do_constant_folding_cond(op->opc, op->args[0], op->args[1], cond);
+
+    if (i == 0) {
+        tcg_op_remove(ctx->tcg, op);
+        return true;
+    }
+    if (i > 0) {
+        op->opc = INDEX_op_br;
+        op->args[0] = op->args[3];
+    }
+    return false;
+}
+
 static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[4];
@@ -1641,20 +1657,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(brcond):
-            i = do_constant_folding_cond(opc, op->args[0],
-                                         op->args[1], op->args[2]);
-            if (i == 0) {
-                tcg_op_remove(s, op);
-                continue;
-            } else if (i > 0) {
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                op->opc = opc = INDEX_op_br;
-                op->args[0] = op->args[3];
-                break;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1737,6 +1739,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(andc):
             done = fold_andc(&ctx, op);
             break;
+        CASE_OP_32_64(brcond):
+            done = fold_brcond(&ctx, op);
+            break;
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
-- 
2.25.1


