Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C662F1FE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:58:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzn-00085X-B8; Fri, 18 Nov 2022 04:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzP-0007k7-Jq
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:57 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzL-00028Y-BL
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:49 -0500
Received: by mail-pg1-x52c.google.com with SMTP id v3so4565016pgh.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5SLuwGh+3IAEv4D6Tfy89F+ucmEktoFgjCLjsD5ZiOQ=;
 b=xMsvyzLfBX3jVy+XyIYsqoZQ4ap172bz7oXadjeBtx5mBH/XddGh4WbvmLYnq+zIPw
 0wJwuUXi8z3aFRp10PYaHvWssbEVhOTzuACetcremG6lWkADd12TYfVtyyzGOdZRug78
 wYbWh1UHvVDm1GZoY0y/mrJyD2vw2VAZLhs4VCKkHaZX1JrIsjWnTTmDPHlv0j44vXBu
 GnhMyQRZiYxarKb6PWlnuaJbKKt+lEczR138n4jsdMin5ekoA7ycMhyozo2tL28NZ0RS
 M9H3oIRKTuJ94rN40+ikXztfoF9Q1egrlLdyUBCvV59Kp9xmBJeUweNCuvaj5osS0Vil
 AuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5SLuwGh+3IAEv4D6Tfy89F+ucmEktoFgjCLjsD5ZiOQ=;
 b=ZSDSyx0T8iqSSog9Kul8AZ2GidOfC2hyRk5nX93UW6ngI2+Mbs6hwbH/VFHJ45yNxc
 OeeWlg3iDRSo5ALpIHm6lwqV3YsnSL2fbxHwtqBlcetyBl7MQfzjegFbfMzYz0+l6lSw
 LI8Auz3TdMcLY0r9enkyfi/HU/NqtD2qPXlawS9tVyhMhyPWwfIREut0FuXKfgJy2uoq
 vDdbbhBF1aBvQol/Xo5Xy2j4Qfiijaeax3XgxGFK0LLr6DptjMYmUNBSz9cyJ/dG6bo+
 1uRWhgI0ittyz99SIS0rLgq3rtnyX8Ntl3fN6HwDrjIGfrrqz4K+9YKTFfiWdqbRESmB
 mh1Q==
X-Gm-Message-State: ANoB5plrPncp3ihU6l3J0/LrR59wHIhYTriqoBm7FENprXH4wvC0tUp8
 Fo39gO+QI43SEd8SlDJ5cPFgusQq5/vJrA==
X-Google-Smtp-Source: AA0mqf4Pm3BXqiQ9RCVVCI9tlinYbHnpkNVBvks1mH9sd58yQeczShOIY61S4euNXgk9bBsZsBiwPA==
X-Received: by 2002:a62:f252:0:b0:56d:a243:7d86 with SMTP id
 y18-20020a62f252000000b0056da2437d86mr6985817pfl.38.1668764925964; 
 Fri, 18 Nov 2022 01:48:45 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 27/29] tcg/i386: Support 128-bit load/store with
 have_atomic16
Date: Fri, 18 Nov 2022 01:47:52 -0800
Message-Id: <20221118094754.242910-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |   3 +-
 tcg/i386/tcg-target.c.inc | 325 +++++++++++++++++++++++++++++++++++---
 2 files changed, 304 insertions(+), 24 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 53d2cb3412..7aafd60d72 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -195,7 +195,8 @@ extern bool have_atomic16;
 #define TCG_TARGET_HAS_qemu_st8_i32     1
 #endif
 
-#define TCG_TARGET_HAS_qemu_ldst_i128   0
+#define TCG_TARGET_HAS_qemu_ldst_i128 \
+    (TCG_TARGET_REG_BITS == 64 && have_atomic16)
 
 /* We do not support older SSE systems, only beginning with AVX1.  */
 #define TCG_TARGET_HAS_v64              have_avx1
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7dc56040d2..f277085321 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -91,6 +91,8 @@ static const int tcg_target_reg_alloc_order[] = {
 #endif
 };
 
