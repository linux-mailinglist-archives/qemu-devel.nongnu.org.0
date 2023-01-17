Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9542E670CD6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6m-0003RL-2E; Tue, 17 Jan 2023 18:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6c-0003Kb-8G
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:03 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6Z-0001IK-Ix
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:01 -0500
Received: by mail-pf1-x432.google.com with SMTP id 20so19380741pfu.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8wMoUjSQb8q9lMQqBy8GxRX2Cf83FgHO7nW/w0mZgU=;
 b=amoWCTwmjgWbtqFW5QkGatEhg3iUWSZRO7nroG98nOP6ONrVOqmQTY9DZ8WIVVxSY0
 FLu8gG1YP0aL8A+VFXiMO19Qx5nZEhzm1O0y0P6MWx+hWDbGKTWJXDEYPYjxExhujkw5
 Epck735b4CLdDOPsgjo86hOnR6WTa1v3BGmn6HloxoVFrBg35lYeo+61byryzvhvR7VU
 c17kDvy6t2aSl+w/yYsQ1nAJLgI8JPLfaHJayJyJO6n/ZhILREzOfjIzXS1tHehxQKx3
 PN77zSPv5JP2mXcL7sn0CWH8za9CUnYKOU9POANVoKxNDFvH59XqFfyuexKY+zbvSWYC
 Recw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8wMoUjSQb8q9lMQqBy8GxRX2Cf83FgHO7nW/w0mZgU=;
 b=tJuMZm578UC6vW8KFBU81tM+4yt4fxV0UCKvBpFrLiaCG6IpqY2a5CEouFmS7eOGAd
 qvYH447OYEZhqQo7qELVymgpcBUGstqy2x6OqozGKt/cb9GGz5D61aKAOl53vgfFEcqF
 +iHKtRZk5PO2VaAXkOaIfCci9yABxmgMMlSZJQ7hgEy30cACdfVPzckRleVMnOFCwoWQ
 FYSVErxPG6mFXMZLQ9x1qq1K15qgaXhXUe7wAG67vWb+75Hw60CN1mvIKg/D5ZM6ykGN
 6rOZAMnKQxKEqm/OctJ3vi+n3TEYGqN4+TDT1/W2HmVmi6aFhF6JaxdwK2RGDQE1gRPv
 R0lQ==
X-Gm-Message-State: AFqh2ko2pvlu1x/LpJeWoES6/ilDNkLiGamTz+SUn18X7TZ4OHm5XgN4
 dj7ugdh/Iyr3wO9XLKTr7Z6yS2MibumUCCpo
X-Google-Smtp-Source: AMrXdXu62Gtwav3Q1vOwFz3+DGEQoZTgnyjnWrjBIsPTrh3Sqh0gox9V5adcQbAln/1tQSFtJ4y+CA==
X-Received: by 2002:a05:6a00:4c0b:b0:58d:bffa:db25 with SMTP id
 ea11-20020a056a004c0b00b0058dbffadb25mr7116975pfb.19.1673997056839; 
 Tue, 17 Jan 2023 15:10:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:10:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/22] tcg: Split out tcg_out_exit_tb
Date: Tue, 17 Jan 2023 13:10:30 -1000
Message-Id: <20230117231051.354444-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index 9b7df71e7a..257479337c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -104,6 +104,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -4718,6 +4719,9 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
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


