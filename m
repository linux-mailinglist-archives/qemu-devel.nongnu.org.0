Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B55367D5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:05:34 +0200 (CEST)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugDF-0003ZM-HG
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefY-0001mb-FT
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:41 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefV-0005LY-EA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s68so4562727pgs.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AryjN2U1StlfWDdwl3PNU6Q1ayRjIxaie9mhxx79pnY=;
 b=FjzuauumcojIZOyZ9DoOPPCpqTt4hE5MWPJ2bsElhcXAHR1UInUWz0B2FL//PLh4Gw
 thxmcNejeDzriPPDQ79fg2QAeLEkxlMFBIptnzhwz6Ufs06fO/uyl5m8GFpR1mq+6hMS
 BU33kkn0GE+vsb35inacXq0tqtP6J5adZxbK8Nf2wnsYdvygyBwx/Ru2LnKv/lozv2pW
 40KyZhEhED7rK6WtnIZtC6TdE55/yOkj+9f8c5LjQhf123OUVG0Fsu2MIb5ctBPFiMCC
 b41GuIeesCdkGDo7DwYDHZIGiNeb7e2LAlRaU6wQTbSdwiY4EGbUl236NbxMBDzQtvLy
 A/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AryjN2U1StlfWDdwl3PNU6Q1ayRjIxaie9mhxx79pnY=;
 b=vc6hytf0K+422+taMmv+tzyJkaoDiGRySFqt3gzl6jFJHi0PU8npPejUkn88CStZbU
 w8UTPj797jMrsAjfbDsWykFq17naLjuCAEGmIswR1bKBY6oc0NPEG5NVqSo7NVWfhgky
 JzJtj606ttWET1cRU/RebqP1qTO/eoV8OJ9N7ikXP4ElgspHrTvqkfswTlE5fuba5E5E
 moxTlrrkc9IYNv1nQv7zm0AZXAQZZmqNSoX2Sn4x4tGOz14G4a9q5LXpeQV9/cvHsxs7
 WM9M6K23aUfF38DdmkY50jyezK9aPfOWUf82KykPsuoQ+kAaSJfuc17ucKZmbVkXKBY8
 IU2Q==
X-Gm-Message-State: AOAM532XkAngdvdcSFxYb2puni6EHD7uXybxGc3DHKIFY3cf0lIP3I+7
 iKCSLmxUxqIh4AsM8HVgaYASp4WPbXC9dg==
X-Google-Smtp-Source: ABdhPJzlkFPQijt+cYPZN6wmJOHNFdAvCqdjQi4NcvYFfFre2rLQsihI0LBhLrfrA4+NFf556v53tQ==
X-Received: by 2002:a65:4681:0:b0:3db:b2d0:c29e with SMTP id
 h1-20020a654681000000b003dbb2d0c29emr38726611pgr.211.1653675995456; 
 Fri, 27 May 2022 11:26:35 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 093/114] target/arm: Rename do_zpz_ptr to
 gen_gvec_ool_fpst_arg_zpz
Date: Fri, 27 May 2022 11:18:46 -0700
Message-Id: <20220527181907.189259-94-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Rename the function to match other expansion function and
move to be adjacent.  Split out gen_gvec_fpst_zzp as a
helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 392 ++++++++++++-------------------------
 1 file changed, 129 insertions(+), 263 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 99e5d89645..2a5fbec2d6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -318,6 +318,33 @@ static bool gen_gvec_ool_arg_zpzi(DisasContext *s, gen_helper_gvec_3 *fn,
     return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
 }
 
+static bool gen_gvec_fpst_zzp(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                              int rd, int rn, int pg, int data,
+                              ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           pred_full_reg_offset(s, pg),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zpz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                                  arg_rpr_esz *a, int data,
+                                  ARMFPStatusFlavour flavour)
+{
+    return gen_gvec_fpst_zzp(s, fn, a->rd, a->rn, a->pg, data, flavour);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static bool gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
@@ -4044,128 +4071,53 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
  *** SVE Floating Point Unary Operations Predicated Group
  */
 
-static bool do_zpz_ptr(DisasContext *s, int rd, int rn, int pg,
-                       bool is_fp16, gen_helper_gvec_3_ptr *fn)
-{
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           pred_full_reg_offset(s, pg),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+TRANS_FEAT(FCVT_sh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_sh, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_hs, a, 0, FPST_FPCR)
 
-static bool trans_FCVT_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sh);
-}
+TRANS_FEAT(BFCVT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_bfcvt, a, 0, FPST_FPCR)
 
-static bool trans_FCVT_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hs);
-}
+TRANS_FEAT(FCVT_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_dh, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_hd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_hd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_ds, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVT_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvt_sd, a, 0, FPST_FPCR)
 
-static bool trans_BFCVT(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_bfcvt);
-}
+TRANS_FEAT(FCVTZS_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZU_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZS_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hs, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZU_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hs, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZS_hd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_hd, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(FCVTZU_hd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_hd, a, 0, FPST_FPCR_F16)
 
-static bool trans_FCVT_dh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_dh);
-}
+TRANS_FEAT(FCVTZS_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZS_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_sd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_sd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZS_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_ds, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_ds, a, 0, FPST_FPCR)
 
