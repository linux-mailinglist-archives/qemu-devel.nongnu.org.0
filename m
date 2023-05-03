Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C046A6F50E0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:12:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6cQ-0005KQ-7k; Wed, 03 May 2023 03:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ap-0008Lj-13
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aE-0005ou-To
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso80495e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097642; x=1685689642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=larFjkYHXxL78J3QFkp+Ja9AW0TXM73Zch/rm8HTMf0=;
 b=QNe/52njhOB+/Mb7fLCO9gmErw9EnKT2Zl/hYs85W0XMz45Kqcv7OUKcYvv6tDXaEA
 aSEfcp0gLDBbuIleOL876H7+/+y1lP4X7qnuwVvAWNuZCZMmhPkIb/tViV4RiJRK58lu
 2L+Jahqx93APaq2+/hYLOOX8kvk7g0BVAIjCG4zis90Xfm319bOdXHUleXC+LX8nWJ5t
 zXXPa9aZuo0iq6zhF6Yco2BnxqTSYDKt+jx7V8gaZU5dye1TN0bypky6nH3A/FDU/KCD
 bjmQChznJR/QaOJfByi7UxWFPUfkw+kI0/3bf8xmvzjjBkxSZea5EmX9lkZn/cBjGZAk
 eUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097642; x=1685689642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=larFjkYHXxL78J3QFkp+Ja9AW0TXM73Zch/rm8HTMf0=;
 b=hi2lYH301Jnr0lyEwo7lRMjEajHep1hfspd/O9EjofzBA67LwGRERRjVs6Df32ts3Y
 aGS5DciQo7uTN/PHAFaisKSiTg5xSIE3dHuiB1r4JoUiZnJMwULAGM38V2MElNnOnjk3
 ZA+vZkGSkdX9SEbC3Ha/1pGVTbiqi68aGpVv9103ssNSS3bFrTk70EsQUpS7am7o127j
 sBs7E4v//KqpxAR+FVAxaTJz4ZbDU5G0fobSnhhedvh2GifB4vEay/kMDY7jjLr2B5mo
 bEF80lvKMce+pA6f4m9Et/fJx/jJQhuRqIs7BAK14cklWPKlR0abQ5eAA1DqBXsLCU3J
 S+1g==
X-Gm-Message-State: AC+VfDw3H60lY2EiqI4F+30zK8CaORTmiYjghnvUUuHYlFhKgARmEpHt
 h/ti6SqWBO96bRZSfknOmHqthKvvoDp6S7s9OZCfWg==
X-Google-Smtp-Source: ACHHUZ7UWWOlAEAg9WUQfyjGprMJe2GPdqGYCtoj3jT5siD94XIhcDt/fwfSRUnwr++f7IoG95erNQ==
X-Received: by 2002:a7b:cb46:0:b0:3f3:468c:a780 with SMTP id
 v6-20020a7bcb46000000b003f3468ca780mr3070506wmj.4.1683097641531; 
 Wed, 03 May 2023 00:07:21 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 32/57] tcg/sparc64: Rename tcg_out_movi_imm32 to
 tcg_out_movi_u32
Date: Wed,  3 May 2023 08:06:31 +0100
Message-Id: <20230503070656.1746170-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Emphasize that the constant is unsigned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 2e6127d506..e244209890 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -399,22 +399,18 @@ static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
     tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
 }
 
+/* A 13-bit constant sign-extended to 64 bits.  */
 static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
 {
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
-static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
+/* A 32-bit constant zero-extended to 64 bits.  */
+static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
 {
-    if (check_fit_i32(arg, 13)) {
-        /* A 13-bit constant sign-extended to 64-bits.  */
-        tcg_out_movi_s13(s, ret, arg);
-    } else {
-        /* A 32-bit constant zero-extended to 64 bits.  */
-        tcg_out_sethi(s, ret, arg);
-        if (arg & 0x3ff) {
-            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
-        }
+    tcg_out_sethi(s, ret, arg);
+    if (arg & 0x3ff) {
+        tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
     }
 }
 
@@ -433,7 +429,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
     if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_movi_imm32(s, ret, arg);
+        tcg_out_movi_u32(s, ret, arg);
         return;
     }
 
@@ -477,13 +473,13 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-        tcg_out_movi_imm32(s, ret, hi);
+        tcg_out_movi_u32(s, ret, hi);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
     } else {
         hi = arg >> 32;
-        tcg_out_movi_imm32(s, ret, hi);
-        tcg_out_movi_imm32(s, scratch, lo);
+        tcg_out_movi_u32(s, ret, hi);
+        tcg_out_movi_u32(s, scratch, lo);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
     }
-- 
2.34.1


