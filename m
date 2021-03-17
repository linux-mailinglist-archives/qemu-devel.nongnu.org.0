Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8233F4B5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:55:30 +0100 (CET)
Received: from localhost ([::1]:53716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYW9-0001NY-LJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCY-0005Hh-VC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:15 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:39711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCU-0007Fs-Cb
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:14 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so2179957ote.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqWvJPv2QJcl5783xhTMPdeXOYP80mgzBLWIYOxLyOM=;
 b=iaQehKe5YK42n+dMBBvxd7W2E3lzNLRQL2mrrYxu8ydQ1Li3zw2Nwq0QMD+wqHK0P/
 OQsJltVXAS4xRuABvzSUuCtKCOAEYY91vOLcEXWijgAqUrePAbunOzhqzZKoerrlTPZC
 yL5owAKP4GQRcUMwpWFqCg2p7HU/yfEv34QOOF0gMunLBxDmZ0+1sYlp/7wdKPiRkGJ4
 8N6goZbYqMXA+AQnmQLuPQsA4cpzzMbTS6Ajic9Uz6sdXIGph3wM4sYHYM2x2hSHOycu
 tjzUSBOPKTGEf/28BnReWQsa2YgEkpD3I8SiEmP3x0Otsbo2LWwcpR77YlOb9n7LJ72V
 6kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqWvJPv2QJcl5783xhTMPdeXOYP80mgzBLWIYOxLyOM=;
 b=JwGmOhNS2kq4leoCPrV6TCaRFVtixfMDK1HYJYg68QVMa4uupymyGLeEtpWnGAudeP
 /3bLwV5ENlhAiiBSKm0i1zbHRAq9z1oTs/AT4lAWkczs+rChy971zcvdJ3CocOa/9wZ2
 D90H6yAv0DAU9M1Qpe7bPjmi1G6VsVKd41arep+C8wFor8emXmw+1O9FeedlOEfVf1sv
 vNWvjBJa6tzwwhtbNFEKZ7FJFsN2n5A6oTrnd4SjDb24yLbacydEHJ1Hq6z4yhoXEKSi
 E9aNltLX2BdcDbTQWo8XFGGA7mI7vdSqvXrdNfdFFP7hOM+nViS2TXOa2hJOj1JVMyiL
 qY9g==
X-Gm-Message-State: AOAM532L6qEuhJcXvD0WUbKyY7bCUATgWcRD5kCx31nqmJze9+ytXSC7
 nTq7dXHus9Q6ZIWoVcSfNcB57pMtf2I3J/ZF
X-Google-Smtp-Source: ABdhPJy6gHvY2tGnv9A5QU3wyZwzJ3JNDDLA5eaLs6ELjDGvEhlKOn0ns4iCP71g5rB+90WPrIGs8Q==
X-Received: by 2002:a9d:4c8f:: with SMTP id m15mr3672596otf.16.1615995309397; 
 Wed, 17 Mar 2021 08:35:09 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/38] tcg/tci: Split out tcg_out_op_rrs
Date: Wed, 17 Mar 2021 09:34:29 -0600
Message-Id: <20210317153444.310566-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 84 +++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 45 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c5b061fe76..bb4dd76211 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -297,32 +297,38 @@ static void stack_bounds_check(TCGReg base, target_long offset)
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


