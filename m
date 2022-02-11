Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB6A4B1BB3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:57:56 +0100 (CET)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILC7-0003Tw-Qt
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo7-0005Y0-4C
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:07 -0500
Received: from [2607:f8b0:4864:20::62e] (port=43593
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo0-0007VK-7e
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:06 -0500
Received: by mail-pl1-x62e.google.com with SMTP id p6so3215885plf.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9Mw3HOlXqdDBaQPUYlwfi1FpDtHVrlZ6VwZ3zscXTc=;
 b=iLLU7G0xEPERwL617JheJXI97lzvAVda3ge31Ii/cXJ3JO7k40WnKny1fkQ3rGR4Gs
 rWUCh5QHNDSeLoD1LF6Jhhyxs4Oh6vySIkvqxkmkWzkySiMQTUB0670YYtQNF09ZK6ww
 p2EtJfEilzUvc4G0okjWJCU/jxs0Qb/IAPqpC/kt6nClM1wfgeehxn/ohJGMk1QSLWb6
 yEazQIB0KCq4oCtND34JjvDknvcySndIQRoOgcOAmyfFpp4Kses7qOPtCCf3y/GlGH4V
 0d9ZBT+yek0qZcda5QlIFtxLpL+zitWOQizRJ7cTYP+69gVyXaF7vQ7UacUSE1uEPIfx
 tgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9Mw3HOlXqdDBaQPUYlwfi1FpDtHVrlZ6VwZ3zscXTc=;
 b=4awTGUIRps/aKhrBaIg2knrqTo8CGojFlTOQfh5uAhHd8TPUE5kL41+ItILPQZ4wLW
 x0Z4NfflsLOiJT5+dojoC02TSm45JpVRW+GwaTG8Cei3CC1JTVZWpINuxLUF/ffSKTfG
 O2oIemMQaAE964W+mJYvOf/r/WIZj3z7sPyYgP47jxDFl49GZ2fCZP+83CY5a3cFKvgS
 77u+ar0pYSUXFvzA37ya/9HxQitnEpgA0/gpHpnYuqVaE3ko2yUzf4s6ahDah01sSmLj
 3S6eddDe3ORVb8rLlUPQzhgOAnfCXygTfUK3PauJZaUtCpkABOVLAWa5L/k/sPVZsJRt
 MLdQ==
X-Gm-Message-State: AOAM530Wq5awYVrT5Tf/s74/pA+W0l8DGSMIRmUtrNcSw7EVgcnYCmSl
 nk/b4dgnCVIruTcNNtPS0TuLfNwXlUcb+pXb
X-Google-Smtp-Source: ABdhPJwNVo+MCIDkmsgebmGL73Rnorq1KzLiVnQ2sIKSaVAACYhhDNiqeaeYmify+ZxuVlaYqyeV1w==
X-Received: by 2002:a17:90a:5d82:: with SMTP id t2mr207994pji.65.1644543178137; 
 Thu, 10 Feb 2022 17:32:58 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/34] tcg/sparc: Support unaligned access for user-only
Date: Fri, 11 Feb 2022 12:30:58 +1100
Message-Id: <20220211013059.17994-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is kinda sorta the opposite of the other tcg hosts, where
we get (normal) alignment checks for free with host SIGBUS and
need to add code to support unaligned accesses.

This inline code expansion is somewhat large, but it takes quite
a few instructions to make a function call to a helper anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 219 +++++++++++++++++++++++++++++++++++--
 1 file changed, 211 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 646bb462c3..72d9552fd0 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -211,6 +211,7 @@ static const int tcg_target_call_oarg_regs[] = {
 #define ARITH_ADD  (INSN_OP(2) | INSN_OP3(0x00))
 #define ARITH_ADDCC (INSN_OP(2) | INSN_OP3(0x10))
 #define ARITH_AND  (INSN_OP(2) | INSN_OP3(0x01))
+#define ARITH_ANDCC (INSN_OP(2) | INSN_OP3(0x11))
 #define ARITH_ANDN (INSN_OP(2) | INSN_OP3(0x05))
 #define ARITH_OR   (INSN_OP(2) | INSN_OP3(0x02))
 #define ARITH_ORCC (INSN_OP(2) | INSN_OP3(0x12))
@@ -1025,6 +1026,38 @@ static void build_trampolines(TCGContext *s)
         tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
     }
 }
