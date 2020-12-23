Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E325D2E18D5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:20:23 +0100 (CET)
Received: from localhost ([::1]:60410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxVV-0007qa-GS
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxET-0008WN-Bd
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:45 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxED-0000QE-QY
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:45 -0500
Received: by mail-pf1-x429.google.com with SMTP id t22so9787553pfl.3
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I5Jif50OCQX6bqPE3vNJ6iG9LjkUrr2qR3pVG1LDHQI=;
 b=IDWfEujjhzS2HMDPMraEVXOnImNegx9XkYCnPJnt1RsRj00NYcwEbNe404PIUUNUEM
 po1KTbHB4W29mS9cIhCdr4AbTQeTD+edZYJRQaMwOUjj7BrYwLNc9YO/49csNorqxcrA
 u+mm4Tr0Bfqa61sde499E9brTsELdMgNVIutqgLw7N9wWpeI4iAviMB2a/JoGnJMMjDD
 gsrwfIawNrr5awn1um+UbFms+bJxoDS1t+/lJnorp10ZGhw4n27CrogRegRwBSPxEsAh
 RiWw2MjuW9edO8fIfdV70hce3wwwcd+qsOCQEgwKqPUcPdFCAF9GZcMqkyv+HOoN3J6h
 QmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5Jif50OCQX6bqPE3vNJ6iG9LjkUrr2qR3pVG1LDHQI=;
 b=Knqz8xWezTLf++W+lUDNVbMg9CM7jSEexxHfoNt05Xga/Rvv6sMResmiyQseFV3xv0
 hTA2OHgfriSw2DlUNXUL4QtJBmQqhBrle1Ms4cmC5AFeDeevQjqABIy4+7e4NlLlc96D
 /gc/t7NEMo/EZq7IaDlzPv2ZVc9XKG9v4b5sAMHC0xLmsy4OsOfDRilGKgb7l+swZO+4
 GV3679O05JW2VMYCBLgPNamynIIM8f3zTJEJmcXSvyGmLgW7JL4yxiZEssC5RkkUKXwy
 J5Ih48P9gCxSAeVlSW0JyqSuAGuxaKv0yx7YhYuaxdqAQxXDnXEy0bZgjDqP6m6VAHuV
 Zk0A==
X-Gm-Message-State: AOAM5317kNUfimt1Y9pIt+paierTJjXFegxvwoHqbfrHVI+Nx+h4mm38
 zySTYigvYZJT0GQbL9v4zMnXYMlMWaCAtQ==
X-Google-Smtp-Source: ABdhPJy1oDzqyTFM3ZfrZ5EPCYEwMxk+BgXSz9KeGx2idoYDpv26Mj1X0krrSvRQPixa2RDzzJtGuA==
X-Received: by 2002:a63:da50:: with SMTP id l16mr7704970pgj.447.1608703346806; 
 Tue, 22 Dec 2020 22:02:26 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/22] tcg/ppc: Convert to tcg-target-conset.h
Date: Tue, 22 Dec 2020 22:01:59 -0800
Message-Id: <20201223060204.576856-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
 tcg/ppc/tcg-target-conset.h |  37 ++++++++++
 tcg/ppc/tcg-target.h        |   1 +
 tcg/ppc/tcg-target.c.inc    | 136 +++++++++++++++---------------------
 3 files changed, 94 insertions(+), 80 deletions(-)
 create mode 100644 tcg/ppc/tcg-target-conset.h

diff --git a/tcg/ppc/tcg-target-conset.h b/tcg/ppc/tcg-target-conset.h
new file mode 100644
index 0000000000..448ac6d155
--- /dev/null
+++ b/tcg/ppc/tcg-target-conset.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * PowerPC target-specific constaint sets.
+ * Copyright (c) 2020 Linaro
+ */
+
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
index be10363956..c958faffb7 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -185,5 +185,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSET_H
 
 #endif
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index c97f95f3cf..eb8a626ad4 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3425,62 +3425,17 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     va_end(va);
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static int tcg_target_op_def(TCGOpcode op)
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
@@ -3496,10 +3451,6 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -3512,7 +3463,16 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -3535,10 +3495,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -3553,55 +3515,63 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -3631,22 +3601,28 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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


