Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4C6A3AA1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW2Z-0001aI-Sj; Mon, 27 Feb 2023 00:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2Q-0000ZG-Bx
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:27:02 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2E-0007yE-NL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:54 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8838124pjb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqcBoIyNzQ5OuFvj0cjKdjpzjVGCMoFCf537HXgXhq4=;
 b=mb8lH7VgSwaFh29cS+Sa5koR76p8nr1k4b8g0YtsAvtM6hZCC2IhMegw9f8yQhgQiK
 mRud/LloH0qdK0ovXX58WhdWEzPwGoNz097gOD8I0x0QlckYrZKHgXo5ejxDE7tcyTDe
 puLHIpUP6P2Hv0o3HyR88axcR87twyli0NETiXa8cTDj0Ot3cYCwUdfvrHaoNrcftLK0
 1D7zagMXj3INaeRQJe0cTZvXOVe1DSp8VmYRtFiN7/il8JR/tgHJwLdmt8pzv4n2yHBb
 unQg6tpr9yaeiUFTUVixssK/MvKpiQmXNhnOKejs+hr1mYvRm+9zZmyXQsSUhpNQrr8Q
 QOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqcBoIyNzQ5OuFvj0cjKdjpzjVGCMoFCf537HXgXhq4=;
 b=HNo2tnDN4IrvO57aAMaTJE3GYCOO0ziEDUf3PuFBT8l23BzMOCQgh1503vyP1r0sLc
 uOL7z1xXaO0VzP9DPJfrQ56c5SklQjJc4BdCQ0Uj/IPgyUEIwkbm6FCDgPhy2gCrWiw4
 GO4HY2Q3dFcucqw3YLX/3hV1+wbJnsuFcyamteLmYr0U8S9e6xDcV644K+kIqNeGTdDt
 zfYVSqp2kVh4DWNtrcV9Ap2fUV9SX/lcD9Vi3MiXhLpboQvlqiTsST58NqWkXPTMLaCw
 Ggvim4mEBQOdmB6wbFei4FfLjVX7NrKyToZNRiN5W6EK0XFX6kWtQn+IL7izwI+UoIre
 RajQ==
X-Gm-Message-State: AO0yUKVuVccOq8Qmtq9oq/RJ5Ui3kgPZkKCyngOQcJlrs57QdYAMubtb
 pcy+cdueC47s6v+WE6qYP84OGrXKP+Aeigyfbuyh3A==
X-Google-Smtp-Source: AK7set/wZmZI95QKaYlStgV81ZtfQW/KwqLwtyrjn9JNSeZS4Sol7STCDgAvN+oOBmLfk5G9LPfqdg==
X-Received: by 2002:a17:903:68f:b0:19c:f1ab:4220 with SMTP id
 ki15-20020a170903068f00b0019cf1ab4220mr5627289plb.46.1677475608695; 
 Sun, 26 Feb 2023 21:26:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 36/76] target/microblaze: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:25 -1000
Message-Id: <20230227052505.352889-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 54 -----------------------------------
 1 file changed, 54 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 037a652cb9..eb6bdb49e1 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -104,7 +104,6 @@ static void gen_raise_exception(DisasContext *dc, uint32_t index)
     TCGv_i32 tmp = tcg_const_i32(index);
 
     gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -119,7 +118,6 @@ static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
 {
     TCGv_i32 tmp = tcg_const_i32(esr_ec);
     tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUMBState, esr));
-    tcg_temp_free_i32(tmp);
 
     gen_raise_exception_sync(dc, EXCP_HW_EXCP);
 }
@@ -265,8 +263,6 @@ static bool do_typeb_val(DisasContext *dc, arg_typeb *arg, bool side_effects,
     imm = tcg_const_i32(arg->imm);
 
     fn(rd, ra, imm);
-
-    tcg_temp_free_i32(imm);
     return true;
 }
 
@@ -312,8 +308,6 @@ static void gen_add(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     TCGv_i32 zero = tcg_const_i32(0);
 
     tcg_gen_add2_i32(out, cpu_msr_c, ina, zero, inb, zero);
-
-    tcg_temp_free_i32(zero);
 }
 
 /* Input and output carry. */
@@ -324,9 +318,6 @@ static void gen_addc(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 
     tcg_gen_add2_i32(tmp, cpu_msr_c, ina, zero, cpu_msr_c, zero);
     tcg_gen_add2_i32(out, cpu_msr_c, tmp, cpu_msr_c, inb, zero);
-
-    tcg_temp_free_i32(tmp);
-    tcg_temp_free_i32(zero);
 }
 
 /* Input carry, but no output carry. */
