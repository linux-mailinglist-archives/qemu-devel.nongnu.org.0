Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9239A5A9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:23:21 +0200 (CEST)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq7s-0002ww-JD
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkk-0000K8-F5
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkg-0006za-Nl
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id y7so1751757wrh.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DHVb1tnpy0DBJtmw7btlmbFe9TBN5mVPiuiCOc9VpHs=;
 b=MdvDLKjZR6PGDqMzg92w4mhORS966G4w9C6Zmwbgg0nHkgI+2OYSVZHXQXLueuYIXw
 7rz3b6u0iCpBwZC7jRgUIr4AEXsxQyTEx+0eDJEJKzSHVpiJxLSiDJjrdl/at5G6buDw
 b20/j5rCcgpgq24VFZJppKHCSqBWro1mE1v5XMjPKp3GOK09U4DHdWxwQfWb4nXWA5yL
 D+lkLwIl1ghUtswQcezsCLBxqqNCEDvyQuOmVXto0aCtp7GWyvtw6cMCRKqvnW2R9c/h
 9Jf2ZDF3F5uuOdtqH7bsPLLozYtng5K00/1v6QYisP55R2cTl1FMtYZtFrlP+T8x0jXx
 k5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHVb1tnpy0DBJtmw7btlmbFe9TBN5mVPiuiCOc9VpHs=;
 b=RM72gIO/4f/slqjS0qpd06cBzFzrjiTRxD71//dDVDdrlto7+Cz3JoxvKnGjbrlgYN
 zXBbALLyRY2gK4nUq+777hnb6LJ/4/Os17BCUNYRz4CMNeJI1Sj3LND6gWSJjkvOvsDT
 jfgcb1pSC2yWwEdBI1ZC/tYlOa0B/jm7S+4qaT79+iahvpv+Vq//TZIbvlWx6g21xq1X
 0KYonybiYtqqzvoQ+vp/dng1syOqUrGwX+rsoAnyhJx4mgMMzJhl5HJBqx9N5/0JSnC3
 3T4JDvkl2H0PYallV2rSO+k5QtetS2wwfac2D+M6xLc1tKpm23sBsm7Mne78mNQqFudB
 8DoA==
X-Gm-Message-State: AOAM530+SvMqxOPNHBSI2xm2oMwhS5+3b9H3C88U5tib3YuolL5CwFHz
 HIWpLtsR5Gd839eJIuV+QwSXgmlJ2UKN/DSS
X-Google-Smtp-Source: ABdhPJxpDg0GnzcNIZRMf/c+qko8qI0h9/oWvTrM/pONRRNfEd+KTjqd1gkffRuVx1VNBPGyJdNhCw==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr680772wru.124.1622735961460;
 Thu, 03 Jun 2021 08:59:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/45] target/arm: Implement vector float32 to bfloat16
 conversion
Date: Thu,  3 Jun 2021 16:58:38 +0100
Message-Id: <20210603155904.26021-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

This is BFCVT{N,T} for both AArch64 AdvSIMD and SVE,
and VCVT.BF16.F32 for AArch32 NEON.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h     |  4 ++++
 target/arm/helper.h         |  1 +
 target/arm/neon-dp.decode   |  1 +
 target/arm/sve.decode       |  2 ++
 target/arm/sve_helper.c     |  2 ++
 target/arm/translate-a64.c  | 17 ++++++++++++++
 target/arm/translate-neon.c | 45 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c  | 16 +++++++++++++
 target/arm/vfp_helper.c     |  7 ++++++
 9 files changed, 95 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 29a14a21f50..dc629f851a3 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1197,6 +1197,8 @@ DEF_HELPER_FLAGS_5(sve_fcvt_hd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_fcvt_sd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_bfcvt, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_fcvtzs_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
@@ -2752,6 +2754,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_bfcvtnt, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 9977a827e97..8b4b7d92f36 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -144,6 +144,7 @@ DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
 DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
 DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
 DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, ptr)
+DEF_HELPER_FLAGS_2(bfcvt_pair, TCG_CALL_NO_RWG, i32, i64, ptr)
 
 DEF_HELPER_2(vfp_uitoh, f16, i32, ptr)
 DEF_HELPER_2(vfp_uitos, f32, i32, ptr)
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index ec83f10ab35..fd3a01bfa0b 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -521,6 +521,7 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
     VRINTZ       1111 001 11 . 11 .. 10 .... 0 1011 . . 0 .... @2misc
 
     VCVT_F16_F32 1111 001 11 . 11 .. 10 .... 0 1100 0 . 0 .... @2misc_q0
+    VCVT_B16_F32 1111 001 11 . 11 .. 10 .... 0 1100 1 . 0 .... @2misc_q0
 
     VRINTM       1111 001 11 . 11 .. 10 .... 0 1101 . . 0 .... @2misc
 
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cb077bfde90..18d1a0eecc5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1036,6 +1036,7 @@ FNMLS_zpzzz     01100101 .. 1 ..... 111 ... ..... .....         @rdn_pg_rm_ra
 # SVE floating-point convert precision
 FCVT_sh         01100101 10 0010 00 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_hs         01100101 10 0010 01 101 ... ..... .....         @rd_pg_rn_e0
