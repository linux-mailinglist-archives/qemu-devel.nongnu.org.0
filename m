Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717A47C4C5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:13:31 +0100 (CET)
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzihe-0000re-BB
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:13:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ7-0000qH-SX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:09 -0500
Received: from [2607:f8b0:4864:20::435] (port=42585
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIz-0007eg-H6
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id t19so5970422pfg.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=csDkV2A6VW7PSchAvPx50pxKFBvXv87Mu1z9BJkzMUU=;
 b=cFC9VjE5UX3HjJzWXyaaRhqEgnCTaJwM0vJZa5SUT4x+I2Tp+nhWlsX1Pzsv7bEZPy
 LL2YpE+fvTIdaP+F6FhcK95RBBKe28IuKEZ+9dP/bkeOqCWQxYDkmKtIs477ioAkL8JK
 8gi/Mm5mbd87wxILWtD6iUVxKZgk8V/8PGZwbaoLu1dwFqZ3yOGMUBrwa9y/NWRNilV4
 gWnwgxV1nnx/jhb3m5LMknnYzwWUSysawYvzCKrmQpYsvRKKzl18nw4dW3VgGR+jNiz3
 EExnYxIgjB4QbxazrtvrTCK5IIHjQdHcviAM0zQHuMEoQPX3yxqB9SVtzoiW2XOnHjFW
 2Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=csDkV2A6VW7PSchAvPx50pxKFBvXv87Mu1z9BJkzMUU=;
 b=AkrukLRYaX4GIJdqgPFU9QouETWOTwPscyN38mVCCfRtKMS1Zp2Vy4gE1YPwrAGYx/
 8W4yTKwzXCygEbAFC59egLrVtz4zJY21Z2+Ncx56B8Bvx6StYv8OdQg+mwzt0nJHDEOD
 rp9brVzjUTefaNNYryz/MCWSeccmOxBSoDLhfG3Sdx1rDznxCEy0g2/x0W9OVWHy1GcQ
 qsp+vF+o8zhdCe30nSdfTz2cEkP4Rk1e5tmOI6kVrR1L+MCfuHyVdE0f5hR0XvNT6tlZ
 8oZj90anIwcCulh9CNUHJf+QYBlmC2D0F0Kn9k/5WIpzN/RYs2Z6tVPulAnAiSr905Lm
 fCog==
X-Gm-Message-State: AOAM533V8W4s3QDZqZ+wwYqSFlTTDTVhxo10msbs+fnhQBXpz9kMRvet
 Qkh6+yfumP5JCIyRU1bA37c6HNF9g92Dtg==
X-Google-Smtp-Source: ABdhPJzVNuWsXAAZJ+7/0I0km8XlL0qEgtyg2jyY8c9LGrxQA0jmfqzBt4PV+4T5tfAk/zvO1R2UMQ==
X-Received: by 2002:a05:6a00:248a:b0:4b0:b882:dfc4 with SMTP id
 c10-20020a056a00248a00b004b0b882dfc4mr4076077pfv.37.1640105280238; 
 Tue, 21 Dec 2021 08:48:00 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/31] tcg/loongarch64: Add softmmu load/store helpers,
 implement qemu_ld/qemu_st ops
Date: Tue, 21 Dec 2021 08:47:29 -0800
Message-Id: <20211221164737.1076007-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-24-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |   2 +
 tcg/loongarch64/tcg-target.c.inc     | 353 +++++++++++++++++++++++++++
 2 files changed, 355 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index e54ca9b2de..349c672687 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,7 +17,9 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
+C_O0_I2(LZ, L)
 C_O1_I1(r, r)
+C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 3d1d7c33c0..f67d5fa110 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -117,6 +117,11 @@ static const int tcg_target_call_oarg_regs[] = {
     TCG_REG_A1,
 };
 
+#ifndef CONFIG_SOFTMMU
+#define USE_GUEST_BASE     (guest_base != 0)
+#define TCG_GUEST_BASE_REG TCG_REG_S1
+#endif
+
 #define TCG_CT_CONST_ZERO  0x100
 #define TCG_CT_CONST_S12   0x200
 #define TCG_CT_CONST_N12   0x400
