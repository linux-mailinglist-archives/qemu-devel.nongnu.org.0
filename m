Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5816006CB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:45:03 +0200 (CEST)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okJry-0001ZI-E1
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJZ1-0006yw-3P
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJYw-0000fV-UL
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:26 -0400
Received: by mail-pj1-x102f.google.com with SMTP id cl1so9997513pjb.1
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 23:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eGsocEHV9GRJXpdoyTfqC3u5puXLDdi16jy19yFduhE=;
 b=tIzWkOqVIHe6Hci7vxL2x958iH+9EMra9vy2hxQPKKd88RlgIb2m+tcGdfvLjbyMun
 dfWNQrir5gyqZJ2Jda5v+uJfjymP6mHd/uvtGcLexC0xm/Lmr9z3Yzm2BXwqxMJaNAEJ
 2X1gRgJV5NBhCVntbi1lCjrbdnCBYoehGgT7wqBJsKRfSr+ek3D7tLqZn6bqRbJpKsM9
 sprEYh8ur/aqiL2aodfa7EIVC5gpcdLLmQM+XetP9R+i4AVIZFXhx5c526ZS/Eu515wA
 6Nl55QyutmXYgGM1d16QecarSw5/GxWFFh5GwZCUMKIYH+GCs6dlc6ODe3hzb0Wl3BqG
 97aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGsocEHV9GRJXpdoyTfqC3u5puXLDdi16jy19yFduhE=;
 b=cSXQZ/75+QtqS2cETGTrA8N189ac0mh/gtIveGn2AGYCIjW2R3iEDSkzkeAygPFZir
 AX0FzYRfFyokxyXlEm2q8cvPC264ftyc5lc6YvLBeJvHcwuuQGaUctsLM5586OUaVUWQ
 ++gYfrJupRbOhZVcZHCUfMBNQaHnaLF/REfKqdRYxD7ghZk6rNztrTtXX2xUqmWnCTqF
 FwRmmNmyBRoTeWfE4IuSkzQzFXh9DMzP9cK667kcMMblkmZoU1/J61d8FxLdJrcM/Ssy
 1Ki3wE2vJajp6isySIiI2OLoYaFW7VP42hCGmXbVR+0uF5+fgU8+uVinAHSY8aBCI+KF
 QcQw==
X-Gm-Message-State: ACrzQf1BZD2jrebjChPn66CsnR6PlrgV6CCjJC9YMskvfrpO5eDDlvBS
 hY5qgMuz1Y1vlZDfHJ9ApUpkI9v5xDAz+/A3
X-Google-Smtp-Source: AMsMyM5Q5phkE6kaCNLaS0nK6+h+GsDTNpcB2wp1T7al51eJtxA1B0yZpSrHZlBFSRSI+MHB1h61Hw==
X-Received: by 2002:a17:90b:38c4:b0:20d:9dfa:4339 with SMTP id
 nn4-20020a17090b38c400b0020d9dfa4339mr27135907pjb.74.1665987920001; 
 Sun, 16 Oct 2022 23:25:20 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a170902d4c100b00177f32b1a32sm362632plg.271.2022.10.16.23.25.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 23:25:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tcg/sparc: Remove support for sparc32plus
Date: Mon, 17 Oct 2022 16:24:43 +1000
Message-Id: <20221017062445.563431-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017062445.563431-1-richard.henderson@linaro.org>
References: <20221017062445.563431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 9b9c37c36439, we have only supported sparc64 cpus.
Debian and Gentoo now only support 64-bit sparc64 userland,
so it is time to drop the 32-bit sparc64 userland: sparc32plus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.h     |  11 ---
 tcg/tcg.c                  |  75 +----------------
 tcg/sparc/tcg-target.c.inc | 166 +++++++------------------------------
 3 files changed, 33 insertions(+), 219 deletions(-)

diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index c050763049..8655acdbe5 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -25,8 +25,6 @@
 #ifndef SPARC_TCG_TARGET_H
 #define SPARC_TCG_TARGET_H
 
-#define TCG_TARGET_REG_BITS 64
-
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
 #define TCG_TARGET_NB_REGS 32
@@ -70,19 +68,10 @@ typedef enum {
 /* used for function call generation */
 #define TCG_REG_CALL_STACK TCG_REG_O6
 
-#ifdef __arch64__
 #define TCG_TARGET_STACK_BIAS           2047
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
-#else
-#define TCG_TARGET_STACK_BIAS           0
-#define TCG_TARGET_STACK_ALIGN          8
-#define TCG_TARGET_CALL_STACK_OFFSET    (64 + 4 + 6*4)
-#endif
-
-#ifdef __arch64__
 #define TCG_TARGET_EXTEND_ARGS 1
-#endif
 
 #if defined(__VIS__) && __VIS__ >= 0x300
 #define use_vis3_instructions  1
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 612a12f58f..c9e664ee31 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1487,39 +1487,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     }
 #endif
 