-static bool trans_FCVT_hd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hd);
-}
-
-static bool trans_FCVT_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_ds);
-}
-
-static bool trans_FCVT_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sd);
-}
-
-static bool trans_FCVTZS_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hh);
-}
-
-static bool trans_FCVTZU_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hh);
-}
-
-static bool trans_FCVTZS_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hs);
-}
-
-static bool trans_FCVTZU_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hs);
-}
-
-static bool trans_FCVTZS_hd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hd);
-}
-
-static bool trans_FCVTZU_hd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hd);
-}
-
-static bool trans_FCVTZS_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ss);
-}
-
-static bool trans_FCVTZU_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ss);
-}
-
-static bool trans_FCVTZS_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_sd);
-}
-
-static bool trans_FCVTZU_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_sd);
-}
-
-static bool trans_FCVTZS_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ds);
-}
-
-static bool trans_FCVTZU_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ds);
-}
-
-static bool trans_FCVTZS_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_dd);
-}
-
-static bool trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
-}
+TRANS_FEAT(FCVTZS_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzs_dd, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTZU_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_fcvtzu_dd, a, 0, FPST_FPCR)
 
 static gen_helper_gvec_3_ptr * const frint_fns[] = {
     NULL,
@@ -4173,28 +4125,17 @@ static gen_helper_gvec_3_ptr * const frint_fns[] = {
     gen_helper_sve_frint_s,
     gen_helper_sve_frint_d
 };
+TRANS_FEAT(FRINTI, aa64_sve, gen_gvec_fpst_arg_zpz, frint_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool trans_FRINTI(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16,
-                      frint_fns[a->esz]);
-}
-
-static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_frintx_h,
-        gen_helper_sve_frintx_s,
-        gen_helper_sve_frintx_d
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
-}
+static gen_helper_gvec_3_ptr * const frintx_fns[] = {
+    NULL,
+    gen_helper_sve_frintx_h,
+    gen_helper_sve_frintx_s,
+    gen_helper_sve_frintx_d
+};
+TRANS_FEAT(FRINTX, aa64_sve, gen_gvec_fpst_arg_zpz, frintx_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
                           int mode, gen_helper_gvec_3_ptr *fn)
@@ -4258,101 +4199,53 @@ static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
     return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
 }
 
-static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_frecpx_h,
-        gen_helper_sve_frecpx_s,
-        gen_helper_sve_frecpx_d
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
-}
+static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
+    NULL,                    gen_helper_sve_frecpx_h,
+    gen_helper_sve_frecpx_s, gen_helper_sve_frecpx_d,
+};
+TRANS_FEAT(FRECPX, aa64_sve, gen_gvec_fpst_arg_zpz, frecpx_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool trans_FSQRT(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_fsqrt_h,
-        gen_helper_sve_fsqrt_s,
-        gen_helper_sve_fsqrt_d
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
-}
+static gen_helper_gvec_3_ptr * const fsqrt_fns[] = {
+    NULL,                   gen_helper_sve_fsqrt_h,
+    gen_helper_sve_fsqrt_s, gen_helper_sve_fsqrt_d,
+};
+TRANS_FEAT(FSQRT, aa64_sve, gen_gvec_fpst_arg_zpz, fsqrt_fns[a->esz],
+           a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
-static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
-}
+TRANS_FEAT(SCVTF_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(SCVTF_sh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_sh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(SCVTF_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_dh, a, 0, FPST_FPCR_F16)
 
-static bool trans_SCVTF_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_sh);
-}
+TRANS_FEAT(SCVTF_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(SCVTF_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_ds, a, 0, FPST_FPCR)
 
-static bool trans_SCVTF_dh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_dh);
-}
+TRANS_FEAT(SCVTF_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_sd, a, 0, FPST_FPCR)
+TRANS_FEAT(SCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_scvt_dd, a, 0, FPST_FPCR)
 
-static bool trans_SCVTF_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_ss);
-}
+TRANS_FEAT(UCVTF_hh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_hh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(UCVTF_sh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_sh, a, 0, FPST_FPCR_F16)
+TRANS_FEAT(UCVTF_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_dh, a, 0, FPST_FPCR_F16)
 
-static bool trans_SCVTF_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_ds);
-}
+TRANS_FEAT(UCVTF_ss, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_ss, a, 0, FPST_FPCR)
+TRANS_FEAT(UCVTF_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_ds, a, 0, FPST_FPCR)
+TRANS_FEAT(UCVTF_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_sd, a, 0, FPST_FPCR)
 
-static bool trans_SCVTF_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_sd);
-}
-
-static bool trans_SCVTF_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_dd);
-}
-
-static bool trans_UCVTF_hh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_hh);
-}
-
-static bool trans_UCVTF_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_sh);
-}
-
-static bool trans_UCVTF_dh(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_dh);
-}
-
-static bool trans_UCVTF_ss(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_ss);
-}
-
-static bool trans_UCVTF_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_ds);
-}
-
-static bool trans_UCVTF_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_sd);
-}
-
-static bool trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_dd);
-}
+TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_ucvt_dd, a, 0, FPST_FPCR)
 
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
@@ -7389,45 +7282,18 @@ TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
 
 TRANS_FEAT(RAX1, aa64_sve2_sha3, gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
 
-static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
-}
+TRANS_FEAT(FCVTNT_sh, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtnt_sh, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTNT_ds, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtnt_ds, a, 0, FPST_FPCR)
 
-static bool trans_BFCVTNT(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_bfcvtnt);
-}
+TRANS_FEAT(BFCVTNT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve_bfcvtnt, a, 0, FPST_FPCR)
 
-static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
-}
-
-static bool trans_FCVTLT_hs(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_hs);
-}
-
-static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
-}
+TRANS_FEAT(FCVTLT_hs, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtlt_hs, a, 0, FPST_FPCR)
+TRANS_FEAT(FCVTLT_sd, aa64_sve2, gen_gvec_fpst_arg_zpz,
+           gen_helper_sve2_fcvtlt_sd, a, 0, FPST_FPCR)
 
 static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.34.1


