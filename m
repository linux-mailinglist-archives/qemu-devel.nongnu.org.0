Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4676AED6C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe5-000389-ID; Tue, 07 Mar 2023 13:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdv-0001of-Gx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:31 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbds-00015U-M6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:31 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso17372944pjb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IZqOAB+dylMELeLmI3rOA+FsYfFnD2nHqP4HMKSI6U=;
 b=aIrjzOiRAtFhUjvleW9PQMkkhI8/zpeI/74hFwr/Q1blP7f56JnoOKmtRThMXPJhIv
 /x3sz6ayQ7qE+BGyzGlyaROuGFzHkPBG3bglOm8PDr7niy7LepgPMUszMsT/+YuD6H2w
 tHV6pm2iOkGIy6dB8/T82erx/BampZDATQDeWopZYO0P2Yu4dXJlU+v9d1JSSscjeEFG
 FBgeKFB06rlRoasRJkVuZnKAHGHeAoAxKJGh2dDX8tXiLCe/rVdIDzOzb6rd/PVU2PuW
 v08bseyL16RxlB/j9N3Tf3e5W+nIK4Jc0iZ6xBEcOpj+IYwbDvQIApZiJctaSL2IF1nj
 ydjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IZqOAB+dylMELeLmI3rOA+FsYfFnD2nHqP4HMKSI6U=;
 b=RkIBjEd+zBal+gk6RghBp711brFF+/ZbuR7ViLjKXYGOFbT3ZtKomSoDZAhdYbjnnX
 IitNglCxslBUCLap8lRPgmroGOg0ESi+uR7AgDp6v+8THslrse449xP36cMe6Ov+Lt22
 +9Il6n54Z1YPPdM1gPUNCBS682VnYpBSUwyYxqfJO1i6hn6ElHAdX2owSEcLpxMRzT6W
 r83i4JGLlm2oyo1rHMv1gT9L6XlynSWl9/ycT0H7xSr4z8SeJHKkVcXr6CN2K4h+SSML
 G8Qfmc8iDGYfcn/lh2CYkSNhy8H219MjFXKn+xBeU5GvcNtv08EW9Hq0RlFQXNgN03xW
 Fqyg==
X-Gm-Message-State: AO0yUKWtksmYywU98nJvLDZz0Aj1mPNJx26eHSnxnpac9xjY1Bq0BFm5
 fc+YFAYB7pG06Dmc/1AHP82ZB7B/ws30UILj4Ek=
X-Google-Smtp-Source: AK7set8/3t+3+skvTpEJUm3IcD9h4rV1ZRhzzDHH72wmuvLipmfX2sfL9exKtMaJfrKq5vpFBdkxxA==
X-Received: by 2002:a05:6a20:a01a:b0:cc:7967:8a75 with SMTP id
 p26-20020a056a20a01a00b000cc79678a75mr14345336pzj.46.1678212147187; 
 Tue, 07 Mar 2023 10:02:27 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 47/67] target/m68k: Avoid tcg_const_* throughout
