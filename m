Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C20308E66
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:31:40 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aQd-0005cn-OK
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6n-00072f-G6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:09 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6l-0008Cq-An
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:09 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w18so6907904pfu.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9IaFnuOJyGGSYzX0XtrIiH13SIPJFOeAOWyCMY/qyI=;
 b=tlRLb++M8wfCcjdvZw0IRfS0L29rCq76ghCuJVMupjfyeR1H5Pan0CKy4AsMcnyTdZ
 /ASEJ+38wBkwGN1NzRU8h8GdW1PWH/RYLgMNQUgBtff/2jWXOY2BzDl0L75mLyc3AeeZ
 EQzQIkzPzNBQpqwtS1cDiDAqR46BEBRVvSN+EWMwFFeGFScWzG8kMpNbtUZbkRH84VcN
 p2bfoq1yJQkFsx2FSeJPACbGQ/Iquwl+UPg2Bt1EC+EEAVyLlknh55c4WeL6+37mgh4y
 AHhyq+7flidfU8S/L8Pv5y1GAgw1/M0fyUJf/wJsr81ZL3iI8usKk0V6U+hWL/il1bYA
 7Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9IaFnuOJyGGSYzX0XtrIiH13SIPJFOeAOWyCMY/qyI=;
 b=ZRTql/dJ2n9tE9b1dxSTn7VpltHVlCgLDeuWfwghF71qpxDU2CQ6JBGeA9XEKNHSvU
 9B+y+ukQa/rWLiIVTxsfxdnJUQo8F7a7MX6bsapJfqIdtiMewSoMzAY1+UeQvfKieyd7
 an/PVWtaXXufHfm22puPI78zCK2aWjHCRCkiBx604COdeXrnkhfynvEoKHffZEYd/Bi3
 OqbP4wk1DYM9/TGCouVuZ9eBoaD5aj9Jcco6c3RrvKmYw4gAgdEjnpBRTg2772A9NHGc
 Q1qlCbQtFMpccic8sNXYP1C0ZGjeQ39MbOvMGYPlKsxvMRydUs8KCAFlwcxJYN/GdJp5
 //9g==
X-Gm-Message-State: AOAM5337YcwrOQ9S2RaSNGqqds0Pk8uUWe31kON2MzXjseveLD+cKxMY
 MpwYO8v92VD8HnV6BMLr8I/dwAvGHh4xuQVo
X-Google-Smtp-Source: ABdhPJxUfI5ibBb1w8BEANehpnfdvJPn0Icj7SrjpCwE/PPccN9AHhKPempxT08NyPrLqthdNRh9VQ==
X-Received: by 2002:a63:724a:: with SMTP id c10mr6465601pgn.124.1611951066049; 
 Fri, 29 Jan 2021 12:11:06 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:11:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/24] tcg/s390: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 29 Jan 2021 10:10:25 -1000
Message-Id: <20210129201028.787853-22-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target-con-set.h |  29 ++++++++
 tcg/s390/tcg-target.h         |   1 +
 tcg/s390/tcg-target.c.inc     | 121 ++++++++++++++--------------------
 3 files changed, 81 insertions(+), 70 deletions(-)
 create mode 100644 tcg/s390/tcg-target-con-set.h

