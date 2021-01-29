Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3EE308E3A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:18:14 +0100 (CET)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aDd-0004Z4-D8
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6R-0006Bg-Th
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:47 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6O-00082G-KE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:47 -0500
Received: by mail-pg1-x536.google.com with SMTP id o7so7425426pgl.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h5y6ZYWFF1duKN4B3w6W+tnJz7us/4nIL76bMWBTaac=;
 b=Rj3k2+smKRyJkLZpS8OYi9Q8pDP2HHedJ5eI1Hb7D25JSS0iAeePuP595R30mVsM92
 y9ffg0GsQIxWcIDVHtfpa9dPO69fxqqpcVd5lVAvbDU1c6vSLO311EW0W76SvViXT0zI
 aulCvxMHXjzTEHc5N8K73pYuRhLPwik12HrqQGkT9pxi6Se50jSvL6tzr1l7PM4/rRtd
 vpzzGOfYhc/q62RPWa2fg2Io7zw5c+nzzXSybYh/8G/JGqk4xQyGyAeQHXSs9MVu3lmB
 9WWugZqCA6v1Fhvgbogm4rw83yzOwhzW4xKLmmj2NvDT/1RjzRwgDHntn0KKPN0JL349
 cCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h5y6ZYWFF1duKN4B3w6W+tnJz7us/4nIL76bMWBTaac=;
 b=V6a3CWtYI/QU7nkdLX4fuC8gEMGES9ag4t5FXXiXBYvefCJEfyo4M0BlgzkDlSdHpD
 4973npoJJ+IWKx5qS66TBoLwvgycKOvoo/8BWrVPSiNtn2bHO+5bn2GvKCO5CdWATw3O
 kPNaTTc3uauBJUPjA6SCP8EZFoXiRUYbHXHPtKJl7yWaDhC/yqxG6hYgF4wkHYy4vOsA
 yJ51Z17pa16fNhk7I5ivInqlloqR6/bhL5DapdzDxMUQQQUFi5DHPw3IUGVHpAMKZjaM
 DBLLVhxkT8y3XhxUN8ISAIt8bPXPiJYoi0PD7omSWniDtOjlJnr+2whvpu5CM3KYJCRm
 du+g==
X-Gm-Message-State: AOAM5319p7j2L0T86v1yAt4u6TfD+EOVROGR2Y34ej1wpsWspmuvQpUC
 Oa4J3KiCRAaPjysxFuhQ28qBrN8NmFdNa+Mk
X-Google-Smtp-Source: ABdhPJwzztcw7UqRLXeYg7nJWxWVqXCQ0oXaYx1TLBZIxqYH5vNshGVN2ylOHoFlIPcFhweprG9mQQ==
X-Received: by 2002:a63:c64a:: with SMTP id x10mr6295761pgg.14.1611951043191; 
 Fri, 29 Jan 2021 12:10:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/24] tcg/aarch64: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 29 Jan 2021 10:10:11 -1000
Message-Id: <20210129201028.787853-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-con-str.h | 24 +++++++++++++++
 tcg/aarch64/tcg-target.h         |  1 +
 tcg/aarch64/tcg-target.c.inc     | 51 +++++---------------------------
 3 files changed, 33 insertions(+), 43 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-con-str.h

diff --git a/tcg/aarch64/tcg-target-con-str.h b/tcg/aarch64/tcg-target-con-str.h
new file mode 100644
index 0000000000..00adb64594
--- /dev/null
+++ b/tcg/aarch64/tcg-target-con-str.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Define AArch64 target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('l', ALL_QLDST_REGS)
+REGS('w', ALL_VECTOR_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('A', TCG_CT_CONST_AIMM)
+CONST('L', TCG_CT_CONST_LIMM)
+CONST('M', TCG_CT_CONST_MONE)
+CONST('O', TCG_CT_CONST_ORRI)
+CONST('N', TCG_CT_CONST_ANDI)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 5ec30dba25..4fc20b58ec 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -155,5 +155,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 23954ec7cf..42037c98fa 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -126,51 +126,16 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_ORRI 0x1000
 #define TCG_CT_CONST_ANDI 0x2000
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'r': /* general registers */
-        ct->regs |= 0xffffffffu;
-        break;
-    case 'w': /* advsimd registers */
-        ct->regs |= 0xffffffff00000000ull;
-        break;
-    case 'l': /* qemu_ld / qemu_st address, data_reg */
-        ct->regs = 0xffffffffu;
+#define ALL_GENERAL_REGS  0xffffffffu
+#define ALL_VECTOR_REGS   0xffffffff00000000ull
+
 #ifdef CONFIG_SOFTMMU
-        /* x0 and x1 will be overwritten when reading the tlb entry,
-           and x2, and x3 for helper args, better to avoid using them. */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X1);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X2);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X3);
+#define ALL_QLDST_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_X0) | (1 << TCG_REG_X1) | \
+                          (1 << TCG_REG_X2) | (1 << TCG_REG_X3)))
+#else
+#define ALL_QLDST_REGS   ALL_GENERAL_REGS
 #endif
-        break;
-    case 'A': /* Valid for arithmetic immediate (positive or negative).  */
-        ct->ct |= TCG_CT_CONST_AIMM;
-        break;
-    case 'L': /* Valid for logical immediate.  */
-        ct->ct |= TCG_CT_CONST_LIMM;
-        break;
-    case 'M': /* minus one */
-        ct->ct |= TCG_CT_CONST_MONE;
-        break;
-    case 'O': /* vector orr/bic immediate */
-        ct->ct |= TCG_CT_CONST_ORRI;
-        break;
-    case 'N': /* vector orr/bic immediate, inverted */
-        ct->ct |= TCG_CT_CONST_ANDI;
-        break;
-    case 'Z': /* zero */
-        ct->ct |= TCG_CT_CONST_ZERO;
-        break;
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
 
 /* Match a constant valid for addition (12-bit, optionally shifted).  */
 static inline bool is_aimm(uint64_t val)
-- 
2.25.1


