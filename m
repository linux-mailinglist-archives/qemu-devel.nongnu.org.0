Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5268A6F480B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYy-0002pW-Sz; Tue, 02 May 2023 12:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYs-0002oz-8a
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:07 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYn-0000lD-JD
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso26643935e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043736; x=1685635736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yzJc4jZKJ70DTOT+LrCw9YC1efp+iFqVCbc/e9SoDg=;
 b=EhfVLWP60sVbqdPlNGRO7Y8UCGznwnok8aEfPJ6IaQiefEPTAOsnWXsHSO/Ft+SIJu
 ZhMO7MpH+1nf0S9QhSgkeLkVLgWkNftVrIhNWlONHfXnAbVxGU5HmhOvyxckxf6hc3i3
 JwBdq4C9HLHFCELECwqt67zeBbA8V4G5UvRpC3saO386hF/OuBatk4oRgSdS8RtprKAL
 rQ8zZr155G0Nswj5IB0d4UUuG7bDQm6Ic4eJLwK3eVjSu/HMhB75zaJ+k5uCENNXDe0l
 sYmHWtB0cqacVZwppDbpnxH1i3nzQ5nuGzdZFHSVmn7csm2Z5rMbm+1aCjieBmPZAgCC
 Qieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043736; x=1685635736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0yzJc4jZKJ70DTOT+LrCw9YC1efp+iFqVCbc/e9SoDg=;
 b=bIFVehPDIHBwoAJBzRH6fUDnaQLdwiQcziez+04ZvIbWng+a/URV7BHpm943R5LXdd
 z+g4NO/SOesJe5Qi3pAQhwQjs20zQGLrVMNm9BUxo5IgnyJrs8QQW3MIaOoI4PTTdesp
 1+Ew4hV8U/jQwNA64YN3VXtmFyczDbmuxFRRPoZT/2a0hVU0QLGqTizmxK9ZN1QYP3HG
 tg0v/m9pFBqBBt2SyNmFXKZfD1lfZsqWfA7CfzLJKzqHgV2Mi87jVMNj4a5ZZGnNlWA9
 +E/kuYVXmoYDm9AKstLm6DCInxhbmqMKUm8G6qsWuWfD2XWYe9+wMROdTsU+IQeDheeV
 4xjQ==
X-Gm-Message-State: AC+VfDwPDw9zcELE6387tPRqDMw0e+Nyy4/6xRagfL7Ywck/QWF+NOuz
 0axh/KchE6cVK+Q+5XUJ9rIAxeeFI2UDBQV/fck36w==
X-Google-Smtp-Source: ACHHUZ4KW4bF/8Y33Gwv2OiGnvUWxba6d/uDHiV8iKXgHG55Qn332EhUuCv6is/98qhLWv1QwZTZVg==
X-Received: by 2002:a1c:f217:0:b0:3f1:70cf:a2d9 with SMTP id
 s23-20020a1cf217000000b003f170cfa2d9mr12431460wmc.9.1683043736469; 
 Tue, 02 May 2023 09:08:56 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 13/16] target/sparc: Use MO_ALIGN where required
Date: Tue,  2 May 2023 17:08:43 +0100
Message-Id: <20230502160846.1289975-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 66 +++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bc71e44e66..414e014b11 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -1899,7 +1899,7 @@ static void gen_swap(DisasContext *dc, TCGv dst, TCGv src,
                      TCGv addr, int mmu_idx, MemOp memop)
 {
     gen_address_mask(dc, addr);
-    tcg_gen_atomic_xchg_tl(dst, addr, src, mmu_idx, memop);
+    tcg_gen_atomic_xchg_tl(dst, addr, src, mmu_idx, memop | MO_ALIGN);
 }
 
 static void gen_ldstub(DisasContext *dc, TCGv dst, TCGv addr, int mmu_idx)
