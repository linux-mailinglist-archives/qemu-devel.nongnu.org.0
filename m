Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A1643C2B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:20:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POd-0003Ld-V6; Mon, 05 Dec 2022 23:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POZ-0003Kv-1v
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:27 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POT-0006vg-Uz
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:24 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1322d768ba7so16082190fac.5
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+8aUePn9jH0yH6KjYmTxIPOGpU5cf4JO1tUTLjFLKY=;
 b=o/2kP2CaKlVWohGcwXspQwjW9o+boJ0T9KbqS55TQ4EzQGlE2eHhw/QTZLquQIQ5ov
 Uy6rN0xShpnlRxZhPqch86dfIZ9da49o9PgthtVuNpGQ1qeKHaX+2K5dmLAlYVR95jue
 luhH0j7izDh2fAUBWJJr9+aykKG24pwznmWdqAMaih37aHPQyJHxv4w7c10rGs8UPh6u
 6BmVxdCiq29fUknacPDPjmfcuiBhOyuxMCnXS2YqBX4c6lumGznFK2jxT1jKCrEsXz6+
 bxa38Kph+GaZx5xgZB/Makewu6WgGyRA47J6A1nmlKaQgbzZjDiS3rOuKndogd7Wpqd9
 YfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+8aUePn9jH0yH6KjYmTxIPOGpU5cf4JO1tUTLjFLKY=;
 b=NDNO//oyekWcQH70IGnfnYojv1NHCzA7oMhm06Bs/xrI1eLGRmXB15XJqlq/exBpPB
 SX++kqiuVi7RiTWENkGbK0JQmVbIMoKQFOTCkviHWf0Mmhuw1+yG/7eKNJlzbEGpv23R
 pCwOkjOaAC7xGj+kl8F450fUSB2pxJ6Lv2J3f4RN1T9riowq5zPyIdbJSU4789AaaHtM
 ujObvvPoMPl79JqDY0WhuZUji8UrszXgosy2oZdvMunnYdoguXYzy9163ETA8Y2XVs6A
 QX1nl7IsNCKOT93A/vTK6w1gGhzPydJziGXyM+Y163uhISlKt9inCrsrNpt3Ud2+HiyL
 Af9Q==
X-Gm-Message-State: ANoB5pmqnGhIkhEt0+oD0RR5lmLSMMCrNRkdBjrL8C8R0XkiO4a01ros
 VeFRB6fZBj7cNDiXsdSCVVZa/rDFKqUDaHiR2sU=
X-Google-Smtp-Source: AA0mqf7vYjxbwZNxunPl9RKkZL2PTKigK+1UmabnxWq0idUiMHF9Pjb8aHTkW6Jdw7SltsITvmP8AA==
X-Received: by 2002:a05:6870:d78a:b0:142:d310:2c9e with SMTP id
 bd10-20020a056870d78a00b00142d3102c9emr42517986oab.71.1670300240059; 
 Mon, 05 Dec 2022 20:17:20 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 01/22] tcg: Split out tcg_out_exit_tb
Date: Mon,  5 Dec 2022 22:16:54 -0600
Message-Id: <20221206041715.314209-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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

The INDEX_op_exit_tb opcode needs no register allocation.
Split out a dedicated helper function for it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     | 22 ++++++++++--------
 tcg/arm/tcg-target.c.inc         | 11 +++++----
 tcg/i386/tcg-target.c.inc        | 21 +++++++++--------
 tcg/loongarch64/tcg-target.c.inc | 22 ++++++++++--------
 tcg/mips/tcg-target.c.inc        | 33 +++++++++++++--------------
 tcg/ppc/tcg-target.c.inc         | 11 +++++----
 tcg/riscv/tcg-target.c.inc       | 22 ++++++++++--------
 tcg/s390x/tcg-target.c.inc       | 23 ++++++++++---------
 tcg/sparc64/tcg-target.c.inc     | 39 +++++++++++++++++---------------
 tcg/tci/tcg-target.c.inc         | 10 ++++----
 11 files changed, 121 insertions(+), 97 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 436fcf6ebd..b53961baf7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -107,6 +107,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -4302,6 +4303,9 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
         case INDEX_op_call:
             tcg_reg_alloc_call(s, op);
             break;
