Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC336006C9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:44:59 +0200 (CEST)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okJru-0001LK-3R
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJZ2-0006yy-Ki
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJZ0-0000gT-Od
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id l1so9857966pld.13
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 23:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lBVlUWaE6icRpUEtJVf7OQX8PXnvSL2vxe7ZkjJleOw=;
 b=RIjlRW6BrRdzi0TkHgcdZhsxNG3IJWlkpHY9FdCf3cEwJAg9BmDsCHadPoqO/hacYi
 AIEnNT3NI9B4Fu0jtE5SSmxwOEMn0lz/V2FDeDeXvpf13mXWlbgDB6t+jVVwEOnDYDaH
 SMN6p+eY/O2Qb0VLtQiTpc0ft2U3Z8T/vH+YHuUduNvfrqGQVvHZqUrg5DrvjpZQp+SU
 V1pGsT3VG079iLrzMUTGGspxC4HoGIsy9idMrKw8ERf7cW6FgUJTh3wDRdv5PRP7ljps
 I2QHlSxM9gVG2h6S6+47EEOeIZMFOq8ULiCaHH+JN1+sAeqF+bW4tSZ+vJzYpAlP9UKF
 OjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBVlUWaE6icRpUEtJVf7OQX8PXnvSL2vxe7ZkjJleOw=;
 b=LN6cEUIhtCcB86qslGio/A1k3zI1egKjDIuKSs8beAdYrPzd+b7LFWzRQtCve/UukI
 pGaiD1PhvZMt1aAoclP+EoKFieo+F/JaJIvZXzObkjHJBJWxI0u+WU7hqYfPDGJ0Yv/7
 wcxAeC5QgtByyeO66NEB7vP74ts/xGyvxv8dL4OLvNmNPHII2PwXEE/BoopxFgE9YZTQ
 MiAPzQDidENTNf40GeC9kKIHwH4xw8Bq88CuP1So59kEEcgXb5l4nRPmYmAz152G5tMN
 Hl40NWndYPRfPVk8+7Kegn88VeJdfJhF8YrKhPq495Pr+O+D8Kk4nBbPtucT6zw6bYk+
 Cgow==
X-Gm-Message-State: ACrzQf0prmWSlCWbdv73BxnXpXQ7fCAcA8ziOKo6ZFw5MHLttggW1kzi
 5l7kABsnaZML5VBHrPqVr7HBLslSRfP8610k
X-Google-Smtp-Source: AMsMyM4wGL4v2QtvmN5+rGFaXK6hFYH3YROJXFfGJ/jxPPY4HibkXqHtgVnBkeNX4foxclg52hHDeg==
X-Received: by 2002:a17:902:7481:b0:180:58d7:24e0 with SMTP id
 h1-20020a170902748100b0018058d724e0mr10393963pll.49.1665987924841; 
 Sun, 16 Oct 2022 23:25:24 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a170902d4c100b00177f32b1a32sm362632plg.271.2022.10.16.23.25.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 23:25:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tcg/sparc64: Remove sparc32plus constraints
Date: Mon, 17 Oct 2022 16:24:45 +1000
Message-Id: <20221017062445.563431-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017062445.563431-1-richard.henderson@linaro.org>
References: <20221017062445.563431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With sparc64 we need not distinguish between registers that
can hold 32-bit values and those that can hold 64-bit values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target-con-set.h |  16 +----
 tcg/sparc64/tcg-target-con-str.h |   3 -
 tcg/sparc64/tcg-target.c.inc     | 109 ++++++++++++-------------------
 3 files changed, 44 insertions(+), 84 deletions(-)

diff --git a/tcg/sparc64/tcg-target-con-set.h b/tcg/sparc64/tcg-target-con-set.h
index 3b751dc3fb..31e6fea1fc 100644
--- a/tcg/sparc64/tcg-target-con-set.h
+++ b/tcg/sparc64/tcg-target-con-set.h
@@ -11,22 +11,12 @@
  */
 C_O0_I1(r)
 C_O0_I2(rZ, r)
-C_O0_I2(RZ, r)
 C_O0_I2(rZ, rJ)
-C_O0_I2(RZ, RJ)
-C_O0_I2(sZ, A)
-C_O0_I2(SZ, A)
-C_O1_I1(r, A)
-C_O1_I1(R, A)
+C_O0_I2(sZ, s)
+C_O1_I1(r, s)
 C_O1_I1(r, r)
-C_O1_I1(r, R)
-C_O1_I1(R, r)
-C_O1_I1(R, R)
-C_O1_I2(R, R, R)
+C_O1_I2(r, r, r)
 C_O1_I2(r, rZ, rJ)
-C_O1_I2(R, RZ, RJ)
 C_O1_I4(r, rZ, rJ, rI, 0)
-C_O1_I4(R, RZ, RJ, RI, 0)
 C_O2_I2(r, r, rZ, rJ)
-C_O2_I4(R, R, RZ, RZ, RJ, RI)
 C_O2_I4(r, r, rZ, rZ, rJ, rJ)
diff --git a/tcg/sparc64/tcg-target-con-str.h b/tcg/sparc64/tcg-target-con-str.h
index fdb25d9313..8f5c7aef97 100644
--- a/tcg/sparc64/tcg-target-con-str.h
+++ b/tcg/sparc64/tcg-target-con-str.h
@@ -9,10 +9,7 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('R', ALL_GENERAL_REGS64)
 REGS('s', ALL_QLDST_REGS)
