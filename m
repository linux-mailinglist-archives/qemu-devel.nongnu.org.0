Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A15048C6
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:07:32 +0200 (CEST)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9J5-00038M-5L
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x8-0000lJ-7v
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:50 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x5-0003K2-0M
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n8so10761683plh.1
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6Sw+Kw5igCtY28372OR+Z/+OWydY+yQWED9kzgh3iA=;
 b=Ey0JDQNbjHLk3vCelOf+nsPiPr1X4Q774SH7IbCBjGOJpB9b9Z8WeU66zTP8ASijMh
 L7lBixAJDdeIeBB8ngRrAPVWV+RVbe0KfifDy0ChsgECkAcPersgABvIoaiu5e7n5r/+
 id1PJyKJetdNkStzJ0EyBOhSJIwi45GiRnyKBBNqPPgdvX+JqKiN748Oh3tLmC6U//my
 2VenqN3NVaqXaly8Cs/a+jHiJ1H4PPXztvv5VGenRtCd0/zzE+HTD4VlHMYeKizE7UNc
 1vFPBLH+9piDvToOcwdGBitHvSt2gGY69GJqbLZRNOZ29RbkA9xXIvZLPvaKWZw3aDXj
 XGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6Sw+Kw5igCtY28372OR+Z/+OWydY+yQWED9kzgh3iA=;
 b=qQxjUcHi3DTLjD7Yz95/vLcA64xST1ae26fg29M7bPMkrGl+VxyvejCKo5rCwGGi72
 Uv+c3CuXtGdT5XJnOrk3JXefq3PqJCeodrUVz1+8I084Nb8tL3tr25hdkgSN8DjZlUbY
 rx2faeGDlpggi44n+3ax2jFWJCUIVonS2bmxI0HFPgf7W8pl52a6wxrn6lTrXu0tNn1A
 0eXd3A5jJTablVvqVgQTC7LyJEvTM3AB8MnRfm+UPJiwrfOBpsIa/4HIMpUA7p8fWyL1
 lOHIVS+HYU/NgHmY8JwUsOPGc23kHzMrUfE7QXf3zyjNEaFVH4wGPhS2oQJwjMfeesQj
 IjiA==
X-Gm-Message-State: AOAM53095a0E+vm4kIbB8f5VHLJHvindvirawvT7149SV4dr7Und3bZG
 y3sL8shGZWMW9qOwc/8Xplcj4wuBrUjGrw==
X-Google-Smtp-Source: ABdhPJyQaFE+gmBgyD2elBtuKGuwcetuFL6FJNIQ4Yetru/uFY7JqNcoXIY9bV4j/4QebC+hxa1XLw==
X-Received: by 2002:a17:902:ec8c:b0:154:2e86:dd51 with SMTP id
 x12-20020a170902ec8c00b001542e86dd51mr7629487plg.99.1650217484624; 
 Sun, 17 Apr 2022 10:44:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/60] target/arm: Use tcg_constant in translate.c
Date: Sun, 17 Apr 2022 10:43:43 -0700
Message-Id: <20220417174426.711829-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 target/arm/translate.c | 250 ++++++++++++++---------------------------
 1 file changed, 84 insertions(+), 166 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e1c1dbc563..5cb4b3da33 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -346,9 +346,7 @@ static void store_sp_checked(DisasContext *s, TCGv_i32 var)
 
 void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
 {
-    TCGv_i32 tmp_mask = tcg_const_i32(mask);
-    gen_helper_cpsr_write(cpu_env, var, tmp_mask);
-    tcg_temp_free_i32(tmp_mask);
+    gen_helper_cpsr_write(cpu_env, var, tcg_constant_i32(mask));
 }
 
 static void gen_rebuild_hflags(DisasContext *s, bool new_el)
@@ -373,11 +371,8 @@ static void gen_rebuild_hflags(DisasContext *s, bool new_el)
 
 static void gen_exception_internal(int excp)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-
     assert(excp_is_internal(excp));
-    gen_helper_exception_internal(cpu_env, tcg_excp);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_singlestep_exception(DisasContext *s)
@@ -1078,12 +1073,8 @@ static inline void gen_smc(DisasContext *s)
     /* As with HVC, we may take an exception either before or after
      * the insn executes.
      */