diff --git a/tcg/s390/tcg-target-con-set.h b/tcg/s390/tcg-target-con-set.h
new file mode 100644
index 0000000000..31985e4903
--- /dev/null
+++ b/tcg/s390/tcg-target-con-set.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define S390 target-specific constraint sets.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
+C_O0_I2(L, L)
+C_O0_I2(r, r)
+C_O0_I2(r, ri)
+C_O1_I1(r, L)
+C_O1_I1(r, r)
+C_O1_I2(r, 0, ri)
+C_O1_I2(r, 0, rI)
+C_O1_I2(r, 0, rJ)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, rZ, r)
+C_O1_I4(r, r, ri, r, 0)
+C_O1_I4(r, r, ri, rI, 0)
+C_O2_I2(b, a, 0, r)
+C_O2_I3(b, a, 0, 1, r)
+C_O2_I4(r, r, 0, 1, rA, r)
+C_O2_I4(r, r, 0, 1, ri, r)
+C_O2_I4(r, r, 0, 1, r, r)
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 641464eea4..7aafd25a46 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,5 +159,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 3fec7fec5f..b67470137c 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -2274,27 +2274,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef r_L = { .args_ct_str = { "r", "L" } };
-    static const TCGTargetOpDef L_L = { .args_ct_str = { "L", "L" } };
-    static const TCGTargetOpDef r_ri = { .args_ct_str = { "r", "ri" } };
-    static const TCGTargetOpDef r_r_ri = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_0_ri = { .args_ct_str = { "r", "0", "ri" } };
-    static const TCGTargetOpDef r_0_rI = { .args_ct_str = { "r", "0", "rI" } };
-    static const TCGTargetOpDef r_0_rJ = { .args_ct_str = { "r", "0", "rJ" } };
-    static const TCGTargetOpDef a2_r
-        = { .args_ct_str = { "r", "r", "0", "1", "r", "r" } };
-    static const TCGTargetOpDef a2_ri
-        = { .args_ct_str = { "r", "r", "0", "1", "ri", "r" } };
-    static const TCGTargetOpDef a2_rA
-        = { .args_ct_str = { "r", "r", "0", "1", "rA", "r" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
@@ -2308,6 +2292,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld32s_i64:
     case INDEX_op_ld_i64:
+        return C_O1_I1(r, r);
+
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
     case INDEX_op_st16_i32:
@@ -2315,11 +2301,22 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &r_r;
+        return C_O0_I2(r, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
-        return &r_r_ri;
+    case INDEX_op_shl_i64:
+    case INDEX_op_shr_i64:
+    case INDEX_op_sar_i64:
+    case INDEX_op_rotl_i32:
+    case INDEX_op_rotl_i64:
+    case INDEX_op_rotr_i32:
+    case INDEX_op_rotr_i64:
+    case INDEX_op_clz_i64:
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, ri);
+
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
     case INDEX_op_and_i32:
@@ -2328,35 +2325,33 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
-        return (s390_facilities & FACILITY_DISTINCT_OPS ? &r_r_ri : &r_0_ri);
+        return (s390_facilities & FACILITY_DISTINCT_OPS
+                ? C_O1_I2(r, r, ri)
+                : C_O1_I2(r, 0, ri));
 
     case INDEX_op_mul_i32:
         /* If we have the general-instruction-extensions, then we have
            MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
            have only MULTIPLY HALFWORD IMMEDIATE, with a signed 16-bit.  */
-        return (s390_facilities & FACILITY_GEN_INST_EXT ? &r_0_ri : &r_0_rI);
+        return (s390_facilities & FACILITY_GEN_INST_EXT
+                ? C_O1_I2(r, 0, ri)
+                : C_O1_I2(r, 0, rI));
+
     case INDEX_op_mul_i64:
-        return (s390_facilities & FACILITY_GEN_INST_EXT ? &r_0_rJ : &r_0_rI);
+        return (s390_facilities & FACILITY_GEN_INST_EXT
+                ? C_O1_I2(r, 0, rJ)
+                : C_O1_I2(r, 0, rI));
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
-        return (s390_facilities & FACILITY_DISTINCT_OPS ? &r_r_ri : &r_0_ri);
-
-    case INDEX_op_shl_i64:
-    case INDEX_op_shr_i64:
-    case INDEX_op_sar_i64:
-        return &r_r_ri;
-
-    case INDEX_op_rotl_i32:
-    case INDEX_op_rotl_i64:
-    case INDEX_op_rotr_i32:
-    case INDEX_op_rotr_i64:
-        return &r_r_ri;
+        return (s390_facilities & FACILITY_DISTINCT_OPS
+                ? C_O1_I2(r, r, ri)
+                : C_O1_I2(r, 0, ri));
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return &r_ri;
+        return C_O0_I2(r, ri);
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
@@ -2379,63 +2374,49 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
-        return &r_r;
-
-    case INDEX_op_clz_i64:
-    case INDEX_op_setcond_i32:
-    case INDEX_op_setcond_i64:
-        return &r_r_ri;
+        return C_O1_I1(r, r);
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return &r_L;
+        return C_O1_I1(r, L);
     case INDEX_op_qemu_st_i64:
     case INDEX_op_qemu_st_i32:
-        return &L_L;
+        return C_O0_I2(L, L);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        {
-            static const TCGTargetOpDef dep
-                = { .args_ct_str = { "r", "rZ", "r" } };
-            return &dep;
-        }
+        return C_O1_I2(r, rZ, r);
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        {
-            static const TCGTargetOpDef movc
-                = { .args_ct_str = { "r", "r", "ri", "r", "0" } };
-            static const TCGTargetOpDef movc_l
-                = { .args_ct_str = { "r", "r", "ri", "rI", "0" } };
-            return (s390_facilities & FACILITY_LOAD_ON_COND2 ? &movc_l : &movc);
-        }
+        return (s390_facilities & FACILITY_LOAD_ON_COND2
+                ? C_O1_I4(r, r, ri, rI, 0)
+                : C_O1_I4(r, r, ri, r, 0));
+
     case INDEX_op_div2_i32:
     case INDEX_op_div2_i64:
     case INDEX_op_divu2_i32:
     case INDEX_op_divu2_i64:
-        {
-            static const TCGTargetOpDef div2
-                = { .args_ct_str = { "b", "a", "0", "1", "r" } };
-            return &div2;
-        }
+        return C_O2_I3(b, a, 0, 1, r);
+
     case INDEX_op_mulu2_i64:
-        {
-            static const TCGTargetOpDef mul2
-                = { .args_ct_str = { "b", "a", "0", "r" } };
-            return &mul2;
-        }
+        return C_O2_I2(b, a, 0, r);
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        return (s390_facilities & FACILITY_EXT_IMM ? &a2_ri : &a2_r);
+        return (s390_facilities & FACILITY_EXT_IMM
+                ? C_O2_I4(r, r, 0, 1, ri, r)
+                : C_O2_I4(r, r, 0, 1, r, r));
+
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i64:
-        return (s390_facilities & FACILITY_EXT_IMM ? &a2_rA : &a2_r);
+        return (s390_facilities & FACILITY_EXT_IMM
+                ? C_O2_I4(r, r, 0, 1, rA, r)
+                : C_O2_I4(r, r, 0, 1, r, r));
 
     default:
-        break;
+        g_assert_not_reached();
     }
-    return NULL;
 }
 
 static void query_s390_facilities(void)
-- 
2.25.1