Date: Tue,  7 Mar 2023 09:58:28 -0800
Message-Id: <20230307175848.2508955-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 158 ++++++++++++++++++++--------------------
 1 file changed, 77 insertions(+), 81 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index e78722fba8..44c3ac0bc3 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -264,10 +264,7 @@ static void gen_jmp(DisasContext *s, TCGv dest)
 
 static void gen_raise_exception(int nr)
 {
-    TCGv_i32 tmp;
-
-    tmp = tcg_const_i32(nr);
-    gen_helper_raise_exception(cpu_env, tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(nr));
 }
 
 static void gen_raise_exception_format2(DisasContext *s, int nr,
@@ -471,7 +468,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         if ((ext & 0x80) == 0) {
             /* base not suppressed */
             if (IS_NULL_QREG(base)) {
-                base = tcg_const_i32(offset + bd);
+                base = tcg_constant_i32(offset + bd);
                 bd = 0;
             }
             if (!IS_NULL_QREG(add)) {
@@ -487,7 +484,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
                 add = tmp;
             }
         } else {
-            add = tcg_const_i32(bd);
+            add = tcg_constant_i32(bd);
         }
         if ((ext & 3) != 0) {
             /* memory indirect */
@@ -623,8 +620,7 @@ static void gen_flush_flags(DisasContext *s)
         break;
 
     default:
-        t0 = tcg_const_i32(s->cc_op);
-        gen_helper_flush_flags(cpu_env, t0);
+        gen_helper_flush_flags(cpu_env, tcg_constant_i32(s->cc_op));
         s->cc_op_synced = 1;
         break;
     }
@@ -785,14 +781,14 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
         switch (reg0) {
         case 0: /* Absolute short.  */
             offset = (int16_t)read_im16(env, s);
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         case 1: /* Absolute long.  */
             offset = read_im32(env, s);
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         case 2: /* pc displacement  */
             offset = s->pc;
             offset += (int16_t)read_im16(env, s);
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         case 3: /* pc index+displacement.  */
             return gen_lea_indexed(env, s, NULL_QREG);
         case 4: /* Immediate.  */
@@ -1167,23 +1163,23 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
             }
             switch (opsize) {
             case OS_BYTE:
-                tmp = tcg_const_i32((int8_t)read_im8(env, s));
+                tmp = tcg_constant_i32((int8_t)read_im8(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
                 break;
             case OS_WORD:
-                tmp = tcg_const_i32((int16_t)read_im16(env, s));
+                tmp = tcg_constant_i32((int16_t)read_im16(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
                 break;
             case OS_LONG:
-                tmp = tcg_const_i32(read_im32(env, s));
+                tmp = tcg_constant_i32(read_im32(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
                 break;
             case OS_SINGLE:
-                tmp = tcg_const_i32(read_im32(env, s));
+                tmp = tcg_constant_i32(read_im32(env, s));
                 gen_helper_extf32(cpu_env, fp, tmp);
                 break;
             case OS_DOUBLE:
-                t64 = tcg_const_i64(read_im64(env, s));
+                t64 = tcg_constant_i64(read_im64(env, s));
                 gen_helper_extf64(cpu_env, fp, t64);
                 break;
             case OS_EXTENDED:
@@ -1191,9 +1187,9 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
                     gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
                     break;
                 }
-                tmp = tcg_const_i32(read_im32(env, s) >> 16);
+                tmp = tcg_constant_i32(read_im32(env, s) >> 16);
                 tcg_gen_st16_i32(tmp, fp, offsetof(FPReg, l.upper));
-                t64 = tcg_const_i64(read_im64(env, s));
+                t64 = tcg_constant_i64(read_im64(env, s));
                 tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
                 break;
             case OS_PACKED:
@@ -1253,7 +1249,7 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
             goto done;
         case 10: /* PL */
         case 11: /* MI */
-            c->v2 = tcg_const_i32(0);
+            c->v2 = tcg_constant_i32(0);
             c->v1 = tmp = tcg_temp_new();
             tcg_gen_sub_i32(tmp, QREG_CC_N, QREG_CC_V);
             gen_ext(tmp, tmp, op - CC_OP_CMPB, 1);
@@ -1269,7 +1265,7 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
         }
     }
 
-    c->v2 = tcg_const_i32(0);
+    c->v2 = tcg_constant_i32(0);
 
     switch (cond) {
     case 0: /* T */
@@ -2000,7 +1996,7 @@ DISAS_INSN(movem)
 
     addr = tcg_temp_new();
     tcg_gen_mov_i32(addr, tmp);
-    incr = tcg_const_i32(opsize_bytes(opsize));
+    incr = tcg_constant_i32(opsize_bytes(opsize));
 
     if (is_load) {
         /* memory to register */
@@ -2236,13 +2232,13 @@ DISAS_INSN(arith_im)
     opsize = insn_opsize(insn);
     switch (opsize) {
     case OS_BYTE:
-        im = tcg_const_i32((int8_t)read_im8(env, s));
+        im = tcg_constant_i32((int8_t)read_im8(env, s));
         break;
     case OS_WORD:
-        im = tcg_const_i32((int16_t)read_im16(env, s));
+        im = tcg_constant_i32((int16_t)read_im16(env, s));
         break;
     case OS_LONG:
-        im = tcg_const_i32(read_im32(env, s));
+        im = tcg_constant_i32(read_im32(env, s));
         break;
     default:
         g_assert_not_reached();
@@ -2394,7 +2390,6 @@ DISAS_INSN(cas2w)
 {
     uint16_t ext1, ext2;
     TCGv addr1, addr2;
-    TCGv regs;
 
     /* cas2 Dc1:Dc2,Du1:Du2,(Rn1):(Rn2) */
 
@@ -2426,13 +2421,13 @@ DISAS_INSN(cas2w)
      *     Dc2 = (R2)
      */
 
-    regs = tcg_const_i32(REG(ext2, 6) |
-                         (REG(ext1, 6) << 3) |
-                         (REG(ext2, 0) << 6) |
-                         (REG(ext1, 0) << 9));
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_exit_atomic(cpu_env);
     } else {
+        TCGv regs = tcg_constant_i32(REG(ext2, 6) |
+                                     (REG(ext1, 6) << 3) |
+                                     (REG(ext2, 0) << 6) |
+                                     (REG(ext1, 0) << 9));
         gen_helper_cas2w(cpu_env, regs, addr1, addr2);
     }
 
@@ -2476,10 +2471,10 @@ DISAS_INSN(cas2l)
      *     Dc2 = (R2)
      */
 
-    regs = tcg_const_i32(REG(ext2, 6) |
-                         (REG(ext1, 6) << 3) |
-                         (REG(ext2, 0) << 6) |
-                         (REG(ext1, 0) << 9));
+    regs = tcg_constant_i32(REG(ext2, 6) |
+                            (REG(ext1, 6) << 3) |
+                            (REG(ext2, 0) << 6) |
+                            (REG(ext1, 0) << 9));
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_cas2l_parallel(cpu_env, regs, addr1, addr2);
     } else {
@@ -2553,7 +2548,7 @@ DISAS_INSN(negx)
      * (X, N) =  -(src + X);
      */
 
-    z = tcg_const_i32(0);
+    z = tcg_constant_i32(0);
     tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, src, z, QREG_CC_X, z);
     tcg_gen_sub2_i32(QREG_CC_N, QREG_CC_X, z, z, QREG_CC_N, QREG_CC_X);
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
@@ -2598,8 +2593,7 @@ DISAS_INSN(clr)
     int opsize;
     TCGv zero;
 
-    zero = tcg_const_i32(0);
-
+    zero = tcg_constant_i32(0);
     opsize = insn_opsize(insn);
     DEST_EA(env, insn, opsize, zero, NULL);
     gen_logic_cc(s, zero, opsize);
@@ -2935,7 +2929,7 @@ DISAS_INSN(jump)
     }
     if ((insn & 0x40) == 0) {
         /* jsr */
-        gen_push(s, tcg_const_i32(s->pc));
+        gen_push(s, tcg_constant_i32(s->pc));
     }
     gen_jmp(s, tmp);
 }
@@ -2960,7 +2954,7 @@ DISAS_INSN(addsubq)
     if (imm == 0) {
         imm = 8;
     }
-    val = tcg_const_i32(imm);
+    val = tcg_constant_i32(imm);
     dest = tcg_temp_new();
     tcg_gen_mov_i32(dest, src);
     if ((insn & 0x38) == 0x08) {
@@ -3004,7 +2998,7 @@ DISAS_INSN(branch)
     }
     if (op == 1) {
         /* bsr */
-        gen_push(s, tcg_const_i32(s->pc));
+        gen_push(s, tcg_constant_i32(s->pc));
     }
     if (op > 1) {
         /* Bcc */
@@ -3153,9 +3147,10 @@ DISAS_INSN(mov3q)
     int val;
 
     val = (insn >> 9) & 7;
-    if (val == 0)
+    if (val == 0) {
         val = -1;
-    src = tcg_const_i32(val);
+    }
+    src = tcg_constant_i32(val);
     gen_logic_cc(s, src, OS_LONG);
     DEST_EA(env, insn, OS_LONG, src, NULL);
 }
@@ -3433,7 +3428,7 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
             tcg_gen_extr_i64_i32(QREG_CC_N, QREG_CC_C, t64);
             /* Note that C=0 if shift count is 0, and we get that for free.  */
         } else {
-            TCGv zero = tcg_const_i32(0);
+            TCGv zero = tcg_constant_i32(0);
             tcg_gen_extrl_i64_i32(QREG_CC_N, t64);
             tcg_gen_shri_i32(QREG_CC_C, QREG_CC_N, bits);
             tcg_gen_movcond_i32(TCG_COND_EQ, QREG_CC_C,
@@ -3455,7 +3450,7 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
          *     V = ((s ^ t) & (-1 << (bits - 1))) != 0
          */
         if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
-            TCGv_i64 tt = tcg_const_i64(32);
+            TCGv_i64 tt = tcg_constant_i64(32);
             /* if shift is greater than 32, use 32 */
             tcg_gen_movcond_i64(TCG_COND_GT, s64, s64, tt, tt, s64);
             /* Sign extend the input to 64 bits; re-do the shift.  */
@@ -3636,7 +3631,7 @@ static TCGv rotate_x(TCGv reg, TCGv shift, int left, int size)
 {
     TCGv X, shl, shr, shx, sz, zero;
 
-    sz = tcg_const_i32(size);
+    sz = tcg_constant_i32(size);
 
     shr = tcg_temp_new();
     shl = tcg_temp_new();
@@ -3647,7 +3642,7 @@ static TCGv rotate_x(TCGv reg, TCGv shift, int left, int size)
         tcg_gen_sub_i32(shr, shr, shift); /* shr = size + 1 - shift */
         tcg_gen_subi_i32(shx, shift, 1);  /* shx = shift - 1 */
         /* shx = shx < 0 ? size : shx; */
-        zero = tcg_const_i32(0);
+        zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_LT, shx, shx, zero, sz, shx);
     } else {
         tcg_gen_mov_i32(shr, shift);      /* shr = shift */
@@ -3726,7 +3721,7 @@ static TCGv rotate32_x(TCGv reg, TCGv shift, int left)
 
     /* if shift == 0, register and X are not affected */
 
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     tcg_gen_movcond_i32(TCG_COND_EQ, X, shift, zero, QREG_CC_X, X);
     tcg_gen_movcond_i32(TCG_COND_EQ, reg, shift, zero, reg, lo);
 
@@ -3744,7 +3739,7 @@ DISAS_INSN(rotate_im)
         tmp = 8;
     }
 
-    shift = tcg_const_i32(tmp);
+    shift = tcg_constant_i32(tmp);
     if (insn & 8) {
         rotate(DREG(insn, 0), shift, left, 32);
     } else {
@@ -3769,7 +3764,7 @@ DISAS_INSN(rotate8_im)
         tmp = 8;
     }
 
-    shift = tcg_const_i32(tmp);
+    shift = tcg_constant_i32(tmp);
     if (insn & 8) {
         rotate(reg, shift, left, 8);
     } else {
@@ -3793,7 +3788,7 @@ DISAS_INSN(rotate16_im)
         tmp = 8;
     }
 
-    shift = tcg_const_i32(tmp);
+    shift = tcg_constant_i32(tmp);
     if (insn & 8) {
         rotate(reg, shift, left, 16);
     } else {
@@ -3908,7 +3903,7 @@ DISAS_INSN(rotate_mem)
 
     SRC_EA(env, src, OS_WORD, 0, &addr);
 
-    shift = tcg_const_i32(1);
+    shift = tcg_constant_i32(1);
     if (insn & 0x0200) {
         rotate(src, shift, left, 16);
     } else {
@@ -4002,12 +3997,12 @@ DISAS_INSN(bfext_mem)
     if (ext & 0x20) {
         len = DREG(ext, 0);
     } else {
-        len = tcg_const_i32(extract32(ext, 0, 5));
+        len = tcg_constant_i32(extract32(ext, 0, 5));
     }
     if (ext & 0x800) {
         ofs = DREG(ext, 6);
     } else {
-        ofs = tcg_const_i32(extract32(ext, 6, 5));
+        ofs = tcg_constant_i32(extract32(ext, 6, 5));
     }
 
     if (is_sign) {
@@ -4123,12 +4118,12 @@ DISAS_INSN(bfop_mem)
     if (ext & 0x20) {
         len = DREG(ext, 0);
     } else {
-        len = tcg_const_i32(extract32(ext, 0, 5));
+        len = tcg_constant_i32(extract32(ext, 0, 5));
     }
     if (ext & 0x800) {
         ofs = DREG(ext, 6);
     } else {
-        ofs = tcg_const_i32(extract32(ext, 6, 5));
+        ofs = tcg_constant_i32(extract32(ext, 6, 5));
     }
 
     switch (insn & 0x0f00) {
@@ -4240,12 +4235,12 @@ DISAS_INSN(bfins_mem)
     if (ext & 0x20) {
         len = DREG(ext, 0);
     } else {
-        len = tcg_const_i32(extract32(ext, 0, 5));
+        len = tcg_constant_i32(extract32(ext, 0, 5));
     }
     if (ext & 0x800) {
         ofs = DREG(ext, 6);
     } else {
-        ofs = tcg_const_i32(extract32(ext, 6, 5));
+        ofs = tcg_constant_i32(extract32(ext, 6, 5));
     }
 
     gen_helper_bfins_mem(QREG_CC_N, cpu_env, addr, src, ofs, len);
@@ -4378,7 +4373,7 @@ DISAS_INSN(move16_mem)
     TCGv reg, addr;
 
     reg = AREG(insn, 0);
-    addr = tcg_const_i32(read_im32(env, s));
+    addr = tcg_constant_i32(read_im32(env, s));
 
     if ((insn >> 3) & 1) {
         /* MOVE16 (xxx).L, (Ay) */
@@ -4568,14 +4563,14 @@ DISAS_INSN(cf_movec)
     } else {
         reg = DREG(ext, 12);
     }
-    gen_helper_cf_movec_to(cpu_env, tcg_const_i32(ext & 0xfff), reg);
+    gen_helper_cf_movec_to(cpu_env, tcg_constant_i32(ext & 0xfff), reg);
     gen_exit_tb(s);
 }
 
 DISAS_INSN(m68k_movec)
 {
     uint16_t ext;
-    TCGv reg;
+    TCGv reg, creg;
 
     if (IS_USER(s)) {
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
@@ -4589,10 +4584,11 @@ DISAS_INSN(m68k_movec)
     } else {
         reg = DREG(ext, 12);
     }
+    creg = tcg_constant_i32(ext & 0xfff);
     if (insn & 1) {
-        gen_helper_m68k_movec_to(cpu_env, tcg_const_i32(ext & 0xfff), reg);
+        gen_helper_m68k_movec_to(cpu_env, creg, reg);
     } else {
-        gen_helper_m68k_movec_from(reg, cpu_env, tcg_const_i32(ext & 0xfff));
+        gen_helper_m68k_movec_from(reg, cpu_env, creg);
     }
     gen_exit_tb(s);
 }
@@ -4643,7 +4639,7 @@ DISAS_INSN(pflush)
         return;
     }
 
-    opmode = tcg_const_i32((insn >> 3) & 3);
+    opmode = tcg_constant_i32((insn >> 3) & 3);
     gen_helper_pflush(cpu_env, AREG(insn, 0), opmode);
 }
 
@@ -4655,7 +4651,7 @@ DISAS_INSN(ptest)
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
         return;
     }
-    is_read = tcg_const_i32((insn >> 5) & 1);
+    is_read = tcg_constant_i32((insn >> 5) & 1);
     gen_helper_ptest(cpu_env, AREG(insn, 0), is_read);
 }
 #endif
@@ -4825,7 +4821,7 @@ static void gen_op_fmove_fcr(CPUM68KState *env, DisasContext *s,
                 gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
                 return;
             }
-            tmp = tcg_const_i32(read_im32(env, s));
+            tmp = tcg_constant_i32(read_im32(env, s));
             gen_store_fcr(s, tmp, mask);
             return;
         }
@@ -4962,7 +4958,7 @@ DISAS_INSN(fpu)
     case 2:
         if (insn == 0xf200 && (ext & 0xfc00) == 0x5c00) {
             /* fmovecr */
-            TCGv rom_offset = tcg_const_i32(opmode);
+            TCGv rom_offset = tcg_constant_i32(opmode);
             cpu_dest = gen_fp_ptr(REG(ext, 7));
             gen_helper_fconst(cpu_env, cpu_dest, rom_offset);
             return;
@@ -5186,7 +5182,7 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
 {
     TCGv fpsr;
 
-    c->v2 = tcg_const_i32(0);
+    c->v2 = tcg_constant_i32(0);
     /* TODO: Raise BSUN exception.  */
     fpsr = tcg_temp_new();
     gen_load_fcr(s, fpsr, M68K_FPSR);
@@ -5406,7 +5402,7 @@ DISAS_INSN(fsave)
 
     if (m68k_feature(s->env, M68K_FEATURE_M68040)) {
         /* always write IDLE */
-        TCGv idle = tcg_const_i32(0x41000000);
+        TCGv idle = tcg_constant_i32(0x41000000);
         DEST_EA(env, insn, OS_LONG, idle, NULL);
     } else {
         disas_undef(env, s, insn);
@@ -5536,7 +5532,7 @@ DISAS_INSN(mac)
         /* Skip the accumulate if the value is already saturated.  */
         l1 = gen_new_label();
         tmp = tcg_temp_new();
-        gen_op_and32(tmp, QREG_MACSR, tcg_const_i32(MACSR_PAV0 << acc));
+        gen_op_and32(tmp, QREG_MACSR, tcg_constant_i32(MACSR_PAV0 << acc));
         gen_op_jmp_nz32(tmp, l1);
     }
 #endif
@@ -5547,11 +5543,11 @@ DISAS_INSN(mac)
         tcg_gen_add_i64(MACREG(acc), MACREG(acc), s->mactmp);
 
     if (s->env->macsr & MACSR_FI)
-        gen_helper_macsatf(cpu_env, tcg_const_i32(acc));
+        gen_helper_macsatf(cpu_env, tcg_constant_i32(acc));
     else if (s->env->macsr & MACSR_SU)
-        gen_helper_macsats(cpu_env, tcg_const_i32(acc));
+        gen_helper_macsats(cpu_env, tcg_constant_i32(acc));
     else
-        gen_helper_macsatu(cpu_env, tcg_const_i32(acc));
+        gen_helper_macsatu(cpu_env, tcg_constant_i32(acc));
 
 #if 0
     /* Disabled because conditional branches clobber temporary vars.  */
@@ -5570,7 +5566,7 @@ DISAS_INSN(mac)
             /* Skip the accumulate if the value is already saturated.  */
             l1 = gen_new_label();
             tmp = tcg_temp_new();
-            gen_op_and32(tmp, QREG_MACSR, tcg_const_i32(MACSR_PAV0 << acc));
+            gen_op_and32(tmp, QREG_MACSR, tcg_constant_i32(MACSR_PAV0 << acc));
             gen_op_jmp_nz32(tmp, l1);
         }
 #endif
@@ -5579,18 +5575,18 @@ DISAS_INSN(mac)
         else
             tcg_gen_add_i64(MACREG(acc), MACREG(acc), s->mactmp);
         if (s->env->macsr & MACSR_FI)
-            gen_helper_macsatf(cpu_env, tcg_const_i32(acc));
+            gen_helper_macsatf(cpu_env, tcg_constant_i32(acc));
         else if (s->env->macsr & MACSR_SU)
-            gen_helper_macsats(cpu_env, tcg_const_i32(acc));
+            gen_helper_macsats(cpu_env, tcg_constant_i32(acc));
         else
-            gen_helper_macsatu(cpu_env, tcg_const_i32(acc));
+            gen_helper_macsatu(cpu_env, tcg_constant_i32(acc));
 #if 0
         /* Disabled because conditional branches clobber temporary vars.  */
         if (l1 != -1)
             gen_set_label(l1);
 #endif
     }
-    gen_helper_mac_set_flags(cpu_env, tcg_const_i32(acc));
+    gen_helper_mac_set_flags(cpu_env, tcg_constant_i32(acc));
 
     if (insn & 0x30) {
         TCGv rw;
@@ -5640,8 +5636,8 @@ DISAS_INSN(move_mac)
     int src;
     TCGv dest;
     src = insn & 3;
-    dest = tcg_const_i32((insn >> 9) & 3);
-    gen_helper_mac_move(cpu_env, dest, tcg_const_i32(src));
+    dest = tcg_constant_i32((insn >> 9) & 3);
+    gen_helper_mac_move(cpu_env, dest, tcg_constant_i32(src));
     gen_mac_clear_flags();
     gen_helper_mac_set_flags(cpu_env, dest);
 }
@@ -5666,7 +5662,7 @@ DISAS_INSN(from_mext)
     TCGv reg;
     TCGv acc;
     reg = (insn & 8) ? AREG(insn, 0) : DREG(insn, 0);
-    acc = tcg_const_i32((insn & 0x400) ? 2 : 0);
+    acc = tcg_constant_i32((insn & 0x400) ? 2 : 0);
     if (s->env->macsr & MACSR_FI)
         gen_helper_get_mac_extf(reg, cpu_env, acc);
     else
@@ -5701,7 +5697,7 @@ DISAS_INSN(to_mac)
     }
     tcg_gen_andi_i32(QREG_MACSR, QREG_MACSR, ~(MACSR_PAV0 << accnum));
     gen_mac_clear_flags();
-    gen_helper_mac_set_flags(cpu_env, tcg_const_i32(accnum));
+    gen_helper_mac_set_flags(cpu_env, tcg_constant_i32(accnum));
 }
 
 DISAS_INSN(to_macsr)
@@ -5724,7 +5720,7 @@ DISAS_INSN(to_mext)
     TCGv val;
     TCGv acc;
     SRC_EA(env, val, OS_LONG, 0, NULL);
-    acc = tcg_const_i32((insn & 0x400) ? 2 : 0);
+    acc = tcg_constant_i32((insn & 0x400) ? 2 : 0);
     if (s->env->macsr & MACSR_FI)
         gen_helper_set_mac_extf(cpu_env, val, acc);
     else if (s->env->macsr & MACSR_SU)
-- 
2.34.1