-    TCGv_i32 tmp;
-
     gen_set_pc_im(s, s->pc_curr);
-    tmp = tcg_const_i32(syn_aa32_smc());
-    gen_helper_pre_smc(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa32_smc()));
     gen_set_pc_im(s, s->base.pc_next);
     s->base.is_jmp = DISAS_SMC;
 }
@@ -1111,13 +1102,9 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
-    TCGv_i32 tcg_syn;
-
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    tcg_syn = tcg_const_i32(syn);
-    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
-    tcg_temp_free_i32(tcg_syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syn));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1131,16 +1118,11 @@ void unallocated_encoding(DisasContext *s)
 static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
                              TCGv_i32 tcg_el)
 {
-    TCGv_i32 tcg_excp;
-    TCGv_i32 tcg_syn;
-
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    tcg_excp = tcg_const_i32(excp);
-    tcg_syn = tcg_const_i32(syn);
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp, tcg_syn, tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_with_syndrome(cpu_env,
+                                       tcg_constant_i32(excp),
+                                       tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1863,24 +1845,21 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         gen_op_iwmmxt_movq_M0_wRn(wrd);
         switch ((insn >> 6) & 3) {
         case 0:
-            tmp2 = tcg_const_i32(0xff);
-            tmp3 = tcg_const_i32((insn & 7) << 3);
+            tmp2 = tcg_constant_i32(0xff);
+            tmp3 = tcg_constant_i32((insn & 7) << 3);
             break;
         case 1:
-            tmp2 = tcg_const_i32(0xffff);
-            tmp3 = tcg_const_i32((insn & 3) << 4);
+            tmp2 = tcg_constant_i32(0xffff);
+            tmp3 = tcg_constant_i32((insn & 3) << 4);
             break;
         case 2:
-            tmp2 = tcg_const_i32(0xffffffff);
-            tmp3 = tcg_const_i32((insn & 1) << 5);
+            tmp2 = tcg_constant_i32(0xffffffff);
+            tmp3 = tcg_constant_i32((insn & 1) << 5);
             break;
         default:
-            tmp2 = NULL;
-            tmp3 = NULL;
+            g_assert_not_reached();
         }
         gen_helper_iwmmxt_insr(cpu_M0, cpu_M0, tmp, tmp2, tmp3);
-        tcg_temp_free_i32(tmp3);
-        tcg_temp_free_i32(tmp2);
         tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
@@ -2336,10 +2315,9 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         rd0 = (insn >> 16) & 0xf;
         rd1 = (insn >> 0) & 0xf;
         gen_op_iwmmxt_movq_M0_wRn(rd0);
-        tmp = tcg_const_i32((insn >> 20) & 3);
         iwmmxt_load_reg(cpu_V1, rd1);
-        gen_helper_iwmmxt_align(cpu_M0, cpu_M0, cpu_V1, tmp);
-        tcg_temp_free_i32(tmp);
+        gen_helper_iwmmxt_align(cpu_M0, cpu_M0, cpu_V1,
+                                tcg_constant_i32((insn >> 20) & 3));
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         break;
@@ -2393,9 +2371,8 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         wrd = (insn >> 12) & 0xf;
         rd0 = (insn >> 16) & 0xf;
         gen_op_iwmmxt_movq_M0_wRn(rd0);
-        tmp = tcg_const_i32(((insn >> 16) & 0xf0) | (insn & 0x0f));
+        tmp = tcg_constant_i32(((insn >> 16) & 0xf0) | (insn & 0x0f));
         gen_helper_iwmmxt_shufh(cpu_M0, cpu_env, cpu_M0, tmp);
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         gen_op_iwmmxt_set_cup();
@@ -2868,7 +2845,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);
                 tcg_gen_addi_i32(tcg_el, tcg_el, 3);
             } else {
-                tcg_el = tcg_const_i32(3);
+                tcg_el = tcg_constant_i32(3);
             }
 
             gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
