Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D70845CC70
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:47:48 +0100 (CET)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxJ5-0003j4-Hc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5N-0006P3-88
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:37 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43480
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5K-0004hB-Hc
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:36 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 03B3360AF3;
 Thu, 25 Nov 2021 02:33:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637778807; bh=B4GCPhC5IL1x1OT4dxxxailnqISGmgY3Y1zq3ocPysU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h5wLfrKYgMsXTnFg7gSUsJoV6MMXrvVgU43MawIWSX5TXHLOdtIiHEdS+MmxchmCg
 x1/mNeJnGdIhLNyev8oufntZUQcsr77XnsTqadPgfBn5/i1MC6eolCEHaSriOcM4dK
 d9X5CZbngF3CO5kRatLZNChvKzQDKPjYhP/R4ETo=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v8 09/31] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Date: Thu, 25 Nov 2021 02:32:09 +0800
Message-Id: <20211124183231.1503090-10-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124183231.1503090-1-git@xen0n.name>
References: <20211124183231.1503090-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/loongarch64/tcg-target.c.inc | 137 +++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index f12955723d..4487851b5e 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -247,6 +247,141 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out_opc_dbar(s, 0);
 }
 
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
+{
+    if (ret == arg) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+    case TCG_TYPE_I64:
+        /*
+         * Conventional register-register move used in LoongArch is
+         * `or dst, src, zero`.
+         */
+        tcg_out_opc_or(s, ret, arg, TCG_REG_ZERO);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+static bool imm_part_needs_loading(bool high_bits_are_ones,
+                                   tcg_target_long part)
+{
+    if (high_bits_are_ones) {
+        return part != -1;
+    } else {
+        return part != 0;
+    }
+}
+
+/* Loads a 32-bit immediate into rd, sign-extended.  */
+static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
+{
+    tcg_target_long lo = sextreg(val, 0, 12);
+    tcg_target_long hi12 = sextreg(val, 12, 20);
+
+    /* Single-instruction cases.  */
+    if (lo == val) {
+        /* val fits in simm12: addi.w rd, zero, val */
+        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
+        return;
+    }
+    if (0x800 <= val && val <= 0xfff) {
+        /* val fits in uimm12: ori rd, zero, val */
+        tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
+        return;
+    }
+
+    /* High bits must be set; load with lu12i.w + optional ori.  */
+    tcg_out_opc_lu12i_w(s, rd, hi12);
+    if (lo != 0) {
+        tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
+    }
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
+                         tcg_target_long val)
+{
+    /*
+     * LoongArch conventionally loads 64-bit immediates in at most 4 steps,
+     * with dedicated instructions for filling the respective bitfields
+     * below:
+     *
+     *        6                   5                   4               3
+     *  3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+     * +-----------------------+---------------------------------------+...
+     * |          hi52         |                  hi32                 |
+     * +-----------------------+---------------------------------------+...
+     *       3                   2                   1
+     *     1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+     * ...+-------------------------------------+-------------------------+
+     *    |                 hi12                |            lo           |
+     * ...+-------------------------------------+-------------------------+
+     *
+     * Check if val belong to one of the several fast cases, before falling
+     * back to the slow path.
+     */
+
+    intptr_t pc_offset;
+    tcg_target_long val_lo, val_hi, pc_hi, offset_hi;
+    tcg_target_long hi32, hi52;
+    bool rd_high_bits_are_ones;
+
+    /* Value fits in signed i32.  */
+    if (type == TCG_TYPE_I32 || val == (int32_t)val) {
+        tcg_out_movi_i32(s, rd, val);
+        return;
+    }
+
+    /* PC-relative cases.  */
+    pc_offset = tcg_pcrel_diff(s, (void *)val);
+    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 0) {
+        /* Single pcaddu2i.  */
+        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
+        return;
+    }
+
+    if (pc_offset == (int32_t)pc_offset) {
+        /* Offset within 32 bits; load with pcalau12i + ori.  */
+        val_lo = sextreg(val, 0, 12);
+        val_hi = val >> 12;
+        pc_hi = (val - pc_offset) >> 12;
+        offset_hi = val_hi - pc_hi;
+
+        tcg_debug_assert(offset_hi == sextreg(offset_hi, 0, 20));
+        tcg_out_opc_pcalau12i(s, rd, offset_hi);
+        if (val_lo != 0) {
+            tcg_out_opc_ori(s, rd, rd, val_lo & 0xfff);
+        }
+        return;
+    }
+
+    hi32 = sextreg(val, 32, 20);
+    hi52 = sextreg(val, 52, 12);
+
+    /* Single cu52i.d case.  */
+    if (ctz64(val) >= 52) {
+        tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, hi52);
+        return;
+    }
+
+    /* Slow path.  Initialize the low 32 bits, then concat high bits.  */
+    tcg_out_movi_i32(s, rd, val);
+    rd_high_bits_are_ones = (int32_t)val < 0;
+
+    if (imm_part_needs_loading(rd_high_bits_are_ones, hi32)) {
+        tcg_out_opc_cu32i_d(s, rd, hi32);
+        rd_high_bits_are_ones = hi32 < 0;
+    }
+
+    if (imm_part_needs_loading(rd_high_bits_are_ones, hi52)) {
+        tcg_out_opc_cu52i_d(s, rd, rd, hi52);
+    }
+}
+
 /*
  * Entry-points
  */
@@ -262,6 +397,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.0


