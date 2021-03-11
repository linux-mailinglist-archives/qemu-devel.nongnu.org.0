Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206033765E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:01:17 +0100 (CET)
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMoO-0007Y8-Cz
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUa-0003la-6J
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:50 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUS-0006Zx-9m
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:43 -0500
Received: by mail-qk1-x735.google.com with SMTP id x10so20776691qkm.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=J9yt/Z/4gdHNHp8hCuRVEoLsOKs/es7tBUbo3ECj9pTlUqgneNaMRkgxb57H85QouJ
 juFkMOLS6ojBFW7MybsUZdWa/RjcIseBZgClQeBD06eTSEP4xvL/8KvNfUm1VYsZ+7MY
 dhwe1yIRwkvHoats1rC0rl4bsbpoppCrDeVaD9WCHbfLgc4n8cojeafD0SjrZ1SbCYuT
 W+OJc4xZjZs6VHM2y4shamwF9rH4YzNbXkLkDHT1zfGTVlSJoSSyMG0G1c2/xMbYPgs4
 NCeIgoSEObDHA7zHfkIKwcCNR5Q9/0ylviaHPKAUV1SC19cGdOXtdhFHEl0W1iw2RLO3
 WggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r51gde6XQroUTuOp18Wacrk/m6aRKZagEOpI8SD7K0E=;
 b=CRPMS4de00q9scw1bacqTyNlKx3XBed2EpY3I5nB90OfdXSvjqS98J4J/SYjzae76B
 T6RqHjK/sBMDuK1XhkpCSMC5n8MG1tRHyRXr8xF2OHn2v6foB/LthBPF8cp51wH9HHag
 jbPNJwqYrcnOTSEiEBrwpXRryeF9ZBIJRa1tVU7Cm7xZts7FpSM871iHOIG6LejJq2q8
 xLA8N6Oqbt/3eMclYhz+GjYMam7pzw+PuHERX9cqDLytgCTL0U4DYyASJns5l/d2C5L0
 WCRpasiaT/LE408K7UDXIT1nueNUhrd8GU+MazzWHnHlCBUxuGeEsurA37AjpJrziBIf
 Myxw==
X-Gm-Message-State: AOAM5304b+4xSLMiSUiKBLgMOV0d+pe3RflpAHj1YULL879txjq9nheS
 34pLN9pKOHSe8z1yAu2Q0+k4Hlqzx8sMZhPV
X-Google-Smtp-Source: ABdhPJx9rrFC7GYc4sEZpZgQkth3N6W+FC1OPDF724ZIyv8e6gpMQ9K0ZofFv09XwffbjdNOlA4GJw==
X-Received: by 2002:a05:620a:1593:: with SMTP id
 d19mr7562338qkk.83.1615473639073; 
 Thu, 11 Mar 2021 06:40:39 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/57] tcg/tci: Split out tcg_out_op_rrs
Date: Thu, 11 Mar 2021 08:39:28 -0600
Message-Id: <20210311143958.562625-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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