@@ -2903,7 +2880,7 @@ undef:
 
 static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
 {
-    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
+    TCGv_i32 tcg_reg;
     int tgtmode = 0, regno = 0;
 
     if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
@@ -2914,18 +2891,16 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
     tcg_reg = load_reg(s, rn);
-    tcg_tgtmode = tcg_const_i32(tgtmode);
-    tcg_regno = tcg_const_i32(regno);
-    gen_helper_msr_banked(cpu_env, tcg_reg, tcg_tgtmode, tcg_regno);
-    tcg_temp_free_i32(tcg_tgtmode);
-    tcg_temp_free_i32(tcg_regno);
+    gen_helper_msr_banked(cpu_env, tcg_reg,
+                          tcg_constant_i32(tgtmode),
+                          tcg_constant_i32(regno));
     tcg_temp_free_i32(tcg_reg);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 {
-    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
+    TCGv_i32 tcg_reg;
     int tgtmode = 0, regno = 0;
 
     if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
@@ -2936,11 +2911,9 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
     tcg_reg = tcg_temp_new_i32();
-    tcg_tgtmode = tcg_const_i32(tgtmode);
-    tcg_regno = tcg_const_i32(regno);
-    gen_helper_mrs_banked(tcg_reg, cpu_env, tcg_tgtmode, tcg_regno);
-    tcg_temp_free_i32(tcg_tgtmode);
-    tcg_temp_free_i32(tcg_regno);
+    gen_helper_mrs_banked(tcg_reg, cpu_env,
+                          tcg_constant_i32(tgtmode),
+                          tcg_constant_i32(regno));
     store_reg(s, rn, tcg_reg);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
@@ -3023,9 +2996,8 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     }                                                                   \
     static void gen_##NAME##0_vec(unsigned vece, TCGv_vec d, TCGv_vec a) \
     {                                                                   \
-        TCGv_vec zero = tcg_const_zeros_vec_matching(d);                \
+        TCGv_vec zero = tcg_constant_vec_matching(d, vece, 0);          \
         tcg_gen_cmp_vec(COND, vece, d, a, zero);                        \
-        tcg_temp_free_vec(zero);                                        \
     }                                                                   \
     void gen_gvec_##NAME##0(unsigned vece, uint32_t d, uint32_t m,      \
                             uint32_t opr_sz, uint32_t max_sz)           \
@@ -4015,8 +3987,8 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(32);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(32);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4034,8 +4006,6 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4044,8 +4014,8 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(64);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(64);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4063,8 +4033,6 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
@@ -4159,8 +4127,8 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(31);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(31);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4179,8 +4147,6 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4189,8 +4155,8 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(63);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(63);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4209,8 +4175,6 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
@@ -4725,8 +4689,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
              * Note that on XScale all cp0..c13 registers do an access check
              * call in order to handle c15_cpar.
              */
