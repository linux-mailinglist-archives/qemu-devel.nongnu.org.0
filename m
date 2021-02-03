Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3D30D191
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:32:04 +0100 (CET)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77xZ-0000iV-7P
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iT-0007sf-H2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:25 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iP-00014I-34
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:25 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i63so15645255pfg.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDPLJQ05GGTADfTs6BheNhHZIws3/52urkp+p4khmC8=;
 b=vZcrkPzA0lxDnmXGDqS2RvoxkhFda5SiOkdxghJ7twyNzdF/aLVnDbWIfWxGanNxr2
 ZpDL3TFYJGDpQjyLOCdskwT6Qe2Y9wDHhXNiPekwvDwoXEzeZvT8hoApRqpIi2ygUvI2
 pBX7V5+q5LPNtCO4ZHF02jUF5kaJsJ6UaKmT1c5+7nyyJrG+sMnns2OjR2AoYaOMBAzO
 F7Mm1MrIJmWStEwu9gm4bXCfKiYKN77BEleWpKfLXFrjrjMMhOZhuAraaxDWCV9TF0JN
 oA9QxoZtTmDd4D4S1X6ICcK9lYOiP0c75uDGAbgrA48Qm7Tc08oJzv3LzeV1+sWZW4Zp
 oWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDPLJQ05GGTADfTs6BheNhHZIws3/52urkp+p4khmC8=;
 b=lhVyIAvXcJTk6TXeASevYPDfwcjcS2P4JO971IxZn787PK7qI4E/DPjdGxA7K/GLTT
 7O2STp5XTBOvnidjsfaIxth6MUkOnN87fPDhvsRN7XFIkqczyzwXR3sSgQBvJckFla5s
 1dhNy7Q7s0N+zJz/Om2epzVFOS84Nj1yQBI/L1cE9HVONKzY/eeWZUvgIUgzNS+yct1u
 PahTy+xL1SxZJJJfj5xfIxlfKmkdjxUljhXjo5mdj6k/9T2BEQfk/Vec54OBx0KukByI
 S0JeKyt5qVr2c7bMqoqOC4dE7u7kD8sOwXhh7izi9BmPZ+ein5z5iZ++PnXBYzTpJlI0
 UYMA==
X-Gm-Message-State: AOAM531gAbjPqSeK5c8dHkmuRr9VS52cbYUe5XHqfgBg46O0qJYOSYKn
 HkOUMm7Z1vrGPlTzt/eV1KyGCQ/yoKBecS7d
X-Google-Smtp-Source: ABdhPJwhXyRxPp08wKj6iCqD0Xbs32NBSD4M4Zx/asKX3CShr9unqPSWA1Ww2c1K3F+h2Fval9dkKg==
X-Received: by 2002:a05:6a00:8d4:b029:1b7:7ad9:4864 with SMTP id
 s20-20020a056a0008d4b02901b77ad94864mr827586pfu.34.1612318579788; 
 Tue, 02 Feb 2021 18:16:19 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/24] tcg/arm: Split out constraint sets to
 tcg-target-con-set.h
Date: Tue,  2 Feb 2021 16:15:43 -1000
Message-Id: <20210203021550.375058-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org
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


