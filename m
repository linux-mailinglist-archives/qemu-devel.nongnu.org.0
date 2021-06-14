Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F713A5EB0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:58:05 +0200 (CEST)
Received: from localhost ([::1]:36466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiQ0-0004mu-J4
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi74-0002qZ-LP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:30 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6s-0003e3-CA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so9605451pjs.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7/2JikIbqrctKsBzlUf7eFp9owHQMZjeoHnQlm4T8zE=;
 b=TElHqeJr4n1Mh3ddq+vc/zfAX6nCi/4KTXWpxPinlr3JIgldVwB3Z8+kSGVFgs7Ho7
 ZGUTiIAy/gWUf3MjRmCR6mudRfTuPppmvhO8iC46v5oxBKRqTPhqc5ynXEOGf+AOfzWd
 UZfhOhYDgbRow+ahGrfZ9fK2YsNAq5QUs6icW7a6HQ6m7hWWGE4Tw6/Ow9lfQN+F+Dlj
 8snZzETrGPBLGzE2XjyNl3/4UCesrq2Ot+vL2xZUTcWPw59Mfk0acr2ZvarWO0clOzdG
 ZFoUzWBeH1qAjZAluCinyurQks9a9SS8fNhoy4J3DJCYGoVxz0h1swmKLwTMUbhIDPp/
 HjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/2JikIbqrctKsBzlUf7eFp9owHQMZjeoHnQlm4T8zE=;
 b=LcxMjIRXjG4AA4QsTG3d51i/m5/O5cp8hs5i31Z7MjzPWixYzhmQ/hVG5Z76fVYyWn
 wmmrXzgivlc2iyy5ek9pqtVgFUqE+KBgjzPcMAkrG1juBn4KilsFgjr0i8tu6yz5O5tE
 a2/kBbeJcjvpSJmcbPwQPqa2wNU4NGOQeWprjHxFNGmdg8Q5sM8NjtvbXwTp8fsglUXF
 kw+/QZTtnW305pswItUthTgb3gdH/iqwu9ZFfLkYrYE4cSV1hvhvi0rByPjanER9ZcqP
 svKg5OBgkavSX5SPxn3nNEeBBCtdwpW/kjRKI9kl/tXI5hzkU1w2hEmUsYP1eBPe8isc
 uWRw==
X-Gm-Message-State: AOAM533qGW/F+TdJGmiW6leg4xqBVpv6+KeBbQQaLS6+pAINvH2l2LlC
 9Kh6AgYID7kC+3DFbG/sL2Zzp9Hdc4LxQg==
X-Google-Smtp-Source: ABdhPJy6M6GRPcTWi/Bq5D18cCO07Lmz4gyac2gjCcuBlqiwAFCkXgtk789Z4rkHMEyW8q1WgZ3KGg==
X-Received: by 2002:a17:90a:7bc3:: with SMTP id
 d3mr12105068pjl.212.1623659896932; 
 Mon, 14 Jun 2021 01:38:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/28] tcg/arm: Unset TCG_TARGET_HAS_MEMORY_BSWAP
Date: Mon, 14 Jun 2021 01:37:58 -0700
Message-Id: <20210614083800.1166166-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Now that the middle-end can replicate the same tricks as tcg/arm
used for optimizing bswap for signed loads and for stores, do not
pretend to have these memory ops in the backend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |   2 +-
 tcg/arm/tcg-target.c.inc | 214 ++++++++++++++-------------------------
 2 files changed, 77 insertions(+), 139 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 57fd0c0c74..95fcef33bc 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -174,7 +174,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
 /* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9824e215be..35753c9e46 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1366,34 +1366,38 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[16] = {
+static void * const qemu_ld_helpers[8] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
-
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEQ]  = helper_le_ldq_mmu,
-    [MO_LESW] = helper_le_ldsw_mmu,
-    [MO_LESL] = helper_le_ldul_mmu,
-
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEQ]  = helper_be_ldq_mmu,
-    [MO_BESW] = helper_be_ldsw_mmu,
-    [MO_BESL] = helper_be_ldul_mmu,
+#ifdef HOST_WORDS_BIGENDIAN
+    [MO_UW] = helper_be_lduw_mmu,
+    [MO_UL] = helper_be_ldul_mmu,
+    [MO_Q]  = helper_be_ldq_mmu,
+    [MO_SW] = helper_be_ldsw_mmu,
+    [MO_SL] = helper_be_ldul_mmu,
+#else
+    [MO_UW] = helper_le_lduw_mmu,
+    [MO_UL] = helper_le_ldul_mmu,
+    [MO_Q]  = helper_le_ldq_mmu,
+    [MO_SW] = helper_le_ldsw_mmu,
+    [MO_SL] = helper_le_ldul_mmu,
+#endif
 };
 
 /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
  *                                     uintxx_t val, int mmu_idx, uintptr_t ra)
  */
