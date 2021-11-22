Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ECB458CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 11:48:21 +0100 (CET)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp6s0-0000tK-AU
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 05:48:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6mk-0000q0-Gr
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:42:54 -0500
Received: from mail.xen0n.name ([115.28.160.31]:40604
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6mi-0007eY-8k
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:42:54 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 91F6F60AF0;
 Mon, 22 Nov 2021 18:42:49 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637577769; bh=I63Tp4jFD5Y73PnLmyF/dAA4YNkD8bPHogfbN/vwqt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bNhpkI5I4l4SsTo4kedgzUg6VHEOGDbbXescm2JL2daHpH7vtlENcrBH/UhkrcvSM
 5AmCcrYG7OHRKbZhw2yaNE2CUKkHSc0g3WRiz9JZOwQ02wQjcCYtsjVgczIGP7JP/S
 7WAPEjQ/p7v9r9b0AIKxRyGKY04pAWi7F4nKPEew=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/31] tcg/loongarch64: Implement necessary relocation
 operations
Date: Mon, 22 Nov 2021 18:41:37 +0800
Message-Id: <20211122104201.112695-8-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122104201.112695-1-git@xen0n.name>
References: <20211122104201.112695-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 64e57bd055..fbacaef862 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -168,3 +168,69 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     }
     return false;
 }
+
+/*
+ * Relocations
+ */
+
+/*
+ * Relocation records defined in LoongArch ELF psABI v1.00 is way too
+ * complicated; a whopping stack machine is needed to stuff the fields, at
+ * the very least one SOP_PUSH and one SOP_POP (of the correct format) are
+ * needed.
+ *
+ * Hence, define our own simpler relocation types. Numbers are chosen as to
+ * not collide with potential future additions to the true ELF relocation
+ * type enum.
+ */
+
+/* Field Sk16, shifted right by 2; suitable for conditional jumps */
+#define R_LOONGARCH_BR_SK16     256
+/* Field Sd10k16, shifted right by 2; suitable for B and BL */
+#define R_LOONGARCH_BR_SD10K16  257
+
+static bool reloc_br_sk16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
+
+    tcg_debug_assert((offset & 3) == 0);
+    offset >>= 2;
+    if (offset == sextreg(offset, 0, 16)) {
+        *src_rw = deposit64(*src_rw, 10, 16, offset);
+        return true;
+    }
+
+    return false;
+}
+
+static bool reloc_br_sd10k16(tcg_insn_unit *src_rw,
+                             const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
+
+    tcg_debug_assert((offset & 3) == 0);
+    offset >>= 2;
+    if (offset == sextreg(offset, 0, 26)) {
+        *src_rw = deposit64(*src_rw, 0, 10, offset >> 16); /* slot d10 */
+        *src_rw = deposit64(*src_rw, 10, 16, offset); /* slot k16 */
+        return true;
+    }
+
+    return false;
+}
+
+static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
+                        intptr_t value, intptr_t addend)
+{
+    tcg_debug_assert(addend == 0);
+    switch (type) {
+    case R_LOONGARCH_BR_SK16:
+        return reloc_br_sk16(code_ptr, (tcg_insn_unit *)value);
+    case R_LOONGARCH_BR_SD10K16:
+        return reloc_br_sd10k16(code_ptr, (tcg_insn_unit *)value);
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.0


