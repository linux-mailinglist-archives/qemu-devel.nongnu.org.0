Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707536AB3E2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:46:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuf-0005dR-PB; Sun, 05 Mar 2023 19:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytr-0004UL-Ns
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:25 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyto-0006ZS-Op
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:23 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so8530763pla.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMUVh1LC7l9pltMHYpB0o+3YIPD9k2nPVK+U/HdgYlM=;
 b=maMnbrp0fSLims9foJu6pmmU39GBM7hzBNFuyn3uIuHIBxlSfoIlCzqwiPIFf499Dc
 2JoGqRsjXpqn5x+8sR4sa0mDK0rlQeBFwCF5xCdvxbjTdZKl39vu1ZTpx5I9IexwImGM
 5wXgEc4CRQAkBL0DLNmeF9iVOx5AGgK+n9BNto27gTPXtWIhrXrYv+8rvubU62GZXk/g
 zuconarxasRr1dymOvTQyGoAjVa64M6dCDSoxRY2ANcV/Y+G7m22wsUXMEd8gNKpwbDn
 DZ+eTT4lSiPJUJ9y6WWyVpVhSQF8Nt0+dQu5jKQpzO7uPZKffZDleeY4AMi/ME73+fpR
 ZCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMUVh1LC7l9pltMHYpB0o+3YIPD9k2nPVK+U/HdgYlM=;
 b=hEDjsLao/O92N1ncdPgHiEZAhq789c+WZrNqymXJdbVuPBmeXg92rI9v54Z3Gk/ST8
 3XnXcuFS9egSURbXCp+DPiK6l069+JyHNWZZGmqV+MIv0ekVbBkmboqNy43bv+KlNUlO
 KgCy+MBfCg5XMYqjS5edGTspf2a4+4SFivRP+Kmrsa+I/qpLBYwrHxedu8ew80hS3QRc
 XPZx9BGOfReB26fcCee+cezwbam+Q/MTD0+3howh930SWmC6iYDz8uUEOKnq1XvT/Ger
 ageZsp4EpGL1BtDrEdZiJ65gTgz50+LapQ8byTKXx65kHohFHOzKYQoplCQ3A4v7CuIk
 A4vw==
X-Gm-Message-State: AO0yUKXRCoHiCrR1hirDu+DGhAc5dg2tUmvAH42JYgyGrwnMd0tCXzTa
 ZUMpVZAbMVnHh//PqRD0c1KzHpgTreKC9L8kKXUGrQ==
X-Google-Smtp-Source: AK7set9Tg2+BB/AF24EeLfdYq0NC0uMX6yXu6j7LUjKVwSepxVXvgCUm43OzyGmgI6FCStrO4KU9jQ==
X-Received: by 2002:a17:90b:1bc4:b0:237:b5d4:c0e3 with SMTP id
 oa4-20020a17090b1bc400b00237b5d4c0e3mr9855754pjb.33.1678063219887; 
 Sun, 05 Mar 2023 16:40:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 27/84] target/arm: Drop tcg_temp_free from translator-vfp.c
Date: Sun,  5 Mar 2023 16:38:57 -0800
Message-Id: <20230306003954.1866998-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 target/arm/tcg/translate-vfp.c | 193 ---------------------------------
 1 file changed, 193 deletions(-)

diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 5c5d58d2c6..757a2bf7d9 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -178,7 +178,6 @@ static void gen_update_fp_context(DisasContext *s)
 
         fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(fpscr);
         if (dc_isar_feature(aa32_mve, s)) {
             store_cpu_field(tcg_constant_i32(0), v7m.vpr);
         }
@@ -365,24 +364,15 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
             tmp = tcg_temp_new_i64();
             tcg_gen_xor_i64(tmp, vf, nf);
             tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero, frn, frm);
