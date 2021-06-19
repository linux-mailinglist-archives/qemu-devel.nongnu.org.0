Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517AF3ADB52
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:28:16 +0200 (CEST)
Received: from localhost ([::1]:42016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufhX-0003Ee-9x
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUu-0000uq-T5
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUm-0002Jj-5H
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:12 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso7766693pjb.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIepckuQ0vf0IX35eDp/bRawEQA5SsFxOuzC6IQ1UvY=;
 b=mrWN1x2qb87Y/dgke9VdcfH56Oljdf6m51aLiYV2s3Dh6Rg9SmyNbX1YDsTZQSUTwL
 6UygU6eXQKqneUc1yJF3qD5OyZphYBOHtfhZzy19dWCCPqvJKhk2fxI7JVC6QqsfcIsg
 4M3q2ADPh8Fr6wBYVkyKNXupMRI1h33FDnzvgE/J1HtrdxmzXUBVrHPx+ejgvbwIPoE/
 IEKbzawbZQ2eM+10bj/uM3eubXJx5SBtJZFgcFs1KRrmgHhWY7+EF6fgT6NXs9bDBoCD
 HnpLYijFsnYh+RKv7/ob07oj/pdwrX2ml+Si3BwqdTfMz6BW6M1BMk/zZ2BZaSrO3DZo
 fAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FIepckuQ0vf0IX35eDp/bRawEQA5SsFxOuzC6IQ1UvY=;
 b=j9TwBW0BWjONzUGZ9W1g67iLoFF1BuBWnQ3F8LR2cOyepuUJ5y/jFOTA8N6tVKjY4K
 BxRUO4mzzz7WGvx9+HHuYrRA+MDjG5qGaRWXjPP+9jyDLEdxHHKaw0ZcMyH3p5jBWTaF
 pIeUPZKlNGnZweng/9R9qsc78d/GcuEDY8Lj43TYpxoh7bNWNtr87FISBGpCRQAQDRU0
 Rf0AorpQsawY/xLgYfXYPemzcSCM3EaCCjzKpLrRPAnUFqWumcW3n8Ze6kutFV6kIVkv
 HfSZvEmOkEEnFQw78fgOQQ2krck0YTjfiTCgQMoC49vLgsRGNkQCSDw2fjy1hnW2fjdl
 wQWg==
X-Gm-Message-State: AOAM5313EwL3BhCoF5aXU49hzX1I5vexranv85EmuxpjlP0CDgSyMZKs
 9C8wJ1tHQTpnGYxJNMHrzbiI5fd3+q53RQ==
X-Google-Smtp-Source: ABdhPJwyyxLUrOdkYiSm8HubZUYMLBxjJVtLOUdatBotMJZZNJKfyVV4IYfjohy10upItEimqx5NeQ==
X-Received: by 2002:a17:90b:2306:: with SMTP id
 mt6mr15675588pjb.71.1624126502819; 
 Sat, 19 Jun 2021 11:15:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/33] tcg/tci: Implement goto_ptr
Date: Sat, 19 Jun 2021 11:14:35 -0700
Message-Id: <20210619181452.877683-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This operation is critical to staying within the interpretation
loop longer, which avoids the overhead of setup and teardown for
many TBs.

The check in tcg_prologue_init is disabled because TCI does
want to use NULL to indicate exit, as opposed to branching to
a real epilogue.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |  1 +
 tcg/tci/tcg-target.h         |  2 +-
 tcg/tcg.c                    |  8 +++++++-
 tcg/tci.c                    | 19 +++++++++++++++++++
 tcg/tci/tcg-target.c.inc     | 16 ++++++++++++++++
 5 files changed, 44 insertions(+), 2 deletions(-)

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
index c9cbe505a7..6ced9282c1 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -87,7 +87,7 @@
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_goto_ptr         0
+#define TCG_TARGET_HAS_goto_ptr         1
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6472c6a8f4..dd584f3bba 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -785,10 +785,16 @@ void tcg_prologue_init(TCGContext *s)
     }
 #endif
 
-    /* Assert that goto_ptr is implemented completely.  */
+#ifndef CONFIG_TCG_INTERPRETER
+    /*
+     * Assert that goto_ptr is implemented completely, setting an epilogue.
+     * For tci, we use NULL as the signal to return from the interpreter,
+     * so skip this check.
+     */
     if (TCG_TARGET_HAS_goto_ptr) {
         tcg_debug_assert(tcg_code_gen_epilogue != NULL);
     }
+#endif
 }
 
 void tcg_func_start(TCGContext *s)
diff --git a/tcg/tci.c b/tcg/tci.c
index c82d5b2f51..4696ca161c 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -73,6 +73,11 @@ static void tci_args_l(uint32_t insn, const void *tb_ptr, void **l0)
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
@@ -739,6 +744,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -996,6 +1010,11 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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
index f74328dcbd..fc73c199a0 100644
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


