Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF415048C2
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:04:36 +0200 (CEST)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9GF-0004nb-AT
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x5-0000ix-9s
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:48 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x0-0003Ie-Fd
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:45 -0400
Received: by mail-pj1-x102d.google.com with SMTP id bg24so11337276pjb.1
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Li7BpUg3HRfrUiGI4ar3otSrrJFn7ZOtj1NESYHRNXk=;
 b=wXkVsXk5mbXDOQhf8gRMZUr3/Uw8KLt/6fH5EYTix9axQgBvxjezExqvNA7ZeA0Bq1
 5geKiPueFELq9a0QkzRZ5Du08vnbr1AM61rBM8do6ooWz7woR3KUyVzQkArmy+Vk7gsK
 bxlxMkmJGNaZG1qViykgTJuemgMz0z0SyIttZECcDYX82PbXQNsNYOQF/QDiCU+fdhmT
 OIuR5h+3yJ/FFJo1KjOh0Jc1fhCFG3d7fHsqbH17UjJ8+gQLgOyNOj/tF91Fl3vc8cCi
 FbcmSA+ZuOg0fQA86cj5oa9e986wtCeFibYOvQkEHKhDxqCnlEKgT6UdA7wxOwCSalaV
 5O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Li7BpUg3HRfrUiGI4ar3otSrrJFn7ZOtj1NESYHRNXk=;
 b=5S/j9rcBVubDV94x6jqwuULbP+j+KJAvpAxISQ8KY0GlkZ9QVG7ykuUrrQeN4WYYUy
 9mzQzKr1njg7yNcT21/nvOETODj5u3KS2mL7UjnZG+ghxz1R8FDSDNzBPGfJ81/8dMfO
 oBPmDPgeFwLJFN0T3yik4mMibQqQID0Zj4vMFayYC82FzWkJkRGcMOjPStgTm4uL3TGq
 67nzWTIz+a9hvgg6lHbP4QdFJTkJYG/MuLcJ5jeic9lUMpv3vG57uyYrEgHYyWq+qbuz
 hukYgXpasclJVEvXW4PT7crgcuSpXSv3c27u4L16npKYBEB9VvkQUHck4BOaPcJwTu2/
 VKQA==
X-Gm-Message-State: AOAM532JrHdekOgidnfQHysCG6Er9Kjow7IvUki6124hTHXLUmh6IqYh
 a/JJAf3VMkusSwcXL5GRf/BopoeIbzPbZw==
X-Google-Smtp-Source: ABdhPJz5mv3rOp/wyGPfvnioVQ6wgJVl1jgFCUvVWOkQlRctf27iS2clnCU9wltwA5tw2JkV/lSaqw==
X-Received: by 2002:a17:90a:cc6:b0:1d2:9a04:d29e with SMTP id
 6-20020a17090a0cc600b001d29a04d29emr1463017pjt.136.1650217480899; 
 Sun, 17 Apr 2022 10:44:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/60] target/arm: Use tcg_constant in translate-a64.c
