Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F72F8793
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:23:12 +0100 (CET)
Received: from localhost ([::1]:58068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WYp-0005m4-Fy
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHn-0004KD-VW
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:36 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHi-0004K8-Nc
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:35 -0500
Received: by mail-pj1-x1033.google.com with SMTP id ce17so3603967pjb.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jf9IEdwgXYvU/sTQ6HXqWMs+KLVcXEsCjpT7iGLgK9k=;
 b=XH7f+QeSYKSgg0S+07L6zYxZx5b4TThQZ/x+BlCfmLMu64iWJrn+10zj0PPPf7//ZE
 bisF0P9Ub5Ylz555vwaCFKSKsmM8bGZOsp8X3hMOR+uuRsLQFjzJF0OS5Q1vqeF+Purk
 FXVYf33infacEv1YMRpcxxfhieFSim/bDeDIpMeresouXwYi1wn4eCqErsMsf4h+oz1y
 UDqSobF/J1qS0YtxShplXWb49kedq3paRE+R+frT70xMyKNJtjP8JZxkG2FiQ0xKPO7N
 vkhF6NQlFQMNyaPrGqMo+7/CDDGU+etgmo693Z3lrbpeESiYKbHErB5DBvYedekAUq+V
 AIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jf9IEdwgXYvU/sTQ6HXqWMs+KLVcXEsCjpT7iGLgK9k=;
 b=LswQNMZEqX32VEh4ozHpCxe1ZGxwAHD5oEmoVnt3RZSv7pKCKlzm/lxw+JVKdZ6uZX
 pErGO0oFPMErKkJINnSEYpy1u8ZJAPvktztSUX4r3r6/LT14EeFtHjCBwSIWvVQIGETw
 BawlhAeJ+BUhEeS0FkhgtuiM4XwBgIdbSkzellLtdFMSFIf+9OrRQ515TFUb+OIpvFu9
 QxvMt50tI8GiDyMBRvEFGD8/vYOIYtyU28Tjt7D3256qpY+KJylCZel/v/VlaCuinPcT
 CWzOisOAtbmQxNnsHayTdac53yu+x/dJDVqRiLAAIGciCAUP31ND1/Au2p6MZp01sf41
 Cdbw==
X-Gm-Message-State: AOAM532ftJXBAk/RxAEodvF5C90AorIZ2Fc6HZbfFPlM+0lnaaMGNJMi
 gagZrMQDcusFgWoktc7SIAuPDRvFGWHPgIvE
X-Google-Smtp-Source: ABdhPJzZ2V7gjc2IDsUqzNed7WNh4hFDbLedR7rPoPx2EN7gvCuspzoZ13gzar7saBUhFHdvyzV2NA==
X-Received: by 2002:a17:90a:74ca:: with SMTP id
 p10mr12792126pjl.34.1610744729419; 
 Fri, 15 Jan 2021 13:05:29 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/22] tcg/tci: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 15 Jan 2021 11:04:55 -1000
Message-Id: <20210115210456.1053477-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires finishing the conversion to tcg_target_op_def.
Remove quite a lot of ifdefs, since we can reference opcodes
even if they are not implemented.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |  25 +++
 tcg/tci/tcg-target.h         |   2 +
 tcg/tci/tcg-target.c.inc     | 343 +++++++++++++----------------------
 3 files changed, 152 insertions(+), 218 deletions(-)
 create mode 100644 tcg/tci/tcg-target-con-set.h

diff --git a/tcg/tci/tcg-target-con-set.h b/tcg/tci/tcg-target-con-set.h
new file mode 100644
index 0000000000..38e82f7535
--- /dev/null
+++ b/tcg/tci/tcg-target-con-set.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * TCI target-specific constraint sets.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I2(r, r)
+C_O0_I2(r, ri)
+C_O0_I3(r, r, r)
+C_O0_I4(r, r, ri, ri)
+C_O0_I4(r, r, r, r)
+C_O1_I1(r, r)
+C_O1_I2(r, 0, r)
+C_O1_I2(r, ri, ri)
+C_O1_I2(r, r, r)
+C_O1_I2(r, r, ri)
+C_O1_I4(r, r, r, ri, ri)
+C_O2_I1(r, r, r)
+C_O2_I2(r, r, r, r)
+C_O2_I4(r, r, r, r, r, r)
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index bb784e018e..1efd8c4fb0 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -207,4 +207,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
     /* no need to flush icache explicitly */
 }
 
