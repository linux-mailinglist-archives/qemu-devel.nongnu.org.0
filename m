Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3B40B445
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:13:39 +0200 (CEST)
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQB3x-0007tE-U9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQAkq-0002hz-9w
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:53:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQAkk-0003ti-9Z
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:53:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso2492977pji.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C1AA1T78h4OSu4xCXTrU7llpJeO2F6WkatdZ9i0XRHg=;
 b=OBcEin4bzLOMq1/IIFYf1SbmJvrBWDdWVhxbg4uHA9C1Ow9Ifw776wT1wX9jiHMgl7
 3oOKvw1nslxc5lpEAva+8h32NqaDEMpSZnEWHCiE0YYfsrcXuf6mg6ylkzYHW3IodAev
 r2SmaIcyGbZFBfUxlH/IKuT6Tlqkr/ZvFnu3lRw2zXtL/F0vL0tK/+3y3uDB2IsHwo/q
 Hk5/4fO21EPdBfuY9byuZuyLjHTsbYa997wm38kij1cs5bph+uysUx9SxTkBAbnw2uIU
 PQxrS7uZlJG/cEGc+PxU3UyztfjCYPutumeUJJvX6p5v/B1rMJHFUtOrOpOrL8QJNoRV
 LWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C1AA1T78h4OSu4xCXTrU7llpJeO2F6WkatdZ9i0XRHg=;
 b=tTcCGYUAfuuUO53yeT4FLKQZaeugLc4ZETEILmq50Ip30Q94HYbKgrKj/hiBpgTW27
 nGHLdvTdQjVj0qLemz3WwuhGeKZj2rR+nzMMKsF3TYvZZkTfdLvqXVeCX3cg/tgb/iLU
 VzRb41x9iNzr3fwf+t2otc49zxy872WrQse/e+VQ6jZBJAIQChnIdsU7NXrrz8uPja2w
 U6hOa13vTMUH3YJg8VGd65/t0cb5B9c2b5RqOX9h0MP9yCTrpRVMHya9Q3lppVPPOg/L
 p/QHkEIOtDamBPkSn6jYUbFFK+Ao1pVxGy6NqCi7uSIvpFTw6twdQ19Q3vi0vQiI5yQh
 Ya/g==
X-Gm-Message-State: AOAM530c79I3fT+xPvtwi9p91ERY0FbCU6W9I+UC8XlZClebuhNreTqe
 XuoMoZQEVKxvNqMYdUkaSROerYjxdQLpog==
X-Google-Smtp-Source: ABdhPJxBNowyFRlRMM9/o/mFYscYWJCVsTJu4EQe9DnhQl/TE+blvCGjDIQqg8cDB3but5vXzggs7w==
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id
 h3-20020a170902f703b029012c0982c9aemr15556010plo.20.1631634824331; 
 Tue, 14 Sep 2021 08:53:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g3sm2085985pjm.22.2021.09.14.08.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 08:53:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v3 01/44] accel/tcg: Add DisasContextBase argument to
 translator_ld*
