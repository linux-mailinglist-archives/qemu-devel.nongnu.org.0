Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42401308E5F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:27:52 +0100 (CET)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aMx-0001aO-AT
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6k-0006vX-GP
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:06 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6i-0008BQ-4Y
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:06 -0500
Received: by mail-pf1-x42b.google.com with SMTP id u67so6925919pfb.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rkcGYRpavy8b7NvBkTDEXauxxj6OsYUBpOL3Xp6QZQ8=;
 b=nyXM916uZOBPQXSmAYYpm/A8qEshPgcR1Vnk0na03otWuvROXD8VzGwpRTvMVTi76x
 Al86pYEfSshoj4Tjlla/Zl/u11+djXyxiwZAMx6DZYkZ3czQNlFEcrzudifd1ev+Gt72
 ILfiqhOf0IGnEiOQdy/WGiFF3z1RsplTdWoeWcnB3k1pVu5WbP721BUKCbWWgnxoBdrz
 YMna4T/TX0ZtWEJkHSFH+FfJis7DQ02H+5KSRmAFoCKE5qBwRDRlD7aNT+MB21FpwnAQ
 Q2lK2gPF1XZtixAF3EbU57cGZU96RYi887UXZgFyhQcwcNYsdiJNniyuixyHu/l/o5KH
 eu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkcGYRpavy8b7NvBkTDEXauxxj6OsYUBpOL3Xp6QZQ8=;
 b=KspWpy889TAjoxI6j/uH7DyEiWw2qP8rmQrKJXVbWCcxsIMuAA/cHpbDzKtea95dY+
 KDMbVrOcVKQF08aYmFTAGSZqgIOl90GvQAMwOlWl49wsAonnwjiXG4WzxLDpswWP2m63
 nekAIDkdQp1jmBP2f9pqrnW7B7tLDly+FU1ef0AAuTNCOxWAuRsnDCdunRvOZiend4jY
 plwAB/gC9EcyyAm+pKMMJJ8Keer3entKS8Yj/keV6mmaOx6AlUkl2wf7ndfkg1DZrQr+
 elvwsdRdqqhGmhWKv2N288ke3zuABcpz+NEU3lFNRY2PhDhm0n3Va42p7JttQrDKbiwS
 wUDg==
X-Gm-Message-State: AOAM530lv2+BLCrmBNHwBfm03zVDGRx9cfcuWcSphE2mr5vCiOkC4bRb
 RuCy5MdeBc4qXtwHnb3791/X+ewglY4HW769
X-Google-Smtp-Source: ABdhPJybw9oQfrO86NKDPkdMhxZuSE6NXyCqzZhj1mE5kJk/JV0WJBb5YLP2cBE7YM+5aEKQe837Vw==
X-Received: by 2002:a63:6686:: with SMTP id a128mr6170089pgc.109.1611951062720; 
 Fri, 29 Jan 2021 12:11:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:11:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/24] tcg/ppc: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 29 Jan 2021 10:10:23 -1000
