Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115DE43D9D5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:24:12 +0200 (CEST)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfw1T-0000iR-5d
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMc-0004rr-Kb
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:59 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMZ-0003ir-2b
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id r2so4896430pgl.10
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5pO8srHxeyy8XfwYL1eqggORkYu4mPynLSww9CDHj/M=;
 b=gweFX/RQW/K6p84o+5FbsGUyqI8JsA8SD7njnwDEQ9e2uUEmhhRnkcBNKJsKpuSTjk
 IUfM0YXtgC9HVXOj8lrlydYchx5O/YotNbrCxH5XIbUqUKyuYeIt6j934nOjk1qMNZLN
 t92hRCgotN7GE77SvgBiHd1QboTuxw3gcXAYCDe1nXgqLCprntZ0N7onB1PB0SHIoCYN
 oGb79B7CEzzUulrYe61wAonyVn8UrtozQU5lYaOXaD7gAJbX1db9WfcutDwMtv8+jqQ6
 MXNHOciE6sUPOwOVnyPt99/xvyWXpX70wY22p6uyf0pNKMj4df8Go4Jaj6jm+mO0JDfj
 6UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5pO8srHxeyy8XfwYL1eqggORkYu4mPynLSww9CDHj/M=;
 b=n1sWzuFYvO0mpYuNUjQZ1oiLRlZUqA+NkIbDfAKJTxMU57OBBTjKbVhgLdQ9d8GK11
 L3zdMs2k4iF1zZMIdG2jiuLyRHSIf+bjQonNr+xfzrERUWlmh4eLtkJCYBVGvRnpTnwh
 kpXjC/l2ustd1h6lWKN4K7KktEKmq7oMQtDiGuGthkxeNb1avfO5Y99BeM50P62yWdZA
 EoFfM33KQOj2PaoZuK0gshK2SF+Eh6YUuQuVlrpyiNdeOzHy5hnDXRUeppO0xjcSd35t
 Z19xt/6y7DxTtIeBCxg9fdX8/+/lWDmor24rjKjFjwi8bmgBqfcwX1GsKvrNEAqZt+DB
 rvkw==
X-Gm-Message-State: AOAM532HI+hULzUoHKlo5hmuqVnJNI2Z20fdm73AveSdaUbLEgy6LS54
 B28iRZx230lvPR8vXhtBoFyyogE+gVvaFA==
X-Google-Smtp-Source: ABdhPJwOhIvoE5fHBuLW+NuONsUeuRq1QCcxsioCiesQvRFnG+VqDi+yN2A3RCOS2mb6X1aAQ2XrNw==
X-Received: by 2002:a62:6d86:0:b0:448:152d:83a4 with SMTP id
 i128-20020a626d86000000b00448152d83a4mr1504242pfc.38.1635388913792; 
 Wed, 27 Oct 2021 19:41:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/56] tcg/optimize: Split out fold_bswap
Date: Wed, 27 Oct 2021 19:41:07 -0700
Message-Id: <20211028024131.1492790-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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