@@ -632,6 +637,333 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+/*
+ * Load/store helpers for SoftMMU, and qemu_ld/st implementations
+ */
+
+#if defined(CONFIG_SOFTMMU)
+#include "../tcg-ldst.c.inc"
+
+/*
+ * helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
+ *                                     MemOpIdx oi, uintptr_t ra)
+ */
+static void * const qemu_ld_helpers[4] = {
+    [MO_8]  = helper_ret_ldub_mmu,
+    [MO_16] = helper_le_lduw_mmu,
+    [MO_32] = helper_le_ldul_mmu,
+    [MO_64] = helper_le_ldq_mmu,
+};
+
+/*
+ * helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
+ *                                     uintxx_t val, MemOpIdx oi,
+ *                                     uintptr_t ra)
+ */
+static void * const qemu_st_helpers[4] = {
+    [MO_8]  = helper_ret_stb_mmu,
+    [MO_16] = helper_le_stw_mmu,
+    [MO_32] = helper_le_stl_mmu,
+    [MO_64] = helper_le_stq_mmu,
+};
+
+/* We expect to use a 12-bit negative offset from ENV.  */
+QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
+
+static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
+{
+    tcg_out_opc_b(s, 0);
+    return reloc_br_sd10k16(s->code_ptr - 1, target);
+}
+
+/*
+ * Emits common code for TLB addend lookup, that eventually loads the
+ * addend in TCG_REG_TMP2.
+ */
+static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, MemOpIdx oi,
+                             tcg_insn_unit **label_ptr, bool is_load)
+{
+    MemOp opc = get_memop(oi);
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned a_bits = get_alignment_bits(opc);
+    tcg_target_long compare_mask;
+    int mem_index = get_mmuidx(oi);
+    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
+    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
+
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
+
+    tcg_out_opc_srli_d(s, TCG_REG_TMP2, addrl,
+                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_and(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
+    tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
+
+    /* Load the tlb comparator and the addend.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+               is_load ? offsetof(CPUTLBEntry, addr_read)
+               : offsetof(CPUTLBEntry, addr_write));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
+               offsetof(CPUTLBEntry, addend));
+
+    /* We don't support unaligned accesses.  */
+    if (a_bits < s_bits) {
+        a_bits = s_bits;
+    }
+    /* Clear the non-page, non-alignment bits from the address.  */
+    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
+
+    /* Compare masked address with the TLB entry.  */
+    label_ptr[0] = s->code_ptr;
+    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+
+    /* TLB Hit - addend in TCG_REG_TMP2, ready for use.  */
+}
+
+static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
+                                TCGType type,
+                                TCGReg datalo, TCGReg addrlo,
+                                void *raddr, tcg_insn_unit **label_ptr)
+{
+    TCGLabelQemuLdst *label = new_ldst_label(s);
+
+    label->is_ld = is_ld;
+    label->oi = oi;
+    label->type = type;
+    label->datalo_reg = datalo;
+    label->datahi_reg = 0; /* unused */
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = 0; /* unused */
+    label->raddr = tcg_splitwx_to_rx(raddr);
+    label->label_ptr[0] = label_ptr[0];
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    MemOpIdx oi = l->oi;
+    MemOp opc = get_memop(oi);
+    MemOp size = opc & MO_SIZE;
+    TCGType type = l->type;
+
+    /* resolve label address */
+    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    /* call load helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_ld_helpers[size]);
+
+    switch (opc & MO_SSIZE) {
+    case MO_SB:
+        tcg_out_ext8s(s, l->datalo_reg, TCG_REG_A0);
+        break;
+    case MO_SW:
+        tcg_out_ext16s(s, l->datalo_reg, TCG_REG_A0);
+        break;
+    case MO_SL:
+        tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
+        break;
+    case MO_UL:
+        if (type == TCG_TYPE_I32) {
+            /* MO_UL loads of i32 should be sign-extended too */
+            tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
+            break;
+        }
+        /* fallthrough */
+    default:
+        tcg_out_mov(s, type, l->datalo_reg, TCG_REG_A0);
+        break;
+    }
+
+    return tcg_out_goto(s, l->raddr);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    MemOpIdx oi = l->oi;
+    MemOp opc = get_memop(oi);
+    MemOp size = opc & MO_SIZE;
+
+    /* resolve label address */
+    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    /* call store helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
+    switch (size) {
+    case MO_8:
+        tcg_out_ext8u(s, TCG_REG_A2, l->datalo_reg);
+        break;
+    case MO_16:
+        tcg_out_ext16u(s, TCG_REG_A2, l->datalo_reg);
+        break;
+    case MO_32:
+        tcg_out_ext32u(s, TCG_REG_A2, l->datalo_reg);
+        break;
+    case MO_64:
+        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_A2, l->datalo_reg);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_st_helpers[size]);
+
+    return tcg_out_goto(s, l->raddr);
+}
+#endif /* CONFIG_SOFTMMU */
+
+/*
+ * `ext32u` the address register into the temp register given,
+ * if target is 32-bit, no-op otherwise.
+ *
+ * Returns the address register ready for use with TLB addend.
+ */
+static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
+                                          TCGReg addr, TCGReg tmp)
+{
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, tmp, addr);
+        return tmp;
+    }
+    return addr;
+}
+
+static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
+                                   TCGReg rk, MemOp opc, TCGType type)
+{
+    /* Byte swapping is left to middle-end expansion.  */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
+
+    switch (opc & MO_SSIZE) {
+    case MO_UB:
+        tcg_out_opc_ldx_bu(s, rd, rj, rk);
+        break;
+    case MO_SB:
+        tcg_out_opc_ldx_b(s, rd, rj, rk);
+        break;
+    case MO_UW:
+        tcg_out_opc_ldx_hu(s, rd, rj, rk);
+        break;
+    case MO_SW:
+        tcg_out_opc_ldx_h(s, rd, rj, rk);
+        break;
+    case MO_UL:
+        if (type == TCG_TYPE_I64) {
+            tcg_out_opc_ldx_wu(s, rd, rj, rk);
+            break;
+        }
+        /* fallthrough */
+    case MO_SL:
+        tcg_out_opc_ldx_w(s, rd, rj, rk);
+        break;
+    case MO_Q:
+        tcg_out_opc_ldx_d(s, rd, rj, rk);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
+{
+    TCGReg addr_regl;
+    TCGReg data_regl;
+    MemOpIdx oi;
+    MemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base;
+
+    data_regl = *args++;
+    addr_regl = *args++;
+    oi = *args++;
+    opc = get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    tcg_out_qemu_ld_indexed(s, data_regl, base, TCG_REG_TMP2, opc, type);
+    add_qemu_ldst_label(s, 1, oi, type,
+                        data_regl, addr_regl,
+                        s->code_ptr, label_ptr);
+#else
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    tcg_out_qemu_ld_indexed(s, data_regl, base, guest_base_reg, opc, type);
+#endif
+}
+
+static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
+                                   TCGReg rj, TCGReg rk, MemOp opc)
+{
+    /* Byte swapping is left to middle-end expansion.  */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
+
+    switch (opc & MO_SIZE) {
+    case MO_8:
+        tcg_out_opc_stx_b(s, data, rj, rk);
+        break;
+    case MO_16:
+        tcg_out_opc_stx_h(s, data, rj, rk);
+        break;
+    case MO_32:
+        tcg_out_opc_stx_w(s, data, rj, rk);
+        break;
+    case MO_64:
+        tcg_out_opc_stx_d(s, data, rj, rk);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
+{
+    TCGReg addr_regl;
+    TCGReg data_regl;
+    MemOpIdx oi;
+    MemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base;
+
+    data_regl = *args++;
+    addr_regl = *args++;
+    oi = *args++;
+    opc = get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
+    add_qemu_ldst_label(s, 0, oi,
+                        0, /* type param is unused for stores */
+                        data_regl, addr_regl,
+                        s->code_ptr, label_ptr);
+#else
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    tcg_out_qemu_st_indexed(s, data_regl, base, guest_base_reg, opc);
+#endif
+}
+
 /*
  * Entry-points
  */
@@ -1023,6 +1355,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ldst(s, OPC_ST_D, a0, a1, a2);
         break;
 
+    case INDEX_op_qemu_ld_i32:
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
+        break;
+    case INDEX_op_qemu_ld_i64:
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
+        break;
+    case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, args);
+        break;
+    case INDEX_op_qemu_st_i64:
+        tcg_out_qemu_st(s, args);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
@@ -1050,6 +1395,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
+        return C_O0_I2(LZ, L);
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -1087,6 +1436,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld_i64:
         return C_O1_I1(r, r);
 
+    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_i64:
+        return C_O1_I1(r, L);
+
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
     case INDEX_op_orc_i32:
-- 
2.25.1


