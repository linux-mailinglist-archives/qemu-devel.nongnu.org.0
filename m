Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7F413B56
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:28:09 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmN6-0001Sy-7L
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEu-00041g-I4
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:41 -0400
Received: from [115.28.160.31] (port=55990 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEr-0000Qi-Jm
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:39 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7C2B8633F7;
 Wed, 22 Sep 2021 04:19:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255566; bh=l9LSxSxnOf1JOSGIGDUrx72FxS3YE2HXZfooNq+1FaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oJPqAMNnMjsH51Ry91NiOO9woMptnIkyczm/3lIkElcuLApK9ZY22ZpT6WuK+MuvU
 d4Vai9ceroW5WP3r5VAo9/AfDIIoCMGm3itGYBVi6t/N0GuvS+vwy/Ku21Ew/Tnh99
 MwWBwftJO5kvegugqtj+SZ4+Hc2zmmHEuj2ozNMc=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/30] tcg/loongarch64: Define the operand constraints
Date: Wed, 22 Sep 2021 04:18:51 +0800
Message-Id: <20210921201915.601245-7-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921201915.601245-1-git@xen0n.name>
References: <20210921201915.601245-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch64/tcg-target-con-str.h | 28 +++++++++++++++
 tcg/loongarch64/tcg-target.c.inc     | 52 ++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 tcg/loongarch64/tcg-target-con-str.h

diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
new file mode 100644
index 0000000000..c3986a4fd4
--- /dev/null
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define LoongArch target-specific operand constraints.
+ *
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * Based on tcg/riscv/tcg-target-con-str.h
+ *
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', ALL_GENERAL_REGS)
+REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+
+/*
+ * Define constraint letters for constants:
+ * CONST(letter, TCG_CT_CONST_* bit set)
+ */
+CONST('I', TCG_CT_CONST_S12)
+CONST('N', TCG_CT_CONST_N12)
+CONST('U', TCG_CT_CONST_U12)
+CONST('Z', TCG_CT_CONST_ZERO)
+CONST('C', TCG_CT_CONST_C12)
+CONST('W', TCG_CT_CONST_WSZ)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 42eebef78e..f0930f77ef 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -116,3 +116,55 @@ static const int tcg_target_call_oarg_regs[] = {
     TCG_REG_A0,
     TCG_REG_A1,
 };
+
+#define TCG_CT_CONST_ZERO  0x100
+#define TCG_CT_CONST_S12   0x200
+#define TCG_CT_CONST_N12   0x400
+#define TCG_CT_CONST_U12   0x800
+#define TCG_CT_CONST_C12   0x1000
+#define TCG_CT_CONST_WSZ   0x2000
+
+#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
+/*
+ * For softmmu, we need to avoid conflicts with the first 5
+ * argument registers to call the helper.  Some of these are
+ * also used for the tlb lookup.
+ */
+#ifdef CONFIG_SOFTMMU
+#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
+#else
+#define SOFTMMU_RESERVE_REGS  0
+#endif
+
+
+static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
+{
+    return sextract64(val, pos, len);
+}
+
+/* test if a constant matches the constraint */
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
+{
+    if (ct & TCG_CT_CONST) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_U12) && val >= 0 && val <= 0xfff) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_C12) && ~val >= 0 && ~val <= 0xfff) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
+        return 1;
+    }
+    return 0;
+}
-- 
2.33.0


