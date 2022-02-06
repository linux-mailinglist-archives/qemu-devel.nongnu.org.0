Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F054AAEE1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:44:33 +0100 (CET)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGf20-0001dD-9t
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGept-0004ZW-Mi
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:32:02 -0500
Received: from [2607:f8b0:4864:20::62b] (port=44760
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepr-0002PL-CQ
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:32:01 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c9so8969320plg.11
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCU9gFCcyd2kPLFMOJRQp/mjQ+1whOIZ+XoBMnbCDWs=;
 b=BxfMCqy0PVlWX21ZC/69AmV0greiSnYyK2RuhxzxRJp0aTeXuf80C1lHW7Q895dH9d
 +nVSEx34fyE6gKztcY6+yVEN8jRKBBxifJYqtC+pMdm8K6hXDXSoiM9RXx2pc9dwkiZQ
 KmnmX8XaICc5z2OBmOTODHTDlNmGDfaNPbb1uM9h+5Xb3AKatVO0II2u758zlcozTGZS
 qUKAKuAyoS/LDIUAP+mEbrHV/061FYv1VhjpQX5W2f5rbKw8UrrpO0UNJz3PuYorraHe
 MqFOjeMdI8QvJruQ47F1qhNQ+7OqttyudoNMfiI4mWT2Q9S7Si3WgyPEuT1fY8OtsX99
 xr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCU9gFCcyd2kPLFMOJRQp/mjQ+1whOIZ+XoBMnbCDWs=;
 b=sZCaQQyLxHxzdo8R0cQ1cfzlfm2r4Lk5krsGtZtuxFRUkvgzaLQLwGnyhSE0WzqNHX
 5YRVTTllthJxsigzgOgv9C/JdT+dDQ+GMQ5ePg34295Y2A1dt5SROytFsfUVceC4FBoe
 luiu4DJKYax4Q/60p0iQL4vvE+LPbWXDyCgR4h/laTmbeqOdjgPrnNDAzZ2Xnp0Pe+Dx
 Gi9vPyx6HdSY1KA2QN2bgfoclMgkuUAqst0K65/ZRqe4HAJ/yqQc4Ur5nQ0TFIelobzb
 6DEcWIvK6+gxl2o2hvF9CcdsrDafEzC7cQiYbq9o6EfxHAHs4tVDKCxaDPjXIZdkGPIj
 vcRw==
X-Gm-Message-State: AOAM5316/WQWt96Ggwbuk6OekvLuPplNfXaeEtfRh25KHl03sAq3MDhm
 lPQLmaTjMa7/8N/dHHxLVjQ5ozEVeu742enf
X-Google-Smtp-Source: ABdhPJzPaAMWij2i303yG6rq53nXly6K3IT/PlEYxVymFOjmE8GSNOpJaXlJqbGhJvmCO3u3T8F+OQ==
X-Received: by 2002:a17:902:c612:: with SMTP id
 r18mr11815723plr.64.1644143517799; 
 Sun, 06 Feb 2022 02:31:57 -0800 (PST)
Received: from localhost.localdomain ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id s2sm5605937pgl.21.2022.02.06.02.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:31:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] tcg/sparc: Support unaligned access for user-only
Date: Sun,  6 Feb 2022 21:31:38 +1100
Message-Id: <20220206103138.36105-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206103138.36105-1-richard.henderson@linaro.org>
References: <20220206103138.36105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 219 +++++++++++++++++++++++++++++++++++--
 1 file changed, 211 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index c81782d6ce..e5d2115e94 100644
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
@@ -1017,6 +1018,38 @@ static void build_trampolines(TCGContext *s)
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
@@ -1067,9 +1100,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     /* delay slot */
     tcg_out_movi_imm13(s, TCG_REG_O0, 0);
 
-#ifdef CONFIG_SOFTMMU
     build_trampolines(s);
-#endif
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
@@ -1154,18 +1185,22 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
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
@@ -1184,11 +1219,12 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
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
@@ -1252,13 +1288,99 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 
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
 
@@ -1266,11 +1388,12 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
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
@@ -1307,13 +1430,93 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
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


