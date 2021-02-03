Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424CE30D199
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:33:53 +0100 (CET)
Received: from localhost ([::1]:45332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77zM-0003lS-8o
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iX-00082o-4A
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:29 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iU-00016N-WB
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id a20so3490017pjs.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9IaFnuOJyGGSYzX0XtrIiH13SIPJFOeAOWyCMY/qyI=;
 b=udInLemTxrVKgrCfOHA1O5UzuVbb+FgSWItshfBKzndl3egchb5hB5NVOxzJOZmnf7
 0/wCgeQn9rT/M4k5wx/PDWBTX5hg3EUR/9SfSVpR5zs/mmGVqxYVKyJUoRMA5GvEeYyI
 qhib2jV+8/+EMC5eenb3Il6T/NQcEtKzeaqG+677/ITcVWNur7q4k6BS650Ec5AknwBs
 84TXM6upbAs7Uoi9G8bgiE+x9nb85Lc+19VRm3uK91ZsDZ6qGG895GMKnAlVitWt29gB
 FdLtmiEtwZRdMxzJsrk7O+Msmphb0sYUSfneFd8Ki9KY42/iE1B0e1cT3waNPo90joEb
 Hb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9IaFnuOJyGGSYzX0XtrIiH13SIPJFOeAOWyCMY/qyI=;
 b=uibMTx+E7JWG9Vat7bcc87ytlgs+/HSBNwfYppbwAFepttKriOCSroFYMJranOpOkX
 nhgBomRJ8mFg3yyG6QFLFUStzNjQufjQBt2FNrkHvgRJCDer/GoR/YohpXp/x9W/j8XO
 NAATgTc8zv6WjaU6ByrDB80k4Dra7PxkfIh7iXV66E6cLsUh5IzR8p5pO5Wiq2gCsozf
 1WhH1ASivOobnz0Uz5Y/WexoTZEfno17lTMYPgY0JJbHCBXEAr6veibGpu6uwdVTX9jp
 wLkq8ZkZK4TTXIDwMxMWRIQ/T1J22P/657LVMTeFC0bkX/SQq2LuWSWdett030JDPN2F
 kdLw==
X-Gm-Message-State: AOAM531kdubZKWrmz4jCZTBkTRSGGiKWs9SkinTGsgALrH92475R1UY5
 OwPKxdtxwFyNxyG+IBo1RWlMyPJJgGRva/NK
X-Google-Smtp-Source: ABdhPJwOv90+KRVrqgKRA1wSSmQGoq9CSGmudlTYTj+hRl0dAa4k3B82Ft3l4TAuvqI6z2Xf24tvaw==
X-Received: by 2002:a17:902:8f97:b029:e1:1388:2705 with SMTP id
 z23-20020a1709028f97b02900e113882705mr983126plo.56.1612318585708; 
 Tue, 02 Feb 2021 18:16:25 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/24] tcg/s390: Split out constraint sets to
 tcg-target-con-set.h
Date: Tue,  2 Feb 2021 16:15:47 -1000
Message-Id: <20210203021550.375058-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


