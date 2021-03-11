Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE5337690
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:11:22 +0100 (CET)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMy9-0005kq-Fe
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVR-0004Bf-5A
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:41 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVL-0006ty-1W
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:40 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id x27so2637076qvd.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9jHEmEI6EV8qZCeh+tCL5YyTrUMsHZff/il96+nDzSE=;
 b=I02QE7goGQeSkoprYxOzVvzhpmpDMnIiO+alAmhu20MUtN1ziVmo9yZOeFzYxD/nbY
 csLA4czW4PPfPpUFw+IeDmXEGg8cffgMG3icBoS9MRWC3cn4DPfrdqcsOkcpHjko2M9d
 WbyCr7puMBT6Ow8GtQPZmCyqVuPISqz3REU063ucTMIcdU+Or2uIOqyZWPXB5D9uckYI
 GF7900+gUx1M0UImysAV5er3PhzDt+nzY8Cc3QXCGmC1CURlIl7tZZuxqo6H4IbHNFlk
 /urP9GdtdjVzEXxXMweWc9ZVhSIe0HoWE8mSskSduAKKLVe8X+PppWtwOiRg2sM/M8cS
 L/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jHEmEI6EV8qZCeh+tCL5YyTrUMsHZff/il96+nDzSE=;
 b=D1IaEw8jDnbuSINF3q74asjRq73HqcCcj3U79GCpGLZFA/IPE3jY0JZgha4PHNDq0J
 U9+s2follAUSdoR436k+urJZhCuox/R8o2Yi2mN466LNeh3zWBGuZSzol3DaaufnYxW7
 7s8AYYF5qbCC44EVAXTDl3sfMNbrsg5OO2QSrxpScYGy0ddzH6zekArVoSKkmphOJJOf
 I6EXQG1QUnF1GYF0m6zXrZv2u+rWAsWjLSHeyKYQ55gIDKZBPV+mQrga4qTZuPg5TDPJ
 SdnL/oh2CFMS384krEpOUU7kxp/UcD6NKrsK/Q+Ixch6JlIJau9Yy3Wet7+ZL2eWK2Bp
 R2Aw==
X-Gm-Message-State: AOAM533AMsgoYwnFAyhuZuGX/WzQU5yeHQ4cVdQndz8fY+7JWxzazP9V
 JKdaic4t11LSVj5vFTtm5yT1zdgJTalFy58c
X-Google-Smtp-Source: ABdhPJxngCBfBLpORSM78ed7iNPkOTEJSitB94kbVDSGkcXYIz80nHuoytU3CxnD7ysUO20hc1Yu3w==
X-Received: by 2002:a05:6214:20a7:: with SMTP id
 7mr5664117qvd.24.1615473693751; 
 Thu, 11 Mar 2021 06:41:33 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 47/57] tcg/tci: Implement goto_ptr
Date: Thu, 11 Mar 2021 08:39:48 -0600
Message-Id: <20210311143958.562625-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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
index 92aec0d238..ce80adcfbe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1314,10 +1314,12 @@ void tcg_prologue_init(TCGContext *s)
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
index 76bbf440a8..c229050c66 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -69,6 +69,11 @@ static void tci_args_l(uint32_t insn, const void *tb_ptr, void **l0)
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
@@ -738,6 +743,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -995,6 +1009,11 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
         info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
         break;
 
+    case INDEX_op_goto_ptr:
+        tci_args_r(insn, &r0);
+        info->fprintf_func(info->stream, "%-12s  %s", op_name, str_r(r0));
+        break;
+
     case INDEX_op_call:
         tci_args_nl(insn, tb_ptr, &len, &ptr);
         info->fprintf_func(info->stream, "%-12s  %d,%p", op_name, len, ptr);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 0df8384be7..db29bc6e54 100644
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
@@ -567,6 +579,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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


