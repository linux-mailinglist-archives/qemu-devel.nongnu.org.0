Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09E3906F9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:55:15 +0200 (CEST)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaKo-0007VY-6X
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYev-0002qR-UC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYes-00076z-FS
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id h3so4194885wmq.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HG/P4es6COHSq66kMgazoPGPOpsJa4vei/XEaGs2NqE=;
 b=nTcVbHX20t5RbyJ5MWe8xdkExQipLY4G6Qp049GaohCYZgY+aW1fj8G6AXCSU0LepQ
 wJdiiTYtHETU80Z0LclShT1nNoxlSqykmn/jcKHjKnXQB4X9qaWG/K5pzkOT0U4g1SlT
 klIHr9OyhBQ9Dyx+hOerJBoEAcZE7CKo03bFd+vnOeHBDxRWBRH7cnYfA3oSb5byW7ch
 7tQiFahFxi2t2kzZsdSQ6RkNVuoSsodJgyHrgDGoNyrCIyky+hmtYS7UGQ/OYaIFLMX9
 j5enRpYze15AcE/xl6BDMvsiaO2IuX8MrYzQpGYBJdkC0CKo6y4XK7kOXxTVse90s9cI
 urKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HG/P4es6COHSq66kMgazoPGPOpsJa4vei/XEaGs2NqE=;
 b=URvh1pZRrBtpSIrS85hkYl3cc5p2rfTAiIkIVrIdY+Xnsl7UlOcb+9fOU1ktSKeezv
 x4/NxfryDChxjWsud8YrCsutv86EomZLt4ZRQqPmJgL/ubNAl6TY5Wi4jNY6vcXIQNVq
 K0JWkyE7K6HrlzScJqaxipLkQ8RRHIXcTCmZiLRGEoH2lRtwcWyjrSNyYUPeC/qu4ZTy
 VKUc7c4d901PREKgC7Ysmy+AiZWH/YXJFgzYrRQAeqInc+x68bkVrn4KTIf+cgu+7o9g
 gmU99k6h8vrn7lvpdfGZd9XLYGuAwvLy9qF0wTS0qBi78Niqqt8MJ7cb3BJh2Zfoxyde
 F7Xg==
X-Gm-Message-State: AOAM5332EaW0oztAOw8GoLd50frPUvyl3MWthXpk3JpKHT5dEHE7TNtZ
 3s+IiTbAQiG/96gdG13zBOnxh+3hy4P3q88Y
X-Google-Smtp-Source: ABdhPJyd2uV9PCjf0WnLfhnaDiVlcmgXFs3S4aAwtVjPRjFo0Raf7imHm21jAwMxseecpNxSgKVA5w==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr4377444wmj.128.1621955269071; 
 Tue, 25 May 2021 08:07:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 106/114] target/arm: Split out do_neon_ddda_fpst
Date: Tue, 25 May 2021 16:07:28 +0100
Message-Id: <20210525150736.32695-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Split out a helper that can handle the 4-register
format for helpers shared with SVE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-85-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 98 ++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 45fa5166f34..1a8fc7fb390 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -151,24 +151,21 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
     }
 }
 
-static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
+static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
+                              int data, ARMFPStatusFlavour fp_flavour,
+                              gen_helper_gvec_4_ptr *fn_gvec_ptr)
 {
-    int opr_sz;
-    TCGv_ptr fpst;
-    gen_helper_gvec_4_ptr *fn_gvec_ptr;
-
-    if (!dc_isar_feature(aa32_vcma, s)
-        || (a->size == MO_16 && !dc_isar_feature(aa32_fp16_arith, s))) {
-        return false;
-    }
-
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
+    if (((vd | vn | vm) & 0x10) && !dc_isar_feature(aa32_simd_r32, s)) {
         return false;
     }
 
-    if ((a->vn | a->vm | a->vd) & a->q) {
+    /*
+     * UNDEF accesses to odd registers for each bit of Q.
+     * Q will be 0b111 for all Q-reg instructions, otherwise
+     * when we have mixed Q- and D-reg inputs.
+     */
+    if (((vd & 1) * 4 | (vn & 1) * 2 | (vm & 1)) & q) {
         return false;
     }
 
@@ -176,20 +173,34 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
         return true;
     }
 
-    opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
-    fn_gvec_ptr = (a->size == MO_16) ?
-        gen_helper_gvec_fcmlah : gen_helper_gvec_fcmlas;
-    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       fpst, opr_sz, opr_sz, a->rot,
-                       fn_gvec_ptr);
+    int opr_sz = q ? 16 : 8;
+    TCGv_ptr fpst = fpstatus_ptr(fp_flavour);
+
+    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, vd),
+                       vfp_reg_offset(1, vn),
+                       vfp_reg_offset(1, vm),
+                       vfp_reg_offset(1, vd),
+                       fpst, opr_sz, opr_sz, data, fn_gvec_ptr);
     tcg_temp_free_ptr(fpst);
     return true;
 }
 
+static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
+{
+    if (!dc_isar_feature(aa32_vcma, s)) {
+        return false;
+    }
+    if (a->size == MO_16) {
+        if (!dc_isar_feature(aa32_fp16_arith, s)) {
+            return false;
+        }
+        return do_neon_ddda_fpst(s, a->q * 7, a->vd, a->vn, a->vm, a->rot,
+                                 FPST_STD_F16, gen_helper_gvec_fcmlah);
+    }
+    return do_neon_ddda_fpst(s, a->q * 7, a->vd, a->vn, a->vm, a->rot,
+                             FPST_STD, gen_helper_gvec_fcmlas);
+}
+
 static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 {
     int opr_sz;
@@ -294,43 +305,20 @@ static bool trans_VFML(DisasContext *s, arg_VFML *a)
 
 static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 {
-    gen_helper_gvec_4_ptr *fn_gvec_ptr;
-    int opr_sz;
-    TCGv_ptr fpst;
+    int data = (a->index << 2) | a->rot;
 
     if (!dc_isar_feature(aa32_vcma, s)) {
         return false;
     }
-    if (a->size == MO_16 && !dc_isar_feature(aa32_fp16_arith, s)) {
-        return false;
+    if (a->size == MO_16) {
+        if (!dc_isar_feature(aa32_fp16_arith, s)) {
+            return false;
+        }
+        return do_neon_ddda_fpst(s, a->q * 6, a->vd, a->vn, a->vm, data,
+                                 FPST_STD_F16, gen_helper_gvec_fcmlah_idx);
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vd | a->vn) & a->q) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fn_gvec_ptr = (a->size == MO_16) ?
-        gen_helper_gvec_fcmlah_idx : gen_helper_gvec_fcmlas_idx;
-    opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
-    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       fpst, opr_sz, opr_sz,
-                       (a->index << 2) | a->rot, fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
-    return true;
+    return do_neon_ddda_fpst(s, a->q * 6, a->vd, a->vn, a->vm, data,
+                             FPST_STD, gen_helper_gvec_fcmlas_idx);
 }
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
-- 
2.20.1


