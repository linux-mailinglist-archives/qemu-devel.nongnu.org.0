Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D6308E58
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:24:42 +0100 (CET)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aJt-0004qS-D4
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6V-0006Kp-H2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:51 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6T-00084N-Ez
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:51 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q2so5896385plk.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1em8pBHjBL7/5zdQ88dpF9TSGh7vMTgLGyFaaNNAAyM=;
 b=XvZ98F21LO10V6c0wXsk8B8ytCU5cbctEgNvEut2t7cRJEMlFbypi2nSuTQ/8jnLoG
 +QEF0oCMpwFZQldL5WqkCAOK+37OWJi3zcho2znHQMpHYP/tf2ft07uNSyJl+EtbUjI0
 dF89LlzzgaQh7/8kbxb4p39wofT10NNv9Dv0QZczVNqra4fSL51f9CvgQ8MjzAQt4dpk
 4OdlF53LO3QltO9wK6plMmcTn7FPijiu+L26c5826aIVNzWcT6uhOQXuoWllLaC5/ji9
 IdhATTOQTWbGcPx1mWa/R/8tdZy6ARCo37Db0PQ11kYH1qtqh/rPWjs8RyaxZMg9OIOF
 K6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1em8pBHjBL7/5zdQ88dpF9TSGh7vMTgLGyFaaNNAAyM=;
 b=SK8c+JtSQX13yousehWPgEkzmz1biy5xtQMGFErf0qhbTZrF6MaI3Pf87sYwVA4X3Y
 zNRogRICYXI91M9iwArdjEWXJCTlLN4z+eZ78hkW6wyOm0aOhnoAzRLA2h/GZphlqCBb
 Ung02TPDk7fntoomk9ZUUeLf4pi9FOp4l8anB3uPpp1z3dlAB+EsFPyizFcqnjSeIx/M
 lWkn/T0lyVWtcGiMtxJP/C4X4jKNjDuHspnmqtuu9R6K61YM+WL4EjLGFDy9nQqWrzFX
 /Otb5TGLGtMp/aYQ9HctTR90FH7uwCkc22C40Kjfe/GhhaAEYnE0pH98jbE5GICv5CSC
 NGsg==
X-Gm-Message-State: AOAM5336Hb9U+hEhj32kKbDHZmWyTZtNQaRJYq/4Ogk0bYdFAaGILZmn
 GMbvU0o0HABrjXySfFHrhFT1xHelt8SmL0vp
X-Google-Smtp-Source: ABdhPJwVryBbgtxBDq5f/1EwGoLQfSdmIxjh3u6LDEE1JnzyzSFBQIwuaT8b1fY4yHd6Fn0hSTW5oQ==
X-Received: by 2002:a17:902:ed88:b029:de:86f9:3e06 with SMTP id
 e8-20020a170902ed88b02900de86f93e06mr5842461plj.46.1611951048085; 
 Fri, 29 Jan 2021 12:10:48 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/24] tcg/mips: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 29 Jan 2021 10:10:14 -1000
Message-Id: <20210129201028.787853-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-con-str.h | 24 +++++++++++
 tcg/mips/tcg-target.h         |  1 +
 tcg/mips/tcg-target.c.inc     | 77 ++++++++++-------------------------
 3 files changed, 46 insertions(+), 56 deletions(-)
 create mode 100644 tcg/mips/tcg-target-con-str.h

diff --git a/tcg/mips/tcg-target-con-str.h b/tcg/mips/tcg-target-con-str.h
new file mode 100644
index 0000000000..e4b2965c72
--- /dev/null
+++ b/tcg/mips/tcg-target-con-str.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define MIPS target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_QLOAD_REGS)
+REGS('S', ALL_QSTORE_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_U16)
+CONST('J', TCG_CT_CONST_S16)
+CONST('K', TCG_CT_CONST_P2M1)
+CONST('N', TCG_CT_CONST_N16)
+CONST('W', TCG_CT_CONST_WSZ)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c2c32fb38f..d850200855 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -207,5 +207,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7293169ab2..432d38a010 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -171,67 +171,27 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_N16  0x1000   /* "Negatable" 16-bit: -32767 - 32767 */
 #define TCG_CT_CONST_WSZ  0x2000   /* word size */
 
+#define ALL_GENERAL_REGS  0xffffffffu
+#define NOA0_REGS         (ALL_GENERAL_REGS & ~(1 << TCG_REG_A0))
+
+#ifdef CONFIG_SOFTMMU
+#define ALL_QLOAD_REGS \
+    (NOA0_REGS & ~((TCG_TARGET_REG_BITS < TARGET_LONG_BITS) << TCG_REG_A2))
+#define ALL_QSTORE_REGS \
+    (NOA0_REGS & ~(TCG_TARGET_REG_BITS < TARGET_LONG_BITS   \
+                   ? (1 << TCG_REG_A2) | (1 << TCG_REG_A3)  \
+                   : (1 << TCG_REG_A1)))
+#else
+#define ALL_QLOAD_REGS   NOA0_REGS
+#define ALL_QSTORE_REGS  NOA0_REGS
+#endif
+
+
 static inline bool is_p2m1(tcg_target_long val)
 {
     return val && ((val + 1) & val) == 0;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch(*ct_str++) {
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'L': /* qemu_ld input arg constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_A0);
-#if defined(CONFIG_SOFTMMU)
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A2);
-        }
-#endif
-        break;
-    case 'S': /* qemu_st constraint */
-        ct->regs = 0xffffffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_A0);
-#if defined(CONFIG_SOFTMMU)
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A2);
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A3);
-        } else {
-            tcg_regset_reset_reg(ct->regs, TCG_REG_A1);
-        }
-#endif
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_U16;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_S16;
-        break;
-    case 'K':
-        ct->ct |= TCG_CT_CONST_P2M1;
-        break;
-    case 'N':
-        ct->ct |= TCG_CT_CONST_N16;
-        break;
-    case 'W':
-        ct->ct |= TCG_CT_CONST_WSZ;
-        break;
-    case 'Z':
-        /* We are cheating a bit here, using the fact that the register
-           ZERO is also the register number 0. Hence there is no need
-           to check for const_args in each instruction. */
-        ct->ct |= TCG_CT_CONST_ZERO;
-        break;
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
-
 /* test if a constant matches the constraint */
 static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
                                          const TCGArgConstraint *arg_ct)
@@ -1697,6 +1657,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     TCGArg a0, a1, a2;
     int c2;
 
+    /*
+     * Note that many operands use the constraint set "rZ".
+     * We make use of the fact that 0 is the ZERO register,
+     * and hence such cases need not check for const_args.
+     */
     a0 = args[0];
     a1 = args[1];
     a2 = args[2];
-- 
2.25.1