-#if defined(__sparc__) && !defined(__arch64__) \
-    && !defined(CONFIG_TCG_INTERPRETER)
-    /* We have 64-bit values in one register, but need to pass as two
-       separate parameters.  Split them.  */
-    int orig_typemask = typemask;
-    int orig_nargs = nargs;
-    TCGv_i64 retl, reth;
-    TCGTemp *split_args[MAX_OPC_PARAM];
-
-    retl = NULL;
-    reth = NULL;
-    typemask = 0;
-    for (i = real_args = 0; i < nargs; ++i) {
-        int argtype = extract32(orig_typemask, (i + 1) * 3, 3);
-        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
-
-        if (is_64bit) {
-            TCGv_i64 orig = temp_tcgv_i64(args[i]);
-            TCGv_i32 h = tcg_temp_new_i32();
-            TCGv_i32 l = tcg_temp_new_i32();
-            tcg_gen_extr_i64_i32(l, h, orig);
-            split_args[real_args++] = tcgv_i32_temp(h);
-            typemask |= dh_typecode_i32 << (real_args * 3);
-            split_args[real_args++] = tcgv_i32_temp(l);
-            typemask |= dh_typecode_i32 << (real_args * 3);
-        } else {
-            split_args[real_args++] = args[i];
-            typemask |= argtype << (real_args * 3);
-        }
-    }
-    nargs = real_args;
-    args = split_args;
-#elif defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
+#if defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
     for (i = 0; i < nargs; ++i) {
         int argtype = extract32(typemask, (i + 1) * 3, 3);
         bool is_32bit = (argtype & ~1) == dh_typecode_i32;
@@ -1542,22 +1510,6 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
     pi = 0;
     if (ret != NULL) {
-#if defined(__sparc__) && !defined(__arch64__) \
-    && !defined(CONFIG_TCG_INTERPRETER)
-        if ((typemask & 6) == dh_typecode_i64) {
-            /* The 32-bit ABI is going to return the 64-bit value in
-               the %o0/%o1 register pair.  Prepare for this by using
-               two return temporaries, and reassemble below.  */
-            retl = tcg_temp_new_i64();
-            reth = tcg_temp_new_i64();
-            op->args[pi++] = tcgv_i64_arg(reth);
-            op->args[pi++] = tcgv_i64_arg(retl);
-            nb_rets = 2;
-        } else {
-            op->args[pi++] = temp_arg(ret);
-            nb_rets = 1;
-        }
-#else
         if (TCG_TARGET_REG_BITS < 64 && (typemask & 6) == dh_typecode_i64) {
 #if HOST_BIG_ENDIAN
             op->args[pi++] = temp_arg(ret + 1);
@@ -1571,7 +1523,6 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
             op->args[pi++] = temp_arg(ret);
             nb_rets = 1;
         }
-#endif
     } else {
         nb_rets = 0;
     }
@@ -1634,29 +1585,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     tcg_debug_assert(TCGOP_CALLI(op) == real_args);
     tcg_debug_assert(pi <= ARRAY_SIZE(op->args));
 
-#if defined(__sparc__) && !defined(__arch64__) \
-    && !defined(CONFIG_TCG_INTERPRETER)
-    /* Free all of the parts we allocated above.  */
-    for (i = real_args = 0; i < orig_nargs; ++i) {
-        int argtype = extract32(orig_typemask, (i + 1) * 3, 3);
-        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
-
-        if (is_64bit) {
-            tcg_temp_free_internal(args[real_args++]);
-            tcg_temp_free_internal(args[real_args++]);
-        } else {
-            real_args++;
-        }
-    }
-    if ((orig_typemask & 6) == dh_typecode_i64) {
-        /* The 32-bit ABI returned two 32-bit pieces.  Re-assemble them.
-           Note that describing these as TCGv_i64 eliminates an unnecessary
-           zero-extension that tcg_gen_concat_i32_i64 would create.  */
-        tcg_gen_concat32_i64(temp_tcgv_i64(ret), retl, reth);
-        tcg_temp_free_i64(retl);
-        tcg_temp_free_i64(reth);
-    }
-#elif defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
+#if defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
     for (i = 0; i < nargs; ++i) {
         int argtype = extract32(typemask, (i + 1) * 3, 3);
         bool is_32bit = (argtype & ~1) == dh_typecode_i32;
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 72d9552fd0..097bcfcd12 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -22,6 +22,11 @@
  * THE SOFTWARE.
  */
 
+/* We only support generating code for 64-bit mode.  */
+#ifndef __arch64__
+#error "unsupported code generation mode"
+#endif
+
 #include "../tcg-pool.c.inc"
 
 #ifdef CONFIG_DEBUG_TCG
@@ -61,12 +66,6 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 };
 #endif
 
-#ifdef __arch64__
-# define SPARC64 1
-#else
-# define SPARC64 0
-#endif
-
 #define TCG_CT_CONST_S11  0x100
 #define TCG_CT_CONST_S13  0x200
 #define TCG_CT_CONST_ZERO 0x400
@@ -91,11 +90,7 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
  * high bits of the %i and %l registers garbage at all times.
  */
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
-#if SPARC64
 # define ALL_GENERAL_REGS64  ALL_GENERAL_REGS
-#else
-# define ALL_GENERAL_REGS64  MAKE_64BIT_MASK(0, 16)
-#endif
 #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 #define ALL_QLDST_REGS64     (ALL_GENERAL_REGS64 & ~SOFTMMU_RESERVE_REGS)
 
@@ -306,11 +301,7 @@ static bool check_fit_i32(int32_t val, unsigned int bits)
 }
 
 #define check_fit_tl    check_fit_i64
