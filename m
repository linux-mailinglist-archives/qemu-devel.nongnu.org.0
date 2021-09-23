Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5944163DD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 19:09:13 +0200 (CEST)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTSDg-0002uk-J8
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 13:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mTS59-0005nF-39
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:00:23 -0400
Received: from [115.28.160.31] (port=54372 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mTS57-0005Tu-1H
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:00:22 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AD1FB60AF5;
 Fri, 24 Sep 2021 01:00:17 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632416417; bh=WeVd1O7SqVii76mgKhgAHLKjKU0Q9HApYewH7kIhhjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TPB0GqYXYnYNMb9N92KrBwVlEs9rm1Vr4Z+512mXCJ8XBvky7b+pEhBK1+AAIIPgX
 t4ohgZpfoeu47X2dJd9wt3nUjDOUJKBJ5pd1C9Fedb/1uH+5q5Stkh6wl1ukPR8IOw
 mak1onP/daoo1cq+fp5BDplOkIOKgGcA41Gnmpx0=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Date: Fri, 24 Sep 2021 00:59:18 +0800
Message-Id: <20210923165939.729081-10-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923165939.729081-1-git@xen0n.name>
References: <20210923165939.729081-1-git@xen0n.name>
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
Cc: WANG Xuerui <git@xen0n.name>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch64/tcg-target.c.inc | 111 +++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 8f7c556c37..afaed5017a 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -247,6 +247,115 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
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
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
+                         tcg_target_long val)
+{
+    if (type == TCG_TYPE_I32) {
+        val = (int32_t)val;
+    }
+
+    /* Single-instruction cases.  */
+    tcg_target_long low = sextreg(val, 0, 12);
+    if (low == val) {
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
+    /* Test for PC-relative values that can be loaded faster.  */
+    intptr_t pc_offset = tcg_pcrel_diff(s, (void *)val);
+    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 0) {
+        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
+        return;
+    }
+
+    if (pc_offset == (int32_t)pc_offset) {
+        /* Load using pcalau12i + ori.  */
+        tcg_target_long pc_hi = (val - pc_offset) >> 12;
+        tcg_target_long val_hi = val >> 12;
+        tcg_target_long offset_hi = val_hi - pc_hi;
+        tcg_debug_assert(offset_hi == sextreg(offset_hi, 0, 20));
+        tcg_out_opc_pcalau12i(s, rd, offset_hi);
+        if (low != 0) {
+            tcg_out_opc_ori(s, rd, rd, low & 0xfff);
+        }
+        return;
+    }
+
+    /*
+     * Slow path: at most lu12i.w + ori + cu32i.d + cu52i.d.
+     *
+     * Chop upper bits into 3 immediate-field-sized segments respectively.
+     */
+    tcg_target_long upper = sextreg(val, 12, 20);
+    tcg_target_long higher = sextreg(val, 32, 20);
+    tcg_target_long top = sextreg(val, 52, 12);
+    bool rd_written = false;
+    bool rd_high_bits_are_ones = false;
+
+    if (upper != 0) {
+        tcg_out_opc_lu12i_w(s, rd, upper);
+        rd_written = true;
+        rd_high_bits_are_ones = upper < 0;
+    }
+    if (low != 0) {
+        tcg_out_opc_ori(s, rd, rd_written ? rd : TCG_REG_ZERO, low & 0xfff);
+        rd_written = true;
+    }
+
+    if (imm_part_needs_loading(rd_high_bits_are_ones, higher)) {
+        if (!rd_written) {
+            /*
+             * cu32i.d only has 1 input register, yet rd is still untouched
+             * by now. We must zero it here.
+             */
+            tcg_out_opc_or(s, rd, TCG_REG_ZERO, TCG_REG_ZERO);
+        }
+        tcg_out_opc_cu32i_d(s, rd, higher);
+        rd_written = true;
+        rd_high_bits_are_ones = higher < 0;
+    }
+
+    if (imm_part_needs_loading(rd_high_bits_are_ones, top)) {
+        tcg_out_opc_cu52i_d(s, rd, rd_written ? rd : TCG_REG_ZERO, top);
+    }
+}
+
 /*
  * Entry-points
  */
@@ -262,6 +371,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.33.0


