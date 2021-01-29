Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902E8308E60
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:27:59 +0100 (CET)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aN4-0001xL-As
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6f-0006k9-MX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:01 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6d-00088z-EV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:01 -0500
Received: by mail-pg1-x52a.google.com with SMTP id c132so7418218pga.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yh6CQ/u4FMynTm6CwOd3gnQrNiWMWBdGGe7JpvXoYoM=;
 b=IDbPMbxrJ1+61Zx3OxX4ESDBqHWgOmeFTHEyg0LhJ14iI0cjfJ/LRKI9DjjWh+JUhc
 vIu810jwJrdm/uh67Mj1HZGfZWnCWfoTP7vEYaP+oXcbqgD7KEZeRfushdyFuzs3ZoWR
 fDse/4PTNR91hoY6m46POTkflg12REcDN1qq01y+1Vz5SUyOXoGjmgZGskpf7bUEfrJ4
 aqS+7pwa7dLZ3X+MBhVKP9oSlq/HV0UUXpF3thxL1FlA4ZBB6xucr2G40I/mEwzcg1T0
 3BNpXobf9IdERLgWR40fN7Oqtz2EHZVFL2Hrm8AqietgGnuhMSGmBL5mnUs62LmY0B5h
 sLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yh6CQ/u4FMynTm6CwOd3gnQrNiWMWBdGGe7JpvXoYoM=;
 b=T4soCcczGiXfRCR6wefL+zI/vu4dCdWRgYFZpDUIQwodIqAQLV6NE9o87/ZOPF9lrL
 NfLf3zpTnFb9uqUj/turK5OFKv6azLEXLj5bxhk6kE/cv9L9mdQbHDULeZjkL5zOZ0wt
 jHAIsLJtHvk0kUe+hlikMLhhsb8i47a1OPHwn8jMfyODsDarfTvfgHWY3/mjwm2+uqHj
 m8RSDzzZdKH4Ae0QavEDVFwpxgOrGM4PcqC8X70FVyL3nEFl7sYN7E41AanB02Fw9bdw
 HZ625h7SEZKTnuYFJk+AALV9ZkYPG7MZZZNvN8dp8M9P4pqoOKC4u4X7SXrihQyRbyEB
 d51Q==
X-Gm-Message-State: AOAM5326Rd/kc+RkL4wwdegCZqbSRMz/fgfXeumsmQlPZxMdHQyMcWjK
 YGhZ2IpwDIFhnRVqTmcwrnLQH3+cPVSArWoZ
X-Google-Smtp-Source: ABdhPJwRi0use4LOrG3qbwYcYprWiKGiSI6z11+t9ZutsaQzaF/mnBRYB/UKaGnHlijk1fn+6ijkqg==
X-Received: by 2002:a63:d446:: with SMTP id i6mr6427973pgj.446.1611951057991; 
 Fri, 29 Jan 2021 12:10:57 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/24] tcg/aarch64: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 29 Jan 2021 10:10:20 -1000
Message-Id: <20210129201028.787853-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-con-set.h | 36 +++++++++++++
 tcg/aarch64/tcg-target.h         |  1 +
 tcg/aarch64/tcg-target.c.inc     | 86 +++++++++++---------------------
 3 files changed, 65 insertions(+), 58 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-con-set.h

