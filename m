Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E654E63F25D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0kF5-00088A-QN; Thu, 01 Dec 2022 09:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1p0kF2-00087O-W9
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:08:45 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1p0kEx-0008BC-Dp
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:08:44 -0500
X-QQ-mid: bizesmtp72t1669903696t445m9dx
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:15 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: swyrzWPvyR0q1XACUVkxUU7KsXbMNjvKijTv6M9vtYJQyC0C7F0v3NnlrxS9K
 cGXu7fa380Xp0qkUQ3W6E6tRCo4UHKKxWRVEOBqXR9ZbCcoBiALKIUQueRalTw3JeX2HGq+
 BBymzna+PvxnCHWDyz5xgdR5TsJUKPDx6gwJiJIdRDm8Frun9REjOqiu+QxxOAhjJsi2j/4
 t2AAJwCXFtZy8zZjhhC5KGypUGM+rBENlNK+6Opf+2iQfA267ow3o754NQOQt6O6B4C5bA6
 tQZ3nQ0/5jq4Y6DugSNcEzGc16IrpBVMdW1++sVgpTEv3/NR/2ReWZ7Mo5HAGYkHCqk7ab6
 yZM/+tS0bI5da1hQqhnT0rN3t6Rw3PIbGdRozo0FGlqpQcuUHE=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH 02/15] hw/intc: Select MSI_NONBROKEN in RISC-V AIA interrupt
 controllers
Date: Thu,  1 Dec 2022 22:07:58 +0800
Message-Id: <20221201140811.142123-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
controllers regardless of how MSI is implemented. msi_nonbroken is
initialized to true in both riscv_aplic_realize() and
riscv_imsic_realize().

Select MSI_NONBROKEN in RISCV_APLIC and RISCV_IMSIC.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/intc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 1d4573e803..21441d0a0c 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -72,9 +72,11 @@ config RISCV_ACLINT
 
 config RISCV_APLIC
     bool
+    select MSI_NONBROKEN
 
 config RISCV_IMSIC
     bool
+    select MSI_NONBROKEN
 
 config SIFIVE_PLIC
     bool
-- 
2.34.1


