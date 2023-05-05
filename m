Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726B6F8AD9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:26:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vL-0000hD-Fr; Fri, 05 May 2023 17:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vF-0000ec-31
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vC-0004Na-O3
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315712406so113478555e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321898; x=1685913898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oB8BK24ylT5j8mHK7x+cgCN++DNdxFZfyjhkUcElAsk=;
 b=TbXsZTkUCqheGUheghixoVXdJ+5iPRareKsw507KD45narnM/l5/NVI/wmDDBQz0fU
 ptqVPdwrmcuC+FNIXt6QtRSygBd89MiwBh+LJOaub4+/gynZNiGxzA6HBzCeuqeqH1dp
 uE1n/k5HodzNV4uujQp4I8gdGi89C95P1NuIScetyyMvK1rcnEdJTAi0dvZBPFsIha9M
 BLL/OKBpKM8b+trLyFnQGlP5MGrM2i5ySlqNqA17ZpBmDuR4dcjElGiEvGDUfmuKqazX
 8mXOWCj7+sr62A+rSDZ7U/Qu3NsB+jlGEOKB/yOx7snS/cnKGgAo9DHbk+wzz6LOec24
 oF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321898; x=1685913898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oB8BK24ylT5j8mHK7x+cgCN++DNdxFZfyjhkUcElAsk=;
 b=bXdjYuA1EgBsIa4u3YSA6ABpdO8FVzsO86yJVsx5ZZULUJiJqz4QL9L262wb+7Kqy9
 MZJmd+6xxknv2HSYbheR79/3gowCMf5d8iRxUGzXiOC7PO2/wQiB4SXvkZc2s4Tw5zwu
 ypcI+ZajJoyubWsA4jbj73Pw+Fxi6uHL1Sr2v0IU6Ayq7IVUVSFC8xJW85GPXGg4NRCo
 42YhldaL1bl/cj0cFI470l0wJ9toi8krGQzHpTfE05CRRmN9M/lbfjA9327Q4IbsYSeE
 eLLtlAqPeWT3bD99hYZAFsO+oUJ54/DmXbSU+u5QGr+zKEu8S/c7o0sLBUspcGKL5WMm
 ADwg==
X-Gm-Message-State: AC+VfDw+HrSOukLhOnfVfI5QpUyiJArglGGr8ADAGQRjojP/JyzrvlFr
 DFxtKCU5xSQ+qnZR5prJPeDgmRFkhYQiVEGcFewxhw==
X-Google-Smtp-Source: ACHHUZ7mL7b8cjuqHv0ksWeN5sL4FZ5/UrATLTCJ3ZEvgC4lA3teZo2ndb7DVTBy1zshC65bbcWfpA==
X-Received: by 2002:a5d:5233:0:b0:2f8:1305:dce1 with SMTP id
 i19-20020a5d5233000000b002f81305dce1mr2322015wra.19.1683321897898; 
 Fri, 05 May 2023 14:24:57 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 16/42] target/sparc: Use MO_ALIGN where required
Date: Fri,  5 May 2023 22:24:21 +0100
Message-Id: <20230505212447.374546-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


