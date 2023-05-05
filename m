Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2B6F8B0C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vW-0000pD-Cm; Fri, 05 May 2023 17:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vQ-0000jb-8o
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:12 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vK-0004Oi-Ia
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso23288245e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321905; x=1685913905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wb60bEd1se1ur05309xVh3zsavyenSUVa4kDdGCo6us=;
 b=yMaffd2X0g0y8AY94gyZ2HZ0jS6KNHphSs1YLF5fVa/f9UMPtkwxpfQRDgvnkYxlmf
 wo++/gVa4QE9zNgiEb4FF5CrXU3fRaLQ0Om7xTDA5uwHfCMH2vBKT6izZIWe5zaQzAjG
 UDHVLTF9BMDBD/cXI6v7mNOOu5Md93k/1Fvyeit7l3cw+OD2ij9rH0RULDMz6gb+qOym
 NqfrTNXeJQW12Afs+YBLx/QgReU1re1OwrbtFgt06KI0Ik2/nLvNFr6KHAZb0QQpklN1
 q20cw79JN2oXaERmvo5QWc7eyvJKsIoxKB2ZzbN7jS8mJb5VipL/KnXPI4ueKWCPoq6j
 N0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321905; x=1685913905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wb60bEd1se1ur05309xVh3zsavyenSUVa4kDdGCo6us=;
 b=VefKhqW59QmrOsHWnARpaXb4luzKKZPDdKeSEHKg5XtQFjwplIWAW1kS73FhvxT6vH
 RErLB/G4k+5iAfU12QMPaGAG67LMPSIMMn9XPHCkJirsZX1LIXg6e7WLY0Z3lGJGP2/h
 LjHeg7MnL7ASg2PZreOMW2IdNNxARIr01oZAEdm+SsH+b4MQCtMRUOccT2Fo+18YWqeD
 Y6PJrW7QzVO9XD9cxloI6BX1ree53nFuA7AiJI1O0NaxMzTPk/BA+H3j5CB1lDvTd3Fy
 6WK6rIR4IZJoL9WIxRfaUekSJ8Ez+TAxD7kgAdFp2emNb8aoabzPsZFT9LrBiPWIxi38
 yd1g==
X-Gm-Message-State: AC+VfDyBP6FwFu7Y27lrOqYVEIhmmL11cgbMcWhjyvPc261WVVzKDVii
 /M8HO75I0tcrp9oBYlm1tOegVrXnMWI56ZWRBrmJ3A==
X-Google-Smtp-Source: ACHHUZ6Rd1VRmH0HDc+lgCoKjk2AMwmhNx0lQjUX1ax0xfW5mm0umYAypshxRI5ZXQ74w3OCYrWO0Q==
X-Received: by 2002:a1c:f715:0:b0:3f1:661e:4686 with SMTP id
 v21-20020a1cf715000000b003f1661e4686mr2160880wmh.7.1683321905230; 
 Fri, 05 May 2023 14:25:05 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 30/42] tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
Date: Fri,  5 May 2023 22:24:35 +0100
Message-Id: <20230505212447.374546-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

Interpret the variable argument placement in the caller.  There are
several places where we already convert back from bool to type.
Clean things up by using type throughout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 186 +++++++++++++++++++-------------------
 1 file changed, 95 insertions(+), 91 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a83ebe8729..ef8350e9cd 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1479,7 +1479,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, MemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, TCGType type)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
@@ -1503,7 +1503,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
     case MO_UL | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
                 tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
@@ -1528,7 +1528,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
     case MO_UL:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
             break;
         }
@@ -1583,7 +1583,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 }
 
 static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
-                                    TCGReg base, MemOp opc, bool is_64)
+                                    TCGReg base, MemOp opc, TCGType type)
 {
     const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
     const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
@@ -1623,7 +1623,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_UL:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
-        if (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
             tcg_out_ext32u(s, lo, lo);
         }
         break;
@@ -1634,18 +1634,18 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, lw1, lo, base, 0);
             tcg_out_opc_imm(s, lw2, lo, base, 3);
             tcg_out_bswap32(s, lo, lo,
-                            TCG_TARGET_REG_BITS == 64 && is_64
+                            TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64
                             ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
         } else {
             const tcg_insn_unit *subr =
-                (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn
+                (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn
                  ? bswap32u_addr : bswap32_addr);
 
             tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
             tcg_out_bswap_subr(s, subr);
             /* delay slot */
             tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
-            tcg_out_mov(s, is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, lo, TCG_TMP3);
+            tcg_out_mov(s, type, lo, TCG_TMP3);
         }
         break;
 
@@ -1702,68 +1702,59 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#else
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
-
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
-        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
     }
-    add_qemu_ldst_label(s, 1, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0 && data_regl != addr_regl) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
         } else {
-            tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
         }
     }
 #endif
@@ -1902,67 +1893,60 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         g_assert_not_reached();
     }
 }
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
-{
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
 
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
+{
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 0);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
-        tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
     }
-    add_qemu_ldst_label(s, 0, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
         } else {
-            tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
         }
     }
 #endif
@@ -2425,16 +2409,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_add2_i32:
-- 
2.34.1


