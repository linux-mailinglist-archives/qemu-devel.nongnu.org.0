Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144830D186
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:29:11 +0100 (CET)
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77um-0006UM-HH
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iT-0007ru-92
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:25 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iQ-00014z-Sy
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:24 -0500
Received: by mail-pj1-x102a.google.com with SMTP id cl8so2201223pjb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VUVejRK81rsj4L29tUqUpPwwe85/JVUx2UgkVy5ibcg=;
 b=focYzwyPr3s0W9Xdfq3dqdQ60GuRfwYubgKcPZ2Q1GhmVbWOtHi4baE05+rR6sSiRx
 43tYPEK+l/XnpeQz8VVtl4wf+HR/YQgiwWpW1y4ledj3dKc1emzrfv9ROfNVl3nZ6T+2
 uQ/48B+5iN9708ERM4wRKqWsd+QP4lwnspHWnMeua+qQ2WT5SZeGRVNuIx8iDB7Erdsm
 7X1Vng7h0IsRdy1r7RxRaEQwdVf5DPyIl2pHzGi/scAQuxsadH5Ui3VTR8xFr6NaqzoT
 gPEwVBmhu+YUBehU3eBmqCEtXOFHXY4gnl1NmqOE+9Ndj4EeKljY8lDwknV/iBQHGr6v
 9h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VUVejRK81rsj4L29tUqUpPwwe85/JVUx2UgkVy5ibcg=;
 b=TxhjcUT97DFcdF+IyM65O4t74vLck4Rk16iaPlFOLWQzibr4Swb99D+bKyKu4DP+M/
 5SUaQDgDa9h9Zv3LQhoymqiW70i0Eqpr/mCgCIeAiqrI+oqAqIHx+gou7PEJBC6iTJcC
 GOc3SEH6jayyyKp0pXrC9LHtzUjUZUkECpawZulAOAAEaiHLJpajfK5UhDJrh2amm3Kd
 b1T/J1dTE6dEPl1KweLa8mhzN/R+Yh5cRQzNTgGmManD4+vH0g8g5frkNsKPd10h15bI
 zYeex4rBA4lYuqoj7UaZ+/nidCvWxnyd2tQMpN+SiMefFEv6V4x0ghdrdGaGQYNSXKco
 v2jg==
X-Gm-Message-State: AOAM531CYQApexL9CUduAhwuru2+18MdyBPRwc+VwWSlxdosaY/BVPO+
 z47sDbZWOJyITDLUbVq3JkBLRyqy0dvZRjxU
X-Google-Smtp-Source: ABdhPJyflQgaLjH2wchABq9WgVT3skzgbmPBYEqt1SzdNnkmlh7JC8ADIA0Fd16osSOj5YiyEQqGVg==
X-Received: by 2002:a17:90a:43a7:: with SMTP id
 r36mr830742pjg.189.1612318581275; 
 Tue, 02 Feb 2021 18:16:21 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] tcg/mips: Split out constraint sets to
 tcg-target-con-set.h
Date: Tue,  2 Feb 2021 16:15:44 -1000
Message-Id: <20210203021550.375058-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 tcg/mips/tcg-target-con-set.h | 36 +++++++++++++
 tcg/mips/tcg-target.h         |  1 +
 tcg/mips/tcg-target.c.inc     | 96 +++++++++++------------------------
 3 files changed, 66 insertions(+), 67 deletions(-)
 create mode 100644 tcg/mips/tcg-target-con-set.h

