Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E939D6F51FD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Ve-0000Of-04; Wed, 03 May 2023 03:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UQ-0006Ht-2B
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-0003D1-Jy
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:25 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso47348095e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097268; x=1685689268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0CeyWjMqe57NR22sbQHD4MYtLkRo2vj3jA4zBvWRdg=;
 b=wizqWylkEeuPCCz9DtCOAlOHxX3XR+y5h7V2no6x9UAZJ6DZERsx6ddXh2Erev3Ec5
 J5aY+L+8rPrilYMahwoUbAkZ009pNqh+5Y6pkuwHxDMB6qbGITXcYvgD+phRpa+KY8mX
 10JA/omQ/q+oTV3nxj/HGHWD0ay9rS7AHgs0oLZ9hiDO+HWhQdb7vd4wRY0ys+rh0hIM
 uqIQhBZGXgJIEfFlHSCFs0rK977blPzoTZR4XQHBol9gKqLwdy8ALOXezOujvXS8bSM0
 LL2ySHEaAg69ZcyWDtvRhonTZ/Rd7ingJRwVeFXtBfCbRioHYsLP9ZPvL+KcMJlBamZZ
 hIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097268; x=1685689268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0CeyWjMqe57NR22sbQHD4MYtLkRo2vj3jA4zBvWRdg=;
 b=TPesjORH2VeTl5Yffx6718Fhmt8zP5FEqb0GbWJc1vHrf7pGLkMEXufq08WsoG9gqI
 U+cdVn0v52pXHZzs8SXF4nTTtuo0q9XUjgGayvDxobiLQbU0hOobaAL2HGW1gCAlt5x8
 xkzWcEO4tdch2rcXJ1qaH6rO+H0brXhHZ0JfbxRyQz/J1piLRUK1pJY7UD1EPYMMhjKG
 PlP8kNZzy28OHUnigUEY071/Eo4fzTV1uHib4s8JEpC1xS5v7ci7OGRxXgUgvbsx6+8u
 QbvE89athmZqZHYDE+Ag3XmGjjX3FVoAcfTLkzC3+SdjN5YczsXQWWe8MBHpWsKzzGo2
 xZSw==
X-Gm-Message-State: AC+VfDzF5wx4Mvjp/lALt03CJoLE5/P5RcQ3FKCCTOKBWXHPCjxNgTt8
 21626wEGj4kLDOM+yObfthFDW/hjpqG0w2cnCJZI+g==
X-Google-Smtp-Source: ACHHUZ7eTlfJZSuxv9jrivqzblP4PMuodFfTSJ1Hc/LLcyJWJi6YptO1TzwA29aXLelqTuqO1P6tKQ==
X-Received: by 2002:a05:6000:509:b0:2fe:851c:672f with SMTP id
 a9-20020a056000050900b002fe851c672fmr13154375wrf.8.1683097267993; 
 Wed, 03 May 2023 00:01:07 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v4 49/54] tcg/ppc: Adjust constraints on qemu_ld/st
Date: Wed,  3 May 2023 07:57:24 +0100
Message-Id: <20230503065729.1745843-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
available registers.  Now that we handle overlap betwen inputs and
helper arguments, we can allow any allocatable reg.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-set.h | 11 ++++-------
 tcg/ppc/tcg-target-con-str.h |  2 --
 tcg/ppc/tcg-target.c.inc     | 32 ++++++++++----------------------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
index a1a345883d..f206b29205 100644
--- a/tcg/ppc/tcg-target-con-set.h
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -12,18 +12,15 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
-C_O0_I2(S, S)
 C_O0_I2(v, r)
-C_O0_I3(S, S, S)
+C_O0_I3(r, r, r)
 C_O0_I4(r, r, ri, ri)
-C_O0_I4(S, S, S, S)
-C_O1_I1(r, L)
+C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
 C_O1_I1(v, vr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
 C_O1_I2(r, rI, ri)
 C_O1_I2(r, rI, rT)
 C_O1_I2(r, r, r)
@@ -36,7 +33,7 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rZ, rZ)
 C_O1_I4(r, r, r, ri, ri)
-C_O2_I1(L, L, L)
-C_O2_I2(L, L, L, L)
+C_O2_I1(r, r, r)
+C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rI, rZM, r, r)
 C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 298ca20d5b..f3bf030bc3 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -14,8 +14,6 @@ REGS('A', 1u << TCG_REG_R3)
 REGS('B', 1u << TCG_REG_R4)
 REGS('C', 1u << TCG_REG_R5)
 REGS('D', 1u << TCG_REG_R6)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 6850ecbc80..5a4ec0470a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -93,18 +93,6 @@
 #define ALL_GENERAL_REGS  0xffffffffu
 #define ALL_VECTOR_REGS   0xffffffff00000000ull
 
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (ALL_GENERAL_REGS & \
-     ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | (1 << TCG_REG_R5)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | \
-                          (1 << TCG_REG_R5) | (1 << TCG_REG_R6)))
-#else
-#define ALL_QLOAD_REGS  (ALL_GENERAL_REGS & ~(1 << TCG_REG_R3))
-#define ALL_QSTORE_REGS ALL_QLOAD_REGS
-#endif
-
 TCGPowerISA have_isa;
 static bool have_isel;
 bool have_altivec;
@@ -3752,23 +3740,23 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L)
-                : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r)
+                : C_O1_I2(r, r, r));
 
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(S, S)
-                : C_O0_I3(S, S, S));
+                ? C_O0_I2(r, r)
+                : C_O0_I3(r, r, r));
 
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(L, L, L)
-                : C_O2_I2(L, L, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
 
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(S, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(S, S, S)
-                : C_O0_I4(S, S, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
+                : C_O0_I4(r, r, r, r));
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
-- 
2.34.1


