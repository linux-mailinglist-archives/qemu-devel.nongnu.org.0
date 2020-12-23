Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1A2E18E9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:28:30 +0100 (CET)
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxdO-0006fY-0q
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEP-0008Tl-KB
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:41 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxEB-0000Q4-JR
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id q4so8596856plr.7
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X758HD6K1J6obb9plyMDfKBI50GFn/H1bBv6I/APYbM=;
 b=Er2JoGa/KxiBTlhJjrZ0DNAnCKsHKrwM3JuCQgsGqmij6wIzATl26lelqage4oFBDs
 0hQEQtArB/6n88nq8f1FJe2qkbUa+O4CzXh2x8JjZycmCdijkkWB1uWmiXyeGeo2jwO9
 3XE3KKByV9sH6F6tJt60S/U7kLSeNhb3/hdFt9LN8g+UlMjx5FQfkigj/eKy7qpsv6Yv
 /Vvro0frIsxXw5u2C0lhcweG2wDDTwj5w/4dM/Fv2wEDPYU7yJafVYstjPRjqiHLOUQY
 f9qeZDpRMwh3hzDqXaAWJi85meXo1Oavj1ZjXjqperAkZV28hr1Uo2z9iG4OTNioWfRB
 5Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X758HD6K1J6obb9plyMDfKBI50GFn/H1bBv6I/APYbM=;
 b=tNnLAf4TSgOyDmrf0Df7WUzbsPrymPeo1ZjCOLR8jJY/8jdxmgWjsaTR7r45K3UqR1
 p7kWbqjh+BNcmfxu/QmM4A3IFp9dSWkU7wD42H3K8NtHmEk4PCDISvGuabGohSARJwmD
 UD3UjyrSBSh6oUV4rru8Mlygu3XAgdZ6kplo/swwVcKLZheFlQYIKG6aiV7XMytIssab
 OidkMHJ/AUJWN8E8agUoPp2s/ILDTSU4o9/Af0VtuJm4ioJ7Nk1qe7zWLds9XjlPb1+u
 vnkWE0lhXBBNs5PyEtL83Z/eK5EU0w6bWjeqXxDifjHkJ51P29OMjSP9DVe957pqXWSu
 OXqA==
X-Gm-Message-State: AOAM532sqfdQYN8FiCSaLeh7f0pNWeTBb55Y8a053nkbwKdvtGgb+hDc
 b8jBl+Al+GUXV0UG+eVHct5TaeUlDijOyA==
X-Google-Smtp-Source: ABdhPJwQx0zCNLpiCYhG50QAOc0YJNe77xM9Q6oXwd74sN3eZp8zDuSrJprEDULzRoI4LJSm2V4KMw==
X-Received: by 2002:a17:902:820a:b029:da:f380:8629 with SMTP id
 x10-20020a170902820ab02900daf3808629mr2106726pln.54.1608703345558; 
 Tue, 22 Dec 2020 22:02:25 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] tcg/mips: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:01:58 -0800
Message-Id: <20201223060204.576856-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 tcg/mips/tcg-target-conset.h | 31 ++++++++++++
 tcg/mips/tcg-target.h        |  1 +
 tcg/mips/tcg-target.c.inc    | 96 +++++++++++-------------------------
 3 files changed, 61 insertions(+), 67 deletions(-)
 create mode 100644 tcg/mips/tcg-target-conset.h

diff --git a/tcg/mips/tcg-target-conset.h b/tcg/mips/tcg-target-conset.h
new file mode 100644
index 0000000000..94f8f5f683
--- /dev/null
+++ b/tcg/mips/tcg-target-conset.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * MIPS target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
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
index c6b091d849..688d691cda 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -217,5 +217,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
+#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index d0b674582a..2ec1d6ac05 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2104,52 +2104,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static int tcg_target_op_def(TCGOpcode op)
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
@@ -2182,7 +2141,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_extract_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
@@ -2191,14 +2150,14 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -2217,20 +2176,20 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -2241,44 +2200,47 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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