+#else
+static const tcg_insn_unit *qemu_unalign_ld_trampoline;
+static const tcg_insn_unit *qemu_unalign_st_trampoline;
+
+static void build_trampolines(TCGContext *s)
+{
+    for (int ld = 0; ld < 2; ++ld) {
+        void *helper;
+
+        while ((uintptr_t)s->code_ptr & 15) {
+            tcg_out_nop(s);
+        }
+
+        if (ld) {
+            helper = helper_unaligned_ld;
+            qemu_unalign_ld_trampoline = tcg_splitwx_to_rx(s->code_ptr);
+        } else {
+            helper = helper_unaligned_st;
+            qemu_unalign_st_trampoline = tcg_splitwx_to_rx(s->code_ptr);
+        }
+
+        if (!SPARC64 && TARGET_LONG_BITS == 64) {
+            /* Install the high part of the address.  */
+            tcg_out_arithi(s, TCG_REG_O1, TCG_REG_O2, 32, SHIFT_SRLX);
+        }
+
+        /* Tail call.  */
+        tcg_out_jmpl_const(s, helper, true, true);
+        /* delay slot -- set the env argument */
+        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
+    }
+}
 #endif
 
 /* Generate global QEMU prologue and epilogue code */
@@ -1075,9 +1108,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     /* delay slot */
     tcg_out_movi_imm13(s, TCG_REG_O0, 0);
 
-#ifdef CONFIG_SOFTMMU
     build_trampolines(s);
-#endif
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
@@ -1162,18 +1193,22 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
 static const int qemu_ld_opc[(MO_SSIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = LDUB,
     [MO_SB]   = LDSB,
+    [MO_UB | MO_LE] = LDUB,
+    [MO_SB | MO_LE] = LDSB,
 
     [MO_BEUW] = LDUH,
     [MO_BESW] = LDSH,
     [MO_BEUL] = LDUW,
     [MO_BESL] = LDSW,
     [MO_BEUQ] = LDX,
+    [MO_BESQ] = LDX,
 
     [MO_LEUW] = LDUH_LE,
     [MO_LESW] = LDSH_LE,
     [MO_LEUL] = LDUW_LE,
     [MO_LESL] = LDSW_LE,
     [MO_LEUQ] = LDX_LE,
+    [MO_LESQ] = LDX_LE,
 };
 
 static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
@@ -1192,11 +1227,12 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
                             MemOpIdx oi, bool is_64)
 {
     MemOp memop = get_memop(oi);
+    tcg_insn_unit *label_ptr;
+
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
     TCGReg addrz, param;
     const tcg_insn_unit *func;
-    tcg_insn_unit *label_ptr;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
                              offsetof(CPUTLBEntry, addr_read));
@@ -1260,13 +1296,99 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 
     *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
 #else
+    TCGReg index = (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0);
+    unsigned a_bits = get_alignment_bits(memop);
+    unsigned s_bits = memop & MO_SIZE;
+    unsigned t_bits;
+
     if (SPARC64 && TARGET_LONG_BITS == 32) {
         tcg_out_arithi(s, TCG_REG_T1, addr, 0, SHIFT_SRL);
         addr = TCG_REG_T1;
     }
