Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79603AF93F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:23:46 +0200 (CEST)
Received: from localhost ([::1]:39962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTGb-0000ys-MY
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC6-0000wd-M5
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:06 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC3-0005zW-5i
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:06 -0400
Received: by mail-pj1-x1035.google.com with SMTP id g4so10910949pjk.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgN2RVC9T7a74NE01POCZUsNKgpvvfqPoLVvw7rnjlE=;
 b=Ye2+IaCh4rLM6YJmP+3C8eR/l30VtUAvi5Jw8Fh87J8vPNgpSZkUNMIO4GnuqraX5x
 ITcGm5AQWRA9cPz6hx7j26yIbkCYqahOd795z5u7MclWcqMVFuFzzEry8UE0HNPOwcy0
 ectSrKDAsdP3GrMKPINiZeTYFe6hXj8FvWeoUwBr3/Oggq5Y1TyLsBK+mHeYdRoraUg0
 2LqAHL/qMtvgnWswlo7Zg8c3INZKs24jg4xSQyxcyZSHk5JnJRZjk2zDlsaFZfrGUwOF
 uYHQf7MFlZxY75/9C+yJStn1C3+oQKqV+29z5BcnnNEEd0emBEOifNEHvIv3d0V8WoDE
 EndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgN2RVC9T7a74NE01POCZUsNKgpvvfqPoLVvw7rnjlE=;
 b=ASvtjwPUDSx7oYlRuoJb0Da2bG96pAyPWarL/yLVliWHeKfFa+1kX/rZPde9GfjJ5M
 v2VfKtR8i0/rppX4GY+VvAr7SRqQOjGpUkNgHZpYM7UWrHKh7rJEhxPr8Umg2+Wuqua0
 PUa8QSKOyDIEmWBudSp3LslBB/5I/pcuBNrykM7ZiejXMAD8suGcCpYHJIoc8hRP4R2t
 vjGS2BIa0tOX0JtYhKCAhh/frLOetsgar7iR4YJfXzkCrHhiG0Su0FVt/x0xrLjoOeEF
 KH/MXPBXNIfBQodpongjMngf6gWYwVFSodke52Y5/reZM3p7kIYMhglxSbzRHHGht6SP
 ERFw==
X-Gm-Message-State: AOAM532sydZbjt8uOieA0+/jjqEymk1qCHrb+QSJsHMvNuIJPqIPQ9cX
 xmQI7poPYp9VrSi4DoOm+WmJ3zUcMaB17A==
X-Google-Smtp-Source: ABdhPJwaeSKzssb6IaXJJy5wSbC2qgVy8vN/0g7h/y1SOBlcXOFwiKYpKxUpj+CX7cVhoAyHMg0Y1Q==
X-Received: by 2002:a17:90b:33c4:: with SMTP id
 lk4mr642983pjb.191.1624317541901; 
 Mon, 21 Jun 2021 16:19:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/29] tcg: Handle new bswap flags during optimize
Date: Mon, 21 Jun 2021 16:18:37 -0700
Message-Id: <20210621231849.1871164-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notice when the input is known to be zero-extended and force
the TCG_BSWAP_IZ flag on.  Honor the TCG_BSWAP_OS bit during
constant folding.  Propagate the input to the output mask.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 37c902283e..3b6983fbef 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -354,10 +354,12 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
         return (uint16_t)x;
 
     CASE_OP_32_64(bswap16):
-        return bswap16(x);
+        x = bswap16(x);
+        return y & TCG_BSWAP_OS ? (int16_t)x : x;
 
     CASE_OP_32_64(bswap32):
-        return bswap32(x);
+        x = bswap32(x);
+        return y & TCG_BSWAP_OS ? (int32_t)x : x;
 
     case INDEX_op_bswap64_i64:
         return bswap64(x);
@@ -1028,6 +1030,42 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
+        CASE_OP_32_64(bswap16):
+            mask = arg_info(op->args[1])->mask;
+            if (mask <= 0xffff) {
+                op->args[2] |= TCG_BSWAP_IZ;
+            }
+            mask = bswap16(mask);
+            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
+            case TCG_BSWAP_OZ:
+                break;
+            case TCG_BSWAP_OS:
+                mask = (int16_t)mask;
+                break;
+            default: /* undefined high bits */
+                mask |= MAKE_64BIT_MASK(16, 48);
+                break;
+            }
+            break;
+
+        case INDEX_op_bswap32_i64:
+            mask = arg_info(op->args[1])->mask;
+            if (mask <= 0xffffffffu) {
+                op->args[2] |= TCG_BSWAP_IZ;
+            }
+            mask = bswap32(mask);
+            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
+            case TCG_BSWAP_OZ:
+                break;
+            case TCG_BSWAP_OS:
+                mask = (int32_t)mask;
+                break;
+            default: /* undefined high bits */
+                mask |= MAKE_64BIT_MASK(32, 32);
+                break;
+            }
+            break;
+
         default:
             break;
         }
@@ -1134,9 +1172,6 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ext16s):
         CASE_OP_32_64(ext16u):
         CASE_OP_32_64(ctpop):
-        CASE_OP_32_64(bswap16):
-        CASE_OP_32_64(bswap32):
-        case INDEX_op_bswap64_i64:
         case INDEX_op_ext32s_i64:
         case INDEX_op_ext32u_i64:
         case INDEX_op_ext_i32_i64:
@@ -1150,6 +1185,17 @@ void tcg_optimize(TCGContext *s)
             }
             goto do_default;
 
+        CASE_OP_32_64(bswap16):
+        CASE_OP_32_64(bswap32):
+        case INDEX_op_bswap64_i64:
+            if (arg_is_const(op->args[1])) {
+                tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
+                                          op->args[2]);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
+                break;
+            }
+            goto do_default;
+
         CASE_OP_32_64(add):
         CASE_OP_32_64(sub):
         CASE_OP_32_64(mul):
-- 
2.25.1


