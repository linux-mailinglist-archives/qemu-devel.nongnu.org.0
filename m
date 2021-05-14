Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C643B380D92
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:49:13 +0200 (CEST)
Received: from localhost ([::1]:50966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lha3s-0002UH-QW
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWF-0006PG-9E
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:27 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:40615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW9-000791-07
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:27 -0400
Received: by mail-qt1-x836.google.com with SMTP id j19so22406083qtp.7
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y//qpe9C1BMWcI8X6km7qURux7ByBn4kvB0jecV92uw=;
 b=FKVWD8QNgduznSpCAsE/GaIW0lYt+I72vdfuZR2TXdW1J1Dc9LXEVMHuvze+Vr5yEH
 2MZcv2i9eMRlETjZ23AT2Nmr72B40hdviTG+RrKECc91V3QLX7INyU0FPbuPG60yMTrq
 JYfFJZaALV0lm1KEKTKUA0VyO52RcoFZ5mC9grbmIg8RvFo76E0h5nRRcxdvWPFV7KJG
 hSezRBo5JHYU5b/m0et6RBjr1Zy3PHtYdLptir8gnG+rxVXtZgchxYDJYLqU+dDc3fO1
 iu2UT68sB0uSc/QA862qcT8cyCypJNbPlPOUsZlLXvSNxCdx4++iK9/uUSQBWSFlGy/S
 FmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y//qpe9C1BMWcI8X6km7qURux7ByBn4kvB0jecV92uw=;
 b=m4BFtFgNXCJ1XIOwQrEAjFxJrZWaHPDMaqVgyMdl1IUiNVF/XXsWTKQQ4Ma9Tmlywt
 Fdtk3FW/MQkpT3B8iwcXKp49kCsaerxeZvVzGz3DHoG/ODdC4NmcmwIUmOkJQ487AwxS
 YhI+laqtKGA1rZq3l4IySBEgeFjPBAmNjdXyvmmFbV0QQMlx+U1C7xJ+Uv3f0yg7H8L8
 E4chelxiv+IC7jcf4Riiew9qQxA6SJ1PgNPAAvJw3IL8F7VSogYR23Rl7q1FTRVePkzx
 yIKV9bKQjTW1cyIXNl+jAzOOUQSoznsUM4R8qeVGFk54wc+CH5fiiObHTQY5BL4U0qGK
 oICw==
X-Gm-Message-State: AOAM533njoJ6ksdbm5o5Z4yqK18MgCDyACtsRyvHo7jmPQeuFp2caNJs
 HpdRHaquH+3qTP45yFY4gG1Bj6Gj6fcofjsQmbs=
X-Google-Smtp-Source: ABdhPJzbDdiZfdUOuAj9f8qRcqQjh2ceXipkmHdOFm6zrWi6ESxOgAPZ1vjnP+pI6d9vmDGo9O1SLA==
X-Received: by 2002:ac8:7b26:: with SMTP id l6mr44434627qtu.136.1621005260040; 
 Fri, 14 May 2021 08:14:20 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/50] target/i386: Cleanup read_crN, write_crN, lmsw
Date: Fri, 14 May 2021 10:13:31 -0500
Message-Id: <20210514151342.384376-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the svm intercept check into the translator.
Pull the entire implementation of lmsw into the translator.
Push the check for CR8LEG into the regno validation switch.
Unify the gen_io_start check between read/write.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h                 |  5 +-
 target/i386/tcg/misc_helper.c        |  8 ---
 target/i386/tcg/sysemu/misc_helper.c |  2 -
 target/i386/tcg/translate.c          | 97 +++++++++++++++-------------
 4 files changed, 54 insertions(+), 58 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 86484a4ec4..ebfaca66dd 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -42,9 +42,8 @@ DEF_HELPER_5(lcall_protected, void, env, int, tl, int, tl)
 DEF_HELPER_2(iret_real, void, env, int)
 DEF_HELPER_3(iret_protected, void, env, int, int)
 DEF_HELPER_3(lret_protected, void, env, int, int)
-DEF_HELPER_2(read_crN, tl, env, int)
-DEF_HELPER_3(write_crN, void, env, int, tl)
-DEF_HELPER_2(lmsw, void, env, tl)
+DEF_HELPER_FLAGS_2(read_crN, TCG_CALL_NO_RWG, tl, env, int)
+DEF_HELPER_FLAGS_3(write_crN, TCG_CALL_NO_RWG, void, env, int, tl)
 DEF_HELPER_1(clts, void, env)
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 0e9a4f0bfc..931dbd9db0 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -60,14 +60,6 @@ void helper_cpuid(CPUX86State *env)
     env->regs[R_EDX] = edx;
 }
 