Message-Id: <20210129201028.787853-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 tcg/ppc/tcg-target-con-set.h |  42 +++++++++++
 tcg/ppc/tcg-target.h         |   1 +
 tcg/ppc/tcg-target.c.inc     | 136 +++++++++++++++--------------------
 3 files changed, 99 insertions(+), 80 deletions(-)
 create mode 100644 tcg/ppc/tcg-target-con-set.h

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
new file mode 100644
index 0000000000..a1a345883d
--- /dev/null
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define PowerPC target-specific constraint sets.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
+C_O0_I2(r, r)
+C_O0_I2(r, ri)
+C_O0_I2(S, S)
+C_O0_I2(v, r)
+C_O0_I3(S, S, S)
+C_O0_I4(r, r, ri, ri)
+C_O0_I4(S, S, S, S)
+C_O1_I1(r, L)
+C_O1_I1(r, r)
+C_O1_I1(v, r)
+C_O1_I1(v, v)
+C_O1_I1(v, vr)
+C_O1_I2(r, 0, rZ)
+C_O1_I2(r, L, L)
+C_O1_I2(r, rI, ri)
+C_O1_I2(r, rI, rT)
+C_O1_I2(r, r, r)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
+C_O1_I2(r, r, rT)
+C_O1_I2(r, r, rU)
+C_O1_I2(r, r, rZW)
+C_O1_I2(v, v, v)
+C_O1_I3(v, v, v, v)
+C_O1_I4(r, r, ri, rZ, rZ)
+C_O1_I4(r, r, r, ri, ri)
+C_O2_I1(L, L, L)
+C_O2_I2(L, L, L, L)
+C_O2_I4(r, r, rI, rZM, r, r)
+C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index d1339afc66..551f8d0fc9 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,5 +185,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e5aa8d2d10..4377d15d62 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3456,62 +3456,17 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     va_end(va);
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef r_L = { .args_ct_str = { "r", "L" } };
-    static const TCGTargetOpDef S_S = { .args_ct_str = { "S", "S" } };
-    static const TCGTargetOpDef r_ri = { .args_ct_str = { "r", "ri" } };
-    static const TCGTargetOpDef r_r_r = { .args_ct_str = { "r", "r", "r" } };
-    static const TCGTargetOpDef r_L_L = { .args_ct_str = { "r", "L", "L" } };
-    static const TCGTargetOpDef L_L_L = { .args_ct_str = { "L", "L", "L" } };
-    static const TCGTargetOpDef S_S_S = { .args_ct_str = { "S", "S", "S" } };
-    static const TCGTargetOpDef r_r_ri = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_rI = { .args_ct_str = { "r", "r", "rI" } };
-    static const TCGTargetOpDef r_r_rT = { .args_ct_str = { "r", "r", "rT" } };
-    static const TCGTargetOpDef r_r_rU = { .args_ct_str = { "r", "r", "rU" } };
-    static const TCGTargetOpDef r_rI_ri
-        = { .args_ct_str = { "r", "rI", "ri" } };
-    static const TCGTargetOpDef r_rI_rT
-        = { .args_ct_str = { "r", "rI", "rT" } };
-    static const TCGTargetOpDef r_r_rZW
-        = { .args_ct_str = { "r", "r", "rZW" } };
-    static const TCGTargetOpDef L_L_L_L
-        = { .args_ct_str = { "L", "L", "L", "L" } };
-    static const TCGTargetOpDef S_S_S_S
-        = { .args_ct_str = { "S", "S", "S", "S" } };
-    static const TCGTargetOpDef movc
-        = { .args_ct_str = { "r", "r", "ri", "rZ", "rZ" } };
-    static const TCGTargetOpDef dep
-        = { .args_ct_str = { "r", "0", "rZ" } };
-    static const TCGTargetOpDef br2
-        = { .args_ct_str = { "r", "r", "ri", "ri" } };
-    static const TCGTargetOpDef setc2
-        = { .args_ct_str = { "r", "r", "r", "ri", "ri" } };
-    static const TCGTargetOpDef add2
-        = { .args_ct_str = { "r", "r", "r", "r", "rI", "rZM" } };
-    static const TCGTargetOpDef sub2
-        = { .args_ct_str = { "r", "r", "rI", "rZM", "r", "r" } };
-    static const TCGTargetOpDef v_r = { .args_ct_str = { "v", "r" } };
-    static const TCGTargetOpDef v_vr = { .args_ct_str = { "v", "vr" } };
-    static const TCGTargetOpDef v_v = { .args_ct_str = { "v", "v" } };
-    static const TCGTargetOpDef v_v_v = { .args_ct_str = { "v", "v", "v" } };
-    static const TCGTargetOpDef v_v_v_v
-        = { .args_ct_str = { "v", "v", "v", "v" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld_i32:
-    case INDEX_op_st8_i32:
-    case INDEX_op_st16_i32:
-    case INDEX_op_st_i32:
     case INDEX_op_ctpop_i32:
     case INDEX_op_neg_i32:
     case INDEX_op_not_i32:
@@ -3527,10 +3482,6 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld32s_i64:
     case INDEX_op_ld_i64:
-    case INDEX_op_st8_i64:
-    case INDEX_op_st16_i64:
-    case INDEX_op_st32_i64:
-    case INDEX_op_st_i64:
     case INDEX_op_ctpop_i64:
     case INDEX_op_neg_i64:
     case INDEX_op_not_i64:
@@ -3543,7 +3494,16 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap64_i64:
     case INDEX_op_extract_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
+
+    case INDEX_op_st8_i32:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st_i32:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i64:
+        return C_O0_I2(r, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_and_i32:
@@ -3566,10 +3526,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i64:
     case INDEX_op_setcond_i64:
-        return &r_r_ri;
+        return C_O1_I2(r, r, ri);
+
     case INDEX_op_mul_i32:
     case INDEX_op_mul_i64:
-        return &r_r_rI;
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_div_i32:
     case INDEX_op_divu_i32:
     case INDEX_op_nand_i32:
@@ -3584,55 +3546,63 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_divu_i64:
     case INDEX_op_mulsh_i64:
     case INDEX_op_muluh_i64:
-        return &r_r_r;
+        return C_O1_I2(r, r, r);
+
     case INDEX_op_sub_i32:
-        return &r_rI_ri;
+        return C_O1_I2(r, rI, ri);
     case INDEX_op_add_i64:
-        return &r_r_rT;
+        return C_O1_I2(r, r, rT);
     case INDEX_op_or_i64:
     case INDEX_op_xor_i64:
-        return &r_r_rU;
+        return C_O1_I2(r, r, rU);
     case INDEX_op_sub_i64:
-        return &r_rI_rT;
+        return C_O1_I2(r, rI, rT);
     case INDEX_op_clz_i32:
     case INDEX_op_ctz_i32:
     case INDEX_op_clz_i64:
     case INDEX_op_ctz_i64:
-        return &r_r_rZW;
+        return C_O1_I2(r, r, rZW);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return &r_ri;
+        return C_O0_I2(r, ri);
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        return &movc;
+        return C_O1_I4(r, r, ri, rZ, rZ);
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        return &dep;
+        return C_O1_I2(r, 0, rZ);
     case INDEX_op_brcond2_i32:
-        return &br2;
+        return C_O0_I4(r, r, ri, ri);
     case INDEX_op_setcond2_i32:
-        return &setc2;
+        return C_O1_I4(r, r, r, ri, ri);
     case INDEX_op_add2_i64:
     case INDEX_op_add2_i32:
-        return &add2;
+        return C_O2_I4(r, r, r, r, rI, rZM);
     case INDEX_op_sub2_i64:
     case INDEX_op_sub2_i32:
-        return &sub2;
+        return C_O2_I4(r, r, rI, rZM, r, r);
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? &r_L : &r_L_L);
+                ? C_O1_I1(r, L)
+                : C_O1_I2(r, L, L));
+
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? &S_S : &S_S_S);
+                ? C_O0_I2(S, S)
+                : C_O0_I3(S, S, S));
+
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? &r_L
-                : TARGET_LONG_BITS == 32 ? &L_L_L : &L_L_L_L);
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(L, L, L)
+                : C_O2_I2(L, L, L, L));
+
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? &S_S
-                : TARGET_LONG_BITS == 32 ? &S_S_S : &S_S_S_S);
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(S, S)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(S, S, S)
+                : C_O0_I4(S, S, S, S));
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -3662,22 +3632,28 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ppc_mulou_vec:
     case INDEX_op_ppc_pkum_vec:
     case INDEX_op_dup2_vec:
-        return &v_v_v;
+        return C_O1_I2(v, v, v);
+
     case INDEX_op_not_vec:
     case INDEX_op_neg_vec:
-        return &v_v;
+        return C_O1_I1(v, v);
+
     case INDEX_op_dup_vec:
-        return have_isa_3_00 ? &v_vr : &v_v;
+        return have_isa_3_00 ? C_O1_I1(v, vr) : C_O1_I1(v, v);
+
     case INDEX_op_ld_vec:
-    case INDEX_op_st_vec:
     case INDEX_op_dupm_vec:
-        return &v_r;
+        return C_O1_I1(v, r);
+
+    case INDEX_op_st_vec:
+        return C_O0_I2(v, r);
+
     case INDEX_op_bitsel_vec:
     case INDEX_op_ppc_msum_vec:
-        return &v_v_v_v;
+        return C_O1_I3(v, v, v, v);
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


