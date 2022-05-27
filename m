Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A935367F3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:15:53 +0200 (CEST)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugNE-000204-7A
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefd-0001tY-S5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:47 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefZ-0005N7-2R
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:45 -0400
Received: by mail-pf1-x429.google.com with SMTP id c65so4425953pfb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moRuPu35tTQvlASaPQhZUHJWwZHkrQYA17JeQIDLO7g=;
 b=HYBhyjVJHNMY04ovI3R6Ik6RrHznPx7l1G3UT3KkxaVkx0OmfAVnTHbE+zKqr+eACs
 03o2HTQehDHmmAwmSaH/nCIHMF3k3a38LzMpOagDhpsBovQq3R0TSJSNkimgPuF9avNR
 3SGpUH0jleCj02mXRwXit0NudomgFX0j0//x08bkbvEibSw0CZilwFhBHzS13H5um9LO
 X+GjCLPNQCD2V5Ee/H6boIW1/h1m5Jp1qP8Oof70dSwfW6pf3c7D+38jttzQU3zDGGOM
 6654k7ViOJBXs0n1Y4FOBBGOJpJj+wWrgOvtXUswN16lkMAazUCTBmzSNyAhWKpAThYE
 LsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moRuPu35tTQvlASaPQhZUHJWwZHkrQYA17JeQIDLO7g=;
 b=PrPzVm5sp/ZrBOJO7zxNFMLHeFdKrRzLzrvbYa7D2Yrss4cDBdPKRB0mekRiAd1OjY
 s65K6HjSNBKosmltLmcMgI9sUD6S+nDzpqEJTp0cOgszh7If70wFLtQ6FLNotuQLRxb+
 2Ok0OSGDLNKNAEBxuDSk4cUr3vsPgM+VIMhv+LHoT9nPt7iZOfCQLrNhLZruRMeYH9It
 mlfOx08rI95Zu5HkTCV/V+7Oq70CtqYB9rTjm4OgLwp+AOpe+z2uhQHD+bb9wvFrDs37
 mbT+p72jqZxJ9yfGQQT4JRK2RNyVEUZMf6kThVSYWNBga5j5JuibEYAF1WJt+z6nw+2A
 wGpQ==
X-Gm-Message-State: AOAM530xD/aH8M/ThHwRUboXMRC6wpJYT7yzHz3E9YjN83ZrqcaEtkEb
 NE6DLOGFWrw0Zt+2yIyhYsztw9pCgNIJsw==
X-Google-Smtp-Source: ABdhPJyddCU8ScmAdbpFmsgqXFbpnMMkz5ZiYjBR7x+K2I1KYHNENDZUWOiIkVymHJGnCF/sdRyAyQ==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr44729234pfe.0.1653675999815; 
 Fri, 27 May 2022 11:26:39 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 097/114] target/arm: Use TRANS_FEAT for do_ppz_fp
Date: Fri, 27 May 2022 11:18:50 -0700
Message-Id: <20220527181907.189259-98-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 41 ++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2f96f52293..2ee48186ba 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3696,35 +3696,32 @@ TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_arg_zz, frsqrte_fns[a->esz], a, 0)
  *** SVE Floating Point Compare with Zero Group
  */
 
-static void do_ppz_fp(DisasContext *s, arg_rpr_esz *a,
+static bool do_ppz_fp(DisasContext *s, arg_rpr_esz *a,
                       gen_helper_gvec_3_ptr *fn)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status =
+            fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
-    tcg_gen_gvec_3_ptr(pred_full_reg_offset(s, a->rd),
-                       vec_full_reg_offset(s, a->rn),
-                       pred_full_reg_offset(s, a->pg),
-                       status, vsz, vsz, 0, fn);
-    tcg_temp_free_ptr(status);
+        tcg_gen_gvec_3_ptr(pred_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
 }
 
 #define DO_PPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)         \
-{                                                                 \
-    static gen_helper_gvec_3_ptr * const fns[3] = {               \
-        gen_helper_sve_##name##_h,                                \
-        gen_helper_sve_##name##_s,                                \
-        gen_helper_sve_##name##_d,                                \
+    static gen_helper_gvec_3_ptr * const name##_fns[] = {         \
+        NULL,                      gen_helper_sve_##name##_h,     \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,     \
     };                                                            \
-    if (a->esz == 0) {                                            \
-        return false;                                             \
-    }                                                             \
-    if (sve_access_check(s)) {                                    \
-        do_ppz_fp(s, a, fns[a->esz - 1]);                         \
-    }                                                             \
-    return true;                                                  \
-}
+    TRANS_FEAT(NAME, aa64_sve, do_ppz_fp, a, name##_fns[a->esz])
 
 DO_PPZ(FCMGE_ppz0, fcmge0)
 DO_PPZ(FCMGT_ppz0, fcmgt0)
-- 
2.34.1