diff --git a/tcg/aarch64/tcg-target-con-set.h b/tcg/aarch64/tcg-target-con-set.h
new file mode 100644
index 0000000000..d6c6866878
--- /dev/null
+++ b/tcg/aarch64/tcg-target-con-set.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Define AArch64 target-specific constraint sets.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
+C_O0_I2(lZ, l)
+C_O0_I2(r, rA)
+C_O0_I2(rZ, r)
+C_O0_I2(w, r)
+C_O1_I1(r, l)
+C_O1_I1(r, r)
+C_O1_I1(w, r)
+C_O1_I1(w, w)
+C_O1_I1(w, wr)
+C_O1_I2(r, 0, rZ)
+C_O1_I2(r, r, r)
+C_O1_I2(r, r, rA)
+C_O1_I2(r, r, rAL)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rL)
+C_O1_I2(r, rZ, rZ)
+C_O1_I2(w, 0, w)
+C_O1_I2(w, w, w)
+C_O1_I2(w, w, wN)
+C_O1_I2(w, w, wO)
+C_O1_I2(w, w, wZ)
+C_O1_I3(w, w, w, w)
+C_O1_I4(r, r, rA, rZ, rZ)
+C_O2_I4(r, r, rZ, rZ, rA, rMZ)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 5ec30dba25..200e9b5e0e 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,5 +155,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_SET_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 42037c98fa..3c1ee39fd4 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2547,42 +2547,11 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     va_end(va);
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef w_w = { .args_ct_str = { "w", "w" } };
-    static const TCGTargetOpDef w_r = { .args_ct_str = { "w", "r" } };
-    static const TCGTargetOpDef w_wr = { .args_ct_str = { "w", "wr" } };
-    static const TCGTargetOpDef r_l = { .args_ct_str = { "r", "l" } };
-    static const TCGTargetOpDef r_rA = { .args_ct_str = { "r", "rA" } };
-    static const TCGTargetOpDef rZ_r = { .args_ct_str = { "rZ", "r" } };
-    static const TCGTargetOpDef lZ_l = { .args_ct_str = { "lZ", "l" } };
-    static const TCGTargetOpDef r_r_r = { .args_ct_str = { "r", "r", "r" } };
-    static const TCGTargetOpDef w_w_w = { .args_ct_str = { "w", "w", "w" } };
-    static const TCGTargetOpDef w_0_w = { .args_ct_str = { "w", "0", "w" } };
-    static const TCGTargetOpDef w_w_wO = { .args_ct_str = { "w", "w", "wO" } };
-    static const TCGTargetOpDef w_w_wN = { .args_ct_str = { "w", "w", "wN" } };
-    static const TCGTargetOpDef w_w_wZ = { .args_ct_str = { "w", "w", "wZ" } };
-    static const TCGTargetOpDef r_r_ri = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_rA = { .args_ct_str = { "r", "r", "rA" } };
-    static const TCGTargetOpDef r_r_rL = { .args_ct_str = { "r", "r", "rL" } };
-    static const TCGTargetOpDef r_r_rAL
-        = { .args_ct_str = { "r", "r", "rAL" } };
-    static const TCGTargetOpDef dep
-        = { .args_ct_str = { "r", "0", "rZ" } };
-    static const TCGTargetOpDef ext2
-        = { .args_ct_str = { "r", "rZ", "rZ" } };
-    static const TCGTargetOpDef movc
-        = { .args_ct_str = { "r", "r", "rA", "rZ", "rZ" } };
-    static const TCGTargetOpDef add2
-        = { .args_ct_str = { "r", "r", "rZ", "rZ", "rA", "rMZ" } };
-    static const TCGTargetOpDef w_w_w_w
-        = { .args_ct_str = { "w", "w", "w", "w" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -2621,7 +2590,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extract_i64:
     case INDEX_op_sextract_i32:
     case INDEX_op_sextract_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
@@ -2630,7 +2599,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &rZ_r;
+        return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
@@ -2638,7 +2607,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
-        return &r_r_rA;
+        return C_O1_I2(r, r, rA);
 
     case INDEX_op_mul_i32:
     case INDEX_op_mul_i64:
@@ -2652,7 +2621,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_remu_i64:
     case INDEX_op_muluh_i64:
     case INDEX_op_mulsh_i64:
-        return &r_r_r;
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
@@ -2666,7 +2635,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_orc_i64:
     case INDEX_op_eqv_i32:
     case INDEX_op_eqv_i64:
-        return &r_r_rL;
+        return C_O1_I2(r, r, rL);
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
@@ -2678,42 +2647,42 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sar_i64:
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i64:
-        return &r_r_ri;
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_clz_i32:
     case INDEX_op_ctz_i32:
     case INDEX_op_clz_i64:
     case INDEX_op_ctz_i64:
-        return &r_r_rAL;
+        return C_O1_I2(r, r, rAL);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return &r_rA;
+        return C_O0_I2(r, rA);
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        return &movc;
+        return C_O1_I4(r, r, rA, rZ, rZ);
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return &r_l;
+        return C_O1_I1(r, l);
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        return &lZ_l;
+        return C_O0_I2(lZ, l);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        return &dep;
+        return C_O1_I2(r, 0, rZ);
 
     case INDEX_op_extract2_i32:
     case INDEX_op_extract2_i64:
-        return &ext2;
+        return C_O1_I2(r, rZ, rZ);
 
     case INDEX_op_add2_i32:
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
     case INDEX_op_sub2_i64:
-        return &add2;
+        return C_O2_I4(r, r, rZ, rZ, rA, rMZ);
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -2731,35 +2700,36 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
     case INDEX_op_aa64_sshl_vec:
-        return &w_w_w;
+        return C_O1_I2(w, w, w);
     case INDEX_op_not_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_abs_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
-        return &w_w;
+        return C_O1_I1(w, w);
     case INDEX_op_ld_vec:
-    case INDEX_op_st_vec:
     case INDEX_op_dupm_vec:
-        return &w_r;
+        return C_O1_I1(w, r);
+    case INDEX_op_st_vec:
+        return C_O0_I2(w, r);
     case INDEX_op_dup_vec:
-        return &w_wr;
+        return C_O1_I1(w, wr);
     case INDEX_op_or_vec:
     case INDEX_op_andc_vec:
-        return &w_w_wO;
+        return C_O1_I2(w, w, wO);
     case INDEX_op_and_vec:
     case INDEX_op_orc_vec:
-        return &w_w_wN;
+        return C_O1_I2(w, w, wN);
     case INDEX_op_cmp_vec:
-        return &w_w_wZ;
+        return C_O1_I2(w, w, wZ);
     case INDEX_op_bitsel_vec:
-        return &w_w_w_w;
+        return C_O1_I3(w, w, w, w);
     case INDEX_op_aa64_sli_vec:
-        return &w_0_w;
+        return C_O1_I2(w, 0, w);
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


