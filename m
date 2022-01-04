Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F4483A89
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:21:37 +0100 (CET)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZSC-0002oW-Ny
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMd-0002mC-C6
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:51 -0500
Received: from [2607:f8b0:4864:20::636] (port=38420
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMZ-0008A1-SG
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:51 -0500
Received: by mail-pl1-x636.google.com with SMTP id c3so12824298pls.5
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 18:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLEdjZy+09uGaMjE1uPY2LFNBR2LKIkdI9ZG+WGq/kQ=;
 b=fqNBS+D1vSeU6Iv/jcLxuHg7WL3440Z1Qi/Y3aLPrOVSM92iFcKJzX7/8Qgf9shVVd
 S1WEsfKsSDW56GpcDJ9gd8nISOaEWZ2M1BFiIYADg+3G36b+BpTRpjDumhi+ljFEy98K
 zEPHj7P5qlzVK9CY0mL4/EniNnviJ8XgYROYQdRVaL0dSOOnEBeRGMhcboKB+lP8TDJu
 OULZvibdVsOWDIo9vcUFPtPmmIW4fu2qbXTeKHLzYc11slZSCF5repEUpkxEpd45a2Zw
 Kgc6GpBATrc/kx+kp7S8FgX52rbYNLJBuP5nMED7t5owZT/kXSJjO27mVEpjY9mualmh
 GEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLEdjZy+09uGaMjE1uPY2LFNBR2LKIkdI9ZG+WGq/kQ=;
 b=zS/tvAXmgPgo/RfMajVjnk03TIx0atAPVzdPbZ2mk3h0W5AawznvrZ2FimIBbZGnas
 RPWQqRbNw3NFqsXwd+fNIhpDZkkvivR50bznQAjycu7E4q4QYY0sKoH1O/T4xOg7HMr2
 Srv7zsSrihzi4vfsVz/jsXfjIpF5QzCg3KNKT+pOA24bfIR7XVR7okKGvWz1E2qGMLF4
 vcG/wJrRpCXbNhV5A784uE+FH87l3cxaTanMU3hdoLE4puHxiV7VcI/H27MD0G+UFPdG
 welFSLFLBtia6hUDMUDpjm5ciOE6ts5m3grsPI6M2rl2QPaqYs+4mCANrVJI7b8hK5Vu
 oU4g==
X-Gm-Message-State: AOAM531yp7siKt2WSaMrRT8TZijf4IQ7KfT7yOJDAzOwluRcOTeDedJC
 4eMCglPbReQWVApGGt0mgXGt04nhMYm2hQ==
X-Google-Smtp-Source: ABdhPJyTdSMN2FboYD54SnzKolidUjRjSpt0nGaVYSZw5P+JFRBofzMHzhgONyGxYE/eidA8iBAs3g==
X-Received: by 2002:a17:902:b58d:b0:149:9c02:6345 with SMTP id
 a13-20020a170902b58d00b001499c026345mr24670291pls.21.1641262546693; 
 Mon, 03 Jan 2022 18:15:46 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b4sm37395501pjm.17.2022.01.03.18.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 18:15:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] tcg/riscv: Support raising sigbus for user-only
Date: Mon,  3 Jan 2022 18:15:40 -0800
Message-Id: <20220104021543.396571-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104021543.396571-1-richard.henderson@linaro.org>
References: <20220104021543.396571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
index 9b13a46fb4..49e84cbe13 100644
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


