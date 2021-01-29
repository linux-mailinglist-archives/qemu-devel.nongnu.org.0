Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B8308E23
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:16:15 +0100 (CET)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aBi-00034u-Cu
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6P-00063X-8Y
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:45 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6N-00081e-3x
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:44 -0500
Received: by mail-pj1-x102c.google.com with SMTP id kx7so6371517pjb.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEiNCKP9SRGBYuPOUkrJxj3TyPoHI75PCJnqDanFink=;
 b=KJME9SDFSYy/6nmMPcpQjIbmWLgQDFMNX61Mt0OP8ZwIWacgZfuhgzaoo0U3aB5sZH
 Nde3GALh0tUitxtFOheig4CYaWsi7T8apMNf54/19/Ph9e/UDzNiG7rX6JyziCpvWu0I
 E382h14Cw+NjFsGeQgQ6GKsnRRSQJHJB/E2ebJ4DVOdjk18zv016VdJiH9tWKXqk6qzl
 +2m2zQCUiWBmFynCyr1995ASSujd5hDoMsc8gMUUnbuTGViJgsAMDMGS9OAFDyJX1BVi
 Y16A8dt14XLnJRZd33Qqj7+uhidfvqqmYLKAbZnCRA+AkhRUv9ch8bSw0sn8NlSXin6E
 91FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEiNCKP9SRGBYuPOUkrJxj3TyPoHI75PCJnqDanFink=;
 b=ILNlC1i/jn2yh5UoQyK4TzLpyPvKtrHV+fQHBus78Gs/kW4PhSFs6bhsdSuCzkqt4h
 Y5FNXRq6DKr9VXAWU+uAnm9x4uL4hR9zRvLg0tTQKsdaxJlLCtXd5w+ieY1fgwPoYd6T
 YTNMdklH8dJa2ml5e+iNqEktLytlSXeRzD91If+4/SgmkUYDe0YJosKygPmf/Dr4PiYt
 b3xS/os/4jvIbJqqdSR9/nCVPO1CTcEm0rM5pk1nAphV+f4zJ0wdUb10zmZCobSjk9jM
 HRoExo6coRUhLsr8ltj3O13fKBNeDeFuD2Oml76L52SHWJOjeWv45eKUMRzLpX0IVTbP
 Md9g==
X-Gm-Message-State: AOAM531wlYEhScdKaCA8Ey3NbwH56FLZUsmEX/J4fTucJtOT+71YGXkF
 zCgZcsaLq44zEjG+pZGDzl062jZyh82Kt8Qn
X-Google-Smtp-Source: ABdhPJw8BMcr5JXJfkJKJHTFU1KhmNl3pJokZtAdbBIDCqlqlET6+D3/5LTQMyRIaGw8f67KSGv15A==
X-Received: by 2002:a17:90b:1046:: with SMTP id
 gq6mr5797497pjb.203.1611951041833; 
 Fri, 29 Jan 2021 12:10:41 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/24] tcg/arm: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 29 Jan 2021 10:10:10 -1000
Message-Id: <20210129201028.787853-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-str.h | 22 +++++++++++
 tcg/arm/tcg-target.h         |  1 +
 tcg/arm/tcg-target.c.inc     | 74 +++++++++---------------------------
 3 files changed, 41 insertions(+), 56 deletions(-)
 create mode 100644 tcg/arm/tcg-target-con-str.h

diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
new file mode 100644
index 0000000000..a0ab7747db
--- /dev/null
+++ b/tcg/arm/tcg-target-con-str.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Arm target-specific operand constraints.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('l', ALL_QLOAD_REGS)
+REGS('s', ALL_QSTORE_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_ARM)
+CONST('K', TCG_CT_CONST_INV)
+CONST('N', TCG_CT_CONST_NEG)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 8d1fee6327..16336cd545 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -142,5 +142,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_STR_H
 
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c2b26b3c45..bbd41d2491 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -237,65 +237,27 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_NEG  0x400
 #define TCG_CT_CONST_ZERO 0x800
 
-/* parse target specific constraints */
-static const char *target_parse_constraint(TCGArgConstraint *ct,
-                                           const char *ct_str, TCGType type)
-{
-    switch (*ct_str++) {
-    case 'I':
-        ct->ct |= TCG_CT_CONST_ARM;
-        break;
-    case 'K':
-        ct->ct |= TCG_CT_CONST_INV;
-        break;
-    case 'N': /* The gcc constraint letter is L, already used here.  */
-        ct->ct |= TCG_CT_CONST_NEG;
-        break;
-    case 'Z':
-        ct->ct |= TCG_CT_CONST_ZERO;
-        break;
+#define ALL_GENERAL_REGS  0xffffu
 
-    case 'r':
-        ct->regs = 0xffff;
-        break;
-
-    /* qemu_ld address */
-    case 'l':
-        ct->regs = 0xffff;
+/*
+ * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
+ * and r0-r1 doing the byte swapping, so don't use these.
+ * r3 is removed for softmmu to avoid clashes with helper arguments.
+ */
 #ifdef CONFIG_SOFTMMU
-        /* r0-r2,lr will be overwritten when reading the tlb entry,
-           so don't use these. */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R1);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R2);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R14);
+#define ALL_QLOAD_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
+                          (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
+                          (1 << TCG_REG_R14)))
+#define ALL_QSTORE_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
+                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
+                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
+#else
+#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
+#define ALL_QSTORE_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
 #endif
-        break;
-
-    /* qemu_st address & data */
-    case 's':
-        ct->regs = 0xffff;
-        /* r0-r2 will be overwritten when reading the tlb entry (softmmu only)
-           and r0-r1 doing the byte swapping, so don't use these. */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R1);
-#if defined(CONFIG_SOFTMMU)
-        /* Avoid clashes with registers being used for helper args */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R2);
-#if TARGET_LONG_BITS == 64
-        /* Avoid clashes with registers being used for helper args */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
-#endif
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R14);
-#endif
-        break;
-
-    default:
-        return NULL;
-    }
-    return ct_str;
-}
 
 static inline uint32_t rotl(uint32_t val, int n)
 {
-- 
2.25.1