-REGS('S', ALL_QLDST_REGS64)
-REGS('A', TARGET_LONG_BITS == 64 ? ALL_QLDST_REGS64 : ALL_QLDST_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 097bcfcd12..cb9453efdd 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -80,19 +80,8 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #else
 #define SOFTMMU_RESERVE_REGS 0
 #endif
-
-/*
- * Note that sparcv8plus can only hold 64 bit quantities in %g and %o
- * registers.  These are saved manually by the kernel in full 64-bit
- * slots.  The %i and %l registers are saved by the register window
- * mechanism, which only allocates space for 32 bits.  Given that this
- * window spill/fill can happen on any signal, we must consider the
- * high bits of the %i and %l registers garbage at all times.
- */
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
-# define ALL_GENERAL_REGS64  ALL_GENERAL_REGS
 #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
-#define ALL_QLDST_REGS64     (ALL_GENERAL_REGS64 & ~SOFTMMU_RESERVE_REGS)
 
 /* Define some temporary registers.  T2 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
@@ -1738,107 +1727,91 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
     case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
     case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
     case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
     case INDEX_op_ld_i32:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld_i64:
     case INDEX_op_neg_i32:
+    case INDEX_op_neg_i64:
     case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
+    case INDEX_op_extrh_i64_i32:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
     case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
     case INDEX_op_st_i32:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
+    case INDEX_op_add_i64:
     case INDEX_op_mul_i32:
+    case INDEX_op_mul_i64:
     case INDEX_op_div_i32:
+    case INDEX_op_div_i64:
     case INDEX_op_divu_i32:
+    case INDEX_op_divu_i64:
     case INDEX_op_sub_i32:
+    case INDEX_op_sub_i64:
     case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
     case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
     case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
     case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
     case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
     case INDEX_op_shl_i32:
+    case INDEX_op_shl_i64:
     case INDEX_op_shr_i32:
+    case INDEX_op_shr_i64:
     case INDEX_op_sar_i32:
+    case INDEX_op_sar_i64:
     case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
         return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rJ);
     case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
         return C_O1_I4(r, rZ, rJ, rI, 0);
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
     case INDEX_op_mulu2_i32:
     case INDEX_op_muls2_i32:
         return C_O2_I2(r, r, rZ, rJ);
-
-    case INDEX_op_ld8u_i64:
-    case INDEX_op_ld8s_i64:
-    case INDEX_op_ld16u_i64:
-    case INDEX_op_ld16s_i64:
-    case INDEX_op_ld32u_i64:
-    case INDEX_op_ld32s_i64:
-    case INDEX_op_ld_i64:
-    case INDEX_op_ext_i32_i64:
-    case INDEX_op_extu_i32_i64:
-        return C_O1_I1(R, r);
-
-    case INDEX_op_st8_i64:
-    case INDEX_op_st16_i64:
-    case INDEX_op_st32_i64:
-    case INDEX_op_st_i64:
-        return C_O0_I2(RZ, r);
-
-    case INDEX_op_add_i64:
-    case INDEX_op_mul_i64:
-    case INDEX_op_div_i64:
-    case INDEX_op_divu_i64:
-    case INDEX_op_sub_i64:
-    case INDEX_op_and_i64:
-    case INDEX_op_andc_i64:
-    case INDEX_op_or_i64:
-    case INDEX_op_orc_i64:
-    case INDEX_op_xor_i64:
-    case INDEX_op_shl_i64:
-    case INDEX_op_shr_i64:
-    case INDEX_op_sar_i64:
-    case INDEX_op_setcond_i64:
-        return C_O1_I2(R, RZ, RJ);
-
-    case INDEX_op_neg_i64:
-    case INDEX_op_not_i64:
-    case INDEX_op_ext32s_i64:
-    case INDEX_op_ext32u_i64:
-        return C_O1_I1(R, R);
-
-    case INDEX_op_extrl_i64_i32:
-    case INDEX_op_extrh_i64_i32:
-        return C_O1_I1(r, R);
-
-    case INDEX_op_brcond_i64:
-        return C_O0_I2(RZ, RJ);
-    case INDEX_op_movcond_i64:
-        return C_O1_I4(R, RZ, RJ, RI, 0);
-    case INDEX_op_add2_i64:
-    case INDEX_op_sub2_i64:
-        return C_O2_I4(R, R, RZ, RZ, RJ, RI);
     case INDEX_op_muluh_i64:
-        return C_O1_I2(R, R, R);
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_qemu_ld_i32:
-        return C_O1_I1(r, A);
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(R, A);
+        return C_O1_I1(r, s);
     case INDEX_op_qemu_st_i32:
-        return C_O0_I2(sZ, A);
     case INDEX_op_qemu_st_i64:
-        return C_O0_I2(SZ, A);
+        return C_O0_I2(sZ, s);
 
     default:
         g_assert_not_reached();
@@ -1859,7 +1832,7 @@ static void tcg_target_init(TCGContext *s)
 #endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
-    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS64;
+    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
 
     tcg_target_call_clobber_regs = 0;
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_G1);
-- 
2.34.1


