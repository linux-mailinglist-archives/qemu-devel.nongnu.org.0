Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B536B2E49
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMae-0005tg-37; Thu, 09 Mar 2023 15:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaM-0005DY-GR
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:58 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaK-0001YC-B9
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:58 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l1so3170967pjt.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1sfAmm8DUWCsMwoqJJW8S4peQJjwhppHUIprJsaoZ0k=;
 b=RnAgYYTnhC00FyXrWS6ZgT6gIrsZhl7DFi2lnIPnsgvzkNTLu/eunSRwgLA3WaqO0n
 YfTVthHApQSw4rP7EvN2mfgaC4ylqY9QNIgr4/jtQ45hRJnkeeIpW2C3eCX4EeMj/23K
 yC2ka0THZ/KQtAdhzT5lKhviQN3fJpW24uU9xuqwnaffHuF1Euqy3t/lxPf1xe/mmU/1
 clad7r1j8Kumwyc46gKN3pQewn0zoKIisIM30N4h1sjXvala+I3MqSugnubS2QI0QJAf
 l8SLW9n0a/6MvI/1yIxpz9Rww+SojhQwTZ2B5aCiXXaRBR/JbasSLj9uhirJ37r7ktf6
 /rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1sfAmm8DUWCsMwoqJJW8S4peQJjwhppHUIprJsaoZ0k=;
 b=06oMBcrqQs0BuGb/CdViEX4GKNCthTYy7fhgK0oiUCTjjohXb6oQbrZxjPK7wH7piL
 +z4d4jO50KTZrliinMdZncygX6E7LPoKTlYYqFS+OePuYgeBVDmAhm8s1NHP4Gt57b6b
 VzKLx9R2wmzMeMpfUijrD6XxNxYiRWtttighYkadmEv/AY3Otcf10Y+sQX/ylG2jUpoB
 QxawIMQT/UwdqoSZ0wwYom3oDlOTeN1j9D6hg97za1YuvU1BJZbZpTcSKNf9f8qGufPk
 Zcjx+QDPS/u1FZ9yZOoX71O5uK69ihvLRfirSf0wIpi2enVtRi4N9SXwWfZVMUUyq8ZA
 EqTw==
X-Gm-Message-State: AO0yUKVh2kOjWpqQZxE/ZTU9mavjwBGCoTPx15qeLf915yWUNoU05wSo
 dzrBqPqyl97wVaTgRTQxjUrtGYwBgzOmEbZj36I=
X-Google-Smtp-Source: AK7set/WP/RjXvYh1YxsxAwPRyl6mm6IMBimsVzOEQCW6hW/7UrYkjZgkt0o6G37J1E2BCBraAXR/Q==
X-Received: by 2002:a17:902:ea04:b0:19e:6e9d:4bd with SMTP id
 s4-20020a170902ea0400b0019e6e9d04bdmr28574192plg.43.1678392595506; 
 Thu, 09 Mar 2023 12:09:55 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 72/91] target/arm: Create gen_set_rmode, gen_restore_rmode
Date: Thu,  9 Mar 2023 12:05:31 -0800
Message-Id: <20230309200550.3878088-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Split out common subroutines for handing rounding mode
changes during translation.  Use tcg_constant_i32 and
tcg_temp_new_i32 instead of tcg_const_i32.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 17 ++++++++++++
 target/arm/tcg/translate-a64.c | 47 ++++++++++++++--------------------
 target/arm/tcg/translate-sve.c |  6 ++---
 target/arm/tcg/translate-vfp.c | 26 ++++++++-----------
 4 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 20f3ca7aca..f02d4685b4 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -616,6 +616,23 @@ static inline TCGv_ptr gen_lookup_cp_reg(uint32_t key)
     return ret;
 }
 
+/*
+ * Set and reset rounding mode around another operation.
+ */
+static inline TCGv_i32 gen_set_rmode(ARMFPRounding rmode, TCGv_ptr fpst)
+{
+    TCGv_i32 new = tcg_constant_i32(arm_rmode_to_sf(rmode));
+    TCGv_i32 old = tcg_temp_new_i32();
+
+    gen_helper_set_rmode(old, new, fpst);
+    return old;
+}
+
+static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
+{
+    gen_helper_set_rmode(old, old, fpst);
+}
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 210899ff79..989c958de6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6146,13 +6146,12 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
     {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(opcode & 7));
+        TCGv_i32 tcg_rmode;
+
         fpst = fpstatus_ptr(FPST_FPCR_F16);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        tcg_rmode = gen_set_rmode(opcode & 7, fpst);
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
         break;
     }
     case 0xe: /* FRINTX */
@@ -6231,10 +6230,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6304,10 +6302,9 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6944,9 +6941,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             rmode = FPROUNDING_TIEAWAY;
         }
 
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
 
         switch (type) {
         case 1: /* float64 */
@@ -7023,7 +7018,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             g_assert_not_reached();
         }
 
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -8771,9 +8766,8 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
 
     assert(!(is_scalar && is_q));
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     tcg_fpstatus = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, tcg_fpstatus);
     fracbits = (16 << size) - immhb;
     tcg_shift = tcg_constant_i32(fracbits);
 
@@ -8831,7 +8825,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    gen_restore_rmode(tcg_rmode, tcg_fpstatus);
 }
 
 /* AdvSIMD scalar shift by immediate
@@ -10219,12 +10213,11 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
-        tcg_rmode = NULL;
         tcg_fpstatus = NULL;
+        tcg_rmode = NULL;
     }
 
     if (size == 3) {
@@ -10276,7 +10269,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12406,8 +12399,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         tcg_fpstatus = NULL;
     }
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
         tcg_rmode = NULL;
     }
@@ -12590,7 +12582,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     clear_vec_high(s, is_q, rd);
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12758,8 +12750,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     }
 
     if (is_scalar) {
@@ -12859,7 +12850,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 3c65dd1ff2..3ca60fb36b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4096,17 +4096,15 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    tmode = tcg_const_i32(arm_rmode_to_sf(mode));
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-
-    gen_helper_set_rmode(tmode, tmode, status);
+    tmode = gen_set_rmode(mode, status);
 
     tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                        vec_full_reg_offset(s, a->rn),
                        pred_full_reg_offset(s, a->pg),
                        status, vsz, vsz, 0, fn);
 
-    gen_helper_set_rmode(tmode, tmode, status);
+    gen_restore_rmode(tmode, status);
     return true;
 }
 
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index e7acfb3338..dd782aacf4 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -464,8 +464,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         fpst = fpstatus_ptr(FPST_FPCR);
     }
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_op;
@@ -489,7 +488,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -533,9 +532,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     }
 
     tcg_shift = tcg_constant_i32(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_double, tcg_res;
@@ -572,7 +569,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -2783,10 +2780,9 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2808,10 +2804,9 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rints(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2842,10 +2837,9 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     tmp = tcg_temp_new_i64();
     vfp_load_reg64(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rintd(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg64(tmp, a->vd);
     return true;
 }
-- 
2.34.1


