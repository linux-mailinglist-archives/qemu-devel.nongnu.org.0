Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90506AB3EA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyun-0006Yv-9M; Sun, 05 Mar 2023 19:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyto-0004Sh-9o
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:23 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytm-0006dT-7a
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:20 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so7389590pjp.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3RklgHu53cdNNN8bJNWeKGzc/+2wyl48Qw7A2owH98Q=;
 b=b5N4vWhTF8dGCRyyfg+I/KCLHSP0rGrg/wAoViyj3Xp0D0KAW8OALf7HTTJpoOWNWX
 2J+V5We8Kns/oRte9cmqOdGMSlSEQBRONycl6fOfIDwfp7YVF/LxuycuqO7E2/6Gq/X4
 Aj16Z/E+EOBQUlGGWt7SfSw3wRH78rLVuiFlcWOfdPOSM/wG06cH+8pyVhtok0KIcAWe
 1FDvLc3ByHW0Eul+mylsFwzmqPELdJATBBn9Q6ENox4EVK9tMWSytLe+jRGING+fs66A
 mLGA66kSUIOczB3Nw7VLSDVFfgbSf3lzgrYu9RokxHx5AQomo2EsME0V+sh3Rks1MwyP
 AY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3RklgHu53cdNNN8bJNWeKGzc/+2wyl48Qw7A2owH98Q=;
 b=gFlUAB3CweDGR+rq31lG/D3+t0yc6f5hXMSSMtyZeUiy9aUmzDDuuIdvA3pTYF3NfL
 05sGDVl4c22HRbw3VxVQYI1Jywo/X9gRbPE9d1K2CqbtwI5ivR2SYBnbPcoMXuNK6dAC
 G0IoCMhEVEVaY6vvxAioO9eACtrOZVvoFLymqNXIuJIriqP/7S7lIefscaAkRWu35E8w
 I5wWqCgFn/dLGFKFVOcR40yxky9UwE4BkGFS2g3crwyU5FIJE8q4jmXvCAzci2N/ZRox
 Uqw0kksOE6GpGnQld2yd4Cj2ODOLWQIbixGIA0PrYnANakltQp9PzUwMiPdIAG/+zPiC
 Ff9A==
X-Gm-Message-State: AO0yUKXuFU8G8mkcUxPBx5ShUDzUhiDiYoDV6HRQh9FWxyZIZ18SJ4p8
 U8JpVoO4Kuj50/dmn1Lo/GjrQpC2x3I/QI1Ypn4kEQ==
X-Google-Smtp-Source: AK7set9ClSbraViuPcu3+AEfUvJLH5bNa3Gg1fuAsSgYpqzMAZQR+TZf+mIFkq+Eylr9vjULhxLcZg==
X-Received: by 2002:a17:90b:1c03:b0:237:35f9:655c with SMTP id
 oc3-20020a17090b1c0300b0023735f9655cmr9469793pjb.36.1678063216372; 
 Sun, 05 Mar 2023 16:40:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 23/84] target/arm: Drop tcg_temp_free from translator-mve.c
Date: Sun,  5 Mar 2023 16:38:53 -0800
Message-Id: <20230306003954.1866998-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
 target/arm/tcg/translate-mve.c | 52 ----------------------------------
 1 file changed, 52 deletions(-)

diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index db7ea3f603..798b4fddfe 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -178,7 +178,6 @@ static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn,
 
     qreg = mve_qreg_ptr(a->qd);
     fn(cpu_env, qreg, addr);
