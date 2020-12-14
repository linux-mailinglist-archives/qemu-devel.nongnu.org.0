Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2C2D9A07
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:34:04 +0100 (CET)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koovL-0003g3-Q2
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSY-0002GA-6J
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:18 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSW-00041t-AS
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:17 -0500
Received: by mail-ot1-x341.google.com with SMTP id w3so15757739otp.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LiVRLDdLRLwNh3EAfOwsqGZsrXFOtm3LiOx00UdIraE=;
 b=Yp539SXcv2vVYvEqOD/L8Yr9KE2L4Jm69B9GJKrh46zdLmup4HJoKxVfdE3Plhty2F
 mBaxZ3T2MDEL4U82om742B7cz6Efc9DVDscPrRLdPO9eGtmpVFmiqlKIX/luT7SYQynR
 vXq/fIpYm6knq4uG0Bl7mZVPIKcmFReRRJp2LxQ9yu1d+4qxLzrEuQepW9Bd7eh/vf9T
 JT2z7+xGiQxFnNP9OYhpmdlJVtYrOLKPQxozO0ZuEzEy3Wr5EBG2HBwKctAtTOZ5oNKI
 Qc4S/Rr3nm8HOXJY0C4pNmd7PtfHXLtRVT8br/LSzm/fnjpcUE687RCnybQfimHsGXch
 8WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LiVRLDdLRLwNh3EAfOwsqGZsrXFOtm3LiOx00UdIraE=;
 b=fbPBMbZZaKg2IiJl/QeQPfJlMIomgSAmFLNTJMBN9wEJ8RhioOxe7qu2pHxrNnWmkx
 cm8oEE7fOlIk+SAewiAhsOT2qzbskXCk0+FL/RQnHcWrP/ojEXF1mxc8knX4EdvRwiBV
 4xTsvwGv60024kKojPzWpcFlFFKvokzPtJcpt7w5K+J4slKVdOcBgbBsfITTMzxTCZE9
 /8VxhAg4QN9fxbjwRIJbJ/jEY3dPkZ7EZ20y2GKsNdBzT/xaCA+3L2nNu+mm2rDWJ6h9
 cOUdaENJDqnjbgrThUwyspYegDNdim7vZwpmP9QK9zKcJDO+Eue3NsazJg9c6ohIW7O0
 qYUA==
X-Gm-Message-State: AOAM531ki6mmSN+vQoJJQIz0W/5iJoFmX3zuq9oXTyhc4e3eDTYY8d8s
 QRzjEnPrxH4K58LPoF6v8phoJ5FdDbmZiGMH
X-Google-Smtp-Source: ABdhPJxdGTN8exexdmu/vaVbNUxQDCmGy89jVn8j8d4Ned7ZXkfN1k8BzQ4boWtLtrtEYdjUF+6SrA==
X-Received: by 2002:a9d:4b81:: with SMTP id k1mr19980131otf.371.1607954654859; 
 Mon, 14 Dec 2020 06:04:14 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/43] tcg/riscv: Remove branch-over-branch fallback
Date: Mon, 14 Dec 2020 08:03:06 -0600
Message-Id: <20201214140314.18544-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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

Since 7ecd02a06f8, we are prepared to re-start code generation
with a smaller TB if a relocation is out of range.  We no longer
need to leave a nop in the stream Just In Case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 56 ++++----------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 195c3eff03..02beb86977 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -469,43 +469,16 @@ static bool reloc_call(tcg_insn_unit *code_ptr, const tcg_insn_unit *target)
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
-    uint32_t insn = *code_ptr;
-    intptr_t diff;
-    bool short_jmp;
-
     tcg_debug_assert(addend == 0);
-
     switch (type) {
     case R_RISCV_BRANCH:
-        diff = value - (uintptr_t)code_ptr;
-        short_jmp = diff == sextreg(diff, 0, 12);
-        if (short_jmp) {
-            return reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
-        } else {
-            /* Invert the condition */
-            insn = insn ^ (1 << 12);
-            /* Clear the offset */
-            insn &= 0x01fff07f;
-            /* Set the offset to the PC + 8 */
-            insn |= encode_sbimm12(8);
-
-            /* Move forward */
-            code_ptr[0] = insn;
-
-            /* Overwrite the NOP with jal x0,value */
-            diff = value - (uintptr_t)(code_ptr + 1);
-            insn = encode_uj(OPC_JAL, TCG_REG_ZERO, diff);
-            code_ptr[1] = insn;
-
-            return true;
-        }
-        break;
+        return reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
     case R_RISCV_JAL:
         return reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
     case R_RISCV_CALL:
         return reloc_call(code_ptr, (tcg_insn_unit *)value);
     default:
-        tcg_abort();
+        g_assert_not_reached();
     }
 }
 
@@ -779,21 +752,8 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
         arg2 = t;
     }
 
-    if (l->has_value) {
-        intptr_t diff = tcg_pcrel_diff(s, l->u.value_ptr);
-        if (diff == sextreg(diff, 0, 12)) {
-            tcg_out_opc_branch(s, op, arg1, arg2, diff);
-        } else {
-            /* Invert the conditional branch.  */
-            tcg_out_opc_branch(s, op ^ (1 << 12), arg1, arg2, 8);
-            tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, diff - 4);
-        }
-    } else {
-        tcg_out_reloc(s, s->code_ptr, R_RISCV_BRANCH, l, 0);
-        tcg_out_opc_branch(s, op, arg1, arg2, 0);
-        /* NOP to allow patching later */
-        tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
-    }
+    tcg_out_reloc(s, s->code_ptr, R_RISCV_BRANCH, l, 0);
+    tcg_out_opc_branch(s, op, arg1, arg2, 0);
 }
 
 static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
@@ -1009,8 +969,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     /* Compare masked address with the TLB entry. */
     label_ptr[0] = s->code_ptr;
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
-    /* NOP to allow patching later */
-    tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
 
     /* TLB Hit - translate address using addend.  */
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
@@ -1054,8 +1012,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* resolve label address */
-    if (!patch_reloc(l->label_ptr[0], R_RISCV_BRANCH,
-                     (intptr_t) s->code_ptr, 0)) {
+    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
         return false;
     }
 
@@ -1089,8 +1046,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* resolve label address */
-    if (!patch_reloc(l->label_ptr[0], R_RISCV_BRANCH,
-                     (intptr_t) s->code_ptr, 0)) {
+    if (!reloc_sbimm12(l->label_ptr[0], s->code_ptr)) {
         return false;
     }
 
-- 
2.25.1


