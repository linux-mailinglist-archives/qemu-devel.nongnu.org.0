Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC32436CC0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:34:29 +0200 (CEST)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfhl-0006j0-2d
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGI-0007eE-Ky
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:08 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGE-0004Pg-Lg
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:06 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r2so1386738pgl.10
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n8kgEhZ3moEwjJA/HJM3esOP+NIO+uYyJDqs9fWnnDo=;
 b=deDI8NBWnWSwlj1m+kxACbuqXGK2FEG+NfL6Ze2mZtMh3QtCls27Aoa+IUcqhb6LL/
 raHSxMdrWQP1HrfCKSU3xWJimDc0xu5dldpO0aS0ANQ06DFIVQ5QXLIRLzcZXIRxpN3l
 GunnDfOa4KLq4GOGoBtuBZVTeTsxTNAdzzFzgPYqxMGcdg1D7wBaJT6nwf5SZAQMATYH
 41QwggFF+BfrY+Oh73btpt06ga6OuDp3zxnjKMOiJ0uc62Yr0EA8ZIEIyrCcLxPCGXRB
 bfVFtasMTIPECNEQ7JXyOkY0aGGz4Yai9kwPusqk3P/scsh7qEPR0fjXS3XrbIi8AKYU
 kMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8kgEhZ3moEwjJA/HJM3esOP+NIO+uYyJDqs9fWnnDo=;
 b=Oi+pEZX8AR4tBhfSVgvc/HXTtf4rO/mi4u6LsPJAYRpOJLJmrVvaOuMN9GzKe7j7ld
 E8WiiayiiwwmFDiRKqTUMDLV7ywY8oMslaMIVNSZx4Pc3wPzBMGn8qmicoiJp7VrL4nk
 HiWBpaOHiEIB7ZHh1ul9Q1bAiDQvdIvnvjbyMfDg54HqMd1yZ1x2dNxxIB6LwIFn1BHw
 OxPEKVZFDFHL9KvUBvtfmvQEo4FPUVkiXhPLlAEKB7/8i3yBPcW1B4AtmiSRccVa9oWV
 jDbMogLvQst3ExDTXiw57Xjm+TlsEHL9SAoeYKoFhGViLOM6oA2eR8H0xNE+XFRsLg8S
 F61w==
X-Gm-Message-State: AOAM533BbIeOWS9GzRIzZQbtXT+pQyIiwM8qRF1MEYQeDFrcXZLw4boN
 CrK/EkoBpvvdg6iaTd+U3axjSMmMk6DsXA==
X-Google-Smtp-Source: ABdhPJzVc/2qTQm85gQkQRzHALJi8jSygv3gwhcv2hoL/mN0/7gKGrxXwSLYnfAWsA6PfodMNf4jDg==
X-Received: by 2002:a05:6a00:181d:b0:44d:8425:fbe3 with SMTP id
 y29-20020a056a00181d00b0044d8425fbe3mr8459157pfa.6.1634850361141; 
 Thu, 21 Oct 2021 14:06:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/48] tcg/optimize: Split out fold_dup, fold_dup2
Date: Thu, 21 Oct 2021 14:05:19 -0700
Message-Id: <20211021210539.825582-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 53 +++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 77b31680f1..2d626c604a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -915,6 +915,31 @@ static bool fold_deposit(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_dup(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+        t = dup_const(TCGOP_VECE(op), t);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
+static bool fold_dup2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t = deposit64(arg_info(op->args[1])->val, 32, 32,
+                               arg_info(op->args[2])->val);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+
+    if (args_are_copies(op->args[1], op->args[2])) {
+        op->opc = INDEX_op_dup_vec;
+        TCGOP_VECE(op) = MO_32;
+    }
+    return false;
+}
+
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1716,28 +1741,6 @@ void tcg_optimize(TCGContext *s)
             done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             break;
 
-        case INDEX_op_dup_vec:
-            if (arg_is_const(op->args[1])) {
-                tmp = arg_info(op->args[1])->val;
-                tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        case INDEX_op_dup2_vec:
-            assert(TCG_TARGET_REG_BITS == 32);
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0],
-                                 deposit64(arg_info(op->args[1])->val, 32, 32,
-                                           arg_info(op->args[2])->val));
-                continue;
-            } else if (args_are_copies(op->args[1], op->args[2])) {
-                op->opc = INDEX_op_dup_vec;
-                TCGOP_VECE(op) = MO_32;
-            }
-            break;
-
         default:
             break;
 
@@ -1781,6 +1784,12 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(divu):
             done = fold_const2(&ctx, op);
             break;
+        case INDEX_op_dup_vec:
+            done = fold_dup(&ctx, op);
+            break;
+        case INDEX_op_dup2_vec:
+            done = fold_dup2(&ctx, op);
+            break;
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
-- 
2.25.1


