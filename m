Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE1939C120
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:18:26 +0200 (CEST)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGGv-00031V-LG
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB2-0005qu-Om
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAz-0005L3-Jh
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:20 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so6510079pjq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E/xFspLGGmMrOSgKi+b5ozdnb0WY/ec8JsV2Fe/tYvQ=;
 b=czDZaoN50Bdic6v/y4WhcxFavXDdkPA7MuOspwBC9LOjlL3zwDsMcCdieZoXszcumE
 4B7Z1bENY/pnbp8/e+11H+8IUQXvi3AgFvQmnVU1uKhNgM2G/4FSmiDd0eEsBIwezKKh
 GWuTW+Ozgp7YvUITNJBujjjvxI9SGvQylWYBr9biJvh4aZ/a/5LDx5hPCOElN//UQ1Jk
 JLLryk+E/FQ3YKsVvzjfrTb62XLX4IXV1v/8FBk8bNgx4/969FrdYPGNo2g4innEoNLC
 P002iCHpnRjAfevc+4BDux46uyD9ecaEacJuHSobR1/3sALyramOybcWFUpru2ceetC2
 xPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/xFspLGGmMrOSgKi+b5ozdnb0WY/ec8JsV2Fe/tYvQ=;
 b=fcfTzYJU1zTKjUEhQnmG/vgwrAHinb+EE5cuFgoyXjNfH9BR3Z0QuBu5/7Ob5/evWW
 RZ7NYvlFbYM+54mZ8YSae92S9/CBRjrB/W2vPuf/yAMDjw702GK00kIW4nRu679lVsaU
 toRwXxrdi0XRc+GwnLu+EmX3UyyyPm7EdJdbw2VsOyk5RyLdAlCG3l0b8d1UEx66OTC7
 UQHlC5BJsiU6bLvBfE0PsAGDJHZAqHyIroh3VR7g8xHIVl3um1csiSKthJnPbqF2b1RA
 +aBmFWn8D259VWyYVW2MNQ/wo1flCztut3pDMV4cN8Kf2NDKPDA0Ho6h1ey9gvt1TuFn
 m3Mg==
X-Gm-Message-State: AOAM53107R6FS6A+sKGZLkH7ZAuIMuQ9RRIoCbFbs70ei7LKJodTE+W6
 QqNPg0nM8ZwbaLGlJfesH5MK7TlozKqHMA==
X-Google-Smtp-Source: ABdhPJyf+lyLCiYS3sb2dTFjs1UHChi7RGW6xuCSgRvT7YlTfLjhExHUrp1zrI8SGC1Q5EH+WM7zwA==
X-Received: by 2002:a17:90a:6e07:: with SMTP id
 b7mr18360065pjk.7.1622837536352; 
 Fri, 04 Jun 2021 13:12:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] tcg/arm: Implement TCG_TARGET_HAS_mul_vec
Date: Fri,  4 Jun 2021 13:12:04 -0700
Message-Id: <20210604201210.920136-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
 tcg/arm/tcg-target.h     | 2 +-
 tcg/arm/tcg-target.c.inc | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index cfbadad72c..94d768f249 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -166,7 +166,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
-#define TCG_TARGET_HAS_mul_vec          0
+#define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          0
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index d21aaab6f7..b94e6ed0f3 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -183,6 +183,7 @@ typedef enum {
     INSN_VORN      = 0xf2300110,
     INSN_VORR      = 0xf2200110,
     INSN_VSUB      = 0xf3000800,
+    INSN_VMUL      = 0xf2000910,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2394,6 +2395,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I1(w, w);
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
         return C_O1_I2(w, w, w);
@@ -2755,6 +2757,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_add_vec:
         tcg_out_vreg3(s, INSN_VADD, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_mul_vec:
+        tcg_out_vreg3(s, INSN_VMUL, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
@@ -2871,6 +2876,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_neg_vec:
         return vece < MO_64;
     default:
-- 
2.25.1


