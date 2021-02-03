Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E430D19E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:36:10 +0100 (CET)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l781a-0006Ha-2R
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77ia-0008BV-7u
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:32 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iY-00017A-4D
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:31 -0500
Received: by mail-pf1-x42a.google.com with SMTP id i63so15645453pfg.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q4KRk3c5q/Se8VNyVTrv0z3M/+pUdszuLMRWD0JR/hw=;
 b=w4CLpKrizKwyF1nwkFr8ufdNANDesKQCjnHsaVSZ0iTB7bLqf2eIXBjyUT8fK3FjKY
 LSaeEmT2Sxk9gPoFF8l58uuk7HahVdtQB1TKvgi5Ei4TXy9ijrrhV5jOtaYf+ceuGOlp
 faVHYUDCBjYJcKQct7ENJKvZPTl7t8KF9hKj+POfhmKra0UbB3gvUN7iPjZn7OsXstby
 RG0rfXez4vbaQLnCCNOb6G3T4s+n5c5EjKnyg7jBHGX0mYw81lesGtgZiPZ3d0bT1Ocz
 Dhb8PIvqoM7Qn6oUg3RT6VuMIC/5fbIT5+GVZnzG7WIZ/OnTWGervcM8KJNXI4YBAmDd
 6KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q4KRk3c5q/Se8VNyVTrv0z3M/+pUdszuLMRWD0JR/hw=;
 b=Z8Z1HrcfK7+MkRIR/nlazUK7IP3GACw0HmhTthJU4fYq7pHx3ywG2KWeTmgPd7IPLc
 bj2my4S1c3w1dqMmzNjND0Ca/0qUtvFMgZDNXQqUUHcxrlg2HUh0HaPjEY8nDcFSNoNi
 gU0NPSUzJ6vZGLyRJWSLEO0w7tBRjfyIKcktSLAtSZk5CA8l1a91OaHutSU+5JR99meI
 SH86XUCcdGZ35MEIi9gIF0nCEG6Lx/ZGGvowEWLlh4eUHxXRO/W3tgOe9bUl6NUinKK2
 rfD8ADi8XIIeH8Hu9wfbay5jPQa05kHk7V6QvGUuw5fWyykmdowZgwMyOehbRAIo44zg
 eCMg==
X-Gm-Message-State: AOAM530Co+JqQK3G1YZQUUSdrej7iMu3hCI1ezpn9dvh1Hmw/QfOLI4P
 h8msWSuUNo24yD8eV3GFRuC0JSd2qmNePkfk
X-Google-Smtp-Source: ABdhPJzs6/O1XGVgVlaBEBK/rvn9IR1sejqLaiogEaG6pm8kEmiYj4Tu6mNPg2dE0DTkHdXWHF+0nA==
X-Received: by 2002:a62:1658:0:b029:1cf:3b18:8169 with SMTP id
 85-20020a6216580000b02901cf3b188169mr986986pfw.70.1612318588675; 
 Tue, 02 Feb 2021 18:16:28 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/24] tcg/tci: Split out constraint sets to
 tcg-target-con-set.h
