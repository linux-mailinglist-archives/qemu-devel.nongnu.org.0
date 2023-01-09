Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA11661C11
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:44:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBo-0000np-6p; Sun, 08 Jan 2023 20:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBl-0000mv-PG
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:01 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBi-0001XH-OJ
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:01 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso7810142pjo.3
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4TcKh31DNw4WagwpYMOY3ScxJfjNPX31WmXPY4VoCM=;
 b=e6k3n2XLgQYO3VrWuKN3JdBkkM8xtzZtY9mk+F/E6HiNS+T4qUjumz3dBFqganXDiT
 K43Gy6zelUWkAANJ7VLt3fTw6TkwlEgmQwc0wX72JWDhH5y1O+J4o4LUg5OANICXAdjX
 SoV3Qe8gTL9AHHlKzz+7caXT50ylXHW413DiU4/gi0BspUTj2w6G0Je3d8ch5K1PErcM
 wyxDsZjCF6D05YXH5YjS/Mz2+9SJ8FdYENIutmEZrgDEMy7XdIPJzkPPLFdRVnhbNrEi
 LBG2H75zTm8H72IWtAvKqe1YWSfJKMFq3ZjEgR5neCGc2wfiyWuMCdVoyGjKrdGaifh6
 9zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4TcKh31DNw4WagwpYMOY3ScxJfjNPX31WmXPY4VoCM=;
 b=CDiPlmyBFsk5PkuFKYfQbmKQjcrhfgMd5pW92XbtTH2Ud8z3SatAT2LO9uRLt/W6kx
 2igaqx9gPCt8Ajyfnda5+KDVgzx/xlgttJk3DshlnfeYRgbL+7A8+ShN2K0kAwkAdMdk
 xr9to4+ojBWdQ5LZrzbeeXyqKd0/fmmzOm3YYBF06vJAkWGThFPDAkpBaQYz2hx0I/1p
 gpTDfjhFIaFm+vWqmOnsz4R4ZD1Co7opquC7KPkskz9+CnU+Y46cPdNH7FFmKvn/sTlR
 IBMRIlEjJPVriKywyKxjLz36Tr6zAxNt64Pv4ne5Fg3teaFAYGjuYwRuP4/ga8ARdn5D
 r3/Q==
X-Gm-Message-State: AFqh2kosnky3EbkWYExGMdl2nhGZLsSzLCAsVi1P0fcAJ7S7Hx19w5ou
 s5k9rHWZ103M6eaa7VPIPFKzKQkWu4qpClW2
X-Google-Smtp-Source: AMrXdXvKZZH69F8MM/wt7dbNTr5e0YqMX1I/qB5H7bBOFgieKZ1RoEzUnhe11/xrD8CL+UEBdlgo6g==
X-Received: by 2002:a17:902:d386:b0:192:68e8:c60c with SMTP id
 e6-20020a170902d38600b0019268e8c60cmr55743745pld.31.1673228577273; 
 Sun, 08 Jan 2023 17:42:57 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/22] tcg: Split out tcg_out_goto_tb
Date: Sun,  8 Jan 2023 17:42:34 -0800
Message-Id: <20230109014248.2894281-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

The INDEX_op_goto_tb opcode needs no register allocation.
Split out a dedicated helper function for it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++
 tcg/aarch64/tcg-target.c.inc     | 40 ++++++++++---------
 tcg/arm/tcg-target.c.inc         | 49 ++++++++++++-----------
 tcg/i386/tcg-target.c.inc        | 33 ++++++++--------
 tcg/loongarch64/tcg-target.c.inc | 38 +++++++++---------
 tcg/mips/tcg-target.c.inc        | 21 +++++-----
 tcg/ppc/tcg-target.c.inc         | 52 ++++++++++++------------
 tcg/riscv/tcg-target.c.inc       | 20 +++++-----
 tcg/s390x/tcg-target.c.inc       | 31 ++++++++-------
 tcg/sparc64/tcg-target.c.inc     | 68 +++++++++++++++++---------------
 tcg/tci/tcg-target.c.inc         | 16 ++++----
 11 files changed, 199 insertions(+), 173 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index f59f0bfe39..467604efa3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -104,6 +104,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
+static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -4739,6 +4740,9 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
         case INDEX_op_exit_tb:
             tcg_out_exit_tb(s, op->args[0]);
             break;