diff --git a/tcg/mips/tcg-target-con-set.h b/tcg/mips/tcg-target-con-set.h
new file mode 100644
index 0000000000..fe3e868a2f
--- /dev/null
+++ b/tcg/mips/tcg-target-con-set.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define MIPS target-specific constraint sets.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
+C_O0_I2(rZ, r)
+C_O0_I2(rZ, rZ)
+C_O0_I2(SZ, S)
+C_O0_I3(SZ, S, S)
+C_O0_I3(SZ, SZ, S)
+C_O0_I4(rZ, rZ, rZ, rZ)
+C_O0_I4(SZ, SZ, S, S)
+C_O1_I1(r, L)
+C_O1_I1(r, r)
+C_O1_I2(r, 0, rZ)
+C_O1_I2(r, L, L)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
+C_O1_I2(r, r, rIK)
+C_O1_I2(r, r, rJ)
+C_O1_I2(r, r, rWZ)
+C_O1_I2(r, rZ, rN)
+C_O1_I2(r, rZ, rZ)
+C_O1_I4(r, rZ, rZ, rZ, 0)
+C_O1_I4(r, rZ, rZ, rZ, rZ)
+C_O2_I1(r, r, L)
+C_O2_I2(r, r, L, L)
+C_O2_I2(r, r, r, r)
+C_O2_I4(r, r, rZ, rZ, rN, rN)
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c2c32fb38f..e520a9d6e3 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -207,5 +207,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
+#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 432d38a010..ab55f3109b 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2112,52 +2112,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef r_L = { .args_ct_str = { "r", "L" } };
-    static const TCGTargetOpDef rZ_r = { .args_ct_str = { "rZ", "r" } };
-    static const TCGTargetOpDef SZ_S = { .args_ct_str = { "SZ", "S" } };
-    static const TCGTargetOpDef rZ_rZ = { .args_ct_str = { "rZ", "rZ" } };
-    static const TCGTargetOpDef r_r_L = { .args_ct_str = { "r", "r", "L" } };
-    static const TCGTargetOpDef r_L_L = { .args_ct_str = { "r", "L", "L" } };
-    static const TCGTargetOpDef r_r_ri = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_rI = { .args_ct_str = { "r", "r", "rI" } };
-    static const TCGTargetOpDef r_r_rJ = { .args_ct_str = { "r", "r", "rJ" } };
-    static const TCGTargetOpDef SZ_S_S = { .args_ct_str = { "SZ", "S", "S" } };
-    static const TCGTargetOpDef SZ_SZ_S
-        = { .args_ct_str = { "SZ", "SZ", "S" } };
-    static const TCGTargetOpDef SZ_SZ_S_S
-        = { .args_ct_str = { "SZ", "SZ", "S", "S" } };
-    static const TCGTargetOpDef r_rZ_rN
-        = { .args_ct_str = { "r", "rZ", "rN" } };
-    static const TCGTargetOpDef r_rZ_rZ
-        = { .args_ct_str = { "r", "rZ", "rZ" } };
-    static const TCGTargetOpDef r_r_rIK
-        = { .args_ct_str = { "r", "r", "rIK" } };
-    static const TCGTargetOpDef r_r_rWZ
-        = { .args_ct_str = { "r", "r", "rWZ" } };
-    static const TCGTargetOpDef r_r_r_r
-        = { .args_ct_str = { "r", "r", "r", "r" } };
-    static const TCGTargetOpDef r_r_L_L
-        = { .args_ct_str = { "r", "r", "L", "L" } };
-    static const TCGTargetOpDef dep
-        = { .args_ct_str = { "r", "0", "rZ" } };
-    static const TCGTargetOpDef movc
-        = { .args_ct_str = { "r", "rZ", "rZ", "rZ", "0" } };
-    static const TCGTargetOpDef movc_r6
-        = { .args_ct_str = { "r", "rZ", "rZ", "rZ", "rZ" } };
-    static const TCGTargetOpDef add2
-        = { .args_ct_str = { "r", "r", "rZ", "rZ", "rN", "rN" } };
-    static const TCGTargetOpDef br2
-        = { .args_ct_str = { "rZ", "rZ", "rZ", "rZ" } };
-    static const TCGTargetOpDef setc2
-        = { .args_ct_str = { "r", "rZ", "rZ", "rZ", "rZ" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -2190,7 +2149,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_extract_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
@@ -2199,14 +2158,14 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &rZ_r;
+        return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
-        return &r_r_rJ;
+        return C_O1_I2(r, r, rJ);
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
-        return &r_rZ_rN;
+        return C_O1_I2(r, rZ, rN);
     case INDEX_op_mul_i32:
     case INDEX_op_mulsh_i32:
     case INDEX_op_muluh_i32:
@@ -2225,20 +2184,20 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_remu_i64:
     case INDEX_op_nor_i64:
     case INDEX_op_setcond_i64:
-        return &r_rZ_rZ;
+        return C_O1_I2(r, rZ, rZ);
     case INDEX_op_muls2_i32:
     case INDEX_op_mulu2_i32:
     case INDEX_op_muls2_i64:
     case INDEX_op_mulu2_i64:
-        return &r_r_r_r;
+        return C_O2_I2(r, r, r, r);
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
-        return &r_r_rIK;
+        return C_O1_I2(r, r, rIK);
     case INDEX_op_or_i32:
     case INDEX_op_xor_i32:
     case INDEX_op_or_i64:
     case INDEX_op_xor_i64:
-        return &r_r_rI;
+        return C_O1_I2(r, r, rI);
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
@@ -2249,44 +2208,47 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sar_i64:
     case INDEX_op_rotr_i64:
     case INDEX_op_rotl_i64:
-        return &r_r_ri;
+        return C_O1_I2(r, r, ri);
     case INDEX_op_clz_i32:
     case INDEX_op_clz_i64:
-        return &r_r_rWZ;
+        return C_O1_I2(r, r, rWZ);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        return &dep;
+        return C_O1_I2(r, 0, rZ);
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return &rZ_rZ;
+        return C_O0_I2(rZ, rZ);
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        return use_mips32r6_instructions ? &movc_r6 : &movc;
-
+        return (use_mips32r6_instructions
+                ? C_O1_I4(r, rZ, rZ, rZ, rZ)
+                : C_O1_I4(r, rZ, rZ, rZ, 0));
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        return &add2;
+        return C_O2_I4(r, r, rZ, rZ, rN, rN);
     case INDEX_op_setcond2_i32:
-        return &setc2;
+        return C_O1_I4(r, rZ, rZ, rZ, rZ);
     case INDEX_op_brcond2_i32:
-        return &br2;
+        return C_O0_I4(rZ, rZ, rZ, rZ);
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? &r_L : &r_L_L);
+                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? &SZ_S : &SZ_S_S);
+                ? C_O0_I2(SZ, S) : C_O0_I3(SZ, S, S));
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? &r_L
-                : TARGET_LONG_BITS == 32 ? &r_r_L : &r_r_L_L);
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, L)
+                : C_O2_I2(r, r, L, L));
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? &SZ_S
-                : TARGET_LONG_BITS == 32 ? &SZ_SZ_S : &SZ_SZ_S_S);
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(SZ, S)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(SZ, SZ, S)
+                : C_O0_I4(SZ, SZ, S, S));
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


