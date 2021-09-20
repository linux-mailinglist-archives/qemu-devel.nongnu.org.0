Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E4411673
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:11:00 +0200 (CEST)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSK0Z-0004nG-Sz
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETW-0008RC-L5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:31 -0400
Received: from [115.28.160.31] (port=35648 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETT-0000pW-D6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:30 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C0A6A6340B;
 Mon, 20 Sep 2021 16:06:14 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125174; bh=jpr1oy1wQbUshahrmgEkxsSF14Hd/0cCNV/8BTZide4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xv2M0edlHPZakgB959YmJ8CYyklGJGCQata0xcSdWLPKNxTaO78ZK+cqvDngRG/Yl
 JoqivM1XGIGmyQYos+zxtlO7m8/MlvfN4Ph8z4gfBGVfXHvz9Bb/OOuW/FyZakDA8I
 Q/yfI2sWhVj/Tmg5XQfamyRJrvdiSO6DtTD/3P4w=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/30] tcg/loongarch: Implement tcg_target_init
Date: Mon, 20 Sep 2021 16:04:47 +0800
Message-Id: <20210920080451.408655-27-git@xen0n.name>
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
 SPF_PASS=-0.001, TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
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
 tcg/loongarch/tcg-target.c.inc | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 585bf8dba0..107682e1fa 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -1486,3 +1486,32 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_opc_addi_d(s, TCG_REG_SP, TCG_REG_SP, FRAME_SIZE);
     tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_RA, 0);
 }
+
+static void tcg_target_init(TCGContext *s)
+{
+    tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
+    }
+
+    tcg_target_call_clobber_regs = -1u;
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S0);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S1);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S2);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S3);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S4);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S5);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S6);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S7);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S8);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S9);
+
+    s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_ZERO);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
+}
-- 
2.33.0


