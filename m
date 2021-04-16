Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424DC362C3C
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:06:24 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYTf-0006K7-98
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN9-0005Hu-BS
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN5-0005cf-IA
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:39 -0400
Received: by mail-pf1-x42a.google.com with SMTP id o123so19363735pfb.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIH2aCJSKpFkJSYIcY5Sz/FYdp4UfedtSiKpRThzUXc=;
 b=ordiiuDTo0r+G4KqvQQ+tSQxEsOe73DDWs9TdVCyyhY7pL++mkxu6+/QBsVscmMebo
 qRJTxTABedrZDWjjb8g3nwY3/faKMrsRMAEw7Cgk2FIO4Y3e4b+Ekc6M4Scg9THo12rj
 q2Pmt6dENOxzxVlNn81dg46ZMVy38WAZkiPZelPiGWocO5kl4WUrb48zv6RT5jxWo28z
 4OLOzu3WIAWM0TO0J4sgpd/tKpyZ/ibxe5V3j0HjJdXSRy59EZVNAz7SlJYSrZRRfmi2
 8BjRFM0/2grpMXQ5oUH0KUR9dNoq8CM5qW9IeN+3NO+7o3DY4fkDrtd04UVYhCGx1yPD
 SNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIH2aCJSKpFkJSYIcY5Sz/FYdp4UfedtSiKpRThzUXc=;
 b=m7FO6OyLPXd3vr6lDJvGqFHDWmzuqCurO1xzfSNK8nG7RxDl9FtGMYdGLRUbWSOsl3
 oCPtFnJ8upM5/oUxWVnG9DxhbU6PTSrXuYZzjSQzGEYkriJBf1j5tRKZNeURLWi+Kxxr
 nOpRtaXkiVviNiQdxspLDvsg9BX+bzGTFmwvZ4hF6pWLgHBLYFMFUkLh/ZxmrfzS4J8k
 hEOMNNjbor2V2UvNPWKkdE2ljMjBtV6ddxUjhc7T3eoq22bsqc2Fcr52Fa+yV0h0ZNIX
 Hy0Y4tLLOlrL8B/H9jrixSssD7rVtnoqL/OrsMRN/8hR5wBpbpobkFfqvhPo7xxgljQm
 b5fA==
X-Gm-Message-State: AOAM531/diAwxhxW6koh4dLQo0ghese/yEa89FHE07JXg8kzCnuHteEk
 WdCF9X3XldsGRVGxTzXCAlvdMRqrCvEvxg==
X-Google-Smtp-Source: ABdhPJzm7NoPxtCZGyTUMaKaUkewcUOUUYhBfK6DMeWLcoDmLtuZigokRp6BRp5jhR0J6/gJKOKbHA==
X-Received: by 2002:a62:d10c:0:b029:23e:7499:b74b with SMTP id
 z12-20020a62d10c0000b029023e7499b74bmr10178087pfg.46.1618617574159; 
 Fri, 16 Apr 2021 16:59:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/11] target/arm: Implement vector float32 to bfloat16
 conversion
Date: Fri, 16 Apr 2021 16:59:21 -0700
Message-Id: <20210416235928.1631788-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is BFCVT{N,T} for both AArch64 AdvSIMD and SVE,
and VCVT.BF16.F32 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h         |  4 +++
 target/arm/helper.h             |  1 +
 target/arm/neon-dp.decode       |  1 +
 target/arm/sve.decode           |  2 ++
 target/arm/sve_helper.c         |  2 ++
 target/arm/translate-a64.c      | 17 +++++++++++++
 target/arm/translate-sve.c      | 16 ++++++++++++
 target/arm/vfp_helper.c         |  7 +++++
 target/arm/translate-neon.c.inc | 45 +++++++++++++++++++++++++++++++++
 9 files changed, 95 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index fa7418e706..9287e6f26c 100644
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
@@ -2744,6 +2746,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_bfcvtnt, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0892207f80..0b52ee6256 100644
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
index ec83f10ab3..fd3a01bfa0 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -521,6 +521,7 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
     VRINTZ       1111 001 11 . 11 .. 10 .... 0 1011 . . 0 .... @2misc
 
     VCVT_F16_F32 1111 001 11 . 11 .. 10 .... 0 1100 0 . 0 .... @2misc_q0
+    VCVT_B16_F32 1111 001 11 . 11 .. 10 .... 0 1100 1 . 0 .... @2misc_q0
 
     VRINTM       1111 001 11 . 11 .. 10 .... 0 1101 . . 0 .... @2misc
 
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 3d7c4fa6e5..bad81580c5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -987,6 +987,7 @@ FNMLS_zpzzz     01100101 .. 1 ..... 111 ... ..... .....         @rdn_pg_rm_ra
 # SVE floating-point convert precision
 FCVT_sh         01100101 10 0010 00 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_hs         01100101 10 0010 01 101 ... ..... .....         @rd_pg_rn_e0
+BFCVT           01100101 10 0010 10 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_dh         01100101 11 0010 00 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_hd         01100101 11 0010 01 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_ds         01100101 11 0010 10 101 ... ..... .....         @rd_pg_rn_e0
@@ -1561,6 +1562,7 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+BFCVTNT         01100100 10 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c5c3017745..ae3db11c0d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4570,6 +4570,7 @@ static inline uint64_t vfp_float64_to_uint64_rtz(float64 f, float_status *s)
 
 DO_ZPZ_FP(sve_fcvt_sh, uint32_t, H1_4, sve_f32_to_f16)
 DO_ZPZ_FP(sve_fcvt_hs, uint32_t, H1_4, sve_f16_to_f32)
+DO_ZPZ_FP(sve_bfcvt,   uint32_t, H1_4, float32_to_bfloat16)
 DO_ZPZ_FP(sve_fcvt_dh, uint64_t,     , sve_f64_to_f16)
 DO_ZPZ_FP(sve_fcvt_hd, uint64_t,     , sve_f16_to_f64)
 DO_ZPZ_FP(sve_fcvt_ds, uint64_t,     , float64_to_float32)
@@ -7567,6 +7568,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
 }
 
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve_bfcvtnt,    uint32_t, uint16_t, H1_4, H1_2, float32_to_bfloat16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
 
 #define DO_FCVTLT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d767194cc7..c528fb2cf0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10361,6 +10361,13 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
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
@@ -12761,6 +12768,16 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cb0e7a1f68..aacbabd11e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4715,6 +4715,14 @@ static bool trans_FCVT_hs(DisasContext *s, arg_rpr_esz *a)
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
@@ -8405,6 +8413,14 @@ static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
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
index fe7a2a5daa..3328423cec 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -413,6 +413,13 @@ uint32_t HELPER(bfcvt)(float32 x, void *status)
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
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f1893b1dc8..8cc53892d6 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -3413,6 +3413,51 @@ static bool trans_VSHLL(DisasContext *s, arg_2misc *a)
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
-- 
2.25.1


