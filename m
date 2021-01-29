Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98640308E62
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:29:53 +0100 (CET)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aOt-0003nP-GY
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6h-0006ng-3W
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:03 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6e-00089j-Qo
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:02 -0500
Received: by mail-pf1-x42e.google.com with SMTP id o20so6938954pfu.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDPLJQ05GGTADfTs6BheNhHZIws3/52urkp+p4khmC8=;
 b=AKQNNl0UVePYfUHh2zV9LA+I7/7aufG3uxa1y9a/tYczB1ydsQirDFU/9jwDanZEQK
 3kof5vmQT86j//b9BodfpVOlr+1n5HpHva3Q0z3dd+q47L2G2hf+NEMyX/+DqEcAMUFJ
 6pwvZKy/DtMyYFIFkH9SYfn8HizuMzF8apUSkiecHZnuMaAdqVCTbuj1wmAbHcrqHG9x
 a+BMMLhqVzIQyvKHDwKJMT/NSSG/MOgLSmSUR6AWy5LLWaYMidKNCBCwO0Q1zdI7PXJu
 R1Yy9aFQkX6C3jwe+4IzdhtzIsWfAU3CVQrmObsqUdTz2fkHhvfCM0y67UUdNsHHEH1Z
 7Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDPLJQ05GGTADfTs6BheNhHZIws3/52urkp+p4khmC8=;
 b=ubdKuK15J2nhMwNd6m+gODPBxZbhnJIhlKHlQT3F8elOmxwngpUmQkAAE9bXpWoDih
 3F9JTLzqPV7DsF/3kqvyRfosJixa6Z8towWY/xutgAz7ByTGt9pySO8GPKDJ4l8GWKWQ
 SePl/BsjnYPgv1VTJXpAlyCdglHrADJIpLTjuh84d2g8Xr4vI09f3JDq1SOgqz5SVTNw
 eeh49wHieiDtey0qyTSbiwm2UN3CfNCzP0Vrk9XxEy5Z2ee5EaN2YvlFxDyYLr7U866r
 GfbyHQL781uavfzyJGE+RhnoCp4NyMdscobwEkAKE6L0bDJtEEuqCZULrqUWxTNLtmLz
 fCsA==
X-Gm-Message-State: AOAM532VYRkagUSRt0k4+xlP8oI4DFGX7YMO0QqYN3Pnq/ojgRF4Y+IA
 YoATECQNiQCHBJB2wKU7ELdJhMbRpt+O3uMZ
X-Google-Smtp-Source: ABdhPJxVWuSPfqB+TsLteS2tuCxe4BELE7wtmUsNmJrgTX/P08AQbL0WImYWf5J9Ok3v5CLmqUf4bA==
X-Received: by 2002:a63:184b:: with SMTP id 11mr6466003pgy.298.1611951059455; 
 Fri, 29 Jan 2021 12:10:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/24] tcg/arm: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 29 Jan 2021 10:10:21 -1000
