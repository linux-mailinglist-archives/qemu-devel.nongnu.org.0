Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D71327581
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:13:04 +0100 (CET)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGWBL-0002De-JA
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPx-0005wi-OL
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:05 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPo-0007mj-2Z
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:05 -0500
Received: by mail-pl1-x633.google.com with SMTP id k22so8762250pll.6
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqZMZKuCD0f1nXNgNRszgNxoe0OlJvCa7ALxkvWMb0k=;
 b=ZOiYeKUYxZ/hbs3HDy3JLBRKGPfckQydXWaFWMxKL2sBtv9jCu3fLaiYE2ctqGqA5T
 frkMsdM16w2EUDvBkPwAuglrY34UZvbM1LFL7OLRd/9Z1+AGUQOmkGEQU2M9IvOwmjJQ
 nC+BsLEUXUsDSF4zy6xsrPDRWknBcB3f6f7l0UgmM9ky07fXaBHa7yGhLZk9mes5zUgt
 hNaKCduezRmmjWyUh5/PPasFGox6Rb4te79Jknk+hS4sebhCFgZDVE18YvT9MAe7pVgQ
 3DUANngDR1F8TrR6GUefXLW8zhdkW09gCVBwdMhfnQoneNp5TOnuSN9bPqyGqQt/fT5e
 JVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aqZMZKuCD0f1nXNgNRszgNxoe0OlJvCa7ALxkvWMb0k=;
 b=nt1n0cP/efRkPbUDU1UW1Pd4fgkhUrHEj2ikz1XopUnztDyyrxQadkpOBcbQRQfU8I
 JQzIJplhpQJCQzU6atJwYWMZOyoLK6ULHWgKJRvtJpjAMtZIsXJ7S2l4m44mivwfigQ0
 JD46r0qbORoOp1nwJ+uhOCRxMqn2b3lmXGin/2UwL7eQ0Li5e+rkAWOL2SBXh9WupjEI
 itJ7uBahyHoaVQSdRZ/ljl9j2C9qHZHf3EqUJKP2NRMaE81FoTQ+TBo2jzYHyVX/OLyU
 QYW/8Qw11Wig7m81DRDKomZlb78MO9I+D/FdewWnnMxz+tkIy3nuRk1dfviFE2IgLG+x
 WBTQ==
X-Gm-Message-State: AOAM532di0EwHDjqn3By236WctCZM9VqPfSfmnGro1wNmQmNbOhpiSpJ
 ppGoXIpapnEywL2BXn/QnJGfwfxgCkb3rw==
X-Google-Smtp-Source: ABdhPJxLDY7O/EeWbHyI9fDfZJ540gCLF2Z70eFgrwhv7wbWtO2p9LPtFRJgYazLndecP8rcrGS85Q==
X-Received: by 2002:a17:90a:114f:: with SMTP id
 d15mr14556061pje.1.1614554634828; 
 Sun, 28 Feb 2021 15:23:54 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/50] target/i386: Cleanup read_crN, write_crN, lmsw
Date: Sun, 28 Feb 2021 15:23:10 -0800
Message-Id: <20210228232321.322053-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: cfontana@suse.de
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
index 1ca9ace3dc..b0d3c61f13 100644
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
index 6a88840cf2..ebf15e3dde 100644
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
index 33faffe00f..708059ac15 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7648,13 +7648,22 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -8028,58 +8037,56 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


