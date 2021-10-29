Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9F043F662
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:58:32 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJyJ-0000aC-Di
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaX-0004U3-Jj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaV-0007yq-KG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:57 -0400
Received: by mail-pl1-x636.google.com with SMTP id f8so5979297plo.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhofiOMOxfG85+VIZHMXYK/5ma+X06jKCdYHbFqq/90=;
 b=f2dIlOH5YeoJtGuYLK/5CNRAZURulHrcsVgvlJIwrGBrIPsnuQseFQ35MR5lPryN5Y
 7l6tTmcof8Z7orfXvCV5IpJmROkebi71q5wCL2xcsh9itcJngCrtejfAl9FXiDZaXd/I
 APSqqcC4EBLOz7fWbtSx4pZD4ea/POc55loXgm2oIJwQK4L8YyOo4HKycx7uoqxPnTLI
 lLLEHsv2u2zva17WFCA3xAq5w8Iugx3Ohqna2P6WyF1eTrg9W/5BV7ywdZUJ/Pl8Wufn
 2gPrct0rhIDozf7zaLmCQyOcSJSMMjmzj2SC1fdaMCin0861LGxH8Tv9/vPSCko3RJI8
 6T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhofiOMOxfG85+VIZHMXYK/5ma+X06jKCdYHbFqq/90=;
 b=bTh7IQg7UTCa18veQ8JnRYDpKZmuPc5CyQ2UFPtMfXRcusPKwvjwbv1jR2JblJsxaF
 9eaKJdkwaWLu56oI19uPbo8AgjhiF3s4hEUzILGOgN+cfDtOoB1Za4J1Wag0Cu5iuELz
 9iDXU6fRLVNBzcprFapNDVWSzTWPsy1hoqvBKm9S3UhDcc3n62/JOw2dUpBIGlzCcKUa
 ltx41X9ihcPQz+FgbvvNyNtV/00T8Vs0/DmPtJuEfGuy40XgJDhPjzpJUXfnYrxB0b0D
 Y9nUp4KfwKVXcpDpsFNhnOmwFx3vtV+31T2koGXLMqXbJuW8AR7e9dFYDbli2JeW17Rw
 AlqQ==
X-Gm-Message-State: AOAM532jEWlre9BsG+Qz1U3pVhHhWMHnQgrWIoSbBUPs7nxhPI3Lo0iL
 RD2vRGIO8S3frixJp/ZfE8n3JF3D63HEEQ==
X-Google-Smtp-Source: ABdhPJywOX6QORZLgM7r3gXC+QJYEMpscFO8fiHOfnetUYER3Gja/M/sWsF0MCZYaQ+L+msI6SRo5Q==
X-Received: by 2002:a17:902:c651:b0:141:b043:4d49 with SMTP id
 s17-20020a170902c65100b00141b0434d49mr765596pls.85.1635482034282; 
 Thu, 28 Oct 2021 21:33:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 28/60] tcg/optimize: Split out fold_extract2
Date: Thu, 28 Oct 2021 21:32:57 -0700
Message-Id: <20211029043329.1518029-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