@@ -2155,12 +2155,12 @@ static void gen_ld_asi(DisasContext *dc, TCGv dst, TCGv addr,
         break;
     case GET_ASI_DIRECT:
         gen_address_mask(dc, addr);
-        tcg_gen_qemu_ld_tl(dst, addr, da.mem_idx, da.memop);
+        tcg_gen_qemu_ld_tl(dst, addr, da.mem_idx, da.memop | MO_ALIGN);
         break;
     default:
         {
             TCGv_i32 r_asi = tcg_constant_i32(da.asi);
-            TCGv_i32 r_mop = tcg_constant_i32(memop);
+            TCGv_i32 r_mop = tcg_constant_i32(memop | MO_ALIGN);
 
             save_state(dc);
 #ifdef TARGET_SPARC64
@@ -2201,7 +2201,7 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
         /* fall through */
     case GET_ASI_DIRECT:
         gen_address_mask(dc, addr);
-        tcg_gen_qemu_st_tl(src, addr, da.mem_idx, da.memop);
+        tcg_gen_qemu_st_tl(src, addr, da.mem_idx, da.memop | MO_ALIGN);
         break;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     case GET_ASI_BCOPY:
@@ -2233,7 +2233,7 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
     default:
         {
             TCGv_i32 r_asi = tcg_constant_i32(da.asi);
-            TCGv_i32 r_mop = tcg_constant_i32(memop & MO_SIZE);
+            TCGv_i32 r_mop = tcg_constant_i32(memop | MO_ALIGN);
 
             save_state(dc);
 #ifdef TARGET_SPARC64
@@ -2283,7 +2283,7 @@ static void gen_cas_asi(DisasContext *dc, TCGv addr, TCGv cmpv,
     case GET_ASI_DIRECT:
         oldv = tcg_temp_new();
         tcg_gen_atomic_cmpxchg_tl(oldv, addr, cmpv, gen_load_gpr(dc, rd),
-                                  da.mem_idx, da.memop);
+                                  da.mem_idx, da.memop | MO_ALIGN);
         gen_store_gpr(dc, rd, oldv);
         break;
     default:
@@ -2347,7 +2347,7 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
         switch (size) {
         case 4:
             d32 = gen_dest_fpr_F(dc);
-            tcg_gen_qemu_ld_i32(d32, addr, da.mem_idx, da.memop);
+            tcg_gen_qemu_ld_i32(d32, addr, da.mem_idx, da.memop | MO_ALIGN);
             gen_store_fpr_F(dc, rd, d32);
             break;
         case 8:
@@ -2397,7 +2397,8 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
         /* Valid for lddfa only.  */
         if (size == 8) {
             gen_address_mask(dc, addr);
-            tcg_gen_qemu_ld_i64(cpu_fpr[rd / 2], addr, da.mem_idx, da.memop);
+            tcg_gen_qemu_ld_i64(cpu_fpr[rd / 2], addr, da.mem_idx,
+                                da.memop | MO_ALIGN);
         } else {
             gen_exception(dc, TT_ILL_INSN);
         }
@@ -2406,7 +2407,7 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
     default:
         {
             TCGv_i32 r_asi = tcg_constant_i32(da.asi);
-            TCGv_i32 r_mop = tcg_constant_i32(da.memop);
+            TCGv_i32 r_mop = tcg_constant_i32(da.memop | MO_ALIGN);
 
             save_state(dc);
             /* According to the table in the UA2011 manual, the only
@@ -2454,7 +2455,7 @@ static void gen_stf_asi(DisasContext *dc, TCGv addr,
         switch (size) {
         case 4:
             d32 = gen_load_fpr_F(dc, rd);
-            tcg_gen_qemu_st_i32(d32, addr, da.mem_idx, da.memop);
+            tcg_gen_qemu_st_i32(d32, addr, da.mem_idx, da.memop | MO_ALIGN);
             break;
         case 8:
             tcg_gen_qemu_st_i64(cpu_fpr[rd / 2], addr, da.mem_idx,
@@ -2506,7 +2507,8 @@ static void gen_stf_asi(DisasContext *dc, TCGv addr,
         /* Valid for stdfa only.  */
         if (size == 8) {
             gen_address_mask(dc, addr);
-            tcg_gen_qemu_st_i64(cpu_fpr[rd / 2], addr, da.mem_idx, da.memop);
+            tcg_gen_qemu_st_i64(cpu_fpr[rd / 2], addr, da.mem_idx,
+                                da.memop | MO_ALIGN);
         } else {
             gen_exception(dc, TT_ILL_INSN);
         }
@@ -2543,7 +2545,7 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
             TCGv_i64 tmp = tcg_temp_new_i64();
 
             gen_address_mask(dc, addr);
-            tcg_gen_qemu_ld_i64(tmp, addr, da.mem_idx, da.memop);
+            tcg_gen_qemu_ld_i64(tmp, addr, da.mem_idx, da.memop | MO_ALIGN);
 
             /* Note that LE ldda acts as if each 32-bit register
                result is byte swapped.  Having just performed one
@@ -2613,7 +2615,7 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
                 tcg_gen_concat32_i64(t64, hi, lo);
             }
             gen_address_mask(dc, addr);
-            tcg_gen_qemu_st_i64(t64, addr, da.mem_idx, da.memop);
+            tcg_gen_qemu_st_i64(t64, addr, da.mem_idx, da.memop | MO_ALIGN);
         }
         break;
 
@@ -2651,7 +2653,7 @@ static void gen_casx_asi(DisasContext *dc, TCGv addr, TCGv cmpv,
     case GET_ASI_DIRECT:
         oldv = tcg_temp_new();
         tcg_gen_atomic_cmpxchg_tl(oldv, addr, cmpv, gen_load_gpr(dc, rd),
-                                  da.mem_idx, da.memop);
+                                  da.mem_idx, da.memop | MO_ALIGN);
         gen_store_gpr(dc, rd, oldv);
         break;
     default:
@@ -2678,7 +2680,7 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
         return;
     case GET_ASI_DIRECT:
         gen_address_mask(dc, addr);
-        tcg_gen_qemu_ld_i64(t64, addr, da.mem_idx, da.memop);
+        tcg_gen_qemu_ld_i64(t64, addr, da.mem_idx, da.memop | MO_ALIGN);
         break;
     default:
         {
@@ -2710,7 +2712,7 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
         break;
     case GET_ASI_DIRECT:
         gen_address_mask(dc, addr);
-        tcg_gen_qemu_st_i64(t64, addr, da.mem_idx, da.memop);
+        tcg_gen_qemu_st_i64(t64, addr, da.mem_idx, da.memop | MO_ALIGN);
         break;
     case GET_ASI_BFILL:
         /* Store 32 bytes of T64 to ADDR.  */
@@ -5180,7 +5182,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 case 0x0:       /* ld, V9 lduw, load unsigned word */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TEUL);
+                                       dc->mem_idx, MO_TEUL | MO_ALIGN);
                     break;
                 case 0x1:       /* ldub, load unsigned byte */
                     gen_address_mask(dc, cpu_addr);
@@ -5190,7 +5192,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 case 0x2:       /* lduh, load unsigned halfword */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TEUW);
+                                       dc->mem_idx, MO_TEUW | MO_ALIGN);
                     break;
                 case 0x3:       /* ldd, load double word */
                     if (rd & 1)
@@ -5201,7 +5203,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         gen_address_mask(dc, cpu_addr);
                         t64 = tcg_temp_new_i64();
                         tcg_gen_qemu_ld_i64(t64, cpu_addr,
-                                            dc->mem_idx, MO_TEUQ);
+                                            dc->mem_idx, MO_TEUQ | MO_ALIGN);
                         tcg_gen_trunc_i64_tl(cpu_val, t64);
                         tcg_gen_ext32u_tl(cpu_val, cpu_val);
                         gen_store_gpr(dc, rd + 1, cpu_val);
