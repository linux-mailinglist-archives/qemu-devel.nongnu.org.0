Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B974DAA53
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:07:31 +0100 (CET)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMok-0008C1-Pc
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:07:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgO-0002N8-KJ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:52 -0400
Received: from [2607:f8b0:4864:20::62c] (port=45679
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgM-0006SP-AE
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q13so940508plk.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+Ui1nFEQRWCS519gjSUkcR7xJHKhZOfVglJBSDXN2c=;
 b=NK9cHmOneaCIefuCA89+m4bmxBtIqnGNYKfvET4Vbfuv84gabAxXmaLD50hL2KM2YV
 9zLTSc9UKhHz1j6AcinMElz5cAY/aAxyW6fFjO/TL47PPNW5SJAAKPO1r9wcpPpg1xWt
 ouNrg8hNy8qzh3qmokyyMrDJBDgRejT3pjVf1gbeHNrSxYhUdrJfIrcbbIC8tVDxQQuY
 5y0U+wdD06QTvbtWX0/jP3gC4uJwOMriV81svEEsn4EMurc32oXbPRmf9v1hVfp87T6v
 VRD1Ybt3TjQTSiPyFvoscvtPS2+OwAuU7IqAzATIdO8KNA5l8AkTkTthMlD9l4535cEn
 CwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b+Ui1nFEQRWCS519gjSUkcR7xJHKhZOfVglJBSDXN2c=;
 b=C2k2cEX3LqdcQU33nd1YhsKmBUL5g7JIVCiK1ELK+KzqjqlNbGY96jjEpglReZtAzE
 QlzSlxU9X+uvTG2WWOJRyb3DnPAGki0mvujMknoOaKPwqJ9xpo7gqOInNrwtL0Bn7NeE
 PKQURQ7Fvy7AWDWKNGVBTywW6lq4i6mxbuAvQBt561ESJnbyS78RmAe82dHBJ+1kOVXX
 ZXdg5Ytg9bRqJy2IIeZx+QZgxQE/mDsJfjcwBI5J9bEOeYE4dBbHWh9rYGEs05KVF5jq
 cZh1wDcmaVYkQrn15Aw0m4UNlZ/DzWaeAbHxSH9Ei59SRjOgAFWMaA/izM/g8dQdO67F
 35cg==
X-Gm-Message-State: AOAM531AxqG5+HXWe3FrxQwsfDA7Ds/bELWtYLB74R2g1b2DuQbialVm
 Yaecwgv+ePDQ5BpPNW6FY4na+ivSUorD9g==
X-Google-Smtp-Source: ABdhPJxL6LT55+d2RTP6n39mUhusNASDYr1C9Fjx1XqvSBIuwhIuJasRbUQtjTY+OFIRLY5BDIXxKg==
X-Received: by 2002:a17:902:e891:b0:152:c3a:a601 with SMTP id
 w17-20020a170902e89100b001520c3aa601mr31439983plg.170.1647410328853; 
 Tue, 15 Mar 2022 22:58:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/17] target/m68k: Fix pc, c flag,
 and address argument for EXCP_DIV0
Date: Tue, 15 Mar 2022 22:58:30 -0700
Message-Id: <20220316055840.727571-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 target/m68k/helper.h       | 12 +++++-----
 linux-user/m68k/cpu_loop.c |  2 +-
 target/m68k/op_helper.c    | 48 +++++++++++++++++++++++---------------
 target/m68k/translate.c    | 33 +++++++++++++-------------
 4 files changed, 52 insertions(+), 43 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 0a6b4146f6..f016c4c1c2 100644
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
index e6b06841aa..bb7ec09fb3 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -52,7 +52,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
-            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->mmu.ar);
             break;
         case EXCP_TRAP0:
             {
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 0411e2208a..568292e037 100644
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
index af3febdd48..ae9f5a5222 100644
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
2.25.1


