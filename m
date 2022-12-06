Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5FE643C38
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:23:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POr-0003T7-R0; Mon, 05 Dec 2022 23:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POp-0003S9-49
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:43 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POn-00072b-3r
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:42 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 q18-20020a056830441200b006704633f258so2220324otv.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmoxygvVTEq2d+IOQdC2EOT2LDl9LC/v0r7RV1PzJPs=;
 b=dH5WQuCUyab/nVKvhFh5Xf0N8oApBGkfYpGfC6liSrFOArBMpkQKjt2O3v0X6vytvA
 ZIWuK3nkFx1EJbrqZlfEkWVt3/pgxa9Zc3uem+A+mwdzmqq0NeXxVP3HnCzmDW02nwFe
 CcBcwqnB8AJKaQXjDAD0U5ctKqg5l6X8VcL71ysQTJXFvGntRHGzyxfwGzvF7IIRNdij
 LXqFNLqRmRppYtc0fR3L2X3HkXT6+mqYvmTUS9Sv6AAw4jkKdyMjNIfC/jfSAdo4KTuP
 Gjwt/78Q2EjZH/9EZV7Q1G8hg7Ga8wvpsa6FRH4QRzkNbNkSYRjQzBXdxvnmKyy3+Vjq
 Rz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmoxygvVTEq2d+IOQdC2EOT2LDl9LC/v0r7RV1PzJPs=;
 b=EEgEIgHnS5kuXoFty+qgDaQ8O0Vvf7iMU01HWbjL/SXDCy4uQmR98ZZ1Zn0z/7rOor
 JjDKUt6VC2L7FGc18q0cjhgJXgsEBniZPVKSFz3hNLGwl2E2mNnZgQeIsaQxYaLhygFN
 awbb6HJQVcFZpqgmyHLRDq1d/w89KixDpnkyUowJMdG7J9uz1gZjOaMVHTs3HYrbUf6K
 Oot4COMP9hmIfDsxEuDo3wGafLOWXMUNuEsWqNRBOYSoG8NJR55Hx2xsUJEtBDwHOXIL
 czRsocknUkGFOWBaeLo7VzZ0xabo0tg/2aYf66vpwDiJYnCpNQfjE2167a9QD59esZDI
 4J8Q==
X-Gm-Message-State: ANoB5pkND8v949rVyE6krguT6OHFTwtFmj+LqmHxBjkAJnNAhyZImddp
 lY/EXQwbrzAzDMeAUl0FEN715zXptty0hoaAqso=
X-Google-Smtp-Source: AA0mqf6jXhd4z1qRZQn/oB2I6fyAZYvUR6WGrD2sWAG+DfvyDH2NtqzEIDyzy0f9WAstSkSEQsBraw==
X-Received: by 2002:a05:6830:1bec:b0:66e:7deb:b5b with SMTP id
 k12-20020a0568301bec00b0066e7deb0b5bmr9059669otb.295.1670300259868; 
 Mon, 05 Dec 2022 20:17:39 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 17/22] tcg/ppc: Reorg goto_tb implementation
Date: Mon,  5 Dec 2022 22:17:10 -0600
Message-Id: <20221206041715.314209-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

The old ppc64 implementation replaces 2 or 4 insns, which leaves a race
condition in which a thread could be stopped at a PC in the middle of
the sequence, and when restarted does not see the complete address
computation and branches to nowhere.

The new implemetation replaces only one insn, swapping between

	b       <dest>
and
	mtctr	r31

falling through to a general-case indirect branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |   3 +-
 tcg/ppc/tcg-target.c.inc | 158 +++++++++++----------------------------
 2 files changed, 44 insertions(+), 117 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index f253184915..af81c5a57f 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -27,11 +27,10 @@
 
 #ifdef _ARCH_PPC64
 # define TCG_TARGET_REG_BITS  64
-# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 #else
 # define TCG_TARGET_REG_BITS  32
-# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
 #endif
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 #define TCG_TARGET_NB_REGS 64
 #define TCG_TARGET_INSN_UNIT_SIZE 4
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 592b8d6498..755b954447 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1847,104 +1847,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out32(s, insn);
 }
 