-            tcg_temp_free_i64(tmp);
             break;
         case 3: /* gt: !Z && N == V */
             tcg_gen_movcond_i64(TCG_COND_NE, dest, zf, zero, frn, frm);
             tmp = tcg_temp_new_i64();
             tcg_gen_xor_i64(tmp, vf, nf);
             tcg_gen_movcond_i64(TCG_COND_GE, dest, tmp, zero, dest, frm);
-            tcg_temp_free_i64(tmp);
             break;
         }
         vfp_store_reg64(dest, rd);
-        tcg_temp_free_i64(frn);
-        tcg_temp_free_i64(frm);
-        tcg_temp_free_i64(dest);
-
-        tcg_temp_free_i64(zf);
-        tcg_temp_free_i64(nf);
-        tcg_temp_free_i64(vf);
     } else {
         TCGv_i32 frn, frm, dest;
         TCGv_i32 tmp, zero;
@@ -405,14 +395,12 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
             tmp = tcg_temp_new_i32();
             tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
             tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero, frn, frm);
-            tcg_temp_free_i32(tmp);
             break;
         case 3: /* gt: !Z && N == V */
             tcg_gen_movcond_i32(TCG_COND_NE, dest, cpu_ZF, zero, frn, frm);
             tmp = tcg_temp_new_i32();
             tcg_gen_xor_i32(tmp, cpu_VF, cpu_NF);
             tcg_gen_movcond_i32(TCG_COND_GE, dest, tmp, zero, dest, frm);
-            tcg_temp_free_i32(tmp);
             break;
         }
         /* For fp16 the top half is always zeroes */
@@ -420,9 +408,6 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
             tcg_gen_andi_i32(dest, dest, 0xffff);
         }
         vfp_store_reg32(dest, rd);
-        tcg_temp_free_i32(frn);
-        tcg_temp_free_i32(frm);
-        tcg_temp_free_i32(dest);
     }
 
     return true;
@@ -490,8 +475,6 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         vfp_load_reg64(tcg_op, rm);
         gen_helper_rintd(tcg_res, tcg_op, fpst);
         vfp_store_reg64(tcg_res, rd);
-        tcg_temp_free_i64(tcg_op);
-        tcg_temp_free_i64(tcg_res);
     } else {
         TCGv_i32 tcg_op;
         TCGv_i32 tcg_res;
@@ -504,14 +487,9 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
             gen_helper_rints(tcg_res, tcg_op, fpst);
         }
         vfp_store_reg32(tcg_res, rd);
-        tcg_temp_free_i32(tcg_op);
-        tcg_temp_free_i32(tcg_res);
     }
 
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-    tcg_temp_free_i32(tcg_rmode);
-
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -573,9 +551,6 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         }
         tcg_gen_extrl_i64_i32(tcg_tmp, tcg_res);
         vfp_store_reg32(tcg_tmp, rd);
-        tcg_temp_free_i32(tcg_tmp);
-        tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_double);
     } else {
         TCGv_i32 tcg_single, tcg_res;
         tcg_single = tcg_temp_new_i32();
@@ -595,15 +570,9 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
             }
         }
         vfp_store_reg32(tcg_res, rd);
-        tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_single);
     }
 
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-    tcg_temp_free_i32(tcg_rmode);
-
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -729,7 +698,6 @@ static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
     if (!mve_skip_vmov(s, a->vn, a->index, a->size)) {
         tmp = load_reg(s, a->rt);
         write_neon_element32(tmp, a->vn, a->index, a->size);
-        tcg_temp_free_i32(tmp);
     }
 
     if (dc_isar_feature(aa32_mve, s)) {
@@ -777,8 +745,6 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     tmp = load_reg(s, a->rt);
     tcg_gen_gvec_dup_i32(size, neon_full_reg_offset(a->vn),
                          vec_size, vec_size, tmp);
-    tcg_temp_free_i32(tmp);
-
     return true;
 }
 
