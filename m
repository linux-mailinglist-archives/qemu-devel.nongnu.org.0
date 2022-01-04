Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E22483A85
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:18:19 +0100 (CET)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZP0-0005Fp-KK
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMa-0002gU-W3
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:49 -0500
Received: from [2607:f8b0:4864:20::102c] (port=42679
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMY-00089q-TI
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:48 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso1549383pjb.1
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 18:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AEDrLdND+QdiSTD7gFvQs8s8wQuCqaZx5PiFrbiHmIQ=;
 b=jkaXVIemgua2U4FcaQTU71wOy47KplMqSsG/mkLymQCH83gQGxnef2e4FIMRzMioQn
 249gvniOGC2HoZYC5vRNW/UlzBcBMHDNEZxWHguEwn2tlel74sQ+80AY6Obyvk7SU9+r
 nhsuPPIdQ9IO/Fdh5xrBeSrfoUYL05kEE1uF7Y7y7nJCSZhNwxi7oXsKQ20I7ffFB8N4
 vWkzNmoQ4CV3mOfjPet7+MNpue0BZN/4tzgOzuaa/C+ioZnSQc1xkQKGk4o0U1kqWEnj
 lJsOPMkAccwuXdRF1sr9DQP/oWqyoaI4DfJtyfKogRQuHefCe10lAckiz7FJc6Xrffhr
 OiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AEDrLdND+QdiSTD7gFvQs8s8wQuCqaZx5PiFrbiHmIQ=;
 b=Grcc6CdRRzENNYPFK17kqKE01R4HVzjakhQUpP02Fk0yUhYuJPtI1s1hPiPeubhY4S
 Bv7k+1lscP+VLS8KGo55XKTHB+u+PNC590842mqCH9Ga3nIyhD0DIKWChb4pBjUbPMkC
 xpzDs1HQ8SIuxY05J7EG6Zhp4hAF+F7OnH96g6w3IL0OGb4yZ9nLFuNV/2kc5MW0UEKI
 RMBgmFd0B2NRqTkWXNYXfgQAzcdEhjNA2vtymhL1QTvYvpf+bv4onUTRE7Ya9UCptnZw
 Mb10SDZj9leWQzCYkiGYeG3cdPI1Nojb/I6oKbAwJ3EZ0A9F1He51YCQRfriAqksKYNb
 peBQ==
X-Gm-Message-State: AOAM531XY98m4szwiuYzrg4EMdUJpnG56mDfWC5pJvvXnBn4AfkV6gwD
 L3uQSFCk46bVo/Nw1obugyT0TbTK30RQ7Q==
X-Google-Smtp-Source: ABdhPJzbvJXDhBYZYQG1qct4ZMohqjxFMZDVVyioLZxDIm6BoeuS+pRGT5NftZgp44g+k5Yija7Qtg==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr57395308pjb.134.1641262545520; 
 Mon, 03 Jan 2022 18:15:45 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b4sm37395501pjm.17.2022.01.03.18.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 18:15:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] tcg/aarch64: Support raising sigbus for user-only
Date: Mon,  3 Jan 2022 18:15:38 -0800
Message-Id: <20220104021543.396571-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104021543.396571-1-richard.henderson@linaro.org>
References: <20220104021543.396571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 -
 tcg/aarch64/tcg-target.c.inc | 91 +++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 7a93ac8023..876af589ce 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -151,9 +151,7 @@ typedef enum {
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 5edca8d44d..1f205f90b2 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -10,6 +10,7 @@
  * See the COPYING file in the top-level directory for details.
  */
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
 
@@ -443,6 +444,7 @@ typedef enum {
     I3404_ANDI      = 0x12000000,
     I3404_ORRI      = 0x32000000,
     I3404_EORI      = 0x52000000,
+    I3404_ANDSI     = 0x72000000,
 
     /* Move wide immediate instructions.  */
     I3405_MOVN      = 0x12800000,
@@ -1328,8 +1330,9 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     if (offset == sextract64(offset, 0, 26)) {
         tcg_out_insn(s, 3206, B, offset);
     } else {
-        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
+        /* Choose X9 as a call-clobbered non-LR temporary. */
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X9, (intptr_t)target);
+        tcg_out_insn(s, 3207, BR, TCG_REG_X9);
     }
 }
 
@@ -1541,9 +1544,14 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
     }
 }
 
-#ifdef CONFIG_SOFTMMU
-#include "../tcg-ldst.c.inc"
+static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
+{
+    ptrdiff_t offset = tcg_pcrel_diff(s, target);
+    tcg_debug_assert(offset == sextract64(offset, 0, 21));
+    tcg_out_insn(s, 3406, ADR, rd, offset);
+}
 
+#ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
  */
@@ -1577,13 +1585,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-static inline void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     MemOpIdx oi = lb->oi;
@@ -1714,15 +1715,58 @@ static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
     tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
 }
 
+#else
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
+                                   unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *label = new_ldst_label(s);
+
+    label->is_ld = is_ld;
+    label->addrlo_reg = addr_reg;
+
+    /* tst addr, #mask */
+    tcg_out_logicali(s, I3404_ANDSI, 0, TCG_REG_XZR, addr_reg, a_mask);
+
+    label->label_ptr[0] = s->code_ptr;
+
+    /* b.ne slow_path */
+    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
+
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_X1, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
+
+    /* "Tail call" to the helper, with the return address back inline. */
+    tcg_out_adr(s, TCG_REG_LR, l->raddr);
+    tcg_out_goto_long(s, (const void *)(l->is_ld ? helper_unaligned_ld
+                                        : helper_unaligned_st));
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
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
-
     switch (memop & MO_SSIZE) {
     case MO_UB:
         tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, otype, off_r);
@@ -1756,9 +1800,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
-
     switch (memop & MO_SIZE) {
     case MO_8:
         tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
@@ -1782,6 +1823,10 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((memop & MO_BSWAP) == 0);
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
@@ -1792,6 +1837,10 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
+    unsigned a_bits = get_alignment_bits(memop);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
                                TCG_REG_GUEST_BASE, otype, addr_reg);
@@ -1807,6 +1856,10 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((memop & MO_BSWAP) == 0);
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
@@ -1817,6 +1870,10 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
                         data_reg, addr_reg, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
+    unsigned a_bits = get_alignment_bits(memop);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
                                TCG_REG_GUEST_BASE, otype, addr_reg);
-- 
2.25.1


