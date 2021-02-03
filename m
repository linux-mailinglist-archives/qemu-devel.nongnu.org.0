Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92330D160
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:21:06 +0100 (CET)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77mz-0004IX-6W
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iL-0007lm-Ap
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:19 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iH-00012W-0K
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:17 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m6so15672152pfk.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/xX/J9vMnowuMWo8/HanLANiLouFut86e12omyKqeRo=;
 b=BcgfTNQHj7CZ1LdkK6VoNTPfVcy8YIe6yzlhZjfbud48x2T1KjWuSkRtnrD/Urrd0d
 7z3VujM4/fuyCZb1ZWJu0Le8d5E4heU2IoIRBZe5rJovteHWheWPAQxcGVz/R/sMsWLf
 dtOB65U3HewKfCJ1xbDJoWDRC12cWcc7ZYJJ8A1HArtZKKV5/tfEfNHi12cGaTTPamCt
 gEwVr8y5rUhebypm11uIRNBxPt+tccgO1QHTM7+f3CO/k5K3rT801cP57TzDqOxtH4qM
 AEK/akddPvCQ3VGM4SRoFj6DLePsJfo45ebhwyel+Ha58AmNKvNhHNgJGhhPbYZwzIhy
 WVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/xX/J9vMnowuMWo8/HanLANiLouFut86e12omyKqeRo=;
 b=IRyx4cWuwFeWwLh5SOB5pqeeHj2vhysInCpC6829YYIrPbPpdxxxSLH+05ssZVJVUC
 Oj4aE0mqs4lAvSDi7BKqLcFOQX5rl/rBMwgcUuggpARX65/1UZKUiEdOeoInwrn9PzI8
 lpIwjcI5ht5mTSUzjuA20BvyeYuBXP0fsSFlPl9nl+RMbFm4qBKz8sgqVnSaafI2T2Cx
 ABP6/gGx/Z1fy9H07NGLhs4zGD0dlFcmj3DVwp/9Nko9DY/E9G80HMh3zgtUP+MRbzpg
 n0ngDV6I0vgDLDvglo5H26YsaTvhhPBCz2N2EBOqfh6Yi3o8MjrxI1//vS21Km6e3aCR
 7TKQ==
X-Gm-Message-State: AOAM531ktCyaQBFThDjPdgiS5dUQOuk4eSb6s7sZ1IjcIU5R7gtZ8E83
 5yakfx0hHX5KogkpjexK2D4/SHTh1Ky9JYmD
X-Google-Smtp-Source: ABdhPJxnt9W1Q3e+qnD2G+Snzw7m+E+9yFZFBjPuUcga18N7xW6gGw9mtGAirsc0MtvL1ZKyEeKG9Q==
X-Received: by 2002:a63:c43:: with SMTP id 3mr1125265pgm.250.1612318571775;
 Tue, 02 Feb 2021 18:16:11 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] tcg/s390: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:38 -1000
Message-Id: <20210203021550.375058-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target-con-str.h | 28 ++++++++++++++++++
 tcg/s390/tcg-target.h         |  1 +
 tcg/s390/tcg-target.c.inc     | 53 +++++++++--------------------------
 3 files changed, 42 insertions(+), 40 deletions(-)
 create mode 100644 tcg/s390/tcg-target-con-str.h

diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390/tcg-target-con-str.h
new file mode 100644
index 0000000000..892d8f8c06
--- /dev/null
+++ b/tcg/s390/tcg-target-con-str.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define S390 target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+/*
+ * A (single) even/odd pair for division.
+ * TODO: Add something to the register allocator to allow
+ * this kind of regno+1 pairing to be done more generally.
+ */
+REGS('a', 1u << TCG_REG_R2)
+REGS('b', 1u << TCG_REG_R3)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('A', TCG_CT_CONST_S33)
+CONST('I', TCG_CT_CONST_S16)
+CONST('J', TCG_CT_CONST_S32)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index 641464eea4..c43d6aba84 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -159,5 +159,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 8517e55232..3fec7fec5f 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -42,6 +42,19 @@
 #define TCG_CT_CONST_S33   0x400
 #define TCG_CT_CONST_ZERO  0x800
 
+#define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 16)
+/*
+ * For softmmu, we need to avoid conflicts with the first 3
+ * argument registers to perform the tlb lookup, and to call
+ * the helper function.
+ */
+#ifdef CONFIG_SOFTMMU
+#define SOFTMMU_RESERVE_REGS MAKE_64BIT_MASK(TCG_REG_R2, 3)
+#else
+#define SOFTMMU_RESERVE_REGS 0
+#endif
+
+
 /* Several places within the instruction set 0 means "no register"
    rather than TCG_REG_R0.  */
 #define TCG_REG_NONE    0
@@ -403,46 +416,6 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
     return false;
 }
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r':                  /* all registers */
-        ct->regs = 0xffff;
-        break;
-    case 'L':                  /* qemu_ld/st constraint */
-        ct->regs = 0xffff;
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R2);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R4);
-        break;
-    case 'a':                  /* force R2 for division */
-        ct->regs = 0;
-        tcg_regset_set_reg(ct->regs, TCG_REG_R2);
-        break;
-    case 'b':                  /* force R3 for division */
-        ct->regs = 0;
-        tcg_regset_set_reg(ct->regs, TCG_REG_R3);
-        break;
-    case 'A':
-        ct->ct |= TCG_CT_CONST_S33;
-        break;
-    case 'I':
-        ct->ct |= TCG_CT_CONST_S16;
-        break;
-    case 'J':
-        ct->ct |= TCG_CT_CONST_S32;
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
 /* Test if a constant matches the constraint. */
 static int tcg_target_const_match(tcg_target_long val, TCGType type,
                                   const TCGArgConstraint *arg_ct)
-- 
2.25.1


