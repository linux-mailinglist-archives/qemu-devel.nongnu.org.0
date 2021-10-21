Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355F436CD9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:38:13 +0200 (CEST)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdflM-000444-HI
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGJ-0007eH-6p
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:07 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGE-0004O1-1b
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:06 -0400
Received: by mail-pl1-x632.google.com with SMTP id t21so1283731plr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qthI0mJdOZrwCwUsWYFpWG7bovv63gF1yFHDwod2Ae8=;
 b=i4wkrtZASFecXM8a3p330s82JYZQfUoJQ5yFxGdYlY/BK22e94tOfh3KbSCN8EpQl5
 zyUDAHuBo5it9q8t9aVlqMPLDLw62CgWitGls7gsFrvZBOvM61qyrnIEMz5m+u0juPFB
 ghmbE7MzPNg4SzPtkpK6q6JPfbXIVFlPF0lDN5Rnn5ZU1fiOn9ruDODCqBUH91qxhbBJ
 Ure16ABzuqo+xSgIlxph60kk44uwYzcGvtvGeIpj7YNPhBoDC1V8pTmF7/Hx9j4f0+wb
 BVdWGr9HGzUepGUCdzEQ10vvNyGg+/8WdhY/2MK1UJap8IgiNN5dd3Dceg//wa6Dg5sa
 93Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qthI0mJdOZrwCwUsWYFpWG7bovv63gF1yFHDwod2Ae8=;
 b=qfLlmbbXt9XmPwn7Jymvv/xj/vwUAeN2Gw/W2heJ4YgJ9vRinp9NyWuDKTp+VyNFxw
 g3dYXqp1ZqdRBwHTACm5hzBEH0oDBWSzxdJQZEzzb1vZtihvN6P3rmvz6Dk4K0mHk//S
 t79fMUOhoIlscjV7A37Zvc3d24oOfmsxu88BpLN4W8H9cN4jPqs1u49TQTNZ/API4jbK
 gIVMU39y2el7BBJYV3A5YlwYx4D9/graW2JO9CuU3dCeCnppoIGxKf2BZXUCZlE7B4Xc
 zb0/VW1f4UX8gngf2DBXx6W/DP3Hht3X1Kq49K7001+jqu7oSYA5k1JtE/kHQBP/o4My
 oyEQ==
X-Gm-Message-State: AOAM531TIaqpMoZMAVawJuhe7f+cWEXChq3tt4r4WJUGP+qkjjmaD12h
 dWZi4tbJdLQ4YaJptV/b1yi4h/utPMrXLg==
X-Google-Smtp-Source: ABdhPJzaXlhJgLvEP7Q035FagPZv+UGEOkeYQcpNGWiKzAEXYuE0FQ1I67q6Y04FChp8t0j6/DILnw==
X-Received: by 2002:a17:903:246:b0:13f:75bb:cabd with SMTP id
 j6-20020a170903024600b0013f75bbcabdmr7461093plh.30.1634850359742; 
 Thu, 21 Oct 2021 14:05:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/48] tcg/optimize: Split out fold_count_zeros
Date: Thu, 21 Oct 2021 14:05:17 -0700
Message-Id: <20211021210539.825582-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 tcg/optimize.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9758d83e3e..c54f839434 100644
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
@@ -1724,20 +1738,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1762,6 +1762,10 @@ void tcg_optimize(TCGContext *s)
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