+BFCVT           01100101 10 0010 10 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_dh         01100101 11 0010 00 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_hd         01100101 11 0010 01 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_ds         01100101 11 0010 10 101 ... ..... .....         @rd_pg_rn_e0
@@ -1610,6 +1611,7 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+BFCVTNT         01100100 10 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 40af3024dfb..46a957b6fb0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4708,6 +4708,7 @@ static inline uint64_t vfp_float64_to_uint64_rtz(float64 f, float_status *s)
 
 DO_ZPZ_FP(sve_fcvt_sh, uint32_t, H1_4, sve_f32_to_f16)
 DO_ZPZ_FP(sve_fcvt_hs, uint32_t, H1_4, sve_f16_to_f32)
+DO_ZPZ_FP(sve_bfcvt,   uint32_t, H1_4, float32_to_bfloat16)
 DO_ZPZ_FP(sve_fcvt_dh, uint64_t,     , sve_f64_to_f16)
 DO_ZPZ_FP(sve_fcvt_hd, uint64_t,     , sve_f16_to_f64)
 DO_ZPZ_FP(sve_fcvt_ds, uint64_t,     , float64_to_float32)
@@ -7740,6 +7741,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
     } while (i != 0);                                                         \
 }
 
+DO_FCVTNT(sve_bfcvtnt,    uint32_t, uint16_t, H1_4, H1_2, float32_to_bfloat16)
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t,     , H1_4, float64_to_float32)
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b335ca87355..0f15fa42fc3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10353,6 +10353,13 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
                 tcg_temp_free_i32(ahp);
             }
             break;
+        case 0x36: /* BFCVTN, BFCVTN2 */
+            {
+                TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
+                gen_helper_bfcvt_pair(tcg_res[pass], tcg_op, fpst);
+                tcg_temp_free_ptr(fpst);
+            }
+            break;
         case 0x56:  /* FCVTXN, FCVTXN2 */
             /* 64 bit to 32 bit float conversion
              * with von Neumann rounding (round to odd)
@@ -12753,6 +12760,16 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             handle_2misc_narrow(s, false, opcode, 0, is_q, size - 1, rn, rd);
             return;
+        case 0x36: /* BFCVTN, BFCVTN2 */
+            if (!dc_isar_feature(aa64_bf16, s) || size != 2) {
+                unallocated_encoding(s);
+                return;
+            }
+            if (!fp_access_check(s)) {
+                return;
+            }
+            handle_2misc_narrow(s, false, opcode, 0, is_q, size - 1, rn, rd);
+            return;
         case 0x17: /* FCVTL, FCVTL2 */
             if (!fp_access_check(s)) {
                 return;
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 9e990b41eda..6d94229c691 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -3422,6 +3422,51 @@ static bool trans_VSHLL(DisasContext *s, arg_2misc *a)
     return true;
 }
 
+static bool trans_VCVT_B16_F32(DisasContext *s, arg_2misc *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i64 tmp;
+    TCGv_i32 dst0, dst1;
+
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm & 1) || (a->size != 1)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(FPST_STD);
+    tmp = tcg_temp_new_i64();
+    dst0 = tcg_temp_new_i32();
+    dst1 = tcg_temp_new_i32();
+
+    read_neon_element64(tmp, a->vm, 0, MO_64);
+    gen_helper_bfcvt_pair(dst0, tmp, fpst);
+
+    read_neon_element64(tmp, a->vm, 1, MO_64);
+    gen_helper_bfcvt_pair(dst1, tmp, fpst);
+
+    write_neon_element32(dst0, a->vd, 0, MO_32);
+    write_neon_element32(dst1, a->vd, 1, MO_32);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i32(dst0);
+    tcg_temp_free_i32(dst1);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
 static bool trans_VCVT_F16_F32(DisasContext *s, arg_2misc *a)
 {
     TCGv_ptr fpst;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9574efe9578..fb692a18351 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4777,6 +4777,14 @@ static bool trans_FCVT_hs(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hs);
 }
 
+static bool trans_BFCVT(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_bfcvt);
+}
+
 static bool trans_FCVT_dh(DisasContext *s, arg_rpr_esz *a)
 {
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_dh);
@@ -8472,6 +8480,14 @@ static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
 }
 
+static bool trans_BFCVTNT(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_bfcvtnt);
+}
+
 static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
 {
     if (!dc_isar_feature(aa64_sve2, s)) {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 200439ad663..496f0034772 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -416,6 +416,13 @@ uint32_t HELPER(bfcvt)(float32 x, void *status)
     return float32_to_bfloat16(x, status);
 }
 
+uint32_t HELPER(bfcvt_pair)(uint64_t pair, void *status)
+{
+    bfloat16 lo = float32_to_bfloat16(extract64(pair, 0, 32), status);
+    bfloat16 hi = float32_to_bfloat16(extract64(pair, 32, 32), status);
+    return deposit32(lo, 16, 16, hi);
+}
+
 /*
  * VFP3 fixed point conversion. The AArch32 versions of fix-to-float
  * must always round-to-nearest; the AArch64 ones honour the FPSCR
-- 
2.20.1


