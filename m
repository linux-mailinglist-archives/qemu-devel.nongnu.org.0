Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7953B8CE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:10:42 +0200 (CEST)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjez-0001GQ-GC
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTT-0000a0-Qq
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTR-0001Du-KI
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:47 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MYNS0-1oJKmf1PXO-00VQrC; Thu, 02
 Jun 2022 13:58:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/19] target/m68k: Fix pc, c flag,
 and address argument for EXCP_DIV0
Date: Thu,  2 Jun 2022 13:58:27 +0200
Message-Id: <20220602115837.2013918-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pqc3r/HEB15/YeH/OaPtISXwt4qva2YCyTOCRbDbVawZj59XmzQ
 O3AlyN0GRnYutLWTZtWJd0zRMPSGk+Q2jzBANdBPUmP4IuPbz24ej81cgBp5GuaPKZfPI2W
 xlcgSZa1G9vwDaRuLkopr9g/4VNXij0CXcXzlOMFXS5CukHKNVigUOcCrOad2WCW5rV1/WJ
 xCq1aPTcq+nztONkUz2zQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Mm51OlHIT8=:nwUQ7CT/u7ms67LH1ooe3n
 Agiwga5I9dKBEuMhtxE0AJrZ/BYZYvaA7u1grzfb5WFBsrsRG7Gqf+Xe/AseiVanMLBX9Fzf/
 SpIzryrXtfof0++b00YqF7ClF4vPGkiA6kPLnafhxUCHAPpGZ3e9PR/qTgOl0XGha6jjKLu7V
 X7KzXPxwvG+spIFocdcQw4SxXmvostcH+5WA3YvG9kt8+A0+r56rPn+npu5iO3hT1yRJPnlxH
 tA5HWKy/LkzSsWCpW7bPD6WMoCCJIASNj9Sz2vfWfb63zo3SwqFSEaP4btO0zt9ueN0x+VymG
 3BFECwcB2ld40CXIu7yCg+QqoAF2RS7zRvRg3wgdp+AhDXosbvu6MeAHvx1ZXq9qPO493ACgT
 HlJF/05R7C0giDPHdz7hMftgTsA3hhwXFuNbLXautJPnEAGujhjHt2OQBwHUnAeWO3wNkB7EF
 ahvyZ8aiRZxvLTF7gYZWQy++YpOV1BjRTpKdyLVRXLsqo3SQ5C5RkRg78be+xK60nTXaYji9K
 PjAdKYgieDnauKzwLE8Q92YTl8LfIKOG4nr0bezLN8RJEo18Ga9Gpr263HvUu+XKJMcswtyRL
 ImlE+3L9oV7/FqJnMx+q+2zn8IGJvdzNSHq3KiXi2CQ2qnD05sxTcN5Pzwy+PbKhNcmcKBHYs
 QasxSDvCLmES2RDhKuVDidVJ64eq9iTer36qyA8uEI6Ceb3MbJGVpZEdjR98A7drUmfNHHEjD
 AGUAGzHmxAIumQ+Dv89oOoirPFzxRyY3M9pCpw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

According to the M68040 Users Manual, section 8.4.3,
Six word stack frame (format 2), Zero Div (and others)
is supposed to record the next insn in PC and the
address of the trapping instruction in ADDRESS.

While the N, Z and V flags are documented to be undefine on DIV0,
the C flag is documented as always cleared.

Update helper_div* to take the instruction length as an argument
and use raise_exception_format2.  Hoist the reset of the C flag
above the division by zero check.

Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
kernel does in trap_c().

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/helper.h       | 12 +++++-----
 linux-user/m68k/cpu_loop.c |  2 +-
 target/m68k/op_helper.c    | 48 +++++++++++++++++++++++---------------
 target/m68k/translate.c    | 33 +++++++++++++-------------
 4 files changed, 52 insertions(+), 43 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 0a6b4146f635..f016c4c1c226 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -1,12 +1,12 @@
 DEF_HELPER_1(bitrev, i32, i32)
 DEF_HELPER_1(ff1, i32, i32)
 DEF_HELPER_FLAGS_2(sats, TCG_CALL_NO_RWG_SE, i32, i32, i32)