@@ -883,7 +849,6 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         if (a->rt == 15) {
             /* Set the 4 flag bits in the CPSR.  */
             gen_set_nzcv(tmp);
-            tcg_temp_free_i32(tmp);
         } else {
             store_reg(s, a->rt, tmp);
         }
@@ -899,7 +864,6 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_FPSCR:
             tmp = load_reg(s, a->rt);
             gen_helper_vfp_set_fpscr(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
             gen_lookup_tb(s);
             break;
         case ARM_VFP_FPEXC:
@@ -954,7 +918,6 @@ static bool trans_VMOV_half(DisasContext *s, arg_VMOV_single *a)
         tmp = load_reg(s, a->rt);
         tcg_gen_andi_i32(tmp, tmp, 0xffff);
         vfp_store_reg32(tmp, a->vn);
-        tcg_temp_free_i32(tmp);
     }
 
     return true;
@@ -979,7 +942,6 @@ static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
         if (a->rt == 15) {
             /* Set the 4 flag bits in the CPSR.  */
             gen_set_nzcv(tmp);
-            tcg_temp_free_i32(tmp);
         } else {
             store_reg(s, a->rt, tmp);
         }
@@ -987,7 +949,6 @@ static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
         /* general purpose register to VFP */
         tmp = load_reg(s, a->rt);
         vfp_store_reg32(tmp, a->vn);
-        tcg_temp_free_i32(tmp);
     }
 
     return true;
@@ -1021,10 +982,8 @@ static bool trans_VMOV_64_sp(DisasContext *s, arg_VMOV_64_sp *a)
         /* gpreg to fpreg */
         tmp = load_reg(s, a->rt);
         vfp_store_reg32(tmp, a->vm);
-        tcg_temp_free_i32(tmp);
         tmp = load_reg(s, a->rt2);
         vfp_store_reg32(tmp, a->vm + 1);
-        tcg_temp_free_i32(tmp);
     }
 
     return true;
@@ -1064,10 +1023,8 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_dp *a)
         /* gpreg to fpreg */
         tmp = load_reg(s, a->rt);
         vfp_store_reg32(tmp, a->vm * 2);
-        tcg_temp_free_i32(tmp);
         tmp = load_reg(s, a->rt2);
         vfp_store_reg32(tmp, a->vm * 2 + 1);
-        tcg_temp_free_i32(tmp);
     }
 
     return true;
@@ -1102,9 +1059,6 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
         vfp_load_reg32(tmp, a->vd);
         gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1136,9 +1090,6 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
         vfp_load_reg32(tmp, a->vd);
         gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1177,9 +1128,6 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
         vfp_load_reg64(tmp, a->vd);
         gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_UQ | MO_ALIGN_4);
     }
-    tcg_temp_free_i64(tmp);
-    tcg_temp_free_i32(addr);
-
     return true;
 }
 
@@ -1246,7 +1194,6 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-    tcg_temp_free_i32(tmp);
     if (a->w) {
         /* writeback */
         if (a->p) {
@@ -1254,8 +1201,6 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
 
     clear_eci_state(s);
@@ -1332,7 +1277,6 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-    tcg_temp_free_i64(tmp);
     if (a->w) {
         /* writeback */
         if (a->p) {
@@ -1347,8 +1291,6 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
 
     clear_eci_state(s);
@@ -1485,12 +1427,6 @@ static bool do_vfp_3op_sp(DisasContext *s, VFPGen3OpSPFn *fn,
             vfp_load_reg32(f1, vm);
         }
     }
-
-    tcg_temp_free_i32(f0);
-    tcg_temp_free_i32(f1);
-    tcg_temp_free_i32(fd);
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -1533,12 +1469,6 @@ static bool do_vfp_3op_hp(DisasContext *s, VFPGen3OpSPFn *fn,
     }
     fn(fd, f0, f1, fpst);
     vfp_store_reg32(fd, vd);
-
-    tcg_temp_free_i32(f0);
-    tcg_temp_free_i32(f1);
-    tcg_temp_free_i32(fd);
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -1615,12 +1545,6 @@ static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
             vfp_load_reg64(f1, vm);
         }
     }
-
-    tcg_temp_free_i64(f0);
-    tcg_temp_free_i64(f1);
-    tcg_temp_free_i64(fd);
-    tcg_temp_free_ptr(fpst);
-
     return true;
 }
 
