Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B943BDD7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:26:35 +0200 (CEST)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVpy-0000nY-72
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaC-0003Fn-S8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:16 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa6-00020G-KW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:16 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so3547877pji.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6H+U1ruTrcwXeKIJx0xdeAaOvB86vmaSGOOcxgJmqQ=;
 b=OjPTYBejdyS1FFlOYasGX5aDXcRrEysuEDE8n3PI5MQwMmfP80Stgx1366uB1wpTW3
 UEQXQkKpxN+ulVFoVgYA+lZOrWqQZ+jpHt8c+hcvfxGU/nCdz3r8qD8nI41VWZSTmp8H
 toJEQNW0SYnN1MQwvFL9zSzLTM944zjmbY4nfidkFDW5bnuNQwoqzWD7dyjqUqvrErCm
 ZIGK5+GTsawzxmSrHg39plqmCudz3IkhU0n23EosOjQ8TFE1qCguKf/dkwwYhDM11nVF
 04L8Ci1q4Erj807FFmC0kHYFoBvTRhzdQ73jJcvt+kKZSs2Nb90WwF2laC9EQxUEuY0d
 f+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6H+U1ruTrcwXeKIJx0xdeAaOvB86vmaSGOOcxgJmqQ=;
 b=cxbL6NIqtkSDGEAlizGoc4tpN9H0YPPLwLg2VzewPmLt539DcESBDIcO08FgXqCLEG
 NrssjCUdq/YZ8yXzIxDhIDcaFcbYieWapS0lqs2iPvyMqmhof7006tB3UuvlNZsBQqh4
 R3eAgQiMLtxWIHXit5j0LRBYtf71UTnF39nwPGqF19jqNHwrcg4N1AwagcJCR8mGPgQN
 ECe1zmGH/DlAV3Q2ALkwA1sqPAsBkurmcuGfU1sIpQdMvuu0n7jCCNCx9tQ7c/0Xfm06
 gPrfpSI6J21+clL5xhGPCoPSYEyUQl5xBXbsO0NMxPjpKNiTadQwsD1o+leK/pncArrk
 eDAQ==
X-Gm-Message-State: AOAM53017KjZxIH2EGrZa9C5ixje7Bh0UtfHfok1Fh7hGdXn87FY8mvf
 LVhRSOV9R0ymG14aFisLanShf7jln6iY2g==
X-Google-Smtp-Source: ABdhPJxWwapmIwqkyk+ue/5EOnf2waziD1dWgA6wxYw9k3LeX861LTiCXAdOxEs8FO9U6aYFYfrHXQ==
X-Received: by 2002:a17:902:e5c9:b0:140:32f:54c5 with SMTP id
 u9-20020a170902e5c900b00140032f54c5mr25383828plf.65.1635289808066; 
 Tue, 26 Oct 2021 16:10:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/51] tcg/optimize: Split out fold_count_zeros
Date: Tue, 26 Oct 2021 16:09:18 -0700
Message-Id: <20211026230943.1225890-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


