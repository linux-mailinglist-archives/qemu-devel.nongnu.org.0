Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B24B1B94
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:46:22 +0100 (CET)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL0v-0002Gy-Th
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnM-0004HQ-TR
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:20 -0500
Received: from [2607:f8b0:4864:20::62a] (port=40831
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnK-0007Pu-2E
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:20 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y17so3402287plg.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StWraBvQ7+cOtM3wTdtfXS094/SeTqLb1TCB0a+TFak=;
 b=HdDNKC0S0g6EgC0H9UP1DqrojDh8tUDggkTb2eSK51VDTyXhjzboKSxQAxKu4boJea
 yiaFsqB97sMn2QK3qiLmaSF2e3IIu4h+BeGm55SfDXH9S5jxIPpavCwbYZy2FORq5XaF
 Z0nAyb4kTWLZicxsomrbNCp4W95P0aaaJhH/SS1YJ5qTJkrxGM3mkWAEDkXJmvywRdoj
 UCT/ywqkJqvcn8wfI7yP76NWq1An3RhUWPdpmb8Bs49Y5DQhaOV+Jk7SqTUudh5iWdWt
 KtaycLprwh28oNnbX/TaeNyPdpQlE+dgnrYaEAFStyhVkvdt/aTaBaXYatdOhlae7GtC
 huhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=StWraBvQ7+cOtM3wTdtfXS094/SeTqLb1TCB0a+TFak=;
 b=dZIIYyPkx5D8z8vnjBPXSjOn6bixh1sa7/nbybFUqgd2yK8GHRAOAo7+JPryKRC8zr
 r61+CnhdG9Ap+g9Skrlv3NCRyizuEa17Rg003BS8uJRqy+TXIYOOkANujw3Ip+sGe41U
 Sg7J86y59zSM5E819y31YV56QVDsUj3qP2MGw0CXVZUGOqkprYdgZ3UHSlkg09hv4wC5
 ZWplCOiSyI+eLGtTtSJy3zPnbdj76+8cAi15xI49Lk8SGK7UCrk5UbfNFrqUSvr6g/LP
 yypNqf4kkBw5xu1atNXInuoDkSoD/dysKKpDDwX6FwNMUXs9b+LdK/KS/5iu+rkXaMwk
 KW6g==
X-Gm-Message-State: AOAM53194rR1q0EHTPsMFTWwMFunvCoJDLBlSpwTkOU+QAjSOjArtGLg
 8/tqJyxkgzrkvsK4JLYmbbRTBi4AVwI9Gq/l
X-Google-Smtp-Source: ABdhPJxpecpkubSTuOianivZWEJIPucwmdZf0UngR1qQb1Jbc9gfQA+/mK3IVlrsU/28eEPzXAvdJQ==
X-Received: by 2002:a17:903:244a:: with SMTP id
 l10mr10117845pls.32.1644543135545; 
 Thu, 10 Feb 2022 17:32:15 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/34] tcg/loongarch64: Support raising sigbus for user-only
Date: Fri, 11 Feb 2022 12:30:41 +1100
Message-Id: <20220211013059.17994-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220106134238.3936163-1-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.h     |  2 -
 tcg/loongarch64/tcg-target.c.inc | 71 +++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 05010805e7..d58a6162f2 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -171,9 +171,7 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
 
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d31a0e5991..a3debf6da7 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -29,6 +29,8 @@
  * THE SOFTWARE.
  */
 
+#include "../tcg-ldst.c.inc"
+
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "zero",
@@ -642,8 +644,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  */
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /*
  * helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
@@ -825,6 +825,61 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     return tcg_out_goto(s, l->raddr);
 }
+#else
+
+/*
+ * Alignment helpers for user-mode emulation
+ */
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
+                                   unsigned a_bits)
+{
+    TCGLabelQemuLdst *l = new_ldst_label(s);
+
+    l->is_ld = is_ld;
+    l->addrlo_reg = addr_reg;
+
+    /*
+     * Without micro-architecture details, we don't know which of bstrpick or
+     * andi is faster, so use bstrpick as it's not constrained by imm field
+     * width. (Not to say alignments >= 2^12 are going to happen any time
+     * soon, though)
+     */
+    tcg_out_opc_bstrpick_d(s, TCG_REG_TMP1, addr_reg, 0, a_bits - 1);
+
+    l->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_bne(s, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+
+    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    /* resolve label address */
+    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
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
 
 /*
@@ -887,6 +942,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base;
 
@@ -903,6 +960,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
                         data_regl, addr_regl,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+    }
     base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
     TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
     tcg_out_qemu_ld_indexed(s, data_regl, base, guest_base_reg, opc, type);
@@ -941,6 +1002,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base;
 
@@ -958,6 +1021,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
                         data_regl, addr_regl,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+    }
     base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
     TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
     tcg_out_qemu_st_indexed(s, data_regl, base, guest_base_reg, opc);
-- 
2.25.1


