Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A19411660
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:07:48 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJxT-0007OJ-Sv
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETW-0008RH-SL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:31 -0400
Received: from [115.28.160.31] (port=35654 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETT-0000pn-9R
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:30 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C06126340C;
 Mon, 20 Sep 2021 16:06:16 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125176; bh=Xdrgo5XG9zmkiQQAkBxj6W5xUj49FqUf2M8bdgZeaY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hlLAyrFZHfj5XA06qA70ZBkOMS6cIqC6YD0QWa1AlnZ+7cTLIsrtyz6KLzyrofZnC
 xOCQ9G/vmxRYKhQezWUsVQab2poZyl27+IEFvf3YYKK81nD2gMR4hSw5883v/pn8lo
 PxRqHZF14KiN5eTL1YHV4bJMkz/CDo7hAv0PWDJw=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/30] tcg/loongarch: Register the JIT
Date: Mon, 20 Sep 2021 16:04:48 +0800
Message-Id: <20210920080451.408655-28-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
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
 tcg/loongarch/tcg-target.c.inc | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 107682e1fa..59adc92d26 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -1515,3 +1515,47 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
 }
+
+typedef struct {
+    DebugFrameHeader h;
+    uint8_t fde_def_cfa[4];
+    uint8_t fde_reg_ofs[ARRAY_SIZE(tcg_target_callee_save_regs) * 2];
+} DebugFrame;
+
+#define ELF_HOST_MACHINE EM_LOONGARCH
+
+static const DebugFrame debug_frame = {
+    .h.cie.len = sizeof(DebugFrameCIE) - 4, /* length after .len member */
+    .h.cie.id = -1,
+    .h.cie.version = 1,
+    .h.cie.code_align = 1,
+    .h.cie.data_align = -(TCG_TARGET_REG_BITS / 8) & 0x7f, /* sleb128 */
+    .h.cie.return_column = TCG_REG_RA,
+
+    /* Total FDE size does not include the "len" member.  */
+    .h.fde.len = sizeof(DebugFrame) - offsetof(DebugFrame, h.fde.cie_offset),
+
+    .fde_def_cfa = {
+        12, TCG_REG_SP,                 /* DW_CFA_def_cfa sp, ...  */
+        (FRAME_SIZE & 0x7f) | 0x80,     /* ... uleb128 FRAME_SIZE */
+        (FRAME_SIZE >> 7)
+    },
+    .fde_reg_ofs = {
+        0x80 + 23, 11,                  /* DW_CFA_offset, s0,  -88 */
+        0x80 + 24, 10,                  /* DW_CFA_offset, s1,  -80 */
+        0x80 + 25, 9,                   /* DW_CFA_offset, s2,  -72 */
+        0x80 + 26, 8,                   /* DW_CFA_offset, s3,  -64 */
+        0x80 + 27, 7,                   /* DW_CFA_offset, s4,  -56 */
+        0x80 + 28, 6,                   /* DW_CFA_offset, s5,  -48 */
+        0x80 + 29, 5,                   /* DW_CFA_offset, s6,  -40 */
+        0x80 + 30, 4,                   /* DW_CFA_offset, s7,  -32 */
+        0x80 + 31, 3,                   /* DW_CFA_offset, s8,  -24 */
+        0x80 + 22, 2,                   /* DW_CFA_offset, s9,  -16 */
+        0x80 + 1 , 1,                   /* DW_CFA_offset, ra,  -8 */
+    }
+};
+
+void tcg_register_jit(const void *buf, size_t buf_size)
+{
+    tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
+}
-- 
2.33.0