-DEF_HELPER_3(divuw, void, env, int, i32)
-DEF_HELPER_3(divsw, void, env, int, s32)
-DEF_HELPER_4(divul, void, env, int, int, i32)
-DEF_HELPER_4(divsl, void, env, int, int, s32)
-DEF_HELPER_4(divull, void, env, int, int, i32)
-DEF_HELPER_4(divsll, void, env, int, int, s32)
+DEF_HELPER_4(divuw, void, env, int, i32, int)
+DEF_HELPER_4(divsw, void, env, int, s32, int)
+DEF_HELPER_5(divul, void, env, int, int, i32, int)
+DEF_HELPER_5(divsl, void, env, int, int, s32, int)
+DEF_HELPER_5(divull, void, env, int, int, i32, int)
+DEF_HELPER_5(divsll, void, env, int, int, s32, int)
 DEF_HELPER_2(set_sr, void, env, i32)
 DEF_HELPER_3(cf_movec_to, void, env, i32, i32)
 DEF_HELPER_3(m68k_movec_to, void, env, i32, i32)
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index e24d17e180e3..6598bce3c4e7 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -50,7 +50,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
-            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->mmu.ar);
             break;
         case EXCP_TRAP0:
             {
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 750d65576fcf..729ee0e93482 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -396,7 +396,6 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ILLEGAL:
-    case EXCP_DIV0:
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
@@ -404,6 +403,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_CHK:
+    case EXCP_DIV0:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
@@ -574,18 +574,19 @@ raise_exception_format2(CPUM68KState *env, int tt, int ilen, uintptr_t raddr)
     cpu_loop_exit(cs);
 }
 
-void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den)
+void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den, int ilen)
 {
     uint32_t num = env->dregs[destr];
     uint32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot > 0xffff) {
         env->cc_v = -1;
         /*
@@ -601,18 +602,19 @@ void HELPER(divuw)(CPUM68KState *env, int destr, uint32_t den)
     env->cc_v = 0;
 }
 
-void HELPER(divsw)(CPUM68KState *env, int destr, int32_t den)
+void HELPER(divsw)(CPUM68KState *env, int destr, int32_t den, int ilen)
 {
     int32_t num = env->dregs[destr];
     uint32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot != (int16_t)quot) {
         env->cc_v = -1;
         /* nothing else is modified */
@@ -629,18 +631,20 @@ void HELPER(divsw)(CPUM68KState *env, int destr, int32_t den)
     env->cc_v = 0;
 }
 
-void HELPER(divul)(CPUM68KState *env, int numr, int regr, uint32_t den)
+void HELPER(divul)(CPUM68KState *env, int numr, int regr,
+                   uint32_t den, int ilen)
 {
     uint32_t num = env->dregs[numr];
     uint32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0;
     env->cc_z = quot;
     env->cc_n = quot;
     env->cc_v = 0;
@@ -657,18 +661,20 @@ void HELPER(divul)(CPUM68KState *env, int numr, int regr, uint32_t den)
     }
 }
 
-void HELPER(divsl)(CPUM68KState *env, int numr, int regr, int32_t den)
+void HELPER(divsl)(CPUM68KState *env, int numr, int regr,
+                   int32_t den, int ilen)
 {
     int32_t num = env->dregs[numr];
     int32_t quot, rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0;
     env->cc_z = quot;
     env->cc_n = quot;
     env->cc_v = 0;
@@ -685,19 +691,21 @@ void HELPER(divsl)(CPUM68KState *env, int numr, int regr, int32_t den)
     }
 }
 