-            TCGv_ptr tmpptr;
-            TCGv_i32 tcg_syn, tcg_isread;
             uint32_t syndrome;
 
             /* Note that since we are an implementation which takes an
@@ -4769,14 +4731,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
             gen_set_condexec(s);
             gen_set_pc_im(s, s->pc_curr);
-            tmpptr = tcg_const_ptr(ri);
-            tcg_syn = tcg_const_i32(syndrome);
-            tcg_isread = tcg_const_i32(isread);
-            gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn,
-                                           tcg_isread);
-            tcg_temp_free_ptr(tmpptr);
-            tcg_temp_free_i32(tcg_syn);
-            tcg_temp_free_i32(tcg_isread);
+            gen_helper_access_check_cp_reg(cpu_env,
+                                           tcg_constant_ptr(ri),
+                                           tcg_constant_i32(syndrome),
+                                           tcg_constant_i32(isread));
         } else if (ri->type & ARM_CP_RAISES_EXC) {
             /*
              * The readfn or writefn might raise an exception;
@@ -4812,13 +4770,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 TCGv_i64 tmp64;
                 TCGv_i32 tmp;
                 if (ri->type & ARM_CP_CONST) {
-                    tmp64 = tcg_const_i64(ri->resetvalue);
+                    tmp64 = tcg_constant_i64(ri->resetvalue);
                 } else if (ri->readfn) {
-                    TCGv_ptr tmpptr;
                     tmp64 = tcg_temp_new_i64();
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_get_cp_reg64(tmp64, cpu_env, tmpptr);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_get_cp_reg64(tmp64, cpu_env,
+                                            tcg_constant_ptr(ri));
                 } else {
                     tmp64 = tcg_temp_new_i64();
                     tcg_gen_ld_i64(tmp64, cpu_env, ri->fieldoffset);
@@ -4833,13 +4789,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             } else {
                 TCGv_i32 tmp;
                 if (ri->type & ARM_CP_CONST) {
-                    tmp = tcg_const_i32(ri->resetvalue);
+                    tmp = tcg_constant_i32(ri->resetvalue);
                 } else if (ri->readfn) {
-                    TCGv_ptr tmpptr;
                     tmp = tcg_temp_new_i32();
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_get_cp_reg(tmp, cpu_env, tmpptr);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_get_cp_reg(tmp, cpu_env, tcg_constant_ptr(ri));
                 } else {
                     tmp = load_cpu_offset(ri->fieldoffset);
                 }
@@ -4869,24 +4822,18 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 tcg_temp_free_i32(tmplo);
                 tcg_temp_free_i32(tmphi);
                 if (ri->writefn) {
-                    TCGv_ptr tmpptr = tcg_const_ptr(ri);
-                    gen_helper_set_cp_reg64(cpu_env, tmpptr, tmp64);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri),
+                                            tmp64);
                 } else {
                     tcg_gen_st_i64(tmp64, cpu_env, ri->fieldoffset);
                 }
                 tcg_temp_free_i64(tmp64);
             } else {
+                TCGv_i32 tmp = load_reg(s, rt);
                 if (ri->writefn) {
-                    TCGv_i32 tmp;
-                    TCGv_ptr tmpptr;
-                    tmp = load_reg(s, rt);
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_set_cp_reg(cpu_env, tmpptr, tmp);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_set_cp_reg(cpu_env, tcg_constant_ptr(ri), tmp);
                     tcg_temp_free_i32(tmp);
                 } else {
-                    TCGv_i32 tmp = load_reg(s, rt);
                     store_cpu_offset(tmp, ri->fieldoffset, 4);
                 }
             }
@@ -5190,12 +5137,10 @@ static void gen_srs(DisasContext *s,
     }
 
     addr = tcg_temp_new_i32();
-    tmp = tcg_const_i32(mode);
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    gen_helper_get_r13_banked(addr, cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_get_r13_banked(addr, cpu_env, tcg_constant_i32(mode));
     switch (amode) {
     case 0: /* DA */
         offset = -4;
@@ -5238,9 +5183,7 @@ static void gen_srs(DisasContext *s,
             abort();
         }
         tcg_gen_addi_i32(addr, addr, offset);
-        tmp = tcg_const_i32(mode);
-        gen_helper_set_r13_banked(cpu_env, tmp, addr);
-        tcg_temp_free_i32(tmp);
+        gen_helper_set_r13_banked(cpu_env, tcg_constant_i32(mode), addr);
     }
     tcg_temp_free_i32(addr);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