@@ -1688,10 +1612,6 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
         vm = vfp_advance_sreg(vm, delta_m);
         vfp_load_reg32(f0, vm);
     }
-
-    tcg_temp_free_i32(f0);
-    tcg_temp_free_i32(fd);
-
     return true;
 }
 
@@ -1724,7 +1644,6 @@ static bool do_vfp_2op_hp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
     vfp_load_reg32(f0, vm);
     fn(f0, f0);
     vfp_store_reg32(f0, vd);
-    tcg_temp_free_i32(f0);
 
     return true;
 }
@@ -1798,10 +1717,6 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
         vd = vfp_advance_dreg(vm, delta_m);
         vfp_load_reg64(f0, vm);
     }
-
-    tcg_temp_free_i64(f0);
-    tcg_temp_free_i64(fd);
-
     return true;
 }
 
@@ -1812,7 +1727,6 @@ static void gen_VMLA_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 
     gen_helper_vfp_mulh(tmp, vn, vm, fpst);
     gen_helper_vfp_addh(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VMLA_hp(DisasContext *s, arg_VMLA_sp *a)
@@ -1827,7 +1741,6 @@ static void gen_VMLA_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
 
     gen_helper_vfp_muls(tmp, vn, vm, fpst);
     gen_helper_vfp_adds(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VMLA_sp(DisasContext *s, arg_VMLA_sp *a)
@@ -1842,7 +1755,6 @@ static void gen_VMLA_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
 
     gen_helper_vfp_muld(tmp, vn, vm, fpst);
     gen_helper_vfp_addd(vd, vd, tmp, fpst);
-    tcg_temp_free_i64(tmp);
 }
 
 static bool trans_VMLA_dp(DisasContext *s, arg_VMLA_dp *a)
@@ -1861,7 +1773,6 @@ static void gen_VMLS_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
     gen_helper_vfp_mulh(tmp, vn, vm, fpst);
     gen_helper_vfp_negh(tmp, tmp);
     gen_helper_vfp_addh(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VMLS_hp(DisasContext *s, arg_VMLS_sp *a)
@@ -1880,7 +1791,6 @@ static void gen_VMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
     gen_helper_vfp_muls(tmp, vn, vm, fpst);
     gen_helper_vfp_negs(tmp, tmp);
     gen_helper_vfp_adds(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VMLS_sp(DisasContext *s, arg_VMLS_sp *a)
@@ -1899,7 +1809,6 @@ static void gen_VMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     gen_helper_vfp_muld(tmp, vn, vm, fpst);
     gen_helper_vfp_negd(tmp, tmp);
     gen_helper_vfp_addd(vd, vd, tmp, fpst);
-    tcg_temp_free_i64(tmp);
 }
 
 static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_dp *a)
@@ -1920,7 +1829,6 @@ static void gen_VNMLS_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
     gen_helper_vfp_mulh(tmp, vn, vm, fpst);
     gen_helper_vfp_negh(vd, vd);
     gen_helper_vfp_addh(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VNMLS_hp(DisasContext *s, arg_VNMLS_sp *a)
@@ -1941,7 +1849,6 @@ static void gen_VNMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
     gen_helper_vfp_muls(tmp, vn, vm, fpst);
     gen_helper_vfp_negs(vd, vd);
     gen_helper_vfp_adds(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VNMLS_sp(DisasContext *s, arg_VNMLS_sp *a)
@@ -1962,7 +1869,6 @@ static void gen_VNMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     gen_helper_vfp_muld(tmp, vn, vm, fpst);
     gen_helper_vfp_negd(vd, vd);
     gen_helper_vfp_addd(vd, vd, tmp, fpst);
-    tcg_temp_free_i64(tmp);
 }
 
 static bool trans_VNMLS_dp(DisasContext *s, arg_VNMLS_dp *a)
@@ -1979,7 +1885,6 @@ static void gen_VNMLA_hp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
     gen_helper_vfp_negh(tmp, tmp);
     gen_helper_vfp_negh(vd, vd);
     gen_helper_vfp_addh(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VNMLA_hp(DisasContext *s, arg_VNMLA_sp *a)
@@ -1996,7 +1901,6 @@ static void gen_VNMLA_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
     gen_helper_vfp_negs(tmp, tmp);
     gen_helper_vfp_negs(vd, vd);
     gen_helper_vfp_adds(vd, vd, tmp, fpst);
-    tcg_temp_free_i32(tmp);
 }
 
 static bool trans_VNMLA_sp(DisasContext *s, arg_VNMLA_sp *a)
@@ -2013,7 +1917,6 @@ static void gen_VNMLA_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
     gen_helper_vfp_negd(tmp, tmp);
     gen_helper_vfp_negd(vd, vd);
     gen_helper_vfp_addd(vd, vd, tmp, fpst);
-    tcg_temp_free_i64(tmp);
 }
 
 static bool trans_VNMLA_dp(DisasContext *s, arg_VNMLA_dp *a)
@@ -2225,12 +2128,6 @@ static bool do_vfm_hp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
     fpst = fpstatus_ptr(FPST_FPCR_F16);
     gen_helper_vfp_muladdh(vd, vn, vm, vd, fpst);
     vfp_store_reg32(vd, a->vd);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(vn);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_i32(vd);
-
     return true;
 }
 