Date: Tue,  2 Feb 2021 16:15:49 -1000
Message-Id: <20210203021550.375058-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires finishing the conversion to tcg_target_op_def.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |  25 ++++
 tcg/tci/tcg-target.h         |   2 +
 tcg/tci/tcg-target.c.inc     | 279 +++++++++++++++++------------------
 3 files changed, 161 insertions(+), 145 deletions(-)
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
index 493bbf1e39..f0f6b13112 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -37,154 +37,143 @@
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
-
-/* TODO: documentation. */
-static const TCGTargetOpDef tcg_target_op_defs[] = {
-    { INDEX_op_exit_tb, { NULL } },
-    { INDEX_op_goto_tb, { NULL } },
-    { INDEX_op_br, { NULL } },
-
-    { INDEX_op_ld8u_i32, { R, R } },
-    { INDEX_op_ld8s_i32, { R, R } },
-    { INDEX_op_ld16u_i32, { R, R } },
-    { INDEX_op_ld16s_i32, { R, R } },
-    { INDEX_op_ld_i32, { R, R } },
-    { INDEX_op_st8_i32, { R, R } },
-    { INDEX_op_st16_i32, { R, R } },
-    { INDEX_op_st_i32, { R, R } },
-
-    { INDEX_op_add_i32, { R, RI, RI } },
-    { INDEX_op_sub_i32, { R, RI, RI } },
-    { INDEX_op_mul_i32, { R, RI, RI } },
-    { INDEX_op_div_i32, { R, R, R } },
-    { INDEX_op_divu_i32, { R, R, R } },
-    { INDEX_op_rem_i32, { R, R, R } },
-    { INDEX_op_remu_i32, { R, R, R } },
-    /* TODO: Does R, RI, RI result in faster code than R, R, RI?
-       If both operands are constants, we can optimize. */
-    { INDEX_op_and_i32, { R, RI, RI } },
-    { INDEX_op_andc_i32, { R, RI, RI } },
-    { INDEX_op_eqv_i32, { R, RI, RI } },
-    { INDEX_op_nand_i32, { R, RI, RI } },
-    { INDEX_op_nor_i32, { R, RI, RI } },
-    { INDEX_op_or_i32, { R, RI, RI } },
-    { INDEX_op_orc_i32, { R, RI, RI } },
-    { INDEX_op_xor_i32, { R, RI, RI } },
-    { INDEX_op_shl_i32, { R, RI, RI } },
-    { INDEX_op_shr_i32, { R, RI, RI } },
-    { INDEX_op_sar_i32, { R, RI, RI } },
-    { INDEX_op_rotl_i32, { R, RI, RI } },
-    { INDEX_op_rotr_i32, { R, RI, RI } },
-    { INDEX_op_deposit_i32, { R, "0", R } },
-
-    { INDEX_op_brcond_i32, { R, RI } },
-
-    { INDEX_op_setcond_i32, { R, R, RI } },
-    { INDEX_op_setcond_i64, { R, R, RI } },
-
-    /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
-    { INDEX_op_add2_i32, { R, R, R, R, R, R } },
-    { INDEX_op_sub2_i32, { R, R, R, R, R, R } },
-    { INDEX_op_brcond2_i32, { R, R, RI, RI } },
-    { INDEX_op_mulu2_i32, { R, R, R, R } },
-    { INDEX_op_setcond2_i32, { R, R, R, RI, RI } },
-
-    { INDEX_op_not_i32, { R, R } },
-    { INDEX_op_neg_i32, { R, R } },
-
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
-    { INDEX_op_div_i64, { R, R, R } },
-    { INDEX_op_divu_i64, { R, R, R } },
-    { INDEX_op_rem_i64, { R, R, R } },
-    { INDEX_op_remu_i64, { R, R, R } },
-    { INDEX_op_and_i64, { R, RI, RI } },
-    { INDEX_op_andc_i64, { R, RI, RI } },
-    { INDEX_op_eqv_i64, { R, RI, RI } },
-    { INDEX_op_nand_i64, { R, RI, RI } },
-    { INDEX_op_nor_i64, { R, RI, RI } },
-    { INDEX_op_or_i64, { R, RI, RI } },
-    { INDEX_op_orc_i64, { R, RI, RI } },
-    { INDEX_op_xor_i64, { R, RI, RI } },
-    { INDEX_op_shl_i64, { R, RI, RI } },
-    { INDEX_op_shr_i64, { R, RI, RI } },
-    { INDEX_op_sar_i64, { R, RI, RI } },
-    { INDEX_op_rotl_i64, { R, RI, RI } },
-    { INDEX_op_rotr_i64, { R, RI, RI } },
-    { INDEX_op_deposit_i64, { R, "0", R } },
-    { INDEX_op_brcond_i64, { R, RI } },
-
-    { INDEX_op_ext8s_i64, { R, R } },
-    { INDEX_op_ext16s_i64, { R, R } },
-    { INDEX_op_ext32s_i64, { R, R } },
-    { INDEX_op_ext8u_i64, { R, R } },
-    { INDEX_op_ext16u_i64, { R, R } },
-    { INDEX_op_ext32u_i64, { R, R } },
-    { INDEX_op_ext_i32_i64, { R, R } },
-    { INDEX_op_extu_i32_i64, { R, R } },
-    { INDEX_op_bswap16_i64, { R, R } },
-    { INDEX_op_bswap32_i64, { R, R } },
-    { INDEX_op_bswap64_i64, { R, R } },
-    { INDEX_op_not_i64, { R, R } },
-    { INDEX_op_neg_i64, { R, R } },
-
-    { INDEX_op_qemu_ld_i32, { R, L } },
-    { INDEX_op_qemu_ld_i64, { R64, L } },
-
-    { INDEX_op_qemu_st_i32, { R, S } },
-    { INDEX_op_qemu_st_i64, { R64, S } },
-
-    { INDEX_op_ext8s_i32, { R, R } },
-    { INDEX_op_ext16s_i32, { R, R } },
-    { INDEX_op_ext8u_i32, { R, R } },
-    { INDEX_op_ext16u_i32, { R, R } },
-
-    { INDEX_op_bswap16_i32, { R, R } },
-    { INDEX_op_bswap32_i32, { R, R } },
-
-    { INDEX_op_mb, { } },
-    { -1 },
-};
-
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    int i, n = ARRAY_SIZE(tcg_target_op_defs);
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
 
-    for (i = 0; i < n; ++i) {
-        if (tcg_target_op_defs[i].op == op) {
-            return &tcg_target_op_defs[i];
-        }
+    case INDEX_op_st8_i32:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st_i32:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i64:
+        return C_O0_I2(r, r);
+
+    case INDEX_op_div_i32:
+    case INDEX_op_div_i64:
+    case INDEX_op_divu_i32:
+    case INDEX_op_divu_i64:
+    case INDEX_op_rem_i32:
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i32:
+    case INDEX_op_remu_i64:
+        return C_O1_I2(r, r, r);
+
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
+
+    case INDEX_op_deposit_i32:
+    case INDEX_op_deposit_i64:
+        return C_O1_I2(r, 0, r);
+
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        return C_O0_I2(r, ri);
+
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, ri);
+
+#if TCG_TARGET_REG_BITS == 32
+    /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
+    case INDEX_op_add2_i32:
+    case INDEX_op_sub2_i32:
+        return C_O2_I4(r, r, r, r, r, r);
+    case INDEX_op_brcond2_i32:
+        return C_O0_I4(r, r, ri, ri);
+    case INDEX_op_mulu2_i32:
+        return C_O2_I2(r, r, r, r);
+    case INDEX_op_setcond2_i32:
+        return C_O1_I4(r, r, r, ri, ri);
+#endif
+
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
+
+    default:
+        g_assert_not_reached();
     }
-    return NULL;
 }
 
 static const int tcg_target_reg_alloc_order[] = {
-- 
2.25.1


