Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF96AF0F1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9Z-0003Z8-B1; Tue, 07 Mar 2023 13:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9X-0003XX-7Y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:11 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9U-0007iH-RA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:10 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so12712181pja.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qr5XLdhxclJBvAXiN4iaOPbLLOomvFENA35jRJhVgIg=;
 b=vV+MWP4EF5pYRH2PFRleQKs8VBCZ9KIrJTrqHRI3V3WGfT6jfqQM1oOJFPJ37NFC+8
 il7HV0j4NGFAq6awb37oTbBqfng/6udZU9atI4bL2BXGPB2Xbqx54EWQMgHy2qLId46I
 JkM3D7m+Hrf71eSYCRQcQ7KeAJ9fWQlnhuFJSLCvfOubl3lDPqnlt3PE8Z26QBvGZ4AC
 ewaWcP6pH58TtjevIFgH673I/ysw1FWFKXodMhDGV9VhTpu5tajobLPRjWxNRZLQBFZ5
 BIlecg1Uto/cN6sUcqwALH0upSDwBWXAmK4wuMPcM9CkUbZTWQaC+N27anYMW21FZAm1
 TVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qr5XLdhxclJBvAXiN4iaOPbLLOomvFENA35jRJhVgIg=;
 b=3xC7TXlwm/xrJHUQ2cRHdpryf1qR7PoOcfS7UrYyoofjP5SsixRVxquURr4fsUXDEa
 tZRdnzun+YcCmmjLqUGbTrU9oBug2SLOEfxZXQ2LD5wM6cTC/Fpo0nqjE1OdSYY4ln/F
 foklswnJ+OHAWtBkKbyUtgrnL/2jEWwVJQuZNBvMXdcf/freKu8BMoUV9HzR5LnXn3M9
 cwI6UBv/YXlcPciuV4YEu6AOMhFXjRDqRYQ3hffPt5mo/yp9X1Q44TrTSCf5kDbzWsux
 ULWqahKWfYPVk5XpPMrb/+Yp7/xJuiypw+zMUL2gC5ql9Q/DwSVvD+WSbARV83mrCgQ6
 taYw==
X-Gm-Message-State: AO0yUKVfwd/8mYSBIo/hh3LLcqV0XXTm580xvJt6NGlv7ueFXUKTjare
 RYGYs2R3FlAUIbJsWykCEeb9EEF5RoJtQNjJDcw=
X-Google-Smtp-Source: AK7set/pd4mp2K9HgWtj+MYnrdZS/gUolGAM40D/CcuBczI7mk733U5dmHrbqQ6TP/d4AhW49HuMeA==
X-Received: by 2002:a17:90b:2353:b0:233:cea2:dac6 with SMTP id
 ms19-20020a17090b235300b00233cea2dac6mr15968817pjb.47.1678214107471; 
 Tue, 07 Mar 2023 10:35:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/25] target/arm: Consistently use ARMFPRounding during
 translation
Date: Tue,  7 Mar 2023 10:34:42 -0800
Message-Id: <20230307183503.2512684-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation for extracting new helpers, ensure that
the rounding mode is represented as ARMFPRounding and
not FloatRoundMode.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 16 ++++++++--------
 target/arm/tcg/translate-sve.c | 18 +++++++++---------
 target/arm/tcg/translate-vfp.c |  6 +++---
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index bef66086a2..210899ff79 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6202,7 +6202,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0xa: /* FRINTM */
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
-        rmode = arm_rmode_to_sf(opcode & 7);
+        rmode = opcode & 7;
         gen_fpst = gen_helper_rints;
         break;
     case 0xe: /* FRINTX */
@@ -6212,14 +6212,14 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_rints;
         break;
     case 0x10: /* FRINT32Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_s;
         break;
     case 0x11: /* FRINT32X */
         gen_fpst = gen_helper_frint32_s;
         break;
     case 0x12: /* FRINT64Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint64_s;
         break;
     case 0x13: /* FRINT64X */
@@ -6231,7 +6231,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(rmode);
+        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -6275,7 +6275,7 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     case 0xa: /* FRINTM */
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
-        rmode = arm_rmode_to_sf(opcode & 7);
+        rmode = opcode & 7;
         gen_fpst = gen_helper_rintd;
         break;
     case 0xe: /* FRINTX */
@@ -6285,14 +6285,14 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_rintd;
         break;
     case 0x10: /* FRINT32Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_d;
         break;
     case 0x11: /* FRINT32X */
         gen_fpst = gen_helper_frint32_d;
         break;
     case 0x12: /* FRINT64Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint64_d;
         break;
     case 0x13: /* FRINT64X */
@@ -6304,7 +6304,7 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(rmode);
+        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5bf80b22d7..3c65dd1ff2 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4082,7 +4082,7 @@ TRANS_FEAT(FRINTX, aa64_sve, gen_gvec_fpst_arg_zpz, frintx_fns[a->esz],
            a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
-                          int mode, gen_helper_gvec_3_ptr *fn)
+                          ARMFPRounding mode, gen_helper_gvec_3_ptr *fn)
 {
     unsigned vsz;
     TCGv_i32 tmode;
@@ -4096,7 +4096,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    tmode = tcg_const_i32(mode);
+    tmode = tcg_const_i32(arm_rmode_to_sf(mode));
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
     gen_helper_set_rmode(tmode, tmode, status);
@@ -4111,15 +4111,15 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
 }
 
 TRANS_FEAT(FRINTN, aa64_sve, do_frint_mode, a,
-           float_round_nearest_even, frint_fns[a->esz])
+           FPROUNDING_TIEEVEN, frint_fns[a->esz])
 TRANS_FEAT(FRINTP, aa64_sve, do_frint_mode, a,
-           float_round_up, frint_fns[a->esz])
+           FPROUNDING_POSINF, frint_fns[a->esz])
 TRANS_FEAT(FRINTM, aa64_sve, do_frint_mode, a,
-           float_round_down, frint_fns[a->esz])
+           FPROUNDING_NEGINF, frint_fns[a->esz])
 TRANS_FEAT(FRINTZ, aa64_sve, do_frint_mode, a,
-           float_round_to_zero, frint_fns[a->esz])
+           FPROUNDING_ZERO, frint_fns[a->esz])
 TRANS_FEAT(FRINTA, aa64_sve, do_frint_mode, a,
-           float_round_ties_away, frint_fns[a->esz])
+           FPROUNDING_TIEAWAY, frint_fns[a->esz])
 
 static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     NULL,                    gen_helper_sve_frecpx_h,
@@ -7145,9 +7145,9 @@ TRANS_FEAT(FCVTLT_sd, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_FPCR)
 
 TRANS_FEAT(FCVTX_ds, aa64_sve2, do_frint_mode, a,
-           float_round_to_odd, gen_helper_sve_fcvt_ds)
+           FPROUNDING_ODD, gen_helper_sve_fcvt_ds)
 TRANS_FEAT(FCVTXNT_ds, aa64_sve2, do_frint_mode, a,
-           float_round_to_odd, gen_helper_sve2_fcvtnt_ds)
+           FPROUNDING_ODD, gen_helper_sve2_fcvtnt_ds)
 
 static gen_helper_gvec_3_ptr * const flogb_fns[] = {
     NULL,               gen_helper_flogb_h,
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 757a2bf7d9..e7acfb3338 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -2783,7 +2783,7 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -2808,7 +2808,7 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rints(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -2842,7 +2842,7 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     tmp = tcg_temp_new_i64();
     vfp_load_reg64(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rintd(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-- 
2.34.1