-#if SPARC64
-# define check_fit_ptr  check_fit_i64
-#else
-# define check_fit_ptr  check_fit_i32
-#endif
+#define check_fit_ptr   check_fit_i64
 
 static bool patch_reloc(tcg_insn_unit *src_rw, int type,
                         intptr_t value, intptr_t addend)
@@ -573,11 +564,6 @@ static void tcg_out_sety(TCGContext *s, TCGReg rs)
     tcg_out32(s, WRY | INSN_RS1(TCG_REG_G0) | INSN_RS2(rs));
 }
 
-static void tcg_out_rdy(TCGContext *s, TCGReg rd)
-{
-    tcg_out32(s, RDY | INSN_RD(rd));
-}
-
 static void tcg_out_div32(TCGContext *s, TCGReg rd, TCGReg rs1,
                           int32_t val2, int val2const, int uns)
 {
@@ -914,9 +900,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op)
         tcg_out_arithi(s, r, r, 16, SHIFT_SRL);
         break;
     case MO_32:
-        if (SPARC64) {
-            tcg_out_arith(s, r, r, 0, SHIFT_SRL);
-        }
+        tcg_out_arith(s, r, r, 0, SHIFT_SRL);
         break;
     case MO_64:
         break;
@@ -948,7 +932,6 @@ static void build_trampolines(TCGContext *s)
     };
 
     int i;
-    TCGReg ra;
 
     for (i = 0; i < ARRAY_SIZE(qemu_ld_helpers); ++i) {
         if (qemu_ld_helpers[i] == NULL) {
@@ -961,16 +944,8 @@ static void build_trampolines(TCGContext *s)
         }
         qemu_ld_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
 
-        if (SPARC64 || TARGET_LONG_BITS == 32) {
-            ra = TCG_REG_O3;
-        } else {
-            /* Install the high part of the address.  */
-            tcg_out_arithi(s, TCG_REG_O1, TCG_REG_O2, 32, SHIFT_SRLX);
-            ra = TCG_REG_O4;
-        }
-
         /* Set the retaddr operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
+        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O3, TCG_REG_O7);
         /* Tail call.  */
         tcg_out_jmpl_const(s, qemu_ld_helpers[i], true, true);
         /* delay slot -- set the env argument */
@@ -988,37 +963,10 @@ static void build_trampolines(TCGContext *s)
         }
         qemu_st_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
 
-        if (SPARC64) {
-            emit_extend(s, TCG_REG_O2, i);
-            ra = TCG_REG_O4;
-        } else {
-            ra = TCG_REG_O1;
-            if (TARGET_LONG_BITS == 64) {
-                /* Install the high part of the address.  */
-                tcg_out_arithi(s, ra, ra + 1, 32, SHIFT_SRLX);
-                ra += 2;
-            } else {
-                ra += 1;
-            }
-            if ((i & MO_SIZE) == MO_64) {
-                /* Install the high part of the data.  */
-                tcg_out_arithi(s, ra, ra + 1, 32, SHIFT_SRLX);
-                ra += 2;
-            } else {
-                emit_extend(s, ra, i);
-                ra += 1;
-            }
-            /* Skip the oi argument.  */
-            ra += 1;
-        }
-                
+        emit_extend(s, TCG_REG_O2, i);
+
         /* Set the retaddr operand.  */