@@ -5552,23 +5495,21 @@ static bool op_s_rri_rot(DisasContext *s, arg_s_rri_rot *a,
                          void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32),
                          int logic_cc, StoreRegKind kind)
 {
-    TCGv_i32 tmp1, tmp2;
+    TCGv_i32 tmp;
     uint32_t imm;
 
     imm = ror32(a->imm, a->rot);
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp2 = tcg_const_i32(imm);
-    tmp1 = load_reg(s, a->rn);
+    tmp = load_reg(s, a->rn);
 
-    gen(tmp1, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
+    gen(tmp, tmp, tcg_constant_i32(imm));
 
     if (logic_cc) {
-        gen_logic_CC(tmp1);
+        gen_logic_CC(tmp);
     }
-    return store_reg_kind(s, a->rd, tmp1, kind);
+    return store_reg_kind(s, a->rd, tmp, kind);
 }
 
 static bool op_s_rxi_rot(DisasContext *s, arg_s_rri_rot *a,
@@ -5582,9 +5523,10 @@ static bool op_s_rxi_rot(DisasContext *s, arg_s_rri_rot *a,
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp = tcg_const_i32(imm);
 
-    gen(tmp, tmp);
+    tmp = tcg_temp_new_i32();
+    gen(tmp, tcg_constant_i32(imm));
+
     if (logic_cc) {
         gen_logic_CC(tmp);
     }
@@ -5710,14 +5652,11 @@ static bool trans_ADR(DisasContext *s, arg_ri *a)
 
 static bool trans_MOVW(DisasContext *s, arg_MOVW *a)
 {
-    TCGv_i32 tmp;
-
     if (!ENABLE_ARCH_6T2) {
         return false;
     }
 
-    tmp = tcg_const_i32(a->imm);
-    store_reg(s, a->rd, tmp);
+    store_reg(s, a->rd, tcg_constant_i32(a->imm));
     return true;
 }
 
@@ -6088,14 +6027,13 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
     t0 = load_reg(s, a->rm);
     t1 = load_reg(s, a->rn);
     tcg_gen_mulu2_i32(t0, t1, t0, t1);
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     t2 = load_reg(s, a->ra);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
     tcg_temp_free_i32(t2);
     t2 = load_reg(s, a->rd);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(zero);
     store_reg(s, a->ra, t0);
     store_reg(s, a->rd, t1);
     return true;
@@ -6342,14 +6280,13 @@ static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, MemOp sz)
     default:
         g_assert_not_reached();
     }
-    t3 = tcg_const_i32(1 << sz);
+    t3 = tcg_constant_i32(1 << sz);
     if (c) {
         gen_helper_crc32c(t1, t1, t2, t3);
     } else {
         gen_helper_crc32(t1, t1, t2, t3);
     }
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     store_reg(s, a->rd, t1);
     return true;
 }
@@ -6432,8 +6369,8 @@ static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    tmp = tcg_const_i32(a->sysm);
-    gen_helper_v7m_mrs(tmp, cpu_env, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_mrs(tmp, cpu_env, tcg_constant_i32(a->sysm));
     store_reg(s, a->rd, tmp);
     return true;
 }
@@ -6445,10 +6382,9 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    addr = tcg_const_i32((a->mask << 10) | a->sysm);
+    addr = tcg_constant_i32((a->mask << 10) | a->sysm);
     reg = load_reg(s, a->rn);
     gen_helper_v7m_msr(cpu_env, addr, reg);
-    tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
     /* If we wrote to CONTROL, the EL might have changed */
     gen_rebuild_hflags(s, true);
@@ -6660,8 +6596,8 @@ static bool trans_TT(DisasContext *s, arg_TT *a)
     }
 
     addr = load_reg(s, a->rn);