+        case INDEX_op_exit_tb:
+            tcg_out_exit_tb(s, op->args[0]);
+            break;
         case INDEX_op_dup2_vec:
             if (tcg_reg_alloc_dup2(s, op)) {
                 break;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 344b63e20f..16c5e33b69 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1886,6 +1886,17 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 
 static const tcg_insn_unit *tb_ret_addr;
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
+{
+    /* Reuse the zeroing that exists for goto_ptr.  */
+    if (a0 == 0) {
+        tcg_out_goto_long(s, tcg_code_gen_epilogue);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X0, a0);
+        tcg_out_goto_long(s, tb_ret_addr);
+    }
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1905,16 +1916,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 #define REG0(I)  (const_args[I] ? TCG_REG_XZR : (TCGReg)args[I])
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        /* Reuse the zeroing that exists for goto_ptr.  */
-        if (a0 == 0) {
-            tcg_out_goto_long(s, tcg_code_gen_epilogue);
-        } else {
-            tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X0, a0);
-            tcg_out_goto_long(s, tb_ret_addr);
-        }
-        break;
-
     case INDEX_op_goto_tb:
         tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
         /*
@@ -2304,6 +2305,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2c6c353eea..e5c2eae5a5 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1927,6 +1927,12 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 
 static void tcg_out_epilogue(TCGContext *s);
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
+{
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, arg);
+    tcg_out_epilogue(s);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1935,10 +1941,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c;
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, args[0]);
-        tcg_out_epilogue(s);
-        break;
     case INDEX_op_goto_tb:
         {
             /* Indirect jump method */
@@ -2250,6 +2252,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cb04e4b3ad..5c20bedd20 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2346,6 +2346,17 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 }
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
+{
+    /* Reuse the zeroing that exists for goto_ptr.  */
+    if (a0 == 0) {
+        tcg_out_jmp(s, tcg_code_gen_epilogue);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_EAX, a0);
+        tcg_out_jmp(s, tb_ret_addr);
+    }
+}
+
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                               const TCGArg args[TCG_MAX_OP_ARGS],
                               const int const_args[TCG_MAX_OP_ARGS])
@@ -2370,15 +2381,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     const_a2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        /* Reuse the zeroing that exists for goto_ptr.  */
-        if (a0 == 0) {
-            tcg_out_jmp(s, tcg_code_gen_epilogue);
-        } else {
-            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_EAX, a0);
-            tcg_out_jmp(s, tb_ret_addr);
-        }
-        break;
     case INDEX_op_goto_tb:
         if (s->tb_jmp_insn_offset) {
             /* direct jump method */
@@ -2793,6 +2795,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d326e28740..41fc5ffa91 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1067,6 +1067,17 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 
 static const tcg_insn_unit *tb_ret_addr;
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
+{
+    /* Reuse the zeroing that exists for goto_ptr.  */
+    if (a0 == 0) {
+        tcg_out_call_int(s, tcg_code_gen_epilogue, true);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
+        tcg_out_call_int(s, tb_ret_addr, true);
+    }
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1077,16 +1088,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        /* Reuse the zeroing that exists for goto_ptr.  */
-        if (a0 == 0) {
-            tcg_out_call_int(s, tcg_code_gen_epilogue, true);
-        } else {
-            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
-            tcg_out_call_int(s, tb_ret_addr, true);
-        }
-        break;
-
     case INDEX_op_goto_tb:
         tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
         /*
@@ -1499,6 +1500,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index bd76f0c97f..819648b100 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1950,6 +1950,21 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
     }
 }
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
+{
+    TCGReg b0 = TCG_REG_ZERO;
+
+    if (a0 & ~0xffff) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_V0, a0 & ~0xffff);
+        b0 = TCG_REG_V0;
+    }
+    if (!tcg_out_opc_jmp(s, OPC_J, tb_ret_addr)) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0, (uintptr_t)tb_ret_addr);
+        tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
+    }
+    tcg_out_opc_imm(s, OPC_ORI, TCG_REG_V0, b0, a0 & 0xffff);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1969,23 +1984,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        {
-            TCGReg b0 = TCG_REG_ZERO;
-
-            a0 = (intptr_t)a0;
-            if (a0 & ~0xffff) {
-                tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_V0, a0 & ~0xffff);
-                b0 = TCG_REG_V0;
-            }
-            if (!tcg_out_opc_jmp(s, OPC_J, tb_ret_addr)) {
-                tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0,
-                             (uintptr_t)tb_ret_addr);
-                tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
-            }
-            tcg_out_opc_imm(s, OPC_ORI, TCG_REG_V0, b0, a0 & 0xffff);
-        }
-        break;
     case INDEX_op_goto_tb:
         /* indirect jump method */
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
@@ -2402,6 +2400,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e3dba47697..186599dae0 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2616,6 +2616,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out32(s, BCLR | BO_ALWAYS);
 }
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
+{
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, arg);
+    tcg_out_b(s, 0, tcg_code_gen_epilogue);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -2623,10 +2629,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGArg a0, a1, a2;
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R3, args[0]);
-        tcg_out_b(s, 0, tcg_code_gen_epilogue);
-        break;
     case INDEX_op_goto_tb:
         if (s->tb_jmp_insn_offset) {
             /* Direct jump. */
@@ -3185,6 +3187,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:   /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:      /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:   /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..1381c835af 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1264,6 +1264,17 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 
 static const tcg_insn_unit *tb_ret_addr;
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
+{
+    /* Reuse the zeroing that exists for goto_ptr.  */
+    if (a0 == 0) {
+        tcg_out_call_int(s, tcg_code_gen_epilogue, true);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
+        tcg_out_call_int(s, tb_ret_addr, true);
+    }
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1274,16 +1285,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        /* Reuse the zeroing that exists for goto_ptr.  */
-        if (a0 == 0) {
-            tcg_out_call_int(s, tcg_code_gen_epilogue, true);
-        } else {
-            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
-            tcg_out_call_int(s, tb_ret_addr, true);
-        }
-        break;
-
     case INDEX_op_goto_tb:
         assert(s->tb_jmp_insn_offset == 0);
         /* indirect jump method */
@@ -1592,6 +1593,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 33becd7694..9568452773 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2070,6 +2070,17 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 #endif
 }
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
+{
+    /* Reuse the zeroing that exists for goto_ptr.  */
+    if (a0 == 0) {
+        tgen_gotoi(s, S390_CC_ALWAYS, tcg_code_gen_epilogue);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R2, a0);
+        tgen_gotoi(s, S390_CC_ALWAYS, tb_ret_addr);
+    }
+}
+
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_,x),_i32): \
         case glue(glue(INDEX_op_,x),_i64)
