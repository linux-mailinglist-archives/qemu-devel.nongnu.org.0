Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB48698ADD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTX-0003pO-Da; Wed, 15 Feb 2023 21:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTV-0003l3-N2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:21 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTT-0005o1-AR
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:21 -0500
Received: by mail-pf1-x430.google.com with SMTP id b1so600477pft.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SCpgDrDSeXYRNeccRXJlncfjqmKvR7yI1DKKfk5rUfY=;
 b=RsY4Q3Rmb1KNuaGxBVT2iNzZJXXCJygYwRQXAYbUzpEpP2y0BiUpiX7vxUygSSLD14
 Mv5Gh4qrBStVCf7uOiNNA11QAKcSJTQ8BjeYaZepHFZV7+PBcpTEXxZIye/zgdn2C/M8
 dP57Fyu3FF5H8BCsMbDn3edD/MxuMBfOtmYmi22t94I/x7OU0a0+sz2keiIW1k7u3E4J
 Z9ztGjhiTwdSZY7/jnZ3B9ilmnFepNo9nGkTRsd2F1j6cg8d0TgrKU4j8IsPV9MnrYj/
 qI3pY0E0lWVlhollO25/96hJWfIXBQKNYx5f3KiUGXkU1e2huTKkjrdNnHvpd+wvkNjK
 zuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCpgDrDSeXYRNeccRXJlncfjqmKvR7yI1DKKfk5rUfY=;
 b=oAMhLJzBMi5DWkjsXuntWuELfqXZpI2A3hzoj+0VRAHX0IneKFvRzNo5rlEREhFRpD
 TWnNBwm/W8otruWFjYtJ8wiO30jab8fv3YFySIc8cK27G9wtoxehVIACAVkYrfc87DUX
 R4+AI1Ri/DXxSMCR4GpnfAYYoQTeWeBjf2prLuqeV5bpWGqbFGLH9mlO4UNGbUeDmp9Q
 ViNX3urG/ZSGjfpi8x0bpdoc5Yc+e40K+HhnP07D2V9Gi/biXVW3f6T9negYkYHna4Bw
 9RgvELQw+2E219EqePCQm+CnT4ExLeXpaz7beheyq36M5axW9S+KRjZwDO+cAy7miNl7
 SnWA==
X-Gm-Message-State: AO0yUKU1lu3u0mM+0BqNcN/nxXL1NrtInihs3GsL4hG0Gsef6SItyQ/h
 EAEMXpCeW4bBrICW6P3NbBAc4hohyfhXd6XEazg=
X-Google-Smtp-Source: AK7set9yCCXS+L+j1sWxL6iNYrUKWZjbb89R3R5dvwKPQWU44nr3+wuAA+7xjVPn4h4V3rLe4zAStQ==
X-Received: by 2002:aa7:9591:0:b0:5a8:ab21:be2e with SMTP id
 z17-20020aa79591000000b005a8ab21be2emr3797849pfj.18.1676516298413; 
 Wed, 15 Feb 2023 18:58:18 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/30] tcg/i386: Examine MemOp for atomicity and alignment
Date: Wed, 15 Feb 2023 16:57:36 -1000
Message-Id: <20230216025739.1211680-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

No change to the ultimate load/store routines yet, so some
atomicity conditions not yet honored, but plumbs the change
to alignment through the adjacent functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 128 ++++++++++++++++++++++++++++++--------
 1 file changed, 101 insertions(+), 27 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 21442c9339..6ee7bc5a9a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1746,6 +1746,83 @@ tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
     }
 }
 