Date: Tue, 14 Sep 2021 08:53:42 -0700
Message-Id: <20210914155342.1296339-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914155342.1296339-1-richard.henderson@linaro.org>
References: <20210914155342.1296339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
[rth: Split out of a larger patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h                 |  9 +++++----
 target/arm/arm_ldst.h                     | 12 ++++++------
 target/alpha/translate.c                  |  2 +-
 target/arm/translate-a64.c                |  2 +-
 target/arm/translate.c                    |  9 +++++----
 target/hexagon/translate.c                |  3 ++-
 target/hppa/translate.c                   |  2 +-
 target/i386/tcg/translate.c               | 10 +++++-----
 target/m68k/translate.c                   |  2 +-
 target/mips/tcg/translate.c               |  8 ++++----
 target/openrisc/translate.c               |  2 +-
 target/ppc/translate.c                    |  5 +++--
 target/riscv/translate.c                  |  5 +++--
 target/s390x/tcg/translate.c              | 16 +++++++++-------
 target/sh4/translate.c                    |  4 ++--
 target/sparc/translate.c                  |  2 +-
 target/xtensa/translate.c                 |  5 +++--
 target/mips/tcg/micromips_translate.c.inc |  2 +-
 target/mips/tcg/mips16e_translate.c.inc   |  4 ++--
 target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
 20 files changed, 58 insertions(+), 50 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index d318803267..6c054e8d05 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -157,7 +157,8 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
 
 #define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
     static inline type                                                  \
-    fullname ## _swap(CPUArchState *env, abi_ptr pc, bool do_swap)      \
+    fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase,      \
+                      abi_ptr pc, bool do_swap)                         \
     {                                                                   \
         type ret = load_fn(env, pc);                                    \
         if (do_swap) {                                                  \
@@ -166,10 +167,10 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
         plugin_insn_append(&ret, sizeof(ret));                          \
         return ret;                                                     \
     }                                                                   \
-                                                                        \
-    static inline type fullname(CPUArchState *env, abi_ptr pc)          \
+    static inline type fullname(CPUArchState *env,                      \
+                                DisasContextBase *dcbase, abi_ptr pc)   \
     {                                                                   \
-        return fullname ## _swap(env, pc, false);                       \
+        return fullname ## _swap(env, dcbase, pc, false);               \
     }
 
 GEN_TRANSLATOR_LD(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)
diff --git a/target/arm/arm_ldst.h b/target/arm/arm_ldst.h
index 057160e8da..cee0548a1c 100644
--- a/target/arm/arm_ldst.h
+++ b/target/arm/arm_ldst.h
@@ -24,15 +24,15 @@
 #include "qemu/bswap.h"
 
 /* Load an instruction and return it in the standard little-endian order */
-static inline uint32_t arm_ldl_code(CPUARMState *env, target_ulong addr,
-                                    bool sctlr_b)
+static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
+                                    target_ulong addr, bool sctlr_b)
 {
-    return translator_ldl_swap(env, addr, bswap_code(sctlr_b));
+    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
 }
 
 /* Ditto, for a halfword (Thumb) instruction */
-static inline uint16_t arm_lduw_code(CPUARMState *env, target_ulong addr,
-                                     bool sctlr_b)
+static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
+                                     target_ulong addr, bool sctlr_b)
 {
 #ifndef CONFIG_USER_ONLY
     /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
@@ -41,7 +41,7 @@ static inline uint16_t arm_lduw_code(CPUARMState *env, target_ulong addr,
         addr ^= 2;
     }
 #endif
-    return translator_lduw_swap(env, addr, bswap_code(sctlr_b));
+    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
 }
 
 #endif
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index de6c0a8439..b034206688 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2971,7 +2971,7 @@ static void alpha_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUAlphaState *env = cpu->env_ptr;
-    uint32_t insn = translator_ldl(env, ctx->base.pc_next);
+    uint32_t insn = translator_ldl(env, &ctx->base, ctx->base.pc_next);
 
     ctx->base.pc_next += 4;
     ctx->base.is_jmp = translate_one(ctx, insn);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 333bc836b2..ab6b346e35 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14772,7 +14772,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     s->pc_curr = s->base.pc_next;
-    insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
+    insn = arm_ldl_code(env, &s->base, s->base.pc_next, s->sctlr_b);
     s->insn = insn;
     s->base.pc_next += 4;
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 435c659723..caefb1e1a1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9312,7 +9312,7 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
      * boundary, so we cross the page if the first 16 bits indicate
      * that this is a 32 bit insn.
      */
-    uint16_t insn = arm_lduw_code(env, s->base.pc_next, s->sctlr_b);
+    uint16_t insn = arm_lduw_code(env, &s->base, s->base.pc_next, s->sctlr_b);
 
     return !thumb_insn_is_16bit(s, s->base.pc_next, insn);
 }
