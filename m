Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEB12E18C1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:08:44 +0100 (CET)
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxKF-0005Ea-Lt
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE3-0008PT-2K
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:19 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDy-0000Lm-6a
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:18 -0500
Received: by mail-pg1-x535.google.com with SMTP id n7so9945172pgg.2
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VcKfT6vwgUeZ7feGstLlA+QUgIS4eK/5KKU+ui6/cwM=;
 b=ujFg8D9zvtNG7kUdwVq9oAg1YD+3UrAP6h105lEW/KukJAKVk9QpsbpeXPe5a9hNJ4
 x7U/hXz9UhDDzjJEFkj7sRUNBBuZ0sQKFEQdlu6gPHFrAEDkwlZKU+tZ17uetE2rjn1U
 cfdb5obpWuAiFOXI9JfWxLeWRr38RsVhLXJqC+388HUsWQZO1J4KP4INoYQj1seQhlfl
 Z4JHhYQWwy19Ilj3dSop3uUbdxWObBT3uWQ9zUzhZ75DvGjkDFewZC+eg6O5ILzb+FQY
 P4ZhuVGWLh3Ab1+MzIpuLGhJzZh1RuThMQ7rif/atKwB17Ku84YLX0LExkjqNw5D1j5e
 MxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VcKfT6vwgUeZ7feGstLlA+QUgIS4eK/5KKU+ui6/cwM=;
 b=g+r3m06iuB5toXlSyntNMU0/QPRlsTIpShfGqTCVcKXL4rqDewYDj18+cZtlJ0Dh1v
 gma3MVhnuW87i59S+RusyrPghJXrEGoHJdrb7Pb+RvCyRHOetGC/y5L9+c0b6zOX/gL0
 +gwFnSsCvqaFZSumPP9klNW6UgUK+XmfPSInue1yjobnlJAuUq2w8hkhq4TkpSSof4Sl
 QLizs+qjlNspkWpTVtf7fe0SRv7tOfOKjdOhiT09GuB1BYPlUYL/w2dJl8sH7HSPCLaD
 sYZvdkhTi4cxTT+/HTGcUSqz6G1U3P94l4hORNV1hx0dEGdw7fbEYlx1uD7/9FXeZYnI
 cefA==
X-Gm-Message-State: AOAM531x2KBlSQBOH8KJRT8ba5ZIr7vKd/zQajL1qenVHCqnMFgLrQfd
 BYFdJvuDIsQodvr5+95yNYhnBj//blQDlw==
X-Google-Smtp-Source: ABdhPJx3wVOmuhKV9E5a2hGoUbRE8YSORIiSLBJC+p/rgZ8dE+cYgpU4yCwMTyJR0Q8n5Makgq4Xmw==
X-Received: by 2002:a63:551f:: with SMTP id j31mr4098850pgb.432.1608703332061; 
 Tue, 22 Dec 2020 22:02:12 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/22] tcg/aarch64: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:47 -0800
Message-Id: <20201223060204.576856-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
 tcg/aarch64/tcg-target-constr.h | 27 +++++++++++++++++++
 tcg/aarch64/tcg-target.h        |  1 +
 tcg/aarch64/tcg-target.c.inc    | 46 ---------------------------------
 3 files changed, 28 insertions(+), 46 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-constr.h

diff --git a/tcg/aarch64/tcg-target-constr.h b/tcg/aarch64/tcg-target-constr.h
new file mode 100644
index 0000000000..28f7aa6f03
--- /dev/null
+++ b/tcg/aarch64/tcg-target-constr.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AArch64 target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+#define ALL_GENERAL_REGS  0xffffffffu
+#define ALL_VECTOR_REGS   0xffffffff00000000ull
+
+#ifdef CONFIG_SOFTMMU
+#define ALL_QLDST_REGS \
+    (ALL_GENERAL_REGS & ~((1 << TCG_REG_X0) | (1 << TCG_REG_X1) | \
+                          (1 << TCG_REG_X2) | (1 << TCG_REG_X3)))
+#else
+#define ALL_QLDST_REGS   ALL_GENERAL_REGS
+#endif
+
+REGS('r', ALL_GENERAL_REGS)
+REGS('l', ALL_QLDST_REGS)
+REGS('w', ALL_VECTOR_REGS)
+
+CONST('A', TCG_CT_CONST_AIMM)
+CONST('L', TCG_CT_CONST_LIMM)
+CONST('M', TCG_CT_CONST_MONE)
+CONST('O', TCG_CT_CONST_ORRI)
+CONST('N', TCG_CT_CONST_ANDI)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 663dd0b95e..ca7af5a589 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -159,5 +159,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSTR_H
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 26f71cb599..310bc972e3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -122,52 +122,6 @@ static inline bool patch_reloc(tcg_insn_unit *code_ptr, int type,
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
-#ifdef CONFIG_SOFTMMU
-        /* x0 and x1 will be overwritten when reading the tlb entry,
-           and x2, and x3 for helper args, better to avoid using them. */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X1);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X2);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_X3);
-#endif
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
-
 /* Match a constant valid for addition (12-bit, optionally shifted).  */
 static inline bool is_aimm(uint64_t val)
 {
-- 
2.25.1