-        if (ra >= TCG_REG_O6) {
-            tcg_out_st(s, TCG_TYPE_PTR, TCG_REG_O7, TCG_REG_CALL_STACK,
-                       TCG_TARGET_CALL_STACK_OFFSET);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_PTR, ra, TCG_REG_O7);
-        }
+        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O4, TCG_REG_O7);
 
         /* Tail call.  */
         tcg_out_jmpl_const(s, qemu_st_helpers[i], true, true);
@@ -1047,11 +995,6 @@ static void build_trampolines(TCGContext *s)
             qemu_unalign_st_trampoline = tcg_splitwx_to_rx(s->code_ptr);
         }
 
-        if (!SPARC64 && TARGET_LONG_BITS == 64) {
-            /* Install the high part of the address.  */
-            tcg_out_arithi(s, TCG_REG_O1, TCG_REG_O2, 32, SHIFT_SRLX);
-        }
-
         /* Tail call.  */
         tcg_out_jmpl_const(s, helper, true, true);
         /* delay slot -- set the env argument */
@@ -1182,7 +1125,7 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
     tcg_out_cmp(s, r0, r2, 0);
 
     /* If the guest address must be zero-extended, do so now.  */
-    if (SPARC64 && TARGET_LONG_BITS == 32) {
+    if (TARGET_LONG_BITS == 32) {
         tcg_out_arithi(s, r0, addr, 0, SHIFT_SRL);
         return r0;
     }
@@ -1231,7 +1174,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
-    TCGReg addrz, param;
+    TCGReg addrz;
     const tcg_insn_unit *func;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
@@ -1251,12 +1194,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 
     /* TLB Miss.  */
 
-    param = TCG_REG_O1;
-    if (!SPARC64 && TARGET_LONG_BITS == 64) {
-        /* Skip the high-part; we'll perform the extract in the trampoline.  */
-        param++;
-    }
-    tcg_out_mov(s, TCG_TYPE_REG, param++, addrz);
+    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
 
     /* We use the helpers to extend SB and SW data, leaving the case
        of SL needing explicit extending below.  */
@@ -1268,30 +1206,13 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_debug_assert(func != NULL);
     tcg_out_call_nodelay(s, func, false);
     /* delay slot */
-    tcg_out_movi(s, TCG_TYPE_I32, param, oi);
+    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
-    /* Recall that all of the helpers return 64-bit results.
-       Which complicates things for sparcv8plus.  */
-    if (SPARC64) {
-        /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-        if (is_64 && (memop & MO_SSIZE) == MO_SL) {
-            tcg_out_arithi(s, data, TCG_REG_O0, 0, SHIFT_SRA);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-        }
+    /* We let the helper sign-extend SB and SW, but leave SL for here.  */
+    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+        tcg_out_arithi(s, data, TCG_REG_O0, 0, SHIFT_SRA);
     } else {
-        if ((memop & MO_SIZE) == MO_64) {
-            tcg_out_arithi(s, TCG_REG_O0, TCG_REG_O0, 32, SHIFT_SLLX);
-            tcg_out_arithi(s, TCG_REG_O1, TCG_REG_O1, 0, SHIFT_SRL);
-            tcg_out_arith(s, data, TCG_REG_O0, TCG_REG_O1, ARITH_OR);
-        } else if (is_64) {
-            /* Re-extend from 32-bit rather than reassembling when we
-               know the high register must be an extension.  */
-            tcg_out_arithi(s, data, TCG_REG_O1, 0,
-                           memop & MO_SIGN ? SHIFT_SRA : SHIFT_SRL);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, data, TCG_REG_O1);
-        }
+        tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
     }
 
     *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
@@ -1301,7 +1222,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     unsigned s_bits = memop & MO_SIZE;
     unsigned t_bits;
 
