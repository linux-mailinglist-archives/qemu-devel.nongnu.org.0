Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD436F8FFA
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCFu-0004CQ-18; Sat, 06 May 2023 03:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFr-00049n-B6
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFh-0004O2-94
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307664010fdso2158345f8f.0
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357764; x=1685949764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
 b=yGvhL1E6195MFnoDw6ipjhBFWnd3Ms+fRiAJ3YP8ZgaZ1yMeysXAxqqRkymm1hZ0bq
 SC/RITQ9rQZ+4sEY6LAz0ijJMOudCs1JiEy05Spaf4g1MG1QJEZRg+r8lrXOI9YMfh3k
 klK9M9hD0e08Yj1ylkAmjnv/ITZEBgwbU3fHzIfl09XTLyF3oPTkEXiGfS2Jyj56UA1n
 vMwXs7Ggu2s/uOIioXT50YzeMsNIPYvqypvRK2dSOhJ6Tz6Hgq0V5Gf45Ya+fJljxHJ+
 V/jrvP4SLDc38d3lecHgQf2OnAidOhwWkQoqadtdPexxOq3SWX9tTcDvGPIB4JmglwkA
 Mytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357764; x=1685949764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+D3flHoA+lO9qFOAJD5/z5k4A1tFbbT3jeq7/jtxrQ=;
 b=gwWH9VklTo+sn92eQdbnUkwCMiAVBs/rV4t4TCO6jfvtj0jgKR0U4Ka399pr5HnyDn
 6gXkt4tkArNwfE4dgizasZ+43+/Q7VYSutEjCl294tz2hI/lwaeYnXRwi5q/C/ehNWRn
 Oj/Ygn2Ne07M2b+e98paj8NY/wWfcMSWD0pV7+Q0uXC8y/rErCu8BmxUWltegPKgM7/y
 ssJ60cNL07H6LB9jwhTqBEK1ksOylTeo6+a/GZBA1Ak0kDkT2mJCXJFyT34Te7iSz0vH
 AcTMDunxnYg6bZC037bUVHDwMwaZFyeJzeZ8SJUbkat9cJDHmufkqgDmAVKrJBt2JIfR
 QUxQ==
X-Gm-Message-State: AC+VfDxbDg7/9cmo4EWUNF4frxHy74Li42D/Tls7Gs84Ctbme9hI1T7g
 wDzZZoq8x92zmaoVshAHn1Iihb5kUWzXeGFsasHzKA==
X-Google-Smtp-Source: ACHHUZ7PGF0obSNe/C4q0PKv7+5zKb+UkBrOn7UC/eAsCKyHReqoWO6b1gsIcNMH3ZYIz/55qZXGbg==
X-Received: by 2002:a5d:6112:0:b0:306:2e62:7716 with SMTP id
 v18-20020a5d6112000000b003062e627716mr2507523wrt.56.1683357763837; 
 Sat, 06 May 2023 00:22:43 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 09/30] tcg/s390x: Introduce prepare_host_addr
Date: Sat,  6 May 2023 08:22:14 +0100
Message-Id: <20230506072235.597467-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
tcg_prepare_user_ldst, and some code that lived in both tcg_out_qemu_ld
and tcg_out_qemu_st into one function that returns HostAddress and
TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 263 ++++++++++++++++---------------------
 1 file changed, 113 insertions(+), 150 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index da7ee5b085..c3157d22be 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1718,78 +1718,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 #if defined(CONFIG_SOFTMMU)
-/* We're expecting to use a 20-bit negative offset on the tlb memory ops.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
-
-/* Load and compare a TLB entry, leaving the flags set.  Loads the TLB
-   addend into R2.  Returns a register with the santitized guest address.  */
-static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
-                               int mem_index, bool is_ld)
-{
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_mask = (1 << s_bits) - 1;
-    unsigned a_mask = (1 << a_bits) - 1;
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
-    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    int ofs, a_off;
-    uint64_t tlb_mask;
-
-    tcg_out_sh64(s, RSY_SRLG, TCG_REG_R2, addr_reg, TCG_REG_NONE,
-                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_insn(s, RXY, NG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, mask_off);
-    tcg_out_insn(s, RXY, AG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, table_off);
-
-    /* For aligned accesses, we check the first byte and include the alignment
-       bits within the address.  For unaligned access, we check that we don't
-       cross pages using the address of the last byte of the access.  */
-    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
-    tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
-    if (a_off == 0) {
-        tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
-    } else {
-        tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
-        tgen_andi(s, TCG_TYPE_TL, TCG_REG_R3, tlb_mask);
-    }
-
-    if (is_ld) {
-        ofs = offsetof(CPUTLBEntry, addr_read);
-    } else {
-        ofs = offsetof(CPUTLBEntry, addr_write);
-    }
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_insn(s, RX, C, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
-    } else {
-        tcg_out_insn(s, RXY, CG, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
-    }
-
-    tcg_out_insn(s, RXY, LG, TCG_REG_R2, TCG_REG_R2, TCG_REG_NONE,
-                 offsetof(CPUTLBEntry, addend));
-
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        return TCG_REG_R3;
-    }
-    return addr_reg;
-}
-
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGType type, TCGReg data, TCGReg addr,
-                                tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = type;
-    label->datalo_reg = data;
-    label->addrlo_reg = addr;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr;
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg addr_reg = lb->addrlo_reg;
@@ -1842,26 +1770,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 #else
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld,
-                                   TCGReg addrlo, unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addrlo;
-
-    /* We are expecting a_bits to max out at 7, much lower than TMLL. */
-    tcg_debug_assert(a_bits < 16);
-    tcg_out_insn(s, RI, TMLL, addrlo, a_mask);
-
-    tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
-    l->label_ptr[0] = s->code_ptr;
-    s->code_ptr += 1;
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
@@ -1888,91 +1796,146 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     return tcg_out_fail_alignment(s, l);
 }
