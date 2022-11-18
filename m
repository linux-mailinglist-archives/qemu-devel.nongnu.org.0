Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9D62F1D5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzk-0007xH-0r; Fri, 18 Nov 2022 04:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzH-0007c1-CG
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:43 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzE-00027Q-Sa
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:43 -0500
Received: by mail-pl1-x636.google.com with SMTP id y4so4123718plb.2
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+RfgC8VhnopAahTH1Ei9SeHiA80KK34b0NuKXJtNsVU=;
 b=zjz1S/Ob1GSF51vaOSTmavUaW1rqYZWW0VlvcfeeWQXs9Cail0d2C0xMlFOfq90QyP
 OnQjNYyGdBAsog5ZRoaDEU4bFgg62a7xWlYYkDqog2LM1cPf90HSeb0UiUiZVw0OliXS
 ePn/Mn+ZpTAfQHbq7x48QxyQOh80cXCxNFGuPYOuZPuaISYtnAHu2+GDX9Ug1xK8voov
 pitIJ1D9MzJaC/3H/H8vuQjWxaZESVTKYvqr3HMhoWj/tUIQNOt5OOWBeJ0qlhP6E/kC
 rMAdU157pVcFrGq2/xEP8qw+HuTG+O0yYQ+fuytGE2ZqmPhIHD3kEwMd9njlGAEgp7kz
 aR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RfgC8VhnopAahTH1Ei9SeHiA80KK34b0NuKXJtNsVU=;
 b=fTi129gHYtbyg5RVrJKzjREEBPGklkKPGxUM5zTiZ5uWvN1IBUB8jTQh31oPxkaxZ9
 r1xJTIZf8UytFasXCNw2fO3xA4KOy5Fi+4A7MZImW5WoZAvb3IegzIlJKPu8xW0yI2FO
 +eq0Wvp+PyTgv3sF9D7HkXIkiHoKEdqWT2PEEGhwiZ6yGdq2a2psj/QEVw0RjxPvLoyx
 8toaooNJfCkwQDr7hRZgD5Q5VyCIjRK6FjjaxPLeZ7caCqmvMkhRkC0D5fdMID5Dp/4S
 1+e8t//HclMuMwmpzz5tZfhiELjDpR9UFiqQuy8zRbQQOFOGZ3N4e02z4hlaizUXXpux
 GD4A==
X-Gm-Message-State: ANoB5pngq5GrXkVBEuvte/As984cAlYy+5XGOncEfMZ9CMUDPsT/vpij
 fk+dZXvg5eewgw1fPikliYveo/JEnTrLSA==
X-Google-Smtp-Source: AA0mqf6B8h3gLAvO2inBNNXgfREmc2m9C3D/4fpcztDrEOjaQVYw4QeZ/1h0Je9EDzY2posfL2anCQ==
X-Received: by 2002:a17:90a:9403:b0:218:6a4e:e44a with SMTP id
 r3-20020a17090a940300b002186a4ee44amr7309025pjo.6.1668764919559; 
 Fri, 18 Nov 2022 01:48:39 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 23/29] tcg/i386: Use full load/store helpers in
 user-only mode
Date: Fri, 18 Nov 2022 01:47:48 -0800
Message-Id: <20221118094754.242910-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Instead of using helper_unaligned_{ld,st}, use the full
load/store helpers.  This will allow the fast path to
increase alignment to implement atomicity while not
immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 332 ++++++++++++++++----------------------
 1 file changed, 142 insertions(+), 190 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5ddbbbaf18..eb93807b5f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1746,7 +1746,6 @@ tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
     }
 }
 
