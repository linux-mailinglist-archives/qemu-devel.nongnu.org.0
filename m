Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286714179F2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:41:25 +0200 (CEST)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpCO-0006Ow-7J
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mToyH-0006g7-3B
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:26:49 -0400
Received: from [115.28.160.31] (port=41420 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mToyE-0004O5-TH
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:26:48 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6078460B16;
 Sat, 25 Sep 2021 01:26:43 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632504403; bh=8ZjNxBS9wWJoVkXlE5vTvNsLGvbX/FPUFz6K7C3ZJv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qmfbWYs4x23ICxbXGWum0/c2KWVyD7Gu7OJiAw+57cLfHmR20hEqIdo8dBZkNgDMi
 O2RvkaFTIJY464X2aMtKGfKE2ejg5CgioiWIy1Aia7DrkxlUxmO7SUjw0nuQ7L4KBL
 RHC4DZcL+0lBGF/iHur5nvzfYYEuBm5MnqQaeJCQ=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Date: Sat, 25 Sep 2021 01:25:06 +0800
Message-Id: <20210924172527.904294-10-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924172527.904294-1-git@xen0n.name>
References: <20210924172527.904294-1-git@xen0n.name>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 109 +++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 8f7c556c37..f1d0047f5b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -247,6 +247,113 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
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
+    /* Single-instruction cases.  */
+    tcg_target_long lo = sextreg(val, 0, 12);
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
+    tcg_target_long hi12 = sextreg(val, 12, 20);
+    tcg_out_opc_lu12i_w(s, rd, hi12);
+    if (lo != 0) {
+        tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
+    }
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
+                         tcg_target_long val)
+{
+    if (type == TCG_TYPE_I32 || val == (int32_t)val) {
+        tcg_out_movi_i32(s, rd, val);
+        return;
+    }
+
+    /* PC-relative cases.  */
+    intptr_t pc_offset = tcg_pcrel_diff(s, (void *)val);
+    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 0) {
+        /* Single pcaddu2i.  */
+        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
+        return;
+    }
+
+    if (pc_offset == (int32_t)pc_offset) {
+        /* Offset within 32 bits; load with pcalau12i + ori.  */
+        tcg_target_long lo = sextreg(val, 0, 12);
+        tcg_target_long pc_hi = (val - pc_offset) >> 12;
+        tcg_target_long val_hi = val >> 12;
+        tcg_target_long offset_hi = val_hi - pc_hi;
+        tcg_debug_assert(offset_hi == sextreg(offset_hi, 0, 20));
+        tcg_out_opc_pcalau12i(s, rd, offset_hi);
+        if (lo != 0) {
+            tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
+        }
+        return;
+    }
+
+    /* Single cu52i.d case.  */
+    if (ctz64(val) >= 52) {
+        tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, val >> 52);
+        return;
+    }
+
+    /* Slow path.  Initialize the low 32 bits, then concat high bits.  */
+    tcg_out_movi_i32(s, rd, val);
+
+    bool rd_high_bits_are_ones = (int32_t)val < 0;
+    tcg_target_long hi32 = sextreg(val, 32, 20);
+    tcg_target_long hi52 = sextreg(val, 52, 12);
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
@@ -262,6 +369,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.33.0