-void HELPER(divull)(CPUM68KState *env, int numr, int regr, uint32_t den)
+void HELPER(divull)(CPUM68KState *env, int numr, int regr,
+                    uint32_t den, int ilen)
 {
     uint64_t num = deposit64(env->dregs[numr], 32, 32, env->dregs[regr]);
     uint64_t quot;
     uint32_t rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot > 0xffffffffULL) {
         env->cc_v = -1;
         /*
@@ -720,19 +728,21 @@ void HELPER(divull)(CPUM68KState *env, int numr, int regr, uint32_t den)
     env->dregs[numr] = quot;
 }
 
-void HELPER(divsll)(CPUM68KState *env, int numr, int regr, int32_t den)
+void HELPER(divsll)(CPUM68KState *env, int numr, int regr,
+                    int32_t den, int ilen)
 {
     int64_t num = deposit64(env->dregs[numr], 32, 32, env->dregs[regr]);
     int64_t quot;
     int32_t rem;
 
+    env->cc_c = 0; /* always cleared, even if overflow/div0 */
+
     if (den == 0) {
-        raise_exception_ra(env, EXCP_DIV0, GETPC());
+        raise_exception_format2(env, EXCP_DIV0, ilen, GETPC());
     }
     quot = num / den;
     rem = num % den;
 
-    env->cc_c = 0; /* always cleared, even if overflow */
     if (quot != (int32_t)quot) {
         env->cc_v = -1;
         /*
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 22e5379d3c64..6075f4993031 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1601,6 +1601,7 @@ DISAS_INSN(divw)
     int sign;
     TCGv src;
     TCGv destr;
+    TCGv ilen;
 
     /* divX.w <EA>,Dn    32/16 -> 16r:16q */
 
@@ -1609,20 +1610,20 @@ DISAS_INSN(divw)
     /* dest.l / src.w */
 
     SRC_EA(env, src, OS_WORD, sign, NULL);
-    destr = tcg_const_i32(REG(insn, 9));
+    destr = tcg_constant_i32(REG(insn, 9));
+    ilen = tcg_constant_i32(s->pc - s->base.pc_next);
     if (sign) {
-        gen_helper_divsw(cpu_env, destr, src);
+        gen_helper_divsw(cpu_env, destr, src, ilen);
     } else {
-        gen_helper_divuw(cpu_env, destr, src);
+        gen_helper_divuw(cpu_env, destr, src, ilen);
     }
-    tcg_temp_free(destr);
 
     set_cc_op(s, CC_OP_FLAGS);
 }
 
 DISAS_INSN(divl)
 {
-    TCGv num, reg, den;
+    TCGv num, reg, den, ilen;
     int sign;
     uint16_t ext;
 
@@ -1639,15 +1640,14 @@ DISAS_INSN(divl)
         /* divX.l <EA>, Dr:Dq    64/32 -> 32r:32q */
 
         SRC_EA(env, den, OS_LONG, 0, NULL);
-        num = tcg_const_i32(REG(ext, 12));
-        reg = tcg_const_i32(REG(ext, 0));
+        num = tcg_constant_i32(REG(ext, 12));
+        reg = tcg_constant_i32(REG(ext, 0));
+        ilen = tcg_constant_i32(s->pc - s->base.pc_next);
         if (sign) {
-            gen_helper_divsll(cpu_env, num, reg, den);
+            gen_helper_divsll(cpu_env, num, reg, den, ilen);
         } else {
-            gen_helper_divull(cpu_env, num, reg, den);
+            gen_helper_divull(cpu_env, num, reg, den, ilen);
         }
-        tcg_temp_free(reg);
-        tcg_temp_free(num);
         set_cc_op(s, CC_OP_FLAGS);
         return;
     }
@@ -1656,15 +1656,14 @@ DISAS_INSN(divl)
     /* divXl.l <EA>, Dr:Dq    32/32 -> 32r:32q */
 
     SRC_EA(env, den, OS_LONG, 0, NULL);
-    num = tcg_const_i32(REG(ext, 12));
-    reg = tcg_const_i32(REG(ext, 0));
+    num = tcg_constant_i32(REG(ext, 12));
+    reg = tcg_constant_i32(REG(ext, 0));
+    ilen = tcg_constant_i32(s->pc - s->base.pc_next);
     if (sign) {
-        gen_helper_divsl(cpu_env, num, reg, den);
+        gen_helper_divsl(cpu_env, num, reg, den, ilen);
     } else {
-        gen_helper_divul(cpu_env, num, reg, den);
+        gen_helper_divul(cpu_env, num, reg, den, ilen);
     }
-    tcg_temp_free(reg);
-    tcg_temp_free(num);
 
     set_cc_op(s, CC_OP_FLAGS);
 }
-- 
2.36.1


