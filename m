Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B93F0D01
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:55:35 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSb0-0001ok-Fy
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRv-0000KR-TC
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:12 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRt-00086X-GI
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:11 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m26so3404835pff.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yq7odZJKEOQT4jSEqTj2CmwhltJ5iDYOv4u5oxAiYrc=;
 b=FgVfzNUZV2QQpxjHJooX4JVs5FVLMLc02p3fz+0j0m6KCpmKBamzTSwyXQ9L+1b2eS
 i+7Q5Nj38ICHQgxjY4Trf9ZGSHd6BRWG+q3emzaOjb1RYfK5k5e0rIfqxvn95lpP7UYp
 3fVaJU/0IpqsrUNnGmgtI2omdiph5t/kDWNCeboXv95BxKdYFzwJNUuKvcuTIINUdq2o
 23B6hr0GvG+3nyf5hFqhkgUEEWLGlYclTi4iwp8chfeawIOd1CTdDCxYhCk69X4acJbv
 Q4cFNqT+xhVQ6RGQ3cT9TWrc+aoqWNBinSzbvrDOZMLe1UVc9zuNuqwwSZ2VvbRjylAa
 BBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yq7odZJKEOQT4jSEqTj2CmwhltJ5iDYOv4u5oxAiYrc=;
 b=VFqU8LsrprB/WzJp23RNfsktIWpGQZ/CATPz1zy8W2uyTCfAhKNSMoJNAuOzGDbJsw
 TU/hwEDIGy7G/Tgi9ytiyfiWhIQ9DxwunTnLBy5+QpIk8QjmL1v+KCgFiESdaATWJceH
 vE//rRvZ0JSxKIEJq6TFvfUhI6o5F7TjoDYPHu0rYYhUPe3NSrDYnYdJPz7IrBMYZdMU
 PnpAFgzAPlCnp8K4FEpp+jvuqZ2bcfdX6cNkjQrz3NC+Hr5l86z3JwxbjC6a+EKfOitK
 O2Lb0WjPo5SCwpOT1HekD266hj3YOgD1WJnLno0iClFlTVCf2mxIffkFs0UbRzuuNj4K
 piSg==
X-Gm-Message-State: AOAM530lwJMkxTvTVO2MzqZrwoMvtwjimaF17MvJuvArSh8fUhMd3uCg
 Ry94AhHU73Di37Xb7cIZkFGx+AJXLYIu+g==
X-Google-Smtp-Source: ABdhPJwXL9t468+b/0UmtJJt0w3yz9dDxuElNY1HvR92VOrWXHSutTMIIhE0wHR903WcOVHjCQfvbw==
X-Received: by 2002:a63:5c1b:: with SMTP id q27mr10550475pgb.284.1629319568262; 
 Wed, 18 Aug 2021 13:46:08 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm739815pfz.13.2021.08.18.13.46.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:46:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] tcg/sparc: Add scratch argument to tcg_out_movi_int
Date: Wed, 18 Aug 2021 10:45:58 -1000
Message-Id: <20210818204602.394771-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818204602.394771-1-richard.henderson@linaro.org>
References: <20210818204602.394771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to control exactly what scratch register is
used for loading the constant.  Also, fix a theoretical problem
in recursing through tcg_out_movi, which may provide a different
value for in_prologue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 9dd32ef95e..f11f054df5 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -414,7 +414,8 @@ static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long arg, bool in_prologue)
+                             tcg_target_long arg, bool in_prologue,
+                             TCGReg scratch)
 {
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
@@ -471,22 +472,24 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
+        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
     } else {
+        tcg_debug_assert(scratch != TCG_REG_G0);
         hi = arg >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
-        tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_T2, lo);
+        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
+        tcg_out_movi_int(s, TCG_TYPE_I32, scratch, lo, in_prologue, TCG_REG_G0);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
-        tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
+        tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
     }
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_out_movi_int(s, type, ret, arg, false);
+    tcg_debug_assert(ret != TCG_REG_T2);
+    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
 }
 
 static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
@@ -837,7 +840,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     } else {
         uintptr_t desti = (uintptr_t)dest;
         tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue);
+                         desti & ~0xfff, in_prologue, TCG_REG_O7);
         tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
     }
 }
@@ -1013,7 +1016,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base != 0) {
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base, true);
+        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base,
+                         true, TCG_REG_T1);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
-- 
2.25.1


