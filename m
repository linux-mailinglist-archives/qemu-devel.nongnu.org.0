Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF2362AA1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:55:34 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWR3-0002p5-Mz
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdx-0006rg-8l
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:49 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVda-0001pU-Tb
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:48 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e2so10328438plh.8
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SejLQptV3Xbdii/z6eoM9zkt++LAZtRH0Va0O76ztI4=;
 b=ar7Apl2LZBFiJ6a6aVAVFvIrCpAyQW3lgFmo5RVKpvZTJ5stWUKNrCBcJT84eoUbVg
 ZdrFso93Xt2xZSoU2JW2Atrb395ssj+UmD/ZRv4POMJMBuUrmuSCIcLhdgd2SXuKEX6g
 r9dSgxflrHo3853Y7AP842VGVD3QwUeaV80VdLr/49h1ckQthh7ysgpI7+Gnht8JXIdk
 kDwlrTkXPG0SRPxlubEOBcktwrNk8ZzRzYEYmD5xn9K4VH789kJnVNFD+Du3l3cWTTOb
 8pp76AEQsZqYErJP+3NRbwS0/E6Slv6kQWUotJk50Q4Tvnaycs/bH2W/C/8+KK+s1Zhr
 ihQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SejLQptV3Xbdii/z6eoM9zkt++LAZtRH0Va0O76ztI4=;
 b=Q1dy/EeWWyWXNEv4HTfQOArnJQSvnS5oGu7AXVsG10uxaLbgO1VS+tTN1vynea+S0X
 35deU7SoMuM6ys7suTs379Ep7/MSLfeZbkXQcb2HQ4+UbANiKSBGHdtRU1F2JiCusaEE
 xP6VBIZhjJh8VlPWJSvbxmQwVz3g1nw60Vq414USLRv3rwjGPmv3cOIGGOdb0d8XD4m5
 McGls6orQA3txH61bvVtLa3w95/waIgba9LVkGlwGK/Clq5zQGiUNTSIB8v2HAzdykeK
 uoowE9PEz3Xozg+BwOBirWsms6geZUKQ9NLkebfSOxyvo94o/IJGiVE/X793t6mQa00H
 pBJg==
X-Gm-Message-State: AOAM530+piFYklSrt4uShyD2WO4QqCSD94Q9iS5jY4n7RcAkh+aVlg+7
 08hWXneQnJPpRIzqh9vsVktUQux/lThG4w==
X-Google-Smtp-Source: ABdhPJzJZK0eZhjczqZVq6yFmB0fDn8BBFa30BM462zo07IZhXnFBPwzDIOV3dg4v4l3KeIG21AuEQ==
X-Received: by 2002:a17:90a:dc07:: with SMTP id
 i7mr11577441pjv.16.1618607065598; 
 Fri, 16 Apr 2021 14:04:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 75/81] target/arm: Split out do_neon_ddda_fpst
Date: Fri, 16 Apr 2021 14:02:34 -0700
Message-Id: <20210416210240.1591291-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a helper that can handle the 4-register
format for helpers shared with SVE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 98 +++++++++++++++------------------
 1 file changed, 43 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 6f418bd8de..6385d13a7e 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -142,24 +142,21 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
     }
 }
 
-static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
+static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
+                              int data, ARMFPStatusFlavour fp_flavor,
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
 
@@ -167,20 +164,34 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
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
+    TCGv_ptr fpst = fpstatus_ptr(fp_flavor);
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
@@ -285,43 +296,20 @@ static bool trans_VFML(DisasContext *s, arg_VFML *a)
 
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
2.25.1


