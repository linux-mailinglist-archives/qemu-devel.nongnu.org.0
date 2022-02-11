Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F74B1BD7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:03:50 +0100 (CET)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILHp-0003sD-QN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:03:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnG-00049K-MD
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:17 -0500
Received: from [2607:f8b0:4864:20::432] (port=42839
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnA-0007P9-UD
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:14 -0500
Received: by mail-pf1-x432.google.com with SMTP id i6so11579911pfc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96ZQ9FH/trR76vUcFULrouOCXCAN4cLpPF78F0tg0D8=;
 b=UDLOk0sapj47p09GnP7Snnpw0tSeBS/lkGNqtxfTZPHfznYEaqSak8yDI5NON1wJxF
 Tw/k0MNSkGce6tBsaNbOSb+afCuEAG5n8lp2t3NcVJzSM8x/TzvBlexOFYYwBho8mT0S
 yscABvWgJvv3YVwNcZyfzAx6HhtuCLxRCM04xFcqdV4WwN4y6qYQlRrraEp49XnavmZ6
 CU0na6La4P9/nAoTLiBwV/gptDQUgNkjGUO0WdjQSVxnCnsyjPJ5vq0BRch+IRQIXwle
 MhIr88p5+ahMYQFrEXTC+SwSNLIhNxKglDmNUNF7BcEoEX0J2iFg3IvuVkqxT33ADTLQ
 DLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96ZQ9FH/trR76vUcFULrouOCXCAN4cLpPF78F0tg0D8=;
 b=aH+YAQxZa1CSmifNtrx4C120pnfhroRgQGFMMhx75W46nCQM2HDRtwvOlymUUhKl2v
 sM6CwGhr3m9nPtZ0LlzxIdSX5ZktjwKXga/rsxfUPfO8Aukftesvg/OG4AFCc05jfLA6
 AyuAS9w2982vkTXi9NTc/cXGCRDjAdgHWtqLxDqGxhWe6twDwznTWgayGBZVjVpZB/hG
 CNTRaRr2WE7R5mXnjkwPXEt3jUAHyzMYBIgO+wqtQ6JvqgQwXepP2njOUTmzrQS7Ef6A
 9ufKm0tqSnY6vpEziPvtDP4ARlLyIZVA8pwN2xHkMe5/Z/NQmD4V4QVaFxzWmwI+4IYs
 OaqA==
X-Gm-Message-State: AOAM533eSwrEL2HadB5d3HiTATJVVbyvIWQQ1cFLaJi1z+e1ZnpuBz9c
 n1G7OrUv/7mccJqWurKLz6CgISYPSV9TTRGx
X-Google-Smtp-Source: ABdhPJxSgobU6151OyNMacQlB84KP1E25S86KcQWb11aZhGVbOsMyKfTUvUNjVe3AoS41N/Ik0JuYQ==
X-Received: by 2002:a63:ff44:: with SMTP id s4mr1275561pgk.559.1644543127649; 
 Thu, 10 Feb 2022 17:32:07 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/34] tcg/riscv: Support raising sigbus for user-only
Date: Fri, 11 Feb 2022 12:30:38 +1100
Message-Id: <20220211013059.17994-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     |  2 --
 tcg/riscv/tcg-target.c.inc | 63 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 4 deletions(-)

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
index e9488f7093..6409d9c3d5 100644
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
@@ -1053,6 +1052,54 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
+
+    /* tail call, with the return address back inline. */
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
@@ -1108,6 +1155,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base = TCG_REG_TMP0;
 
@@ -1130,6 +1179,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+    }
     if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
@@ -1174,6 +1227,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base = TCG_REG_TMP0;
 
@@ -1196,6 +1251,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+    }
     if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
-- 
2.25.1


