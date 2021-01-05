Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9962EB1AC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:46:04 +0100 (CET)
Received: from localhost ([::1]:49114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqPD-00022o-38
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0w-00030G-QI
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:58 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0u-0006kM-UO
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:58 -0500
Received: by mail-pl1-x630.google.com with SMTP id v3so39056plz.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q/5vpDX6rjCPgvb/9YU60IegGHSAx+QWhFDunev+ydE=;
 b=ZV/RDqiDkgBL4Jpfvc70f3eWatofFqf6B1fWJOedilxqkUt+1psshOWpOH+0dQs/cu
 IEftZBVQboMUtSwO0N/vx3yS5eeEPRomEIbEOqEUojJOLvWC/OqvlH/dPoS8abBLZdC2
 Fbd/hAeFUFso4l/GV7Nb9MsoaxmjrvnfMZKz2fZCntuI0I8+bqujn2ko5VGlwS4RsnyA
 2kWr9sDs9Ckp9BDvMszTSTKDwzxMWzXQPCB23SBRYX+I442alRWhW2mRKVQW9uXqMndg
 anjq5VVtuqHTaS08i2/+166V/IcSjuv8u/KIdd0Mpw+PBe/3fcCLp34/QHzp6+QNRMTI
 LgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q/5vpDX6rjCPgvb/9YU60IegGHSAx+QWhFDunev+ydE=;
 b=fiTRp6tSu44VNonYxYstpgs0/jVtiX8Pc3Qm9vTtFke+lzCWVGzoOZ6LYeQLXk2t91
 y/j677AYfDY5QfNDHGUW8qL9BQO6yE+yE1ZIdSLfyY2xOZXyb0/q4WxcKTCznyW6STZZ
 UMxNjdhHKMRanMsN9cX3I5+17hhEOpkCSd+sKYJq9alaJuU19o7ycdgHiPYv8pz6MvKU
 s+PXXyIhA7lioqKYQJV56mD/c3Moicj7oOjAiLrdQCgBovYCCy/LEtgSM3tQvRdzQ/13
 JuPsR9KUCnRXu1ADcgqoR25gqTSZNooohmMrt4dUvWgaeE2SKAvxbcoRVCMqdvfYSCzs
 uccg==
X-Gm-Message-State: AOAM5310RTL+iKcV2kCfCPtWoRsI+87UT19cPVZ0yFcxOMz44uagyGjo
 w0r9SaYjqHtJcInlD7JdKgxIzClYp++Szw==
X-Google-Smtp-Source: ABdhPJw8pdvmEoture6ns8rReoQkCgQEF7bTl2GPUPWJQ7t98ElJFxpnZ2n/GaiaNaB0LcDB3fMSzA==
X-Received: by 2002:a17:90a:fa81:: with SMTP id
 cu1mr253513pjb.39.1609867255438; 
 Tue, 05 Jan 2021 09:20:55 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/43] tcg/riscv: Support split-wx code generation
Date: Tue,  5 Jan 2021 07:19:43 -1000
Message-Id: <20210105171950.415486-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
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


