Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB530D175
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:26:57 +0100 (CET)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77se-0003Jh-RU
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iZ-00089A-D2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:31 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iW-00016x-Gg
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:31 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l18so3641328pji.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MrxaSWspF3/rQVGucPF5ZdPBIWEarIo2ZYIqCUeIYp8=;
 b=FaldZY9jribaBvfvqQpcGUzzSHcwplxxmeyTaFBOXIc6Z1P7w0kM+gQrZtCADTTrVm
 +OTv+1MQZb/S3qhXsMO6LRoP32p1yDo5HAZbLzCMnWUC7VIOv43kOdBOifBwMdKtz8yU
 Ux6kusQcfjSxYQPBntYb7vPg3ldUNuonZsFnVXDD/WQQRytOUvWttu0wG6T0Q4xTbZWT
 v2ScPEhoO7w/x3e6DcpFjmrCdYD/ChW7ELQMUClSDAt5CKJ0TJDfjl1KED+MTgu0tqnH
 5Rq6XTi6diqm4N2G6AY529TLctTvKmkObLm6Os1ukMLhrCNsGw/utsXMEqzr1sUsxD/m
 sR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MrxaSWspF3/rQVGucPF5ZdPBIWEarIo2ZYIqCUeIYp8=;
 b=Cd+vzJgnnrHvUyxRivN7UxKzGrXWsjg5/gAqNZx7Jbea2W8+s9DS2x4vMTej0Qj23X
 dUEJ8RtswxNw8FhWrQBJIEVLaz0FrjQxkR3n4lQPlkW58TxvlGur8jgW1Cnuow7OdwMN
 GgsCU7mkC+xKJboJ6T5UIzUSCIO/wmSC2CcAEnvgy8EJzZAMZeSxtvStS31D37SqtH/m
 TfpIAUcTEDAA/pW0mEqVrFgbc5WwtD0awJSByp9vCfz7vPriJy5ptR2Gwdv08z8FSl4k
 Lwh2crum7SbJWQ2Z4eZMLGFtkb7Tkcmusoie9gjyjS+zRCahQcBPvKxxEZvnNX6sSiSY
 mxfw==
X-Gm-Message-State: AOAM532dLfMSIgOAzi47pEzPIXEB/trR1vFopG1xo6q2RU/DDCHyOIF7
 srRGF4OE1jCuRs0mrwaOTCkTex/2TR3NhiCp
X-Google-Smtp-Source: ABdhPJyKmg48qVlzE6k2voo+YTESDKssCZYAR6k7q79OmXUmEFsdd4F8QBhtjkpqUwcSvh22XoKf6A==
X-Received: by 2002:a17:90b:2352:: with SMTP id
 ms18mr829512pjb.138.1612318587213; 
 Tue, 02 Feb 2021 18:16:27 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/24] tcg/sparc: Split out constraint sets to
 tcg-target-con-set.h
Date: Tue,  2 Feb 2021 16:15:48 -1000
Message-Id: <20210203021550.375058-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index e291eb0b95..3d50f985c6 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1573,40 +1573,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -1615,12 +1586,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -1636,18 +1607,18 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -1658,13 +1629,13 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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
@@ -1680,39 +1651,39 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
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