+#define TCG_TMP_VEC  TCG_REG_XMM5
+
 static const int tcg_target_call_iarg_regs[] = {
 #if TCG_TARGET_REG_BITS == 64
 #if defined(_WIN64)
@@ -347,6 +349,8 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PCMPGTW     (0x65 | P_EXT | P_DATA16)
 #define OPC_PCMPGTD     (0x66 | P_EXT | P_DATA16)
 #define OPC_PCMPGTQ     (0x37 | P_EXT38 | P_DATA16)
+#define OPC_PEXTRD      (0x16 | P_EXT3A | P_DATA16)
+#define OPC_PINSRD      (0x22 | P_EXT3A | P_DATA16)
 #define OPC_PMAXSB      (0x3c | P_EXT38 | P_DATA16)
 #define OPC_PMAXSW      (0xee | P_EXT | P_DATA16)
 #define OPC_PMAXSD      (0x3d | P_EXT38 | P_DATA16)
@@ -1730,8 +1734,7 @@ static void tcg_out_nopn(TCGContext *s, int n)
 }
 
 /* Test register R vs immediate bits I, setting Z flag for EQ/NE. */
-static void __attribute__((unused))
-tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
+static void tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
 {
     /*
      * This is used for testing alignment, so we can usually use testb.
@@ -1828,10 +1831,11 @@ static MemOp atom_and_align_for_opc(TCGContext *s, MemOp opc, MemOp *out_al)
  *                                  int mmu_idx, uintptr_t ra)
  */
 static void * const qemu_ld_helpers[MO_SIZE + 1] = {
-    [MO_UB] = helper_ldub_mmu,
-    [MO_UW] = helper_lduw_mmu,
-    [MO_UL] = helper_ldul_mmu,
-    [MO_UQ] = helper_ldq_mmu,
+    [MO_8] = helper_ldub_mmu,
+    [MO_16] = helper_lduw_mmu,
+    [MO_32] = helper_ldul_mmu,
+    [MO_64] = helper_ldq_mmu,
+    [MO_128] = helper_ld16_mmu,
 };
 
 /*
@@ -1839,10 +1843,11 @@ static void * const qemu_ld_helpers[MO_SIZE + 1] = {
  *                                  uintxx_t val, int mmu_idx, uintptr_t ra)
  */
 static void * const qemu_st_helpers[MO_SIZE + 1] = {
-    [MO_UB] = helper_stb_mmu,
-    [MO_UW] = helper_stw_mmu,
-    [MO_UL] = helper_stl_mmu,
-    [MO_UQ] = helper_stq_mmu,
+    [MO_8] = helper_stb_mmu,
+    [MO_16] = helper_stw_mmu,
+    [MO_32] = helper_stl_mmu,
+    [MO_64] = helper_stq_mmu,
+    [MO_128] = helper_st16_mmu,
 };
 
 /*
@@ -1870,6 +1875,13 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGType type,
     label->label_ptr[1] = label_ptr[1];
 }
 
+static void tcg_out_mov2_xchg(TCGContext *s, TCGType type1, TCGType type2,
+                              TCGReg dst1, TCGReg dst2)
+{
+    int w = (type1 == TCG_TYPE_I32 && type2 == TCG_TYPE_I32 ? 0 : P_REXW);
+    tcg_out_modrm(s, OPC_XCHG_EvGv + w, dst1, dst2);
+}
+
 /* Move src1 to dst1 and src2 to dst2, minding possible overlap. */
 static void tcg_out_mov2(TCGContext *s,
                          TCGType type1, TCGReg dst1, TCGReg src1,
@@ -1883,11 +1895,69 @@ static void tcg_out_mov2(TCGContext *s,
         tcg_out_mov(s, type1, dst1, src1);
     } else {
         /* dst1 == src2 && dst2 == src1 -> xchg. */
-        int w = (type1 == TCG_TYPE_I32 && type2 == TCG_TYPE_I32 ? 0 : P_REXW);
-        tcg_out_modrm(s, OPC_XCHG_EvGv + w, dst1, dst2);
+        tcg_out_mov2_xchg(s, type1, type2, dst1, dst2);
     }
 }
 
+/* Similarly for 3 pairs. */
+static void tcg_out_mov3(TCGContext *s,
+                         TCGType type1, TCGReg dst1, TCGReg src1,
+                         TCGType type2, TCGReg dst2, TCGReg src2,
+                         TCGType type3, TCGReg dst3, TCGReg src3)
+{
+    if (dst1 != src2 && dst1 != src3) {
+        tcg_out_mov(s, type1, dst1, src1);
+        tcg_out_mov2(s, type2, dst2, src2, type3, dst3, src3);
+        return;
+    }
+    if (dst2 != src2 && dst2 != src3) {
+        tcg_out_mov(s, type2, dst2, src2);
+        tcg_out_mov2(s, type1, dst1, src1, type3, dst3, src3);
+        return;
+    }
+    if (dst3 != src1 && dst3 != src2) {
+        tcg_out_mov(s, type3, dst3, src3);
+        tcg_out_mov2(s, type1, dst1, src1, type2, dst2, src2);
+        return;
+    }
+    /* Three-way overlap present, at least one xchg needed. */
+    if (dst1 == src2) {
+        tcg_out_mov2_xchg(s, type1, type2, src1, src2);
+        tcg_out_mov2(s, type2, dst2, src1, type3, dst3, src3);
+        return;
+    }
+    if (dst1 == src3) {
+        tcg_out_mov2_xchg(s, type1, type3, src1, src3);
+        tcg_out_mov2(s, type2, dst2, src2, type3, dst3, src1);
+        return;
+    }
+    g_assert_not_reached();
+}
+
+static void tcg_out_vec_to_pair(TCGContext *s, TCGType type,
+                                TCGReg l, TCGReg h, TCGReg v)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+
+    /* vpmov{d,q} %v, %l */
+    tcg_out_vex_modrm(s, OPC_MOVD_EyVy + rexw, v, 0, l);
+    /* vpextr{d,q} $1, %v, %h */
+    tcg_out_vex_modrm(s, OPC_PEXTRD + rexw, v, 0, h);
+    tcg_out8(s, 1);
+}
+
+static void tcg_out_pair_to_vec(TCGContext *s, TCGType type,
+                                TCGReg v, TCGReg l, TCGReg h)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+
+    /* vmov{d,q} %l, %v */
+    tcg_out_vex_modrm(s, OPC_MOVD_VyEy + rexw, v, 0, l);
+    /* vpinsr{d,q} $1, %h, %v, %v */
+    tcg_out_vex_modrm(s, OPC_PINSRD + rexw, v, v, h);
+    tcg_out8(s, 1);
+}
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
@@ -1897,7 +1967,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     MemOp opc = get_memop(oi);
     TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