-    tcg_temp_free_ptr(qreg);
 
     /*
      * Writeback always happens after the last beat of the insn,
@@ -189,8 +188,6 @@ static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
     mve_update_eci(s);
     return true;
@@ -242,9 +239,6 @@ static bool do_ldst_sg(DisasContext *s, arg_vldst_sg *a, MVEGenLdStSGFn fn)
     qd = mve_qreg_ptr(a->qd);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qd, qm, addr);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
-    tcg_temp_free_i32(addr);
     mve_update_eci(s);
     return true;
 }
@@ -341,8 +335,6 @@ static bool do_ldst_sg_imm(DisasContext *s, arg_vldst_sg_imm *a,
     qd = mve_qreg_ptr(a->qd);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qd, qm, tcg_constant_i32(offset));
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
     mve_update_eci(s);
     return true;
 }
@@ -414,8 +406,6 @@ static bool do_vldst_il(DisasContext *s, arg_vldst_il *a, MVEGenLdStIlFn *fn,
     if (a->w) {
         tcg_gen_addi_i32(rn, rn, addrinc);
         store_reg(s, a->rn, rn);
-    } else {
-        tcg_temp_free_i32(rn);
     }
     mve_update_and_store_eci(s);
     return true;
@@ -506,9 +496,7 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
         qd = mve_qreg_ptr(a->qd);
         tcg_gen_dup_i32(a->size, rt, rt);
         gen_helper_mve_vdup(cpu_env, qd, rt);
-        tcg_temp_free_ptr(qd);
     }
-    tcg_temp_free_i32(rt);
     mve_update_eci(s);
     return true;
 }
@@ -534,8 +522,6 @@ static bool do_1op_vec(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn,
         qd = mve_qreg_ptr(a->qd);
         qm = mve_qreg_ptr(a->qm);
         fn(cpu_env, qd, qm);
-        tcg_temp_free_ptr(qd);
-        tcg_temp_free_ptr(qm);
     }
     mve_update_eci(s);
     return true;
@@ -631,8 +617,6 @@ static bool do_vcvt_rmode(DisasContext *s, arg_1op *a,
     qd = mve_qreg_ptr(a->qd);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qd, qm, tcg_constant_i32(arm_rmode_to_sf(rmode)));
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
     mve_update_eci(s);
     return true;
 }
@@ -821,9 +805,6 @@ static bool do_2op_vec(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn,
         qn = mve_qreg_ptr(a->qn);
         qm = mve_qreg_ptr(a->qm);
         fn(cpu_env, qd, qn, qm);
-        tcg_temp_free_ptr(qd);
-        tcg_temp_free_ptr(qn);
-        tcg_temp_free_ptr(qm);
     }
     mve_update_eci(s);
     return true;
@@ -1076,9 +1057,6 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     qn = mve_qreg_ptr(a->qn);
     rm = load_reg(s, a->rm);
     fn(cpu_env, qd, qn, rm);
-    tcg_temp_free_i32(rm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qn);
     mve_update_eci(s);
     return true;
 }
@@ -1204,15 +1182,11 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
         tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
-        tcg_temp_free_i32(rdalo);
-        tcg_temp_free_i32(rdahi);
     } else {
         rda = tcg_const_i64(0);
     }
 
     fn(rda, cpu_env, qn, qm, rda);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
@@ -1220,7 +1194,6 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
     tcg_gen_extrh_i64_i32(rdahi, rda);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
-    tcg_temp_free_i64(rda);
     mve_update_eci(s);
     return true;
 }
@@ -1312,8 +1285,6 @@ static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
 
     fn(rda, cpu_env, qn, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
 
     mve_update_eci(s);
     return true;
@@ -1451,7 +1422,6 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
     qm = mve_qreg_ptr(a->qm);
     fns[a->size][a->u](rda, cpu_env, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qm);
 
     mve_update_eci(s);
     return true;
@@ -1494,8 +1464,6 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
         tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
-        tcg_temp_free_i32(rdalo);
-        tcg_temp_free_i32(rdahi);
     } else {
         /* Accumulate starting at zero */
         rda = tcg_const_i64(0);
@@ -1507,7 +1475,6 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
     } else {
         gen_helper_mve_vaddlv_s(rda, cpu_env, qm, rda);
     }
-    tcg_temp_free_ptr(qm);
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
@@ -1515,7 +1482,6 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
     tcg_gen_extrh_i64_i32(rdahi, rda);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
-    tcg_temp_free_i64(rda);
     mve_update_eci(s);
     return true;
 }
@@ -1543,7 +1509,6 @@ static bool do_1imm(DisasContext *s, arg_1imm *a, MVEGenOneOpImmFn *fn,
     } else {
         qd = mve_qreg_ptr(a->qd);
         fn(cpu_env, qd, tcg_constant_i64(imm));
-        tcg_temp_free_ptr(qd);
     }
     mve_update_eci(s);
     return true;
