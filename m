Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28730D152
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:19:13 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77lA-00016B-JE
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77iA-0007g0-9m
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:06 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i8-0000zl-Ip
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:16:06 -0500
Received: by mail-pg1-x52d.google.com with SMTP id i7so16212026pgc.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEiNCKP9SRGBYuPOUkrJxj3TyPoHI75PCJnqDanFink=;
 b=FLbWhcIF9l3AQwr1bs79Dvw68PxeixS3My3TkixBYduFi2KI9M1J48lhSz2QSe2D1e
 n7wCgvIhQ9hk2Asz6zqn0HZMBuKfViWDSp50rqkbSklMeyWUJdcEYx7wX5YbN/R0R7zp
 o+EpwPvqmLB5ce82MkAGgwWP605T4QZx9R6pd9iHxPwh2p3R8DDmSTHNgouqcFjSAiyl
 5MVA9DD17N3N5Bk2UwTj11eURRjtdOtkqq6QFOmBcX+w0vTM4Q2GVSavDlKaJsIv92bK
 dwfbfJ/AizPmBBG6tYlpMcxGwOBzLRwjhkurFanzQzDYC8q2yov8UYvdyZcnED7X/G2U
 GCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEiNCKP9SRGBYuPOUkrJxj3TyPoHI75PCJnqDanFink=;
 b=c5xPLZJ/XBWujSI109CFWtVIebWpi2T8xqJfDufawD1et/bxAOB5sOoCLlB5wXSIo2
 0Z/0NK+oxQQAmRwvfdBXzr6MBxaxbsv7OhfTJVhQpuJ00wI/3YuA4wz2N6DzHSiILHbl
 WIhJ7czsXG47oxJkcFUZ4sbftNQhL5T1UoyeymQDO+NnqkAHOOa7iSFLbPnACQEZjdtY
 It2q1FadxpKJrgeYV8HkDhnTQsQp3EZQNrgWz4XxedZVsg5wdkkawe50Z/MW2bqN6zwd
 1E3rax52kncYpCSL4EPaIvzAqzTYOTvrcXIQDMg/7DdB4JRwpG3NHc+6JDhAerEHNrxa
 6MlQ==
X-Gm-Message-State: AOAM53399UajyaYuIZU8sBVYf7cTmNJLU171qMHJL5KsjiFbJoVfcEdi
 o+uu/DKe6geQLcmd+qhVS3B+eK/FaYX1t4tf
X-Google-Smtp-Source: ABdhPJzLi5WN+Glwvri8VF+QBzc31gjdBRkFsABQCtOMmxLxgG5FLlFoSBhEWM2J/1j2+qK3sF9VDg==
X-Received: by 2002:a62:7708:0:b029:1bc:b204:7913 with SMTP id
 s8-20020a6277080000b02901bcb2047913mr917069pfc.31.1612318562965; 
 Tue, 02 Feb 2021 18:16:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:16:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/24] tcg/arm: Split out target constraints to
 tcg-target-con-str.h
Date: Tue,  2 Feb 2021 16:15:32 -1000
Message-Id: <20210203021550.375058-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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


