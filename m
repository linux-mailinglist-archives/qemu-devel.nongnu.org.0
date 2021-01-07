Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABF2EE723
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:47:06 +0100 (CET)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcBV-0006Zv-1H
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhe-0001b2-57
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:14 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhS-0001iV-2e
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:13 -0500
Received: by mail-pl1-x631.google.com with SMTP id v3so4138888plz.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ceeCrB5ObxXqiOq+gfMl3DKYMpwFGb7NLNLd4oEq1k=;
 b=N9pVmwDPAMYoZqD5ZPzkVozef2ojVxu9BXFUW37mllgJzk67+mNgrak/E+kkK60dKe
 3ACTl+yUDpAvxRJwHgMgpMjmlW5DNy7qK6AFe3Y5xSQdWwYQcTAHT3sLtCVxJgdVZtfE
 PK2P6+VRAK8Um7oT05RrROJtCBK6kVmCzd7+xYng68rCXvpG9+bY5lLNaCsBexbFOz+L
 p4XhDWinsAYP04TZyppmPuqjpoBHnihtlgE8Fs2w+g3pIY1xuV6obnahvpL9ohdAp5BO
 wktlvrHNlXlWBWI7b5d2Epto5Keqa7unMZijQuT0S6YQYzvfYi3gEWaFSG8nlWuGlQqQ
 7kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ceeCrB5ObxXqiOq+gfMl3DKYMpwFGb7NLNLd4oEq1k=;
 b=p6HGIudI5cSUfZT+8xRVdkl76AGDmjnFTxCxYju1iY4m6+G+VjHmyjkB1lkdOb9Gzh
 7K5qx8gzkqjmIwSyEbrO30znBVIhTZmGQk9FQ9f6ro3LHKGb467Qj/jS7HIsCZzzOdwE
 qWpe1x7iwMRa9/S5ELMysEeGD7rCaZ3a65vNUzoAabY+ldhmgRLC7x9RiBzepgsRHqig
 sBudEWxfaPBdUq8/ZT6LCdkqmtkvmWcBfY7jxBh+6E/01g19g+AjfS8uAbeMDukO6kCZ
 ZJJTpW4Ea82zMPpNExdurqpqM0fUg3v/mAok6P0eZpSgQnu2O//OgUQOOwLcNJZKpSoL
 Rl9Q==
X-Gm-Message-State: AOAM530OTfMe1/LMfFmKo5LA2WXokjpTvlwKbep2s9kHsww4Ky6QI+E/
 xogJT10gcwDpXtMcYXTJYyLJt/s7B6XjRQ==
X-Google-Smtp-Source: ABdhPJw8MlPkf/Eix6+OxuySqV6ggPIe2HAtDIMdY28YVZPNyMVKkGIpnHmJ0n1NMJpp2m/8LJgDkg==
X-Received: by 2002:a17:90a:bb8c:: with SMTP id
 v12mr150074pjr.227.1610050558802; 
 Thu, 07 Jan 2021 12:15:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/47] tcg/riscv: Remove branch-over-branch fallback
Date: Thu,  7 Jan 2021 10:14:40 -1000
Message-Id: <20210107201448.1152301-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Since 7ecd02a06f8, we are prepared to re-start code generation
with a smaller TB if a relocation is out of range.  We no longer
need to leave a nop in the stream Just In Case.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 56 ++++----------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 5b4c500a4b..34bee9c5a7 100644
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


