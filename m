Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EBF6AB3FD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyue-0005DL-1P; Sun, 05 Mar 2023 19:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytq-0004TF-Dz
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:24 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytn-0006e4-I6
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y11so8538888plg.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4q5sIrHtT2hDUYl1gS2EGn1YWLYEHrvtC0YUjI+4fb4=;
 b=DQ7A3VpnqSwHeTSnmqA+0yiiL+k/bAAyb5SWLOk0yTokF68hPvjJprf4Z+IRkofrUx
 SwmTLwBLhE3U8hCLwbPktnI7Yt00UOkKZ8Kog3LTHhLylpDzJzUFZw/z0hPgaOK1OxD+
 MBsV3rjtzGSMS1Zj7u2MP3BcQtLhqVUaNoU43V3X+QOmgL+I4VEvzfXKsHvz4oV738Gg
 QqjmH6x5pMcMoCKRI2sju7m+bHmhJcYrl7gPmNt5vkMm0n4+OWGX7Vfeya66c0QIT+52
 ivnXlhW20XphNcuvOGpMOut1XVxXdEe3qYbGxIrfSSui0nGphm+Bhyx/CNaixPub/9ur
 rVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4q5sIrHtT2hDUYl1gS2EGn1YWLYEHrvtC0YUjI+4fb4=;
 b=kslSIydtFAu1ketx80Do+0SftPl++EIfqC+Bs/s7VeOMAAxbdOwEWeSqMDYbq94JVj
 IZCeMJ6JL0KNHUpPs4bCIgc30mq4d786xdr+w8ikGcccYmp4GbuMYRdpeyVHgXxVCdQW
 SpvfS8W2b2rV53TpXlUuJG5U8zGyr3c1/9qIZFvK8OSCRnQ6Y12ukKXKe0PyBW7In7YD
 /OmVaN0UJhuF7T6nXZPaiYK5Mx4pda6H9ItsIB+BgiB/doKCxy5sEDYWeSTbdyV7U/tM
 GhGRBEVltpLpv/gc96PMYp+DiZUcWn+nS3wUVE4SKKjpUzpJ7/1fM99ivLs43z8cLGcg
 xXIw==
X-Gm-Message-State: AO0yUKW5V+jcbbehbYBBzN/fQ8RIC8g/fKtYYqOu76F0Yxt5YC5VRCv+
 Ei0mfbxFIq4kkyBJVzzzNiOqF55acUngwVS9nnKoiA==
X-Google-Smtp-Source: AK7set/deAKizmUo6ERa2r4qv4lcYTkvMjTkamwbfQbkj9/9lMiHnLm4NBPwULC13otBRtjh1M5zaA==
X-Received: by 2002:a17:90b:380d:b0:234:bf0:86b9 with SMTP id
 mq13-20020a17090b380d00b002340bf086b9mr9627595pjb.25.1678063217204; 
 Sun, 05 Mar 2023 16:40:17 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 24/84] target/arm: Drop tcg_temp_free from translator-neon.c
Date: Sun,  5 Mar 2023 16:38:54 -0800
Message-Id: <20230306003954.1866998-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-neon.c | 131 +-------------------------------
 1 file changed, 1 insertion(+), 130 deletions(-)

diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 4016339d46..af8685a4ac 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -182,7 +182,6 @@ static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
                        vfp_reg_offset(1, vm),
                        vfp_reg_offset(1, vd),
                        fpst, opr_sz, opr_sz, data, fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -236,7 +235,6 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
                        vfp_reg_offset(1, a->vm),
                        fpst, opr_sz, opr_sz, a->rot,
                        fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -433,7 +431,6 @@ static void gen_neon_ldst_base_update(DisasContext *s, int rm, int rn,
             TCGv_i32 index;
             index = load_reg(s, rm);
             tcg_gen_add_i32(base, base, index);
-            tcg_temp_free_i32(index);
         }
         store_reg(s, rn, base);
     }
@@ -536,8 +533,6 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
             }
         }
     }
-    tcg_temp_free_i32(addr);
-    tcg_temp_free_i64(tmp64);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, nregs * interleave * 8);
     return true;