-#if defined(CONFIG_SOFTMMU)
 /*
  * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
  *                                  int mmu_idx, uintptr_t ra)
@@ -1769,108 +1768,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
     [MO_UQ] = helper_stq_mmu,
 };
 
-/* Perform the TLB load and compare.
-
-   Inputs:
-   ADDRLO and ADDRHI contain the low and high part of the address.
-
-   MEM_INDEX and S_BITS are the memory context and log2 size of the load.
-
-   WHICH is the offset into the CPUTLBEntry structure of the slot to read.
-   This should be offsetof addr_read or addr_write.
-
-   Outputs:
-   LABEL_PTRS is filled with 1 (32-bit addresses) or 2 (64-bit addresses)
-   positions of the displacements of forward jumps to the TLB miss case.
-
-   Second argument register is loaded with the low part of the address.
-   In the TLB hit case, it has been adjusted as indicated by the TLB
-   and so is a host address.  In the TLB miss case, it continues to
-   hold a guest address.
-
-   First argument register is clobbered.  */
-
-static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
-                                    int mem_index, MemOp opc,
-                                    tcg_insn_unit **label_ptr, int which)
-{
-    const TCGReg r0 = TCG_REG_L0;
-    const TCGReg r1 = TCG_REG_L1;
-    TCGType ttype = TCG_TYPE_I32;
-    TCGType tlbtype = TCG_TYPE_I32;
-    int trexw = 0, hrexw = 0, tlbrexw = 0;
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
-    unsigned s_mask = (1 << s_bits) - 1;
-    target_ulong tlb_mask;
-
-    if (TCG_TARGET_REG_BITS == 64) {
-        if (TARGET_LONG_BITS == 64) {
-            ttype = TCG_TYPE_I64;
-            trexw = P_REXW;
-        }
-        if (TCG_TYPE_PTR == TCG_TYPE_I64) {
-            hrexw = P_REXW;
-            if (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32) {
-                tlbtype = TCG_TYPE_I64;
-                tlbrexw = P_REXW;
-            }
-        }
-    }
-
-    tcg_out_mov(s, tlbtype, r0, addrlo);
-    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, r0,
-                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-
-    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, r0, TCG_AREG0,
-                         TLB_MASK_TABLE_OFS(mem_index) +
-                         offsetof(CPUTLBDescFast, mask));
-
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r0, TCG_AREG0,
-                         TLB_MASK_TABLE_OFS(mem_index) +
-                         offsetof(CPUTLBDescFast, table));
-
-    /* If the required alignment is at least as large as the access, simply
-       copy the address and mask.  For lesser alignments, check that we don't
-       cross pages for the complete access.  */
-    if (a_bits >= s_bits) {
-        tcg_out_mov(s, ttype, r1, addrlo);
-    } else {
-        tcg_out_modrm_offset(s, OPC_LEA + trexw, r1, addrlo, s_mask - a_mask);
-    }
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tgen_arithi(s, ARITH_AND + trexw, r1, tlb_mask, 0);
-
-    /* cmp 0(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw, r1, r0, which);
-
-    /* Prepare for both the fast path add of the tlb addend, and the slow
-       path function argument setup.  */
-    tcg_out_mov(s, ttype, r1, addrlo);
-
-    /* jne slow_path */
-    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
-    label_ptr[0] = s->code_ptr;
-    s->code_ptr += 4;
-
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        /* cmp 4(r0), addrhi */
-        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, r0, which + 4);
-
-        /* jne slow_path */
-        tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
-        label_ptr[1] = s->code_ptr;
-        s->code_ptr += 4;
-    }
-
-    /* TLB Hit.  */
-
-    /* add addend(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r1, r0,
-                         offsetof(CPUTLBEntry, addend));
-}
-
 /*
  * Record the context of a call to the out of line helper code for the slow path
  * for a load or store, so that we can later generate the correct helper code
@@ -1893,9 +1790,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
     label->addrhi_reg = addrhi;
     label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        label->label_ptr[1] = label_ptr[1];
-    }
+    label->label_ptr[1] = label_ptr[1];
 }
 
 /* Move src1 to dst1 and src2 to dst2, minding possible overlap. */
@@ -1929,7 +1824,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+    if (label_ptr[1]) {
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
@@ -1952,8 +1847,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
         tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
     } else {
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
         tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
                      (uintptr_t)l->raddr);