@@ -5217,7 +5219,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 case 0xa:       /* ldsh, load signed halfword */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TESW);
+                                       dc->mem_idx, MO_TESW | MO_ALIGN);
                     break;
                 case 0xd:       /* ldstub */
                     gen_ldstub(dc, cpu_val, cpu_addr, dc->mem_idx);
@@ -5272,12 +5274,12 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 case 0x08: /* V9 ldsw */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TESL);
+                                       dc->mem_idx, MO_TESL | MO_ALIGN);
                     break;
                 case 0x0b: /* V9 ldx */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TEUQ);
+                                       dc->mem_idx, MO_TEUQ | MO_ALIGN);
                     break;
                 case 0x18: /* V9 ldswa */
                     gen_ld_asi(dc, cpu_val, cpu_addr, insn, MO_TESL);
@@ -5328,7 +5330,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     gen_address_mask(dc, cpu_addr);
                     cpu_dst_32 = gen_dest_fpr_F(dc);
                     tcg_gen_qemu_ld_i32(cpu_dst_32, cpu_addr,
-                                        dc->mem_idx, MO_TEUL);
+                                        dc->mem_idx, MO_TEUL | MO_ALIGN);
                     gen_store_fpr_F(dc, rd, cpu_dst_32);
                     break;
                 case 0x21:      /* ldfsr, V9 ldxfsr */
