Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D82EB201
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:07:36 +0100 (CET)
Received: from localhost ([::1]:45144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqk3-0007dU-5H
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0v-0002wt-JO
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:57 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:32918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0t-0006jC-Od
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:57 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n25so302833pgb.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ceeCrB5ObxXqiOq+gfMl3DKYMpwFGb7NLNLd4oEq1k=;
 b=T6BkLGMbg3DA5Fos+36Z4OifTFptou3O2TGdVZ3OjB/y3tuetp8V4sOq5k5cMastHX
 pgYHARb+5JGxYIzVVeKh/0bF8xP3q5Fz1ps8prbIj1f0LW8rMwXm4nqHEX7gsWCTum4y
 PvutrKj14dX4YhKe0Xb70/HcokFEOTdvc/uGWQVObns65VaMhcU5vsxlUgElgvR3esW5
 O4ajWNiGIDzr45Vskm4q8VpTaebIKdbZZXOKbroDyg88m80W3ia9hr0PUNmO/SOOeEYX
 fgv5CBj9gRrHs2F37ptzPH12mJRzav9EYedQqvpPPZL64IuUHbqQlILJCHT9NT6QCx+N
 FXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ceeCrB5ObxXqiOq+gfMl3DKYMpwFGb7NLNLd4oEq1k=;
 b=FX4MgKMdKog/InbONEh4I3z4DnhcZPqgJlD+NuGS4qPjAItxnrX+0rraYxtsRzoyD9
 BlJpEaUs+2z2RrfkY0QSV5cm387XrjmFWzxchaheTkGFdEm7paMtAt2JU0OP/UOLIyZw
 2SsEcCfChAWv+9egf4m3d81/PbL3Km7DURtqQjdpETf6ClNrVNbZYMDgF2rDEeQfb+aY
 ZG0h6SKkTGdumDp3V0C3LcMNdflPhDd1h+99lY7ikJIDheSyXtAU4SLWLQCsmOUhM6wa
 GIwrKByXTY0+Zmc3ptsrAcyFDi3SaK1EhnU8FkKRG09i3uMTtdVf8CBG4L8Y+6h46kD0
 g+yw==
X-Gm-Message-State: AOAM533S8aM4Oocvj1JXKLNv3hX4fVV3BacMNbB6kFW+QBdClvCPDoSS
 V7KyyaUPvdoYrs/eSCmpFEYkl9wcoHBMmA==
X-Google-Smtp-Source: ABdhPJwdI2gFQBAc0uy6IDDoaWp4SlqrDZUgWjyJ4N381gD550HxEKmMn/uChzLHxf8L/r8HTuS7jA==
X-Received: by 2002:a63:4b54:: with SMTP id k20mr367312pgl.290.1609867253881; 
 Tue, 05 Jan 2021 09:20:53 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 35/43] tcg/riscv: Remove branch-over-branch fallback
Date: Tue,  5 Jan 2021 07:19:42 -1000
Message-Id: <20210105171950.415486-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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