Message-Id: <20210129201028.787853-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 tcg/arm/tcg-target-con-set.h | 35 ++++++++++++++
 tcg/arm/tcg-target.h         |  1 +
 tcg/arm/tcg-target.c.inc     | 94 ++++++++++++------------------------
 3 files changed, 68 insertions(+), 62 deletions(-)
 create mode 100644 tcg/arm/tcg-target-con-set.h

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
new file mode 100644
index 0000000000..ab63e089c2
--- /dev/null
+++ b/tcg/arm/tcg-target-con-set.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Arm target-specific constraint sets.
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
+C_O0_I2(r, rIN)
+C_O0_I2(s, s)
+C_O0_I3(s, s, s)
+C_O0_I4(r, r, rI, rI)
+C_O0_I4(s, s, s, s)
+C_O1_I1(r, l)
+C_O1_I1(r, r)
+C_O1_I2(r, 0, rZ)
+C_O1_I2(r, l, l)
+C_O1_I2(r, r, r)
+C_O1_I2(r, r, rI)
+C_O1_I2(r, r, rIK)
+C_O1_I2(r, r, rIN)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, rZ, rZ)
+C_O1_I4(r, r, r, rI, rI)
+C_O1_I4(r, r, rIN, rIK, 0)
+C_O2_I1(r, r, l)
+C_O2_I2(r, r, l, l)
+C_O2_I2(r, r, r, r)
+C_O2_I4(r, r, r, r, rIN, rIK)
+C_O2_I4(r, r, rI, rI, rIN, rIK)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 8d1fee6327..4d201b1216 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -142,5 +142,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index bbd41d2491..8457108a87 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2036,57 +2036,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef s_s = { .args_ct_str = { "s", "s" } };
-    static const TCGTargetOpDef r_l = { .args_ct_str = { "r", "l" } };
-    static const TCGTargetOpDef r_r_r = { .args_ct_str = { "r", "r", "r" } };
-    static const TCGTargetOpDef r_r_l = { .args_ct_str = { "r", "r", "l" } };
-    static const TCGTargetOpDef r_l_l = { .args_ct_str = { "r", "l", "l" } };
-    static const TCGTargetOpDef s_s_s = { .args_ct_str = { "s", "s", "s" } };
-    static const TCGTargetOpDef r_r_ri = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_rI = { .args_ct_str = { "r", "r", "rI" } };
-    static const TCGTargetOpDef r_r_rIN
-        = { .args_ct_str = { "r", "r", "rIN" } };
-    static const TCGTargetOpDef r_r_rIK
-        = { .args_ct_str = { "r", "r", "rIK" } };
-    static const TCGTargetOpDef r_r_r_r
-        = { .args_ct_str = { "r", "r", "r", "r" } };
-    static const TCGTargetOpDef r_r_l_l
-        = { .args_ct_str = { "r", "r", "l", "l" } };
-    static const TCGTargetOpDef s_s_s_s
-        = { .args_ct_str = { "s", "s", "s", "s" } };
-    static const TCGTargetOpDef br
-        = { .args_ct_str = { "r", "rIN" } };
-    static const TCGTargetOpDef ext2
-        = { .args_ct_str = { "r", "rZ", "rZ" } };
-    static const TCGTargetOpDef dep
-        = { .args_ct_str = { "r", "0", "rZ" } };
-    static const TCGTargetOpDef movc
-        = { .args_ct_str = { "r", "r", "rIN", "rIK", "0" } };
-    static const TCGTargetOpDef add2
-        = { .args_ct_str = { "r", "r", "r", "r", "rIN", "rIK" } };
-    static const TCGTargetOpDef sub2
-        = { .args_ct_str = { "r", "r", "rI", "rI", "rIN", "rIK" } };
-    static const TCGTargetOpDef br2
-        = { .args_ct_str = { "r", "r", "rI", "rI" } };
-    static const TCGTargetOpDef setc2
-        = { .args_ct_str = { "r", "r", "r", "rI", "rI" } };
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
     case INDEX_op_neg_i32:
     case INDEX_op_not_i32:
     case INDEX_op_bswap16_i32:
@@ -2096,62 +2056,72 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ext16u_i32:
     case INDEX_op_extract_i32:
     case INDEX_op_sextract_i32:
-        return &r_r;
+        return C_O1_I1(r, r);
+
+    case INDEX_op_st8_i32:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st_i32:
+        return C_O0_I2(r, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_sub_i32:
     case INDEX_op_setcond_i32:
-        return &r_r_rIN;
+        return C_O1_I2(r, r, rIN);
+
     case INDEX_op_and_i32:
     case INDEX_op_andc_i32:
     case INDEX_op_clz_i32:
     case INDEX_op_ctz_i32:
-        return &r_r_rIK;
+        return C_O1_I2(r, r, rIK);
+
     case INDEX_op_mul_i32:
     case INDEX_op_div_i32:
     case INDEX_op_divu_i32:
-        return &r_r_r;
+        return C_O1_I2(r, r, r);
+
     case INDEX_op_mulu2_i32:
     case INDEX_op_muls2_i32:
-        return &r_r_r_r;
+        return C_O2_I2(r, r, r, r);
+
     case INDEX_op_or_i32:
     case INDEX_op_xor_i32:
-        return &r_r_rI;
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
     case INDEX_op_rotl_i32:
     case INDEX_op_rotr_i32:
-        return &r_r_ri;
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
-        return &br;
+        return C_O0_I2(r, rIN);
     case INDEX_op_deposit_i32:
-        return &dep;
+        return C_O1_I2(r, 0, rZ);
     case INDEX_op_extract2_i32:
-        return &ext2;
+        return C_O1_I2(r, rZ, rZ);
     case INDEX_op_movcond_i32:
-        return &movc;
+        return C_O1_I4(r, r, rIN, rIK, 0);
     case INDEX_op_add2_i32:
-        return &add2;
+        return C_O2_I4(r, r, r, r, rIN, rIK);
     case INDEX_op_sub2_i32:
-        return &sub2;
+        return C_O2_I4(r, r, rI, rI, rIN, rIK);
     case INDEX_op_brcond2_i32:
-        return &br2;
+        return C_O0_I4(r, r, rI, rI);
     case INDEX_op_setcond2_i32:
-        return &setc2;
+        return C_O1_I4(r, r, r, rI, rI);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS == 32 ? &r_l : &r_l_l;
+        return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
     case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? &r_r_l : &r_r_l_l;
+        return TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, l) : C_O2_I2(r, r, l, l);
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS == 32 ? &s_s : &s_s_s;
+        return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
     case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? &s_s_s : &s_s_s_s;
+        return TARGET_LONG_BITS == 32 ? C_O0_I3(s, s, s) : C_O0_I4(s, s, s, s);
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