Date: Sun, 17 Apr 2022 10:43:39 -0700
Message-Id: <20220417174426.711829-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use tcg_constant_{i32,i64,ptr} as appropriate throughout, which
means we get to remove lots of tcg_temp_free_*.  Drop variables
in many cases, passing the constant directly to another function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 302 +++++++++++--------------------------
 1 file changed, 90 insertions(+), 212 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a00a882145..3867910ed4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -240,14 +240,10 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
 static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
                              MMUAccessType acc, int log2_size)
 {
-    TCGv_i32 t_acc = tcg_const_i32(acc);
-    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
-    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
-
-    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
-    tcg_temp_free_i32(t_acc);
-    tcg_temp_free_i32(t_idx);
-    tcg_temp_free_i32(t_size);
+    gen_helper_probe_access(cpu_env, ptr,
+                            tcg_constant_i32(acc),
+                            tcg_constant_i32(get_mem_index(s)),
+                            tcg_constant_i32(1 << log2_size));
 }
 
 /*
@@ -262,7 +258,6 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       int core_idx)
 {
     if (tag_checked && s->mte_active[is_unpriv]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -271,11 +266,9 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
@@ -296,7 +289,6 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int size)
 {
     if (tag_checked && s->mte_active[0]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -305,11 +297,9 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
@@ -348,11 +338,8 @@ static void gen_rebuild_hflags(DisasContext *s)
 
 static void gen_exception_internal(int excp)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-
     assert(excp_is_internal(excp));
-    gen_helper_exception_internal(cpu_env, tcg_excp);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
@@ -364,12 +351,8 @@ static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
-    TCGv_i32 tcg_syn;
-
     gen_a64_set_pc_im(s->pc_curr);
-    tcg_syn = tcg_const_i32(syndrome);
-    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
-    tcg_temp_free_i32(tcg_syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -831,15 +814,15 @@ static void gen_adc(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 {
     if (sf) {
-        TCGv_i64 result, cf_64, vf_64, tmp;
-        result = tcg_temp_new_i64();
-        cf_64 = tcg_temp_new_i64();
-        vf_64 = tcg_temp_new_i64();
-        tmp = tcg_const_i64(0);
+        TCGv_i64 result = tcg_temp_new_i64();
+        TCGv_i64 cf_64 = tcg_temp_new_i64();
+        TCGv_i64 vf_64 = tcg_temp_new_i64();
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         tcg_gen_extu_i32_i64(cf_64, cpu_CF);
-        tcg_gen_add2_i64(result, cf_64, t0, tmp, cf_64, tmp);
-        tcg_gen_add2_i64(result, cf_64, result, cf_64, t1, tmp);
+        tcg_gen_add2_i64(result, cf_64, t0, zero, cf_64, zero);
+        tcg_gen_add2_i64(result, cf_64, result, cf_64, t1, zero);
         tcg_gen_extrl_i64_i32(cpu_CF, cf_64);
         gen_set_NZ64(result);
 
@@ -855,15 +838,15 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_temp_free_i64(cf_64);
         tcg_temp_free_i64(result);
     } else {
-        TCGv_i32 t0_32, t1_32, tmp;
-        t0_32 = tcg_temp_new_i32();
-        t1_32 = tcg_temp_new_i32();
-        tmp = tcg_const_i32(0);
+        TCGv_i32 t0_32 = tcg_temp_new_i32();
+        TCGv_i32 t1_32 = tcg_temp_new_i32();
+        TCGv_i32 tmp = tcg_temp_new_i32();
+        TCGv_i32 zero = tcg_constant_i32(0);
 
         tcg_gen_extrl_i64_i32(t0_32, t0);
         tcg_gen_extrl_i64_i32(t1_32, t1);
-        tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, tmp, cpu_CF, tmp);
-        tcg_gen_add2_i32(cpu_NF, cpu_CF, cpu_NF, cpu_CF, t1_32, tmp);
+        tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, zero, cpu_CF, zero);
+        tcg_gen_add2_i32(cpu_NF, cpu_CF, cpu_NF, cpu_CF, t1_32, zero);
 
         tcg_gen_mov_i32(cpu_ZF, cpu_NF);
         tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
@@ -1632,7 +1615,6 @@ static void gen_axflag(void)
 static void handle_msr_i(DisasContext *s, uint32_t insn,
                          unsigned int op1, unsigned int op2, unsigned int crm)
 {
-    TCGv_i32 t1;
     int op = op1 << 3 | op2;
 
     /* End the TB by default, chaining is ok.  */
@@ -1691,9 +1673,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         if (s->current_el == 0) {
             goto do_unallocated;
         }