-    tcg_out_ldst_rr(s, data, addr,
-                    (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0),
+
+    /*
+     * Normal case: alignment equal to access size.
+     */
+    if (a_bits == s_bits) {
+        tcg_out_ldst_rr(s, data, addr, index,
+                        qemu_ld_opc[memop & (MO_BSWAP | MO_SSIZE)]);
+        return;
+    }
+
+    /*
+     * Test for at least natural alignment, and assume most accesses
+     * will be aligned -- perform a straight load in the delay slot.
+     * This is required to preserve atomicity for aligned accesses.
+     */
+    t_bits = MAX(a_bits, s_bits);
+    tcg_debug_assert(t_bits < 13);
+    tcg_out_arithi(s, TCG_REG_G0, addr, (1u << t_bits) - 1, ARITH_ANDCC);
+
+    /* beq,a,pt %icc, label */
+    label_ptr = s->code_ptr;
+    tcg_out_bpcc0(s, COND_E, BPCC_A | BPCC_PT | BPCC_ICC, 0);
+    /* delay slot */
+    tcg_out_ldst_rr(s, data, addr, index,
                     qemu_ld_opc[memop & (MO_BSWAP | MO_SSIZE)]);
+
+    if (a_bits >= s_bits) {
+        /*
+         * Overalignment: A successful alignment test will perform the memory
+         * operation in the delay slot, and failure need only invoke the
+         * handler for SIGBUS.
+         */
+        TCGReg arg_low = TCG_REG_O1 + (!SPARC64 && TARGET_LONG_BITS == 64);
+        tcg_out_call_nodelay(s, qemu_unalign_ld_trampoline, false);
+        /* delay slot -- move to low part of argument reg */
+        tcg_out_mov_delay(s, arg_low, addr);
+    } else {
+        /* Underalignment: load by pieces of minimum alignment. */
+        int ld_opc, a_size, s_size, i;
+
+        /*
+         * Force full address into T1 early; avoids problems with
+         * overlap between @addr and @data.
+         */
+        tcg_out_arith(s, TCG_REG_T1, addr, index, ARITH_ADD);
+
+        a_size = 1 << a_bits;
+        s_size = 1 << s_bits;
+        if ((memop & MO_BSWAP) == MO_BE) {
+            ld_opc = qemu_ld_opc[a_bits | MO_BE | (memop & MO_SIGN)];
+            tcg_out_ldst(s, data, TCG_REG_T1, 0, ld_opc);
+            ld_opc = qemu_ld_opc[a_bits | MO_BE];
+            for (i = a_size; i < s_size; i += a_size) {
+                tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, ld_opc);
+                tcg_out_arithi(s, data, data, a_size, SHIFT_SLLX);
+                tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
+            }
+        } else if (a_bits == 0) {
+            ld_opc = LDUB;
+            tcg_out_ldst(s, data, TCG_REG_T1, 0, ld_opc);
+            for (i = a_size; i < s_size; i += a_size) {
+                if ((memop & MO_SIGN) && i == s_size - a_size) {
+                    ld_opc = LDSB;
+                }
+                tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, ld_opc);
+                tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, i * 8, SHIFT_SLLX);
+                tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
+            }
+        } else {
+            ld_opc = qemu_ld_opc[a_bits | MO_LE];
+            tcg_out_ldst_rr(s, data, TCG_REG_T1, TCG_REG_G0, ld_opc);
+            for (i = a_size; i < s_size; i += a_size) {
+                tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, a_size, ARITH_ADD);
+                if ((memop & MO_SIGN) && i == s_size - a_size) {
+                    ld_opc = qemu_ld_opc[a_bits | MO_LE | MO_SIGN];
+                }
+                tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0, ld_opc);
+                tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, i * 8, SHIFT_SLLX);
+                tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
+            }
+        }
+    }
+
+    *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
 #endif /* CONFIG_SOFTMMU */
 }
 