+#endif /* CONFIG_SOFTMMU */
 
-static HostAddress tcg_prepare_user_ldst(TCGContext *s, TCGReg addr_reg)
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addr_reg, MemOpIdx oi,
+                                           bool is_ld)
 {
-    TCGReg index;
-    int disp;
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1u << a_bits) - 1;
 
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1 << s_bits) - 1;
+    int mem_index = get_mmuidx(oi);
+    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
+    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
+    int ofs, a_off;
+    uint64_t tlb_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    tcg_out_sh64(s, RSY_SRLG, TCG_REG_R2, addr_reg, TCG_REG_NONE,
+                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 19));
+    tcg_out_insn(s, RXY, NG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, mask_off);
+    tcg_out_insn(s, RXY, AG, TCG_REG_R2, TCG_AREG0, TCG_REG_NONE, table_off);
+
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
+    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
+    tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
+    if (a_off == 0) {
+        tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
+    } else {
+        tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
+        tgen_andi(s, TCG_TYPE_TL, TCG_REG_R3, tlb_mask);
+    }
+
+    if (is_ld) {
+        ofs = offsetof(CPUTLBEntry, addr_read);
+    } else {
+        ofs = offsetof(CPUTLBEntry, addr_write);
+    }
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_insn(s, RX, C, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+    } else {
+        tcg_out_insn(s, RXY, CG, TCG_REG_R3, TCG_REG_R2, TCG_REG_NONE, ofs);
+    }
+
+    tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
+    ldst->label_ptr[0] = s->code_ptr++;
+
+    h->index = TCG_REG_R2;
+    tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
+                 offsetof(CPUTLBEntry, addend));
+
+    h->base = addr_reg;
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
+        h->base = TCG_REG_R3;
+    }
+    h->disp = 0;
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /* We are expecting a_bits to max out at 7, much lower than TMLL. */
+        tcg_debug_assert(a_bits < 16);
+        tcg_out_insn(s, RI, TMLL, addr_reg, a_mask);
+
+        tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
+        ldst->label_ptr[0] = s->code_ptr++;
+    }
+
+    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
         tcg_out_ext32u(s, TCG_TMP0, addr_reg);
-        addr_reg = TCG_TMP0;
+        h->base = TCG_TMP0;
     }
     if (guest_base < 0x80000) {
-        index = TCG_REG_NONE;
-        disp = guest_base;
+        h->index = TCG_REG_NONE;
+        h->disp = guest_base;
     } else {
-        index = TCG_GUEST_BASE_REG;
-        disp = 0;
+        h->index = TCG_GUEST_BASE_REG;
+        h->disp = 0;
     }
-    return (HostAddress){ .base = addr_reg, .index = index, .disp = disp };
+#endif
+
+    return ldst;
 }
-#endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
-    tcg_insn_unit *label_ptr;
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, true);
+    tcg_out_qemu_ld_direct(s, get_memop(oi), data_reg, h);
 
-    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
-    h.index = TCG_REG_R2;
-    h.disp = 0;
-
-    tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
-    label_ptr = s->code_ptr;
-    s->code_ptr += 1;
-
-    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
-
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h = tcg_prepare_user_ldst(s, addr_reg);
-    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
-#endif
 }
 
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
-    tcg_insn_unit *label_ptr;
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, false);
+    tcg_out_qemu_st_direct(s, get_memop(oi), data_reg, h);
 
-    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
-    h.index = TCG_REG_R2;
-    h.disp = 0;
-
-    tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
-    label_ptr = s->code_ptr;
-    s->code_ptr += 1;
-
-    tcg_out_qemu_st_direct(s, opc, data_reg, h);
-
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h = tcg_prepare_user_ldst(s, addr_reg);
-    tcg_out_qemu_st_direct(s, opc, data_reg, h);
-#endif
 }
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
-- 
2.34.1


