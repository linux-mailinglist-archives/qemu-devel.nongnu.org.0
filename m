Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208F3B4D47
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:57:39 +0200 (CEST)
Received: from localhost ([::1]:56768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx2G2-00071n-GK
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vy-0002ad-2J
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:55 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vv-0000Ul-0H
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:53 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso6828645pjp.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EydeQGxVqAw6guu1qAKY5r1uSI5ierWJDBSf5PcuhzI=;
 b=F3rf9jj9I9QWiflf4c3JBgIpCqcuPnH7Q/nD21a9quOzMqL9s06ogvmO/7LpZSV4sA
 PQd40OU0vp1kG3GHYSjVseALTlLSOXfpnJsN3MGpdCgob3x3dhI+NfnFLuOpu/UptL+l
 vTm0EzUQ6SiH1AspgCUhkdpHadmazG3SkZKfPAUWLXoCluUZBQ8J6eHtsZArttTCGKKE
 +FvHDxklivECEi4U0f7DOkh2bs1EgrOyne3bDGtNcaJcfeuRFNSd5Uj3d5PplA0HE9UX
 YBMS3OXKoZQ1iDIPKOMUMF/3O57W0YvODM5axC9fcyFsFfgb6MaLA6Nr3YRrlhAQa+wc
 TvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EydeQGxVqAw6guu1qAKY5r1uSI5ierWJDBSf5PcuhzI=;
 b=fUtFNZjvW5Uk7bN5wseac1Tb+ES21Sej35nPdYHihVxdkgCqX4iaDOpXq2bk2eC5oH
 61fumg0T6spuPdSpIkZbxN3+Q/+UagDMp76nI/DNtnNpmd6Bx0DW77G/9ggpd4He4Z8/
 hAJPJmk+5z8NcWNTy6Jl7hApm8fNIcO3ZvN2pkbz0hgWz6dQZtCkZUXN5OL2WCHC9Vec
 nBHEmdeqhwATQdeQClJf5SYb/9gQsqKOB53+U4YfM7+JP2V4FO5Q8Wci75tWLBevZCZ1
 /4sOH+jqyvicdO4PxY+XPXz+NThW4u9g6tuIoQpXMrX1JPs2Y+kTHTnPhxZji285MTC7
 hWlA==
X-Gm-Message-State: AOAM531j0Of6xlz6PyxowfnoogYQit5HCmY4zmBL7MQR9w/jFpCLLVKX
 06bXUgZ5bIBYrZ0mpJ/M+vhBomuuakECsA==
X-Google-Smtp-Source: ABdhPJzEcfboQzaTY3GX9nR4EwflOTo5fqMR1Vfl07yT3noE8a9qsWnBaS/PyOmyBEb1IJRv+guYgw==
X-Received: by 2002:a17:902:db07:b029:125:765c:75e1 with SMTP id
 m7-20020a170902db07b0290125765c75e1mr12526924plx.9.1624689409617; 
 Fri, 25 Jun 2021 23:36:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/29] tcg/aarch64: Unset TCG_TARGET_HAS_MEMORY_BSWAP
Date: Fri, 25 Jun 2021 23:36:30 -0700
Message-Id: <20210626063631.2411938-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The memory bswap support in the aarch64 backend merely dates from
a time when it was required.  There is nothing special about the
backend support that could not have been provided by the middle-end
even prior to the introduction of the bswap flags.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/aarch64/tcg-target.c.inc | 87 +++++++++++++-----------------------
 2 files changed, 32 insertions(+), 57 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index ef55f7c185..551baf8da3 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -148,7 +148,7 @@ typedef enum {
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 72aa7e0e74..5924977b42 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1547,28 +1547,34 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[16] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEQ]  = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEQ]  = helper_be_ldq_mmu,
+static void * const qemu_ld_helpers[4] = {
+    [MO_8]  = helper_ret_ldub_mmu,
+#ifdef HOST_WORDS_BIGENDIAN
+    [MO_16] = helper_be_lduw_mmu,
+    [MO_32] = helper_be_ldul_mmu,
+    [MO_64] = helper_be_ldq_mmu,
+#else
+    [MO_16] = helper_le_lduw_mmu,
+    [MO_32] = helper_le_ldul_mmu,
+    [MO_64] = helper_le_ldq_mmu,
+#endif
 };
 
 /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
  *                                     uintxx_t val, TCGMemOpIdx oi,
  *                                     uintptr_t ra)
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
+    [MO_8]  = helper_ret_stb_mmu,
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
 
 static inline void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
@@ -1592,7 +1598,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
     tcg_out_adr(s, TCG_REG_X3, lb->raddr);
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call(s, qemu_ld_helpers[opc & MO_SIZE]);
     if (opc & MO_SIGN) {
         tcg_out_sxt(s, lb->type, size, lb->datalo_reg, TCG_REG_X0);
     } else {
@@ -1618,7 +1624,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
     tcg_out_adr(s, TCG_REG_X4, lb->raddr);
-    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
@@ -1714,7 +1720,8 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    const MemOp bswap = memop & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((memop & MO_BSWAP) == 0);
 
     switch (memop & MO_SSIZE) {
     case MO_UB:
@@ -1726,40 +1733,19 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
         break;
     case MO_UW:
         tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
-        if (bswap) {
-            tcg_out_rev(s, TCG_TYPE_I32, MO_16, data_r, data_r);
-        }
         break;
     case MO_SW:
-        if (bswap) {
-            tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
-            tcg_out_rev(s, TCG_TYPE_I32, MO_16, data_r, data_r);
-            tcg_out_sxt(s, ext, MO_16, data_r, data_r);
-        } else {
-            tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
-                           data_r, addr_r, otype, off_r);
-        }
+        tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
+                       data_r, addr_r, otype, off_r);
         break;
     case MO_UL:
         tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
-        if (bswap) {
-            tcg_out_rev(s, TCG_TYPE_I32, MO_32, data_r, data_r);
-        }
         break;
     case MO_SL:
-        if (bswap) {
-            tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
-            tcg_out_rev(s, TCG_TYPE_I32, MO_32, data_r, data_r);
-            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, data_r, data_r);
-        } else {
-            tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
-        }
+        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
         break;
     case MO_Q:
         tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
-        if (bswap) {
-            tcg_out_rev(s, TCG_TYPE_I64, MO_64, data_r, data_r);
-        }
         break;
     default:
         tcg_abort();
@@ -1770,31 +1756,20 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    const MemOp bswap = memop & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((memop & MO_BSWAP) == 0);
 
     switch (memop & MO_SIZE) {
     case MO_8:
         tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
         break;
     case MO_16:
-        if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev(s, TCG_TYPE_I32, MO_16, TCG_REG_TMP, data_r);
-            data_r = TCG_REG_TMP;
-        }
         tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
         break;
     case MO_32:
-        if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev(s, TCG_TYPE_I32, MO_32, TCG_REG_TMP, data_r);
-            data_r = TCG_REG_TMP;
-        }
         tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
         break;
     case MO_64:
-        if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev(s, TCG_TYPE_I64, MO_64, TCG_REG_TMP, data_r);
-            data_r = TCG_REG_TMP;
-        }
         tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
         break;
     default:
-- 
2.25.1