-    int rexw = (l->type == TCG_TYPE_I64 ? P_REXW : 0);
+    int rexw = (l->type == TCG_TYPE_I32 ? 0 : P_REXW);
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
@@ -1961,6 +2031,22 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
                          TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
         }
         break;
+    case MO_128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        switch (TCG_TARGET_CALL_RET_I128) {
+        case TCG_CALL_RET_NORMAL:
+            tcg_out_mov2(s, TCG_TYPE_I64, data_reg, TCG_REG_RAX,
+                         TCG_TYPE_I64, l->datahi_reg, TCG_REG_RDX);
+            break;
+        case TCG_CALL_RET_BY_VEC:
+            tcg_out_vec_to_pair(s, TCG_TYPE_I64,
+                                data_reg, l->datahi_reg, TCG_REG_XMM0);
+            break;
+        default:
+            qemu_build_not_reached();
+        }
+        break;
+
     default:
         tcg_abort();
     }
@@ -1977,7 +2063,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
     TCGReg retaddr;
 
@@ -2004,9 +2089,15 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_st(s, TCG_TYPE_I32, l->datalo_reg, TCG_REG_ESP, ofs);
         ofs += 4;
 
-        if (s_bits == MO_64) {
+        switch (l->type) {
+        case TCG_TYPE_I32:
+            break;
+        case TCG_TYPE_I64:
             tcg_out_st(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_ESP, ofs);
             ofs += 4;
+            break;
+        default:
+            g_assert_not_reached();
         }
 
         tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
@@ -2016,15 +2107,54 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
         tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
     } else {
-        tcg_out_mov2(s, TCG_TYPE_TL,
-                     tcg_target_call_iarg_regs[1], l->addrlo_reg,
-                     s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                     tcg_target_call_iarg_regs[2], l->datalo_reg);
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
+        int slot;
 
-        if (ARRAY_SIZE(tcg_target_call_iarg_regs) > 4) {
-            retaddr = tcg_target_call_iarg_regs[4];
+        switch (l->type) {
+        case TCG_TYPE_I32:
+        case TCG_TYPE_I64:
+            tcg_out_mov2(s, TCG_TYPE_TL,
+                         tcg_target_call_iarg_regs[1], l->addrlo_reg,
+                         l->type, tcg_target_call_iarg_regs[2], l->datalo_reg);
+            slot = 3;
+            break;
+        case TCG_TYPE_I128:
+            switch (TCG_TARGET_CALL_ARG_I128) {
+            case TCG_CALL_ARG_NORMAL:
+                tcg_out_mov3(s, TCG_TYPE_TL,
+                             tcg_target_call_iarg_regs[1], l->addrlo_reg,
+                             TCG_TYPE_I64,
+                             tcg_target_call_iarg_regs[2], l->datalo_reg,
+                             TCG_TYPE_I64,
+                             tcg_target_call_iarg_regs[3], l->datahi_reg);
+                slot = 4;
+                break;
+            case TCG_CALL_ARG_BY_REF:
+                /* Leave room for retaddr below, take next 16 aligned bytes. */
+                tcg_out_st(s, TCG_TYPE_I64, l->datalo_reg,
+                           TCG_REG_ESP, TCG_TARGET_CALL_STACK_OFFSET + 16);
+                tcg_out_st(s, TCG_TYPE_I64, l->datahi_reg,
+                           TCG_REG_ESP, TCG_TARGET_CALL_STACK_OFFSET + 24);
+                tcg_out_mov(s, TCG_TYPE_TL,
+                            tcg_target_call_iarg_regs[1], l->addrlo_reg);
+                tcg_out_modrm_offset(s, OPC_LEA + P_REXW,
+                                     tcg_target_call_iarg_regs[2], TCG_REG_ESP,
+                                     TCG_TARGET_CALL_STACK_OFFSET + 16);
+                slot = 3;
+                break;
+            default:
+                qemu_build_not_reached();
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        tcg_debug_assert(slot < (int)ARRAY_SIZE(tcg_target_call_iarg_regs) - 1);
+        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[slot++], oi);
+
+        if (slot < (int)ARRAY_SIZE(tcg_target_call_iarg_regs)) {
+            retaddr = tcg_target_call_iarg_regs[slot];
             tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
         } else {
             retaddr = TCG_REG_RAX;
@@ -2288,6 +2418,71 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             }
         }
         break;
+
+    case MO_128:
+        {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = atom < MO_128;
+
+            tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+
+            if (use_movbe) {
+                TCGReg t = datalo;
+                datalo = datahi;
+                datahi = t;
+            }
+            if (!use_pair) {
+                /*
+                 * Atomicity requires that we use use VMOVDQA.
+                 * If we've already checked for 16-byte alignment, that's all
+                 * we need.  If we arrive here with lesser alignment, then we
+                 * have determined that less that 16-byte alignment can be
+                 * satisfied with two 8-byte loads.
+                 */
+                if (align < MO_128) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, base, align == MO_64 ? 8 : 15);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_vex_modrm_sib_offset(s, OPC_MOVDQA_VxWx + seg,
+                                             TCG_TMP_VEC, 0,
+                                             base, index, 0, ofs);
+                tcg_out_vec_to_pair(s, TCG_TYPE_I64,
+                                    datalo, datahi, TCG_TMP_VEC);
+
+                if (use_movbe) {
+                    tcg_out_bswap64(s, datalo);
+                    tcg_out_bswap64(s, datahi);
+                }
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                if (base != datalo) {
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
+                                             base, index, 0, ofs);
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datahi,
+                                             base, index, 0, ofs + 8);
+                } else {
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datahi,
+                                             base, index, 0, ofs + 8);
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
+                                             base, index, 0, ofs);
+                }
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -2312,6 +2507,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
     case TCG_TYPE_I64:
         datahi = (TCG_TARGET_REG_BITS == 32 ? *args++ : 0);
         break;
