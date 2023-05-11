Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8621A6FEDBE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:16:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ir-0006ws-Q8; Thu, 11 May 2023 04:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ig-0006RI-Es
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:24 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IV-00010K-TK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:22 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so14689758a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792309; x=1686384309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dlah/sNKnEYoy9ZbUN1QDNt4gOhBndvkbi67wtgjUoM=;
 b=ayr4DsMW/ZiSqDJIifas65IMGnBlxAplPm1QxdTmIpNSF4PJN26EnWH/i3U7t+ej7S
 tAjkO56yqYGO3MWLIj6OYLlEbxnon1Spl6FokpSrsQv0xjbxZmfb6WaNGg63zxw7OWn9
 EX47eMJpHLkAeQQ1IB4qnOvHEWpS/gDwnfp9Rm25826IJfqauGfNlWRB2l3fGNsfL7BK
 N5OleHYCDct5mKPSN7oBr+1DDuAeulFNOjtu3yVOduZFigy48afluAqRYe6K4fElKg8M
 DGJ61OPWa/1eljc3Q4tldtA/3RSo5l/EjArL5ouW4uJSxnaTD9fb08WBVRVtXtVLuvGB
 7ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792309; x=1686384309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dlah/sNKnEYoy9ZbUN1QDNt4gOhBndvkbi67wtgjUoM=;
 b=Gx3XeHnEumc9CbuOCKo5WTuta9p+/ZN+lX2QsgcnQpZRyaJ6QvIuhk0tx5lkdbn2Aj
 M2IkRnlsxEYrV4pw6SDie2TIXqEszPMjrnOr6DeCExzdM9D7aWoDWdJ16RoaYW62oWbU
 GP6SlgJgRFhlwhT6XF9wjpeBLu+8BfHUaxNancovETL29DtO4cdhEMZ18DExabJwNY7i
 0KXKxdJEqCxoPZJeCtvYL244T+312ahasj8xj2qckgDV4TbQkyDUJ452ZNdlEuHe+S3u
 msnDATeBCGjMvH3fRojq6oDzoZJ6VUXA1j5FYsLpsmvC3QQ8RjsmvzP0Z8RmG5OyYoX8
 T0/w==
X-Gm-Message-State: AC+VfDxR8ImE5lUzQi8VLagauCURudXd5e8tdDtaxN4X4B6i+ehJ5TkO
 ZTpiJ2zYjM/23zo4nKyLb5FYOyAaVtE6ce6MptWR2A==
X-Google-Smtp-Source: ACHHUZ754LCrXWBpW0fSnoWgE5nHHIfNBRgQC17IcO4qXyhqyLV4l2EteTM/gr8hS+S7N+IeAX3n6Q==
X-Received: by 2002:aa7:d7d4:0:b0:50b:dcf6:8e6d with SMTP id
 e20-20020aa7d7d4000000b0050bdcf68e6dmr16667065eds.18.1683792308800; 
 Thu, 11 May 2023 01:05:08 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 26/53] tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Thu, 11 May 2023 09:04:23 +0100
Message-Id: <20230511080450.860923-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.  This allows our local
tcg_out_arg_* infrastructure to be removed.

We are no longer filling the call or return branch
delay slots, nor are we tail-calling for the store,
but this seems a small price to pay.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 154 ++++++--------------------------------
 1 file changed, 22 insertions(+), 132 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 94708e6ea7..022960d79a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1115,79 +1115,15 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
