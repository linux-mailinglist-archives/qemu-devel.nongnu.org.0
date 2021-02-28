Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D02327543
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:38:16 +0100 (CET)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVdg-0004cG-0G
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPp-0005Z3-Ok
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:57 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPZ-0007ir-0q
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:57 -0500
Received: by mail-pj1-x102d.google.com with SMTP id u12so10241318pjr.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sMrPCvBvZcRNI0f+4NGvi10dnGYsatk73CQtS7iOqk=;
 b=XviND/LmawhHzDOwdpfeeRqtWUdkMKvIRPzJqSSovblGu50Vzhz4TCToSwuLGapPmj
 hazn1ycqqVY/3+WluzsgajCZKQuZLdIyXwXgNMiKR/mLZBWGngmEk58tp1iT5IXq4o/9
 p3UPrpYkfZSmy2z8AUwWqpQkwWX1qBSdaG4gdQSImhIiqTTCC98zhx14cuLhO5W+F0jc
 8lfLsWBzXFAsH/k7oyc866++pGl2/suRmkQ2dXItVyG4WNX9LeLw1OpIYScfdrZBlGGn
 74scrtcPglEWHdUAFactSfw9+qVc2s4F188hxwf3jfcMUV2FdgqbzyBCB5Pv1XYzdjy2
 6JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sMrPCvBvZcRNI0f+4NGvi10dnGYsatk73CQtS7iOqk=;
 b=baCzIsBxmVWJQUvxsW8nnz61W8v8b8vNyUT/Y4eDgVzuCUNZKKebvlADw3hysvWqKh
 shB6eB6Im3An3BBQiDFFSal3+EFm0ugNuOfgbbfPA0ofgKeiANeyvMnbUgB8AJmWax8V
 aUFqZyg3kpafCzi21DRNcFiqc05EcVsbYeBycvzo3Tci2Mx6QcIhG322I+KspWHvbw7F
 gpKMJ2U87KLKQm1W8Ba/rmx+/9MoMRPxolgCm6UeA6tPNye8gt830GfPH/Cq4+Tl81eO
 c7VSmajTAyl4TUGCwadu66L2gB4KLWNCDMj/gkj61BQZEfCTC65S9ZPZdCSSGWjhl8L9
 kaUA==
X-Gm-Message-State: AOAM532hRoAXA03BhThiX5WEjHBKvSc78BxVakynN5QYsfEG7PGYywOy
 z6uJoSKs44Gp/Xdbn1ek18W7fnCh5cnYrg==
X-Google-Smtp-Source: ABdhPJyOFyVK+r2ER6kRssMHJT7b549YyQPrQd2qKlv4Mnau93dVnbZOnbOFJ70uPaSarCF/63dWJA==
X-Received: by 2002:a17:903:248f:b029:de:c703:9839 with SMTP id
 p15-20020a170903248fb02900dec7039839mr13020757plw.42.1614554618432; 
 Sun, 28 Feb 2021 15:23:38 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/50] target/i386: Move rex_r into DisasContext
Date: Sun, 28 Feb 2021 15:22:48 -0800
Message-Id: <20210228232321.322053-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Treat this flag exactly like we treat rex_b and rex_x.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 84 ++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 39 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 605b80229a..aa10d0ba99 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -92,6 +92,7 @@ typedef struct DisasContext {
 #endif
 
 #ifdef TARGET_X86_64
+    uint8_t rex_r;
     uint8_t rex_x;
     uint8_t rex_b;
 #endif
@@ -166,10 +167,12 @@ typedef struct DisasContext {
 
 #ifdef TARGET_X86_64
 #define REX_PREFIX(S)  (((S)->prefix & PREFIX_REX) != 0)
+#define REX_R(S)       ((S)->rex_r + 0)
 #define REX_X(S)       ((S)->rex_x + 0)
 #define REX_B(S)       ((S)->rex_b + 0)
 #else
 #define REX_PREFIX(S)  false
+#define REX_R(S)       0
 #define REX_X(S)       0
 #define REX_B(S)       0
 #endif
@@ -3094,7 +3097,7 @@ static const struct SSEOpHelper_eppi sse_op_table7[256] = {
 };
 
 static void gen_sse(CPUX86State *env, DisasContext *s, int b,
-                    target_ulong pc_start, int rex_r)
+                    target_ulong pc_start)
 {
     int b1, op1_offset, op2_offset, is_xmm, val;
     int modrm, mod, rm, reg;
@@ -3164,8 +3167,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
     modrm = x86_ldub_code(env, s);
     reg = ((modrm >> 3) & 7);
-    if (is_xmm)
-        reg |= rex_r;
+    if (is_xmm) {
+        reg |= REX_R(s);
+    }
     mod = (modrm >> 6) & 3;
     if (sse_fn_epp == SSE_SPECIAL) {
         b |= (b1 << 8);
@@ -3699,7 +3703,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 tcg_gen_ld16u_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State,fpregs[rm].mmx.MMX_W(val)));
             }
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_op_mov_reg_v(s, ot, reg, s->T0);
             break;
         case 0x1d6: /* movq ea, xmm */
