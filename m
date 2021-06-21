Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81113AF990
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:38:41 +0200 (CEST)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTV2-0000mR-V6
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTCH-0001b6-9U
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:17 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC9-00063b-Ji
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:17 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c15so9327770pls.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDgi4mUmbBNogW7MaanU634ulEKHQqUXgCKwp+rRBiM=;
 b=YvrUyRmAWDNwiy/4/K52Kktqpffay1U9HKFkWmz4oFy+N9hngFwxtG+3Tc9Hw4UcJw
 Gw/AcaWL7skNGEJSnUK+qQrcrm7ISq2Icc/KaGXYnoGRfKmOQcX4ENyaewRfEvKUSiMY
 R/U1l6BM4Q6ZV2TO4fQojm5mbf5bMtGdyK8jJIjl198O8L42gE98NwrNiMlvm19Xr9Hm
 1J0Z9TFYWfg+wfg7Aak4djUb3JDw+tIOxrFICT/umaBOyDqOMJyIh8NgQ2WAtINKovme
 dbx6A8o6brawMyM8s86gxaY+bV0p0os/YOd8mIjDOzHzDNGJLL+DhhkP7DfoCCI3ya48
 9+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDgi4mUmbBNogW7MaanU634ulEKHQqUXgCKwp+rRBiM=;
 b=tohmP6SUj5abljiHDUYiBKrWqsdU4fsD7CrLviuxh2FAgp0ONBMqCNrWozBQw1AOK4
 3FgunIN2+l+kPlgPs234mUe+O5/RiazhYSYvxYmaSWuSRBE05Kgm0ajKtlbY4f6BsN0W
 JFIyblXEZh3uyKshhXvP6T8AamONiZxB8Z5prWbVsAkrBVToSC0E60JtupkdiQo1ojDt
 QceKi7BRJx+nQVD7HHMddzkHfh5IlNErG0HlOQkLMa8iSofnuIAQxjjbZRU5bqqMV2oe
 RS4nVj11nXQYP3r4oGs6hXUfVdGzxygtE56MRPqEBeec1tw1Jqp5oRGvlSzEVeWny5V1
 gTnQ==
X-Gm-Message-State: AOAM531+uvoBSJwSWYJ4r0t+FphFzHv4XI082mkBlyvJrTUa4L95AIxQ
 4xzYo2wg23qyPxLzS/vB62nbnfwjfTRZkA==
X-Google-Smtp-Source: ABdhPJyMe+r9PZMaSK098Y5J05UAYLMiHlJrnELJ+AYkwzYa11WfMqgF4mw81UrgfWdXZ7TOkqE8rA==
X-Received: by 2002:a17:90b:3253:: with SMTP id
 jy19mr683918pjb.196.1624317547999; 
 Mon, 21 Jun 2021 16:19:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/29] tcg/arm: Unset TCG_TARGET_HAS_MEMORY_BSWAP
Date: Mon, 21 Jun 2021 16:18:47 -0700
Message-Id: <20210621231849.1871164-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the middle-end can replicate the same tricks as tcg/arm
used for optimizing bswap for signed loads and for stores, do not
pretend to have these memory ops in the backend.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 73e0455511..7a761a602e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1393,34 +1393,38 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
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
@@ -1625,9 +1629,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
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
@@ -1705,7 +1709,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
 
     /* Tail-call to the helper, which will return to the fast path.  */
-    tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
 #endif /* SOFTMMU */
@@ -1714,7 +1718,8 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
                                          TCGReg datalo, TCGReg datahi,
                                          TCGReg addrlo, TCGReg addend)
 {
-    MemOp bswap = opc & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
@@ -1725,51 +1730,30 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
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
 
@@ -1777,7 +1761,8 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
                                           TCGReg datalo, TCGReg datahi,
                                           TCGReg addrlo)
 {
-    MemOp bswap = opc & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
@@ -1788,49 +1773,28 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
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
 
@@ -1879,44 +1843,31 @@ static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
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
 
@@ -1924,44 +1875,31 @@ static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
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