+/*
+ * Return the alignment and atomicity to use for the inline fast path
+ * for the given memory operation.  The alignment may be larger than
+ * that specified in @opc, and the correct alignment will be diagnosed
+ * by the slow path helper.
+ */
+static MemOp atom_and_align_for_opc(TCGContext *s, MemOp opc, MemOp *out_al)
+{
+    MemOp align = get_alignment_bits(opc);
+    MemOp atom, atmax, atsub, size = opc & MO_SIZE;
+
+    /* When serialized, no further atomicity required.  */
+    if (s->gen_tb->cflags & CF_PARALLEL) {
+        atom = opc & MO_ATOM_MASK;
+    } else {
+        atom = MO_ATOM_NONE;
+    }
+
+    atmax = opc & MO_ATMAX_MASK;
+    if (atmax == MO_ATMAX_SIZE) {
+        atmax = size;
+    } else {
+        atmax = atmax >> MO_ATMAX_SHIFT;
+    }
+
+    switch (atom) {
+    case MO_ATOM_NONE:
+        /* The operation requires no specific atomicity. */
+        atmax = MO_8;
+        atsub = MO_8;
+        break;
+    case MO_ATOM_IFALIGN:
+        /* If unaligned, the subobjects are bytes. */
+        atsub = MO_8;
+        break;
+    case MO_ATOM_WITHIN16:
+        /* If unaligned, there are subobjects if atmax < size. */
+        atsub = (atmax < size ? atmax : MO_8);
+        atmax = size;
+        break;
+    case MO_ATOM_SUBALIGN:
+        /* If unaligned but not odd, there are subobjects up to atmax - 1. */
+        atsub = (atmax == MO_8 ? MO_8 : atmax - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /*
+     * Per Intel Architecture SDM, Volume 3 Section 8.1.1,
+     * - Pentium family guarantees atomicity of aligned <= 64-bit.
+     * - P6 family guarantees atomicity of unaligned <= 64-bit
+     *   which fit within a cache line.
+     * - AVX guarantees atomicity of aligned 128-bit VMOVDQA (et al).
+     *
+     * There is no language in the Intel manual specifying what happens
+     * with the partial memory operations when crossing a cache line.
+     * When there is required atomicity of subobjects, we must perform
+     * an additional runtime test for alignment and then perform either
+     * the full operation, or two half-sized operations.
+     *
+     * For x86_64, and MO_64, we do not have a scratch register with
+     * which to do this.  Only allow splitting for MO_64 on i386,
+     * where the data is already separated, or MO_128.
+     * Otherwise, require full alignment and fall back to the helper
+     * for the misaligned case.
+     */
+    if (align < atmax
+        && atsub != MO_8
+        && size != (TCG_TARGET_REG_BITS == 64 ? MO_128 : MO_64)) {
+        align = size;
+    }
+
+    *out_al = align;
+    return atmax;
+}
+
 /*
  * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
  *                                  int mmu_idx, uintptr_t ra)
@@ -1987,7 +2064,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
  * First argument register is clobbered.
  */
 static void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
-                             int mem_index, MemOp opc,
+                             int mem_index, MemOp a_bits, MemOp s_bits,
                              tcg_insn_unit **label_ptr, int which)
 {
     const TCGReg r0 = TCG_REG_L0;
@@ -1995,8 +2072,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     TCGType ttype = TCG_TYPE_I32;
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
     unsigned a_mask = (1 << a_bits) - 1;
     unsigned s_mask = (1 << s_bits) - 1;
     target_ulong tlb_mask;
@@ -2124,7 +2199,8 @@ static inline int setup_guest_base_seg(void)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, TCGType type, MemOp memop)
+                                   int seg, TCGType type, MemOp memop,
+                                   MemOp atom, MemOp align)
 {
     bool use_movbe = false;
     int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
@@ -2225,11 +2301,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
     MemOpIdx oi;
-    MemOp opc;
+    MemOp opc, atom, align;
     tcg_insn_unit *label_ptr[2] = { };
-#ifndef CONFIG_SOFTMMU
-    unsigned a_bits;
-#endif
 
     datalo = *args++;
     switch (type) {
@@ -2246,26 +2319,27 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
     opc = get_memop(oi);
+    atom = atom_and_align_for_opc(s, opc, &align);
 
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), align, opc & MO_SIZE,
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, type, opc);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, type,
+                           opc, atom, align);
 
     /* Record the current context of a load into ldst label */
     add_qemu_ldst_label(s, true, type, oi, datalo, datahi,
                         TCG_REG_L1, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, addrlo, a_bits, label_ptr);
+    if (align) {
+        tcg_out_test_alignment(s, addrlo, align, label_ptr);
     }
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
-                           type, opc);
-    if (a_bits) {
+                           type, opc, atom, align);
+    if (align) {
         add_qemu_ldst_label(s, true, type, oi, datalo, datahi,
                             addrlo, addrhi, s->code_ptr, label_ptr);
     }
@@ -2274,7 +2348,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
 
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, MemOp memop)
+                                   int seg, MemOp memop,
+                                   MemOp atom, MemOp align)
 {
     bool use_movbe = false;
     int movop = OPC_MOVL_EvGv;
@@ -2329,11 +2404,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
     MemOpIdx oi;
-    MemOp opc;
+    MemOp opc, atom, align;
     tcg_insn_unit *label_ptr[2] = { };
-#ifndef CONFIG_SOFTMMU
-    unsigned a_bits;
-#endif
 
     datalo = *args++;
     switch (type) {
@@ -2350,25 +2422,27 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
     opc = get_memop(oi);
+    atom = atom_and_align_for_opc(s, opc, &align);
 
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), align, opc & MO_SIZE,
                      label_ptr, offsetof(CPUTLBEntry, addr_write));
 
     /* TLB Hit.  */
-    tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
+    tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0,
+                           opc, atom, align);
 
     /* Record the current context of a store into ldst label */
     add_qemu_ldst_label(s, false, type, oi, datalo, datahi,
                         TCG_REG_L1, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, addrlo, a_bits, label_ptr);
+    if (align) {
+        tcg_out_test_alignment(s, addrlo, align, label_ptr);
     }
     tcg_out_qemu_st_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
-                           x86_guest_base_offset, x86_guest_base_seg, opc);
-    if (a_bits) {
+                           x86_guest_base_offset, x86_guest_base_seg,
+                           opc, atom, align);
+    if (align) {
         add_qemu_ldst_label(s, false, type, oi, datalo, datahi,
                             addrlo, addrhi, s->code_ptr, label_ptr);
     }
-- 
2.34.1