+    case TCG_TYPE_I128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        datahi = *args++;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -2394,6 +2593,68 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                      base, index, 0, ofs + 4);
         }
         break;
+
+    case MO_128:
+        {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = atom < MO_128;
+
+            tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+
+            if (use_movbe) {
+                TCGReg t = datalo;
+                datalo = datahi;
+                datahi = t;
+            }
+            if (!use_pair) {
+                /*
+                 * Atomicity requires that we use use VMOVDQA.
+                 * If we've already checked for 16-byte alignment, that's all
+                 * we need.  If we arrive here with lesser alignment, then we
+                 * have determined that less that 16-byte alignment can be
+                 * satisfied with two 8-byte loads.
+                 */
+                if (align < MO_128) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, base, align == MO_64 ? 8 : 15);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                if (use_movbe) {
+                    /* Byte swap while storing to the stack. */
+                    tcg_out_modrm_offset(s, movop + P_REXW + seg, datalo,
+                                         TCG_REG_ESP, 0);
+                    tcg_out_modrm_offset(s, movop + P_REXW + seg, datahi,
+                                         TCG_REG_ESP, 8);
+                    tcg_out_ld(s, TCG_TYPE_V128, TCG_TMP_VEC, TCG_REG_ESP, 0);
+                } else {
+                    tcg_out_pair_to_vec(s, TCG_TYPE_I64,
+                                        TCG_TMP_VEC, datalo, datahi);
+                }
+                tcg_out_vex_modrm_sib_offset(s, OPC_MOVDQA_WxVx + seg,
+                                             TCG_TMP_VEC, 0,
+                                             base, index, 0, ofs);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
+                                         base, index, 0, ofs);
+                tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datahi,
+                                         base, index, 0, ofs + 8);
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -2415,6 +2676,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
     case TCG_TYPE_I64:
         datahi = (TCG_TARGET_REG_BITS == 32 ? *args++ : 0);
         break;
+    case TCG_TYPE_I128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        datahi = *args++;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -2746,6 +3011,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_qemu_ld_i64:
         tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I128);
+        break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
         tcg_out_qemu_st(s, args, TCG_TYPE_I32);
@@ -2753,6 +3021,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_qemu_st_i64:
         tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
+    case INDEX_op_qemu_st_i128:
+        tcg_out_qemu_st(s, args, TCG_TYPE_I128);
+        break;
 
     OP_32_64(mulu2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_MUL, args[3]);
@@ -3441,6 +3712,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(L, L, L)
                 : C_O0_I4(L, L, L, L));
 
+    case INDEX_op_qemu_ld_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        return C_O2_I1(r, r, L);
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        return C_O0_I3(L, L, L);
+
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, ri, ri);
 
@@ -4298,6 +4576,7 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
+    tcg_regset_set_reg(s->reserved_regs, TCG_TMP_VEC);
 #ifdef _WIN64
     /* These are call saved, and not we don't save them, so don't use them. */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
-- 
2.34.1


