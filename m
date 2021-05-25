Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814963906BF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:37:03 +0200 (CEST)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla3C-0004hU-IY
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYez-0002wx-86
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYeu-000789-Lc
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id u133so16936279wmg.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qRblMs8qtR2Q4NYqq3dodoqycqkLm2Mu9Lxfwb+Xks8=;
 b=vX96i+sGzr7LRgIqKe79hBx+dOYkZDak0hL8Z1/wbkbf3jzd//RCVXOGozf5BpFy9i
 uJDpwJuPGvUoK9Ji8767Llj9u4CbIhNE8sYKgGuyY1Tt2j4Wn57n5lS8Pkw4O0FtwCY+
 Ahr3isTLPv5Z5He0NnjhtXH1gmK+RW6kxRopF6Y9y3fL7eLHz4w3lqJJaUMohGmhy9rR
 JduA50Q6iwuEfWaQbPBj2MRS9ALQXlWc77nzxAbyqQ8f54cAjQT8teEbW8gjjaWtvW63
 v4p6aLr4xpvvq/G0R7qa88GzhutbUjJbAgyLx6ZSzAb37DQ1HYVZ+BGtR0gnOPMbHVX2
 d3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qRblMs8qtR2Q4NYqq3dodoqycqkLm2Mu9Lxfwb+Xks8=;
 b=PcE80cYGsXuk0irSOtKxJkPzMd6AnbEok9267FqdJvpnTGxQGtnJDUlGkfQqy+HqpV
 TCdhv+vWv3nHzvyT8d2G9NMVLRTtHe6scU1lQFVjoHs9BKYlFGz5rIR+GXSIQM5sxg2e
 3kAnF4MIqcfJwH3ENs5gYISa7wvAS4OMPZktNr1P8H40ineCHeKwJUdJhaZn4iflbdnn
 XLY2V7rDA1klDDQ9DjLtgUpOUpM5mvDFhMTxMuDO6s3hx82V2d3Fc5jG09Xy3/HV6QcA
 v5/4S2yskFkNYAnZeigenBycrq8hX2xrVRadSVB4Mkzycka2plWSM/2l6qv1LdW4UZEg
 Ai7Q==
X-Gm-Message-State: AOAM532j7tW12kVZcnRQ41y7CsXEOcPNax8D2/FZ97nBPXxJJk1Catjp
 c6HrlhQppkGQ393W+Jmv0RLernCz4xMGRJI9
X-Google-Smtp-Source: ABdhPJy/gq1UlmjTeSGZGt6s0EilmmVlOIi5nug2l7ilvoO6GbgAxMLQKG32KHuuiEZntl1Fb+6wvQ==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr4306725wmq.164.1621955271193; 
 Tue, 25 May 2021 08:07:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 109/114] target/arm: Split out do_neon_ddda
Date: Tue, 25 May 2021 16:07:31 +0100
Message-Id: <20210525150736.32695-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-88-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 90 ++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 52 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 9f7a88aab1b..dfa33912ab1 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -151,6 +151,36 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
     }
 }
 
+static bool do_neon_ddda(DisasContext *s, int q, int vd, int vn, int vm,
+                         int data, gen_helper_gvec_4 *fn_gvec)
+{
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (((vd | vn | vm) & 0x10) && !dc_isar_feature(aa32_simd_r32, s)) {
+        return false;
+    }
+
+    /*
+     * UNDEF accesses to odd registers for each bit of Q.
+     * Q will be 0b111 for all Q-reg instructions, otherwise
+     * when we have mixed Q- and D-reg inputs.
+     */
+    if (((vd & 1) * 4 | (vn & 1) * 2 | (vm & 1)) & q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    int opr_sz = q ? 16 : 8;
+    tcg_gen_gvec_4_ool(vfp_reg_offset(1, vd),
+                       vfp_reg_offset(1, vn),
+                       vfp_reg_offset(1, vm),
+                       vfp_reg_offset(1, vd),
+                       opr_sz, opr_sz, data, fn_gvec);
+    return true;
+}
+
 static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
                               int data, ARMFPStatusFlavour fp_flavour,
                               gen_helper_gvec_4_ptr *fn_gvec_ptr)
@@ -241,35 +271,13 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 
 static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
 {
-    int opr_sz;
-    gen_helper_gvec_4 *fn_gvec;
-
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vn | a->vm | a->vd) & a->q) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    opr_sz = (1 + a->q) * 8;
-    fn_gvec = a->u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b;
-    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       opr_sz, opr_sz, 0, fn_gvec);
-    return true;
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        a->u
+                        ? gen_helper_gvec_udot_b
+                        : gen_helper_gvec_sdot_b);
 }
 
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
@@ -323,35 +331,13 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
-    gen_helper_gvec_4 *fn_gvec;
-    int opr_sz;
-
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn) & 0x10)) {
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
-    fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
-    opr_sz = (1 + a->q) * 8;
-    tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       opr_sz, opr_sz, a->index, fn_gvec);
-    return true;
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        a->u
+                        ? gen_helper_gvec_udot_idx_b
+                        : gen_helper_gvec_sdot_idx_b);
 }
 
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
-- 
2.20.1