@@ -5337,14 +5339,14 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     if (rd == 1) {
                         TCGv_i64 t64 = tcg_temp_new_i64();
                         tcg_gen_qemu_ld_i64(t64, cpu_addr,
-                                            dc->mem_idx, MO_TEUQ);
+                                            dc->mem_idx, MO_TEUQ | MO_ALIGN);
                         gen_helper_ldxfsr(cpu_fsr, cpu_env, cpu_fsr, t64);
                         break;
                     }
 #endif
                     cpu_dst_32 = tcg_temp_new_i32();
                     tcg_gen_qemu_ld_i32(cpu_dst_32, cpu_addr,
-                                        dc->mem_idx, MO_TEUL);
+                                        dc->mem_idx, MO_TEUL | MO_ALIGN);
                     gen_helper_ldfsr(cpu_fsr, cpu_env, cpu_fsr, cpu_dst_32);
                     break;
                 case 0x22:      /* ldqf, load quad fpreg */
@@ -5377,7 +5379,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 case 0x4: /* st, store word */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TEUL);
+                                       dc->mem_idx, MO_TEUL | MO_ALIGN);
                     break;
                 case 0x5: /* stb, store byte */
                     gen_address_mask(dc, cpu_addr);
@@ -5386,7 +5388,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 case 0x6: /* sth, store halfword */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TEUW);
+                                       dc->mem_idx, MO_TEUW | MO_ALIGN);
                     break;
                 case 0x7: /* std, store double word */
                     if (rd & 1)
@@ -5400,7 +5402,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         t64 = tcg_temp_new_i64();
                         tcg_gen_concat_tl_i64(t64, lo, cpu_val);
                         tcg_gen_qemu_st_i64(t64, cpu_addr,
-                                            dc->mem_idx, MO_TEUQ);
+                                            dc->mem_idx, MO_TEUQ | MO_ALIGN);
                     }
                     break;
 #if !defined(CONFIG_USER_ONLY) || defined(TARGET_SPARC64)
@@ -5424,7 +5426,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 case 0x0e: /* V9 stx */
                     gen_address_mask(dc, cpu_addr);
                     tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
-                                       dc->mem_idx, MO_TEUQ);
+                                       dc->mem_idx, MO_TEUQ | MO_ALIGN);
                     break;
                 case 0x1e: /* V9 stxa */
                     gen_st_asi(dc, cpu_val, cpu_addr, insn, MO_TEUQ);
@@ -5442,7 +5444,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     gen_address_mask(dc, cpu_addr);
                     cpu_src1_32 = gen_load_fpr_F(dc, rd);
                     tcg_gen_qemu_st_i32(cpu_src1_32, cpu_addr,
-                                        dc->mem_idx, MO_TEUL);
+                                        dc->mem_idx, MO_TEUL | MO_ALIGN);
                     break;
                 case 0x25: /* stfsr, V9 stxfsr */
                     {
@@ -5450,12 +5452,12 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         gen_address_mask(dc, cpu_addr);
                         if (rd == 1) {
                             tcg_gen_qemu_st_tl(cpu_fsr, cpu_addr,
-                                               dc->mem_idx, MO_TEUQ);
+                                               dc->mem_idx, MO_TEUQ | MO_ALIGN);
                             break;
                         }
 #endif
                         tcg_gen_qemu_st_tl(cpu_fsr, cpu_addr,
-                                           dc->mem_idx, MO_TEUL);
+                                           dc->mem_idx, MO_TEUL | MO_ALIGN);
                     }
                     break;
                 case 0x26:
-- 
2.34.1


