Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3516EC505
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:47:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqozd-0002AS-S5; Mon, 24 Apr 2023 01:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxj-0005pT-7w
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox0-0004PV-RI
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so41144525e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314881; x=1684906881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zK0ATTFS6tlkNM6OyhSTkXFnSXwh6GyYuYj0b65bkXQ=;
 b=SjtCnYX/aO9PrR/METngosh7TuTcRzPErIVU4VGfS4TKfvZlCxKxXkQt0uKz4DKlhR
 bH7JADOJWe9yJkDBX9BuKzVMynsgm+cWgwZdwnVuaj5gVGQjJleYb9QJJ9Y6U1VvSTz2
 YUBC97R6GR2T76o3Qi1cKs0CLmYyy78IG5BUfjI+hcDUTX5275Nfj1UBid1DIhiQIpG7
 SmPE+u8akJ81xPJ0m541giYIMpnoSH5F2FpfdJjxF9gPo85tcf9gdrB5i5yuLmtsMBnh
 s0Vj/fPcHXqxXWg4Jx2MOJsu+9SM6DuC9v22CRJtpntdITfik1Vl3IQeXpPfFoZKvF2N
 fEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314881; x=1684906881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zK0ATTFS6tlkNM6OyhSTkXFnSXwh6GyYuYj0b65bkXQ=;
 b=YDY/lNNlDfVxhP/lK6DA3tmAhM4ycapkjsVmqLitmL18J0NQVjGGB2+5lbmsEiuebV
 QspCKajtL+Ht2LXiULxziykkNBnVq2GuxBb9MtgbRUH45xszqbJtPSqB2cUcCgtIXo3a
 S5pFL9i6obQ4++QiRgjCFH4jtMQoTSZWbXm9ZGX6jlVeqLDsEiDhfbdN6/szFfDNGkVL
 u2JshjU3eJlsBUgEQxWUjFAWcPgY9DQR5FQYR8JzRp55sDE0pTaAQblpvhoWO+yMbpCi
 HJvueRfG/clgvGx9SxRnB92FsWzReqVjmrfm1mLedrb1XmMGOGeCId8HdJWh/2JLride
 f0NQ==
X-Gm-Message-State: AAQBX9fJPV1vC64XPqy5xRnJq4GpX9/YVUR3NLBPmWK5Ch6CKlZohVmW
 uL5LF+rb1/NxZ141/EVxMtaZRaGpAOUf8UxaZDK+Bg==
X-Google-Smtp-Source: AKy350bc4DqETPU5Vf/oWJdhBUOKF2u1X5R5TPM6FMZCKmINV3Bhx0l1lxAE+qvJHIwZpbBtHProNw==
X-Received: by 2002:a1c:6a19:0:b0:3f1:929f:60db with SMTP id
 f25-20020a1c6a19000000b003f1929f60dbmr6138365wmc.39.1682314881447; 
 Sun, 23 Apr 2023 22:41:21 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 26/57] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
Date: Mon, 24 Apr 2023 06:40:34 +0100
Message-Id: <20230424054105.1579315-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The port currently does not support "oversize" guests, which
means riscv32 can only target 32-bit guests.  We will soon be
building TCG once for all guests.  This implies that we can
only support riscv64.

Since all Linux distributions target riscv64 not riscv32,
this is not much of a restriction and simplifies the code.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |   6 -
 tcg/riscv/tcg-target.h         |  22 ++--
 tcg/riscv/tcg-target.c.inc     | 206 ++++++++++-----------------------
 3 files changed, 72 insertions(+), 162 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index cf0ac4d751..c11710d117 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -13,18 +13,12 @@ C_O0_I1(r)
 C_O0_I2(LZ, L)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I3(LZ, L, L)
-C_O0_I3(LZ, LZ, L)
-C_O0_I4(LZ, LZ, L, L)
 C_O0_I4(rZ, rZ, rZ, rZ)
 C_O1_I1(r, L)
 C_O1_I1(r, r)
-C_O1_I2(r, L, L)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
 C_O1_I4(r, rZ, rZ, rZ, rZ)
-C_O2_I1(r, r, L)
-C_O2_I2(r, r, L, L)
 C_O2_I4(r, r, rZ, rZ, rM, rM)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 0deb33701f..dddf2486c1 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -25,11 +25,14 @@
 #ifndef RISCV_TCG_TARGET_H
 #define RISCV_TCG_TARGET_H
 
