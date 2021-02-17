Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAFE31E0D7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:53:29 +0100 (CET)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTpA-0004TF-L6
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMR-00010h-LX
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:47 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMQ-0007bW-1d
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:47 -0500
Received: by mail-pf1-x433.google.com with SMTP id k13so9144029pfh.13
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=gMJKM5xxoAO5xKzRTST23meGQ1BWzUpYhJdmo08aZlV3VfcgB9Wy5O6lQxSthdCESx
 ByHomRWmbgYq/wARDW4INOoxIg1W838OT+nXgy7isIW3SWe3rDgUclyAsGtAPHwKpkYb
 MjuXGivFkTxmLQumKIxbCssRqtkXGtPnMoyGMDRx1qeVB7rLYQC6VkbybB5u1HSuWYYZ
 YrkV1sd26LY/pFfej55HT5Gr/0IRqiWp26sXWwR/WJrnMmGxlHwzJNs3aMIGTxziVUsK
 VU7V9roN2q6gh9X+1mHzmkO97V4P5RPndNRZXq6PbTWX6/y86jrBM3a572CxpUyBPkeI
 56Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=QWgpJoK3hGH1bEqdKXv7fkf3KdBz2+RX/FZbdkuWfk7W+ah2fA1zhaHIAiGiBIYNUW
 Ju/L5TluxBspeefQqzD/N4APNFyXZFgByoqfvM7SAf+RGNkWq7pV6qMuSAzCniiDtArs
 QQCXhAezXCkJEkAFX3cPf3e1P/na/TPKyf6dtp9DkYrB3CnZ0v186isI0FaG6grQk0td
 gEybhfWCikZ16gQ3Dc55KycML/ohLhCzGnsu0R385lCfIWXJLGmReH29E+cDs6HrvHO8
 f8o/QE3d+O+ekS0uIUoD1ffDXRfHTiuq27N5e7pKB3RFu4QCGKiTX96veCoDdDW8JF37
 EYbw==
X-Gm-Message-State: AOAM532HdvFGQ9+/mgVu1u4DqbUVjNcuD9I/tudnSLGgHKn/lOZqh8Kx
 5Z3C/euxdhQPPegRYTPDbgLcgZAjdppNYw==
X-Google-Smtp-Source: ABdhPJzO9dFuZP37ZASmkbvZ9XmVWcq33PWuZoSbC8v7uu+7pZhFUvjwMhtG8IBKduygF92197dz/g==
X-Received: by 2002:a63:ef53:: with SMTP id c19mr1002845pgk.78.1613593424749; 
 Wed, 17 Feb 2021 12:23:44 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 42/71] tcg/tci: Split out tcg_out_op_rrs
Date: Wed, 17 Feb 2021 12:20:07 -0800
Message-Id: <20210217202036.1724901-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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


