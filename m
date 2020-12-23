Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC22E18BC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:05:23 +0100 (CET)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxH0-0001ip-U2
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE3-0008Pm-E6
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:21 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDx-0000Lg-RN
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:19 -0500
Received: by mail-pg1-x52c.google.com with SMTP id e2so9935531pgi.5
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NrM0nd/vAh/xuPN3ZjF7gS1lRQ4hob266SPoNoDOWZg=;
 b=e1QjAbrDjap8Bhe5I/9ZYUCAgbFvY4cHi6/QGrJca3jf884Qyx621atDZlskr6bnAE
 M51PajNTADzngm11Kc3hkwpDAAT2yTs8sOWWZPjQTX2c8qLGxKjpFK4i3+PFsGxQ7m0v
 vkGx9AgMQCEUuAmN1LFWZnzqwadt28EJONNxk6YrtN5joCy9uAq6oXO+Fl8nLZ4GWj9z
 0rzbzvJ7saazeUJMgMw/PEJ1AWoDR3r2PkmWaa2YhmXR2csBw+O9qs33JJyRgMDgHSSH
 dXG1Bmkhs4m4NOWjCYFG3Q9wlCT03Z4Y/I3kUw1VPuh9C4RQxdXIpkFZeVx7qEESLbnQ
 UPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NrM0nd/vAh/xuPN3ZjF7gS1lRQ4hob266SPoNoDOWZg=;
 b=un+Fr87aEm6LR6l0pG+mbTm7ISsZ1b9aHkkx8QYCdw9lwfOObie71+Pi0JCtgIKbev
 L9obhiTCUF4dfni1EWl9zK34XjtnbVL7H0DsOWSptJKVgQEuPZdVtz3EbEgZePuGKuNL
 AAUUdKnPCBK8xWeHDGt5ppD7khA0z/lcL/2V/F7H2XWFQllPmZrN2qWGhgWtrC4Hu2W0
 BLv/fA7qKhLsTb9AtcewMvUunu7jtT9iUpiAiVD5OMJY6ZAeWopqiUpZuK572YvUvQl5
 dBH3e5wKgmPinKAAYMQG9RFfC/gzu0eGxGjNW65MmsTbgIK9uqiBR5bK2woaHV6ijtzS
 dKkQ==
X-Gm-Message-State: AOAM530wgz8fY8OvTw+LvlYtSPeNP+Hjn/kG2K/BlMJGc4fT1/vXjU6l
 GRCoYQfueza8wVnp3vo6wykyjOCAA3Lwrw==
X-Google-Smtp-Source: ABdhPJztYZdPons8yK21ln+cYyXaR2nLQ39QApPopFobtIzGBLGcNA1v2r9VwByIx2vFjt7N9BPw+A==
X-Received: by 2002:a63:db57:: with SMTP id x23mr22929793pgi.131.1608703330793; 
 Tue, 22 Dec 2020 22:02:10 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/22] tcg/arm: Convert to tcg-target-constr.h
Date: Tue, 22 Dec 2020 22:01:46 -0800
Message-Id: <20201223060204.576856-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
 tcg/arm/tcg-target-constr.h | 31 +++++++++++++++++++
 tcg/arm/tcg-target.h        |  1 +
 tcg/arm/tcg-target.c.inc    | 60 -------------------------------------
 3 files changed, 32 insertions(+), 60 deletions(-)
 create mode 100644 tcg/arm/tcg-target-constr.h

diff --git a/tcg/arm/tcg-target-constr.h b/tcg/arm/tcg-target-constr.h
new file mode 100644
index 0000000000..15c5e53406
--- /dev/null
+++ b/tcg/arm/tcg-target-constr.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Arm target-specific operand constaints.
+ * Copyright (c) 2020 Linaro
+ */
+
+#define ALL_GENERAL_REGS  0xffffu
+
+#ifdef CONFIG_SOFTMMU
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
+#endif
+
+REGS('r', ALL_GENERAL_REGS)
+REGS('l', ALL_QLOAD_REGS)
+REGS('s', ALL_QSTORE_REGS)
+
+CONST('I', TCG_CT_CONST_ARM)
+CONST('K', TCG_CT_CONST_INV)
+CONST('N', TCG_CT_CONST_NEG)
+CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 17e771374d..6f058d6d9b 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -146,5 +146,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CONSTR_H
 
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 62c37a954b..ab1b295293 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -234,66 +234,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
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
-
-    case 'r':
-        ct->regs = 0xffff;
-        break;
-
-    /* qemu_ld address */
-    case 'l':
-        ct->regs = 0xffff;
-#ifdef CONFIG_SOFTMMU
-        /* r0-r2,lr will be overwritten when reading the tlb entry,
-           so don't use these. */
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R0);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R1);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R2);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R3);
-        tcg_regset_reset_reg(ct->regs, TCG_REG_R14);
-#endif
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
-
 static inline uint32_t rotl(uint32_t val, int n)
 {
   return (val << n) | (val >> (32 - n));
-- 
2.25.1


