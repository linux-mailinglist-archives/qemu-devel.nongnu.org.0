Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A83A5EA6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:54:45 +0200 (CEST)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiMm-0007Og-Dq
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi71-0002gG-8P
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:27 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6t-0003e6-5m
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:26 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g6so10025050pfq.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yJFKTLwdQ6BKW9i364z8Kx1sZ3PNnLVCKyVccYD/P/o=;
 b=d3DO8LE6gNUKHbMYSpYa/FNmgIK7nQMVZtfl8bMj4De/jAoW7t0k6voDr21+5+CW9W
 Yl1jdVqfXoP7O8Sl7k+r/eGORBJ6f5Wlfo6rJUl0RXprTfnrIPYf2tBs7vwR16TORzyG
 EuuXGQ+mzo2vWbjVox9wPUP9x1sdukWl39W+HMxqw/v4sAtHxVIQwiwQ5yarWMAJAnBA
 xOPi4qParp1JGIVpQmVUuhmmqqwuakhrrFhvnG9UN7oiFFE4RWflyhfU0Kc5Q03afs5A
 aQJUSziL3Ax/3DEsr8WIYDcs00XXak9sPFhJWD5Q0C8p6gq31gxUDj1p7uVt2r1WyP6x
 T8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yJFKTLwdQ6BKW9i364z8Kx1sZ3PNnLVCKyVccYD/P/o=;
 b=lg6BDEGtaMsePPv6hhRA1OuL5zHkoYafhi9xu7r0ZXRrLDpe3t4W/bXDL3M7gn6b3o
 5PmQE6+uiykoMLAKmLIArkX1TD9RCjXBGvor722YyxDtiUJIgqMrWgpl9XEJnXICJxCl
 53MvBXqq3R+8JYuSdWT20687FySSwaU9WAHDTBc+v1TLce7wj7f5671MxHObLHJmu8+x
 JwhfDq0/lDnKrwpqFAkARJfcyyBxNekKhx0w52Ksie1QqNNYVlzl+TbZHkYnaAa95Uil
 vMRx/JcTH6kaTNwgFStgr+zWYn1CatOLX428BmOSuF5QNuOK0vvSxeIZS3mMxygvvOZK
 vVVA==
X-Gm-Message-State: AOAM531paQERZxQGgh/wtmfxTvXFK+KuDoaR0u4hJUyi+PkJ2X8PSwXk
 iv5dTaik9ciGL5jpVwQCoRcotGSa5vKnZw==
X-Google-Smtp-Source: ABdhPJzskyuPOR+vweBQ9zcAcrAeMIo6beYmKuCx9MYlQFFJKE3HRlTXnGXCYHtm2ZUX0EUOuNsxgQ==
X-Received: by 2002:a63:1163:: with SMTP id 35mr16335660pgr.400.1623659897527; 
 Mon, 14 Jun 2021 01:38:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/28] tcg/aarch64: Unset TCG_TARGET_HAS_MEMORY_BSWAP
Date: Mon, 14 Jun 2021 01:37:59 -0700
Message-Id: <20210614083800.1166166-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

The memory bswap support in the aarch64 backend merely dates from
a time when it was required.  There is nothing special about the
backend support that could not have been provided by the middle-end
even prior to the introduction of the bswap flags.

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
index f72218b036..55eb98d0b1 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1557,28 +1557,34 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
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
@@ -1602,7 +1608,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
     tcg_out_adr(s, TCG_REG_X3, lb->raddr);
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call(s, qemu_ld_helpers[opc & MO_SIZE]);
     if (opc & MO_SIGN) {
         tcg_out_sxt(s, lb->type, size, lb->datalo_reg, TCG_REG_X0);
     } else {
@@ -1628,7 +1634,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
     tcg_out_adr(s, TCG_REG_X4, lb->raddr);
-    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
@@ -1724,7 +1730,8 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    const MemOp bswap = memop & MO_BSWAP;
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((memop & MO_BSWAP) == 0);
 
     switch (memop & MO_SSIZE) {
     case MO_UB:
@@ -1736,40 +1743,19 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
         break;
     case MO_UW:
         tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
-        if (bswap) {
-            tcg_out_rev16(s, data_r, data_r);
-        }
         break;
     case MO_SW:
-        if (bswap) {
-            tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
-            tcg_out_rev16(s, data_r, data_r);
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
-            tcg_out_rev32(s, data_r, data_r);
-        }
         break;
     case MO_SL:
-        if (bswap) {
-            tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
-            tcg_out_rev32(s, data_r, data_r);
-            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, data_r, data_r);
-        } else {
-            tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
-        }
+        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
         break;
     case MO_Q:
         tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
-        if (bswap) {
-            tcg_out_rev64(s, data_r, data_r);
-        }
         break;
     default:
         tcg_abort();
@@ -1780,31 +1766,20 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
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
-            tcg_out_rev16(s, TCG_REG_TMP, data_r);
-            data_r = TCG_REG_TMP;
-        }
         tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
         break;
     case MO_32:
-        if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev32(s, TCG_REG_TMP, data_r);
-            data_r = TCG_REG_TMP;
-        }
         tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
         break;
     case MO_64:
-        if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev64(s, TCG_REG_TMP, data_r);
-            data_r = TCG_REG_TMP;
-        }
         tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
         break;
     default:
-- 
2.25.1