@@ -2082,17 +2093,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGArg a0, a1, a2;
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        /* Reuse the zeroing that exists for goto_ptr.  */
-        a0 = args[0];
-        if (a0 == 0) {
-            tgen_gotoi(s, S390_CC_ALWAYS, tcg_code_gen_epilogue);
-        } else {
-            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R2, a0);
-            tgen_gotoi(s, S390_CC_ALWAYS, tb_ret_addr);
-        }
-        break;
-
     case INDEX_op_goto_tb:
         a0 = args[0];
         if (s->tb_jmp_insn_offset) {
@@ -2661,6 +2661,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index cb9453efdd..1e3351a4e8 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1427,6 +1427,26 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 #endif /* CONFIG_SOFTMMU */
 }
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
+{
+    if (check_fit_ptr(a0, 13)) {
+        tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
+        tcg_out_movi_imm13(s, TCG_REG_O0, a0);
+        return;
+    } else if (USE_REG_TB) {
+        intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
+        if (check_fit_ptr(tb_diff, 13)) {
+            tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
+            /* Note that TCG_REG_TB has been unwound to O1.  */
+            tcg_out_arithi(s, TCG_REG_O0, TCG_REG_O1, tb_diff, ARITH_ADD);
+            return;
+        }
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_I0, a0 & ~0x3ff);
+    tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
+    tcg_out_arithi(s, TCG_REG_O0, TCG_REG_O0, a0 & 0x3ff, ARITH_OR);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1441,24 +1461,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     c2 = const_args[2];
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        if (check_fit_ptr(a0, 13)) {
-            tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
-            tcg_out_movi_imm13(s, TCG_REG_O0, a0);
-            break;
-        } else if (USE_REG_TB) {
-            intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
-            if (check_fit_ptr(tb_diff, 13)) {
-                tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
-                /* Note that TCG_REG_TB has been unwound to O1.  */
-                tcg_out_arithi(s, TCG_REG_O0, TCG_REG_O1, tb_diff, ARITH_ADD);
-                break;
-            }
-        }
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_I0, a0 & ~0x3ff);
-        tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
-        tcg_out_arithi(s, TCG_REG_O0, TCG_REG_O0, a0 & 0x3ff, ARITH_OR);
-        break;
     case INDEX_op_goto_tb:
         if (s->tb_jmp_insn_offset) {
             /* direct jump method */
@@ -1715,6 +1717,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f3d7441e06..34583a3499 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -593,6 +593,11 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
 # define CASE_64(x)
 #endif
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
+{
+    tcg_out_op_p(s, INDEX_op_exit_tb, (void *)arg);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -600,10 +605,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGOpcode exts;
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        tcg_out_op_p(s, opc, (void *)args[0]);
-        break;
-
     case INDEX_op_goto_tb:
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
         /* indirect jump method. */
@@ -782,6 +783,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
-- 
2.34.1