@@ -361,7 +352,6 @@ static void gen_bsra(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_andi_i32(tmp, inb, 31);
     tcg_gen_sar_i32(out, ina, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_bsrl(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
@@ -369,7 +359,6 @@ static void gen_bsrl(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_andi_i32(tmp, inb, 31);
     tcg_gen_shr_i32(out, ina, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_bsll(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
@@ -377,7 +366,6 @@ static void gen_bsll(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_andi_i32(tmp, inb, 31);
     tcg_gen_shl_i32(out, ina, tmp);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_bsefi(TCGv_i32 out, TCGv_i32 ina, int32_t imm)
@@ -436,7 +424,6 @@ static void gen_cmp(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     tcg_gen_setcond_i32(TCG_COND_LT, lt, inb, ina);
     tcg_gen_sub_i32(out, inb, ina);
     tcg_gen_deposit_i32(out, out, lt, 31, 1);
-    tcg_temp_free_i32(lt);
 }
 
 static void gen_cmpu(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
@@ -446,7 +433,6 @@ static void gen_cmpu(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     tcg_gen_setcond_i32(TCG_COND_LTU, lt, inb, ina);
     tcg_gen_sub_i32(out, inb, ina);
     tcg_gen_deposit_i32(out, out, lt, 31, 1);
-    tcg_temp_free_i32(lt);
 }
 
 DO_TYPEA(cmp, false, gen_cmp)
@@ -513,21 +499,18 @@ static void gen_mulh(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_muls2_i32(tmp, out, ina, inb);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_mulhu(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_mulu2_i32(tmp, out, ina, inb);
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_mulhsu(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_mulsu2_i32(tmp, out, ina, inb);
-    tcg_temp_free_i32(tmp);
 }
 
 DO_TYPEA_CFG(mul, use_hw_mul, false, tcg_gen_mul_i32)
@@ -569,9 +552,6 @@ static void gen_rsubc(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     tcg_gen_not_i32(tmp, ina);
     tcg_gen_add2_i32(tmp, cpu_msr_c, tmp, zero, cpu_msr_c, zero);
     tcg_gen_add2_i32(out, cpu_msr_c, tmp, cpu_msr_c, inb, zero);
-
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(tmp);
 }
 
 /* No input or output carry. */
@@ -588,8 +568,6 @@ static void gen_rsubkc(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
     tcg_gen_not_i32(nota, ina);
     tcg_gen_add_i32(out, inb, nota);
     tcg_gen_add_i32(out, out, cpu_msr_c);
-
-    tcg_temp_free_i32(nota);
 }
 
 DO_TYPEA(rsub, true, gen_rsub)
@@ -618,8 +596,6 @@ static void gen_src(TCGv_i32 out, TCGv_i32 ina)
     tcg_gen_mov_i32(tmp, cpu_msr_c);
     tcg_gen_andi_i32(cpu_msr_c, ina, 1);
     tcg_gen_extract2_i32(out, ina, tmp, 1);
-
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_srl(TCGv_i32 out, TCGv_i32 ina)
@@ -659,7 +635,6 @@ static TCGv compute_ldst_addr_typea(DisasContext *dc, int ra, int rb)
         TCGv_i32 tmp = tcg_temp_new_i32();
         tcg_gen_add_i32(tmp, cpu_R[ra], cpu_R[rb]);
         tcg_gen_extu_i32_tl(ret, tmp);
-        tcg_temp_free_i32(tmp);
     } else if (ra) {
         tcg_gen_extu_i32_tl(ret, cpu_R[ra]);
     } else if (rb) {
@@ -683,7 +658,6 @@ static TCGv compute_ldst_addr_typeb(DisasContext *dc, int ra, int imm)
         TCGv_i32 tmp = tcg_temp_new_i32();
         tcg_gen_addi_i32(tmp, cpu_R[ra], imm);
         tcg_gen_extu_i32_tl(ret, tmp);
-        tcg_temp_free_i32(tmp);
     } else {
         tcg_gen_movi_tl(ret, (uint32_t)imm);
     }
@@ -772,8 +746,6 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 #endif
 
     tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
-
-    tcg_temp_free(addr);
     return true;
 }
 
@@ -879,7 +851,6 @@ static bool trans_lwx(DisasContext *dc, arg_typea *arg)
 
     tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TEUL);
     tcg_gen_mov_tl(cpu_res_addr, addr);
-    tcg_temp_free(addr);
 
     if (arg->rd) {
         tcg_gen_mov_i32(cpu_R[arg->rd], cpu_res_val);
@@ -925,8 +896,6 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 #endif
 
     tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
-
-    tcg_temp_free(addr);
     return true;
 }
 
@@ -1040,7 +1009,6 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
      * In either case, addr is no longer needed.
      */
     tcg_gen_brcond_tl(TCG_COND_NE, cpu_res_addr, addr, swx_fail);
-    tcg_temp_free(addr);
 
     /*
      * Compare the value loaded during lwx with current contents of
@@ -1053,7 +1021,6 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
                                dc->mem_index, MO_TEUL);
 
     tcg_gen_brcond_i32(TCG_COND_NE, cpu_res_val, tval, swx_fail);
-    tcg_temp_free_i32(tval);
 
     /* Success */
     tcg_gen_movi_i32(cpu_msr_c, 0);
@@ -1155,8 +1122,6 @@ static bool do_bcc(DisasContext *dc, int dest_rb, int dest_imm,
     tcg_gen_movcond_i32(dc->jmp_cond, cpu_btarget,
                         reg_for_read(dc, ra), zero,
                         cpu_btarget, next);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(next);
 
     return true;
 }
@@ -1274,7 +1239,6 @@ static bool trans_mbar(DisasContext *dc, arg_mbar *arg)
         tcg_gen_st_i32(tmp_1, cpu_env,
                        -offsetof(MicroBlazeCPU, env)
                        +offsetof(CPUState, halted));
-        tcg_temp_free_i32(tmp_1);
 
         tcg_gen_movi_i32(cpu_pc, dc->base.pc_next + 4);
 
@@ -1345,7 +1309,6 @@ static void msr_read(DisasContext *dc, TCGv_i32 d)
     t = tcg_temp_new_i32();
     tcg_gen_muli_i32(t, cpu_msr_c, MSR_C | MSR_CC);
     tcg_gen_or_i32(d, cpu_msr, t);
-    tcg_temp_free_i32(t);
 }
 
 static bool do_msrclrset(DisasContext *dc, arg_type_msr *arg, bool set)
@@ -1442,8 +1405,6 @@ static bool trans_mts(DisasContext *dc, arg_mts *arg)
             TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
 
             gen_helper_mmu_write(cpu_env, tmp_ext, tmp_reg, src);
-            tcg_temp_free_i32(tmp_reg);
-            tcg_temp_free_i32(tmp_ext);
         }
         break;
 
@@ -1467,7 +1428,6 @@ static bool trans_mfs(DisasContext *dc, arg_mfs *arg)
                 TCGv_i64 t64 = tcg_temp_new_i64();
                 tcg_gen_ld_i64(t64, cpu_env, offsetof(CPUMBState, ear));
                 tcg_gen_extrh_i64_i32(dest, t64);
-                tcg_temp_free_i64(t64);
             }
             return true;
 #ifndef CONFIG_USER_ONLY
@@ -1498,7 +1458,6 @@ static bool trans_mfs(DisasContext *dc, arg_mfs *arg)
             TCGv_i64 t64 = tcg_temp_new_i64();
             tcg_gen_ld_i64(t64, cpu_env, offsetof(CPUMBState, ear));
             tcg_gen_extrl_i64_i32(dest, t64);
-            tcg_temp_free_i64(t64);
         }
         break;
     case SR_ESR:
@@ -1532,8 +1491,6 @@ static bool trans_mfs(DisasContext *dc, arg_mfs *arg)
             TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
 
             gen_helper_mmu_read(dest, cpu_env, tmp_ext, tmp_reg);
-            tcg_temp_free_i32(tmp_reg);
-            tcg_temp_free_i32(tmp_ext);
         }
         break;
 #endif
@@ -1559,8 +1516,6 @@ static void do_rti(DisasContext *dc)
     tcg_gen_andi_i32(tmp, tmp, MSR_VM | MSR_UM);
     tcg_gen_andi_i32(cpu_msr, cpu_msr, ~(MSR_VM | MSR_UM));
     tcg_gen_or_i32(cpu_msr, cpu_msr, tmp);
-
-    tcg_temp_free_i32(tmp);
 }
 
 static void do_rtb(DisasContext *dc)
@@ -1571,8 +1526,6 @@ static void do_rtb(DisasContext *dc)
     tcg_gen_andi_i32(cpu_msr, cpu_msr, ~(MSR_VM | MSR_UM | MSR_BIP));
     tcg_gen_andi_i32(tmp, tmp, (MSR_VM | MSR_UM));
     tcg_gen_or_i32(cpu_msr, cpu_msr, tmp);
-
-    tcg_temp_free_i32(tmp);
 }
 
 static void do_rte(DisasContext *dc)