@@ -1616,8 +1581,6 @@ static bool do_2shift_vec(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
         qd = mve_qreg_ptr(a->qd);
         qm = mve_qreg_ptr(a->qm);
         fn(cpu_env, qd, qm, tcg_constant_i32(shift));
-        tcg_temp_free_ptr(qd);
-        tcg_temp_free_ptr(qm);
     }
     mve_update_eci(s);
     return true;
@@ -1723,8 +1686,6 @@ static bool do_2shift_scalar(DisasContext *s, arg_shl_scalar *a,
     qda = mve_qreg_ptr(a->qda);
     rm = load_reg(s, a->rm);
     fn(cpu_env, qda, qda, rm);
-    tcg_temp_free_ptr(qda);
-    tcg_temp_free_i32(rm);
     mve_update_eci(s);
     return true;
 }
@@ -1868,7 +1829,6 @@ static bool trans_VSHLC(DisasContext *s, arg_VSHLC *a)
     rdm = load_reg(s, a->rdm);
     gen_helper_mve_vshlc(rdm, cpu_env, qd, rdm, tcg_constant_i32(a->imm));
     store_reg(s, a->rdm, rdm);
-    tcg_temp_free_ptr(qd);
     mve_update_eci(s);
     return true;
 }
@@ -1898,7 +1858,6 @@ static bool do_vidup(DisasContext *s, arg_vidup *a, MVEGenVIDUPFn *fn)
     rn = load_reg(s, a->rn);
     fn(rn, cpu_env, qd, rn, tcg_constant_i32(a->imm));
     store_reg(s, a->rn, rn);
-    tcg_temp_free_ptr(qd);
     mve_update_eci(s);
     return true;
 }
@@ -1934,8 +1893,6 @@ static bool do_viwdup(DisasContext *s, arg_viwdup *a, MVEGenVIWDUPFn *fn)
     rm = load_reg(s, a->rm);
     fn(rn, cpu_env, qd, rn, rm, tcg_constant_i32(a->imm));
     store_reg(s, a->rn, rn);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_i32(rm);
     mve_update_eci(s);
     return true;
 }
@@ -2001,8 +1958,6 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
     qn = mve_qreg_ptr(a->qn);
     qm = mve_qreg_ptr(a->qm);
     fn(cpu_env, qn, qm);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
     if (a->mask) {
         /* VPT */
         gen_vpst(s, a->mask);
@@ -2034,8 +1989,6 @@ static bool do_vcmp_scalar(DisasContext *s, arg_vcmp_scalar *a,
         rm = load_reg(s, a->rm);
     }
     fn(cpu_env, qn, rm);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_i32(rm);
     if (a->mask) {
         /* VPT */
         gen_vpst(s, a->mask);
@@ -2138,7 +2091,6 @@ static bool do_vmaxv(DisasContext *s, arg_vmaxv *a, MVEGenVADDVFn fn)
     rda = load_reg(s, a->rda);
     fn(rda, cpu_env, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qm);
     mve_update_eci(s);
     return true;
 }
@@ -2203,8 +2155,6 @@ static bool do_vabav(DisasContext *s, arg_vabav *a, MVEGenVABAVFn *fn)
     rda = load_reg(s, a->rda);
     fn(rda, cpu_env, qn, qm, rda);
     store_reg(s, a->rda, rda);
-    tcg_temp_free_ptr(qm);
-    tcg_temp_free_ptr(qn);
     mve_update_eci(s);
     return true;
 }
@@ -2297,12 +2247,10 @@ static bool trans_VMOV_from_2gp(DisasContext *s, arg_VMOV_to_2gp *a)
     if (!mve_skip_vmov(s, vd, a->idx, MO_32)) {
         tmp = load_reg(s, a->rt);
         write_neon_element32(tmp, vd, a->idx, MO_32);
-        tcg_temp_free_i32(tmp);
     }
     if (!mve_skip_vmov(s, vd + 1, a->idx, MO_32)) {
         tmp = load_reg(s, a->rt2);
         write_neon_element32(tmp, vd + 1, a->idx, MO_32);
-        tcg_temp_free_i32(tmp);
     }
 
     mve_update_and_store_eci(s);
-- 
2.34.1


