Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F94AB0A7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 17:23:13 +0100 (CET)
Received: from localhost ([::1]:35912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGkJk-0003sa-C1
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 11:23:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nGkI4-0002j5-Lj
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 11:21:30 -0500
Received: from mail.xen0n.name ([115.28.160.31]:34052
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1nGkI2-0004Ti-3h
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 11:21:28 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5A47D600FF;
 Mon,  7 Feb 2022 00:21:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1644164468; bh=aLX2ErLVwq/VGn8tUC1uNgFj0MnKuivG6Ybuvlas9hM=;
 h=From:To:Cc:Subject:Date:From;
 b=UW2atcQb7SqA3GkEfbsafn84xCLAN4rZH0jCXU+e4uxmp8maoTpLPDKbeCvhkxQMv
 tS6AUUDIgY+3pbE2a7Hma6i4NWjzqssXp6c9VpcpZKObTn7Wh8GbEbynQXLYrXHH+R
 K3M/AFMsHPN3Q6WW64rE7vqTpJsZ1P+H1WMO6imQ=
From: WANG Xuerui <i.qemu@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/loongarch64: Fix fallout from recent MO_Q renaming
Date: Mon,  7 Feb 2022 00:21:06 +0800
Message-Id: <20220206162106.1092364-1-i.qemu@xen0n.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Apparently we were left behind; just renaming MO_Q to MO_UQ is enough.

Fixes: fc313c64345453c7 ("exec/memop: Adding signedness to quad definitions")
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 9cd46c9be3..d31a0e5991 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -871,7 +871,7 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
     case MO_SL:
         tcg_out_opc_ldx_w(s, rd, rj, rk);
         break;
-    case MO_Q:
+    case MO_UQ:
         tcg_out_opc_ldx_d(s, rd, rj, rk);
         break;
     default:
-- 
2.35.1