@@ -630,8 +625,6 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         /* Subsequent memory operations inherit alignment */
         mop &= ~MO_AMASK;
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(addr);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, (1 << size) * nregs);
 
@@ -751,8 +744,6 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         /* Subsequent memory operations inherit alignment */
         mop &= ~MO_AMASK;
     }
-    tcg_temp_free_i32(addr);
-    tcg_temp_free_i32(tmp);
 
     gen_neon_ldst_base_update(s, a->rm, a->rn, (1 << a->size) * nregs);
 
@@ -1061,9 +1052,6 @@ static bool do_3same_pair(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
     write_neon_element32(tmp, a->vd, 0, MO_32);
     write_neon_element32(tmp3, a->vd, 1, MO_32);
 
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(tmp2);
-    tcg_temp_free_i32(tmp3);
     return true;
 }
 
@@ -1126,7 +1114,6 @@ DO_3SAME_VQDMULH(VQRDMULH, qrdmulh)
         TCGv_ptr fpst = fpstatus_ptr(FPST);                             \
         tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, fpst,                \
                            oprsz, maxsz, 0, FUNC);                      \
-        tcg_temp_free_ptr(fpst);                                        \
     }
 
 #define DO_3S_FP_GVEC(INSN,SFUNC,HFUNC)                                 \
@@ -1225,7 +1212,6 @@ static bool do_3same_fp_pair(DisasContext *s, arg_3same *a,
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->vm),
                        fpstatus, 8, 8, 0, fn);
-    tcg_temp_free_ptr(fpstatus);
 
     return true;
 }
@@ -1358,7 +1344,6 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
         read_neon_element64(tmp, a->vm, pass, MO_64);
         fn(tmp, cpu_env, tmp, constimm);
         write_neon_element64(tmp, a->vd, pass, MO_64);
-        tcg_temp_free_i64(tmp);
     }
     return true;
 }