@@ -2290,12 +2187,6 @@ static bool do_vfm_sp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
     fpst = fpstatus_ptr(FPST_FPCR);
     gen_helper_vfp_muladds(vd, vn, vm, vd, fpst);
     vfp_store_reg32(vd, a->vd);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(vn);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_i32(vd);
-
     return true;
 }
 
@@ -2361,12 +2252,6 @@ static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
     fpst = fpstatus_ptr(FPST_FPCR);
     gen_helper_vfp_muladdd(vd, vn, vm, vd, fpst);
     vfp_store_reg64(vd, a->vd);
-
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i64(vn);
-    tcg_temp_free_i64(vm);
-    tcg_temp_free_i64(vd);
-
     return true;
 }
 
@@ -2591,10 +2476,6 @@ static bool trans_VCMP_hp(DisasContext *s, arg_VCMP_sp *a)
     } else {
         gen_helper_vfp_cmph(vd, vm, cpu_env);
     }
-
-    tcg_temp_free_i32(vd);
-    tcg_temp_free_i32(vm);
-
     return true;
 }
 
@@ -2630,10 +2511,6 @@ static bool trans_VCMP_sp(DisasContext *s, arg_VCMP_sp *a)
     } else {
         gen_helper_vfp_cmps(vd, vm, cpu_env);
     }
-
-    tcg_temp_free_i32(vd);
-    tcg_temp_free_i32(vm);
-
     return true;
 }
 
@@ -2674,10 +2551,6 @@ static bool trans_VCMP_dp(DisasContext *s, arg_VCMP_dp *a)
     } else {
         gen_helper_vfp_cmpd(vd, vm, cpu_env);
     }
-
-    tcg_temp_free_i64(vd);
-    tcg_temp_free_i64(vm);
-
     return true;
 }
 
@@ -2702,9 +2575,6 @@ static bool trans_VCVT_f32_f16(DisasContext *s, arg_VCVT_f32_f16 *a)
     tcg_gen_ld16u_i32(tmp, cpu_env, vfp_f16_offset(a->vm, a->t));
     gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp_mode);
     vfp_store_reg32(tmp, a->vd);
