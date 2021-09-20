Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C54116C2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:23:24 +0200 (CEST)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKCY-00048z-LC
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP4-0008Hg-U1
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:54 -0400
Received: from [115.28.160.31] (port=35584 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP3-0005Pn-2Y
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:54 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 725E3633FA;
 Mon, 20 Sep 2021 16:05:32 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125132; bh=0JvSb40nJ2+yUg7sI7nualzuPAioCQD9X0JAhkQvCT0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c/zftdv7vD9S5wbnLJquu5/KwouxquqvKjoSL7zbxgRTZ1AU9uItKlyu/3wbIAX5B
 cim0O/yjLgWoiTF1pxHGKlmN4oRakDnezUukRdi7ySzQGp+kjg+PNn6ZEaKm2xsU4D
 /YfjbKBB9BZV4G8AhL1JfW63xGcL7DyJ9mrkD6iM=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/30] tcg/loongarch: Implement tcg_out_mov and tcg_out_movi
Date: Mon, 20 Sep 2021 16:04:30 +0800
Message-Id: <20210920080451.408655-10-git@xen0n.name>
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
 tcg/loongarch/tcg-target.c.inc | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 71564e3246..60783d7ddc 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -261,6 +261,77 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
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
+    tcg_target_long low, upper, higher, top;
+
+    if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
+        val = (int32_t)val;
+    }
+
+    /* Single-instruction cases.  */
+    low = sextreg(val, 0, 12);
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
+    /* Chop upper bits into 3 immediate-field-sized segments respectively.  */
+    upper = (val >> 12) & 0xfffff;
+    higher = (val >> 32) & 0xfffff;
+    top = val >> 52;
+
+    tcg_out_opc_lu12i_w(s, rd, upper);
+    if (low != 0) {
+        tcg_out_opc_ori(s, rd, rd, low);
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
@@ -276,6 +347,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.33.0