@@ -1403,7 +1388,6 @@ static bool do_2shift_env_32(DisasContext *s, arg_2reg_shift *a,
         fn(tmp, cpu_env, tmp, constimm);
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -1474,10 +1458,6 @@ static bool do_2shift_narrow_64(DisasContext *s, arg_2reg_shift *a,
     narrowfn(rd, cpu_env, rm2);
     write_neon_element32(rd, a->vd, 1, MO_32);
 
-    tcg_temp_free_i32(rd);
-    tcg_temp_free_i64(rm1);
-    tcg_temp_free_i64(rm2);
-
     return true;
 }
 
@@ -1537,22 +1517,17 @@ static bool do_2shift_narrow_32(DisasContext *s, arg_2reg_shift *a,
     shiftfn(rm2, rm2, constimm);
 
     tcg_gen_concat_i32_i64(rtmp, rm1, rm2);
-    tcg_temp_free_i32(rm2);
 
     narrowfn(rm1, cpu_env, rtmp);
     write_neon_element32(rm1, a->vd, 0, MO_32);
-    tcg_temp_free_i32(rm1);
 
     shiftfn(rm3, rm3, constimm);
     shiftfn(rm4, rm4, constimm);
 
     tcg_gen_concat_i32_i64(rtmp, rm3, rm4);
-    tcg_temp_free_i32(rm4);
 
     narrowfn(rm3, cpu_env, rtmp);
-    tcg_temp_free_i64(rtmp);
     write_neon_element32(rm3, a->vd, 1, MO_32);
-    tcg_temp_free_i32(rm3);
     return true;
 }
 
@@ -1660,7 +1635,6 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
     tmp = tcg_temp_new_i64();
 
     widenfn(tmp, rm0);
-    tcg_temp_free_i32(rm0);
     if (a->shift != 0) {
         tcg_gen_shli_i64(tmp, tmp, a->shift);
         tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
@@ -1668,13 +1642,11 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
     write_neon_element64(tmp, a->vd, 0, MO_64);
 
     widenfn(tmp, rm1);
-    tcg_temp_free_i32(rm1);
     if (a->shift != 0) {
         tcg_gen_shli_i64(tmp, tmp, a->shift);
         tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
     }
     write_neon_element64(tmp, a->vd, 1, MO_64);
-    tcg_temp_free_i64(tmp);
     return true;
 }
 
@@ -1733,7 +1705,6 @@ static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
 
     fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
     tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, vec_size, vec_size, a->shift, fn);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -1849,7 +1820,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vn, 0, MO_32);
         widenfn(rn0_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
     if (src2_mop >= 0) {
         read_neon_element64(rm_64, a->vm, 0, src2_mop);
@@ -1857,7 +1827,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vm, 0, MO_32);
         widenfn(rm_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
 
     opfn(rn0_64, rn0_64, rm_64);
@@ -1872,7 +1841,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vn, 1, MO_32);
         widenfn(rn1_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
     if (src2_mop >= 0) {
         read_neon_element64(rm_64, a->vm, 1, src2_mop);
@@ -1880,7 +1848,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
         TCGv_i32 tmp = tcg_temp_new_i32();
         read_neon_element32(tmp, a->vm, 1, MO_32);
         widenfn(rm_64, tmp);
-        tcg_temp_free_i32(tmp);
     }
 
     write_neon_element64(rn0_64, a->vd, 0, MO_64);
@@ -1888,10 +1855,6 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
     opfn(rn1_64, rn1_64, rm_64);
     write_neon_element64(rn1_64, a->vd, 1, MO_64);
 
-    tcg_temp_free_i64(rn0_64);
-    tcg_temp_free_i64(rn1_64);
-    tcg_temp_free_i64(rm_64);
-
     return true;
 }
 
@@ -1976,11 +1939,6 @@ static bool do_narrow_3d(DisasContext *s, arg_3diff *a,
     write_neon_element32(rd0, a->vd, 0, MO_32);
     write_neon_element32(rd1, a->vd, 1, MO_32);
 
-    tcg_temp_free_i32(rd0);
-    tcg_temp_free_i32(rd1);
-    tcg_temp_free_i64(rn_64);
-    tcg_temp_free_i64(rm_64);
-
     return true;
 }
 
@@ -2061,8 +2019,6 @@ static bool do_long_3d(DisasContext *s, arg_3diff *a,
     read_neon_element32(rn, a->vn, 1, MO_32);
     read_neon_element32(rm, a->vm, 1, MO_32);
     opfn(rd1, rn, rm);
-    tcg_temp_free_i32(rn);
-    tcg_temp_free_i32(rm);
 
     /* Don't store results until after all loads: they might overlap */
     if (accfn) {
@@ -2071,13 +2027,10 @@ static bool do_long_3d(DisasContext *s, arg_3diff *a,
         accfn(rd0, tmp, rd0);
         read_neon_element64(tmp, a->vd, 1, MO_64);
         accfn(rd1, tmp, rd1);
-        tcg_temp_free_i64(tmp);
     }
 
     write_neon_element64(rd0, a->vd, 0, MO_64);
     write_neon_element64(rd1, a->vd, 1, MO_64);
-    tcg_temp_free_i64(rd0);
-    tcg_temp_free_i64(rd1);
 
     return true;
 }
@@ -2149,9 +2102,6 @@ static void gen_mull_s32(TCGv_i64 rd, TCGv_i32 rn, TCGv_i32 rm)
 
     tcg_gen_muls2_i32(lo, hi, rn, rm);
     tcg_gen_concat_i32_i64(rd, lo, hi);
-
-    tcg_temp_free_i32(lo);
-    tcg_temp_free_i32(hi);
 }
 
 static void gen_mull_u32(TCGv_i64 rd, TCGv_i32 rn, TCGv_i32 rm)
@@ -2161,9 +2111,6 @@ static void gen_mull_u32(TCGv_i64 rd, TCGv_i32 rn, TCGv_i32 rm)
 
     tcg_gen_mulu2_i32(lo, hi, rn, rm);
     tcg_gen_concat_i32_i64(rd, lo, hi);
-
-    tcg_temp_free_i32(lo);
-    tcg_temp_free_i32(hi);
 }
 
 static bool trans_VMULL_S_3d(DisasContext *s, arg_3diff *a)
