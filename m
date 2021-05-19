Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E238958F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:36:09 +0200 (CEST)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR3A-0003nk-Ek
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyF-0003PO-FM
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:03 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:42732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQy7-0005T1-1G
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:03 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so4775208otg.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tQT3qvMjB0SKpKRhYpGQ33pLkT70ukeZN2bklKDWyic=;
 b=anmSk9yFvRpUX85xip00FMzYwjWYmXIDfKWHJHhjjiCv/zTYxjJ3Xvgjun3GS5qxg+
 i8OJb7DAovRtJ6pSlm9Vj+goxvlTHMTBsqzCaksI4XmzZyYQ4btowTmHkifhLFp6NRXi
 uQ1xJIG4b0CBBSam6Ncbb2QH45yxIKno19sNpsZTK09cEADkI6pGqTYKTStyeq26rduY
 tMJdLCO0Nk6Zu7a2ap3E2PFgjBP2Fk9dooR3wOVj+Ch2fXQPWt3Gw7KalT+irUpxslKB
 117qwD2mbJNWK8nhg1ggunlMHoQdFA2HYZAhL8FaMU2AACOum+kLCVRcS08ikx3oLUQX
 TNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQT3qvMjB0SKpKRhYpGQ33pLkT70ukeZN2bklKDWyic=;
 b=g33jjwHHOXvVJhrwWoqEEUD5vjUfmEkNFofJNEEWmIsq3SpZcmYnAIHAHGQqO96F7o
 zGlhBJZRZy/Ph9+q6QdgyAq0OXizFZZkcTZoUKuHYgT9AmloXYbvcrruuKMCTUEs4cJ7
 mgoxxREKVmzhcXRzEaoj1Lf3vdyl5FgFkFIQBsHwU4Jgnkp/y02EZRMLiJNOjJSmhgf1
 ys3s7lndKqYBhPZb8zaErmY+G2ZZOpo7ZQL8+mqXF0GIDciBw/mW0O3nlztXjGouVjQT
 UPXggEcx9kJAlir3bn3UZbP4ntWmePRi6zK/tqByC99fznB3rllfUFiqYOeXzsCSjd5M
 8jHg==
X-Gm-Message-State: AOAM533owe5Bsr9AxfzFH3mgkV7GKk4QctXu0NZx2t3aQf1ZRXXHDM00
 MPxoLNA1/5M8PqdHGE/Uui0nYdo6QuPAzlxt
X-Google-Smtp-Source: ABdhPJwU/xKBCZSy5X3Uv2HQOwUsOc6hnvPCWlX70oRTF827jUH92hMiISKUr8idDK6rXwKa+xCaRg==
X-Received: by 2002:a05:6830:1ac3:: with SMTP id
 r3mr649641otc.322.1621449054016; 
 Wed, 19 May 2021 11:30:54 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/50] target/i386: Split out gen_exception_gpf
Date: Wed, 19 May 2021 13:30:01 -0500
Message-Id: <20210519183050.875453-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-2-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 68 ++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index db56a48343..2672e08197 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1276,6 +1276,12 @@ static void gen_illegal_opcode(DisasContext *s)
     gen_exception(s, EXCP06_ILLOP, s->pc_start - s->cs_base);
 }
 
+/* Generate #GP for the current instruction. */
+static void gen_exception_gpf(DisasContext *s)
+{
+    gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
+}
+
 /* if d == OR_TMP0, it means memory operand (address in A0) */
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
 {
@@ -4502,7 +4508,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->vex_l = 0;
     s->vex_v = 0;
     if (sigsetjmp(s->jmpbuf, 0) != 0) {
-        gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+        gen_exception_gpf(s);
         return s->pc;
     }
 
@@ -6567,7 +6573,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             set_cc_op(s, CC_OP_EFLAGS);
         } else if (s->vm86) {
             if (s->iopl != 3) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             } else {
                 gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
                 set_cc_op(s, CC_OP_EFLAGS);
@@ -6689,7 +6695,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9c: /* pushf */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_PUSHF);
         if (s->vm86 && s->iopl != 3) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_update_cc_op(s);
             gen_helper_read_eflags(s->T0, cpu_env);
@@ -6699,7 +6705,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9d: /* popf */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
         if (s->vm86 && s->iopl != 3) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             ot = gen_pop_T0(s);
             if (s->cpl == 0) {
@@ -7061,7 +7067,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (s->vm86 && s->iopl != 3) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
         }
@@ -7084,13 +7090,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (s->cpl <= s->iopl) {
                 gen_helper_cli(cpu_env);
             } else {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             }
         } else {
             if (s->iopl == 3) {
                 gen_helper_cli(cpu_env);
             } else {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             }
         }
         break;
@@ -7101,7 +7107,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_jmp_im(s, s->pc - s->cs_base);
             gen_eob_inhibit_irq(s, true);
         } else {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         }
         break;
     case 0x62: /* bound */
@@ -7194,7 +7200,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x130: /* wrmsr */
     case 0x132: /* rdmsr */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
@@ -7226,7 +7232,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
             goto illegal_op;
         if (!s->pe) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(cpu_env);
             gen_eob(s);
@@ -7237,7 +7243,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
             goto illegal_op;
         if (!s->pe) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
             gen_eob(s);
@@ -7256,7 +7262,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x107: /* sysret */
         if (!s->pe) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
             /* condition codes are modified only in long mode */
@@ -7278,7 +7284,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xf4: /* hlt */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
@@ -7304,7 +7310,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!s->pe || s->vm86)
                 goto illegal_op;
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             } else {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
@@ -7325,7 +7331,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!s->pe || s->vm86)
                 goto illegal_op;
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
             } else {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
@@ -7441,7 +7447,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
@@ -7458,7 +7464,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7483,7 +7489,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7496,7 +7502,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7511,7 +7517,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7525,7 +7531,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7549,7 +7555,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7559,7 +7565,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
@@ -7576,7 +7582,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(3): /* lidt */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
@@ -7622,7 +7628,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
         CASE_MODRM_OP(6): /* lmsw */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
@@ -7634,7 +7640,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
             if (s->cpl != 0) {
-                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                gen_exception_gpf(s);
                 break;
             }
             gen_update_cc_op(s);
@@ -7649,7 +7655,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifdef TARGET_X86_64
             if (CODE64(s)) {
                 if (s->cpl != 0) {
-                    gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+                    gen_exception_gpf(s);
                 } else {
                     tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
                     tcg_gen_ld_tl(cpu_seg_base[R_GS], cpu_env,
@@ -7685,7 +7691,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x108: /* invd */
     case 0x109: /* wbinvd */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
             /* nothing to do */
@@ -8009,7 +8015,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x120: /* mov reg, crN */
     case 0x122: /* mov crN, reg */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
@@ -8063,7 +8069,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
 #ifndef CONFIG_USER_ONLY
             modrm = x86_ldub_code(env, s);
@@ -8099,7 +8105,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0x106: /* clts */
         if (s->cpl != 0) {
-            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
+            gen_exception_gpf(s);
         } else {
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
-- 
2.25.1