-        t1 = tcg_const_i32(crm & PSTATE_SP);
-        gen_helper_msr_i_spsel(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_spsel(cpu_env, tcg_constant_i32(crm & PSTATE_SP));
         break;
 
     case 0x19: /* SSBS */
@@ -1721,15 +1701,11 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         break;
 
     case 0x1e: /* DAIFSet */
-        t1 = tcg_const_i32(crm);
-        gen_helper_msr_i_daifset(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_daifset(cpu_env, tcg_constant_i32(crm));
         break;
 
     case 0x1f: /* DAIFClear */
-        t1 = tcg_const_i32(crm);
-        gen_helper_msr_i_daifclear(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_daifclear(cpu_env, tcg_constant_i32(crm));
         /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
         s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
@@ -1842,19 +1818,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         /* Emit code to perform further access permissions checks at
          * runtime; this may result in an exception.
          */
-        TCGv_ptr tmpptr;
-        TCGv_i32 tcg_syn, tcg_isread;
         uint32_t syndrome;
 
-        gen_a64_set_pc_im(s->pc_curr);
-        tmpptr = tcg_const_ptr(ri);
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
-        tcg_syn = tcg_const_i32(syndrome);
-        tcg_isread = tcg_const_i32(isread);
-        gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn, tcg_isread);
-        tcg_temp_free_ptr(tmpptr);
-        tcg_temp_free_i32(tcg_syn);
-        tcg_temp_free_i32(tcg_isread);
+        gen_a64_set_pc_im(s->pc_curr);
+        gen_helper_access_check_cp_reg(cpu_env,
+                                       tcg_constant_ptr(ri),
+                                       tcg_constant_i32(syndrome),
+                                       tcg_constant_i32(isread));
     } else if (ri->type & ARM_CP_RAISES_EXC) {
         /*
          * The readfn or writefn might raise an exception;
@@ -1885,17 +1856,15 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
         if (s->mte_active[0]) {
-            TCGv_i32 t_desc;
             int desc = 0;
 
             desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
             desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
             desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
-            t_desc = tcg_const_i32(desc);
 
             tcg_rt = new_tmp_a64(s);
-            gen_helper_mte_check_zva(tcg_rt, cpu_env, t_desc, cpu_reg(s, rt));
-            tcg_temp_free_i32(t_desc);
+            gen_helper_mte_check_zva(tcg_rt, cpu_env,
+                                     tcg_constant_i32(desc), cpu_reg(s, rt));
         } else {
             tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         }
@@ -1959,10 +1928,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         if (ri->type & ARM_CP_CONST) {
             tcg_gen_movi_i64(tcg_rt, ri->resetvalue);
         } else if (ri->readfn) {
-            TCGv_ptr tmpptr;
-            tmpptr = tcg_const_ptr(ri);
-            gen_helper_get_cp_reg64(tcg_rt, cpu_env, tmpptr);
-            tcg_temp_free_ptr(tmpptr);
+            gen_helper_get_cp_reg64(tcg_rt, cpu_env, tcg_constant_ptr(ri));
         } else {
             tcg_gen_ld_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
@@ -1971,10 +1937,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
             /* If not forbidden by access permissions, treat as WI */
             return;
         } else if (ri->writefn) {
-            TCGv_ptr tmpptr;
-            tmpptr = tcg_const_ptr(ri);
-            gen_helper_set_cp_reg64(cpu_env, tmpptr, tcg_rt);
-            tcg_temp_free_ptr(tmpptr);
+            gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri), tcg_rt);
         } else {
             tcg_gen_st_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
@@ -2052,7 +2015,6 @@ static void disas_exc(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 21, 3);
     int op2_ll = extract32(insn, 0, 5);
     int imm16 = extract32(insn, 5, 16);
-    TCGv_i32 tmp;
 
     switch (opc) {
     case 0:
@@ -2087,9 +2049,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
             gen_a64_set_pc_im(s->pc_curr);
-            tmp = tcg_const_i32(syn_aa64_smc(imm16));
-            gen_helper_pre_smc(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
+            gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
             gen_exception_insn(s, s->base.pc_next, EXCP_SMC,
                                syn_aa64_smc(imm16), 3);
@@ -2563,7 +2523,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(cmp);
     } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 tcg_rs = tcg_const_i32(rs);
+            TCGv_i32 tcg_rs = tcg_constant_i32(rs);
             if (s->be_data == MO_LE) {
                 gen_helper_casp_le_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
@@ -2571,7 +2531,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
                 gen_helper_casp_be_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
             }
-            tcg_temp_free_i32(tcg_rs);
         } else {
             gen_helper_exit_atomic(cpu_env);
             s->base.is_jmp = DISAS_NORETURN;
@@ -2582,7 +2541,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         TCGv_i64 a2 = tcg_temp_new_i64();
         TCGv_i64 c1 = tcg_temp_new_i64();
         TCGv_i64 c2 = tcg_temp_new_i64();
-        TCGv_i64 zero = tcg_const_i64(0);
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         /* Load the two words, in memory order.  */
         tcg_gen_qemu_ld_i64(d1, clean_addr, memidx,
@@ -2603,7 +2562,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(a2);
         tcg_temp_free_i64(c1);
         tcg_temp_free_i64(c2);
-        tcg_temp_free_i64(zero);
 
         /* Write back the data from memory to Rs.  */
         tcg_gen_mov_i64(s1, d1);
@@ -2820,7 +2778,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_const_i64(s->pc_curr + imm);
+    clean_addr = tcg_constant_i64(s->pc_curr + imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -2830,7 +2788,6 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
                   false, true, rt, iss_sf, false);
     }
-    tcg_temp_free_i64(clean_addr);
 }
 
 /*
@@ -3736,7 +3693,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     mop = endian | size | align;
 
     elements = (is_q ? 16 : 8) >> size;
-    tcg_ebytes = tcg_const_i64(1 << size);
+    tcg_ebytes = tcg_constant_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
         for (e = 0; e < elements; e++) {
@@ -3752,7 +3709,6 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             }
         }
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (!is_store) {
         /* For non-quad operations, setting a slice of the low
@@ -3882,7 +3838,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
                                 total);
     mop = finalize_memop(s, scale);
 
-    tcg_ebytes = tcg_const_i64(1 << scale);
+    tcg_ebytes = tcg_constant_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
         if (replicate) {
             /* Load and replicate to all elements */
@@ -3904,7 +3860,6 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
         rt = (rt + 1) % 32;
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (is_postidx) {
         if (rm == 31) {
@@ -4095,7 +4050,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 
     if (is_zero) {
         TCGv_i64 clean_addr = clean_data_tbi(s, addr);
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        TCGv_i64 tcg_zero = tcg_constant_i64(0);
         int mem_index = get_mem_index(s);
         int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
 
@@ -4105,7 +4060,6 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
             tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
         }
-        tcg_temp_free_i64(tcg_zero);
     }
 
     if (index != 0) {
@@ -4224,13 +4178,12 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(tcg_result, tcg_rn, imm);
         }
     } else {
-        TCGv_i64 tcg_imm = tcg_const_i64(imm);
+        TCGv_i64 tcg_imm = tcg_constant_i64(imm);
         if (sub_op) {
             gen_sub_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         } else {
             gen_add_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         }
-        tcg_temp_free_i64(tcg_imm);
     }
 
     if (is_64bit) {
@@ -4278,12 +4231,9 @@ static void disas_add_sub_imm_with_tags(DisasContext *s, uint32_t insn)
     tcg_rd = cpu_reg_sp(s, rd);
 
     if (s->ata) {
-        TCGv_i32 offset = tcg_const_i32(imm);
-        TCGv_i32 tag_offset = tcg_const_i32(uimm4);
-
-        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
-        tcg_temp_free_i32(tag_offset);
-        tcg_temp_free_i32(offset);
+        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn,
+                           tcg_constant_i32(imm),
+                           tcg_constant_i32(uimm4));
     } else {
         tcg_gen_addi_i64(tcg_rd, tcg_rn, imm);
         gen_address_with_allocation_tag0(tcg_rd, tcg_rd);
@@ -4469,7 +4419,6 @@ static void disas_movw_imm(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 29, 2);
     int pos = extract32(insn, 21, 2) << 4;
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_imm;
 
     if (!sf && (pos >= 32)) {
         unallocated_encoding(s);
@@ -4489,9 +4438,7 @@ static void disas_movw_imm(DisasContext *s, uint32_t insn)
         tcg_gen_movi_i64(tcg_rd, imm);
         break;
     case 3: /* MOVK */
-        tcg_imm = tcg_const_i64(imm);
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_imm, pos, 16);
-        tcg_temp_free_i64(tcg_imm);
+        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_constant_i64(imm), pos, 16);
         if (!sf) {
             tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
         }
@@ -4731,11 +4678,7 @@ static void shift_reg_imm(TCGv_i64 dst, TCGv_i64 src, int sf,
     if (shift_i == 0) {
         tcg_gen_mov_i64(dst, src);
     } else {
-        TCGv_i64 shift_const;
-
-        shift_const = tcg_const_i64(shift_i);
-        shift_reg(dst, src, sf, shift_type, shift_const);
-        tcg_temp_free_i64(shift_const);
+        shift_reg(dst, src, sf, shift_type, tcg_constant_i64(shift_i));
     }
 }
 
@@ -5312,7 +5255,7 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
     tcg_rd = cpu_reg(s, rd);
 
     a64_test_cc(&c, cond);
-    zero = tcg_const_i64(0);
+    zero = tcg_constant_i64(0);
 
     if (rn == 31 && rm == 31 && (else_inc ^ else_inv)) {
         /* CSET & CSETM.  */
@@ -5333,7 +5276,6 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
         tcg_gen_movcond_i64(c.cond, tcg_rd, c.value, zero, t_true, t_false);
     }
 
-    tcg_temp_free_i64(zero);
     a64_free_cc(&c);
 
     if (!sf) {
@@ -5430,7 +5372,7 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
     TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-    TCGv_i64 mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
+    TCGv_i64 mask = tcg_constant_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
 
     tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
     tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
@@ -5438,7 +5380,6 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
     tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
 
-    tcg_temp_free_i64(mask);
     tcg_temp_free_i64(tcg_tmp);
 }
 
@@ -5721,15 +5662,13 @@ static void handle_crc32(DisasContext *s,
     }
 
     tcg_acc = cpu_reg(s, rn);
-    tcg_bytes = tcg_const_i32(1 << sz);
+    tcg_bytes = tcg_constant_i32(1 << sz);
 
     if (crc32c) {
         gen_helper_crc32c_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     } else {
         gen_helper_crc32_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     }
-
-    tcg_temp_free_i32(tcg_bytes);
 }
 
 /* Data-processing (2 source)
@@ -5795,15 +5734,13 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
             goto do_unallocated;
         } else {
-            TCGv_i64 t1 = tcg_const_i64(1);
-            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGv_i64 t = tcg_temp_new_i64();
 
-            tcg_gen_extract_i64(t2, cpu_reg_sp(s, rn), 56, 4);
-            tcg_gen_shl_i64(t1, t1, t2);
-            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t1);
+            tcg_gen_extract_i64(t, cpu_reg_sp(s, rn), 56, 4);
+            tcg_gen_shl_i64(t, tcg_constant_i64(1), t);
+            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t);
 
-            tcg_temp_free_i64(t1);
-            tcg_temp_free_i64(t2);
+            tcg_temp_free_i64(t);
         }
         break;
     case 8: /* LSLV */