-    tmp = tcg_const_i32((a->A << 1) | a->T);
-    gen_helper_v7m_tt(tmp, cpu_env, addr, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_tt(tmp, cpu_env, addr, tcg_constant_i32((a->A << 1) | a->T));
     tcg_temp_free_i32(addr);
     store_reg(s, a->rd, tmp);
     return true;
@@ -7628,7 +7564,7 @@ static bool trans_PKH(DisasContext *s, arg_PKH *a)
 static bool op_sat(DisasContext *s, arg_sat *a,
                    void (*gen)(TCGv_i32, TCGv_env, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 tmp, satimm;
+    TCGv_i32 tmp;
     int shift = a->imm;
 
     if (!ENABLE_ARCH_6) {
@@ -7642,9 +7578,7 @@ static bool op_sat(DisasContext *s, arg_sat *a,
         tcg_gen_shli_i32(tmp, tmp, shift);
     }
 
-    satimm = tcg_const_i32(a->satimm);
-    gen(tmp, cpu_env, tmp, satimm);
-    tcg_temp_free_i32(satimm);
+    gen(tmp, cpu_env, tmp, tcg_constant_i32(a->satimm));
 
     store_reg(s, a->rd, tmp);
     return true;
@@ -7979,9 +7913,7 @@ static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
              * a non-zero multiplicand lowpart, and the correct result
              * lowpart for rounding.
              */
-            TCGv_i32 zero = tcg_const_i32(0);
-            tcg_gen_sub2_i32(t2, t1, zero, t3, t2, t1);
-            tcg_temp_free_i32(zero);
+            tcg_gen_sub2_i32(t2, t1, tcg_constant_i32(0), t3, t2, t1);
         } else {
             tcg_gen_add_i32(t1, t1, t3);
         }
@@ -8118,7 +8050,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
-    TCGv_i32 addr, tmp, tmp2;
+    TCGv_i32 addr, tmp;
 
     if (user) {
         /* STM (user) */
@@ -8148,9 +8080,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 
         if (user && i != 15) {
             tmp = tcg_temp_new_i32();
-            tmp2 = tcg_const_i32(i);
-            gen_helper_get_user_reg(tmp, cpu_env, tmp2);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_get_user_reg(tmp, cpu_env, tcg_constant_i32(i));
         } else {
             tmp = load_reg(s, i);
         }
@@ -8191,7 +8121,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
     bool loaded_base;
     bool user = a->u;
     bool exc_return = false;
-    TCGv_i32 addr, tmp, tmp2, loaded_var;
+    TCGv_i32 addr, tmp, loaded_var;
 
     if (user) {
         /* LDM (user), LDM (exception return) */
@@ -8234,9 +8164,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         tmp = tcg_temp_new_i32();
         gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
-            tmp2 = tcg_const_i32(i);
-            gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-            tcg_temp_free_i32(tmp2);
+            gen_helper_set_user_reg(cpu_env, tcg_constant_i32(i), tmp);
             tcg_temp_free_i32(tmp);
         } else if (i == a->rn) {
             loaded_var = tmp;
@@ -8329,7 +8257,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
     s->eci_handled = true;
 
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     for (i = 0; i < 15; i++) {
         if (extract32(a->list, i, 1)) {
             /* Clear R[i] */
@@ -8341,11 +8269,8 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
          * Clear APSR (by calling the MSR helper with the same argument
          * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
          */
-        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
-        gen_helper_v7m_msr(cpu_env, maskreg, zero);
-        tcg_temp_free_i32(maskreg);
+        gen_helper_v7m_msr(cpu_env, tcg_constant_i32(0xc00), zero);
     }
-    tcg_temp_free_i32(zero);
     clear_eci_state(s);
     return true;
 }
@@ -8488,8 +8413,7 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
     store_reg(s, 14, tmp);
     if (a->size != 4) {
         /* DLSTP: set FPSCR.LTPSIZE */
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     }
     return true;
@@ -8554,8 +8478,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          */
         bool ok = vfp_access_check(s);
         assert(ok);
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         /*
          * LTPSIZE updated, but MVE_NO_PRED will always be the same thing (0)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
@@ -8681,8 +8604,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
     gen_set_label(loopend);
     if (a->tp) {
         /* Exits from tail-pred loops must reset LTPSIZE to 4 */
-        tmp = tcg_const_i32(4);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
     gen_jmp_tb(s, s->base.pc_next, 1);
@@ -8913,21 +8835,18 @@ static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
         return true;
     }
 
-    tmp = tcg_const_i32(a->im);
+    tmp = tcg_constant_i32(a->im);
     /* FAULTMASK */
     if (a->F) {
-        addr = tcg_const_i32(19);
+        addr = tcg_constant_i32(19);
         gen_helper_v7m_msr(cpu_env, addr, tmp);
-        tcg_temp_free_i32(addr);
     }
     /* PRIMASK */
     if (a->I) {
-        addr = tcg_const_i32(16);
+        addr = tcg_constant_i32(16);
         gen_helper_v7m_msr(cpu_env, addr, tmp);
-        tcg_temp_free_i32(addr);
     }
     gen_rebuild_hflags(s, false);
-    tcg_temp_free_i32(tmp);
     gen_lookup_tb(s);
     return true;
 }
@@ -9063,13 +8982,14 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     /* In this insn input reg fields of 0b1111 mean "zero", not "PC" */
+    zero = tcg_constant_i32(0);
     if (a->rn == 15) {
-        rn = tcg_const_i32(0);
+        rn = zero;
     } else {
         rn = load_reg(s, a->rn);
     }
     if (a->rm == 15) {
-        rm = tcg_const_i32(0);
+        rm = zero;
     } else {
         rm = load_reg(s, a->rm);
     }
@@ -9091,10 +9011,8 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     arm_test_cc(&c, a->fcond);
-    zero = tcg_const_i32(0);
     tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
     arm_free_cc(&c);
-    tcg_temp_free_i32(zero);
 
     store_reg(s, a->rd, rn);
     tcg_temp_free_i32(rm);
-- 
2.25.1