-void helper_lmsw(CPUX86State *env, target_ulong t0)
-{
-    /* only 4 lower bits of CR0 are modified. PE cannot be set to zero
-       if already set to one. */
-    t0 = (env->cr[0] & ~0xe) | (t0 & 0xf);
-    helper_write_crN(env, 0, t0);
-}
-
 void helper_invlpg(CPUX86State *env, target_ulong addr)
 {
     X86CPU *cpu = env_archcpu(env);
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 66e7939537..c7381ef7e8 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -65,7 +65,6 @@ target_ulong helper_read_crN(CPUX86State *env, int reg)
 {
     target_ulong val;
 
-    cpu_svm_check_intercept_param(env, SVM_EXIT_READ_CR0 + reg, 0, GETPC());
     switch (reg) {
     default:
         val = env->cr[reg];
@@ -83,7 +82,6 @@ target_ulong helper_read_crN(CPUX86State *env, int reg)
 
 void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
 {
-    cpu_svm_check_intercept_param(env, SVM_EXIT_WRITE_CR0 + reg, 0, GETPC());
     switch (reg) {
     case 0:
         cpu_x86_update_cr0(env, t0);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d0fef4cce8..6804835712 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7654,13 +7654,22 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_wrpkru(cpu_env, s->tmp2_i32, s->tmp1_i64);
             break;
+
         CASE_MODRM_OP(6): /* lmsw */
             if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            gen_helper_lmsw(cpu_env, s->T0);
+            /*
+             * Only the 4 lower bits of CR0 are modified.
+             * PE cannot be set to zero if already set to one.
+             */
+            tcg_gen_ld_tl(s->T1, cpu_env, offsetof(CPUX86State, cr[0]));
+            tcg_gen_andi_tl(s->T0, s->T0, 0xf);
+            tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
+            tcg_gen_or_tl(s->T0, s->T0, s->T1);
+            gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
             gen_jmp_im(s, s->pc - s->cs_base);
             gen_eob(s);
             break;
@@ -8034,58 +8043,56 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         gen_nop_modrm(env, s, modrm);
         break;
+
     case 0x120: /* mov reg, crN */
     case 0x122: /* mov crN, reg */
-        if (check_cpl0(s)) {
-            modrm = x86_ldub_code(env, s);
-            /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
-             * AMD documentation (24594.pdf) and testing of
-             * intel 386 and 486 processors all show that the mod bits
-             * are assumed to be 1's, regardless of actual values.
-             */
-            rm = (modrm & 7) | REX_B(s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            if (CODE64(s))
-                ot = MO_64;
-            else
-                ot = MO_32;
-            if ((prefixes & PREFIX_LOCK) && (reg == 0) &&
+        if (!check_cpl0(s)) {
+            break;
+        }
+        modrm = x86_ldub_code(env, s);
+        /*
+         * Ignore the mod bits (assume (modrm&0xc0)==0xc0).
+         * AMD documentation (24594.pdf) and testing of Intel 386 and 486
+         * processors all show that the mod bits are assumed to be 1's,
+         * regardless of actual values.
+         */
+        rm = (modrm & 7) | REX_B(s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        switch (reg) {
+        case 0:
+            if ((prefixes & PREFIX_LOCK) &&
                 (s->cpuid_ext3_features & CPUID_EXT3_CR8LEG)) {
                 reg = 8;
             }
-            switch(reg) {
-            case 0:
-            case 2:
-            case 3:
-            case 4:
-            case 8:
-                gen_update_cc_op(s);
-                gen_jmp_im(s, pc_start - s->cs_base);
-                if (b & 2) {
-                    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                        gen_io_start();
-                    }
-                    gen_op_mov_v_reg(s, ot, s->T0, rm);
-                    gen_helper_write_crN(cpu_env, tcg_const_i32(reg),
-                                         s->T0);
-                    gen_jmp_im(s, s->pc - s->cs_base);
-                    gen_eob(s);
-                } else {
-                    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                        gen_io_start();
-                    }
-                    gen_helper_read_crN(s->T0, cpu_env, tcg_const_i32(reg));
-                    gen_op_mov_reg_v(s, ot, rm, s->T0);
-                    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                        gen_jmp(s, s->pc - s->cs_base);
-                    }
-                }
-                break;
-            default:
-                goto unknown_op;
+            break;
+        case 2:
+        case 3:
+        case 4:
+            break;
+        default:
+            goto unknown_op;
+        }
+        ot  = (CODE64(s) ? MO_64 : MO_32);
+
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        if (b & 2) {
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
+            gen_op_mov_v_reg(s, ot, s->T0, rm);
+            gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+        } else {
+            gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
+            gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
+            gen_op_mov_reg_v(s, ot, rm, s->T0);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_jmp(s, s->pc - s->cs_base);
             }
         }
         break;
+
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
         if (check_cpl0(s)) {
-- 
2.25.1


