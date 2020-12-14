Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520CF2D9983
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:14:48 +0100 (CET)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooch-0005TQ-DR
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSb-0002KV-An
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:21 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSZ-000428-Cd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:21 -0500
Received: by mail-oi1-x242.google.com with SMTP id q25so19223739oij.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nfuYW3YpACxe1tM8rVcQkTfXfB+YXnTp2x/9NWOzn0g=;
 b=A76XEIwXqBmCPnF9C0ryNK2y+rVs1T/kyfDaRlggqLhLuYR0KFSYeIe9kj3JRnVriZ
 BRcae0dV66ai0t2cv0j+RYuIGHPJ+K9FR8JBU9SVNDMGFo8QJ9QB1Nho4idkE9RUhD3/
 XuqY+tgVh1NFHgunOXfFcgZ6+APV210HZVKyabeft+ac15iOqI/rMVwSyaokcg2QayMg
 k/xr5q7EEQSDKSlJX2mCu8TCw2vgWw8X6hEuySdOBgoux4vPNMA3coo1uLdoMf4XIwuR
 Ll/Fke9S9wZGb58JFjYFJwSyKqaW+18GHGKU1yN4+J04HymA+xS53uDcPmDSkXdH94bw
 sk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfuYW3YpACxe1tM8rVcQkTfXfB+YXnTp2x/9NWOzn0g=;
 b=i7yTTMuUi2KM+KhwQmpkh/WIkAdT5kkxFVFBxi5eMXYxGypTtP4FHkH8JhX6fMqACm
 sRTWLUy/vUbVy5bsc1ylNre+6js7TN6hIth4/eW8/woLh1iKXSYYahCcjiyEJ45x7AZA
 JT8AvqLF7VL4WEeyIZxX9q9jjVA75/RTmiVd8Pdr8aEOmlg6qO4pMn4Dxmz7ZH2ayqwN
 gJ6QGSD1o7QfEjAyA+UCUCkQEZH9poPUcc11m2OrhvUcq8wF77/rNK3UINQZ+GMS4tuC
 NTKKg9XD/PrPWvpcDWX8ZtJzHJih0o+7AeXa5phNhac/tk5ywQnMaYddJaaxLuDewmZ+
 leMQ==
X-Gm-Message-State: AOAM530h9+ggQqWDqEpR2t07WtHe4RSKug3xv9RMDcvqF2Ezwx/M355y
 +c2J/GdhdMd5aLuhg6ilcqx3kV61j/8lgY4y
X-Google-Smtp-Source: ABdhPJwO/tF1GiYFYZ9AGbjoOXngKZJucYXizEXe8DnaAgA3cTgSHD09ZlxYRwlODQi2wJfU1yLfcQ==
X-Received: by 2002:aca:5ec2:: with SMTP id s185mr18350727oib.33.1607954657662; 
 Mon, 14 Dec 2020 06:04:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/43] tcg/riscv: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:03:07 -0600
Message-Id: <20201214140314.18544-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
 tcg/riscv/tcg-target.h     |  2 +-
 tcg/riscv/tcg-target.c.inc | 41 +++++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 785fe37f9b..60b6a1a3fc 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -170,6 +170,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_SUPPORT_MIRROR   0
+#define TCG_TARGET_SUPPORT_MIRROR   1
 
 #endif
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 02beb86977..5c1e0f8fc1 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -425,41 +425,44 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
  * Relocations
  */
 
-static bool reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+static bool reloc_sbimm12(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
 
     tcg_debug_assert((offset & 1) == 0);
     if (offset == sextreg(offset, 0, 12)) {
-        code_ptr[0] |= encode_sbimm12(offset);
+        *src_rw |= encode_sbimm12(offset);
         return true;
     }
 
     return false;
 }
 
-static bool reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+static bool reloc_jimm20(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
 
     tcg_debug_assert((offset & 1) == 0);
     if (offset == sextreg(offset, 0, 20)) {
-        code_ptr[0] |= encode_ujimm20(offset);
+        *src_rw |= encode_ujimm20(offset);
         return true;
     }
 
     return false;
 }
 
-static bool reloc_call(tcg_insn_unit *code_ptr, const tcg_insn_unit *target)
+static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
     int32_t lo = sextreg(offset, 0, 12);
     int32_t hi = offset - lo;
 
     if (offset == hi + lo) {
-        code_ptr[0] |= encode_uimm20(hi);
-        code_ptr[1] |= encode_imm12(lo);
+        src_rw[0] |= encode_uimm20(hi);
+        src_rw[1] |= encode_imm12(lo);
         return true;
     }
 
@@ -532,7 +535,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     if (tmp == (int32_t)tmp) {
         tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
         tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
-        ret = reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
+        ret = reloc_call(s->code_ptr - 2, (const tcg_insn_unit *)val);
         tcg_debug_assert(ret == true);
         return;
     }
@@ -917,7 +920,7 @@ QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
 
-static void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
+static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
     bool ok = reloc_jimm20(s->code_ptr - 1, target);
@@ -993,7 +996,8 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
 }
 
@@ -1012,7 +1016,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* resolve label address */
-    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
+    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -1046,7 +1050,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* resolve label address */
-    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
+    if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -1232,7 +1236,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
 }
 
-static tcg_insn_unit *tb_ret_addr;
+static const tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg *args, const int *const_args)
@@ -1780,11 +1784,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, tcg_target_call_iarg_regs[1], 0);
 
     /* Return path for goto_ptr. Set return value to 0 */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_A0, TCG_REG_ZERO);
 
     /* TB epilogue */
-    tb_ret_addr = s->code_ptr;
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
     for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
         tcg_out_ld(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
                    TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
-- 
2.25.1


