Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B02378C4E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:34:35 +0200 (CEST)
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg57K-00034r-Uo
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z2-0005jw-Ie
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z0-0003CM-Fo
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id z6so16428907wrm.4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+2+PC6B+zyTDO0jfQOvs3/TjHD3D5RvXNZJ5VbV7frc=;
 b=x7ck+QgHJwwOW2gjQ8RtpEbEWgH/FWR77oJmd89/ujcpT0Ks4GiLLETYZK7TyFCtQJ
 HnxLRMgUM2JrfR8N3sc7gi7wPjfKXrXKNm3OEDXcAGrjGJ5L3kO1z3dUkHvQy6/ZP3Qs
 Bi9yP/ZCepDPJg5Dc2nJC26s7YbDeOwof/lGODN412GY9AAqBjIIupCP++LPM2TJI3tJ
 P5f5u3EMe3psnWT3fD+DmDfuynet8SvO7YVmoVMwaauHGZVSqW0FweGfkw7Pmlx/pBdQ
 YzoF0UpSXt/kMWjVhQfQKLnvmYBr83e71fbB9aA/QH3BxoH6Cwa0q0QAr+QIj+Es17VW
 og0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+2+PC6B+zyTDO0jfQOvs3/TjHD3D5RvXNZJ5VbV7frc=;
 b=UG1YZr3wSFEsH1Cu57nce7zPXxDuzsUTe4Ikl7EhoZw5JwdgySfil/h7m/Yn5MQJB0
 L8qk05ZrZzlmmnBtP5a+SEHnNmhogyb9swiKIS5KyltVlAox5M1GjPqrKg8Kkj+jChhm
 ZYj3SLJJ0umrBt1y0EulPbHg9YeJggxcHEWFdRHBq1AZfwKA+OK9z3v+FqkRzEaqdfWx
 njssgvUK4c3R/AmW7VMzlN9TAQ1S6lvBWVXdw93xZGGvUBIW8AvM0HFlLamczjFOOMfY
 J6KJyBl99SED9kyyND0cRkJxeCHuEv6joLDLp6l/qSiTbqAeXR08etgNjYqHr38hfqRl
 0XhA==
X-Gm-Message-State: AOAM533z/ERE807zRrpd2t/pFlxiF1YKAvuGAO2hARwQhYicJV3aDiEs
 xs3XnVmJKU0XolsdN8j+BECYKGey4fCTBQ==
X-Google-Smtp-Source: ABdhPJy8Q9v1facRkDA/SAMVWZrLkdAt0lWKVlKTfDs6P3Pjqis2mwWbgc+IehwlX3oDnvLdqMOGDw==
X-Received: by 2002:a5d:498c:: with SMTP id r12mr30500084wrq.31.1620649557178; 
 Mon, 10 May 2021 05:25:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] target/arm: Make functions used by translate-vfp global
Date: Mon, 10 May 2021 13:25:32 +0100
Message-Id: <20210510122548.28638-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Make the remaining functions which are needed by translate-vfp.c.inc
global.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-8-peter.maydell@linaro.org
---
 target/arm/translate-a32.h | 18 ++++++++++++++++++
 target/arm/translate.c     | 25 ++++++++-----------------
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 522aa83636a..326cbafe996 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -30,6 +30,13 @@ void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop);
 void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop);
 void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop);
 void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop);
+TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs);
+void gen_set_cpsr(TCGv_i32 var, uint32_t mask);
+void gen_set_condexec(DisasContext *s);
+void gen_set_pc_im(DisasContext *s, target_ulong val);
+void gen_lookup_tb(DisasContext *s);
+long vfp_reg_offset(bool dp, unsigned reg);
+long neon_full_reg_offset(unsigned reg);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
@@ -57,6 +64,8 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
     return tmp;
 }
 
+void store_reg(DisasContext *s, int reg, TCGv_i32 var);
+
 void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
                               TCGv_i32 a32, int index, MemOp opc);
 void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
@@ -110,4 +119,13 @@ DO_GEN_ST(32, MO_UL)
 #undef DO_GEN_LD
 #undef DO_GEN_ST
 
+#if defined(CONFIG_USER_ONLY)
+#define IS_USER(s) 1
+#else
+#define IS_USER(s) (s->user)
+#endif
+
+/* Set NZCV flags from the high 4 bits of var.  */
+#define gen_set_nzcv(var) gen_set_cpsr(var, CPSR_NZCV)
+
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c8b9cedfcfd..c83f2205b67 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -52,12 +52,6 @@
 #include "translate.h"
 #include "translate-a32.h"
 
-#if defined(CONFIG_USER_ONLY)
-#define IS_USER(s) 1
-#else
-#define IS_USER(s) (s->user)
-#endif
-
 /* These are TCG temporaries used only by the legacy iwMMXt decoder */
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 /* These are TCG globals which alias CPUARMState fields */
@@ -209,7 +203,7 @@ void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
  * This is used for load/store for which use of PC implies (literal),
  * or ADD that implies ADR.
  */
-static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
+TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
 
@@ -223,7 +217,7 @@ static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
 
 /* Set a CPU register.  The source must be a temporary and will be
    marked as dead.  */
-static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
+void store_reg(DisasContext *s, int reg, TCGv_i32 var)
 {
     if (reg == 15) {
         /* In Thumb mode, we must ignore bit 0.
@@ -264,15 +258,12 @@ static void store_sp_checked(DisasContext *s, TCGv_i32 var)
 #define gen_sxtb16(var) gen_helper_sxtb16(var, var)
 #define gen_uxtb16(var) gen_helper_uxtb16(var, var)
 
-
-static inline void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
+void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
 {
     TCGv_i32 tmp_mask = tcg_const_i32(mask);
     gen_helper_cpsr_write(cpu_env, var, tmp_mask);
     tcg_temp_free_i32(tmp_mask);
 }
-/* Set NZCV flags from the high 4 bits of var.  */
-#define gen_set_nzcv(var) gen_set_cpsr(var, CPSR_NZCV)
 
 static void gen_exception_internal(int excp)
 {
@@ -697,7 +688,7 @@ void arm_gen_test_cc(int cc, TCGLabel *label)
     arm_free_cc(&cmp);
 }
 
-static inline void gen_set_condexec(DisasContext *s)
+void gen_set_condexec(DisasContext *s)
 {
     if (s->condexec_mask) {
         uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
@@ -707,7 +698,7 @@ static inline void gen_set_condexec(DisasContext *s)
     }
 }
 
-static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
+void gen_set_pc_im(DisasContext *s, target_ulong val)
 {
     tcg_gen_movi_i32(cpu_R[15], val);
 }
@@ -1074,7 +1065,7 @@ static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
-static inline void gen_lookup_tb(DisasContext *s)
+void gen_lookup_tb(DisasContext *s)
 {
     tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
     s->base.is_jmp = DISAS_EXIT;
@@ -1109,7 +1100,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
 /*
  * Return the offset of a "full" NEON Dreg.
  */
-static long neon_full_reg_offset(unsigned reg)
+long neon_full_reg_offset(unsigned reg)
 {
     return offsetof(CPUARMState, vfp.zregs[reg >> 1].d[reg & 1]);
 }
@@ -1135,7 +1126,7 @@ static long neon_element_offset(int reg, int element, MemOp memop)
 }
 
 /* Return the offset of a VFP Dreg (dp = true) or VFP Sreg (dp = false). */
-static long vfp_reg_offset(bool dp, unsigned reg)
+long vfp_reg_offset(bool dp, unsigned reg)
 {
     if (dp) {
         return neon_element_offset(reg, 0, MO_64);
-- 
2.20.1


