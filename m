Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A209A436CBA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:33:23 +0200 (CEST)
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfgg-0003Lz-NF
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGL-0007fT-Ea
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:09 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGB-0004Mh-Dp
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id w17so1275012plg.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJZ8Z/RTabJlgDj1P6FGu7e2eabHE2BgKAEMKC4fW38=;
 b=xm6dLo0X7Z9vdABnMofSK2VifuyjXaaKPsZ0inD0/RdznYACJuSVEiqTi+m9H3TWGp
 re0Mc6+XOMG8dXuxlSPIxWlmRg7BybUmocXqZHttO+dfz5y1DYChM3lybbTiHLVF59dg
 QeJLSBFlAEb1xIMKA22lvmcAxoSmi+kq3YDa0epyv7Xzp83CleX3H2nl6/oOgcqsqgok
 j2sXxXAFd/NBTgPat7tBxDcKxVp9OdmsGQX8gYXYvFEwrCsN8yJwYOIsaafIMYgy2JZ6
 u79eBYCF22PduGtnRoi8oo3ZbIoBEwR7J7NswrQrT73IeDOk+ysvHo1I5baGy/9ehdn+
 MxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJZ8Z/RTabJlgDj1P6FGu7e2eabHE2BgKAEMKC4fW38=;
 b=NDwOUlAsJYzSfSbBBSGRj8VFtvSUpixgePNiYMM5LiGkMkbyu8QX+j5JrHjjgVT2TD
 wMGlc7qp9PsJRAjLQh1O84xOiqp7U90HUZn1ecenJFRwvS2hIgdIxbGPvAYcPM1zvtAG
 beeOmZiJAkNTCxyS0CycCU01OkhNN0T4v9uzNHIQuLQ5+xPu7GOOdK9DAyGdjxfIVlhE
 MkaG27EHtkfnfE0X1HUDan5yEYy2nh14QQlnOF1O5flR74DpI9DlGwphGLNA6rDQfrrr
 GpFkEhJUh9aSu/wmy/eRkeWnudgm6QT1INCJuu22IOzycm5Rab1QvEq8nD2VOjQ9PY5F
 01UA==
X-Gm-Message-State: AOAM5310f4YeMmlHbOANWW0tqyA93snQEa8FyNXXOdanhEp2pvzpECOw
 3ZrR6Wp98zIp2aDPNCr9lWJwW3ntwwZX4Q==
X-Google-Smtp-Source: ABdhPJy82BUueiitRTbyRc0l1q8I5QJlIQSzhSIZcsnbAkrvN4gCRkQ+9JCo4/fsk9V0+fUNFj+QGQ==
X-Received: by 2002:a17:90b:1910:: with SMTP id
 mp16mr9373303pjb.30.1634850358160; 
 Thu, 21 Oct 2021 14:05:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/48] tcg/optimize: Split out fold_extract, fold_sextract
Date: Thu, 21 Oct 2021 14:05:15 -0700
Message-Id: <20211021210539.825582-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 885380bb22..3fffc5b200 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -883,6 +883,18 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = extract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_extract2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1111,6 +1123,18 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     return tcg_opt_gen_movi(ctx, op, op->args[0], i);
 }
 
+static bool fold_sextract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = sextract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1712,24 +1736,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract):
-            if (arg_is_const(op->args[1])) {
-                tmp = extract64(arg_info(op->args[1])->val,
-                                op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        CASE_OP_32_64(sextract):
-            if (arg_is_const(op->args[1])) {
-                tmp = sextract64(arg_info(op->args[1])->val,
-                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1764,6 +1770,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract):
+            done = fold_extract(&ctx, op);
+            break;
         CASE_OP_32_64(extract2):
             done = fold_extract2(&ctx, op);
             break;
@@ -1839,6 +1848,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
+        CASE_OP_32_64(sextract):
+            done = fold_sextract(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


