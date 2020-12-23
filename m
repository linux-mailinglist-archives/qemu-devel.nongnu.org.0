Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DA2E18CD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:15:06 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxQP-00042z-UC
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEQ-0008Up-VG
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:42 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEI-0000RO-Sj
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:42 -0500
Received: by mail-pf1-x42d.google.com with SMTP id h186so9795952pfe.0
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LM+ixEH8S5xhbIyjTdMFVRGEOmMUxSrxvI2DWExWedA=;
 b=hzl6wnpeD1h72Bx5n0AVg00ZMZoSY/hiK6KnZGC9AMUk1v66ckEOnxY9lVWgPT4lJT
 2ViqDKRZNsL0RdWQ5xRZpYnjemKqchP84zuMaYRn56EaP43VPz1cHxpJ6Tu6p5gS5mzN
 ysIR5l5AKC4pEljeipPnqxxwzzNdaVFoChy//HS/hDQfrBTNW+y75VqO5IVXrS+ycs5U
 csmP5yuK+d+X1q6QinO/A3EjvujIZCyoXAKWgphiksGx24cDiI8LOTetZs2QxdjPM5Ed
 bGCNd3sQDJZ/+SeV1JFmmn708IoJMszS74wWiTdXnwRwMZjng9JsMLCBebLhTIvFSq9Z
 4ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LM+ixEH8S5xhbIyjTdMFVRGEOmMUxSrxvI2DWExWedA=;
 b=IggJHKfpwptbaZjGvYRonkua/a9y9ECOjxHxqasjE8Wm0Wms8aEpi2H3fNjlbJKO+J
 IU6CTFq/lbGH9+5zn3cuDBv9hXL5BVR7KToTymx8Ukoj4vR/3mdSnpUACtSotKwdTNR8
 dOWoK5XUEQLX5PEsO58yKPE1FeDVi94e+NfgNgqtlf7V2CHKacPzArOnArqfS3benQry
 k9hQNyJa1/rdATKgT9+xiYH9JZkwjpreoohq00XaDA13herGBYeSkgtr5dI9obPj4Bn9
 opSe/wTA8Rc6s0XZlBnS/1j0oOZ699CkWOipPCb/KS/CpzV3Z5IzmCpKocaefWZH8eqi
 bqxg==
X-Gm-Message-State: AOAM53369zgdZbospkgZQ41+EDnNiZ1ZvTk6hcM12x7aKYvUlxA/vB42
 O9phD9xuEKyZ4YCh1LZx5SQ94lbTYI/iFA==
X-Google-Smtp-Source: ABdhPJyFxTmqKMU7/wCeI0+hNBB+3nEbhMBSIA7oS0JkBglQZ6HrrR9RUp+HgOlY1ss1VCe/Pc+Bow==
X-Received: by 2002:a62:8f0e:0:b029:1aa:1268:fa4e with SMTP id
 n14-20020a628f0e0000b02901aa1268fa4emr22738274pfd.18.1608703351723; 
 Tue, 22 Dec 2020 22:02:31 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/22] tcg/tci: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:02:03 -0800
Message-Id: <20201223060204.576856-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

This does require finishing the conversion to tcg_target_op_def.
Remove quite a lot of ifdefs, since we can reference opcodes
even if they are not implemented.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-conset.h |  20 +++
 tcg/tci/tcg-target.h        |   2 +
 tcg/tci/tcg-target.c.inc    | 343 +++++++++++++-----------------------
 3 files changed, 147 insertions(+), 218 deletions(-)
 create mode 100644 tcg/tci/tcg-target-conset.h

diff --git a/tcg/tci/tcg-target-conset.h b/tcg/tci/tcg-target-conset.h
new file mode 100644
index 0000000000..efcefab37e
--- /dev/null
+++ b/tcg/tci/tcg-target-conset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * TCI target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
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
index 8c1c1d265d..42b84a0e87 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -210,4 +210,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
     /* no need to flush icache explicitly */
 }
 
+#define TCG_TARGET_CONSET_H
+
 #endif /* TCG_TARGET_H */
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 9ac6da2e21..f9fb6cb399 100644
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
+static int tcg_target_op_def(TCGOpcode op)
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


