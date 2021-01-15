Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5A2F8787
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:20:39 +0100 (CET)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WWM-0002rv-JH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHl-0004Cg-LF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:33 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHi-0004Jx-Bf
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:33 -0500
Received: by mail-pf1-x434.google.com with SMTP id w2so6237530pfc.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7kxH7RuEf3QSLkGI5/6YiWtQccaxOZrQsfsOEoYgYak=;
 b=FMLiWxBAAKBFCJBElRVPw5m7xSYdeY7/CPMVAkk0CKOL9fboF/nbEdRlEQd8EqLXUe
 7Q8ZKAs5r76eQvZkshaquNeaz4VJiC5l8OtnVrNUVrmzgTvgyzOngGd+rFXz7ELPh3MW
 hp5LodBJTBZ+rl7MR3hMDjNC4MpAZPohs9yK0v/eEYM0aOtNL2xigVwREhoaG+6V1SlD
 ShZIHXREM8uUU6KdD9TtzDrnhD/uZI9GzQXTH8EUcbLlCCzAihNkTDO36068sVLpTcPx
 HGdy+c3KedN51MnUmCSJYLge+jkAQlEVZLbAgUiCpM1ahEHqAd6xAiUGxznfvjmdXLST
 zrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kxH7RuEf3QSLkGI5/6YiWtQccaxOZrQsfsOEoYgYak=;
 b=HDJXJVciynzczX1sC7kmcZSXx8W6F2F1A+vB1Bs+4/1dMxOt+08QZyzGRwkuVco6Zn
 TBvsjluxBDV2rS+Jt05IVfgTmKFwCewBeb5MFgO5ns7V9q/kFs5t1JmrSWNYQ3Tur1f6
 X9CL5JMf9GvcgKu49wGaAh1dDiJwaHUbldF2dcM+BR/aAWntpK6+Cpa+rtdxtjsix7i7
 L5c8g2tz01TG/Jb0MyNQlJZXATA/FJRgbeXTVXxGp1hq9sI9IozID/LIvnQSEoR3zaMG
 6eSaEu90Gfa0IYXaFOtQZb7vfYHhrcFsJxmGLeGfYIP/XWv2UIjJy7QLNZGe4Nir/KiQ
 tctg==
X-Gm-Message-State: AOAM5301os4I2kNTYStVsKXfYRBfauIc3kvln9W9sfTC1IeuFG9qHcBY
 GBfzw+/N9RTUOvzk51fSQL6hVSORabLIQ7/r
X-Google-Smtp-Source: ABdhPJw64+fFTyl3ClmHdggXRKJqnmpX0r4Syr2cGp+qMROWypq6ncHyfmB9pP0kG+osSyls6wckoQ==
X-Received: by 2002:a62:c312:0:b029:1a9:19c7:a8e with SMTP id
 v18-20020a62c3120000b02901a919c70a8emr14625847pfg.74.1610744727952; 
 Fri, 15 Jan 2021 13:05:27 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/22] tcg/sparc: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 15 Jan 2021 11:04:54 -1000
Message-Id: <20210115210456.1053477-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
 tcg/sparc/tcg-target-con-set.h | 32 +++++++++++++++
 tcg/sparc/tcg-target.h         |  1 +
 tcg/sparc/tcg-target.c.inc     | 75 +++++++++++-----------------------
 3 files changed, 56 insertions(+), 52 deletions(-)
 create mode 100644 tcg/sparc/tcg-target-con-set.h