@@ -9551,7 +9551,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     dc->pc_curr = dc->base.pc_next;
-    insn = arm_ldl_code(env, dc->base.pc_next, dc->sctlr_b);
+    insn = arm_ldl_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
     dc->insn = insn;
     dc->base.pc_next += 4;
     disas_arm_insn(dc, insn);
@@ -9621,11 +9621,12 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     dc->pc_curr = dc->base.pc_next;
-    insn = arm_lduw_code(env, dc->base.pc_next, dc->sctlr_b);
+    insn = arm_lduw_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, dc->base.pc_next, insn);
     dc->base.pc_next += 2;
     if (!is_16bit) {
-        uint32_t insn2 = arm_lduw_code(env, dc->base.pc_next, dc->sctlr_b);
+        uint32_t insn2 = arm_lduw_code(env, &dc->base, dc->base.pc_next,
+                                       dc->sctlr_b);
 
         insn = insn << 16 | insn2;
         dc->base.pc_next += 2;
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 54fdcaa5e8..6fb4e6853c 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -112,7 +112,8 @@ static int read_packet_words(CPUHexagonState *env, DisasContext *ctx,
     memset(words, 0, PACKET_WORDS_MAX * sizeof(uint32_t));
     for (nwords = 0; !found_end && nwords < PACKET_WORDS_MAX; nwords++) {
         words[nwords] =
-            translator_ldl(env, ctx->base.pc_next + nwords * sizeof(uint32_t));
+            translator_ldl(env, &ctx->base,
+                           ctx->base.pc_next + nwords * sizeof(uint32_t));
         found_end = is_packet_end(words[nwords]);
     }
     if (!found_end) {
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b18150ef8d..3ce22cdd09 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4177,7 +4177,7 @@ static void hppa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     {
         /* Always fetch the insn, even if nullified, so that we check
            the page permissions for execute.  */
-        uint32_t insn = translator_ldl(env, ctx->base.pc_next);
+        uint32_t insn = translator_ldl(env, &ctx->base, ctx->base.pc_next);
 
         /* Set up the IA queue for the next insn.
            This will be overwritten by a branch.  */
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aacb605eee..a46be75b00 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2028,28 +2028,28 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
 
 static inline uint8_t x86_ldub_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldub(env, advance_pc(env, s, 1));
+    return translator_ldub(env, &s->base, advance_pc(env, s, 1));
 }
 
 static inline int16_t x86_ldsw_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldsw(env, advance_pc(env, s, 2));
+    return translator_ldsw(env, &s->base, advance_pc(env, s, 2));
 }
 
 static inline uint16_t x86_lduw_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_lduw(env, advance_pc(env, s, 2));
+    return translator_lduw(env, &s->base, advance_pc(env, s, 2));
 }
 
 static inline uint32_t x86_ldl_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldl(env, advance_pc(env, s, 4));
+    return translator_ldl(env, &s->base, advance_pc(env, s, 4));
 }
 
 #ifdef TARGET_X86_64
 static inline uint64_t x86_ldq_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldq(env, advance_pc(env, s, 8));
