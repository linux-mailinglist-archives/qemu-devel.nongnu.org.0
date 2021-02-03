Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4830D174
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:26:56 +0100 (CET)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77sc-0003Gp-Vs
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iJ-0007kn-F3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:15 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iF-00011p-9p
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:15 -0500
Received: by mail-pl1-x632.google.com with SMTP id e12so4387259pls.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1em8pBHjBL7/5zdQ88dpF9TSGh7vMTgLGyFaaNNAAyM=;
 b=XKM/QJN0hyhijlX6+AU0V/Whl5XfsW5W/TRxosRMPejwYjJBxeDFMCzlL9MC2Cm0wp
 dh5tE/qsgqGZE55SaXcPsLmj4z8VyWVi9cyTvwoHqFrJpcswsO8yg0lm+T3WsJcVjq18
 mHpYc7/6PwWkVGNKjNS8wATVJQVuRRKdQlHE7z4Im57G5m8F5pTWOaLUaiNc5x6OQ5Ki
 PJCoixbqyZF+74f4+OUQTHqNPCrEkGSTbhwSbsxOl3l2lSaiwUOb4czAousYOPG80DcH
 4Z8rDRJKCG1J4d13BDZeMvNTqJpu0gu+7hsnVKZ4WoHsS1VF1I3I1asDENCNHKHaAP4U
 1JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1em8pBHjBL7/5zdQ88dpF9TSGh7vMTgLGyFaaNNAAyM=;
 b=dnLNsNubBWrHitF3cQukP0tqrwKEom9NyT5Y7q8MMkS/MwMHn+MJlTyvLct9C9Rtyl
 nnDUKTdFYij3jCkjX97mMMJZCsp6NWbI1GcEgpn5GkrfIVFiG2vfrbCFI7N3pkC+3LS1
 ezpx4DkiGUk/q8LSY+UES5/6GGVlbon/1nBMsFrN5secDOEABcVxYMNEuTkIPGRY82vr
 LbQYWfu+GnFVkH4rFZW6jUoB36X2RKRt/0O+C0KhJY15LLo3ut7z2X5o3rbwQ8ttARV7
 gAbVLdO0+ZNJA/uDMOPd7luwMijBbC7WYZjooIa1H+sQ51R/EFa0RWrm84B0o7a8nO+0
 yAvA==
X-Gm-Message-State: AOAM532pKFuyZ/lTmRz0RMoPmaf4OdIN++L7/4jmFR1n+yD01Aooksr9
 /R9Ek6jx0OPtcGouSj5QIxzs+ksjaY7cfMWH
X-Google-Smtp-Source: ABdhPJxXrbdqrW1z6MwC4uS8nMU5GID7A+kOl+SdX3xUuT/f8RaohCM6I/tblKq9tDLxdkqqT2fd0A==
X-Received: by 2002:a17:90a:d0c4:: with SMTP id
 y4mr832715pjw.212.1612318568909; 
 Tue, 02 Feb 2021 18:16:08 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] tcg/mips: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:36 -1000
Message-Id: <20210203021550.375058-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


