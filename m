Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346FF4A94EE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:15:52 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFtl0-0008VE-Nk
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsa9-0006eV-HS
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:35 -0500
Received: from [2607:f8b0:4864:20::1033] (port=42889
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsa6-0006Ts-GR
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:32 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so5359515pjb.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTnTx+Np38oy93j629WdJsemD99NdxvV9Qe8c0rOlbY=;
 b=ijlWdgQhuCqUIrc1QaXZfps9BFcFVT8wWj4TmjZtvt8I7tO0BSQDLE/MZvMgdyWk85
 Eyo2nx5NXIlZgUzkMlrjJ5fAwhcGw/M2pm2MEjSZman3cakV1Z25E+uTb43nmEEjnUyB
 6lBbai8vqwUPIgffVaLYifLk8iBqOrLwAYFMyFjN69rwGIg/pVh7cLZgJ2/cEjGLQ3uz
 bceH3onCfFGxE6T+mGDpz9yUiStM97jEYO4LaCm4qzwDJV+W72yPUVwKkMrzlu5IpLUG
 XgZVCERlqjy5dcX6ePqOTUBsYSzxo7x5iR8lunyTp7Td+kMH7dSkKTqZ7ofngjp/K43R
 kUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTnTx+Np38oy93j629WdJsemD99NdxvV9Qe8c0rOlbY=;
 b=Qwv+EV1s8/zN8LcgfUCr9vwxzwSukFd7BhIwk1dxwck8Oq8GBDOp2qtcd3nx4pYdVq
 3aMTQ0ZV796gl9Zcs1o6/fQJhqT2aDbNN9zasLbs2lJsqJOa8/svcu6PazpkFLc55RGg
 voqsRfbZ60+9ntA+mQSa654leQMQb2kuxUflTNbahgcQCnrL3vSs17j7SCxokPzF6Lh6
 dAHrWM7bO35qwARC6XLT00be2Fg58ZGztB/A85ZSxPvnH+g5LFsBd4K+Sf+wlvPU+YQF
 ucjbkwVUCmWCEcr3ZXD74qzoxLSXZSopAHII4y28f0pzos4lp0TQRqidubXvBI8AWZQh
 jb7w==
X-Gm-Message-State: AOAM532Otbfnbihf5Ea7d1qurwZErc0sMEsIvaxS96ijssI8ltsOWByO
 vEMK3410GAeyc3sa6m/ZbTMmMbDgNaIXeUVW
X-Google-Smtp-Source: ABdhPJx4H/ukoEGRLKf+TortnAzICIuIQ0GyWzHSElVcf+I8OGMtmASB/yRklHp5a1blN/PTfVVCrg==
X-Received: by 2002:a17:90b:1242:: with SMTP id
 gx2mr1634564pjb.194.1643958029081; 
 Thu, 03 Feb 2022 23:00:29 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:ed23:b22a:8415:8857])
 by smtp.gmail.com with ESMTPSA id 9sm11808619pjg.50.2022.02.03.23.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:00:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] tcg/sparc: Support unaligned access for user-only
Date: Fri,  4 Feb 2022 18:00:11 +1100
Message-Id: <20220204070011.573941-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204070011.573941-1-richard.henderson@linaro.org>
References: <20220204070011.573941-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is kinda sorta the opposite of the other tcg hosts, where
we get (normal) alignment checks for free with host SIGBUS and
need to add code to support unaligned accesses.

This inline code expansion is somewhat large, but it takes quite
a few instructions to make a function call to a helper anyway.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 308 +++++++++++++++++++++++++++++++++++--
 1 file changed, 299 insertions(+), 9 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 82a9d88816..a0d206380c 100644
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
@@ -997,7 +998,7 @@ static void build_trampolines(TCGContext *s)
             /* Skip the oi argument.  */
             ra += 1;
         }