-static void * const qemu_st_helpers[16] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEQ]  = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEQ]  = helper_be_stq_mmu,
+static void * const qemu_st_helpers[4] = {
+    [MO_8]   = helper_ret_stb_mmu,
+#ifdef HOST_WORDS_BIGENDIAN
+    [MO_16] = helper_be_stw_mmu,
+    [MO_32] = helper_be_stl_mmu,
+    [MO_64] = helper_be_stq_mmu,
+#else
+    [MO_16] = helper_le_stw_mmu,
+    [MO_32] = helper_le_stl_mmu,
+    [MO_64] = helper_le_stq_mmu,
+#endif
 };
 
 /* Helper routines for marshalling helper function arguments into
@@ -1598,9 +1602,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
        icache usage.  For pre-armv6, use the signed helpers since we do
        not have a single insn sign-extend.  */
     if (use_armv6_instructions) {
-        func = qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)];
+        func = qemu_ld_helpers[opc & MO_SIZE];
     } else {
-        func = qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)];
+        func = qemu_ld_helpers[opc & MO_SSIZE];
         if (opc & MO_SIGN) {
             opc = MO_UL;
         }
@@ -1678,7 +1682,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
 
     /* Tail-call to the helper, which will return to the fast path.  */
-    tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
 #endif /* SOFTMMU */