@@ -1274,11 +1396,12 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
                             MemOpIdx oi)
 {
     MemOp memop = get_memop(oi);
+    tcg_insn_unit *label_ptr;
+
 #ifdef CONFIG_SOFTMMU
     unsigned memi = get_mmuidx(oi);
     TCGReg addrz, param;
     const tcg_insn_unit *func;
-    tcg_insn_unit *label_ptr;
 
     addrz = tcg_out_tlb_load(s, addr, memi, memop,
                              offsetof(CPUTLBEntry, addr_write));
@@ -1315,13 +1438,93 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
     *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
 #else
+    TCGReg index = (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0);
+    unsigned a_bits = get_alignment_bits(memop);
+    unsigned s_bits = memop & MO_SIZE;
+    unsigned t_bits;
+
     if (SPARC64 && TARGET_LONG_BITS == 32) {
         tcg_out_arithi(s, TCG_REG_T1, addr, 0, SHIFT_SRL);
         addr = TCG_REG_T1;
     }
-    tcg_out_ldst_rr(s, data, addr,
-                    (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0),
+
+    /*
+     * Normal case: alignment equal to access size.
+     */
+    if (a_bits == s_bits) {
+        tcg_out_ldst_rr(s, data, addr, index,
+                        qemu_st_opc[memop & (MO_BSWAP | MO_SIZE)]);
+        return;
+    }
+
+    /*
+     * Test for at least natural alignment, and assume most accesses
+     * will be aligned -- perform a straight store in the delay slot.
+     * This is required to preserve atomicity for aligned accesses.
+     */
+    t_bits = MAX(a_bits, s_bits);
+    tcg_debug_assert(t_bits < 13);
+    tcg_out_arithi(s, TCG_REG_G0, addr, (1u << t_bits) - 1, ARITH_ANDCC);
+
+    /* beq,a,pt %icc, label */
+    label_ptr = s->code_ptr;
+    tcg_out_bpcc0(s, COND_E, BPCC_A | BPCC_PT | BPCC_ICC, 0);
+    /* delay slot */
+    tcg_out_ldst_rr(s, data, addr, index,
                     qemu_st_opc[memop & (MO_BSWAP | MO_SIZE)]);
+
+    if (a_bits >= s_bits) {
+        /*
+         * Overalignment: A successful alignment test will perform the memory
+         * operation in the delay slot, and failure need only invoke the
+         * handler for SIGBUS.
+         */
+        TCGReg arg_low = TCG_REG_O1 + (!SPARC64 && TARGET_LONG_BITS == 64);
+        tcg_out_call_nodelay(s, qemu_unalign_st_trampoline, false);
+        /* delay slot -- move to low part of argument reg */
+        tcg_out_mov_delay(s, arg_low, addr);
+    } else {
+        /* Underalignment: store by pieces of minimum alignment. */
+        int st_opc, a_size, s_size, i;
+
+        /*
+         * Force full address into T1 early; avoids problems with
+         * overlap between @addr and @data.
+         */
+        tcg_out_arith(s, TCG_REG_T1, addr, index, ARITH_ADD);
+
+        a_size = 1 << a_bits;
+        s_size = 1 << s_bits;
+        if ((memop & MO_BSWAP) == MO_BE) {
+            st_opc = qemu_st_opc[a_bits | MO_BE];
+            for (i = 0; i < s_size; i += a_size) {
+                TCGReg d = data;
+                int shift = (s_size - a_size - i) * 8;
+                if (shift) {
+                    d = TCG_REG_T2;
+                    tcg_out_arithi(s, d, data, shift, SHIFT_SRLX);
+                }
+                tcg_out_ldst(s, d, TCG_REG_T1, i, st_opc);
+            }
+        } else if (a_bits == 0) {
+            tcg_out_ldst(s, data, TCG_REG_T1, 0, STB);
+            for (i = 1; i < s_size; i++) {
+                tcg_out_arithi(s, TCG_REG_T2, data, i * 8, SHIFT_SRLX);
+                tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, STB);
+            }
+        } else {
+            /* Note that ST*A with immediate asi must use indexed address. */
+            st_opc = qemu_st_opc[a_bits + MO_LE];
+            tcg_out_ldst_rr(s, data, TCG_REG_T1, TCG_REG_G0, st_opc);
+            for (i = a_size; i < s_size; i += a_size) {
+                tcg_out_arithi(s, TCG_REG_T2, data, i * 8, SHIFT_SRLX);
+                tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, a_size, ARITH_ADD);
+                tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0, st_opc);
+            }
+        }
+    }
+
+    *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
 #endif /* CONFIG_SOFTMMU */
 }
 
-- 
2.25.1


