Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20E3DA245
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:38:55 +0200 (CEST)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94NI-0007Aw-01
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9415-0000sS-8c
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-0001Bs-Ne
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so5028522wmd.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TWbXHhQWATq+c4AfBX4ejJAoMYSLeEhYRoWPRhuFdZs=;
 b=vRa7t17n2lMHnGbTTomig70fxVnpv8ZwKvsm+vYye6ZuoiRSHe/hDlCqecO3lGgV1t
 yW2HZFUnvMcsDM6LPYOCGuPF5r/uq8yD10DPRloQ8mmNLKxi+Fn1innJQP9GbICKEtRu
 /a+iJPFIlrbvkwCr13axrncnfHLppZbmqBr511Lq2ONzSVsGYiML+AG1yH5tji30SvgG
 C2Nja8ZQwJhS76dRthFTFLpL2RVGDKr1XtSK8JSGl9rhrJ94ST5i2l9aoJM71rphQnV0
 oGspbynXkErD4hormwKqWWnIAFFGve4hEzwx6qmNlOPqiMjuOaGoeHlHAZrF+F/Xb1Ri
 nD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWbXHhQWATq+c4AfBX4ejJAoMYSLeEhYRoWPRhuFdZs=;
 b=Z59UAun9BMFmCbwFrQ7sKy754sWd16Vuum7B4XdgQveyKtCOZJrq7jZ/e39T9Yw4XW
 ipNApA1+IMwuuvHWvCjlsPI0Nfgra3EzWmbsitiBKK1V9+z26mreRWpWsVC6gAqG/QBD
 LvfZ+F12dHoz68xsN1Jc+L9H9f8OgRqzFh2nYT8fuotEKkFjg0TqW4wE7a68v8uBGXeE
 RdfHASFt736WzirGpIbnx68WrimxNiJyB7gJyhHZkAz9kvvQrMA2gxGF8YVb7BCCidsz
 GiBnGROpVQiiJuhhgULwDo6JnQXupjaxIAn2dHDD5DupcewUnsvRKHHI9Ws+WPRy3C30
 QNXg==
X-Gm-Message-State: AOAM532AWkT7TujE+6HppNSBD/cOukRCV8RaeAFMV8Q/OtFG8GUrIxsQ
 wr/WuTe4zLhXuD0pkQtEmrMNI/oNWS9fIA==
X-Google-Smtp-Source: ABdhPJwsQ88x0AC3frqw3HXl5uYZE84tMzH5K4Ss3YDViy8O6OG492eQsGty3wwyxDzp/zf7lhSBMw==
X-Received: by 2002:a05:600c:1c09:: with SMTP id
 j9mr8753804wms.183.1627557330559; 
 Thu, 29 Jul 2021 04:15:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 19/53] target/arm: Implement MVE shift-by-scalar
Date: Thu, 29 Jul 2021 12:14:38 +0100
Message-Id: <20210729111512.16541-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the MVE instructions which perform shifts by a scalar.
These are VSHL T2, VRSHL T2, VQSHL T1 and VQRSHL T2.  They take the
shift amount in a general purpose register and shift every element in
the vector by that amount.

