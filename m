Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368EF308E5E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:26:27 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aLa-0007nt-91
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6q-0007Ai-SN
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:12 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6o-0008Ed-I7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:12 -0500
Received: by mail-pf1-x42a.google.com with SMTP id j12so6904538pfj.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hhzjN25rBK3kyXshPz5EHgei+RmOJn1cjNGuP7J/ZVU=;
 b=cnNpAD3clItwBRrIrG/1MdsWCZqNeY2xrwR+DAvDMZMszHEAXKXma3wvACPDkBBP1n
 ClnEuZysOXPiuyZv/xfmMYdXrcTHmP34TvSuNe+V2cdLuplUMaEIzevP6CQ+vtrHnvPn
 YTcaBjunvU4IZAhDzy1k/kKDfmntQMcq1AYHnu6fg2uGD//IfDTF1YdW6tF0wepmNeSS
 broYWFuSwE2VxrSHtRhDZpotc3C828tqrITMlVUw59PsrIepLGDSmW7hJB3hoU2J3vOS
 M+ZbhEnWLrRTHuWPyOg7y0njv9Zq8GJrKxllr4m1O+DwgEV8/aXitIBfKlHxgkuFaaxd
 FRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhzjN25rBK3kyXshPz5EHgei+RmOJn1cjNGuP7J/ZVU=;
 b=bRDCGinAzP5ydH9iHy1WEb4SCuB5TdD4HJMTELswVDnh7V0Lq/oGDZYwnxjjkGL/Gc
 02go2tTiEpdNLzK5Drzlf1x9I8kSNZ/nIcVxH1gFI918WJ/zasOTRQ2Z8wzRB7iXqhjs
 jBjLUKWnEJCsXd/44QSLHdYhjXZPrEcDDQhi9wvDK9SsBC2YxbbW2hhODGYgmVM7qYx0
 8/cEpezX82JmL4mF5pc4dyAW+662tQYslgwhmFI3YIQ+CgpXJiBfgiuVwthlzPCetAz/
 34IUWuNS29Hr2+zpG6760JV7YjB8Ic4Tru6vgqn9tBQCa04k7RyEGsy03j+h4a5ogQfk
 04bA==
X-Gm-Message-State: AOAM533XbtRT/K9wD7cxYf0+T4Ywurt+x7OjfLKxJvbnWqLI5juBP20K
 lwYmEpG4gDMzrNW1Z1qaRcALCe1x20hVCLMV
X-Google-Smtp-Source: ABdhPJw/v24o10PR0Jw5/681TKDVr7jIwloX8Tyg9TPKnFQdzg4KrciXyRlaysclm/ZUaxcs/nlyMw==
X-Received: by 2002:a62:5344:0:b029:1c7:eeea:8bad with SMTP id
 h65-20020a6253440000b02901c7eeea8badmr5857071pfb.1.1611951069112; 
 Fri, 29 Jan 2021 12:11:09 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.11.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:11:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/24] tcg/tci: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 29 Jan 2021 10:10:27 -1000
Message-Id: <20210129201028.787853-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires finishing the conversion to tcg_target_op_def.

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
index 493bbf1e39..62bedaca28 100644
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
+    case INDEX_op_setcond2_i32
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


