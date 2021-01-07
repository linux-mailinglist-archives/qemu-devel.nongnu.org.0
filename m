Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138672EE720
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:45:30 +0100 (CET)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc9x-0004U2-4n
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhF-0001UD-0N
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:56 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh7-0001g2-OC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:48 -0500
Received: by mail-pg1-x533.google.com with SMTP id i7so5738086pgc.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8AfGj+HO8ldfN1QyJhTtl82SWRrf2P8eJp7eJUkZZU=;
 b=QjgmX7zq2eFiWPxY9sHRinmktZNMMoCl9FwfnzOKXria7lfTZz3jGJyMJaQRg0JIf8
 ojlWXjD7FECKxnoTFMs8/1kAPHhrKw6c02v55Em09GjOzxfQ595TELOLZeHf1wcBEQsH
 UFwoHU2H5lQb53YxD5/6GGDjILuQY4keQi1cbpJw0aFZJWdwjxlG/FS4ZTEMv204qms3
 0VL/BgvFIUzvK7Kuc+fc827tmEeWzMhcLpfUnC9j2SXdHjthE8hsLV2y77X4PaZT1e6O
 jKOu2khGCaiHdOCQu+bSU8RCa2fv/Bqj6VPaj23xw3hRJNL2xZHDpl6u61gQqyYMofpG
 7hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8AfGj+HO8ldfN1QyJhTtl82SWRrf2P8eJp7eJUkZZU=;
 b=fj8OE12z16B0MuW5XvHMPEaWXtznGndgR0jh5aa/HIP15YbiqBBphO2TpVaenQoGdj
 +IZXkoMXofPSB8WlEOBUB6kssojG2X7mT0+jypu6BkgDL1gXtAfcgeUY91wwHdqpTMrK
 ZhR63a0NS3JG5xEWD+mt+3e2Dnkj5w3hcOtaYIgJc3QNXt62jFWGCE/fiBHWH8Zpkpkd
 EywYCDOPQ8qoRWTGB+pcDnS4kbojLG8DJl6yJ9F5KZ2nxgW24xwiAwmv12pRptxLgctd
 iELRd7TmOCdH2pZIqLjhba+tGf2C0j8Yr+/Zk+u/zaIRLjeISsYOtfghXGybJRlVhahM
 OQdA==
X-Gm-Message-State: AOAM530As9QttoUBxo7Vm/L/cX2yw7sne2QfL/OUfT1BP/kPaLiQfEox
 PnN8BqHnbS08msq/cW0yO5euzn0PsFj/UA==
X-Google-Smtp-Source: ABdhPJxyEZS9R+yK71TQ4UUkXtE1BjRzDDYFBb1sDImastdBPWFN05Zl6zC6rb6tuGhD+edbVgBwyw==
X-Received: by 2002:aa7:9f1d:0:b029:1ad:2aaa:c1e3 with SMTP id
 g29-20020aa79f1d0000b02901ad2aaac1e3mr299722pfr.75.1610050539567; 
 Thu, 07 Jan 2021 12:15:39 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/47] tcg/aarch64: Support split-wx code generation
Date: Thu,  7 Jan 2021 10:14:28 -1000
Message-Id: <20210107201448.1152301-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/aarch64/tcg-target.c.inc | 57 ++++++++++++++++++++----------------
 2 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 23bf87db3d..079828ea71 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,6 +155,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
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


