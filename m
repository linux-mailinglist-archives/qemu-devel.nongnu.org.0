Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B634F4183D7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:58:33 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBwW-0003U5-PD
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWU-0002dY-8D
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:38 -0400
Received: from [115.28.160.31] (port=57226 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mUBWS-0005e2-Ep
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:31:38 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7FAFA60B4B;
 Sun, 26 Sep 2021 01:30:58 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632591058; bh=sRs3ud6SvbTAotMK83Y5JI0XrMrg2U5Qx+DCqvVAuYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I6kp8uQsEZMSmBPEm9N+rspW3DByKelMR6fKJY8TZa9lIKzf9m7nUr/Cm+cTjQb9q
 g2rBLm8RlYhNeTDR/9B+TxUUDGHU4XTKOznPev6Xqw3StfmTy8gGG8kihHFmyJA1S2
 LfUhTHH4OVS8NzqX45v8hkrpHty+vcExrRuMgOy8=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 27/30] tcg/loongarch64: Register the JIT
Date: Sun, 26 Sep 2021 01:30:29 +0800
Message-Id: <20210925173032.2434906-28-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210925173032.2434906-1-git@xen0n.name>
References: <20210925173032.2434906-1-git@xen0n.name>
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
---
 tcg/loongarch64/tcg-target.c.inc | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e3c73f9fe7..73f230b412 100644
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
2.33.0