+    return translator_ldq(env, &s->base, advance_pc(env, s, 8));
 }
 #endif
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c34d9aed61..50a55f949c 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -415,7 +415,7 @@ static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCGv val,
 static inline uint16_t read_im16(CPUM68KState *env, DisasContext *s)
 {
     uint16_t im;
-    im = translator_lduw(env, s->pc);
+    im = translator_lduw(env, &s->base, s->pc);
     s->pc += 2;
     return im;
 }
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 6f4a9a839c..148afec9dc 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16041,17 +16041,17 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
     if (ctx->insn_flags & ISA_NANOMIPS32) {
-        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = decode_isa_nanomips(env, ctx);
     } else if (!(ctx->hflags & MIPS_HFLAG_M16)) {
-        ctx->opcode = translator_ldl(env, ctx->base.pc_next);
+        ctx->opcode = translator_ldl(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = 4;
         decode_opc(env, ctx);
     } else if (ctx->insn_flags & ASE_MICROMIPS) {
-        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = decode_isa_micromips(env, ctx);
     } else if (ctx->insn_flags & ASE_MIPS16) {
-        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
         insn_bytes = decode_ase_mips16e(env, ctx);
     } else {
         gen_reserved_instruction(ctx);
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index d6ea536744..5f3d430245 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1613,7 +1613,7 @@ static void openrisc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
-    uint32_t insn = translator_ldl(&cpu->env, dc->base.pc_next);
+    uint32_t insn = translator_ldl(&cpu->env, &dc->base, dc->base.pc_next);
 
     if (!decode(dc, insn)) {
         gen_illegal_exception(dc);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..5d8b06bd80 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8585,7 +8585,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
     ctx->cia = pc = ctx->base.pc_next;
-    insn = translator_ldl_swap(env, pc, need_byteswap(ctx));
+    insn = translator_ldl_swap(env, dcbase, pc, need_byteswap(ctx));
     ctx->base.pc_next = pc += 4;
 
     if (!is_prefix_insn(ctx, insn)) {
@@ -8600,7 +8600,8 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         gen_exception_err(ctx, POWERPC_EXCP_ALIGN, POWERPC_EXCP_ALIGN_INSN);
         ok = true;
     } else {
-        uint32_t insn2 = translator_ldl_swap(env, pc, need_byteswap(ctx));
+        uint32_t insn2 = translator_ldl_swap(env, dcbase, pc,
+                                             need_byteswap(ctx));
         ctx->base.pc_next = pc += 4;
         ok = decode_insn64(ctx, deposit64(insn2, 32, 32, insn));
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e356fc6c46..74b33fa3c9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -500,7 +500,8 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     } else {
         uint32_t opcode32 = opcode;
         opcode32 = deposit32(opcode32, 16, 16,
-                             translator_lduw(env, ctx->base.pc_next + 2));
+                             translator_lduw(env, &ctx->base,
+                                             ctx->base.pc_next + 2));
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
@@ -561,7 +562,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
-    uint16_t opcode16 = translator_lduw(env, ctx->base.pc_next);
+    uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
 
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 0632b0374b..f284870cd2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -388,14 +388,16 @@ static void update_cc_op(DisasContext *s)
     }
 }
 
-static inline uint64_t ld_code2(CPUS390XState *env, uint64_t pc)
+static inline uint64_t ld_code2(CPUS390XState *env, DisasContext *s,
+                                uint64_t pc)
 {
-    return (uint64_t)cpu_lduw_code(env, pc);
+    return (uint64_t)translator_lduw(env, &s->base, pc);
 }
 
-static inline uint64_t ld_code4(CPUS390XState *env, uint64_t pc)
+static inline uint64_t ld_code4(CPUS390XState *env, DisasContext *s,
+                                uint64_t pc)
 {
-    return (uint64_t)(uint32_t)cpu_ldl_code(env, pc);
+    return (uint64_t)(uint32_t)translator_ldl(env, &s->base, pc);
 }
 
 static int get_mem_index(DisasContext *s)
@@ -6273,7 +6275,7 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
         ilen = s->ex_value & 0xf;
         op = insn >> 56;
     } else {
-        insn = ld_code2(env, pc);
+        insn = ld_code2(env, s, pc);
         op = (insn >> 8) & 0xff;
         ilen = get_ilen(op);
         switch (ilen) {
@@ -6281,10 +6283,10 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
             insn = insn << 48;
             break;
         case 4:
-            insn = ld_code4(env, pc) << 32;
+            insn = ld_code4(env, s, pc) << 32;
             break;
         case 6:
-            insn = (insn << 48) | (ld_code4(env, pc + 2) << 16);
+            insn = (insn << 48) | (ld_code4(env, s, pc + 2) << 16);
             break;
         default:
             g_assert_not_reached();
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 8704fea1ca..cf5fe9243d 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1907,7 +1907,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
 
     /* Read all of the insns for the region.  */
     for (i = 0; i < max_insns; ++i) {
-        insns[i] = translator_lduw(env, pc + i * 2);
+        insns[i] = translator_lduw(env, &ctx->base, pc + i * 2);
     }
 
     ld_adr = ld_dst = ld_mop = -1;
@@ -2307,7 +2307,7 @@ static void sh4_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     }
 #endif
 
-    ctx->opcode = translator_lduw(env, ctx->base.pc_next);
+    ctx->opcode = translator_lduw(env, &ctx->base, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next += 2;
 }
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bb70ba17de..fdb8bbe5dc 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5855,7 +5855,7 @@ static void sparc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     CPUSPARCState *env = cs->env_ptr;
     unsigned int insn;
 
-    insn = translator_ldl(env, dc->pc);
+    insn = translator_ldl(env, &dc->base, dc->pc);
     dc->base.pc_next += 4;
     disas_sparc_insn(dc, insn);
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 20399d6a04..dcf6b500ef 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -882,7 +882,8 @@ static int arg_copy_compare(const void *a, const void *b)
 static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 {
     xtensa_isa isa = dc->config->isa;
-    unsigned char b[MAX_INSN_LENGTH] = {translator_ldub(env, dc->pc)};
+    unsigned char b[MAX_INSN_LENGTH] = {translator_ldub(env, &dc->base,
+                                                        dc->pc)};
     unsigned len = xtensa_op0_insn_len(dc, b[0]);
     xtensa_format fmt;
     int slot, slots;
@@ -907,7 +908,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 
     dc->base.pc_next = dc->pc + len;
     for (i = 1; i < len; ++i) {
-        b[i] = translator_ldub(env, dc->pc + i);
+        b[i] = translator_ldub(env, &dc->base, dc->pc + i);
     }
     xtensa_insnbuf_from_chars(isa, dc->insnbuf, b, len);
     fmt = xtensa_format_decode(isa, dc->insnbuf);
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 5e95f47854..0da4c802a3 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -1627,7 +1627,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
     uint32_t op, minor, minor2, mips32_op;
     uint32_t cond, fmt, cc;
 
-    insn = translator_lduw(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = (ctx->opcode >> 21) & 0x1f;
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 54071813f1..84d816603a 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -455,7 +455,7 @@ static void decode_i64_mips16(DisasContext *ctx,
 
 static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
 {
-    int extend = translator_lduw(env, ctx->base.pc_next + 2);
+    int extend = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
     int op, rx, ry, funct, sa;
     int16_t imm, offset;
 
@@ -688,7 +688,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
         /* No delay slot, so just process as a normal instruction */
         break;
     case M16_OPC_JAL:
-        offset = translator_lduw(env, ctx->base.pc_next + 2);
+        offset = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
         offset = (((ctx->opcode & 0x1f) << 21)
                   | ((ctx->opcode >> 5) & 0x1f) << 16
                   | offset) << 2;
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index a66ae26796..ccbcecad09 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3656,7 +3656,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
     int offset;
     int imm;
 
-    insn = translator_lduw(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, &ctx->base, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = extract32(ctx->opcode, 21, 5);
@@ -3775,7 +3775,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     case NM_P48I:
         {
-            insn = translator_lduw(env, ctx->base.pc_next + 4);
+            insn = translator_lduw(env, &ctx->base, ctx->base.pc_next + 4);
             target_long addr_off = extract32(ctx->opcode, 0, 16) | insn << 16;
             switch (extract32(ctx->opcode, 16, 5)) {
             case NM_LI48:
-- 
2.25.1