diff --git a/tcg/sparc/tcg-target-con-set.h b/tcg/sparc/tcg-target-con-set.h
new file mode 100644
index 0000000000..3b751dc3fb
--- /dev/null
+++ b/tcg/sparc/tcg-target-con-set.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Sparc target-specific constraint sets.
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
+C_O0_I2(RZ, r)
+C_O0_I2(rZ, rJ)
+C_O0_I2(RZ, RJ)
+C_O0_I2(sZ, A)
+C_O0_I2(SZ, A)
+C_O1_I1(r, A)
+C_O1_I1(R, A)
+C_O1_I1(r, r)
+C_O1_I1(r, R)
+C_O1_I1(R, r)
+C_O1_I1(R, R)
+C_O1_I2(R, R, R)
+C_O1_I2(r, rZ, rJ)
+C_O1_I2(R, RZ, RJ)
+C_O1_I4(r, rZ, rJ, rI, 0)
+C_O1_I4(R, RZ, RJ, RI, 0)
+C_O2_I2(r, r, rZ, rJ)
+C_O2_I4(R, R, RZ, RZ, RJ, RI)
+C_O2_I4(r, r, rZ, rZ, rJ, rJ)
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index f66f5d07dc..f50e8d50ee 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -168,5 +168,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index ea2b3274d4..03f3aa6a23 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1559,40 +1559,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef R_r = { .args_ct_str = { "R", "r" } };
-    static const TCGTargetOpDef r_R = { .args_ct_str = { "r", "R" } };
-    static const TCGTargetOpDef R_R = { .args_ct_str = { "R", "R" } };
-    static const TCGTargetOpDef r_A = { .args_ct_str = { "r", "A" } };
-    static const TCGTargetOpDef R_A = { .args_ct_str = { "R", "A" } };
-    static const TCGTargetOpDef rZ_r = { .args_ct_str = { "rZ", "r" } };
-    static const TCGTargetOpDef RZ_r = { .args_ct_str = { "RZ", "r" } };
-    static const TCGTargetOpDef sZ_A = { .args_ct_str = { "sZ", "A" } };
-    static const TCGTargetOpDef SZ_A = { .args_ct_str = { "SZ", "A" } };
-    static const TCGTargetOpDef rZ_rJ = { .args_ct_str = { "rZ", "rJ" } };
-    static const TCGTargetOpDef RZ_RJ = { .args_ct_str = { "RZ", "RJ" } };
-    static const TCGTargetOpDef R_R_R = { .args_ct_str = { "R", "R", "R" } };
-    static const TCGTargetOpDef r_rZ_rJ
-        = { .args_ct_str = { "r", "rZ", "rJ" } };
-    static const TCGTargetOpDef R_RZ_RJ
-        = { .args_ct_str = { "R", "RZ", "RJ" } };
-    static const TCGTargetOpDef r_r_rZ_rJ
-        = { .args_ct_str = { "r", "r", "rZ", "rJ" } };
-    static const TCGTargetOpDef movc_32
-        = { .args_ct_str = { "r", "rZ", "rJ", "rI", "0" } };
-    static const TCGTargetOpDef movc_64
-        = { .args_ct_str = { "R", "RZ", "RJ", "RI", "0" } };
-    static const TCGTargetOpDef add2_32
-        = { .args_ct_str = { "r", "r", "rZ", "rZ", "rJ", "rJ" } };
-    static const TCGTargetOpDef add2_64
-        = { .args_ct_str = { "R", "R", "RZ", "RZ", "RJ", "RI" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -1601,12 +1572,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld_i32:
     case INDEX_op_neg_i32:
     case INDEX_op_not_i32:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st16_i32:
     case INDEX_op_st_i32:
-        return &rZ_r;
+        return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_mul_i32:
@@ -1622,18 +1593,18 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
     case INDEX_op_setcond_i32:
-        return &r_rZ_rJ;
+        return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_brcond_i32:
-        return &rZ_rJ;
+        return C_O0_I2(rZ, rJ);
     case INDEX_op_movcond_i32:
-        return &movc_32;
+        return C_O1_I4(r, rZ, rJ, rI, 0);
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        return &add2_32;
+        return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
     case INDEX_op_mulu2_i32:
     case INDEX_op_muls2_i32:
-        return &r_r_rZ_rJ;
+        return C_O2_I2(r, r, rZ, rJ);
 
     case INDEX_op_ld8u_i64:
     case INDEX_op_ld8s_i64:
@@ -1644,13 +1615,13 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
-        return &R_r;
+        return C_O1_I1(R, r);
 
     case INDEX_op_st8_i64:
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
-        return &RZ_r;
+        return C_O0_I2(RZ, r);
 
     case INDEX_op_add_i64:
     case INDEX_op_mul_i64:
@@ -1666,39 +1637,39 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shr_i64:
     case INDEX_op_sar_i64:
     case INDEX_op_setcond_i64:
-        return &R_RZ_RJ;
+        return C_O1_I2(R, RZ, RJ);
 
     case INDEX_op_neg_i64:
     case INDEX_op_not_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
-        return &R_R;
+        return C_O1_I1(R, R);
 
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
-        return &r_R;
+        return C_O1_I1(r, R);
 
     case INDEX_op_brcond_i64:
-        return &RZ_RJ;
+        return C_O0_I2(RZ, RJ);
     case INDEX_op_movcond_i64:
-        return &movc_64;
+        return C_O1_I4(R, RZ, RJ, RI, 0);
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i64:
-        return &add2_64;
+        return C_O2_I4(R, R, RZ, RZ, RJ, RI);
     case INDEX_op_muluh_i64:
-        return &R_R_R;
+        return C_O1_I2(R, R, R);
 
     case INDEX_op_qemu_ld_i32:
-        return &r_A;
+        return C_O1_I1(r, A);
     case INDEX_op_qemu_ld_i64:
-        return &R_A;
+        return C_O1_I1(R, A);
     case INDEX_op_qemu_st_i32:
-        return &sZ_A;
+        return C_O0_I2(sZ, A);
     case INDEX_op_qemu_st_i64:
-        return &SZ_A;
+        return C_O0_I2(SZ, A);
 
     default:
-        return NULL;
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


