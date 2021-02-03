Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E430D17F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:27:05 +0100 (CET)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77sm-0003Wx-Hu
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iP-0007mi-6F
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:21 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iJ-00012y-4e
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:19 -0500
Received: by mail-pf1-x435.google.com with SMTP id t29so15648883pfg.11
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DM9QY4K2XvQEhRZFG5Poiy/z5hpGevd5ZJA99qNIm0=;
 b=YmLsc/DdgtdCabUDcOd+PvdiZH41QwagoK4Ho3qxcLfE+zFwHzDzDebOITvC8G/dWC
 VCRuIDHymVGXoqc1ICCmsZs7mQ7IcSD0JAazcaQRtqq4XUgWd5UUWPzXyD46g2nCtJeC
 OfzZBvJQB2H5/hM4cnoPcnpIhWYJP+i/SVKrsj95YIrt4P3WmvXv5wGTVsf74jv0+gbM
 kZ5mK2a7vOAmdBwoKbmQv5YM9h7lT+7syQLkFUVPiSnwwHcGDjY10nmeqJJv/ff/17OJ
 ORKzM9TcE1gVsA1B1bcr26Tq4/zTEeZvLhwoVykFLchu8hB0nbJ04EMoEZWh9pTGxWRk
 TYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DM9QY4K2XvQEhRZFG5Poiy/z5hpGevd5ZJA99qNIm0=;
 b=BP0IJZZIvPjk4e5al8KPKVbDwOSgFItWxjLZ2WBB9whYsWHXKSGhV/A69H6/8tf9/S
 LUhoq3jLLFHbcGw7lViKrqJesRmVONT+ZY7/AcFfo0g1nIE6b7XlnhpOdIwUPUNkjxfd
 rRnyTQD2hvBnE4yCPmS/eQhua/HvRWn7HyFmppZyH7bXe0pStzZYdiqJ+jhFHwsUZ5OA
 8trWtDIR6I5WKFJHdLQkr7//YPs4zOzvcVE5i1dVVtuCy5C3Nj0MCy+70SmECLqA+zoF
 hqKPXHW31tgkV2Nl0KDF29+tjsNz0cBNUrBLgieVw7b5KWglxr8OdsdC/JvLXQD6ZMLo
 yukw==
X-Gm-Message-State: AOAM533ETFyjaLb5lKezj/WxJ6XVdZf0Q/y8JvCV4cvnbyMbEULirAhI
 xgpPgsi8ixL/yNy9ARKH4Rrp+8R8BsU+koZt
X-Google-Smtp-Source: ABdhPJxBmobrqtiIwxKst1xvGkqJm0C0sccuNnqnretmszbeBsmG8oqducC6V6ZJhVtBBAriK+nhuw==
X-Received: by 2002:a63:1865:: with SMTP id 37mr1127303pgy.206.1612318573584; 
 Tue, 02 Feb 2021 18:16:13 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/24] tcg/sparc: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:39 -1000
Message-Id: <20210203021550.375058-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target-con-str.h | 23 ++++++++++
 tcg/sparc/tcg-target.h         |  5 +--
 tcg/sparc/tcg-target.c.inc     | 81 +++++++++++++---------------------
 3 files changed, 55 insertions(+), 54 deletions(-)
 create mode 100644 tcg/sparc/tcg-target-con-str.h

diff --git a/tcg/sparc/tcg-target-con-str.h b/tcg/sparc/tcg-target-con-str.h
new file mode 100644
index 0000000000..fdb25d9313
--- /dev/null
+++ b/tcg/sparc/tcg-target-con-str.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Sparc target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('R', ALL_GENERAL_REGS64)
+REGS('s', ALL_QLDST_REGS)
+REGS('S', ALL_QLDST_REGS64)
+REGS('A', TARGET_LONG_BITS == 64 ? ALL_QLDST_REGS64 : ALL_QLDST_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S11)
+CONST('J', TCG_CT_CONST_S13)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 95ab9af955..5185b00524 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -66,10 +66,6 @@ typedef enum {
     TCG_REG_I7,
 } TCGReg;
 
-#define TCG_CT_CONST_S11  0x100
-#define TCG_CT_CONST_S13  0x200
-#define TCG_CT_CONST_ZERO 0x400
-
 /* used for function call generation */
 #define TCG_REG_CALL_STACK TCG_REG_O6
 
@@ -172,5 +168,6 @@ extern bool use_vis3_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 28b5b6559a..e291eb0b95 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -67,18 +67,38 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 # define SPARC64 0
 #endif
 
-/* Note that sparcv8plus can only hold 64 bit quantities in %g and %o
-   registers.  These are saved manually by the kernel in full 64-bit
-   slots.  The %i and %l registers are saved by the register window
-   mechanism, which only allocates space for 32 bits.  Given that this
-   window spill/fill can happen on any signal, we must consider the
-   high bits of the %i and %l registers garbage at all times.  */
-#if SPARC64
-# define ALL_64  0xffffffffu
+#define TCG_CT_CONST_S11  0x100
+#define TCG_CT_CONST_S13  0x200
+#define TCG_CT_CONST_ZERO 0x400
+
+/*
+ * For softmmu, we need to avoid conflicts with the first 3
+ * argument registers to perform the tlb lookup, and to call
+ * the helper function.
+ */
+#ifdef CONFIG_SOFTMMU
+#define SOFTMMU_RESERVE_REGS MAKE_64BIT_MASK(TCG_REG_O0, 3)
 #else
-# define ALL_64  0xffffu
+#define SOFTMMU_RESERVE_REGS 0
 #endif
 
+/*
+ * Note that sparcv8plus can only hold 64 bit quantities in %g and %o
+ * registers.  These are saved manually by the kernel in full 64-bit
+ * slots.  The %i and %l registers are saved by the register window
+ * mechanism, which only allocates space for 32 bits.  Given that this
+ * window spill/fill can happen on any signal, we must consider the
+ * high bits of the %i and %l registers garbage at all times.
+ */
+#define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
+#if SPARC64
+# define ALL_GENERAL_REGS64  ALL_GENERAL_REGS
+#else
+# define ALL_GENERAL_REGS64  MAKE_64BIT_MASK(0, 16)
+#endif
+#define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+#define ALL_QLDST_REGS64     (ALL_GENERAL_REGS64 & ~SOFTMMU_RESERVE_REGS)
+
 /* Define some temporary registers.  T2 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
 #define TCG_REG_T2  TCG_REG_O7
@@ -320,45 +340,6 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
     return true;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':
-        ct->regs = 0xffffffff;
-        break;
-    case 'R':
-        ct->regs = ALL_64;
-        break;
-    case 'A': /* qemu_ld/st address constraint */
-        ct->regs = TARGET_LONG_BITS == 64 ? ALL_64 : 0xffffffff;
-    reserve_helpers:
-        tcg_regset_reset_reg(ct->regs, TCG_REG_O0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_O1);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_O2);
-        break;
-    case 's': /* qemu_st data 32-bit constraint */
-        ct->regs = 0xffffffff;
-        goto reserve_helpers;
-    case 'S': /* qemu_st data 64-bit constraint */
-        ct->regs = ALL_64;
-        goto reserve_helpers;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_S11;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_S13;
-        break;
-    case 'Z':
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
@@ -1746,8 +1727,8 @@ static void tcg_target_init(TCGContext *s)
     }
 #endif
 
-    tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
-    tcg_target_available_regs[TCG_TYPE_I64] = ALL_64;
+    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
+    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS64;
 
     tcg_target_call_clobber_regs = 0;
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_G1);
-- 
2.25.1


