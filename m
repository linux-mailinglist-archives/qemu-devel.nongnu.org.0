Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21A43BDFA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:37:05 +0200 (CEST)
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfW08-00012V-OX
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaE-0003JJ-Ag
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:18 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa7-00020V-6U
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:17 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m26so914751pff.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5pO8srHxeyy8XfwYL1eqggORkYu4mPynLSww9CDHj/M=;
 b=W+DioL7FATzLH0JESewJCTpcx4cmajnKeCOzQZbx8HAZdHCrttT8ectgU3dvzRXlGb
 5KiLRtHoB/ZKubSY/uvJhbAoyTUH2T2ll6HYoicRd/XPaAhuCxpnkaezRSwjewz8atsC
 V9WU1F76uEbkKUBKThYyDLPYUlYorSy0TjOrvKWvpKOg5arce4Z+eYwN+oHiPABORw5D
 xpEsJuDosFsnC0nraR04Mp0Asx25m/EFALJ5xPtamuiaXZ6gbBzaMfOPvF+PRcrga8aM
 BSTOBJ7JojUMwreqFxCtipY9LiANW51to3c2Fa+mKeFQiDFzoTwnvMtRHC0LPG6CzswP
 BDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5pO8srHxeyy8XfwYL1eqggORkYu4mPynLSww9CDHj/M=;
 b=DMQ3ws68FEI/j4F2+ct+AvWK9zqUInoTQSUkJSOi8frdMnVZs3cnhpYql8K2GnPIel
 RfwoyHoe2Rs2jxNSmstXnJ5pb/gA6kQJhR/PqZfKrHHwtiDggwtduXBkTCXUBBLIjMNN
 h22P1oCgpPnR8GIH34J80PXpaJGAEKhTaY0LeYD5GviEck07cGnDojd1tVCnA9AagA5T
 G0ZXobUhhzJ9fr0AH4hRg5gvKSEp05UMLNiXwZmQFbn+4jQI1tayNyCSWmMNU2239cx3
 +ktZsYa9razDLgi54zNL2AKHiqZ494KVKYieA0ZKTvjXOycGmX8ZK/zbb22Y1QsEolpv
 SMaQ==
X-Gm-Message-State: AOAM530jgCfAyxYZjexJLggXlee3I5vjDd4rtUbr664ufHoYocNAb6Ib
 KfGXhWECWLjYd9+InXhJBm3d7vU2tVvWgg==
X-Google-Smtp-Source: ABdhPJxT2g2MiUQ5q2LgpYKrLpQ8IZnVOrnUNPrMaTphescvnO07wRcJT1N8ee9vh0Q8nftB6xTABg==
X-Received: by 2002:a63:b402:: with SMTP id s2mr18417909pgf.324.1635289809009; 
 Tue, 26 Oct 2021 16:10:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/51] tcg/optimize: Split out fold_bswap
Date: Tue, 26 Oct 2021 16:09:19 -0700
Message-Id: <20211026230943.1225890-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index dd65f1afcd..5374c230da 100644
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
@@ -1742,17 +1753,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1777,6 +1777,11 @@ void tcg_optimize(TCGContext *s)
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