+        case INDEX_op_goto_tb:
+            tcg_out_goto_tb(s, op->args[0]);
+            break;
         case INDEX_op_dup2_vec:
             if (tcg_reg_alloc_dup2(s, op)) {
                 break;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 59e6a08e93..ad35bee8af 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1898,6 +1898,26 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /*
+     * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
+     * write can be used to patch the target address.
+     */
+    if ((uintptr_t)s->code_ptr & 7) {
+        tcg_out32(s, NOP);
+    }
+    set_jmp_insn_offset(s, which);
+    /*
+     * actual branch destination will be patched by
+     * tb_target_set_jmp_target later
+     */
+    tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
+    tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
+    tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1917,25 +1937,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 #define REG0(I)  (const_args[I] ? TCG_REG_XZR : (TCGReg)args[I])
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /*
-         * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
-         * write can be used to patch the target address.
-         */
-        if ((uintptr_t)s->code_ptr & 7) {
-            tcg_out32(s, NOP);
-        }
-        set_jmp_insn_offset(s, a0);
-        /*
-         * actual branch destination will be patched by
-         * tb_target_set_jmp_target later
-         */
-        tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
-        tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
-        tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
-        set_jmp_reset_offset(s, a0);
-        break;
-
     case INDEX_op_goto_ptr:
         tcg_out_insn(s, 3207, BR, a0);
         break;
@@ -2306,6 +2307,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 83b6d77e2e..b8f3b0c634 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1939,6 +1939,31 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
     tcg_out_epilogue(s);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* Indirect jump method */
+    intptr_t ptr, dif, dil;
+    TCGReg base = TCG_REG_PC;
+
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    ptr = get_jmp_target_addr(s, which);
+    dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
+    dil = sextract32(dif, 0, 12);
+    if (dif != dil) {
+        /*
+         * The TB is close, but outside the 12 bits addressable by
+         * the load.  We can extend this to 20 bits with a sub of a
+         * shifted immediate from pc.  In the vastly unlikely event
+         * the code requires more than 1MB, we'll use 2 insns and
+         * be no worse off.
+         */
+        base = TCG_REG_R0;
+        tcg_out_movi32(s, COND_AL, base, ptr - dil);
+    }
+    tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, base, dil);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1947,29 +1972,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        {
-            /* Indirect jump method */
-            intptr_t ptr, dif, dil;
-            TCGReg base = TCG_REG_PC;
-
-            qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-            ptr = get_jmp_target_addr(s, args[0]);
-            dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
-            dil = sextract32(dif, 0, 12);
-            if (dif != dil) {
-                /* The TB is close, but outside the 12 bits addressable by
-                   the load.  We can extend this to 20 bits with a sub of a
-                   shifted immediate from pc.  In the vastly unlikely event
-                   the code requires more than 1MB, we'll use 2 insns and
-                   be no worse off.  */
-                base = TCG_REG_R0;
-                tcg_out_movi32(s, COND_AL, base, ptr - dil);
-            }
-            tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, base, dil);
-            set_jmp_reset_offset(s, args[0]);
-        }
-        break;
     case INDEX_op_goto_ptr:
         tcg_out_b_reg(s, COND_AL, args[0]);
         break;
@@ -2259,6 +2261,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6fb40fe8ba..33c4139730 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2358,6 +2358,22 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /*
+     * Jump displacement must be aligned for atomic patching;
+     * see if we need to add extra nops before jump
+     */
+    int gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
+    if (gap != 1) {
+        tcg_out_nopn(s, gap - 1);
+    }
+    tcg_out8(s, OPC_JMP_long); /* jmp im */
+    set_jmp_insn_offset(s, which);
+    tcg_out32(s, 0);
+    set_jmp_reset_offset(s, which);
+}
+
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                               const TCGArg args[TCG_MAX_OP_ARGS],
                               const int const_args[TCG_MAX_OP_ARGS])