-    if (SPARC64 && TARGET_LONG_BITS == 32) {
+    if (TARGET_LONG_BITS == 32) {
         tcg_out_arithi(s, TCG_REG_T1, addr, 0, SHIFT_SRL);
         addr = TCG_REG_T1;
     }
@@ -1337,10 +1258,9 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
          * operation in the delay slot, and failure need only invoke the
          * handler for SIGBUS.
          */
-        TCGReg arg_low = TCG_REG_O1 + (!SPARC64 && TARGET_LONG_BITS == 64);
         tcg_out_call_nodelay(s, qemu_unalign_ld_trampoline, false);
         /* delay slot -- move to low part of argument reg */
-        tcg_out_mov_delay(s, arg_low, addr);
+        tcg_out_mov_delay(s, TCG_REG_O1, addr);
     } else {
         /* Underalignment: load by pieces of minimum alignment. */
         int ld_opc, a_size, s_size, i;
@@ -1400,7 +1320,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
-    TCGReg addrz, param;
+    TCGReg addrz;
     const tcg_insn_unit *func;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
@@ -1418,23 +1338,14 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
     /* TLB Miss.  */
 
-    param = TCG_REG_O1;
-    if (!SPARC64 && TARGET_LONG_BITS == 64) {
-        /* Skip the high-part; we'll perform the extract in the trampoline.  */
-        param++;
-    }
-    tcg_out_mov(s, TCG_TYPE_REG, param++, addrz);
-    if (!SPARC64 && (memop & MO_SIZE) == MO_64) {
-        /* Skip the high-part; we'll perform the extract in the trampoline.  */
-        param++;
-    }
-    tcg_out_mov(s, TCG_TYPE_REG, param++, data);
+    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
+    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O2, data);
 
     func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
     tcg_debug_assert(func != NULL);
     tcg_out_call_nodelay(s, func, false);
     /* delay slot */
-    tcg_out_movi(s, TCG_TYPE_I32, param, oi);
+    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O3, oi);
 
     *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
 #else
@@ -1443,7 +1354,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
     unsigned s_bits = memop & MO_SIZE;
     unsigned t_bits;
 
-    if (SPARC64 && TARGET_LONG_BITS == 32) {
+    if (TARGET_LONG_BITS == 32) {
         tcg_out_arithi(s, TCG_REG_T1, addr, 0, SHIFT_SRL);
         addr = TCG_REG_T1;
     }
@@ -1479,10 +1390,9 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
          * operation in the delay slot, and failure need only invoke the
          * handler for SIGBUS.
          */
-        TCGReg arg_low = TCG_REG_O1 + (!SPARC64 && TARGET_LONG_BITS == 64);
         tcg_out_call_nodelay(s, qemu_unalign_st_trampoline, false);
         /* delay slot -- move to low part of argument reg */
-        tcg_out_mov_delay(s, arg_low, addr);
+        tcg_out_mov_delay(s, TCG_REG_O1, addr);
     } else {
         /* Underalignment: store by pieces of minimum alignment. */
         int st_opc, a_size, s_size, i;
@@ -1719,14 +1629,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_muls2_i32:
         c = ARITH_SMUL;
     do_mul2:
-        /* The 32-bit multiply insns produce a full 64-bit result.  If the
-           destination register can hold it, we can avoid the slower RDY.  */
+        /* The 32-bit multiply insns produce a full 64-bit result. */
         tcg_out_arithc(s, a0, a2, args[3], const_args[3], c);
-        if (SPARC64 || a0 <= TCG_REG_O7) {
-            tcg_out_arithi(s, a1, a0, 32, SHIFT_SRLX);
-        } else {
-            tcg_out_rdy(s, a1);
-        }
+        tcg_out_arithi(s, a1, a0, 32, SHIFT_SRLX);
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -1984,16 +1889,11 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T2); /* for internal use */
 }
 
-#if SPARC64
-# define ELF_HOST_MACHINE  EM_SPARCV9
-#else
-# define ELF_HOST_MACHINE  EM_SPARC32PLUS
-# define ELF_HOST_FLAGS    EF_SPARC_32PLUS
-#endif
+#define ELF_HOST_MACHINE  EM_SPARCV9
 
 typedef struct {
     DebugFrameHeader h;
-    uint8_t fde_def_cfa[SPARC64 ? 4 : 2];
+    uint8_t fde_def_cfa[4];
     uint8_t fde_win_save;
     uint8_t fde_ret_save[3];
 } DebugFrame;
@@ -2010,12 +1910,8 @@ static const DebugFrame debug_frame = {
     .h.fde.len = sizeof(DebugFrame) - offsetof(DebugFrame, h.fde.cie_offset),
 
     .fde_def_cfa = {
-#if SPARC64
         12, 30,                         /* DW_CFA_def_cfa i6, 2047 */
         (2047 & 0x7f) | 0x80, (2047 >> 7)
-#else
-        13, 30                          /* DW_CFA_def_cfa_register i6 */
-#endif
     },
     .fde_win_save = 0x2d,               /* DW_CFA_GNU_window_save */
     .fde_ret_save = { 9, 15, 31 },      /* DW_CFA_register o7, i7 */
-- 
2.34.1