@@ -2344,7 +2291,6 @@ static void gen_neon_dup_low16(TCGv_i32 var)
     tcg_gen_ext16u_i32(var, var);
     tcg_gen_shli_i32(tmp, var, 16);
     tcg_gen_or_i32(var, var, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_neon_dup_high16(TCGv_i32 var)
@@ -2353,7 +2299,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
     tcg_gen_andi_i32(var, var, 0xffff0000);
     tcg_gen_shri_i32(tmp, var, 16);
     tcg_gen_or_i32(var, var, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static inline TCGv_i32 neon_get_scalar(int size, int reg)
@@ -2417,12 +2362,9 @@ static bool do_2scalar(DisasContext *s, arg_2scalar *a,
             TCGv_i32 rd = tcg_temp_new_i32();
             read_neon_element32(rd, a->vd, pass, MO_32);
             accfn(tmp, rd, tmp);
-            tcg_temp_free_i32(rd);
         }
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(scalar);
     return true;
 }
 
@@ -2516,7 +2458,6 @@ static bool do_2scalar_fp_vec(DisasContext *s, arg_2scalar *a,
     fpstatus = fpstatus_ptr(a->size == 1 ? FPST_STD_F16 : FPST_STD);
     tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, fpstatus,
                        vec_size, vec_size, idx, fn);
-    tcg_temp_free_ptr(fpstatus);
     return true;
 }
 
@@ -2616,10 +2557,6 @@ static bool do_vqrdmlah_2sc(DisasContext *s, arg_2scalar *a,
         opfn(rd, cpu_env, rn, scalar, rd);
         write_neon_element32(rd, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(rn);
-    tcg_temp_free_i32(rd);
-    tcg_temp_free_i32(scalar);
-
     return true;
 }
 
@@ -2692,8 +2629,6 @@ static bool do_2scalar_long(DisasContext *s, arg_2scalar *a,
     read_neon_element32(rn, a->vn, 1, MO_32);
     rn1_64 = tcg_temp_new_i64();
     opfn(rn1_64, rn, scalar);
-    tcg_temp_free_i32(rn);
-    tcg_temp_free_i32(scalar);
 
     if (accfn) {
         TCGv_i64 t64 = tcg_temp_new_i64();
@@ -2701,13 +2636,10 @@ static bool do_2scalar_long(DisasContext *s, arg_2scalar *a,
         accfn(rn0_64, t64, rn0_64);
         read_neon_element64(t64, a->vd, 1, MO_64);
         accfn(rn1_64, t64, rn1_64);
-        tcg_temp_free_i64(t64);
     }
 
     write_neon_element64(rn0_64, a->vd, 0, MO_64);
     write_neon_element64(rn1_64, a->vd, 1, MO_64);
-    tcg_temp_free_i64(rn0_64);
-    tcg_temp_free_i64(rn1_64);
     return true;
 }
 
@@ -2842,10 +2774,6 @@ static bool trans_VEXT(DisasContext *s, arg_VEXT *a)
         read_neon_element64(left, a->vm, 0, MO_64);
         tcg_gen_extract2_i64(dest, right, left, a->imm * 8);
         write_neon_element64(dest, a->vd, 0, MO_64);
-
-        tcg_temp_free_i64(left);
-        tcg_temp_free_i64(right);
-        tcg_temp_free_i64(dest);
     } else {
         /* Extract 128 bits from <Vm+1:Vm:Vn+1:Vn> */
         TCGv_i64 left, middle, right, destleft, destright;
@@ -2872,12 +2800,6 @@ static bool trans_VEXT(DisasContext *s, arg_VEXT *a)
 
         write_neon_element64(destright, a->vd, 0, MO_64);
         write_neon_element64(destleft, a->vd, 1, MO_64);
-
-        tcg_temp_free_i64(destright);
-        tcg_temp_free_i64(destleft);
-        tcg_temp_free_i64(right);
-        tcg_temp_free_i64(middle);
-        tcg_temp_free_i64(left);
     }
     return true;
 }
