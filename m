Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C8413B33
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:22:32 +0200 (CEST)
Received: from localhost ([::1]:47242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmHf-0006yL-P3
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEu-00042R-OV
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:41 -0400
Received: from [115.28.160.31] (port=55994 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEs-0000TS-5f
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:40 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9CC8F633F8;
 Wed, 22 Sep 2021 04:19:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255566; bh=3oLxhl7nP2wXWycImvg28oHXfb5Kr/OWF5P/kgaiv34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g8TyHjNj6L9rptjG/59hXAXgKKmBs93t4QTObW1krozXTeLTbcCKJ2RxFxe7hkd40
 K4gLwwx/UFI3qNR+V+MN49R1MmRSmmNqV+gx91ltRkadc1TqU8WU8erd3D2zN+07mq
 kd+3VBgNj20d7kU3O6v+WlC4j2yjydtqkH/NVDKs=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/30] tcg/loongarch64: Implement necessary relocation
 operations
Date: Wed, 22 Sep 2021 04:18:52 +0800
Message-Id: <20210921201915.601245-8-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921201915.601245-1-git@xen0n.name>
References: <20210921201915.601245-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 tcg/loongarch64/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index f0930f77ef..69e882ba5d 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -168,3 +168,69 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     }
     return 0;
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
+        *src_rw |= (offset << 10) & 0x3fffc00;
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
+        *src_rw |= (offset >> 16) & 0x3ff; /* slot d10 */
+        *src_rw |= ((offset & 0xffff) << 10) & 0x3fffc00; /* slot k16 */
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
2.33.0