@@ -1687,7 +1691,8 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
                                          TCGReg datalo, TCGReg datahi,
                                          TCGReg addrlo, TCGReg addend)
 {
-    MemOp bswap = opc & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
@@ -1698,51 +1703,30 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         break;
     case MO_UW:
         tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
-        if (bswap) {
-            tcg_out_bswap16(s, COND_AL, datalo, datalo,
-                            TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        }
         break;
     case MO_SW:
-        if (bswap) {
-            tcg_out_ld16u_r(s, COND_AL, datalo, addrlo, addend);
-            tcg_out_bswap16(s, COND_AL, datalo, datalo,
-                            TCG_BSWAP_IZ | TCG_BSWAP_OS);
-        } else {
-            tcg_out_ld16s_r(s, COND_AL, datalo, addrlo, addend);
-        }
+        tcg_out_ld16s_r(s, COND_AL, datalo, addrlo, addend);
         break;
     case MO_UL:
-    default:
         tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
-        if (bswap) {
-            tcg_out_bswap32(s, COND_AL, datalo, datalo);
-        }
         break;
     case MO_Q:
-        {
-            TCGReg dl = (bswap ? datahi : datalo);
-            TCGReg dh = (bswap ? datalo : datahi);
-
-            /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-            if (USING_SOFTMMU && use_armv6_instructions
-                && (dl & 1) == 0 && dh == dl + 1) {
-                tcg_out_ldrd_r(s, COND_AL, dl, addrlo, addend);
-            } else if (dl != addend) {
-                tcg_out_ld32_rwb(s, COND_AL, dl, addend, addrlo);
-                tcg_out_ld32_12(s, COND_AL, dh, addend, 4);
-            } else {
-                tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP,
-                                addend, addrlo, SHIFT_IMM_LSL(0));
-                tcg_out_ld32_12(s, COND_AL, dl, TCG_REG_TMP, 0);
-                tcg_out_ld32_12(s, COND_AL, dh, TCG_REG_TMP, 4);
-            }
-            if (bswap) {
-                tcg_out_bswap32(s, COND_AL, dl, dl);
-                tcg_out_bswap32(s, COND_AL, dh, dh);
-            }
+        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
+        if (USING_SOFTMMU && use_armv6_instructions
+            && (datalo & 1) == 0 && datahi == datalo + 1) {
+            tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
+        } else if (datalo != addend) {
+            tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
+            tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
+        } else {
+            tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP,
+                            addend, addrlo, SHIFT_IMM_LSL(0));
+            tcg_out_ld32_12(s, COND_AL, datalo, TCG_REG_TMP, 0);
+            tcg_out_ld32_12(s, COND_AL, datahi, TCG_REG_TMP, 4);
         }
         break;
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -1750,7 +1734,8 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
                                           TCGReg datalo, TCGReg datahi,
                                           TCGReg addrlo)
 {
-    MemOp bswap = opc & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
@@ -1761,49 +1746,28 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
         break;
     case MO_UW:
         tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
-        if (bswap) {
-            tcg_out_bswap16(s, COND_AL, datalo, datalo,
-                            TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        }
         break;
     case MO_SW:
-        if (bswap) {
-            tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_bswap16(s, COND_AL, datalo, datalo,
-                            TCG_BSWAP_IZ | TCG_BSWAP_OS);
-        } else {
-            tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, 0);
-        }
+        tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_UL:
-    default:
         tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-        if (bswap) {
-            tcg_out_bswap32(s, COND_AL, datalo, datalo);
-        }
         break;
     case MO_Q:
-        {
-            TCGReg dl = (bswap ? datahi : datalo);
-            TCGReg dh = (bswap ? datalo : datahi);
-
-            /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-            if (USING_SOFTMMU && use_armv6_instructions
-                && (dl & 1) == 0 && dh == dl + 1) {
-                tcg_out_ldrd_8(s, COND_AL, dl, addrlo, 0);
-            } else if (dl == addrlo) {
-                tcg_out_ld32_12(s, COND_AL, dh, addrlo, bswap ? 0 : 4);
-                tcg_out_ld32_12(s, COND_AL, dl, addrlo, bswap ? 4 : 0);
-            } else {
-                tcg_out_ld32_12(s, COND_AL, dl, addrlo, bswap ? 4 : 0);
-                tcg_out_ld32_12(s, COND_AL, dh, addrlo, bswap ? 0 : 4);
-            }
-            if (bswap) {
-                tcg_out_bswap32(s, COND_AL, dl, dl);
-                tcg_out_bswap32(s, COND_AL, dh, dh);
-            }
+        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
+        if (USING_SOFTMMU && use_armv6_instructions
+            && (datalo & 1) == 0 && datahi == datalo + 1) {
+            tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
+        } else if (datalo == addrlo) {
+            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
+            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
+        } else {
+            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
+            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
         }
         break;
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -1852,44 +1816,31 @@ static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
                                          TCGReg datalo, TCGReg datahi,
                                          TCGReg addrlo, TCGReg addend)
 {
-    MemOp bswap = opc & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SIZE) {
     case MO_8:
         tcg_out_st8_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_16:
-        if (bswap) {
-            tcg_out_bswap16(s, cond, TCG_REG_R0, datalo, 0);
-            tcg_out_st16_r(s, cond, TCG_REG_R0, addrlo, addend);
-        } else {
-            tcg_out_st16_r(s, cond, datalo, addrlo, addend);
-        }
+        tcg_out_st16_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_32:
-    default:
-        if (bswap) {
-            tcg_out_bswap32(s, cond, TCG_REG_R0, datalo);
-            tcg_out_st32_r(s, cond, TCG_REG_R0, addrlo, addend);
-        } else {
-            tcg_out_st32_r(s, cond, datalo, addrlo, addend);
-        }
+        tcg_out_st32_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_64:
         /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (bswap) {
-            tcg_out_bswap32(s, cond, TCG_REG_R0, datahi);
-            tcg_out_st32_rwb(s, cond, TCG_REG_R0, addend, addrlo);
-            tcg_out_bswap32(s, cond, TCG_REG_R0, datalo);
-            tcg_out_st32_12(s, cond, TCG_REG_R0, addend, 4);
-        } else if (USING_SOFTMMU && use_armv6_instructions
-                   && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (USING_SOFTMMU && use_armv6_instructions
+            && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
         } else {
             tcg_out_st32_rwb(s, cond, datalo, addend, addrlo);
             tcg_out_st32_12(s, cond, datahi, addend, 4);
         }
         break;
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -1897,44 +1848,31 @@ static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
                                           TCGReg datalo, TCGReg datahi,
                                           TCGReg addrlo)
 {
-    MemOp bswap = opc & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SIZE) {
     case MO_8:
         tcg_out_st8_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_16:
-        if (bswap) {
-            tcg_out_bswap16(s, COND_AL, TCG_REG_R0, datalo, 0);
-            tcg_out_st16_8(s, COND_AL, TCG_REG_R0, addrlo, 0);
-        } else {
-            tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
-        }
+        tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_32:
-    default:
-        if (bswap) {
-            tcg_out_bswap32(s, COND_AL, TCG_REG_R0, datalo);
-            tcg_out_st32_12(s, COND_AL, TCG_REG_R0, addrlo, 0);
-        } else {
-            tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
-        }
+        tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_64:
         /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (bswap) {
-            tcg_out_bswap32(s, COND_AL, TCG_REG_R0, datahi);
-            tcg_out_st32_12(s, COND_AL, TCG_REG_R0, addrlo, 0);
-            tcg_out_bswap32(s, COND_AL, TCG_REG_R0, datalo);
-            tcg_out_st32_12(s, COND_AL, TCG_REG_R0, addrlo, 4);
-        } else if (USING_SOFTMMU && use_armv6_instructions
-                   && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (USING_SOFTMMU && use_armv6_instructions
+            && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
         } else {
             tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
             tcg_out_st32_12(s, COND_AL, datahi, addrlo, 4);
         }
         break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


