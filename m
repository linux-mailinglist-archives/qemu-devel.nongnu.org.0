Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC764116B2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:17:50 +0200 (CEST)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSK7B-0007MM-6d
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP3-0008B7-15
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:53 -0400
Received: from [115.28.160.31] (port=35580 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOz-0005Md-Mk
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:52 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E3DE4633F8;
 Mon, 20 Sep 2021 16:05:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125126; bh=k4doJBiQClVLGSIZcy6JlQUdedkmWKu23BamxbIJRF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wn5BWgMdtATROvQGtkNmRnIUlwC/C2exXWhcNzBIfsFUZ8H9PGMxUCwQtET1qlFml
 vm8XeDVSaSzyUueHzZvKwZbgQu4YtczYFBX4YOs+bxx4A7Z8WSjY75mBgwhcqugSlk
 xAtRuzXaiDKlcXF0ptFJ4Z6D6Gjzq0MEqEI9fHPU=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/30] tcg/loongarch: Implement necessary relocation operations
Date: Mon, 20 Sep 2021 16:04:28 +0800
Message-Id: <20210920080451.408655-8-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
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
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
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
 tcg/loongarch/tcg-target.c.inc | 84 ++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 594b434b47..8be34f8275 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -164,3 +164,87 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     }
     return 0;
 }
+
+/*
+ * Relocations
+ */
+
+/*
+ * Relocation records defined in LoongArch ELF psABI v1.00 is way too much
+ * complicated; a whopping stack machine is needed to stuff the fields, at
+ * the very least one SOP_PUSH and one SOP_POP (of the correct format) are
+ * needed.
+ *
+ * Hence, define our own simpler relocation types. Numbers are chosen as to
+ * not collide with potential future additions to the true ELF relocation
+ * type enum.
+ */
+
+/* Field Sk16; suitable for conditional jumps */
+#define R_LOONGARCH_SK16    256
+/* Field Sd10k16; suitable for B and BL */
+#define R_LOONGARCH_SD10K16 257
+
+static bool reloc_sk16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
+
+    tcg_debug_assert((offset & 2) == 0);
+    offset >>= 2;
+    if (offset == sextreg(offset, 0, 16)) {
+        *src_rw |= (offset << 10) & 0x3fffc00;
+        return true;
+    }
+
+    return false;
+}
+
+static bool reloc_sd10k16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
+
+    tcg_debug_assert((offset & 2) == 0);
+    offset >>= 2;
+    if (offset == sextreg(offset, 0, 26)) {
+        *src_rw |= (offset >> 16) & 0x3ff; /* slot d10 */
+        *src_rw |= ((offset & 0xffff) << 10) & 0x3fffc00; /* slot k16 */
+        return true;
+    }
+
+    return false;
+}
+
+static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
+    int32_t lo = sextreg(offset, 0, 12);
+    int32_t hi = offset - lo;
+
+    tcg_debug_assert((offset & 2) == 0);
+    if (offset == hi + lo) {
+        hi >>= 12;
+        src_rw[0] |= (hi << 5) & 0x1ffffe0; /* pcaddu12i's Sj20 imm */
+        lo >>= 2;
+        src_rw[1] |= (lo << 10) & 0x3fffc00; /* jirl's Sk16 imm */
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
+    case R_LOONGARCH_SK16:
+        return reloc_sk16(code_ptr, (tcg_insn_unit *)value);
+    case R_LOONGARCH_SD10K16:
+        return reloc_sd10k16(code_ptr, (tcg_insn_unit *)value);
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.33.0