Mostly we can reuse the helper functions for shift-by-immediate; we
do need two new helpers for VQRSHL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 +++++++
 target/arm/mve.decode      | 23 ++++++++++++++++---
 target/arm/mve_helper.c    |  2 ++
 target/arm/translate-mve.c | 46 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 715b1bbd012..0ee5ea3cabd 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -414,6 +414,14 @@ DEF_HELPER_FLAGS_4(mve_vrshli_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshli_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqrshli_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshli_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshli_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrshli_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshli_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vshllbsb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vshllbsh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vshllbub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 226b74790b3..eb26b103d12 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -39,6 +39,7 @@
 &viwdup qd rn rm size imm
 &vcmp qm qn size mask
 &vcmp_scalar qn rm size mask
+&shl_scalar qda rm size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -88,6 +89,8 @@
 @2_shr_w .... .... .. 1 ..... .... .... .... .... &2shift qd=%qd qm=%qm \
          size=2 shift=%rshift_i5
 
+@shl_scalar .... .... .... size:2 .. .... .... .... rm:4 &shl_scalar qda=%qd
+
 # Vector comparison; 4-bit Qm but 3-bit Qn
 %mask_22_13      22:1 13:3
 @vcmp    .... .... .. size:2 qn:3 . .... .... .... .... &vcmp qm=%qm mask=%mask_22_13
@@ -320,7 +323,23 @@ VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_no
 
 VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
 VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
-VMUL_scalar      1110 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
+
+{
+  VSHL_S_scalar   1110 1110 0 . 11 .. 01 ... 1 1110 0110 .... @shl_scalar
+  VRSHL_S_scalar  1110 1110 0 . 11 .. 11 ... 1 1110 0110 .... @shl_scalar
+  VQSHL_S_scalar  1110 1110 0 . 11 .. 01 ... 1 1110 1110 .... @shl_scalar
+  VQRSHL_S_scalar 1110 1110 0 . 11 .. 11 ... 1 1110 1110 .... @shl_scalar
+  VMUL_scalar     1110 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
+}
+
+{
+  VSHL_U_scalar   1111 1110 0 . 11 .. 01 ... 1 1110 0110 .... @shl_scalar
+  VRSHL_U_scalar  1111 1110 0 . 11 .. 11 ... 1 1110 0110 .... @shl_scalar
+  VQSHL_U_scalar  1111 1110 0 . 11 .. 01 ... 1 1110 1110 .... @shl_scalar
+  VQRSHL_U_scalar 1111 1110 0 . 11 .. 11 ... 1 1110 1110 .... @shl_scalar
+  VBRSR           1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
+}
+
 VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
@@ -340,8 +359,6 @@ VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
                   size=%size_28
 }
 
-VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
-
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ab02a1e60f4..ac608fc524b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1334,6 +1334,8 @@ DO_2SHIFT_SAT_S(vqshli_s, DO_SQSHL_OP)
 DO_2SHIFT_SAT_S(vqshlui_s, DO_SUQSHL_OP)
 DO_2SHIFT_U(vrshli_u, DO_VRSHLU)
 DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
+DO_2SHIFT_SAT_U(vqrshli_u, DO_UQRSHL_OP)
+DO_2SHIFT_SAT_S(vqrshli_s, DO_SQRSHL_OP)
 
 /* Shift-and-insert; we always work with 64 bits at a time */
 #define DO_2SHIFT_INSERT(OP, ESIZE, SHIFTFN, MASKFN)                    \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b56c91db2ab..44731fc4eb7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1003,6 +1003,52 @@ DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 DO_2SHIFT(VSRI, vsri, false)
 DO_2SHIFT(VSLI, vsli, false)
 
+static bool do_2shift_scalar(DisasContext *s, arg_shl_scalar *a,
+                             MVEGenTwoOpShiftFn *fn)
+{
+    TCGv_ptr qda;
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qda) ||
+        a->rm == 13 || a->rm == 15 || !fn) {
+        /* Rm cases are UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qda = mve_qreg_ptr(a->qda);
+    rm = load_reg(s, a->rm);
+    fn(cpu_env, qda, qda, rm);
+    tcg_temp_free_ptr(qda);
+    tcg_temp_free_i32(rm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_2SHIFT_SCALAR(INSN, FN)                                      \
+    static bool trans_##INSN(DisasContext *s, arg_shl_scalar *a)        \
+    {                                                                   \
+        static MVEGenTwoOpShiftFn * const fns[] = {                     \
+            gen_helper_mve_##FN##b,                                     \
+            gen_helper_mve_##FN##h,                                     \
+            gen_helper_mve_##FN##w,                                     \
+            NULL,                                                       \
+        };                                                              \
+        return do_2shift_scalar(s, a, fns[a->size]);                    \
+    }
+
+DO_2SHIFT_SCALAR(VSHL_S_scalar, vshli_s)
+DO_2SHIFT_SCALAR(VSHL_U_scalar, vshli_u)
+DO_2SHIFT_SCALAR(VRSHL_S_scalar, vrshli_s)
+DO_2SHIFT_SCALAR(VRSHL_U_scalar, vrshli_u)
+DO_2SHIFT_SCALAR(VQSHL_S_scalar, vqshli_s)
+DO_2SHIFT_SCALAR(VQSHL_U_scalar, vqshli_u)
+DO_2SHIFT_SCALAR(VQRSHL_S_scalar, vqrshli_s)
+DO_2SHIFT_SCALAR(VQRSHL_U_scalar, vqrshli_u)
+
 #define DO_VSHLL(INSN, FN)                                      \
     static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
     {                                                           \
-- 
2.20.1


