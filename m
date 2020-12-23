Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A062E18CC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:15:06 +0100 (CET)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxQP-000443-Eh
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEG-0008Rc-S4
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:34 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEA-0000OQ-Tx
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:32 -0500
Received: by mail-pj1-x1035.google.com with SMTP id n3so610589pjm.1
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uRTDlrjsZd2ECIgzVgTpVsKManvsUod3zyWxTNTa0RQ=;
 b=iHgGoOjdhlF0doqVJuoJTFXDzvBBZFkCC7H1iekTbBVLihleD2Upj/p9778yGzNelV
 AXT7sDLSoZkVPqAcMmiE3EbA7koq690xX+RBJS1zSzpc+2Qb9u2BT5QGGRrQ3lv/eOeH
 Mslnd9w/tb0quJzH3MV77MfNRMqnCJoXdmgNMyxuwaRZECXS4dEoDObbRSMcbPopqF84
 2oxhwp+YJSdVHGX22Ma9d5VG9dOxSVncBhKKTQ2KSQRjs7MJMkWci4xHDz4NHfuNcXpp
 j1nx//JirVdg5uxX//sSx0Ub66py5u5e4d2zwVqUZ+zi2h6KTWNLvMgy7sJAL7HlUfjR
 BhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uRTDlrjsZd2ECIgzVgTpVsKManvsUod3zyWxTNTa0RQ=;
 b=ctQ4ZWfvsTNGugdKmsGq9cjM3lQIWR0jsmX4LuiSDMrVboRsT2pnXlVQ1Bo15EFse+
 Ypq3Tot6hy+8SkEttYMKbBT81Ei6+FIS2ZiwYHuNcCnRLQVlK1bcKTnKpq4h5zx1P8Lg
 SbOZ0YpAIFDytaDYBgpF3Mb1osZ/iCTiZptDhm5mWnVxika6LWVepSM5espmt75PiaJT
 y42SuCMaO90V7ZJXau9f+yKW6BGl2yZWjqDK84sZ/zVV5q6j+KwSlM2W+bbeG3Q8Ee4K
 OQeG/nWd6r4C5CJJWeEzPaiUI80b2KGru7BGz4cNEUH0TziE0LR4s5vPk1B//q7dbfrJ
 LiOQ==
X-Gm-Message-State: AOAM533ICfX5VGq4bxDDzLyy6dl7YH3aVKqwaVmZCp8EiZA91jgTV+Ta
 YquJ34VyFpK+6Vdedk8FNLRYUC+7PHar+A==
X-Google-Smtp-Source: ABdhPJwdsxRScDshTrNiwG/OkYCo3ZwxO0HPPotUuprTDY06FpBW/FnPwcr8RjJd5KuNR7o3BgaeDA==
X-Received: by 2002:a17:902:c155:b029:da:9460:99a0 with SMTP id
 21-20020a170902c155b02900da946099a0mr24244590plj.20.1608703343128; 
 Tue, 22 Dec 2020 22:02:23 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/22] tcg/aarch64: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:01:56 -0800
Message-Id: <20201223060204.576856-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-conset.h | 31 ++++++++++++
 tcg/aarch64/tcg-target.h        |  1 +
 tcg/aarch64/tcg-target.c.inc    | 86 +++++++++++----------------------
 3 files changed, 60 insertions(+), 58 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-conset.h

diff --git a/tcg/aarch64/tcg-target-conset.h b/tcg/aarch64/tcg-target-conset.h
new file mode 100644
index 0000000000..2df8157b15
--- /dev/null
+++ b/tcg/aarch64/tcg-target-conset.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AArch64 target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
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
index 663dd0b95e..a81f6dadf9 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -159,5 +159,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSET_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 310bc972e3..aaf8918a4b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2541,42 +2541,11 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     va_end(va);
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static int tcg_target_op_def(TCGOpcode op)
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
@@ -2615,7 +2584,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extract_i64:
     case INDEX_op_sextract_i32:
     case INDEX_op_sextract_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
@@ -2624,7 +2593,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &rZ_r;
+        return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
@@ -2632,7 +2601,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
-        return &r_r_rA;
+        return C_O1_I2(r, r, rA);
 
     case INDEX_op_mul_i32:
     case INDEX_op_mul_i64:
@@ -2646,7 +2615,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_remu_i64:
     case INDEX_op_muluh_i64:
     case INDEX_op_mulsh_i64:
-        return &r_r_r;
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
@@ -2660,7 +2629,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_orc_i64:
     case INDEX_op_eqv_i32:
     case INDEX_op_eqv_i64:
-        return &r_r_rL;
+        return C_O1_I2(r, r, rL);
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
@@ -2672,42 +2641,42 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -2725,35 +2694,36 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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