@@ -5938,7 +5875,7 @@ static void handle_fp_compare(DisasContext *s, int size,
 
         tcg_vn = read_fp_dreg(s, rn);
         if (cmp_with_zero) {
-            tcg_vm = tcg_const_i64(0);
+            tcg_vm = tcg_constant_i64(0);
         } else {
             tcg_vm = read_fp_dreg(s, rm);
         }
@@ -6048,7 +5985,6 @@ static void disas_fp_compare(DisasContext *s, uint32_t insn)
 static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
 {
     unsigned int mos, type, rm, cond, rn, op, nzcv;
-    TCGv_i64 tcg_flags;
     TCGLabel *label_continue = NULL;
     int size;
 
@@ -6092,9 +6028,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
         label_continue = gen_new_label();
         arm_gen_test_cc(cond, label_match);
         /* nomatch: */
-        tcg_flags = tcg_const_i64(nzcv << 28);
-        gen_set_nzcv(tcg_flags);
-        tcg_temp_free_i64(tcg_flags);
+        gen_set_nzcv(tcg_constant_i64(nzcv << 28));
         tcg_gen_br(label_continue);
         gen_set_label(label_match);
     }
@@ -6115,7 +6049,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
 static void disas_fp_csel(DisasContext *s, uint32_t insn)
 {
     unsigned int mos, type, rm, cond, rn, rd;
-    TCGv_i64 t_true, t_false, t_zero;
+    TCGv_i64 t_true, t_false;
     DisasCompare64 c;
     MemOp sz;
 
@@ -6160,10 +6094,8 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     read_vec_element(s, t_false, rm, 0, sz);
 
     a64_test_cc(&c, cond);
-    t_zero = tcg_const_i64(0);
-    tcg_gen_movcond_i64(c.cond, t_true, c.value, t_zero, t_true, t_false);
-    tcg_temp_free_i64(t_zero);
-    tcg_temp_free_i64(t_false);
+    tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
+                        t_true, t_false);
     a64_free_cc(&c);
 
     /* Note that sregs & hregs write back zeros to the high bits,
@@ -6944,7 +6876,6 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
     int type = extract32(insn, 22, 2);
     int mos = extract32(insn, 29, 3);
     uint64_t imm;
-    TCGv_i64 tcg_res;
     MemOp sz;
 
     if (mos || imm5) {
@@ -6975,10 +6906,7 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
     }
 
     imm = vfp_expand_imm(sz, imm8);
-
-    tcg_res = tcg_const_i64(imm);
-    write_fp_dreg(s, rd, tcg_res);
-    tcg_temp_free_i64(tcg_res);
+    write_fp_dreg(s, rd, tcg_constant_i64(imm));
 }
 
 /* Handle floating point <=> fixed point conversions. Note that we can
@@ -6996,7 +6924,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
 
     tcg_fpstatus = fpstatus_ptr(type == 3 ? FPST_FPCR_F16 : FPST_FPCR);
 
-    tcg_shift = tcg_const_i32(64 - scale);
+    tcg_shift = tcg_constant_i32(64 - scale);
 
     if (itof) {
         TCGv_i64 tcg_int = cpu_reg(s, rn);
@@ -7155,7 +7083,6 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
     }
 
     tcg_temp_free_ptr(tcg_fpstatus);
-    tcg_temp_free_i32(tcg_shift);
 }
 
 /* Floating point <-> fixed point conversions
@@ -8426,7 +8353,7 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
     /* Deal with the rounding step */
     if (round) {
         if (extended_result) {
-            TCGv_i64 tcg_zero = tcg_const_i64(0);
+            TCGv_i64 tcg_zero = tcg_constant_i64(0);
             if (!is_u) {
                 /* take care of sign extending tcg_res */
                 tcg_gen_sari_i64(tcg_src_hi, tcg_src, 63);
@@ -8438,7 +8365,6 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
                                  tcg_src, tcg_zero,
                                  tcg_rnd, tcg_zero);
             }
-            tcg_temp_free_i64(tcg_zero);
         } else {
             tcg_gen_add_i64(tcg_src, tcg_src, tcg_rnd);
         }
@@ -8524,8 +8450,7 @@ static void handle_scalar_simd_shri(DisasContext *s,
     }
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -8551,9 +8476,6 @@ static void handle_scalar_simd_shri(DisasContext *s,
 
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
 }
 
 /* SHL/SLI - Scalar shift left */
@@ -8651,8 +8573,7 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
     tcg_final = tcg_const_i64(0);
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -8672,9 +8593,6 @@ static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
 
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i32(tcg_rd_narrowed);
@@ -8726,7 +8644,7 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
     }
 
     if (size == 3) {
-        TCGv_i64 tcg_shift = tcg_const_i64(shift);
+        TCGv_i64 tcg_shift = tcg_constant_i64(shift);
         static NeonGenTwo64OpEnvFn * const fns[2][2] = {
             { gen_helper_neon_qshl_s64, gen_helper_neon_qshlu_s64 },
             { NULL, gen_helper_neon_qshl_u64 },
@@ -8743,10 +8661,9 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
 
             tcg_temp_free_i64(tcg_op);
         }
-        tcg_temp_free_i64(tcg_shift);
         clear_vec_high(s, is_q, rd);
     } else {
-        TCGv_i32 tcg_shift = tcg_const_i32(shift);
+        TCGv_i32 tcg_shift = tcg_constant_i32(shift);
         static NeonGenTwoOpEnvFn * const fns[2][2][3] = {
             {
                 { gen_helper_neon_qshl_s8,
@@ -8791,7 +8708,6 @@ static void handle_simd_qshl(DisasContext *s, bool scalar, bool is_q,
 
             tcg_temp_free_i32(tcg_op);
         }
-        tcg_temp_free_i32(tcg_shift);
 
         if (!scalar) {
             clear_vec_high(s, is_q, rd);
@@ -8811,7 +8727,7 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
     int pass;
 
     if (fracbits || size == MO_64) {
-        tcg_shift = tcg_const_i32(fracbits);
+        tcg_shift = tcg_constant_i32(fracbits);
     }
 
     if (size == MO_64) {
@@ -8896,9 +8812,6 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
     }
 
     tcg_temp_free_ptr(tcg_fpst);
-    if (tcg_shift) {
-        tcg_temp_free_i32(tcg_shift);
-    }
 
     clear_vec_high(s, elements << size == 16, rd);
 }
@@ -8988,7 +8901,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
     tcg_fpstatus = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     fracbits = (16 << size) - immhb;
-    tcg_shift = tcg_const_i32(fracbits);
+    tcg_shift = tcg_constant_i32(fracbits);
 
     if (size == MO_64) {
         int maxpass = is_scalar ? 1 : 2;
@@ -9046,7 +8959,6 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    tcg_temp_free_i32(tcg_shift);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     tcg_temp_free_ptr(tcg_fpstatus);
     tcg_temp_free_i32(tcg_rmode);
@@ -9918,23 +9830,15 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x1c: /* FCVTAS */
     case 0x3a: /* FCVTPS */
     case 0x3b: /* FCVTZS */
-    {
-        TCGv_i32 tcg_shift = tcg_const_i32(0);
-        gen_helper_vfp_tosqd(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_shift);
+        gen_helper_vfp_tosqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
         break;
-    }
     case 0x5a: /* FCVTNU */
     case 0x5b: /* FCVTMU */
     case 0x5c: /* FCVTAU */
     case 0x7a: /* FCVTPU */
     case 0x7b: /* FCVTZU */
-    {
-        TCGv_i32 tcg_shift = tcg_const_i32(0);
-        gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_shift);
+        gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
         break;
-    }
     case 0x18: /* FRINTN */
     case 0x19: /* FRINTM */
     case 0x38: /* FRINTP */
@@ -9974,7 +9878,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
 
     if (is_double) {
         TCGv_i64 tcg_op = tcg_temp_new_i64();
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        TCGv_i64 tcg_zero = tcg_constant_i64(0);
         TCGv_i64 tcg_res = tcg_temp_new_i64();
         NeonGenTwoDoubleOpFn *genfn;
         bool swap = false;
@@ -10010,13 +9914,12 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             write_vec_element(s, tcg_res, rd, pass, MO_64);
         }
         tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_zero);
         tcg_temp_free_i64(tcg_op);
 
         clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
-        TCGv_i32 tcg_zero = tcg_const_i32(0);
+        TCGv_i32 tcg_zero = tcg_constant_i32(0);
         TCGv_i32 tcg_res = tcg_temp_new_i32();
         NeonGenTwoSingleOpFn *genfn;
         bool swap = false;
@@ -10085,7 +9988,6 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             }
         }
         tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_zero);
         tcg_temp_free_i32(tcg_op);
         if (!is_scalar) {
             clear_vec_high(s, is_q, rd);
@@ -10186,7 +10088,7 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
     int passes = scalar ? 1 : 2;
 
     if (scalar) {
-        tcg_res[1] = tcg_const_i32(0);
+        tcg_res[1] = tcg_constant_i32(0);
     }
 
     for (pass = 0; pass < passes; pass++) {
@@ -10364,9 +10266,7 @@ static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
             }
 
             if (is_scalar) {
-                TCGv_i64 tcg_zero = tcg_const_i64(0);
-                write_vec_element(s, tcg_zero, rd, 0, MO_64);
-                tcg_temp_free_i64(tcg_zero);
+                write_vec_element(s, tcg_constant_i64(0), rd, 0, MO_64);
             }
             write_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
         }
