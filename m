Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048813F0C85
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:17:06 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRzl-0003Ap-32
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA7-0008Mp-Qn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:43 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA6-0002wp-3t
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:43 -0400
Received: by mail-pl1-x632.google.com with SMTP id f3so2464676plg.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tNc7kjivBSXK/2oaNMevLGDoAV8pJMGnlziC9HUk9AQ=;
 b=p4OslaN3T4mcV/zlOqywUNrw0AZoWTNe4L8qV43jswGpnQd6/dUdUzpnNo63gSijnX
 bJM3awk++YHrXCVEA0UwCfMtZBZtnY8GktnLA98HNzk+qprlc6iVK7yZy1fyZ3an6JUM
 TyxUr/OzPXEbgSVEYYrVEQo1fIdjYsnyCc9fgtLkhYibO4Mw6rAOua466IksO/HAk/sV
 MsP13pr0XXwHQ8hhuW579sGMidRViR/Q9uTd8kHcma1CUw5n/9TVTLffw1u/ihY9m4PL
 MNElH+RfS7zJk6n4sOxmHuTWkzX8NqVkBg6Mqm0igTKgqqDFn7VK9jQs7zDuqqxokWZ5
 IEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tNc7kjivBSXK/2oaNMevLGDoAV8pJMGnlziC9HUk9AQ=;
 b=POOcbx/nDm8PB4ImV1hDafAar2LAN8VRKAz2sxRNZX4TR2dYyMRaTZO2Vq8LIR9SJt
 WVuR90Ghc5OWP0Bx6/YItNX74nFDw3WfHAvB64Ru8FblF7PdWU+cPINGqbHwEqFIYTyf
 0Np1gPO7f3T4Oa/AKs6IZeWltWEl1FxgHm6mygkqhJ3W94MhDRyAhFlYip0cR465ONB0
 8OHs1FooRzOYQ898m43X8T4AU6qHz7cOA6dScFUAuyeozY5EPmYUERd8uI7PipEbH5hr
 MuXJsAKqDmqbgCXGuuMvklpopDkT7bPxHdfQ2B1YKDQFsy0jDdj3wG31HCzMbHagFue3
 vxrg==
X-Gm-Message-State: AOAM530N7vh87i5pZam0Ux5c8QCqUs+B8ruTe8fvuiN4vbArS8LfE12u
 yw5OGFszD22CbNBI8awn1mbFoNPJEA3rTQ==
X-Google-Smtp-Source: ABdhPJwKbeZcJNKOuq3yb8ORgV5mRrvSrWaJWxLgweHEFkhUl7qxV9MuNS+V5ZZ8uZLOdmFVVODwTw==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr11078824pjv.54.1629314620815; 
 Wed, 18 Aug 2021 12:23:40 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 65/66] tcg/riscv: Support raising sigbus for user-only
Date: Wed, 18 Aug 2021 09:19:19 -1000
Message-Id: <20210818191920.390759-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 tcg/riscv/tcg-target.h     |  2 --
 tcg/riscv/tcg-target.c.inc | 64 +++++++++++++++++++++++++++++++++++---
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index ef78b99e98..11c9b3e4f4 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -165,9 +165,7 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c1b0c3764d..f75dcf88f8 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -27,6 +27,7 @@
  * THE SOFTWARE.
  */
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 
 #ifdef CONFIG_DEBUG_TCG
@@ -847,8 +848,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
  */
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
  */
@@ -1053,6 +1052,53 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_goto(s, l->raddr);
     return true;
 }
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
+                                   unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *l = new_ldst_label(s);
+
+    l->is_ld = is_ld;
+    l->addrlo_reg = addr_reg;
+
+    /* We are expecting a_bits to max out at 7, so we can always use andi. */
+    tcg_debug_assert(a_bits < 12);
+    tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
+
+    l->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+
+    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    /* resolve label address */
+    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+    /* tail call, with the return address back inline for unwinding */
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
+    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
+                                       : helper_unaligned_st), true);
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
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
@@ -1108,6 +1154,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base = TCG_REG_TMP0;
 
@@ -1130,7 +1178,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+    }
     if (guest_base == 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
     } else {
@@ -1177,6 +1228,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base = TCG_REG_TMP0;
 
@@ -1199,7 +1252,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+    }
     if (guest_base == 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
     } else {
-- 
2.25.1