-/* Helper routines for marshalling helper function arguments into
- * the correct registers and stack.
- * I is where we want to put this argument, and is updated and returned
- * for the next call. ARG is the argument itself.
- *
- * We provide routines for arguments which are: immediate, 32 bit
- * value in register, 16 and 8 bit values in register (which must be zero
- * extended before use) and 64 bit value in a lo:hi register pair.
- */
-
-static int tcg_out_call_iarg_reg(TCGContext *s, int i, TCGReg arg)
-{
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tcg_out_mov(s, TCG_TYPE_REG, tcg_target_call_iarg_regs[i], arg);
-    } else {
-        /* For N32 and N64, the initial offset is different.  But there
-           we also have 8 argument register so we don't run out here.  */
-        tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-        tcg_out_st(s, TCG_TYPE_REG, arg, TCG_REG_SP, 4 * i);
-    }
-    return i + 1;
-}
-
-static int tcg_out_call_iarg_reg8(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_ext8u(s, tmp, arg);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg16(TCGContext *s, int i, TCGReg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-        tmp = tcg_target_call_iarg_regs[i];
-    }
-    tcg_out_opc_imm(s, OPC_ANDI, tmp, arg, 0xffff);
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_imm(TCGContext *s, int i, TCGArg arg)
-{
-    TCGReg tmp = TCG_TMP0;
-    if (arg == 0) {
-        tmp = TCG_REG_ZERO;
-    } else {
-        if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
-            tmp = tcg_target_call_iarg_regs[i];
-        }
-        tcg_out_movi(s, TCG_TYPE_REG, tmp, arg);
-    }
-    return tcg_out_call_iarg_reg(s, i, tmp);
-}
-
-static int tcg_out_call_iarg_reg2(TCGContext *s, int i, TCGReg al, TCGReg ah)
-{
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
-    i = (i + 1) & ~1;
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? ah : al));
-    i = tcg_out_call_iarg_reg(s, i, (MIPS_BE ? al : ah));
-    return i;
-}
+/* We have four temps, we might as well expose three of them. */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
+};
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg v0;
-    int i;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1196,29 +1132,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
-    i = tcg_out_call_iarg_imm(s, i, (intptr_t)l->raddr);
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
+
     tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_nop(s);
 
-    v0 = l->datalo_reg;
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        /* We eliminated V0 from the possible output registers, so it
-           cannot be clobbered here.  So we must move V1 first.  */
-        if (MIPS_BE) {
-            tcg_out_mov(s, TCG_TYPE_I32, v0, TCG_REG_V1);
-            v0 = l->datahi_reg;
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_V1);
-        }
-    }
+    tcg_out_ld_helper_ret(s, l, true, &ldst_helper_param);
 
     tcg_out_opc_br(s, OPC_BEQ, TCG_REG_ZERO, TCG_REG_ZERO);
     if (!reloc_pc16(s->code_ptr - 1, l->raddr)) {
@@ -1226,22 +1146,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* delay slot */
-    if (TCG_TARGET_REG_BITS == 64 && l->type == TCG_TYPE_I32) {
-        /* we always sign-extend 32-bit loads */
-        tcg_out_ext32s(s, v0, TCG_REG_V0);
-    } else {
-        tcg_out_opc_reg(s, OPC_OR, v0, TCG_REG_V0, TCG_REG_ZERO);
-    }
+    tcg_out_nop(s);
     return true;
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    int i;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
@@ -1250,41 +1162,19 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         return false;
     }
 
-    i = 1;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        i = tcg_out_call_iarg_reg2(s, i, l->addrlo_reg, l->addrhi_reg);
-    } else {
-        i = tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
-    }
-    switch (s_bits) {
-    case MO_8:
-        i = tcg_out_call_iarg_reg8(s, i, l->datalo_reg);
-        break;
-    case MO_16:
-        i = tcg_out_call_iarg_reg16(s, i, l->datalo_reg);
-        break;
-    case MO_32:
-        i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        break;
-    case MO_64:
-        if (TCG_TARGET_REG_BITS == 32) {
-            i = tcg_out_call_iarg_reg2(s, i, l->datalo_reg, l->datahi_reg);
-        } else {
-            i = tcg_out_call_iarg_reg(s, i, l->datalo_reg);
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    i = tcg_out_call_iarg_imm(s, i, oi);
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
 
-    /* Tail call to the store helper.  Thus force the return address
-       computation to take place in the return address register.  */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (intptr_t)l->raddr);
-    i = tcg_out_call_iarg_reg(s, i, TCG_REG_RA);
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], true);
+    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], false);
     /* delay slot */
-    tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+    tcg_out_nop(s);
+
+    tcg_out_opc_br(s, OPC_BEQ, TCG_REG_ZERO, TCG_REG_ZERO);
+    if (!reloc_pc16(s->code_ptr - 1, l->raddr)) {
+        return false;
+    }
+
+    /* delay slot */
+    tcg_out_nop(s);
     return true;
 }
 
-- 
2.34.1


