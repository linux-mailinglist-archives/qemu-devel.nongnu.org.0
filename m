Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364342E18C7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:11:56 +0100 (CET)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxNJ-0000UZ-Rr
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEM-0008TF-5l
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:39 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEF-0000R7-Op
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:37 -0500
Received: by mail-pg1-x533.google.com with SMTP id f17so9926630pge.6
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D1cssy5nr73dcyGZN4wFfC1KpMYyeCV3YiIqsmzd9bY=;
 b=s3lOdW4Ms3Cy6CryoiMNjNLMe57uoy1GUhbXHhQHbCmikV7k7+ngbOCDF65huOHTJu
 AEBgUW44HOs7wJR97ddONpig5+TnwDirnCbe9tL1uiuTDWAS2iNY5+hdTW/b3W2xyxzc
 KrPzD/AGXNVI3tZLjkMS+8UQ2mcisUSP6ML+8HNObUQB/fBPr70hNq85eTwSGnE7Z2Ji
 AY5aRaufZpKNcLbVj5DMieCqmcpSO7cWsM2naz0VGOVDzYi7Luxz0PY5XpKQZRK30Whs
 /UPgUu0ZSvY6Hs1oBkAcaNRdYbh4/ysM0aoQnUp4dvAJPmGq0XGYnyY9lm1/EGbHuXzP
 ew4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D1cssy5nr73dcyGZN4wFfC1KpMYyeCV3YiIqsmzd9bY=;
 b=pdAiO6C743TQe2UvqmtBHI12Jthmpjpqo9TEPYf3gU2hGiICeuEtTZIwIX/P1x7+eD
 IylW6SpcZk/5eN+UmbQtOCT87mp2P17sSXzPKFhQQjcl6/flh3fiCXuQa0PjLaZ03/t0
 073fHlHjB3xMtSnimMZFTu30zSgK/hPIm7eVFplxK8zOgww86xXVG7tR1+3MEsSF6jyL
 BWPmPRxs6VJeir086gCCB6gqkbtE4bpZWGHR2kZjkNN36fqNeMlgiWEkCgp9fSX5rp9G
 yghXe61YqZvSIc5S6sa05QmTifDKdNwcNGQsS8PhfZQlKJgOGk6/7nybxfVxEvX0GI71
 t5cA==
X-Gm-Message-State: AOAM532gH/+bPb7j/JbajhDbQO+SUJvB4HC3fD3GQW+k/kzO6w5k0vJR
 /dEVfLZPbzquKIXvgs2zXIbpVayFvFA+bg==
X-Google-Smtp-Source: ABdhPJzl+MJZBtU1wSVYmRVofl8koGATRJfplO7r2ZkZGWg+qgkJOxVv1ki7w56W8/2Y1qieW+42Nw==
X-Received: by 2002:a65:4bc2:: with SMTP id p2mr15657425pgr.169.1608703349280; 
 Tue, 22 Dec 2020 22:02:29 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/22] tcg/s390: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:02:01 -0800
Message-Id: <20201223060204.576856-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 tcg/s390/tcg-target-conset.h |  24 +++++++
 tcg/s390/tcg-target.h        |   1 +
 tcg/s390/tcg-target.c.inc    | 121 +++++++++++++++--------------------
 3 files changed, 76 insertions(+), 70 deletions(-)
 create mode 100644 tcg/s390/tcg-target-conset.h

diff --git a/tcg/s390/tcg-target-conset.h b/tcg/s390/tcg-target-conset.h
new file mode 100644
index 0000000000..e68baabbfd
--- /dev/null
+++ b/tcg/s390/tcg-target-conset.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * S390 target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
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
index 63c8797bd3..78277a8d07 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -162,5 +162,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index d00d78f0b9..410f63104f 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -2274,27 +2274,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static int tcg_target_op_def(TCGOpcode op)
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