@@ -10549,23 +10449,17 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x1c: /* FCVTAS */
         case 0x3a: /* FCVTPS */
         case 0x3b: /* FCVTZS */
-        {
-            TCGv_i32 tcg_shift = tcg_const_i32(0);
-            gen_helper_vfp_tosls(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-            tcg_temp_free_i32(tcg_shift);
+            gen_helper_vfp_tosls(tcg_rd, tcg_rn, tcg_constant_i32(0),
+                                 tcg_fpstatus);
             break;
-        }
         case 0x5a: /* FCVTNU */
         case 0x5b: /* FCVTMU */
         case 0x5c: /* FCVTAU */
         case 0x7a: /* FCVTPU */
         case 0x7b: /* FCVTZU */
-        {
-            TCGv_i32 tcg_shift = tcg_const_i32(0);
-            gen_helper_vfp_touls(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-            tcg_temp_free_i32(tcg_shift);
+            gen_helper_vfp_touls(tcg_rd, tcg_rn, tcg_constant_i32(0),
+                                 tcg_fpstatus);
             break;
-        }
         default:
             g_assert_not_reached();
         }
@@ -10737,8 +10631,7 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     read_vec_element(s, tcg_final, rd, is_q ? 1 : 0, MO_64);
 
     if (round) {
-        uint64_t round_const = 1ULL << (shift - 1);
-        tcg_round = tcg_const_i64(round_const);
+        tcg_round = tcg_constant_i64(1ULL << (shift - 1));
     } else {
         tcg_round = NULL;
     }
@@ -10756,9 +10649,6 @@ static void handle_vec_simd_shrn(DisasContext *s, bool is_q,
     } else {
         write_vec_element(s, tcg_final, rd, 1, MO_64);
     }
-    if (round) {
-        tcg_temp_free_i64(tcg_round);
-    }
     tcg_temp_free_i64(tcg_rn);
     tcg_temp_free_i64(tcg_rd);
     tcg_temp_free_i64(tcg_final);
@@ -12462,7 +12352,7 @@ static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
         }
     }
     if (!is_q) {
-        tcg_res[1] = tcg_const_i64(0);
+        tcg_res[1] = tcg_constant_i64(0);
     }
     for (pass = 0; pass < 2; pass++) {
         write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
@@ -12895,25 +12785,17 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 case 0x1c: /* FCVTAS */
                 case 0x3a: /* FCVTPS */
                 case 0x3b: /* FCVTZS */
-                {
-                    TCGv_i32 tcg_shift = tcg_const_i32(0);
                     gen_helper_vfp_tosls(tcg_res, tcg_op,
-                                         tcg_shift, tcg_fpstatus);
-                    tcg_temp_free_i32(tcg_shift);
+                                         tcg_constant_i32(0), tcg_fpstatus);
                     break;
-                }
                 case 0x5a: /* FCVTNU */
                 case 0x5b: /* FCVTMU */
                 case 0x5c: /* FCVTAU */
                 case 0x7a: /* FCVTPU */
                 case 0x7b: /* FCVTZU */
