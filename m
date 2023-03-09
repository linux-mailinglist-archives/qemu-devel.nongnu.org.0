Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA36B2E40
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:11:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMab-0005ar-Kw; Thu, 09 Mar 2023 15:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaL-0005A7-H8
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:57 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaJ-0001a8-Kg
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so7439589pjh.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qr5XLdhxclJBvAXiN4iaOPbLLOomvFENA35jRJhVgIg=;
 b=UlpXJ67OKyo4xnXSPBgd0ByMwdkPHqLnR+9P1zm6T6364VyMi9H5aT8iW/dgQOiMdz
 Y3anHqLb4LH1UZSgVZzdve25RsPnjKyGdFtbYDl3GQheHY3R6KsDGhIlrKbeVZRgU1Hk
 el4xpC/q7/yRiUdvzlF3Oak+IRBsK2bLTXRUk9ewUC1LAEYp+PgFDukYt7z8UUmdUxDt
 d5MI3wyrC7EkKwhfOYU6X0RfaP6DAC1oFdPTq4ix3ahUuVpUsDe/flMwOe3DzIiO3j5B
 tsIzQCMwcGPuoLwpkRz9PzrFUNGCwGvtVxUy7P/N3IDWl/m5kK4zwu96F+XaDUkQBNuh
 okMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qr5XLdhxclJBvAXiN4iaOPbLLOomvFENA35jRJhVgIg=;
 b=VLb7MXSMloUTqRQJHjRBe2dqbroQ9SWF5xzlcsRwEYWXWkycvWs4noWefU66+BqWIR
 Gdr0QEqSkfMqWYu+Q7Llp+Ai5p2A4KwuKkHHW5nifcxdjpUJbqyonehzKoDzvKQBechV
 7ib49018GtFvjqqlU67LDVv7zep5bMVNWLAJAdKJvSRXhRZ9iGZRmLPnrv2xwkz/e0fZ
 Ero0SOGCRobRs9ANhZmz0aE4/wvegjVO96x88qdGLGEMDvu1LjEshLZ1Ab+K14zW7pJn
 VABwa4nIgfzVQCCG/bGwoVB+F75Fc0inncMukIzqOVda+2nnUE1Buim4D8dtaVqvWuVo
 bd7A==
X-Gm-Message-State: AO0yUKUpZFaC2P7yZjN9WLHRZ/G7DJfwPa1kppdwzc6gvPekQH2hMDVC
 DCNPTtE+kA8JMMxiW8x3IVsOxH5EA8VURw8Qpt4=
X-Google-Smtp-Source: AK7set8/PI/E26Vgp6zsEhTnGdRupjnmn+Pc19FzkQGZWd8nJTQMBpuIivmAq6r+SVACWjS1MBas/w==
X-Received: by 2002:a17:902:b605:b0:19c:3d78:6a54 with SMTP id
 b5-20020a170902b60500b0019c3d786a54mr17176195pls.14.1678392594779; 
 Thu, 09 Mar 2023 12:09:54 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 71/91] target/arm: Consistently use ARMFPRounding during
 translation
Date: Thu,  9 Mar 2023 12:05:30 -0800
Message-Id: <20230309200550.3878088-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