-static inline uint64_t make_pair(tcg_insn_unit i1, tcg_insn_unit i2)
-{
-    if (HOST_BIG_ENDIAN) {
-        return (uint64_t)i1 << 32 | i2;
-    }
-    return (uint64_t)i2 << 32 | i1;
-}
-
-static inline void ppc64_replace2(uintptr_t rx, uintptr_t rw,
-                                  tcg_insn_unit i0, tcg_insn_unit i1)
-{
-#if TCG_TARGET_REG_BITS == 64
-    qatomic_set((uint64_t *)rw, make_pair(i0, i1));
-    flush_idcache_range(rx, rw, 8);
-#else
-    qemu_build_not_reached();
-#endif
-}
-
-static inline void ppc64_replace4(uintptr_t rx, uintptr_t rw,
-                                  tcg_insn_unit i0, tcg_insn_unit i1,
-                                  tcg_insn_unit i2, tcg_insn_unit i3)
-{
-    uint64_t p[2];
-
-    p[!HOST_BIG_ENDIAN] = make_pair(i0, i1);
-    p[HOST_BIG_ENDIAN] = make_pair(i2, i3);
-
-    /*
-     * There's no convenient way to get the compiler to allocate a pair
-     * of registers at an even index, so copy into r6/r7 and clobber.
-     */
-    asm("mr  %%r6, %1\n\t"
-        "mr  %%r7, %2\n\t"
-        "stq %%r6, %0"
-        : "=Q"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6", "r7");
-    flush_idcache_range(rx, rw, 16);
-}
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw)
-{
-    tcg_insn_unit i0, i1, i2, i3;
-    uintptr_t addr = tb->jmp_target_addr[n];
-    intptr_t tb_diff = addr - (uintptr_t)tb->tc.ptr;
-    intptr_t br_diff = addr - (jmp_rx + 4);
-    intptr_t lo, hi;
-
-    if (TCG_TARGET_REG_BITS == 32) {
-        intptr_t diff = addr - jmp_rx;
-        tcg_debug_assert(in_range_b(diff));
-        qatomic_set((uint32_t *)jmp_rw, B | (diff & 0x3fffffc));
-        flush_idcache_range(jmp_rx, jmp_rw, 4);
-        return;
-    }
-
-    /*
-     * For 16-bit displacements, we can use a single add + branch.
-     * This happens quite often.
-     */
-    if (tb_diff == (int16_t)tb_diff) {
-        i0 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, tb_diff);
-        i1 = B | (br_diff & 0x3fffffc);
-        ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
-        return;
-    }
-
-    lo = (int16_t)tb_diff;
-    hi = (int32_t)(tb_diff - lo);
-    assert(tb_diff == hi + lo);
-    i0 = ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, hi >> 16);
-    i1 = ADDI | TAI(TCG_REG_TB, TCG_REG_TB, lo);
-
-    /*
-     * Without stq from 2.07, we can only update two insns,
-     * and those must be the ones that load the target address.
-     */
-    if (!have_isa_2_07) {
-        ppc64_replace2(jmp_rx, jmp_rw, i0, i1);
-        return;
-    }
-
-    /*
-     * For 26-bit displacements, we can use a direct branch.
-     * Otherwise we still need the indirect branch, which we
-     * must restore after a potential direct branch write.
-     */
-    br_diff -= 4;
-    if (in_range_b(br_diff)) {
-        i2 = B | (br_diff & 0x3fffffc);
-        i3 = NOP;
-    } else {
-        i2 = MTSPR | RS(TCG_REG_TB) | CTR;
-        i3 = BCCTR | BO_ALWAYS;
-    }
-    ppc64_replace4(jmp_rx, jmp_rw, i0, i1, i2, i3);
-}
-
 static void tcg_out_call_int(TCGContext *s, int lk,
                              const tcg_insn_unit *target)
 {
@@ -2625,30 +2527,56 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    /* Direct jump. */
-    if (TCG_TARGET_REG_BITS == 64) {
-        /* Ensure the next insns are 8 or 16-byte aligned. */
-        while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
-            tcg_out32(s, NOP);
-        }
+    uintptr_t ptr = get_jmp_target_addr(s, which);
+
+    if (USE_REG_TB) {
+        ptrdiff_t offset = tcg_tbrel_diff(s, (void *)ptr);
+        tcg_out_mem_long(s, LD, LDX, TCG_REG_TB, TCG_REG_TB, offset);
+    
+        /* Direct branch will be patched by tb_target_set_jmp_target. */
         set_jmp_insn_offset(s, which);
-        tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-        tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
         tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
+
+        /* When branch is out of range, fall through to indirect. */
+        tcg_out32(s, BCCTR | BO_ALWAYS);
+
+        /* For the unlinked case, need to reset TCG_REG_TB.  */
+        set_jmp_reset_offset(s, which);
+        tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
+                         -tcg_current_code_size(s));
+    } else {
+        /* Direct branch will be patched by tb_target_set_jmp_target. */
+        set_jmp_insn_offset(s, which);
+        tcg_out32(s, NOP);
+
+        /* When branch is out of range, fall through to indirect. */
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP1, ptr - (int16_t)ptr);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1, (int16_t)ptr);
+        tcg_out32(s, MTSPR | RS(TCG_REG_TMP1) | CTR);
         tcg_out32(s, BCCTR | BO_ALWAYS);
         set_jmp_reset_offset(s, which);
-        if (USE_REG_TB) {
-            /* For the unlinked case, need to reset TCG_REG_TB.  */
-            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
-                             -tcg_current_code_size(s));
-        }
-    } else {
-        set_jmp_insn_offset(s, which);
-        tcg_out32(s, B);
-        set_jmp_reset_offset(s, which);
     }
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t diff = addr - jmp_rx;
+    tcg_insn_unit insn;
+
+    if (in_range_b(diff)) {
+        insn = B | (diff & 0x3fffffc);
+    } else if (USE_REG_TB) {
+        insn = MTSPR | RS(TCG_REG_TB) | CTR;
+    } else {
+        insn = NOP;
+    }
+
+    qatomic_set((uint32_t *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
-- 
2.34.1