@@ -2382,22 +2398,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     const_a2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        {
-            /*
-             * Jump displacement must be aligned for atomic patching;
-             * see if we need to add extra nops before jump
-             */
-            int gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
-            if (gap != 1) {
-                tcg_out_nopn(s, gap - 1);
-            }
-            tcg_out8(s, OPC_JMP_long); /* jmp im */
-            set_jmp_insn_offset(s, a0);
-            tcg_out32(s, 0);
-        }
-        set_jmp_reset_offset(s, a0);
-        break;
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, a0);
@@ -2792,6 +2792,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index bce7340604..25de7a9ee0 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1079,6 +1079,25 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /*
+     * Ensure that patch area is 8-byte aligned so that an
+     * atomic write can be used to patch the target address.
+     */
+    if ((uintptr_t)s->code_ptr & 7) {
+        tcg_out_nop(s);
+    }
+    set_jmp_insn_offset(s, which);
+    /*
+     * actual branch destination will be patched by
+     * tb_target_set_jmp_target later
+     */
+    tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
+    tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1089,24 +1108,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /*
-         * Ensure that patch area is 8-byte aligned so that an
-         * atomic write can be used to patch the target address.
-         */
-        if ((uintptr_t)s->code_ptr & 7) {
-            tcg_out_nop(s);
-        }
-        set_jmp_insn_offset(s, a0);
-        /*
-         * actual branch destination will be patched by
-         * tb_target_set_jmp_target later
-         */
-        tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
-        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
-        set_jmp_reset_offset(s, a0);
-        break;
-
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
@@ -1501,6 +1502,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index c30173ab64..e54df4128b 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1966,6 +1966,17 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     tcg_out_opc_imm(s, OPC_ORI, TCG_REG_V0, b0, a0 & 0xffff);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* indirect jump method */
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
+               get_jmp_target_addr(s, which));
+    tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
+    tcg_out_nop(s);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1985,15 +1996,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /* indirect jump method */
-        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                   get_jmp_target_addr(s, a0));
-        tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
-        tcg_out_nop(s);
-        set_jmp_reset_offset(s, a0);
-        break;
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_opc_reg(s, OPC_JR, 0, a0, 0);
@@ -2402,6 +2404,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index dbe8ccd353..e56f86c613 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2622,6 +2622,32 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
     tcg_out_b(s, 0, tcg_code_gen_epilogue);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* Direct jump. */
+    if (TCG_TARGET_REG_BITS == 64) {
+        /* Ensure the next insns are 8 or 16-byte aligned. */
+        while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
+            tcg_out32(s, NOP);
+        }
+        set_jmp_insn_offset(s, which);
+        tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
+        tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
+        tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
+        tcg_out32(s, BCCTR | BO_ALWAYS);
+        set_jmp_reset_offset(s, which);
+        if (USE_REG_TB) {
+            /* For the unlinked case, need to reset TCG_REG_TB.  */
+            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
+                             -tcg_current_code_size(s));
+        }
+    } else {
+        set_jmp_insn_offset(s, which);
+        tcg_out32(s, B);
+        set_jmp_reset_offset(s, which);
+    }
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -2629,31 +2655,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGArg a0, a1, a2;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /* Direct jump. */
-        if (TCG_TARGET_REG_BITS == 64) {
-            /* Ensure the next insns are 8 or 16-byte aligned. */
-            while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
-                tcg_out32(s, NOP);
-            }
-            set_jmp_insn_offset(s, args[0]);
-            tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-        } else {
-            set_jmp_insn_offset(s, args[0]);
-            tcg_out32(s, B);
-            set_jmp_reset_offset(s, args[0]);
-            break;
-        }
-        tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
-        tcg_out32(s, BCCTR | BO_ALWAYS);
-        set_jmp_reset_offset(s, args[0]);
-        if (USE_REG_TB) {
-            /* For the unlinked case, need to reset TCG_REG_TB.  */
-            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
-                             -tcg_current_code_size(s));
-        }
-        break;
     case INDEX_op_goto_ptr:
         tcg_out32(s, MTSPR | RS(args[0]) | CTR);
         if (USE_REG_TB) {
@@ -3181,6 +3182,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:      /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:   /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:   /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 5b2eac6ab8..ee6759f787 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1300,6 +1300,16 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    /* indirect jump method */
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+               get_jmp_target_addr(s, which));
+    tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1310,15 +1320,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-        /* indirect jump method */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   get_jmp_target_addr(s, a0));
-        tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
-        set_jmp_reset_offset(s, a0);
-        break;
-
     case INDEX_op_goto_ptr:
         tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, a0, 0);
         break;