@@ -3743,7 +3747,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                  offsetof(CPUX86State, fpregs[rm].mmx));
                 gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, s->ptr0);
             }
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             break;
 
@@ -3755,7 +3759,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             modrm = x86_ldub_code(env, s);
             rm = modrm & 7;
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             if (b1 >= 2) {
                 goto unknown_op;
@@ -3831,7 +3835,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             /* Various integer extensions at 0f 38 f[0-f].  */
             b = modrm | (b1 << 8);
             modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
 
             switch (b) {
             case 0x3f0: /* crc32 Gd,Eb */
@@ -4185,7 +4189,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             b = modrm;
             modrm = x86_ldub_code(env, s);
             rm = modrm & 7;
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             if (b1 >= 2) {
                 goto unknown_op;
@@ -4205,7 +4209,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3)
                     gen_lea_modrm(env, s, modrm);
-                reg = ((modrm >> 3) & 7) | rex_r;
+                reg = ((modrm >> 3) & 7) | REX_R(s);
                 val = x86_ldub_code(env, s);
                 switch (b) {
                 case 0x14: /* pextrb */
@@ -4374,7 +4378,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             /* Various integer extensions at 0f 3a f[0-f].  */
             b = modrm | (b1 << 8);
             modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
 
             switch (b) {
             case 0x3f0: /* rorx Gy,Ey, Ib */
@@ -4548,12 +4552,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
-    int rex_w, rex_r;
+    int rex_w;
     target_ulong pc_start = s->base.pc_next;
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
 #ifdef TARGET_X86_64
+    s->rex_r = 0;
     s->rex_x = 0;
     s->rex_b = 0;
 #endif
@@ -4567,7 +4572,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     prefixes = 0;
     rex_w = -1;
-    rex_r = 0;
 
  next_byte:
     b = x86_ldub_code(env, s);
@@ -4612,7 +4616,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             /* REX prefix */
             prefixes |= PREFIX_REX;
             rex_w = (b >> 3) & 1;
-            rex_r = (b & 0x4) << 1;
+            s->rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
             s->rex_b = (b & 0x1) << 3;
             goto next_byte;
@@ -4641,7 +4645,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                             | PREFIX_LOCK | PREFIX_DATA | PREFIX_REX)) {
                 goto illegal_op;
             }
-            rex_r = (~vex2 >> 4) & 8;
+#ifdef TARGET_X86_64
+            s->rex_r = (~vex2 >> 4) & 8;
+#endif
             if (b == 0xc5) {
                 /* 2-byte VEX prefix: RVVVVlpp, implied 0f leading opcode byte */
                 vex3 = vex2;
@@ -4731,7 +4737,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             switch(f) {
             case 0: /* OP Ev, Gv */
                 modrm = x86_ldub_code(env, s);
-                reg = ((modrm >> 3) & 7) | rex_r;
+                reg = ((modrm >> 3) & 7) | REX_R(s);
                 mod = (modrm >> 6) & 3;
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3) {
@@ -4753,7 +4759,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             case 1: /* OP Gv, Ev */
                 modrm = x86_ldub_code(env, s);
                 mod = (modrm >> 6) & 3;
-                reg = ((modrm >> 3) & 7) | rex_r;
+                reg = ((modrm >> 3) & 7) | REX_R(s);
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3) {
                     gen_lea_modrm(env, s, modrm);
@@ -5173,7 +5179,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         ot = mo_b_d(b, dflag);
 
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
 
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_op_mov_v_reg(s, ot, s->T1, reg);
@@ -5245,7 +5251,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6b:
         ot = dflag;
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         if (b == 0x69)
             s->rip_offset = insn_const_size(ot);
         else if (b == 0x6b)
@@ -5297,7 +5303,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c1: /* xadd Ev, Gv */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         gen_op_mov_v_reg(s, ot, s->T0, reg);
         if (mod == 3) {
@@ -5329,7 +5335,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
             ot = mo_b_d(b, dflag);
             modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             oldv = tcg_temp_new();
             newv = tcg_temp_new();
@@ -5551,7 +5557,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x89: /* mov Gv, Ev */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
 
         /* generate a generic store */
         gen_ldst_modrm(env, s, modrm, ot, reg, 1);
@@ -5577,7 +5583,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x8b: /* mov Ev, Gv */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
 
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_op_mov_reg_v(s, ot, reg, s->T0);
@@ -5627,7 +5633,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             s_ot = b & 8 ? MO_SIGN | ot : ot;
 
             modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             rm = (modrm & 7) | REX_B(s);
 
@@ -5666,7 +5672,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         {
             AddressParts a = gen_lea_modrm_0(env, s, modrm);
             TCGv ea = gen_lea_modrm_1(s, a);
@@ -5748,7 +5754,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x87: /* xchg Ev, Gv */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         if (mod == 3) {
             rm = (modrm & 7) | REX_B(s);
@@ -5785,7 +5791,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     do_lxx:
         ot = dflag != MO_16 ? MO_32 : MO_16;
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
@@ -5868,7 +5874,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         if (mod != 3) {
             gen_lea_modrm(env, s, modrm);
             opreg = OR_TMP0;
@@ -6722,7 +6728,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         }
         ot = dflag;
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         gen_cmovcc1(env, s, ot, b, modrm, reg);
         break;
 
@@ -6868,7 +6874,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     do_btx:
         ot = dflag;
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
         gen_op_mov_v_reg(s, MO_32, s->T1, reg);
@@ -6973,7 +6979,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1bd: /* bsr / lzcnt */
         ot = dflag;
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_extu(ot, s->T0);
 
@@ -7700,7 +7706,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             d_ot = dflag;
 
             modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             rm = (modrm & 7) | REX_B(s);
 
@@ -7774,7 +7780,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             ot = dflag != MO_16 ? MO_32 : MO_16;
             modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             t0 = tcg_temp_local_new();
             gen_update_cc_op(s);
@@ -7815,7 +7821,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         if (s->flags & HF_MPX_EN_MASK) {
             mod = (modrm >> 6) & 3;
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             if (prefixes & PREFIX_REPZ) {
                 /* bndcl */
                 if (reg >= 4
@@ -7905,7 +7911,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         modrm = x86_ldub_code(env, s);
         if (s->flags & HF_MPX_EN_MASK) {
             mod = (modrm >> 6) & 3;
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             if (mod != 3 && (prefixes & PREFIX_REPZ)) {
                 /* bndmk */
                 if (reg >= 4
@@ -8017,7 +8023,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
              * are assumed to be 1's, regardless of actual values.
              */
             rm = (modrm & 7) | REX_B(s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             if (CODE64(s))
                 ot = MO_64;
             else
@@ -8070,7 +8076,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
              * are assumed to be 1's, regardless of actual values.
              */
             rm = (modrm & 7) | REX_B(s);
-            reg = ((modrm >> 3) & 7) | rex_r;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
             if (CODE64(s))
                 ot = MO_64;
             else
@@ -8112,7 +8118,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
         /* generate a generic store */
         gen_ldst_modrm(env, s, modrm, ot, reg, 1);
         break;
@@ -8344,7 +8350,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
 
         modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | rex_r;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
 
         if (s->prefix & PREFIX_DATA) {
             ot = MO_16;
@@ -8372,7 +8378,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c2:
     case 0x1c4 ... 0x1c6:
     case 0x1d0 ... 0x1fe:
-        gen_sse(env, s, b, pc_start, rex_r);
+        gen_sse(env, s, b, pc_start);
         break;
     default:
         goto unknown_op;
-- 
2.25.1


