Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595002EE729
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:49:46 +0100 (CET)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcE5-0001UA-D5
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhe-0001d6-Sd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:14 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhS-0001ic-3z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:14 -0500
Received: by mail-pl1-x634.google.com with SMTP id x18so4158380pln.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q/5vpDX6rjCPgvb/9YU60IegGHSAx+QWhFDunev+ydE=;
 b=tKhqSTfGfXj1R5xZMCAVCyQHiTprj/thhPCFx2AVuCjyGFUfdzWY7q2NW2KPZPvQzR
 9imiTToHRf8h92ifJgYFFzdtJ9BCNw5ZHRS8aK5lvWM7WJxdI5Lwtgsg6mGzro3eWwGc
 xDbC0UzHJDIV21miEy43sdQDHpgy7GyU2KxRh4Pxs1K6sdzJt2JaUdcraUnv0dXgqUWC
 65HZv16EApekEAQEh6UlyyARb7lFOxU1F52ZYbIH/gXDKsfu1Ne2YhP11kgv+ODEH8DV
 WsaQobfNkYH5rjGwV2uFyerJhoaZbvwT+qWzhTK/hG9R+DkHRXLDgiTcEi+acES7z4ei
 YQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q/5vpDX6rjCPgvb/9YU60IegGHSAx+QWhFDunev+ydE=;
 b=LsmVnxwm2nFBWP4Lpl2qwRSA0gluinAqRtJfCfG9uPhsqfXuG2gdrP655UG9gpVteQ
 jWgQ6ESJ7smiUWE6L8Hk2kw+E5Ze9Dc1zLZx6RZues8j82Ef+ecFCUELAc82AdRVskPt
 e0ks3EZuQceiureteA4v+A5MaS7TlvAqxfOeEFxkZOZu+49k1SabZThAJ1mrlyfz+LxC
 2nHkAFzgnDR78pqtjcfnXkziI53VZ7tmGsX83nVU1va8kIM2CNDizU74wytY7GhhswWQ
 3/nMXWzOqeqd97PrB+zyJ3p3hlMXBjM4zEBTeoUZgYdxt5YD7BGM3cS9Ju5FuZUt3t0O
 L3QQ==
X-Gm-Message-State: AOAM532mH1ZHLYhaCO5yrhyTiHUdIDMEfcK8wyq+MNAeIodZ2+DYpey1
 YJ/oN7jir2IhyuqAYQWyZM8syS4N0ZDSxQ==
X-Google-Smtp-Source: ABdhPJwlBBcCfhDQrNIQ2eQ9ecTj7oqDpM3u9shwjcwOCq27zLLNWumDsyV9g2brEl/w0QTP1Egp9g==
X-Received: by 2002:a17:90a:fe8e:: with SMTP id
 co14mr167459pjb.105.1610050560467; 
 Thu, 07 Jan 2021 12:16:00 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/47] tcg/riscv: Support split-wx code generation
Date: Thu,  7 Jan 2021 10:14:41 -1000
Message-Id: <20210107201448.1152301-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     |  2 +-
 tcg/riscv/tcg-target.c.inc | 41 +++++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 6263af4dd1..c50ecf4dab 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -171,6 +171,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
-#define TCG_TARGET_SUPPORT_MIRROR   0
+#define TCG_TARGET_SUPPORT_MIRROR   1
 
 #endif
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 34bee9c5a7..4d595b01d6 100644
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


