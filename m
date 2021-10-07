Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B806425D07
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:14:57 +0200 (CEST)
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZn6-0000a2-3x
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000Og-IH
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU8-0007JI-Av
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso7258246pjb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JODdrPNj2PxICOEHDxomMCh1RXsgaITWJJN15W5s3LU=;
 b=LpcOJUTWVHmUq9LPbs6lOtj7uVN712f0DuwnpJ7fj0+Hcd97yHpk/8kSGK+/egnDuT
 9D1f0faZUbCHG/SpsUCSuqrxcNkr6LdGJpuArMlPFnUofE2tu9Q13OumUtoUG/5i1MTc
 bfeJQTL4Jl09mPa7/2gXbjQWidTV6QINHivQG0O+y8D8QOjoJglYxOtbtEWL0IvXG310
 LmV39k5BmTwEZfRo0cv5z1cvQzH1y/TaIkwgajvOOgSEjvThmKNkDBWoPA9+XwTklOhy
 Mf5lEUSN/DJh0ZmHVr91Htg3NauR9F95vPOYsJitgfA5A1kah65qprFd/hQWunkL1Bk6
 WYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JODdrPNj2PxICOEHDxomMCh1RXsgaITWJJN15W5s3LU=;
 b=7xRymNpdwkgrPzJimYtO5OvbFWiONOo0vUjnFQDWrStJN5aMXd0ky3dHwRxMLEqDEn
 MzY97LIdwEGuN9ZOEXESHUaghEHSIBR6d+ywiApxoC5RaHNBAPCbeGgwKNthlJnqSsOb
 R6b2Ga8JnR+VPFKe8XZ1Xbf4N/eEllKtxLwu3vaA67wrp2sd1DMV7CY8eBymvAXUZVo5
 My5aG7Oo+5y9EiK/QPc6ex2GZMyL3GkFBekvBKmxrHSmVqTn+pIsiqL0Sc+jLYXPLcWv
 fbV6UauIFr5NtQboEwoGyUPoCrkxISGo7YZNEUyIL5TiZt301VvBH81GJEWApSvj+XVW
 1LRA==
X-Gm-Message-State: AOAM5321EvGocQbd7wtn594ZtVxPrkM3uLqps3gXu4wNaz5xf2KYB7WW
 AXDGdgyPT9uj6i4KBPAXHoNxpWNXSOKzLw==
X-Google-Smtp-Source: ABdhPJyAlVEB8qVpLYU5i/ctYr1LHNulXjqRA2FOs7PPaT1NysCRyGAQJbc8sAzCEh5opr846d6Ptg==
X-Received: by 2002:a17:90a:1507:: with SMTP id
 l7mr6971189pja.141.1633636517323; 
 Thu, 07 Oct 2021 12:55:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/48] tcg/optimize: Split out fold_bswap
Date: Thu,  7 Oct 2021 12:54:35 -0700
Message-Id: <20211007195456.1168070-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index d2e5727662..7a7c3e25c5 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -843,6 +843,17 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
     return true;
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
@@ -1729,17 +1740,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1764,6 +1764,11 @@ void tcg_optimize(TCGContext *s)
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


