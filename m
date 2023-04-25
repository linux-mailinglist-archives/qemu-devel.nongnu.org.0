Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733556EE886
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:48:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOS3-0005sh-Q8; Tue, 25 Apr 2023 15:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORE-0004OO-Ua
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:58 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORA-0004tg-6x
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:56 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a8c51ba511so58083981fa.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451291; x=1685043291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=larFjkYHXxL78J3QFkp+Ja9AW0TXM73Zch/rm8HTMf0=;
 b=fJZEYhCQ0MoXKYNiI8U/nAIDoyltxe/oUgt481Y4bPlnngW2ezw14q9UmjF5pZ/vVc
 xSXALpxHvUq4cvW7lKgZYhj+C0b/j8xN3HHF5khESwrTQ5lbMJrT1uO3pVxOh6LwPjvt
 xurlj2iDGHDxnCHvKfanC5wkaxv/sxedG1WkrzurTQAiLkVBn7UyEiQUn3JUHDBlK7Yt
 JlLPNGFYuOPirtznisI7PkUllauNwrlKRoyESrgOMYgRC9N/LmXSrrYC4G0gqDViTs6I
 oyy7Rv/fFl0JTqxRN4S6BC2GG36tXfDmD3mZ4neBVLjPycDQX8J/pM8lk3Gl69OBp80m
 +3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451291; x=1685043291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=larFjkYHXxL78J3QFkp+Ja9AW0TXM73Zch/rm8HTMf0=;
 b=LbnKm5LoYIGyeU3bL5Isqba0EZ97JdejNm1FCDIXUdQsZdXOB76JmAfy394WRzfMhF
 tQ8kNJkYCk49xcCriGwK7Edx5TDPvb7OQxJClL+z1pKpN/ldXbpEPPAeFhfiGt+w9Ibi
 IQAgpjhhLvFTeCQMCXWC+lhhXonJCtSErY4IdFFHkQyYSoRgpwnBNdgKtFN5ZHhpX/6f
 U9TixIUp78BsNjetT+yf8T1rddgKvzZsmhqFqtco1q27JGlqV/Mk6xwWsqr8Wvm5NiJN
 4FMDAHeZMgqBedtr2VJzjtH3TVzH96owOFsSRR9QI9XcSx+tqA4LuRI9cSMUpC7TxfGB
 O1LA==
X-Gm-Message-State: AAQBX9e26LtxvyXsHX1ZP5NanW1AWUAzgcq9kJxfbShu4iLv9VFQyKcc
 gv9hOkK6iwwAcfRt2XOTy+Sqcz7SzHeuGCOCRRW6iA==
X-Google-Smtp-Source: AKy350ZG4NqZ+kei/QJE06n/1xkd0L0DSHNilc9hIm0P6aoiJS7eLqMZnz11rpn7gtMxTyGsg5P0GQ==
X-Received: by 2002:a2e:a17a:0:b0:2a7:7d70:6bb with SMTP id
 u26-20020a2ea17a000000b002a77d7006bbmr3790456ljl.2.1682451291014; 
 Tue, 25 Apr 2023 12:34:51 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 32/57] tcg/sparc64: Rename tcg_out_movi_imm32 to
 tcg_out_movi_u32
Date: Tue, 25 Apr 2023 20:31:21 +0100
Message-Id: <20230425193146.2106111-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x234.google.com
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