-    tcg_temp_free_i32(ahp_mode);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -2740,10 +2610,6 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
     vd = tcg_temp_new_i64();
     gen_helper_vfp_fcvt_f16_to_f64(vd, tmp, fpst, ahp_mode);
     vfp_store_reg64(vd, a->vd);
-    tcg_temp_free_i32(ahp_mode);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i64(vd);
     return true;
 }
 
@@ -2766,8 +2632,6 @@ static bool trans_VCVT_b16_f32(DisasContext *s, arg_VCVT_b16_f32 *a)
     vfp_load_reg32(tmp, a->vm);
     gen_helper_bfcvt(tmp, tmp, fpst);
     tcg_gen_st16_i32(tmp, cpu_env, vfp_f16_offset(a->vd, a->t));
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -2792,9 +2656,6 @@ static bool trans_VCVT_f16_f32(DisasContext *s, arg_VCVT_f16_f32 *a)
     vfp_load_reg32(tmp, a->vm);
     gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp_mode);
     tcg_gen_st16_i32(tmp, cpu_env, vfp_f16_offset(a->vd, a->t));
-    tcg_temp_free_i32(ahp_mode);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -2829,11 +2690,7 @@ static bool trans_VCVT_f16_f64(DisasContext *s, arg_VCVT_f16_f64 *a)
 
     vfp_load_reg64(vm, a->vm);
     gen_helper_vfp_fcvt_f64_to_f16(tmp, vm, fpst, ahp_mode);
-    tcg_temp_free_i64(vm);
     tcg_gen_st16_i32(tmp, cpu_env, vfp_f16_offset(a->vd, a->t));
-    tcg_temp_free_i32(ahp_mode);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -2855,8 +2712,6 @@ static bool trans_VRINTR_hp(DisasContext *s, arg_VRINTR_sp *a)
     fpst = fpstatus_ptr(FPST_FPCR_F16);
     gen_helper_rinth(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -2878,8 +2733,6 @@ static bool trans_VRINTR_sp(DisasContext *s, arg_VRINTR_sp *a)
     fpst = fpstatus_ptr(FPST_FPCR);
     gen_helper_rints(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -2910,8 +2763,6 @@ static bool trans_VRINTR_dp(DisasContext *s, arg_VRINTR_dp *a)
     fpst = fpstatus_ptr(FPST_FPCR);
     gen_helper_rintd(tmp, tmp, fpst);
     vfp_store_reg64(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i64(tmp);
     return true;
 }
 
@@ -2937,9 +2788,6 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     gen_helper_rinth(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tcg_rmode);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -2965,9 +2813,6 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     gen_helper_rints(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tcg_rmode);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -3002,9 +2847,6 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     gen_helper_rintd(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     vfp_store_reg64(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i64(tmp);
-    tcg_temp_free_i32(tcg_rmode);
     return true;
 }
 
@@ -3026,8 +2868,6 @@ static bool trans_VRINTX_hp(DisasContext *s, arg_VRINTX_sp *a)
     fpst = fpstatus_ptr(FPST_FPCR_F16);
     gen_helper_rinth_exact(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -3049,8 +2889,6 @@ static bool trans_VRINTX_sp(DisasContext *s, arg_VRINTX_sp *a)
     fpst = fpstatus_ptr(FPST_FPCR);
     gen_helper_rints_exact(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i32(tmp);
     return true;
 }
 
@@ -3081,8 +2919,6 @@ static bool trans_VRINTX_dp(DisasContext *s, arg_VRINTX_dp *a)
     fpst = fpstatus_ptr(FPST_FPCR);
     gen_helper_rintd_exact(tmp, tmp, fpst);
     vfp_store_reg64(tmp, a->vd);
-    tcg_temp_free_ptr(fpst);
-    tcg_temp_free_i64(tmp);
     return true;
 }
 
@@ -3109,8 +2945,6 @@ static bool trans_VCVT_sp(DisasContext *s, arg_VCVT_sp *a)
     vfp_load_reg32(vm, a->vm);
     gen_helper_vfp_fcvtds(vd, vm, cpu_env);
     vfp_store_reg64(vd, a->vd);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_i64(vd);
     return true;
 }
 
@@ -3137,8 +2971,6 @@ static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
     vfp_load_reg64(vm, a->vm);
     gen_helper_vfp_fcvtsd(vd, vm, cpu_env);
     vfp_store_reg32(vd, a->vd);
-    tcg_temp_free_i32(vd);
-    tcg_temp_free_i64(vm);
     return true;
 }
 
@@ -3166,8 +2998,6 @@ static bool trans_VCVT_int_hp(DisasContext *s, arg_VCVT_int_sp *a)
         gen_helper_vfp_uitoh(vm, vm, fpst);
     }
     vfp_store_reg32(vm, a->vd);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3195,8 +3025,6 @@ static bool trans_VCVT_int_sp(DisasContext *s, arg_VCVT_int_sp *a)
         gen_helper_vfp_uitos(vm, vm, fpst);
     }
     vfp_store_reg32(vm, a->vd);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3231,9 +3059,6 @@ static bool trans_VCVT_int_dp(DisasContext *s, arg_VCVT_int_dp *a)
         gen_helper_vfp_uitod(vd, vm, fpst);
     }
     vfp_store_reg64(vd, a->vd);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_i64(vd);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3264,8 +3089,6 @@ static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
     vfp_load_reg64(vm, a->vm);
     gen_helper_vjcvt(vd, vm, cpu_env);
     vfp_store_reg32(vd, a->vd);
