Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076CB311665
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:08:07 +0100 (CET)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ACs-0006nz-2M
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2S-00023s-3H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:20 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2P-0003Jz-TJ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:19 -0500
Received: by mail-pf1-x431.google.com with SMTP id 18so3156577pfz.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gzoTh/DnzHssC7cCFW1QEczWz5vWhlHn8h/Weu1Sj0=;
 b=BIYAbNO98EmJmFzSTcx0Xg1uTHRkieCeU7/tu307qjpGqWUA5EJxNXuiWk4y3yR5hM
 6inBeVS/8QA2a4dlP/Jyc+6sgd6Ky8FDvbnfBRvyW/1RXG5dY/0RGH2xBhbPLjwoGVGM
 zOFuzQRiqS00iAa/1f11bHihNl6pxHstf1pzeAuXs9592mT0LNPoChSQtHtwzC1UsTRH
 f0zGz6rCXdbK1s9da9LBgu+orZr5DXaxhChYWncIRQVDgM+7LaBVCOZ9KW0PPIPQhT7m
 8gD/UW1hmpS81Is1T4Xi3yrLL7BSNVoYDcXRjC7tvcAYr0kkF4I8UnODcSiY43PZJMAv
 5VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gzoTh/DnzHssC7cCFW1QEczWz5vWhlHn8h/Weu1Sj0=;
 b=KrsT0eHxKIM4uqbaIDdusYLzrBDT5oM0Xvjk4PKW3Na2MyZ++NA6C99iSpe8NhDzyx
 +VtfymWw3p21FOtN6TvStt0vaC9Z1sgY7yHsXnndXw+kQrloxf8zCun48q+iNMb1ZBje
 W7wz+xySaZ4HNOJer7gKOY+G+fqdDiEZr9xHGvlefzYR+i6jaMCt5BsSHdtqdkS6Woh8
 WWEvw/YHP3rUR8+iyTEV2nNtQz42s2RpcK/PWNSfAwmXEP6n3qcuhD8SO0q3FySrcYIW
 SoA3qw7QdFBkDQTNaE1KfJzguyHwjT1cERgmIy/2jWNjBvDLCUiY0/KMaHf7ELnWxPXu
 AC3g==
X-Gm-Message-State: AOAM531sRnEkBVeEY4+5UKV3FibTmm8uLz/u0l++JimYrV2d9Tap2FbG
 c5evxNAczltAVweHw388Nc+X1wMvcakSPY/X
X-Google-Smtp-Source: ABdhPJwAl59Vpdb03EpL2GLGDMcuQz27oZxe2HQvDQHQab/hGKVo3ugvP5sAQFDVYsw1s+yovkEMqw==
X-Received: by 2002:aa7:8b51:0:b029:1ae:687f:d39b with SMTP id
 i17-20020aa78b510000b02901ae687fd39bmr6910751pfd.50.1612565836560; 
 Fri, 05 Feb 2021 14:57:16 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/46] tcg/tci: Inline tci_write_reg64 into 64-bit callers
Date: Fri,  5 Feb 2021 12:56:16 -1000
Message-Id: <20210205225650.1330794-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that we had two functions of the same name: a 32-bit version
which took two register numbers and a 64-bit version which was a
no-op wrapper for tcg_write_reg.  After this, we are left with
only the 32-bit version.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 60 +++++++++++++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 39ad00663f..0f56702b93 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -124,12 +124,6 @@ static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
     tci_write_reg(regs, low_index, value);
     tci_write_reg(regs, high_index, value >> 32);
 }
-#elif TCG_TARGET_REG_BITS == 64
-static void
-tci_write_reg64(tcg_target_ulong *regs, TCGReg index, uint64_t value)
-{
-    tci_write_reg(regs, index, value);
-}
 #endif
 
 #if TCG_TARGET_REG_BITS == 32
@@ -559,7 +553,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
             condition = *tb_ptr++;
-            tci_write_reg64(regs, t0, tci_compare64(t1, t2, condition));
+            tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
 #endif
         case INDEX_op_mov_i32:
@@ -839,12 +833,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_mov_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_i64(&tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 
             /* Load/store operations (64 bit). */
@@ -886,7 +880,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg64(regs, t0, *(uint64_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
         case INDEX_op_st8_i64:
             t0 = tci_read_r8(regs, &tb_ptr);
@@ -920,19 +914,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 + t2);
+            tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 - t2);
+            tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 * t2);
+            tci_write_reg(regs, t0, t1 * t2);
             break;
 #if TCG_TARGET_HAS_div_i64
         case INDEX_op_div_i64:
@@ -951,19 +945,19 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 & t2);
+            tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 | t2);
+            tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 ^ t2);
+            tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
             /* Shift/rotate operations (64 bit). */
@@ -972,32 +966,32 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 << (t2 & 63));
+            tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1 >> (t2 & 63));
+            tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, ((int64_t)t1 >> (t2 & 63)));
+            tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, rol64(t1, t2 & 63));
+            tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_ri64(regs, &tb_ptr);
             t2 = tci_read_ri64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, ror64(t1, t2 & 63));
+            tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
@@ -1008,7 +1002,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp64 = (((1ULL << tmp8) - 1) << tmp16);
-            tci_write_reg64(regs, t0, (t1 & ~tmp64) | ((t2 << tmp16) & tmp64));
+            tci_write_reg(regs, t0, (t1 & ~tmp64) | ((t2 << tmp16) & tmp64));
             break;
 #endif
         case INDEX_op_brcond_i64:
@@ -1026,28 +1020,28 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_ext8u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8s_i64
         case INDEX_op_ext8s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r8s(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16s_i64
         case INDEX_op_ext16s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i64
         case INDEX_op_ext16u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext32s_i64
@@ -1056,7 +1050,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r32s(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
@@ -1064,41 +1058,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_extu_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, t1);
+            tci_write_reg(regs, t0, t1);
             break;
 #if TCG_TARGET_HAS_bswap16_i64
         case INDEX_op_bswap16_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, bswap16(t1));
+            tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_bswap32_i64
         case INDEX_op_bswap32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, bswap32(t1));
+            tci_write_reg(regs, t0, bswap32(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, bswap64(t1));
+            tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i64
         case INDEX_op_not_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, ~t1);
+            tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i64
         case INDEX_op_neg_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t0, -t1);
+            tci_write_reg(regs, t0, -t1);
             break;
 #endif
 #endif /* TCG_TARGET_REG_BITS == 64 */
-- 
2.25.1