-                {
-                    TCGv_i32 tcg_shift = tcg_const_i32(0);
                     gen_helper_vfp_touls(tcg_res, tcg_op,
-                                         tcg_shift, tcg_fpstatus);
-                    tcg_temp_free_i32(tcg_shift);
+                                         tcg_constant_i32(0), tcg_fpstatus);
                     break;
-                }
                 case 0x18: /* FRINTN */
                 case 0x19: /* FRINTM */
                 case 0x38: /* FRINTP */
@@ -14011,7 +13893,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
 
         if (is_scalar) {
-            tcg_res[1] = tcg_const_i64(0);
+            tcg_res[1] = tcg_constant_i64(0);
         }
 
         for (pass = 0; pass < 2; pass++) {
@@ -14415,7 +14297,7 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_op2 = tcg_temp_new_i32();
         tcg_op3 = tcg_temp_new_i32();
         tcg_res = tcg_temp_new_i32();
-        tcg_zero = tcg_const_i32(0);
+        tcg_zero = tcg_constant_i32(0);
 
         read_vec_element_i32(s, tcg_op1, rn, 3, MO_32);
         read_vec_element_i32(s, tcg_op2, rm, 3, MO_32);
@@ -14435,7 +14317,6 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_temp_free_i32(tcg_op2);
         tcg_temp_free_i32(tcg_op3);
         tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_zero);
     }
 }
 
@@ -14943,22 +14824,19 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_WFI:
-        {
-            /* This is a special case because we don't want to just halt the CPU
-             * if trying to debug across a WFI.
+            /*
+             * This is a special case because we don't want to just halt
+             * the CPU if trying to debug across a WFI.
              */
-            TCGv_i32 tmp = tcg_const_i32(4);
-
             gen_a64_set_pc_im(dc->base.pc_next);
-            gen_helper_wfi(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-            /* The helper doesn't necessarily throw an exception, but we
+            gen_helper_wfi(cpu_env, tcg_constant_i32(4));
+            /*
+             * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(NULL, 0);
             break;
         }
-        }
     }
 }
 
-- 
2.25.1


