Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08A43D9D8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:27:05 +0200 (CEST)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfw4G-0005WU-OZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMe-0004sk-6V
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:02 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMX-0003Yf-Qb
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:59 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x66so4534203pfx.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhofiOMOxfG85+VIZHMXYK/5ma+X06jKCdYHbFqq/90=;
 b=i8BVd1CG0wgU/0fe2RS/XXrA/pzCHKE8YSE1Nef2ay14vVO9JXDpL1r2ehGUMb11SC
 asyEHlYzZV2hxnWxogd8NgYpOybb/7TPr2PMAsVLyC/Ajr1nnOW7q0/a/oRbOz1ateA1
 kT+4muNhCoG+4KYw05RLP3oiXWhEgizkAiYYqDp8zvR183dSluTJPUHFLB2Y75AYqCQt
 eiQ97GYLOo6EfmTsr+d9rtN6X/dk4Qc3VnE3ICWlNeU1+DbcFYxJDz2CZNhtU1o1WRUu
 PCwtZ3mZhlF4OWGB+ShDO9SFD03PCF+FPDsQatlJJ4dhEoZ1mCsh+J/8ZtA6uTat2vdE
 ZJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhofiOMOxfG85+VIZHMXYK/5ma+X06jKCdYHbFqq/90=;
 b=knyD9nT8tZYp5Ub036nzbF6m743cur+r/drVsdhG5NBkJVDXm/qDHEQND0szPlbl4D
 mEiylhlkJq981fpH9tbdxiJCpd/9c3cHt9krH3MknAT5hbHaWTJxnhhBYdiUY4Rn5KBT
 qLvo2ujD5uTrBe5T9CZle8Z3XtS6gbHeGY14gQzDCjKaaTItyhdhuStKNZS2m4Z2GrWl
 Y2M1vzRptnG82LTu6x2cCgBr1yergLuvQcNthtcD06j7sbGjtUXRad65EMeBH4C6Y1yY
 i4/Lb1OGUzn0FejRKfKvDfnd3KKbtJzuKWT2TzNnUSpgsJqJul3G1bR3MuDHJRSlB5st
 vIHQ==
X-Gm-Message-State: AOAM53161XTOMqB24uPH/eEgLRGp4CHWwSpskC+rD1YNKegf4EOigUWy
 3r3QREM7DLCSqnxFq7mW4a2fIeCmsCB4vw==
X-Google-Smtp-Source: ABdhPJwM4mSC0jOut08UeehG3C3PJtTgxQUOdXBsLuvUEZWemGmZZucPS2Tp475qeWNGUzKI0Zdeqg==
X-Received: by 2002:a05:6a00:2410:b0:40e:7d8:ad7f with SMTP id
 z16-20020a056a00241000b0040e07d8ad7fmr1494640pfh.25.1635388911173; 
 Wed, 27 Oct 2021 19:41:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/56] tcg/optimize: Split out fold_extract2
Date: Wed, 27 Oct 2021 19:41:03 -0700
Message-Id: <20211028024131.1492790-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 110b3d1cc2..faedbdbfb8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -888,6 +888,25 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t v1 = arg_info(op->args[1])->val;
+        uint64_t v2 = arg_info(op->args[2])->val;
+        int shr = op->args[3];
+
+        if (op->opc == INDEX_op_extract2_i64) {
+            v1 >>= shr;
+            v2 <<= 64 - shr;
+        } else {
+            v1 = (uint32_t)v1 >> shr;
+            v2 = (int32_t)v2 << (32 - shr);
+        }
+        return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
+    }
+    return false;
+}
+
 static bool fold_exts(OptContext *ctx, TCGOp *op)
 {
     return fold_const1(ctx, op);
@@ -1726,23 +1745,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract2):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                uint64_t v1 = arg_info(op->args[1])->val;
-                uint64_t v2 = arg_info(op->args[2])->val;
-                int shr = op->args[3];
-
-                if (opc == INDEX_op_extract2_i64) {
-                    tmp = (v1 >> shr) | (v2 << (64 - shr));
-                } else {
-                    tmp = (int32_t)(((uint32_t)v1 >> shr) |
-                                    ((uint32_t)v2 << (32 - shr)));
-                }
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1777,6 +1779,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract2):
+            done = fold_extract2(&ctx, op);
+            break;
         CASE_OP_32_64(ext8s):
         CASE_OP_32_64(ext16s):
         case INDEX_op_ext32s_i64:
-- 
2.25.1


