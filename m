Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1CE5386E2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:47:43 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjUU-0004PN-Ut
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwb-00043w-Pl
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-0007MD-1Z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id q21so4089541wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U5MdDTiCJ0I6T7wLRHuDD2GNLTYgYp2l3D7QRQQkOXg=;
 b=sCjsZod86v6hm7SE6ou4H5sOra37jbEOEu3aamV//yTzNLQ/4C9HtmSUlTXF+DoDST
 haz8yBTjg1lKEvfPZcPY6CdRZS2wwLRLnGP7gnyxkhDRdjQqfKXpxZAyK2Ib4jjS5P3c
 KbN1sJhJ3iTcqPF3/hXfOWcchiFxnKCB/OhMALu1V2L5lbz9EV/6UwStY1/GjrCfBuDH
 eAcf721kDow4mKmDgdIdiahznEVVIni6z8TkKhnmmFbWXBI9Hc6mz54QeWy4oej1/pEE
 G4L+UHbeT90Th593Dt0SS8PvUPHVthIWbLzOjVkTyC8xQVjTWQkL0tmMPkgh7n2iRgEj
 nu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5MdDTiCJ0I6T7wLRHuDD2GNLTYgYp2l3D7QRQQkOXg=;
 b=i84vdvpyCNFDuTnH/bbnJ4xx11NWsHUteYNoIAJXYXi2/3/00LsCdr18kxjU1cchCa
 wwLs0iJ5Hd3CqGr4mE7oQbq2URAlPTFMDcTy4W9qaEHrVqEaZJrGIFEaMDhUlVIaFevK
 1TPfhVZqVE5VhAZe6HL7MyfHIAo6hJ7WawBSw9XKo7EX2xWjoryP0w+ogVFIt406jObv
 SUB29I9yRkDx0w04mf6mCmG604oxS3n4/BVyuUAZAvTQ9EcgUBgmf36/AKnkN8eutoWY
 0snAixh1ExrdSYmD6z533vVG+Mm4uqd7OZAVnZRygL9b+AIWu4Nr8xPv1Xqf4MWL4Plv
 lEHg==
X-Gm-Message-State: AOAM530wwg8H/mZ28tAsDVKj8S0g4aDtTPgsvjrm0gJ3aPFfBdUSXPdS
 3wH8XHlpYCUbuy/LQefoj+crRIrhfZxfsg==
X-Google-Smtp-Source: ABdhPJwPOrJ8qWpFgNmRecaiY+ytAOQFpgNyhabMjBV6Z+niWdFyhz/nSWcQG3BayBj+PdETsJMLDw==
X-Received: by 2002:a05:6000:16ca:b0:210:3d2:9bae with SMTP id
 h10-20020a05600016ca00b0021003d29baemr20318394wrf.311.1653926912955; 
 Mon, 30 May 2022 09:08:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 092/117] target/arm: Move null function and sve check into
 do_reduce
Date: Mon, 30 May 2022 17:06:43 +0100
Message-Id: <20220530160708.726466-93-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-90-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 11e4b4e1e4a..0d71072f837 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3572,15 +3572,24 @@ TRANS_FEAT(FMUL_zzx, aa64_sve, gen_gvec_fpst_zzz,
 typedef void gen_helper_fp_reduce(TCGv_i64, TCGv_ptr, TCGv_ptr,
                                   TCGv_ptr, TCGv_i32);
 
-static void do_reduce(DisasContext *s, arg_rpr_esz *a,
+static bool do_reduce(DisasContext *s, arg_rpr_esz *a,
                       gen_helper_fp_reduce *fn)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned p2vsz = pow2ceil(vsz);
-    TCGv_i32 t_desc = tcg_constant_i32(simd_desc(vsz, vsz, p2vsz));
+    unsigned vsz, p2vsz;
+    TCGv_i32 t_desc;
     TCGv_ptr t_zn, t_pg, status;
     TCGv_i64 temp;
 
+    if (fn == NULL) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    p2vsz = pow2ceil(vsz);
+    t_desc = tcg_constant_i32(simd_desc(vsz, vsz, p2vsz));
     temp = tcg_temp_new_i64();
     t_zn = tcg_temp_new_ptr();
     t_pg = tcg_temp_new_ptr();
@@ -3596,23 +3605,18 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
 
     write_fp_dreg(s, a->rd, temp);
     tcg_temp_free_i64(temp);
+    return true;
 }
 
 #define DO_VPZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)                \
 {                                                                        \
-    static gen_helper_fp_reduce * const fns[3] = {                       \
-        gen_helper_sve_##name##_h,                                       \
+    static gen_helper_fp_reduce * const fns[4] = {                       \
+        NULL, gen_helper_sve_##name##_h,                                 \
         gen_helper_sve_##name##_s,                                       \
         gen_helper_sve_##name##_d,                                       \
     };                                                                   \
-    if (a->esz == 0) {                                                   \
-        return false;                                                    \
-    }                                                                    \
-    if (sve_access_check(s)) {                                           \
-        do_reduce(s, a, fns[a->esz - 1]);                                \
-    }                                                                    \
-    return true;                                                         \
+    return do_reduce(s, a, fns[a->esz]);                                 \
 }
 
 DO_VPZ(FADDV, faddv)
-- 
2.25.1


