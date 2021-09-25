Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F1E4183AE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:41:24 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBfv-0008Fb-9k
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWF-0002R8-0W
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:23 -0400
Received: from [115.28.160.31] (port=57186 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWC-0005Ol-Nq
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:22 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B89E260B36;
 Sun, 26 Sep 2021 01:30:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632591052; bh=oNCbEAjINIk+ZUS/PcrmG/zO7KzTTKj/ZjR8N+/9hYs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P7JgdHwXCV/CNOR3kc8jpq4ilhBeH6AgODHJQ/aFP495HME88L/OwfIBWqLsRifHy
 IDX2GR8rE3BHwBtGrrzXFwiJTDzdU94CxjWv4EXVorfTkF0WeErugRWxCApaYGEfs1
 +bw3D9jjmNwjrxcXvnRQr8tkgZwG/VtcU0Fo8khY=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/30] tcg/loongarch64: Define the operand constraints
Date: Sun, 26 Sep 2021 01:30:08 +0800
Message-Id: <20210925173032.2434906-7-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210925173032.2434906-1-git@xen0n.name>
References: <20210925173032.2434906-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 42eebef78e..64e57bd055 100644
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
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_U12) && val >= 0 && val <= 0xfff) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_C12) && ~val >= 0 && ~val <= 0xfff) {
+        return true;
+    }
+    if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
+        return true;
+    }
+    return false;
+}
-- 
2.33.0


