Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DAB414FE2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:29:18 +0200 (CEST)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6zd-0004Gx-PU
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6gu-0006ML-BW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:09:56 -0400
Received: from [115.28.160.31] (port=40348 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mT6gr-0007CT-VV
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:09:55 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 885EA633FB;
 Thu, 23 Sep 2021 02:09:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632334182; bh=eNdiKKfUJ0fGPX73WK/mzfEX3nWBpUB/QoXxtaoJigQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WxFY8pPIrv5Hjh/VJV5MtnS53CmXI+ETsqnr8rOs7jp2MmBygqgLp892e64m8gaMy
 DYrcNrJwaD/YegPzQMYWuSbv/qpy3LhshYfMbGdVopOv8cfRhqDn7F32Triiqrix7X
 M1g7Ykha7CPu3yOZMDl9R0oI5/RzZWIm0nb28Ujs=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Date: Thu, 23 Sep 2021 02:09:06 +0800
Message-Id: <20210922180927.666273-10-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922180927.666273-1-git@xen0n.name>
References: <20210922180927.666273-1-git@xen0n.name>
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
 tcg/loongarch64/tcg-target.c.inc | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 338b772732..6d28a29070 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -247,6 +247,93 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
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
+    if (pc_offset == (int32_t)pc_offset) {
+        tcg_target_long lo = sextreg(pc_offset, 0, 12);
+        tcg_target_long hi = pc_offset - lo;
+        tcg_out_opc_pcaddu12i(s, rd, hi >> 12);
+        tcg_out_opc_addi_d(s, rd, rd, lo);
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
+
+    tcg_out_opc_lu12i_w(s, rd, upper);
+    if (low != 0) {
+        tcg_out_opc_ori(s, rd, rd, low & 0xfff);
+    }
+
+    if (sextreg(val, 0, 32) == val) {
+        /*
+         * Fits in 32-bits, upper bits are already properly sign-extended by
+         * lu12i.w.
+         */
+        return;
+    }
+    tcg_out_opc_cu32i_d(s, rd, higher);
+
+    if (sextreg(val, 0, 52) == val) {
+        /*
+         * Fits in 52-bits, upper bits are already properly sign-extended by
+         * cu32i.d.
+         */
+        return;
+    }
+    tcg_out_opc_cu52i_d(s, rd, rd, top);
+}
+
 /*
  * Entry-points
  */
@@ -262,6 +349,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.33.0