@@ -1619,6 +1620,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c234347d6a..e008f0efcc 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1955,6 +1955,21 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     }
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /*
+     * Branch displacement must be aligned for atomic patching;
+     * see if we need to add extra nop before branch
+     */
+    if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
+        tcg_out16(s, NOP);
+    }
+    tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
+    set_jmp_insn_offset(s, which);
+    s->code_ptr += 2;
+    set_jmp_reset_offset(s, which);
+}
+
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_,x),_i32): \
         case glue(glue(INDEX_op_,x),_i64)
@@ -1967,21 +1982,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGArg a0, a1, a2;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        a0 = args[0];
-        /*
-         * branch displacement must be aligned for atomic patching;
-         * see if we need to add extra nop before branch
-         */
-        if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
-            tcg_out16(s, NOP);
-        }
-        tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
-        set_jmp_insn_offset(s, a0);
-        s->code_ptr += 2;
-        set_jmp_reset_offset(s, a0);
-        break;
-
     case INDEX_op_goto_ptr:
         a0 = args[0];
         tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, a0);
@@ -2620,6 +2620,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index c3109fe51b..594767ded8 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1437,6 +1437,41 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
     tcg_out_arithi(s, TCG_REG_O0, TCG_REG_O0, a0 & 0x3ff, ARITH_OR);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* Direct jump. */
+    if (USE_REG_TB) {
+        /* make sure the patch is 8-byte aligned.  */
+        if ((intptr_t)s->code_ptr & 4) {
+            tcg_out_nop(s);
+        }
+        set_jmp_insn_offset(s, which);
+        tcg_out_sethi(s, TCG_REG_T1, 0);
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
+        tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
+        tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
+    } else {
+        set_jmp_insn_offset(s, which);
+        tcg_out32(s, CALL);
+        tcg_out_nop(s);
+    }
+    set_jmp_reset_offset(s, which);
+
+    /*
+     * For the unlinked path of goto_tb, we need to reset TCG_REG_TB
+     * to the beginning of this TB.
+     */
+    if (USE_REG_TB) {
+        int c = -tcg_current_code_size(s);
+        if (check_fit_i32(c, 13)) {
+            tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
+            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
+        }
+    }
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1451,38 +1486,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        /* Direct jump. */
-        if (USE_REG_TB) {
-            /* make sure the patch is 8-byte aligned.  */
-            if ((intptr_t)s->code_ptr & 4) {
-                tcg_out_nop(s);
-            }
-            set_jmp_insn_offset(s, a0);
-            tcg_out_sethi(s, TCG_REG_T1, 0);
-            tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-            tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
-        } else {
-            set_jmp_insn_offset(s, a0);
-            tcg_out32(s, CALL);
-            tcg_out_nop(s);
-        }
-        set_jmp_reset_offset(s, a0);
-
-        /* For the unlinked path of goto_tb, we need to reset
-           TCG_REG_TB to the beginning of this TB.  */
-        if (USE_REG_TB) {
-            c = -tcg_current_code_size(s);
-            if (check_fit_i32(c, 13)) {
-                tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
-            } else {
-                tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
-                tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB,
-                              TCG_REG_T1, ARITH_ADD);
-            }
-        }
-        break;
     case INDEX_op_goto_ptr:
         tcg_out_arithi(s, TCG_REG_G0, a0, 0, JMPL);
         if (USE_REG_TB) {
@@ -1701,6 +1704,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 59daffc0a0..f2ac356900 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -595,6 +595,14 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
     tcg_out_op_p(s, INDEX_op_exit_tb, (void *)arg);
 }
 
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
+    /* indirect jump method. */
+    tcg_out_op_p(s, INDEX_op_goto_tb, (void *)get_jmp_target_addr(s, which));
+    set_jmp_reset_offset(s, which);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -602,13 +610,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGOpcode exts;
 
     switch (opc) {
-    case INDEX_op_goto_tb:
-        qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-        /* indirect jump method. */
-        tcg_out_op_p(s, opc, (void *)get_jmp_target_addr(s, args[0]));
-        set_jmp_reset_offset(s, args[0]);
-        break;
-
     case INDEX_op_goto_ptr:
         tcg_out_op_r(s, opc, args[0]);
         break;
@@ -781,6 +782,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
+    case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     default:
         tcg_abort();
     }
-- 
2.34.1


