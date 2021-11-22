Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4F458CE4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:02:24 +0100 (CET)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp75b-00058T-S0
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6nK-00021J-JE
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:31 -0500
Received: from mail.xen0n.name ([115.28.160.31]:40908
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mp6nH-0007ig-AX
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:29 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5E5CE60B04;
 Mon, 22 Nov 2021 18:42:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637577776; bh=x5C60xzd6XT6E9/LPyTpeP9ZVSB9oYyXq9yFUOnRD0I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o722Re8b6HkIMhyedEMlYBeCKi0fpoa4eHM2tF961sGBYzQp5xo7OLrlutsvPaK9S
 IVAVW5dxRf8L7XiwBRGUwABYVVSzA68tOe4IgvEEsja1dG7Vwg0EJ2aKXLbHqjmxzR
 Ygqw+tKx0szyPYLf7bfV61msDm1m9unMHC3H/Kno=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/31] tcg/loongarch64: Register the JIT
Date: Mon, 22 Nov 2021 18:41:57 +0800
Message-Id: <20211122104201.112695-28-git@xen0n.name>
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
 tcg/loongarch64/tcg-target.c.inc | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index ff167d686b..8ce30ecae5 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1631,3 +1631,47 @@ static void tcg_target_init(TCGContext *s)
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
+        0x80 + 23, 11,                  /* DW_CFA_offset, s0, -88 */
+        0x80 + 24, 10,                  /* DW_CFA_offset, s1, -80 */
+        0x80 + 25, 9,                   /* DW_CFA_offset, s2, -72 */
+        0x80 + 26, 8,                   /* DW_CFA_offset, s3, -64 */
+        0x80 + 27, 7,                   /* DW_CFA_offset, s4, -56 */
+        0x80 + 28, 6,                   /* DW_CFA_offset, s5, -48 */
+        0x80 + 29, 5,                   /* DW_CFA_offset, s6, -40 */
+        0x80 + 30, 4,                   /* DW_CFA_offset, s7, -32 */
+        0x80 + 31, 3,                   /* DW_CFA_offset, s8, -24 */
+        0x80 + 22, 2,                   /* DW_CFA_offset, s9, -16 */
+        0x80 + 1 , 1,                   /* DW_CFA_offset, ra, -8 */
+    }
+};
+
+void tcg_register_jit(const void *buf, size_t buf_size)
+{
+    tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
+}
-- 
2.34.0