-#if __riscv_xlen == 32
-# define TCG_TARGET_REG_BITS 32
-#elif __riscv_xlen == 64
-# define TCG_TARGET_REG_BITS 64
+/*
+ * We don't support oversize guests.
+ * Since we will only build tcg once, this in turn requires a 64-bit host.
+ */
+#if __riscv_xlen != 64
+#error "unsupported code generation mode"
 #endif
+#define TCG_TARGET_REG_BITS 64
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
@@ -83,13 +86,8 @@ typedef enum {
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
-#if TCG_TARGET_REG_BITS == 32
-#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
-#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
-#else
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
-#endif
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
@@ -106,8 +104,8 @@ typedef enum {
 #define TCG_TARGET_HAS_sub2_i32         1
 #define TCG_TARGET_HAS_mulu2_i32        0
 #define TCG_TARGET_HAS_muls2_i32        0
-#define TCG_TARGET_HAS_muluh_i32        (TCG_TARGET_REG_BITS == 32)
-#define TCG_TARGET_HAS_mulsh_i32        (TCG_TARGET_REG_BITS == 32)
+#define TCG_TARGET_HAS_muluh_i32        0
+#define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_ext8s_i32        1
 #define TCG_TARGET_HAS_ext16s_i32       1
 #define TCG_TARGET_HAS_ext8u_i32        1
@@ -128,7 +126,6 @@ typedef enum {
 #define TCG_TARGET_HAS_setcond2         1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
-#if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_movcond_i64      0
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
@@ -165,7 +162,6 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
-#endif
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 266fe1433d..1edc3b1c4d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -137,15 +137,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define SOFTMMU_RESERVE_REGS  0
 #endif
 
-
-static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
-{
-    if (TCG_TARGET_REG_BITS == 32) {
-        return sextract32(val, pos, len);
-    } else {
-        return sextract64(val, pos, len);
-    }
-}
+#define sextreg  sextract64
 
 /* test if a constant matches the constraint */
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
@@ -235,7 +227,6 @@ typedef enum {
     OPC_XOR = 0x4033,
     OPC_XORI = 0x4013,
 
-#if TCG_TARGET_REG_BITS == 64
     OPC_ADDIW = 0x1b,
     OPC_ADDW = 0x3b,
     OPC_DIVUW = 0x200503b,
@@ -250,23 +241,6 @@ typedef enum {
     OPC_SRLIW = 0x501b,
     OPC_SRLW = 0x503b,
     OPC_SUBW = 0x4000003b,
-#else
-    /* Simplify code throughout by defining aliases for RV32.  */
-    OPC_ADDIW = OPC_ADDI,
-    OPC_ADDW = OPC_ADD,
-    OPC_DIVUW = OPC_DIVU,
-    OPC_DIVW = OPC_DIV,
-    OPC_MULW = OPC_MUL,
-    OPC_REMUW = OPC_REMU,
-    OPC_REMW = OPC_REM,
-    OPC_SLLIW = OPC_SLLI,
-    OPC_SLLW = OPC_SLL,
-    OPC_SRAIW = OPC_SRAI,
-    OPC_SRAW = OPC_SRA,
-    OPC_SRLIW = OPC_SRLI,
-    OPC_SRLW = OPC_SRL,
-    OPC_SUBW = OPC_SUB,
-#endif
 
     OPC_FENCE = 0x0000000f,
     OPC_NOP   = OPC_ADDI,   /* nop = addi r0,r0,0 */
@@ -500,7 +474,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     tcg_target_long lo, hi, tmp;
     int shift, ret;
 
-    if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
+    if (type == TCG_TYPE_I32) {
         val = (int32_t)val;
     }
 
@@ -511,7 +485,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     }
 
     hi = val - lo;
-    if (TCG_TARGET_REG_BITS == 32 || val == (int32_t)val) {
+    if (val == (int32_t)val) {
         tcg_out_opc_upper(s, OPC_LUI, rd, hi);
         if (lo != 0) {
             tcg_out_opc_imm(s, OPC_ADDIW, rd, rd, lo);
@@ -519,7 +493,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
         return;
     }
 
-    /* We can only be here if TCG_TARGET_REG_BITS != 32 */
     tmp = tcg_pcrel_diff(s, (void *)val);
     if (tmp == (int32_t)tmp) {
         tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
@@ -668,15 +641,15 @@ static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
                        TCGReg arg1, intptr_t arg2)
 {
-    bool is32bit = (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32);
-    tcg_out_ldst(s, is32bit ? OPC_LW : OPC_LD, arg, arg1, arg2);
+    RISCVInsn insn = type == TCG_TYPE_I32 ? OPC_LW : OPC_LD;
+    tcg_out_ldst(s, insn, arg, arg1, arg2);
 }
 
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
                        TCGReg arg1, intptr_t arg2)
 {
-    bool is32bit = (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32);
-    tcg_out_ldst(s, is32bit ? OPC_SW : OPC_SD, arg, arg1, arg2);
+    RISCVInsn insn = type == TCG_TYPE_I32 ? OPC_SW : OPC_SD;
+    tcg_out_ldst(s, insn, arg, arg1, arg2);
 }
 
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
@@ -853,20 +826,18 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     if (offset == sextreg(offset, 0, 20)) {
         /* short jump: -2097150 to 2097152 */
         tcg_out_opc_jump(s, OPC_JAL, link, offset);
-    } else if (TCG_TARGET_REG_BITS == 32 || offset == (int32_t)offset) {
+    } else if (offset == (int32_t)offset) {
         /* long jump: -2147483646 to 2147483648 */
         tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
         tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
         ret = reloc_call(s->code_ptr - 2, arg);
         tcg_debug_assert(ret == true);
-    } else if (TCG_TARGET_REG_BITS == 64) {
+    } else {
         /* far jump: 64-bit */
         tcg_target_long imm = sextreg((tcg_target_long)arg, 0, 12);
         tcg_target_long base = (tcg_target_long)arg - imm;
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
         tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, imm);
-    } else {
-        g_assert_not_reached();
     }
 }
 
@@ -942,9 +913,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* We don't support oversize guests */
-QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
-
 /* We expect to use a 12-bit negative offset from ENV.  */
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
@@ -956,8 +924,7 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_debug_assert(ok);
 }
 
-static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
-                               TCGReg addrh, MemOpIdx oi,
+static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, MemOpIdx oi,
                                tcg_insn_unit **label_ptr, bool is_load)
 {
     MemOp opc = get_memop(oi);
@@ -973,7 +940,7 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
 
-    tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addrl,
+    tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr,
                     TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
@@ -992,10 +959,10 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     /* Clear the non-page, non-alignment bits from the address.  */
     compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
     if (compare_mask == sextreg(compare_mask, 0, 12)) {
-        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addrl, compare_mask);
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr, compare_mask);
     } else {
         tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr);
     }
 
     /* Compare masked address with the TLB entry. */