@@ -1584,8 +1537,6 @@ static void do_rte(DisasContext *dc)
     tcg_gen_andi_i32(tmp, tmp, (MSR_VM | MSR_UM));
     tcg_gen_andi_i32(cpu_msr, cpu_msr, ~(MSR_VM | MSR_UM | MSR_EIP));
     tcg_gen_or_i32(cpu_msr, cpu_msr, tmp);
-
-    tcg_temp_free_i32(tmp);
 }
 
 /* Insns connected to FSL or AXI stream attached devices.  */
@@ -1606,8 +1557,6 @@ static bool do_get(DisasContext *dc, int rd, int rb, int imm, int ctrl)
 
     t_ctrl = tcg_const_i32(ctrl);
     gen_helper_get(reg_for_write(dc, rd), t_id, t_ctrl);
-    tcg_temp_free_i32(t_id);
-    tcg_temp_free_i32(t_ctrl);
     return true;
 }
 
@@ -1638,8 +1587,6 @@ static bool do_put(DisasContext *dc, int ra, int rb, int imm, int ctrl)
 
     t_ctrl = tcg_const_i32(ctrl);
     gen_helper_put(t_id, t_ctrl, reg_for_read(dc, ra));
-    tcg_temp_free_i32(t_id);
-    tcg_temp_free_i32(t_ctrl);
     return true;
 }
 
@@ -1704,7 +1651,6 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
     }
 
     if (dc->r0) {
-        tcg_temp_free_i32(dc->r0);
         dc->r0 = NULL;
         dc->r0_set = false;
     }
-- 
2.34.1


