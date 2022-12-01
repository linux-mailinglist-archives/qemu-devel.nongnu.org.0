Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01563F253
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:10:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0kF8-0008Ac-3Z; Thu, 01 Dec 2022 09:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF4-00087v-Az; Thu, 01 Dec 2022 09:08:46 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kEy-0008BK-BF; Thu, 01 Dec 2022 09:08:46 -0500
X-QQ-mid: bizesmtp72t1669903693t45f858h
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:12 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: 3M0okmaRx3iPqdN9Kd7vjXivN+tn3SOVru4bSsv1j3hB7lOab58yj4OBZqHst
 ReVla93Hw6SD+VkU7Z8gh5zUQd9GukirADO8wt8sz60FLgPZvAsiMwzVqVzFER1BHSJdmOq
 /xz2d3OtnFCbfnwM7c1bhc9ihNxR0M9Ccd1Wr87ogT3db93BxSMrExP3DD0dno7/Rw2MeUm
 jmTEWy1y/B1AzJBHR6aJFbmMfVPLQBhwvLe1ODyRrHz54lWYHvK4jHqGvE5oIYOoE1IR9Or
 3M7JhIxeuJ4oADLMVxSVzYup84qDeuis30gH0EfynChD016gXbxRwZ1e/8eUAmHPzWfCU9H
 UxoA5K11qFRc2SWlafgLH1USOn+/A==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 01/15] hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
Date: Thu,  1 Dec 2022 22:07:57 +0800
Message-Id: <20221201140811.142123-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
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
initialized to true in sifive_plic_realize().

Let SIFIVE_PLIC select MSI_NONBROKEN and drop the selection from
RISC-V machines.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/intc/Kconfig  | 1 +
 hw/riscv/Kconfig | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index ecd2883ceb..1d4573e803 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -78,6 +78,7 @@ config RISCV_IMSIC
 
 config SIFIVE_PLIC
     bool
+    select MSI_NONBROKEN
 
 config GOLDFISH_PIC
     bool
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 79ff61c464..167dc4cca6 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -11,7 +11,6 @@ config MICROCHIP_PFSOC
     select MCHP_PFSOC_IOSCB
     select MCHP_PFSOC_MMUART
     select MCHP_PFSOC_SYSREG
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -37,7 +36,6 @@ config RISCV_VIRT
     imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
-    select MSI_NONBROKEN
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
@@ -53,7 +51,6 @@ config RISCV_VIRT
 
 config SIFIVE_E
     bool
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
@@ -64,7 +61,6 @@ config SIFIVE_E
 config SIFIVE_U
     bool
     select CADENCE
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
@@ -82,6 +78,5 @@ config SPIKE
     bool
     select RISCV_NUMA
     select HTIF
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PLIC
-- 
2.34.1