+#define TCG_TARGET_CON_SET_H
+
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c913d85c37..62bedaca28 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -37,236 +37,143 @@
 /* Bitfield n...m (in 32 bit value). */
 #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
 
-/* Macros used in tcg_target_op_defs. */
-#define R       "r"
-#define RI      "ri"
-#if TCG_TARGET_REG_BITS == 32
-# define R64    "r", "r"
-#else
-# define R64    "r"
-#endif
-#if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-# define L      "r", "r"
-# define S      "r", "r"
-#else
-# define L      "r"
-# define S      "r"
-#endif
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
+{
+    switch (op) {
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld_i32:
+    case INDEX_op_ld8u_i64:
+    case INDEX_op_ld8s_i64:
+    case INDEX_op_ld16u_i64:
+    case INDEX_op_ld16s_i64:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+    case INDEX_op_neg_i32:
+    case INDEX_op_neg_i64:
+    case INDEX_op_ext8s_i32:
+    case INDEX_op_ext8s_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
+    case INDEX_op_bswap16_i32:
+    case INDEX_op_bswap16_i64:
+    case INDEX_op_bswap32_i32:
+    case INDEX_op_bswap32_i64:
+    case INDEX_op_bswap64_i64:
+        return C_O1_I1(r, r);
 
-/* TODO: documentation. */
-static const TCGTargetOpDef tcg_target_op_defs[] = {
-    { INDEX_op_exit_tb, { NULL } },
-    { INDEX_op_goto_tb, { NULL } },
-    { INDEX_op_br, { NULL } },
+    case INDEX_op_st8_i32:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st_i32:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i64:
+        return C_O0_I2(r, r);
 
-    { INDEX_op_ld8u_i32, { R, R } },
-    { INDEX_op_ld8s_i32, { R, R } },
-    { INDEX_op_ld16u_i32, { R, R } },
-    { INDEX_op_ld16s_i32, { R, R } },
-    { INDEX_op_ld_i32, { R, R } },
-    { INDEX_op_st8_i32, { R, R } },
-    { INDEX_op_st16_i32, { R, R } },
-    { INDEX_op_st_i32, { R, R } },
+    case INDEX_op_div_i32:
+    case INDEX_op_div_i64:
+    case INDEX_op_divu_i32:
+    case INDEX_op_divu_i64:
+    case INDEX_op_rem_i32:
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i32:
+    case INDEX_op_remu_i64:
+        return C_O1_I2(r, r, r);
 
-    { INDEX_op_add_i32, { R, RI, RI } },
-    { INDEX_op_sub_i32, { R, RI, RI } },
-    { INDEX_op_mul_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_div_i32
-    { INDEX_op_div_i32, { R, R, R } },
-    { INDEX_op_divu_i32, { R, R, R } },
-    { INDEX_op_rem_i32, { R, R, R } },
-    { INDEX_op_remu_i32, { R, R, R } },
-#elif TCG_TARGET_HAS_div2_i32
-    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
-    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
-#endif
-    /* TODO: Does R, RI, RI result in faster code than R, R, RI?
-       If both operands are constants, we can optimize. */
-    { INDEX_op_and_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_andc_i32
-    { INDEX_op_andc_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_eqv_i32
-    { INDEX_op_eqv_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nand_i32
-    { INDEX_op_nand_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nor_i32
-    { INDEX_op_nor_i32, { R, RI, RI } },
-#endif
-    { INDEX_op_or_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_orc_i32
-    { INDEX_op_orc_i32, { R, RI, RI } },
-#endif
-    { INDEX_op_xor_i32, { R, RI, RI } },
-    { INDEX_op_shl_i32, { R, RI, RI } },
-    { INDEX_op_shr_i32, { R, RI, RI } },
-    { INDEX_op_sar_i32, { R, RI, RI } },
-#if TCG_TARGET_HAS_rot_i32
-    { INDEX_op_rotl_i32, { R, RI, RI } },
-    { INDEX_op_rotr_i32, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_deposit_i32
-    { INDEX_op_deposit_i32, { R, "0", R } },
-#endif
+    case INDEX_op_add_i32:
+    case INDEX_op_add_i64:
+    case INDEX_op_sub_i32:
+    case INDEX_op_sub_i64:
+    case INDEX_op_mul_i32:
+    case INDEX_op_mul_i64:
+    case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+    case INDEX_op_eqv_i32:
+    case INDEX_op_eqv_i64:
+    case INDEX_op_nand_i32:
+    case INDEX_op_nand_i64:
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+    case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+    case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
+    case INDEX_op_shl_i32:
+    case INDEX_op_shl_i64:
+    case INDEX_op_shr_i32:
+    case INDEX_op_shr_i64:
+    case INDEX_op_sar_i32:
+    case INDEX_op_sar_i64:
+    case INDEX_op_rotl_i32:
+    case INDEX_op_rotl_i64:
+    case INDEX_op_rotr_i32:
+    case INDEX_op_rotr_i64:
+        /* TODO: Does R, RI, RI result in faster code than R, R, RI? */
+        return C_O1_I2(r, ri, ri);
 
-    { INDEX_op_brcond_i32, { R, RI } },
+    case INDEX_op_deposit_i32:
+    case INDEX_op_deposit_i64:
+        return C_O1_I2(r, 0, r);
 
-    { INDEX_op_setcond_i32, { R, R, RI } },
-#if TCG_TARGET_REG_BITS == 64
-    { INDEX_op_setcond_i64, { R, R, RI } },
-#endif /* TCG_TARGET_REG_BITS == 64 */
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        return C_O0_I2(r, ri);
+
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, ri);
 
 #if TCG_TARGET_REG_BITS == 32
     /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
-    { INDEX_op_add2_i32, { R, R, R, R, R, R } },
-    { INDEX_op_sub2_i32, { R, R, R, R, R, R } },
-    { INDEX_op_brcond2_i32, { R, R, RI, RI } },
-    { INDEX_op_mulu2_i32, { R, R, R, R } },
-    { INDEX_op_setcond2_i32, { R, R, R, RI, RI } },
+    case INDEX_op_add2_i32:
+    case INDEX_op_sub2_i32:
+        return C_O2_I4(r, r, r, r, r, r);
+    case INDEX_op_brcond2_i32:
+        return C_O0_I4(r, r, ri, ri);
+    case INDEX_op_mulu2_i32:
+        return C_O2_I2(r, r, r, r);
+    case INDEX_op_setcond2_i32
+        return C_O1_I4(r, r, r, ri, ri);
 #endif
 
-#if TCG_TARGET_HAS_not_i32
-    { INDEX_op_not_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_neg_i32
-    { INDEX_op_neg_i32, { R, R } },
-#endif
+    case INDEX_op_qemu_ld_i32:
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O1_I1(r, r)
+                : C_O1_I2(r, r, r));
+    case INDEX_op_qemu_ld_i64:
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
+    case INDEX_op_qemu_st_i32:
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O0_I2(r, r)
+                : C_O0_I3(r, r, r));
+    case INDEX_op_qemu_st_i64:
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
+                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(r, r, r)
+                : C_O0_I4(r, r, r, r));
 
-#if TCG_TARGET_REG_BITS == 64
-    { INDEX_op_ld8u_i64, { R, R } },
-    { INDEX_op_ld8s_i64, { R, R } },
-    { INDEX_op_ld16u_i64, { R, R } },
-    { INDEX_op_ld16s_i64, { R, R } },
-    { INDEX_op_ld32u_i64, { R, R } },
-    { INDEX_op_ld32s_i64, { R, R } },
-    { INDEX_op_ld_i64, { R, R } },
-
-    { INDEX_op_st8_i64, { R, R } },
-    { INDEX_op_st16_i64, { R, R } },
-    { INDEX_op_st32_i64, { R, R } },
-    { INDEX_op_st_i64, { R, R } },
-
-    { INDEX_op_add_i64, { R, RI, RI } },
-    { INDEX_op_sub_i64, { R, RI, RI } },
-    { INDEX_op_mul_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_div_i64
-    { INDEX_op_div_i64, { R, R, R } },
-    { INDEX_op_divu_i64, { R, R, R } },
-    { INDEX_op_rem_i64, { R, R, R } },
-    { INDEX_op_remu_i64, { R, R, R } },
-#elif TCG_TARGET_HAS_div2_i64
-    { INDEX_op_div2_i64, { R, R, "0", "1", R } },
-    { INDEX_op_divu2_i64, { R, R, "0", "1", R } },
-#endif
-    { INDEX_op_and_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_andc_i64
-    { INDEX_op_andc_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_eqv_i64
-    { INDEX_op_eqv_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nand_i64
-    { INDEX_op_nand_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_nor_i64
-    { INDEX_op_nor_i64, { R, RI, RI } },
-#endif
-    { INDEX_op_or_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_orc_i64
-    { INDEX_op_orc_i64, { R, RI, RI } },
-#endif
-    { INDEX_op_xor_i64, { R, RI, RI } },
-    { INDEX_op_shl_i64, { R, RI, RI } },
-    { INDEX_op_shr_i64, { R, RI, RI } },
-    { INDEX_op_sar_i64, { R, RI, RI } },
-#if TCG_TARGET_HAS_rot_i64
-    { INDEX_op_rotl_i64, { R, RI, RI } },
-    { INDEX_op_rotr_i64, { R, RI, RI } },
-#endif
-#if TCG_TARGET_HAS_deposit_i64
-    { INDEX_op_deposit_i64, { R, "0", R } },
-#endif
-    { INDEX_op_brcond_i64, { R, RI } },
-
-#if TCG_TARGET_HAS_ext8s_i64
-    { INDEX_op_ext8s_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16s_i64
-    { INDEX_op_ext16s_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext32s_i64
-    { INDEX_op_ext32s_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext8u_i64
-    { INDEX_op_ext8u_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16u_i64
-    { INDEX_op_ext16u_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext32u_i64
-    { INDEX_op_ext32u_i64, { R, R } },
-#endif
-    { INDEX_op_ext_i32_i64, { R, R } },
-    { INDEX_op_extu_i32_i64, { R, R } },
-#if TCG_TARGET_HAS_bswap16_i64
-    { INDEX_op_bswap16_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_bswap32_i64
-    { INDEX_op_bswap32_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_bswap64_i64
-    { INDEX_op_bswap64_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_not_i64
-    { INDEX_op_not_i64, { R, R } },
-#endif
-#if TCG_TARGET_HAS_neg_i64
-    { INDEX_op_neg_i64, { R, R } },
-#endif
-#endif /* TCG_TARGET_REG_BITS == 64 */
-
-    { INDEX_op_qemu_ld_i32, { R, L } },
-    { INDEX_op_qemu_ld_i64, { R64, L } },
-
-    { INDEX_op_qemu_st_i32, { R, S } },
-    { INDEX_op_qemu_st_i64, { R64, S } },
-
-#if TCG_TARGET_HAS_ext8s_i32
-    { INDEX_op_ext8s_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16s_i32
-    { INDEX_op_ext16s_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext8u_i32
-    { INDEX_op_ext8u_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_ext16u_i32
-    { INDEX_op_ext16u_i32, { R, R } },
-#endif
-
-#if TCG_TARGET_HAS_bswap16_i32
-    { INDEX_op_bswap16_i32, { R, R } },
-#endif
-#if TCG_TARGET_HAS_bswap32_i32
-    { INDEX_op_bswap32_i32, { R, R } },
-#endif
-
-    { INDEX_op_mb, { } },
-    { -1 },
-};
-
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
-{
-    int i, n = ARRAY_SIZE(tcg_target_op_defs);
-
-    for (i = 0; i < n; ++i) {
-        if (tcg_target_op_defs[i].op == op) {
-            return &tcg_target_op_defs[i];
-        }
+    default:
+        g_assert_not_reached();
     }
-    return NULL;
 }
 
 static const int tcg_target_reg_alloc_order[] = {
-- 
2.25.1