@@ -2010,7 +1906,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+    if (label_ptr[1]) {
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
@@ -2043,10 +1939,11 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
         tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
     } else {
+        tcg_out_mov2(s, TCG_TYPE_TL,
+                     tcg_target_call_iarg_regs[1], l->addrlo_reg,
+                     s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
+                     tcg_target_call_iarg_regs[2], l->datalo_reg);
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
-        tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                    tcg_target_call_iarg_regs[2], l->datalo_reg);
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
 
         if (ARRAY_SIZE(tcg_target_call_iarg_regs) > 4) {
@@ -2065,72 +1962,129 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_jmp(s, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
+
+#if defined(CONFIG_SOFTMMU)
+/*
+ * Perform the TLB load and compare.
+ *
+ * Inputs:
+ * ADDRLO and ADDRHI contain the low and high part of the address.
+ *
+ * MEM_INDEX and S_BITS are the memory context and log2 size of the load.
+ *
+ * WHICH is the offset into the CPUTLBEntry structure of the slot to read.
+ * This should be offsetof addr_read or addr_write.
+ *
+ * Outputs:
+ * LABEL_PTRS is filled with 1 (32-bit addresses) or 2 (64-bit addresses)
+ * positions of the displacements of forward jumps to the TLB miss case.
+ *
+ * Second argument register is loaded with the low part of the address.
+ * In the TLB hit case, it has been adjusted as indicated by the TLB
+ * and so is a host address.  In the TLB miss case, it continues to
+ * hold a guest address.
+ *
+ * First argument register is clobbered.
+ */
+static void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
+                             int mem_index, MemOp opc,
+                             tcg_insn_unit **label_ptr, int which)
+{
+    const TCGReg r0 = TCG_REG_L0;
+    const TCGReg r1 = TCG_REG_L1;
+    TCGType ttype = TCG_TYPE_I32;
+    TCGType tlbtype = TCG_TYPE_I32;
+    int trexw = 0, hrexw = 0, tlbrexw = 0;
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned s_mask = (1 << s_bits) - 1;
+    target_ulong tlb_mask;
+
+    if (TCG_TARGET_REG_BITS == 64) {
+        if (TARGET_LONG_BITS == 64) {
+            ttype = TCG_TYPE_I64;
+            trexw = P_REXW;
+        }
+        if (TCG_TYPE_PTR == TCG_TYPE_I64) {
+            hrexw = P_REXW;
+            if (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32) {
+                tlbtype = TCG_TYPE_I64;
+                tlbrexw = P_REXW;
+            }
+        }
+    }
+
+    tcg_out_mov(s, tlbtype, r0, addrlo);
+    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, r0,
+                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+
+    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, r0, TCG_AREG0,
+                         TLB_MASK_TABLE_OFS(mem_index) +
+                         offsetof(CPUTLBDescFast, mask));
+
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r0, TCG_AREG0,
+                         TLB_MASK_TABLE_OFS(mem_index) +
+                         offsetof(CPUTLBDescFast, table));
+
+    /*
+     * If the required alignment is at least as large as the access, simply
+     * copy the address and mask.  For lesser alignments, check that we don't
+     * cross pages for the complete access.
+     */
+    if (a_bits >= s_bits) {
+        tcg_out_mov(s, ttype, r1, addrlo);
+    } else {
+        tcg_out_modrm_offset(s, OPC_LEA + trexw, r1, addrlo, s_mask - a_mask);
+    }
+    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
+    tgen_arithi(s, ARITH_AND + trexw, r1, tlb_mask, 0);
+
+    /* cmp 0(r0), r1 */
+    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw, r1, r0, which);
+
+    /*
+     * Prepare for both the fast path add of the tlb addend, and the slow
+     * path function argument setup.
+     */
+    tcg_out_mov(s, ttype, r1, addrlo);
+
+    /* jne slow_path */
+    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+    label_ptr[0] = s->code_ptr;
+    s->code_ptr += 4;
+
+    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+        /* cmp 4(r0), addrhi */
+        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, r0, which + 4);
+
+        /* jne slow_path */
+        tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+        label_ptr[1] = s->code_ptr;
+        s->code_ptr += 4;
+    }
+
+    /* TLB Hit.  */
+
+    /* add addend(r0), r1 */
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r1, r0,
+                         offsetof(CPUTLBEntry, addend));
+}
+
 #else
 
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
-                                   TCGReg addrhi, unsigned a_bits)
+static void tcg_out_test_alignment(TCGContext *s, TCGReg addrlo,
+                                   unsigned a_bits, tcg_insn_unit **label_ptr)
 {
     unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *label;
 
     tcg_out_testi(s, addrlo, a_mask);
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
-
-    label = new_ldst_label(s);
-    label->is_ld = is_ld;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-    label->raddr = tcg_splitwx_to_rx(s->code_ptr + 4);
-    label->label_ptr[0] = s->code_ptr;
-
+    *label_ptr = s->code_ptr;
     s->code_ptr += 4;
 }
 
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    tcg_patch32(l->label_ptr[0], s->code_ptr - l->label_ptr[0] - 4);
-
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
-
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_pushi(s, (uintptr_t)l->raddr);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RAX, (uintptr_t)l->raddr);
-        tcg_out_push(s, TCG_REG_RAX);
-    }
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_jmp(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                  : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
 #if TCG_TARGET_REG_BITS == 32
 # define x86_guest_base_seg     0
 # define x86_guest_base_index   -1
@@ -2165,7 +2119,7 @@ static inline int setup_guest_base_seg(void)
     return 0;
 }
 # endif
-#endif
+#endif /* TCG_TARGET_REG_BITS == 32 */
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
@@ -2272,10 +2226,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     TCGReg addrhi __attribute__((unused));
     MemOpIdx oi;
     MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    int mem_index;
-    tcg_insn_unit *label_ptr[2];
-#else
+    tcg_insn_unit *label_ptr[2] = { };
+#ifndef CONFIG_SOFTMMU
     unsigned a_bits;
 #endif
 
@@ -2287,26 +2239,27 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
     tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, is64, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi,
+                        TCG_REG_L1, addrhi, s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+        tcg_out_test_alignment(s, addrlo, a_bits, label_ptr);
     }
-
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
                            is64, opc);
+    if (a_bits) {
+        add_qemu_ldst_label(s, true, is64, oi, datalo, datahi,
+                            addrlo, addrhi, s->code_ptr, label_ptr);
+    }
 #endif
 }
 
@@ -2368,10 +2321,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     TCGReg addrhi __attribute__((unused));
     MemOpIdx oi;
     MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    int mem_index;
-    tcg_insn_unit *label_ptr[2];
-#else
+    tcg_insn_unit *label_ptr[2] = { };
+#ifndef CONFIG_SOFTMMU
     unsigned a_bits;
 #endif
 
@@ -2383,25 +2334,26 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_write));
 
     /* TLB Hit.  */
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi,
+                        TCG_REG_L1, addrhi, s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+        tcg_out_test_alignment(s, addrlo, a_bits, label_ptr);
     }
-
     tcg_out_qemu_st_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg, opc);
+    if (a_bits) {
+        add_qemu_ldst_label(s, false, is64, oi, datalo, datahi,
+                            addrlo, addrhi, s->code_ptr, label_ptr);
+    }
 #endif
 }
 
-- 
2.34.1


