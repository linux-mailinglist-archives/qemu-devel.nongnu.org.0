Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B506EBE87
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:21:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWpc-0004Me-E0; Sun, 23 Apr 2023 06:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWpL-0004EJ-SM
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp2-0003ES-Q0
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so34773195e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245195; x=1684837195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Dlk8ZxPJU6DU0wHPDCgTdh9fktqxvnQeCAS+bcWWTw=;
 b=VSjbRWtYX03nF1Fe+89Dslb47QbNQPGOsqX5+N/LrsB0xIv4O0khgf7NU5mEmnfNw1
 ENcya+lJJY+4oHVVB9HZJ4ThV6qy62klvcEi5TrzJ0Lz9KpQcWlseSUM7gcHfDAti003
 EevoFYy5C4uZQxZI1kkKrgTR4xgiHr1qijz/ZYPF79OPbDheiMRDKQC/FmOTLnddPjxD
 Ra0Z9pxKysTxE5YFJznP63qlIsWnTK6RFGg2Llqrmtwvsn05d9XsH7gW9neSM8fZZ/b5
 sut1rcbSQSadMHoAeoir5Q39TwBXbsjBaVfEF5+UI790YtdcIPI/xqbqMfIYZqgayCcQ
 Tj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245195; x=1684837195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Dlk8ZxPJU6DU0wHPDCgTdh9fktqxvnQeCAS+bcWWTw=;
 b=L7iC2f7FAGRf/Jux4JDXdIjjXJg2ZxJnq8dTsdLz2ZAYNlkovRURxEc5ZQG1S+pyY0
 eORYibiG3rKVMwIqT3PkGWesJwScCxN5uzq6hqMlYJfhpr87lU86N0imYVzOJFoSC7Dk
 FPz0aI9MscX9DJe0xjBRK8y2023WfO1y0DvSRJShoPaCNndctxvKp+pQ5St50spI7oIX
 4LqHXrK7OFq3pH6WgtZkYfuNnXHy/9fdPM2bR7V0UbtWU3xoGtT6BIakSigFr0/UeGgD
 IKvop7hFvfu4DTZ0Gq2loncQECDugzfzwgiFPSYlZFMRGLcSulMnE1ZGNDkVhjVZ0QwP
 j8rA==
X-Gm-Message-State: AAQBX9dfFDFUVKTxYE7QUZOGx4j+8aMMrnlc/XHHAQklR/EZ4D64CyVP
 8hMYBYOLUO+F9W+vY10BvCcpgQhR2wy8JSzMxofrEA==
X-Google-Smtp-Source: AKy350aWJp/UJCLS7pXPHoGWOqkryVqXer3pBlh5lg+aBn4qg5C8YX2xGcvNrh+epoOtFPJz4bNUww==
X-Received: by 2002:a1c:7908:0:b0:3f1:6ead:e389 with SMTP id
 l8-20020a1c7908000000b003f16eade389mr5582348wme.30.1682245194730; 
 Sun, 23 Apr 2023 03:19:54 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:19:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/15] tcg: Split out tcg_out_ext16s
Date: Sun, 23 Apr 2023 11:19:40 +0100
Message-Id: <20230423101950.817899-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
References: <20230423101950.817899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We will need a backend interface for performing 16-bit sign-extend.
Use it in tcg_reg_alloc_op in the meantime.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  7 +++++++
 tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
 tcg/arm/tcg-target.c.inc         | 10 ++++------
 tcg/i386/tcg-target.c.inc        | 16 ++++++++--------
 tcg/loongarch64/tcg-target.c.inc | 13 +++++--------
 tcg/mips/tcg-target.c.inc        | 11 ++++++++---
 tcg/ppc/tcg-target.c.inc         | 12 +++++-------
 tcg/riscv/tcg-target.c.inc       |  9 +++------
 tcg/s390x/tcg-target.c.inc       | 12 ++++--------
 tcg/sparc64/tcg-target.c.inc     |  7 +++++++
 tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
 11 files changed, 79 insertions(+), 52 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index b02ffc5679..739f92c2ee 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -106,6 +106,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