@@ -1003,29 +970,26 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
-        addrl = TCG_REG_TMP0;
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, addr);
+        addr = TCG_REG_TMP0;
     }
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr);
     return TCG_REG_TMP0;
 }
 
 static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
-                                TCGType ext,
-                                TCGReg datalo, TCGReg datahi,
-                                TCGReg addrlo, TCGReg addrhi,
-                                void *raddr, tcg_insn_unit **label_ptr)
+                                TCGType data_type, TCGReg data_reg,
+                                TCGReg addr_reg, void *raddr,
+                                tcg_insn_unit **label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
-    label->type = ext;
-    label->datalo_reg = datalo;
-    label->datahi_reg = datahi;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
+    label->type = data_type;
+    label->datalo_reg = data_reg;
+    label->addrlo_reg = addr_reg;
     label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
 }
@@ -1039,11 +1003,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     TCGReg a2 = tcg_target_call_iarg_regs[2];
     TCGReg a3 = tcg_target_call_iarg_regs[3];
 
-    /* We don't support oversize guests */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        g_assert_not_reached();
-    }
-
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
@@ -1073,11 +1032,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     TCGReg a3 = tcg_target_call_iarg_regs[3];
     TCGReg a4 = tcg_target_call_iarg_regs[4];
 
-    /* We don't support oversize guests */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        g_assert_not_reached();
-    }
-
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
@@ -1146,7 +1100,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 #endif /* CONFIG_SOFTMMU */
 