-    tcg_temp_free_i64(vm);
-    tcg_temp_free_i32(vd);
     return true;
 }
 
@@ -3322,8 +3145,6 @@ static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
     }
 
     vfp_store_reg32(vd, a->vd);
-    tcg_temp_free_i32(vd);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3380,8 +3201,6 @@ static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
     }
 
     vfp_store_reg32(vd, a->vd);
-    tcg_temp_free_i32(vd);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3444,8 +3263,6 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
     }
 
     vfp_store_reg64(vd, a->vd);
-    tcg_temp_free_i64(vd);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3480,8 +3297,6 @@ static bool trans_VCVT_hp_int(DisasContext *s, arg_VCVT_sp_int *a)
         }
     }
     vfp_store_reg32(vm, a->vd);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3516,8 +3331,6 @@ static bool trans_VCVT_sp_int(DisasContext *s, arg_VCVT_sp_int *a)
         }
     }
     vfp_store_reg32(vm, a->vd);
-    tcg_temp_free_i32(vm);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3559,9 +3372,6 @@ static bool trans_VCVT_dp_int(DisasContext *s, arg_VCVT_dp_int *a)
         }
     }
     vfp_store_reg32(vd, a->vd);
-    tcg_temp_free_i32(vd);
-    tcg_temp_free_i64(vm);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
@@ -3588,8 +3398,6 @@ static bool trans_VINS(DisasContext *s, arg_VINS *a)
     vfp_load_reg32(rd, a->vd);
     tcg_gen_deposit_i32(rd, rd, rm, 16, 16);
     vfp_store_reg32(rd, a->vd);
-    tcg_temp_free_i32(rm);
-    tcg_temp_free_i32(rd);
     return true;
 }
 
@@ -3614,6 +3422,5 @@ static bool trans_VMOVX(DisasContext *s, arg_VINS *a)
     vfp_load_reg32(rm, a->vm);
     tcg_gen_shri_i32(rm, rm, 16);
     vfp_store_reg32(rm, a->vd);
-    tcg_temp_free_i32(rm);
     return true;
 }
-- 
2.34.1