@@ -2921,9 +2843,6 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
 
     gen_helper_neon_tbl(val, cpu_env, desc, val, def);
     write_neon_element64(val, a->vd, 0, MO_64);
-
-    tcg_temp_free_i64(def);
-    tcg_temp_free_i64(val);
     return true;
 }
 
@@ -3002,9 +2921,6 @@ static bool trans_VREV64(DisasContext *s, arg_VREV64 *a)
         write_neon_element32(tmp[1], a->vd, pass * 2, MO_32);
         write_neon_element32(tmp[0], a->vd, pass * 2 + 1, MO_32);
     }
-
-    tcg_temp_free_i32(tmp[0]);
-    tcg_temp_free_i32(tmp[1]);
     return true;
 }
 
@@ -3055,20 +2971,15 @@ static bool do_2misc_pairwise(DisasContext *s, arg_2misc *a,
         widenfn(rm0_64, tmp);
         read_neon_element32(tmp, a->vm, pass * 2 + 1, MO_32);
         widenfn(rm1_64, tmp);
-        tcg_temp_free_i32(tmp);
 
         opfn(rd_64, rm0_64, rm1_64);
-        tcg_temp_free_i64(rm0_64);
-        tcg_temp_free_i64(rm1_64);
 
         if (accfn) {
             TCGv_i64 tmp64 = tcg_temp_new_i64();
             read_neon_element64(tmp64, a->vd, pass, MO_64);
             accfn(rd_64, tmp64, rd_64);
-            tcg_temp_free_i64(tmp64);
         }
         write_neon_element64(rd_64, a->vd, pass, MO_64);
-        tcg_temp_free_i64(rd_64);
     }
     return true;
 }
@@ -3192,8 +3103,6 @@ static bool do_zip_uzp(DisasContext *s, arg_2misc *a,
     pd = vfp_reg_ptr(true, a->vd);
     pm = vfp_reg_ptr(true, a->vm);
     fn(pd, pm);
-    tcg_temp_free_ptr(pd);
-    tcg_temp_free_ptr(pm);
     return true;
 }
 
@@ -3271,9 +3180,6 @@ static bool do_vmovn(DisasContext *s, arg_2misc *a,
     narrowfn(rd1, cpu_env, rm);
     write_neon_element32(rd0, a->vd, 0, MO_32);
     write_neon_element32(rd1, a->vd, 1, MO_32);
-    tcg_temp_free_i32(rd0);
-    tcg_temp_free_i32(rd1);
-    tcg_temp_free_i64(rm);
     return true;
 }
 
@@ -3341,10 +3247,6 @@ static bool trans_VSHLL(DisasContext *s, arg_2misc *a)
     widenfn(rd, rm1);
     tcg_gen_shli_i64(rd, rd, 8 << a->size);
     write_neon_element64(rd, a->vd, 1, MO_64);
-
-    tcg_temp_free_i64(rd);
-    tcg_temp_free_i32(rm0);
-    tcg_temp_free_i32(rm1);
     return true;
 }
 
@@ -3385,11 +3287,6 @@ static bool trans_VCVT_B16_F32(DisasContext *s, arg_2misc *a)
 
     write_neon_element32(dst0, a->vd, 0, MO_32);
     write_neon_element32(dst1, a->vd, 1, MO_32);
-
-    tcg_temp_free_i64(tmp);
-    tcg_temp_free_i32(dst0);
-    tcg_temp_free_i32(dst1);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3432,16 +3329,10 @@ static bool trans_VCVT_F16_F32(DisasContext *s, arg_2misc *a)
     tmp3 = tcg_temp_new_i32();
     read_neon_element32(tmp3, a->vm, 3, MO_32);
     write_neon_element32(tmp2, a->vd, 0, MO_32);
-    tcg_temp_free_i32(tmp2);
     gen_helper_vfp_fcvt_f32_to_f16(tmp3, tmp3, fpst, ahp);
     tcg_gen_shli_i32(tmp3, tmp3, 16);
     tcg_gen_or_i32(tmp3, tmp3, tmp);
     write_neon_element32(tmp3, a->vd, 1, MO_32);
