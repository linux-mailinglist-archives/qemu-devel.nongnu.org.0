Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A6661C19
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:48:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBi-0000kl-Ag; Sun, 08 Jan 2023 20:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBf-0000jU-No
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:55 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBd-0001VS-6Y
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:55 -0500
Received: by mail-pj1-x1032.google.com with SMTP id q64so7259202pjq.4
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CqxByOMVMdC4CXnPg+/kztWxcoqpr3Xu2ZWLOOcXjkI=;
 b=Lm44J9ifzkzsi4OiX/5YiVz9znpUnfrqz/YXBXng0/t/lBqEWJzEHhD1ejBW8mOrGE
 uxrOJmsaiAHbl6UZ721edLJ9HvW3cDKMFnXP1KuLOxZXxb0fWbyTDvYoduXJd4rPAySB
 sjBrXjhWxeslosK2b4Ij8KwhVouqOJFq8gLdP25J6hM0aNeFn9rrn5kj7vNYCEalBMFk
 C5vrOBkpZflwYmJcpFmrAPtu6rFDidyreOD9g1CtIbVO5CSYalL4ioLfthYMhnorYNoF
 y7J3WFqFVSN/GOcxVq9hFW/NF4VA/Qi8mX86Q66hGzqCg9rIs+D+Ljo234iAbm6mdGv3
 Mi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CqxByOMVMdC4CXnPg+/kztWxcoqpr3Xu2ZWLOOcXjkI=;
 b=nf2yFss7vrSy+cnhq7PkiStBASH6ITKNhJERhaNj1thiZigR/uvzzf6MnMZQ3xl4Zt
 plK7kS1LdtCZ47BYyPukN7OdjiQcSJzi9Rez9Txp/HHTPHoiCawdXPkSB6kf9TQykS8+
 +RN1/xPLzGA+KwNFyHSZn03ngK0o6S24oU9eJB7gXu1rWIztXbYS4u5JMe9VuSp2eS4S
 /HfQuvKoeuJu0YUVQ3lrnRAK/+Kz0RwRUEuN08hkMj+Vnil2gJcaU1w6olaTIuoerFQm
 6wOTPgaUp9vawFQCiMA+kftEEKJjfXWcaKmn3/zlcDoTnAIEsbQguPCI+kvBxmU9Bvbc
 +oaw==
X-Gm-Message-State: AFqh2kqIeqP2uxZic8TQKewKNZZflSITRjGDKCYBH4IeGWutvy95a+0Y
 sekpW/A0d94Yf0n3f2Qh8BiQ3OIT5QbXiO2N
X-Google-Smtp-Source: AMrXdXtcU3RClbpknS9LapTpipSvUdnFUrOqb7Lro2m9VbexrqzZzQGDQfO2qDtzPoSSTSQWAtmSig==
X-Received: by 2002:a17:902:ed8b:b0:193:1f23:2966 with SMTP id
 e11-20020a170902ed8b00b001931f232966mr5818910plj.59.1673228571579; 
 Sun, 08 Jan 2023 17:42:51 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/22] tcg: Split out tcg_out_exit_tb
Date: Sun,  8 Jan 2023 17:42:27 -0800
Message-Id: <20230109014248.2894281-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index da91779890..fa1c7fdacd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -103,6 +103,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -4716,6 +4717,9 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
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
index ad1816e32d..501b77c215 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1887,6 +1887,17 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 
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
@@ -1906,16 +1917,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2305,6 +2306,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9245ea86d0..799cf13536 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1933,6 +1933,12 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 
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
@@ -1941,10 +1947,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c;
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, args[0]);
-        tcg_out_epilogue(s);
-        break;
     case INDEX_op_goto_tb:
         {
             /* Indirect jump method */
@@ -2256,6 +2258,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 58bd5873f5..feb257db01 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2347,6 +2347,17 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
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
@@ -2371,15 +2382,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2794,6 +2796,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index c9e99e8ec3..29e4bfcb49 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1068,6 +1068,17 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 
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
@@ -1078,16 +1089,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -1500,6 +1501,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 292e490b5c..52881abd35 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1951,6 +1951,21 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
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
@@ -1970,23 +1985,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2403,6 +2401,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e0621463f6..a95e4001d3 100644
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
index f741e0582d..9b42cb4b2e 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1289,6 +1289,17 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 
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
@@ -1299,16 +1310,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -1617,6 +1618,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 2b38fd991d..48a0c3e3c0 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1944,6 +1944,17 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
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
@@ -1956,17 +1967,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
         /*
@@ -2619,6 +2619,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index eb913f33c8..d2d8b46815 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1428,6 +1428,26 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
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
@@ -1442,24 +1462,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -1716,6 +1718,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d36a7ebdd1..2f3bcce3a7 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -590,6 +590,11 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
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
@@ -597,10 +602,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGOpcode exts;
 
     switch (opc) {
-    case INDEX_op_exit_tb:
-        tcg_out_op_p(s, opc, (void *)args[0]);
-        break;
-
     case INDEX_op_goto_tb:
         tcg_debug_assert(s->tb_jmp_insn_offset == 0);
         /* indirect jump method. */
@@ -779,6 +780,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     default:
         tcg_abort();
     }
-- 
2.34.1