-static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
+static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
                                    TCGReg base, MemOp opc, bool is_64)
 {
     /* Byte swapping is left to middle-end expansion. */
@@ -1154,37 +1108,28 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 
     switch (opc & (MO_SSIZE)) {
     case MO_UB:
-        tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
+        tcg_out_opc_imm(s, OPC_LBU, val, base, 0);
         break;
     case MO_SB:
-        tcg_out_opc_imm(s, OPC_LB, lo, base, 0);
+        tcg_out_opc_imm(s, OPC_LB, val, base, 0);
         break;
     case MO_UW:
-        tcg_out_opc_imm(s, OPC_LHU, lo, base, 0);
+        tcg_out_opc_imm(s, OPC_LHU, val, base, 0);
         break;
     case MO_SW:
-        tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
+        tcg_out_opc_imm(s, OPC_LH, val, base, 0);
         break;
     case MO_UL:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
-            tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
+        if (is_64) {
+            tcg_out_opc_imm(s, OPC_LWU, val, base, 0);
             break;
         }
         /* FALLTHRU */
     case MO_SL:
-        tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
+        tcg_out_opc_imm(s, OPC_LW, val, base, 0);
         break;
     case MO_UQ:
-        /* Prefer to load from offset 0 first, but allow for overlap.  */
-        if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
-        } else if (lo != base) {
-            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
-            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
-        } else {
-            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
-            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
-        }
+        tcg_out_opc_imm(s, OPC_LD, val, base, 0);
         break;
     default:
         g_assert_not_reached();
@@ -1193,8 +1138,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 
 static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 {
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
+    TCGReg addr_reg, data_reg;
     MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
@@ -1204,27 +1148,23 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
     TCGReg base;
 
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
+    data_reg = *args++;
+    addr_reg = *args++;
     oi = *args++;
     opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
-    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
-    add_qemu_ldst_label(s, 1, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
+    add_qemu_ldst_label(s, 1, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
+                        data_reg, addr_reg, s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    base = addr_regl;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    base = addr_reg;
+    if (TARGET_LONG_BITS == 32) {
         tcg_out_ext32u(s, TCG_REG_TMP0, base);
         base = TCG_REG_TMP0;
     }
@@ -1232,11 +1172,11 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
         base = TCG_REG_TMP0;
     }
-    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
 #endif
 }
 
-static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
+static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
                                    TCGReg base, MemOp opc)
 {
     /* Byte swapping is left to middle-end expansion. */
@@ -1244,21 +1184,16 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 
     switch (opc & (MO_SSIZE)) {
     case MO_8:
-        tcg_out_opc_store(s, OPC_SB, base, lo, 0);
+        tcg_out_opc_store(s, OPC_SB, base, val, 0);
         break;
     case MO_16:
-        tcg_out_opc_store(s, OPC_SH, base, lo, 0);
+        tcg_out_opc_store(s, OPC_SH, base, val, 0);
         break;
     case MO_32:
-        tcg_out_opc_store(s, OPC_SW, base, lo, 0);
+        tcg_out_opc_store(s, OPC_SW, base, val, 0);
         break;
     case MO_64:
-        if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_opc_store(s, OPC_SD, base, lo, 0);
-        } else {
-            tcg_out_opc_store(s, OPC_SW, base, lo, 0);
-            tcg_out_opc_store(s, OPC_SW, base, hi, 4);
-        }
+        tcg_out_opc_store(s, OPC_SD, base, val, 0);
         break;
     default:
         g_assert_not_reached();
@@ -1267,8 +1202,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 
 static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 {
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
+    TCGReg addr_reg, data_reg;
     MemOpIdx oi;
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
@@ -1278,27 +1212,23 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
     TCGReg base;
 
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
+    data_reg = *args++;
+    addr_reg = *args++;
     oi = *args++;
     opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
-    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
-    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
-    add_qemu_ldst_label(s, 0, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
+    tcg_out_qemu_st_direct(s, data_reg, base, opc);
+    add_qemu_ldst_label(s, 0, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
+                        data_reg, addr_reg, s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    base = addr_regl;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    base = addr_reg;
+    if (TARGET_LONG_BITS == 32) {
         tcg_out_ext32u(s, TCG_REG_TMP0, base);
         base = TCG_REG_TMP0;
     }
@@ -1306,7 +1236,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
         base = TCG_REG_TMP0;
     }
-    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    tcg_out_qemu_st_direct(s, data_reg, base, opc);
 #endif
 }
 
@@ -1755,19 +1685,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I4(r, rZ, rZ, rZ, rZ);
 
     case INDEX_op_qemu_ld_i32:
-        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
-    case INDEX_op_qemu_st_i32:
-        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
-                ? C_O0_I2(LZ, L) : C_O0_I3(LZ, L, L));
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O2_I1(r, r, L)
-               : C_O2_I2(r, r, L, L));
+        return C_O1_I1(r, L);
+    case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(LZ, L)
-               : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(LZ, LZ, L)
-               : C_O0_I4(LZ, LZ, L, L));
+        return C_O0_I2(LZ, L);
 
     default:
         g_assert_not_reached();
@@ -1843,9 +1765,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 static void tcg_target_init(TCGContext *s)
 {
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
-    if (TCG_TARGET_REG_BITS == 64) {
-        tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
-    }
+    tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
 
     tcg_target_call_clobber_regs = -1u;
     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S0);
-- 
2.34.1