-                
+
         /* Set the retaddr operand.  */
         if (ra >= TCG_REG_O6) {
             tcg_out_st(s, TCG_TYPE_PTR, TCG_REG_O7, TCG_REG_CALL_STACK,
@@ -1012,6 +1013,38 @@ static void build_trampolines(TCGContext *s)
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
@@ -1062,9 +1095,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     /* delay slot */
     tcg_out_movi_imm13(s, TCG_REG_O0, 0);
 
-#ifdef CONFIG_SOFTMMU
     build_trampolines(s);
-#endif
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
@@ -1149,18 +1180,22 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
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
@@ -1179,11 +1214,12 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
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
@@ -1247,13 +1283,190 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 
     *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
 #else
+    TCGReg index = (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0);
+    unsigned a_bits = get_alignment_bits(memop);
+    unsigned s_bits = memop & MO_SIZE;
+    unsigned t_bits;
+    TCGReg orig_addr = addr;
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
+    /*
+     * Overalignment: When we're asking for really large alignment,
+     * the actual access is always done above and all we need to do
+     * here is invoke the handler for SIGBUS.
+     */
+    if (a_bits >= s_bits) {
+        TCGReg arg_low = TCG_REG_O1 + (!SPARC64 && TARGET_LONG_BITS == 64);
+        tcg_out_call_nodelay(s, qemu_unalign_ld_trampoline, false);
+        /* delay slot -- move to low part of argument reg */
+        tcg_out_mov_delay(s, arg_low, addr);
+        goto done;
+    }
+
+    /*
+     * Underalignment: use multiple loads to perform the operation.
+     *
+     * Force full address into T1 early; avoids problems with
+     * overlap between @addr and @data.
+     *
+     * Note that the little-endian instructions use the immediate
+     * asi form, and must use tcg_out_ldst_rr.
+     */
+    tcg_out_arith(s, TCG_REG_T1, addr, index, ARITH_ADD);
+
+    switch ((unsigned)memop) {
+    case MO_BEUW | MO_UNALN:
+    case MO_BESW | MO_UNALN:
+    case MO_BEUL | MO_ALIGN_2:
+    case MO_BESL | MO_ALIGN_2:
+    case MO_BEUQ | MO_ALIGN_4:
+        /* Two loads: shift and combine. */
+        tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, 0,
+                        qemu_ld_opc[a_bits | MO_BE | (memop & MO_SIGN)]);
+        tcg_out_ldst(s, data, TCG_REG_T1, 1 << a_bits,
+                        qemu_ld_opc[a_bits | MO_BE]);
+        tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, 8 << a_bits, SHIFT_SLLX);
+        tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
+        break;
+
+    case MO_LEUW | MO_UNALN:
+    case MO_LESW | MO_UNALN:
+    case MO_LEUL | MO_ALIGN_2:
+    case MO_LESL | MO_ALIGN_2:
+    case MO_LEUQ | MO_ALIGN_4:
+        /* Similarly, with shifts adjusted for little-endian. */
+        tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0,
+                        qemu_ld_opc[a_bits | MO_LE]);
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 1 << a_bits, ARITH_ADD);
+        tcg_out_ldst_rr(s, data, TCG_REG_T1, TCG_REG_G0,
+                        qemu_ld_opc[a_bits | MO_LE | (memop & MO_SIGN)]);
+        tcg_out_arithi(s, data, data, 8 << a_bits, SHIFT_SLLX);
+        tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
+        break;
+
+    case MO_BEUL | MO_UNALN:
+    case MO_BESL | MO_UNALN:
+        /*
+         * Naively, this would require 4 loads, 3 shifts, 3 ors.
+         * Use two 32-bit aligned loads, combine, and extract.
+         */
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 3, ARITH_ANDN);
+        tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, 0, LDUW);
+        tcg_out_ldst(s, TCG_REG_T1, TCG_REG_T1, 4, LDUW);
+        tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, 32, SHIFT_SLLX);
+        tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T2, ARITH_OR);
+        tcg_out_arithi(s, TCG_REG_T2, orig_addr, 3, ARITH_AND);
+        tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, 3, SHIFT_SLL);
+        tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T2, SHIFT_SLLX);
+        tcg_out_arithi(s, data, TCG_REG_T1, 32,
+                       memop & MO_SIGN ? SHIFT_SRAX : SHIFT_SRLX);
+        break;
+
+    case MO_LEUL | MO_UNALN:
+    case MO_LESL | MO_UNALN:
+        /* Similarly, with shifts adjusted for little-endian. */
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 3, ARITH_ANDN);
+        tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0, LDUW_LE);
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 4, ARITH_ADD);
+        tcg_out_ldst_rr(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_G0, LDUW_LE);
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 32, SHIFT_SLLX);
+        tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T2, ARITH_OR);
+        tcg_out_arithi(s, TCG_REG_T2, orig_addr, 3, ARITH_AND);
+        tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, 3, SHIFT_SLL);
+        tcg_out_arith(s, data, TCG_REG_T1, TCG_REG_T2, SHIFT_SRLX);
+        if (is_64) {
+            tcg_out_arithi(s, data, data, 0,
+                           memop & MO_SIGN ? SHIFT_SRA : SHIFT_SRL);
+        }
+        break;
+
+    case MO_BEUQ | MO_UNALN:
+        /* Similarly for 64-bit. */
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 7, ARITH_ANDN);
+        tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, 0, LDX);
+        tcg_out_ldst(s, TCG_REG_T1, TCG_REG_T1, 8, LDX);
+        tcg_out_arithi(s, data, orig_addr, 7, ARITH_AND);
+        tcg_out_arithi(s, data, data, 3, SHIFT_SLL);
+        tcg_out_arith(s, TCG_REG_T2, TCG_REG_T2, data, SHIFT_SLLX);
+        tcg_out_arithi(s, data, data, 64, ARITH_SUB);
+        tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, data, SHIFT_SRLX);
+        tcg_out_arith(s, data, TCG_REG_T1, TCG_REG_T2, ARITH_OR);
+        break;
+
+    case MO_LEUQ | MO_UNALN:
+        /* Similarly for little-endian. */
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 7, ARITH_ANDN);
+        tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0, LDX_LE);
+        tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 8, ARITH_ADD);
+        tcg_out_ldst_rr(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_G0, LDX_LE);
+        tcg_out_arithi(s, data, orig_addr, 7, ARITH_AND);
+        tcg_out_arithi(s, data, data, 3, SHIFT_SLL);
+        tcg_out_arith(s, TCG_REG_T2, TCG_REG_T2, data, SHIFT_SRLX);
+        tcg_out_arithi(s, data, data, 64, ARITH_SUB);
+        tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, data, SHIFT_SLLX);
+        tcg_out_arith(s, data, TCG_REG_T1, TCG_REG_T2, ARITH_OR);
+        break;
+
+    case MO_BEUQ | MO_ALIGN_2:
+        /*
+         * An extra test to verify alignment 2 is 5 insns, which
+         * is more than we would save by using the slightly smaller
+         * unaligned sequence above.
+         */
+        tcg_out_ldst(s, data, TCG_REG_T1, 0, LDUH);
+        for (int i = 2; i < 8; i += 2) {
+            tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, LDUW);
+            tcg_out_arithi(s, data, data, 16, SHIFT_SLLX);
+            tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
+        }
+        break;
+
+    case MO_LEUQ | MO_ALIGN_2:
+        /* Similarly for little-endian. */
+        tcg_out_ldst_rr(s, data, TCG_REG_T1, TCG_REG_G0, LDUH_LE);
+        for (int i = 2; i < 8; i += 2) {
+            tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 2, ARITH_ADD);
+            tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0, LDUW_LE);
+            tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, i * 8, SHIFT_SLLX);
+            tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+ done:
+    *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
 #endif /* CONFIG_SOFTMMU */
 }
 
@@ -1261,11 +1474,12 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
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
@@ -1302,13 +1516,89 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
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
+        TCGReg arg_low = TCG_REG_O1 + (!SPARC64 && TARGET_LONG_BITS == 64);
+        /* Overalignment: only need to call helper for SIGBUS. */
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
+        s_size = 1 << (memop & MO_SIZE);
+        if ((memop & MO_BSWAP) == MO_BE) {
+            st_opc = qemu_st_opc[a_bits + MO_BE];
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