@@ -4509,6 +4510,12 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext8u_i64:
         tcg_out_ext8u(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext16s_i32:
+        tcg_out_ext16s(s, TCG_TYPE_I32, new_args[0], new_args[1]);
+        break;
+    case INDEX_op_ext16s_i64:
+        tcg_out_ext16s(s, TCG_TYPE_I64, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index cca91363ce..3527c14d04 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1424,6 +1424,11 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
     tcg_out_sxt(s, type, MO_8, rd, rn);
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
+{
+    tcg_out_sxt(s, type, MO_16, rd, rn);
+}
+
 static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
@@ -2233,17 +2238,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
             /* Output must be sign-extended. */
-            tcg_out_sxt(s, ext, MO_16, a0, a0);
+            tcg_out_ext16s(s, ext, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             /* Output must be zero-extended, but input isn't. */
             tcg_out_uxt(s, MO_16, a0, a0);
         }
         break;
 
-    case INDEX_op_ext16s_i64:
-    case INDEX_op_ext16s_i32:
-        tcg_out_sxt(s, ext, MO_16, a0, a1);
-        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
@@ -2316,6 +2317,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16s_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b99f08a54b..cddf977a58 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -975,10 +975,10 @@ tcg_out_ext8u_cond(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
     tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
 }
 
-static void tcg_out_ext16s(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
+static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
 {
     /* sxth */
-    tcg_out32(s, 0x06bf0070 | (cond << 28) | (rd << 12) | rn);
+    tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_ext16u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
@@ -1541,7 +1541,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
         tcg_out_ext8s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
         break;
     case MO_SW:
-        tcg_out_ext16s(s, COND_AL, datalo, TCG_REG_R0);
+        tcg_out_ext16s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
         break;
     default:
         tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
@@ -2249,9 +2249,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap32(s, COND_AL, args[0], args[1]);
         break;
 
-    case INDEX_op_ext16s_i32:
-        tcg_out_ext16s(s, COND_AL, args[0], args[1]);
-        break;
     case INDEX_op_ext16u_i32:
         tcg_out_ext16u(s, COND_AL, args[0], args[1]);
         break;
@@ -2305,6 +2302,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8u_i32:
+    case INDEX_op_ext16s_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 462a2348c6..21bd828146 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1280,8 +1280,9 @@ static inline void tcg_out_ext16u(TCGContext *s, int dest, int src)
     tcg_out_modrm(s, OPC_MOVZWL, dest, src);
 }
 
-static inline void tcg_out_ext16s(TCGContext *s, int dest, int src, int rexw)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
     /* movsw[lq] */
     tcg_out_modrm(s, OPC_MOVSWL + rexw, dest, src);
 }
@@ -1891,7 +1892,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     MemOp opc = get_memop(oi);
     TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
-    int rexw = (l->type == TCG_TYPE_I64 ? P_REXW : 0);
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
@@ -1933,7 +1933,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_ext8s(s, l->type, data_reg, TCG_REG_EAX);
         break;
     case MO_SW:
-        tcg_out_ext16s(s, data_reg, TCG_REG_EAX, rexw);
+        tcg_out_ext16s(s, l->type, data_reg, TCG_REG_EAX);
         break;
 #if TCG_TARGET_REG_BITS == 64
     case MO_SL:
@@ -2153,6 +2153,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
                                    int seg, bool is64, MemOp memop)
 {
+    TCGType type = is64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     bool use_movbe = false;
     int rexw = is64 * P_REXW;
     int movop = OPC_MOVL_GvEv;
@@ -2195,7 +2196,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (use_movbe) {
             tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
                                      datalo, base, index, 0, ofs);
-            tcg_out_ext16s(s, datalo, datalo, rexw);
+            tcg_out_ext16s(s, type, datalo, datalo);
         } else {
             tcg_out_modrm_sib_offset(s, OPC_MOVSWL + rexw + seg,
                                      datalo, base, index, 0, ofs);
@@ -2670,9 +2671,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, a0);
         break;
 
-    OP_32_64(ext16s):
-        tcg_out_ext16s(s, a0, a1, rexw);
-        break;
     OP_32_64(ext16u):
         tcg_out_ext16u(s, a0, a1);
         break;
@@ -2816,7 +2814,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (a1 < 4 && a0 < 8) {
             tcg_out_modrm(s, OPC_MOVSBL, a0, a1 + 4);
         } else {
-            tcg_out_ext16s(s, a0, a1, 0);
+            tcg_out_ext16s(s, TCG_TYPE_I32, a0, a1);
             tcg_out_shifti(s, SHIFT_SAR, a0, 8);
         }
         break;
@@ -2839,6 +2837,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a206b9cfc5..a365fbcf8f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -446,7 +446,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     tcg_out_opc_sext_b(s, ret, arg);
 }
 
-static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_sext_h(s, ret, arg);
 }
@@ -896,7 +896,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_ext8s(s, type, l->datalo_reg, TCG_REG_A0);
         break;
     case MO_SW:
-        tcg_out_ext16s(s, l->datalo_reg, TCG_REG_A0);
+        tcg_out_ext16s(s, type, l->datalo_reg, TCG_REG_A0);
         break;
     case MO_SL:
         tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
@@ -1246,11 +1246,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        tcg_out_ext16s(s, a0, a1);
-        break;
-
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
         tcg_out_ext16u(s, a0, a1);
@@ -1351,7 +1346,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap16_i64:
         tcg_out_opc_revb_2h(s, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
-            tcg_out_ext16s(s, a0, a0);
+            tcg_out_ext16s(s, TCG_TYPE_REG, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tcg_out_ext16u(s, a0, a0);
         }
@@ -1621,6 +1616,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 5a712e3da5..9d305b9cf4 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -563,6 +563,12 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_opc_imm(s, OPC_ANDI, rd, rs, 0xff);
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_HAS_ext16s_i32);
+    tcg_out_opc_reg(s, OPC_SEH, rd, TCG_REG_ZERO, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2256,9 +2262,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_not_i64:
         i1 = OPC_NOR;
         goto do_unary;
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        i1 = OPC_SEH;
     do_unary:
         tcg_out_opc_reg(s, i1, a0, TCG_REG_ZERO, a1);
         break;
@@ -2430,6 +2433,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index ec8e5a1a8a..e4b997fca8 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -785,7 +785,7 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out32(s, ANDI | SAI(src, dst, 0xff));
 }
 
-static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, EXTSH | RA(dst) | RS(src));
 }
@@ -843,7 +843,7 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
     if (have_isa_3_10) {
         tcg_out32(s, BRH | RA(dst) | RS(src));
         if (flags & TCG_BSWAP_OS) {
-            tcg_out_ext16s(s, dst, dst);
+            tcg_out_ext16s(s, TCG_TYPE_REG, dst, dst);
         } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tcg_out_ext16u(s, dst, dst);
         }
@@ -862,7 +862,7 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
     tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);
 
     if (flags & TCG_BSWAP_OS) {
-        tcg_out_ext16s(s, dst, tmp);
+        tcg_out_ext16s(s, TCG_TYPE_REG, dst, tmp);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
     }
@@ -2979,10 +2979,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        tcg_out_ext16s(s, args[0], args[1]);
-        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
         tcg_out_ext32s(s, args[0], args[1]);
@@ -3130,6 +3126,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d9b08014ce..12ee7b29af 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -591,7 +591,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
 }
 
-static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
     tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
@@ -1607,11 +1607,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
 
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        tcg_out_ext16s(s, a0, a1);
-        break;
-
     case INDEX_op_ext32s_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_ext_i32_i64:
@@ -1645,6 +1640,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 338a91c591..024867336a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1102,7 +1102,7 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LLGCR, dest, src);
 }
 
-static void tgen_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LGHR, dest, src);
 }
@@ -1609,7 +1609,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
     case MO_SW | MO_BSWAP:
         /* swapped sign-extended halfword load */
         tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
-        tgen_ext16s(s, TCG_TYPE_I64, data, data);
+        tcg_out_ext16s(s, TCG_TYPE_REG, data, data);
         break;
     case MO_SW:
         tcg_out_insn(s, RXY, LGH, data, base, index, disp);
@@ -2233,9 +2233,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext16s_i32:
-        tgen_ext16s(s, TCG_TYPE_I32, args[0], args[1]);
-        break;
     case INDEX_op_ext16u_i32:
         tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
         break;
@@ -2531,9 +2528,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext16s_i64:
-        tgen_ext16s(s, TCG_TYPE_I64, args[0], args[1]);
-        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
         tgen_ext32s(s, args[0], args[1]);
@@ -2636,6 +2630,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4792b04b54..e4a8bd6e27 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -501,6 +501,11 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     g_assert_not_reached();
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_out_arithi(s, rd, rs, 0xff, ARITH_AND);
@@ -1714,6 +1719,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e946d9165e..167f8123b1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -586,6 +586,24 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_debug_assert(TCG_TARGET_HAS_ext16s_i32);
+        tcg_out_op_rr(s, INDEX_op_ext16s_i32, rd, rs);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_debug_assert(TCG_TARGET_HAS_ext16s_i64);
+        tcg_out_op_rr(s, INDEX_op_ext16s_i64, rd, rs);
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -744,7 +762,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_32_64(ext16s)   /* Optional (TCG_TARGET_HAS_ext16s_*). */
     CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
     CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
@@ -826,6 +843,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


