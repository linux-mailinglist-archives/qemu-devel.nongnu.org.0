Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C0D370FF8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:02:06 +0200 (CEST)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM2H-0004Bv-84
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy5-0007jF-BW
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:46 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy3-0000e1-66
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id i190so2955278pfc.12
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s+t/39Ywf4/ZGAPGkIVeZP54gbSFuGcrCceIAzZ9K40=;
 b=NPQsk9H3pn5kVNjx0wH8PWcf17XJbkpVpRgvCUc8XRPUwlAi8Ug2oSzVXrsMFcflT9
 ED4POhKCYvla4AOe9R/QG+Y0RyPjbJZGssDFyLN+WfsZANdDOCc3X5Ql5Q/aMwv2yuz2
 zvt43xCJR3uieBFmw8dxdNixVkDrARm8qxRBJbVShwl2Eo6eja2ds/1eLM1inPJomPFu
 AqMxidhN+jaMtdIDP6LKlha3Ka4vs2IFik0HEDp8DJY8KNtODzREl8cgSGd7IG7G+XnI
 z3+xrUDiEks4Qoo/5gVE4PY3zK4RwTChWajoa+46KWgYlCDSCe3SDoxHI47KRwR6Ag77
 OgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+t/39Ywf4/ZGAPGkIVeZP54gbSFuGcrCceIAzZ9K40=;
 b=dh/rcR7oX1hHsv2FSatpXmmN4TMr76DzD7icFWCsm1PFto1oagHX7rdkzlJ6/Yq50j
 FAHCYBym9VGWez8URQK48adR6sGOWiASbxqn+OiURejJFaqKHPNCsLOzIJb2fUWbTf4d
 Z+31jfiXeyq+28CFKkt4p8+1AiOVp9+7VEsb1bc1cDtK0kJhqtSAJsDaPNCEDku6VDCl
 z0EZzU0pp+cxztruq2Rop0qwCn4gtlda9pYVPyv4DeS3bPpoEaObGlVy2sL3Iyo6Tulk
 lQAMmOuEjllF609afsbpNPtJ2SllLHFgEtUK4rLCnlytIs2EvR7w8Kfacai1CRk38K4v
 /Uhg==
X-Gm-Message-State: AOAM532krXoMNZKm7zCwGQtjY+AnPGoiDGzObMfWDn2FDcOBgdIyJd9Z
 uGcF5wDQCpOHZXHQ7KLn9Atha1W3Yek8IA==
X-Google-Smtp-Source: ABdhPJyHzkPXh6k3/vsnTIfgSwfdWTvjUAQ1RMWAi9sf1TkSfkKN0mjQhkBz0XvQawaoxGQ6qKT1ag==
X-Received: by 2002:a63:4648:: with SMTP id v8mr7379346pgk.34.1619999861962;
 Sun, 02 May 2021 16:57:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/26] tcg/tci: Implement goto_ptr
Date: Sun,  2 May 2021 16:57:17 -0700
Message-Id: <20210502235727.1979457-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

This operation is critical to staying within the interpretation
loop longer, which avoids the overhead of setup and teardown for
many TBs.

The check in tcg_prologue_init is disabled because TCI does
want to use NULL to indicate exit, as opposed to branching to
a real epilogue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |  1 +
 tcg/tci/tcg-target.h         |  2 +-
 tcg/tcg.c                    |  2 ++
 tcg/tci.c                    | 19 +++++++++++++++++++
 tcg/tci/tcg-target.c.inc     | 16 ++++++++++++++++
 5 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/tcg/tci/tcg-target-con-set.h b/tcg/tci/tcg-target-con-set.h
index 316730f32c..ae2dc3b844 100644
--- a/tcg/tci/tcg-target-con-set.h
+++ b/tcg/tci/tcg-target-con-set.h
@@ -9,6 +9,7 @@
  * Each operand should be a sequence of constraint letters as defined by
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
+C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I3(r, r, r)
 C_O0_I4(r, r, r, r)
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index d953f2ead3..17911d3297 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -86,7 +86,7 @@
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_goto_ptr         0
+#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7b9e31d15e..4f20aaeab0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1355,10 +1355,12 @@ void tcg_prologue_init(TCGContext *s)
     }
 #endif
 
+#ifndef CONFIG_TCG_INTERPRETER
     /* Assert that goto_ptr is implemented completely.  */
     if (TCG_TARGET_HAS_goto_ptr) {
         tcg_debug_assert(tcg_code_gen_epilogue != NULL);
     }
+#endif
 }
 
 void tcg_func_start(TCGContext *s)
diff --git a/tcg/tci.c b/tcg/tci.c
index 95f57c831f..ea28077847 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -71,6 +71,11 @@ static void tci_args_l(uint32_t insn, const void *tb_ptr, void **l0)
     *l0 = diff ? (void *)tb_ptr + diff : NULL;
 }
 
+static void tci_args_r(uint32_t insn, TCGReg *r0)
+{
+    *r0 = extract32(insn, 8, 4);
+}
+
 static void tci_args_nl(uint32_t insn, const void *tb_ptr,
                         uint8_t *n0, void **l1)
 {
@@ -736,6 +741,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tb_ptr = *(void **)ptr;
             break;
 
+        case INDEX_op_goto_ptr:
+            tci_args_r(insn, &r0);
+            ptr = (void *)regs[r0];
+            if (!ptr) {
+                return 0;
+            }
+            tb_ptr = ptr;
+            break;
+
         case INDEX_op_qemu_ld_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
                 tci_args_rrm(insn, &r0, &r1, &oi);
@@ -993,6 +1007,11 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
         info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
         break;
 
+    case INDEX_op_goto_ptr:
+        tci_args_r(insn, &r0);
+        info->fprintf_func(info->stream, "%-12s  %s", op_name, str_r(r0));
+        break;
+
     case INDEX_op_call:
         tci_args_nl(insn, tb_ptr, &len, &ptr);
         info->fprintf_func(info->stream, "%-12s  %d, %p", op_name, len, ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index acb5f6c75e..01a8e20c5d 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -27,6 +27,9 @@
 static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
     switch (op) {
+    case INDEX_op_goto_ptr:
+        return C_O0_I1(r);
+
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld16u_i32:
@@ -263,6 +266,15 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     tcg_out32(s, insn);
 }
 
+static void tcg_out_op_r(TCGContext *s, TCGOpcode op, TCGReg r0)
+{
+    tcg_insn_unit insn = 0;
+
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    tcg_out32(s, insn);
+}
+
 static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
 {
     tcg_out32(s, (uint8_t)op);
@@ -565,6 +577,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         set_jmp_reset_offset(s, args[0]);
         break;
 
+    case INDEX_op_goto_ptr:
+        tcg_out_op_r(s, opc, args[0]);
+        break;
+
     case INDEX_op_br:
         tcg_out_op_l(s, opc, arg_label(args[0]));
         break;
-- 
2.25.1


