Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CC2D99CA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:24:18 +0100 (CET)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koolt-0001GQ-RC
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSK-00022f-Vg
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:06 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSC-0003yU-V2
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:04 -0500
Received: by mail-ot1-x332.google.com with SMTP id q25so15757684otn.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qjl1QspWlOuJ+/D2vJaBwH05ftTGSnNZLxwMR0hFvkY=;
 b=SLG3pl8IrZCFnHBWTynRUCZ/XUTpjh33loomHFobBr/dKZecLe9eRfjVTkU4nSAri5
 Rx4MIH6nk32+XtF2JWOr9QjwuxBSJUhwjfiMbYGSur67vg5Ao0Sr+OcMuwQLjZkF6RyK
 1niFAXyI5KBQiwr5rDjhZVS3/hhN8vD0g53+P/GqBMoesngxfuGAGXCKyvdQZ26msP76
 og6P0JOHblU/u9sgAJLEDqGGJCBLAl4D5EYSQDnDBv3ZHnoSmyJZRWxNrerIGC1stEUD
 7Gr4G07HxkjWzFI9yKFTmVP5rpoW7QAO99O3N/tAcPCU2/hmGQeHx12Uk+VQeWZ0cv2I
 Fmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qjl1QspWlOuJ+/D2vJaBwH05ftTGSnNZLxwMR0hFvkY=;
 b=n8Eib7HmA7xCIkMI3a4tFCFwt1M8mtHM/f5jax0ta6m1u7mUe1pIjxpHsde0eyZbN0
 rGi2s8kSiTNC4Ab5X4W5I+I0jePQX+Z+paIeSZGXcSq5XQ7WO6xdpMs5YPHhPFBumD/T
 O6pKQ1b0SCqw0tVjEkENuHhqv1BDzTJUq3o8viGHnNUrakHPC163LN3aawfZvC1rukHF
 +TWHcdQbTazAYnRmgz30VcMsLOxx8EvKlR5+l+kmpl9Hz2Ee8KC8vTg4lz2I8s/itHVS
 +dZXaHFksu7YPxkTbe3T1bCTk8B49FcPp2ZOnrZE56nICwHnwJCHemrg/AGecBy9g4g2
 vQMg==
X-Gm-Message-State: AOAM532QslUimtRnTW/EWc5RX+30ivtbjWVIOrzeJguvCoZGYhheGUbR
 2RB4+uTO5/6iD9XwFUxRoWXswMrc84cEk415
X-Google-Smtp-Source: ABdhPJwVgxSePPjpBVCbG4t3AQ7NlANOCQ40eeRwQOOl8uo0dPLqH3LIVq6/kEybGo+7WZgvwyhE5A==
X-Received: by 2002:a9d:4793:: with SMTP id b19mr19292987otf.193.1607954635444; 
 Mon, 14 Dec 2020 06:03:55 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/43] tcg/aarch64: Support split-wx code generation
Date: Mon, 14 Dec 2020 08:02:54 -0600
Message-Id: <20201214140314.18544-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/aarch64/tcg-target.c.inc | 57 ++++++++++++++++++++----------------
 2 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 92aefc32d3..81778e3a9c 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -154,6 +154,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
