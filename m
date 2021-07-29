Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EEB3D9AF5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:16:45 +0200 (CEST)
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ufE-0005Hx-Th
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG6-00010s-Oh
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:47 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG3-0004pl-7r
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so12941072pjb.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PDcDQtORXf591+/ONWYqthIRkwq10G/3Sfs6eKCX0z8=;
 b=IUiS305eRQqIqbkOpn7mfG+t0EzCIP+HijhwcS5Nnr3NrQj7UgkaJ3PCriEQhs9Nhs
 1qKmb9e26cUzfETvm172sUP01Q/Xhiq7SOlFA2vx41qACYs6pih5U3On/SBG/msISWeY
 g6nvZ5S18j4Tdf0By3f1FOh91IifFHVzKS9N3tviwO19ovBze1SSxQkKEZCEjAZEN/Hj
 mjuhOQ55Pe2/p0X5D61njwc3DIgjL1vwu1keYItAA7bllHkhU8Qtnc9mVfnlNQsOYJ+Q
 izHFX11CETYDKa04+LwizRvjQoCEUD4TBvpAxIa3/evZVDZXTdUW8Q1ZiQ91kCobCxJz
 9DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PDcDQtORXf591+/ONWYqthIRkwq10G/3Sfs6eKCX0z8=;
 b=ctf6DANSlExAmn0TDu0PhpI+szrRVmVOrqQMayJwr2Cx7dc5voxzBD51fjojWX4Tjq
 s2rqgWP33MJnlajGEfoBOeyuj/BqVTF/gHR23gp4lRDDcN75kN9jpLUXqgPYilhrPSGd
 kC23YE/zI0RDa1BeyruXRhkuzcoJ/oRWFf3fJQCy8a/Dv5lRr2TLTIhIt/PrLLYbbzlE
 fVm/RnHDBwTGRk1bWIzV6aHht9+vC8zIDLzq7rsMc5IUupDkovDJxQKmChG5KZE6uo43
 5tI0gyXsrqgzXpJMlEeTr+EAmvgnRLzBnL2l47+Jk7pDOXhO8igDQnZ7Tq4h9Jk5v8so
 uEZg==
X-Gm-Message-State: AOAM532D2YjmwwtAU23ncFdOeFgk+DYq9xDSXahg49zV23KJq3j5g+Y0
 c+QvRMTXvJ1QKGMNaBVd7KcOsoH9ojqeQA==
X-Google-Smtp-Source: ABdhPJyOBOLiLFBNVO+tNU3RQLaLd2cCv+7XL08zr2/fEzyNx2Q5ftlXPimQshAqQj/xNk1GdR6qtg==
X-Received: by 2002:a63:d04:: with SMTP id c4mr1529888pgl.368.1627519841755;
 Wed, 28 Jul 2021 17:50:41 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id gg3sm947137pjb.35.2021.07.28.17.50.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:50:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 42/43] tcg/i386: Support raising sigbus for user-only
Date: Wed, 28 Jul 2021 14:46:46 -1000
Message-Id: <20210729004647.282017-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |   2 -
 tcg/i386/tcg-target.c.inc | 114 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 110 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b00a6da293..3b2c9437a0 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -232,9 +232,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1e42a877fb..4abf612891 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -420,8 +420,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
 
-#define OPC_GRP3_Ev	(0xf7)
-#define OPC_GRP5	(0xff)
+#define OPC_GRP3_Eb     (0xf6)
+#define OPC_GRP3_Ev     (0xf7)
+#define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
 /* Group 1 opcode extensions for 0x80-0x83.
@@ -443,6 +444,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define SHIFT_SAR 7
 
 /* Group 3 opcode extensions for 0xf6, 0xf7.  To be used with OPC_GRP3.  */
+#define EXT3_TESTi 0
 #define EXT3_NOT   2
 #define EXT3_NEG   3
 #define EXT3_MUL   4
@@ -1604,9 +1606,9 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
-#if defined(CONFIG_SOFTMMU)
 #include "../tcg-ldst.c.inc"
 
+#if defined(CONFIG_SOFTMMU)
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
@@ -1915,7 +1917,96 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
     return true;
 }
-#elif TCG_TARGET_REG_BITS == 32
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
+                                   TCGReg addrhi, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *label;
+
+    /*
+     * We are expecting a_bits to max out at 7, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb, EXT3_TESTi, addrlo);
+        tcg_out8(s, a_mask);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
+        tcg_out32(s, a_mask);
+    }
+
+    /* jne slow_path */
+    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+
+    label = new_ldst_label(s);
+    label->is_ld = is_ld;
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = addrhi;
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr + 4);
+    label->label_ptr[0] = s->code_ptr;
+
+    s->code_ptr += 4;
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    MMUAccessType type = l->is_ld ? MMU_DATA_LOAD : MMU_DATA_STORE;
+    TCGReg retaddr;
+
+    /* resolve label address */
+    tcg_patch32(l->label_ptr[0], s->code_ptr - l->label_ptr[0] - 4);
+
+    if (TCG_TARGET_REG_BITS == 32) {
+        int ofs = 0;
+
+        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
+        ofs += 4;
+
+        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
+        ofs += 4;
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
+            ofs += 4;
+        }
+
+        tcg_out_sti(s, TCG_TYPE_I32, type, TCG_REG_ESP, ofs);
+
+        retaddr = TCG_REG_EAX;
+        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
+        tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
+        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], type);
+
+        retaddr = tcg_target_call_iarg_regs[3];
+        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
+    }
+
+    /*
+     * "Tail call" to the helper, with the return address back inline,
+     * just for the clarity of the debugging traceback -- the helper
+     * cannot return.
+     */
+    tcg_out_push(s, retaddr);
+    tcg_out_jmp(s, (const void *)helper_unaligned_mmu);
+    return true;
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+#if TCG_TARGET_REG_BITS == 32
 # define x86_guest_base_seg     0
 # define x86_guest_base_index   -1
 # define x86_guest_base_offset  guest_base
@@ -1949,6 +2040,7 @@ static inline int setup_guest_base_seg(void)
     return 0;
 }
 # endif
+#endif
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
@@ -2058,6 +2150,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2080,6 +2174,11 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
+
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
                            is64, opc);
@@ -2147,6 +2246,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2169,6 +2270,11 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+    }
+
     tcg_out_qemu_st_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg, opc);
 #endif
-- 
2.25.1


