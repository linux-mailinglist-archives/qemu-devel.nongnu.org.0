Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF12F8743
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:10:54 +0100 (CET)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WMv-0000fl-CK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHR-0003lU-Np
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:13 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0WHM-0004C4-0o
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:05:13 -0500
Received: by mail-pj1-x1035.google.com with SMTP id v1so5766158pjr.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pAHLjFZUO/dEh+qT8pdCisIpyfqvQTHawora/enUeo8=;
 b=VfNIGT46Owgftbk9KGhl47s3vRdUQc9eJBjamIrp5gGgUmoJlkwuA6O3XwJinbfRMb
 ba+jXsvj8Hw1Nvwzh5zHZP40g/ofEI+LFUMkIzuSLgZ9Q2XbmwVugJ1WSICMVCRb4nuh
 +OBdP15qM6bpCnrJZTRd5ICc0XF5YaOExAuEV5cijKHG2dgYkeL+sLi3FBP+zyIH5+Tk
 nUTVsIMzcfCeYUYd+oeXvS9a7HRuuKRSq4x9KEiJf/SCh72rkK5+ZRzUHhuLBQOogJTw
 JRxb15bMZA14xkdro7ewuFswx60TY++KSwzIXhG6AKo5YcGeV7p6BoqJP6oqZFb8DIJm
 HpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAHLjFZUO/dEh+qT8pdCisIpyfqvQTHawora/enUeo8=;
 b=B8oQt2hSTVT4tpe0t4OGHS41mj3C0/SdUaErngRjg8e/TEWf8cRSIqHGqNb8+J59Sr
 3Sj17TGr3wnDUpMToFGXqaWU5NNxKxITjeYM+10rTfRKnsfwvSTj07I4v+OlYmWMZQGp
 dVzeLrRPkVI65jwHRXCJ50o0wHJ4x95rL2ta+D8QgW9eT4QOO2wVrps4teAZ8OIl+t58
 l5hxMaOu2XJi3MJOb3YsrEiDIsqxLC4kINQV3gJMxp/tweo2ppSJHRfUojO+AwpG2ZF0
 n1HXAefCoIcGy7w4gEpiy3LG+4vYfp7gqgX6dhbxG8xVL890XLYzdteCXTnXqfB3ZLD9
 V1Rw==
X-Gm-Message-State: AOAM530JjH0TZ2zeWwSPwvDsJzTcjRM7NGnR4cvXR3QtffGPiS+FetWL
 ht2IGpQiJgUNj0NkDlTeUk4xbTTYKJuGBXeW
X-Google-Smtp-Source: ABdhPJyFZQ+kodVBoa+exGwKVvsHmb6X+3bh2ksa8C7ZWCQ3kIJ/yCd8iRTXy8Y4eIOW0kVCIglrug==
X-Received: by 2002:a17:90a:5581:: with SMTP id
 c1mr12641243pji.86.1610744705512; 
 Fri, 15 Jan 2021 13:05:05 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id h15sm8920221pfo.71.2021.01.15.13.05.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 13:05:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/22] tcg/arm: Split out target constraints to
 tcg-target-con-str.h
Date: Fri, 15 Jan 2021 11:04:38 -1000
Message-Id: <20210115210456.1053477-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115210456.1053477-1-richard.henderson@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-str.h | 22 ++++++++++++
 tcg/arm/tcg-target.h         |  1 +
 tcg/arm/tcg-target.c.inc     | 69 +++++++-----------------------------
 3 files changed, 36 insertions(+), 56 deletions(-)
 create mode 100644 tcg/arm/tcg-target-con-str.h

diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
new file mode 100644
index 0000000000..2451ec6c7f
--- /dev/null
+++ b/tcg/arm/tcg-target-con-str.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Arm target-specific operand constraint.
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
index c2b26b3c45..e1a247b27f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -237,65 +237,22 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
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