-#define TCG_TARGET_SUPPORT_MIRROR       0
+#define TCG_TARGET_SUPPORT_MIRROR       1
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index bd888bc66d..2e33162c03 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -78,38 +78,42 @@ static const int tcg_target_call_oarg_regs[1] = {
 #define TCG_REG_GUEST_BASE TCG_REG_X28
 #endif
 
-static inline bool reloc_pc26(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+static bool reloc_pc26(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    ptrdiff_t offset = target - code_ptr;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t offset = target - src_rx;
+
     if (offset == sextract64(offset, 0, 26)) {
         /* read instruction, mask away previous PC_REL26 parameter contents,
            set the proper offset, then write back the instruction. */
-        *code_ptr = deposit32(*code_ptr, 0, 26, offset);
+        *src_rw = deposit32(*src_rw, 0, 26, offset);
         return true;
     }
     return false;
 }
 
-static inline bool reloc_pc19(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+static bool reloc_pc19(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
-    ptrdiff_t offset = target - code_ptr;
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t offset = target - src_rx;
+
     if (offset == sextract64(offset, 0, 19)) {
-        *code_ptr = deposit32(*code_ptr, 5, 19, offset);
+        *src_rw = deposit32(*src_rw, 5, 19, offset);
         return true;
     }
     return false;
 }
 
-static inline bool patch_reloc(tcg_insn_unit *code_ptr, int type,
-                               intptr_t value, intptr_t addend)
+static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
+                        intptr_t value, intptr_t addend)
 {
     tcg_debug_assert(addend == 0);
     switch (type) {
     case R_AARCH64_JUMP26:
     case R_AARCH64_CALL26:
-        return reloc_pc26(code_ptr, (tcg_insn_unit *)value);
+        return reloc_pc26(code_ptr, (const tcg_insn_unit *)value);
     case R_AARCH64_CONDBR19:
-        return reloc_pc19(code_ptr, (tcg_insn_unit *)value);
+        return reloc_pc19(code_ptr, (const tcg_insn_unit *)value);
     default:
         g_assert_not_reached();
     }
@@ -1050,12 +1054,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     /* Look for host pointer values within 4G of the PC.  This happens
        often when loading pointers to QEMU's own data structures.  */
     if (type == TCG_TYPE_I64) {
-        tcg_target_long disp = value - (intptr_t)s->code_ptr;
+        intptr_t src_rx = (intptr_t)tcg_splitwx_to_rx(s->code_ptr);
+        tcg_target_long disp = value - src_rx;
         if (disp == sextract64(disp, 0, 21)) {
             tcg_out_insn(s, 3406, ADR, rd, disp);
             return;
         }
-        disp = (value >> 12) - ((intptr_t)s->code_ptr >> 12);
+        disp = (value >> 12) - (src_rx >> 12);
         if (disp == sextract64(disp, 0, 21)) {
             tcg_out_insn(s, 3406, ADRP, rd, disp);
             if (value & 0xfff) {
@@ -1308,14 +1313,14 @@ static void tcg_out_cmp(TCGContext *s, TCGType ext, TCGReg a,
 
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
-    ptrdiff_t offset = target - s->code_ptr;
+    ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
     tcg_debug_assert(offset == sextract64(offset, 0, 26));
     tcg_out_insn(s, 3206, B, offset);
 }
 
-static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
+static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
 {
-    ptrdiff_t offset = target - s->code_ptr;
+    ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
     if (offset == sextract64(offset, 0, 26)) {
         tcg_out_insn(s, 3206, B, offset);
     } else {
@@ -1329,9 +1334,9 @@ static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
     tcg_out_insn(s, 3207, BLR, reg);
 }
 
-static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
-    ptrdiff_t offset = target - s->code_ptr;
+    ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
     if (offset == sextract64(offset, 0, 26)) {
         tcg_out_insn(s, 3206, BL, offset);
     } else {
@@ -1393,7 +1398,7 @@ static void tcg_out_brcond(TCGContext *s, TCGType ext, TCGCond c, TCGArg a,
         tcg_out_reloc(s, s->code_ptr, R_AARCH64_CONDBR19, l, 0);
         offset = tcg_in32(s) >> 5;
     } else {
-        offset = l->u.value_ptr - s->code_ptr;
+        offset = tcg_pcrel_diff(s, l->u.value_ptr) >> 2;
         tcg_debug_assert(offset == sextract64(offset, 0, 19));
     }
 
@@ -1568,7 +1573,7 @@ static void * const qemu_st_helpers[16] = {
     [MO_BEQ]  = helper_be_stq_mmu,
 };
 
-static inline void tcg_out_adr(TCGContext *s, TCGReg rd, void *target)
+static inline void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target);
     tcg_debug_assert(offset == sextract64(offset, 0, 21));
@@ -1581,7 +1586,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     MemOp opc = get_memop(oi);
     MemOp size = opc & MO_SIZE;
 
-    if (!reloc_pc19(lb->label_ptr[0], s->code_ptr)) {
+    if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -1606,7 +1611,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     MemOp opc = get_memop(oi);
     MemOp size = opc & MO_SIZE;
 
-    if (!reloc_pc19(lb->label_ptr[0], s->code_ptr)) {
+    if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
@@ -1631,7 +1636,8 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->type = ext;
     label->datalo_reg = data_reg;
     label->addrlo_reg = addr_reg;
-    label->raddr = raddr;
+    /* TODO: Cast goes away when all hosts converted */
+    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr;
 }
 
@@ -1849,7 +1855,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 #endif /* CONFIG_SOFTMMU */
 }
 
-static tcg_insn_unit *tb_ret_addr;
+static const tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
@@ -2894,11 +2900,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    tcg_code_gen_epilogue = s->code_ptr;
+    /* TODO: Cast goes away when all hosts converted */
+    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_X0, 0);
 
     /* TB epilogue */
-    tb_ret_addr = s->code_ptr;
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
 
     /* Remove TCG locals stack space.  */
     tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_SP, TCG_REG_SP,
-- 
2.25.1


