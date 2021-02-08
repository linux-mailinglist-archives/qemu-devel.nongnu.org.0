Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B48312933
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:11:17 +0100 (CET)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wxI-0002Km-5D
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSN-0002K2-40
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:19 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSL-00066E-6L
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:18 -0500
Received: by mail-pj1-x102e.google.com with SMTP id my11so8641020pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=dL9Sz56GmvCh0ykbabuFLxwWpg3bjxPMOavmmuyS362ydKtriIKUgxFZ4pfgs81/KW
 KGS0a+98/SIRfEAo8AP0p3SSskKwe8QK7SNO26ESUaoM0STcrilgM+9dvvSQ9G96LtK/
 2oc9M1KKAaIdP0JzEtrifNKtGfiZlYy5IWm92bp3t2QHkpe+jHrKQBPNPxrcFWt6ouzm
 DgOvWiIAd5f9TIt4eMVYPiSGtv4WgEgMhGFVTjenfNOMmZ+mHudXbjb33uwlxXLsJ12s
 dh6+YWyV1LIkmBJgAYEZ4kVUB8a510bIPRuGFUE5OYp7UKxyqZ4sCl+2L0VQdIMgbgnR
 KH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=eIhiqkeH5Ckjg3jmf2BDaX9j6G6Qa0hEol0i0xPDMxllVZYOkHLiIbL/zoB3gxhZtf
 hqBsYkg/RfxJOZVt9Jrra+toPhAfhZtnHq7DYS8qjJs3FuGE48HXeVGnLOmyerY0I0Sk
 CPCKzko+4UsOJz+0V66oYrJsC+OHSJ3xG7UFmc7f8mv2bkweDfZ5q6T4z52f2vVcemP7
 YDmcYmtFCLrNDh/0B0r0le5WIBYR3RKN6ayQczJvAaEqSst9UzBUr79vb1pmlpMVlq7l
 5GTR6SQjR10GwoQuXbioZrZXQA6dUvdaxaWWRYm8I3nXG6fmoW7Ktpd6hAiNVfqfCtR7
 NfxQ==
X-Gm-Message-State: AOAM532VHS47XR09OHmpGK1XZsPX0RVKqRn9YxMgm6YFUy03d+0eiRrK
 Th5qheJX5rynSOh9gc06UhQMFs9djsUtNg==
X-Google-Smtp-Source: ABdhPJwZG0K0yuqueI5Bl74O5ZRzY8BRfLKx95J1vx4FoeIcV4P9P2bXhvr0xj81dh2WlLspglPPYw==
X-Received: by 2002:a17:902:be0d:b029:e1:4ab:8fd2 with SMTP id
 r13-20020a170902be0db02900e104ab8fd2mr14672967pls.6.1612751955897; 
 Sun, 07 Feb 2021 18:39:15 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 42/70] tcg/tci: Split out tcg_out_op_rrs
Date: Sun,  7 Feb 2021 18:37:24 -0800
Message-Id: <20210208023752.270606-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 84 +++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 45 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 050d514853..707f801099 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -283,32 +283,38 @@ static void stack_bounds_check(TCGReg base, target_long offset)
     }
 }
 
-static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
-                       intptr_t arg2)
+static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
+                           TCGReg r0, TCGReg r1, intptr_t i2)
 {
     uint8_t *old_code_ptr = s->code_ptr;
 
-    stack_bounds_check(arg1, arg2);
-    if (type == TCG_TYPE_I32) {
-        tcg_out_op_t(s, INDEX_op_ld_i32);
-        tcg_out_r(s, ret);
-        tcg_out_r(s, arg1);
-        tcg_out32(s, arg2);
-    } else {
-        tcg_debug_assert(type == TCG_TYPE_I64);
-#if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_ld_i64);
-        tcg_out_r(s, ret);
-        tcg_out_r(s, arg1);
-        tcg_debug_assert(arg2 == (int32_t)arg2);
-        tcg_out32(s, arg2);
-#else
-        TODO();
-#endif
-    }
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_debug_assert(i2 == (int32_t)i2);
+    tcg_out32(s, i2);
+
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
+                       intptr_t offset)
+{
+    stack_bounds_check(base, offset);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rrs(s, INDEX_op_ld_i32, val, base, offset);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_out_op_rrs(s, INDEX_op_ld_i64, val, base, offset);
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -444,12 +450,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_64(st32)
     CASE_64(st)
         stack_bounds_check(args[1], args[2]);
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_debug_assert(args[2] == (int32_t)args[2]);
-        tcg_out32(s, args[2]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrs(s, opc, args[0], args[1], args[2]);
         break;
 
     CASE_32_64(add)
@@ -597,29 +598,22 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     }
 }
 
-static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
-                       intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
+                       intptr_t offset)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    stack_bounds_check(arg1, arg2);
-    if (type == TCG_TYPE_I32) {
-        tcg_out_op_t(s, INDEX_op_st_i32);
-        tcg_out_r(s, arg);
-        tcg_out_r(s, arg1);
-        tcg_out32(s, arg2);
-    } else {
-        tcg_debug_assert(type == TCG_TYPE_I64);
+    stack_bounds_check(base, offset);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rrs(s, INDEX_op_st_i32, val, base, offset);
+        break;
 #if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_st_i64);
-        tcg_out_r(s, arg);
-        tcg_out_r(s, arg1);
-        tcg_out32(s, arg2);
-#else
-        TODO();
+    case TCG_TYPE_I64:
+        tcg_out_op_rrs(s, INDEX_op_st_i64, val, base, offset);
+        break;
 #endif
+    default:
+        g_assert_not_reached();
     }
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
 static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-- 
2.25.1