-    tcg_temp_free_i32(tmp3);
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(ahp);
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -3482,18 +3373,12 @@ static bool trans_VCVT_F32_F16(DisasContext *s, arg_2misc *a)
     tcg_gen_shri_i32(tmp, tmp, 16);
     gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp);
     write_neon_element32(tmp, a->vd, 1, MO_32);
-    tcg_temp_free_i32(tmp);
     tcg_gen_ext16u_i32(tmp3, tmp2);
     gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
     write_neon_element32(tmp3, a->vd, 2, MO_32);
-    tcg_temp_free_i32(tmp3);
     tcg_gen_shri_i32(tmp2, tmp2, 16);
     gen_helper_vfp_fcvt_f16_to_f32(tmp2, tmp2, fpst, ahp);
     write_neon_element32(tmp2, a->vd, 3, MO_32);
-    tcg_temp_free_i32(tmp2);
-    tcg_temp_free_i32(ahp);
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -3628,8 +3513,6 @@ static bool do_2misc(DisasContext *s, arg_2misc *a, NeonGenOneOpFn *fn)
         fn(tmp, tmp);
         write_neon_element32(tmp, a->vd, pass, MO_32);
     }
-    tcg_temp_free_i32(tmp);
-
     return true;
 }
 
@@ -3790,7 +3673,6 @@ static bool trans_VQNEG(DisasContext *s, arg_2misc *a)
         fpst = fpstatus_ptr(vece == MO_16 ? FPST_STD_F16 : FPST_STD);   \
         tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, oprsz, maxsz, 0,       \
                            fns[vece]);                                  \
-        tcg_temp_free_ptr(fpst);                                        \
     }                                                                   \
     static bool trans_##INSN(DisasContext *s, arg_2misc *a)             \
     {                                                                   \
@@ -3841,7 +3723,6 @@ static bool trans_VRINTX(DisasContext *s, arg_2misc *a)
         fpst = fpstatus_ptr(vece == 1 ? FPST_STD_F16 : FPST_STD);       \
         tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, oprsz, maxsz,          \
                            arm_rmode_to_sf(RMODE), fns[vece]);          \
-        tcg_temp_free_ptr(fpst);                                        \
     }                                                                   \
     static bool trans_##INSN(DisasContext *s, arg_2misc *a)             \
     {                                                                   \
@@ -3908,11 +3789,9 @@ static bool trans_VSWP(DisasContext *s, arg_2misc *a)
         write_neon_element64(rm, a->vd, pass, MO_64);
         write_neon_element64(rd, a->vm, pass, MO_64);
     }
-    tcg_temp_free_i64(rm);
-    tcg_temp_free_i64(rd);
-
     return true;
 }
+
 static void gen_neon_trn_u8(TCGv_i32 t0, TCGv_i32 t1)
 {
     TCGv_i32 rd, tmp;
@@ -3930,9 +3809,6 @@ static void gen_neon_trn_u8(TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_andi_i32(tmp, t0, 0xff00ff00);
     tcg_gen_or_i32(t1, t1, tmp);
     tcg_gen_mov_i32(t0, rd);
-
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(rd);
 }
 
 static void gen_neon_trn_u16(TCGv_i32 t0, TCGv_i32 t1)
@@ -3949,9 +3825,6 @@ static void gen_neon_trn_u16(TCGv_i32 t0, TCGv_i32 t1)
     tcg_gen_andi_i32(tmp, t0, 0xffff0000);
     tcg_gen_or_i32(t1, t1, tmp);
     tcg_gen_mov_i32(t0, rd);
-
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(rd);
 }
 
 static bool trans_VTRN(DisasContext *s, arg_2misc *a)
@@ -4003,8 +3876,6 @@ static bool trans_VTRN(DisasContext *s, arg_2misc *a)
             write_neon_element32(tmp, a->vd, pass, MO_32);
         }
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(tmp2);
     return true;
 }
 
-- 
2.34.1


