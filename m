Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FD131E432
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:05:30 +0100 (CET)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYh7-00045g-5J
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcf-0007B4-SK
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:54 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcd-0008Kh-MO
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613652; x=1645149652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwD11iE6JaWCXDS4fhmHjWzUDoHUi+1VBbWzLmD3EYM=;
 b=r6ybQKdkLoOm9RMJDBpiPAsqYA5yM+Ylx7ZA5W2YwkC0Er4Mnkj7GJ23
 /3xkpd1RG/eoqR1eFtyb1bKsp/ZOn2CuKvbWloWxx7NwnTO9rVO46LipS
 NsKozKn+emctTZNRhE9UTvoAeXP7V0jufoqGWv5d89RERk5bQMv1xlTJC
 ILZvqlQugJOO3QK+yFkh4yaO2V9xuhhYDp+XhismHzFFODa+hJj7UgHK3
 NOAu2AFfS6sCrvweHToLqaAgy8Ml88FcJMd7su9NBVp5fAjfzovIxBYtC
 iN4B39ZRKuR3aLQSez8z0aINcHIaFLOhRInq3V4m5vB3oiNWNfVCzdiPz g==;
IronPort-SDR: ry9DixjJDR3DI7X9ZdFDTX5NDjO2Y8NvIoZXt5QndzJOWrOX+0ukHd73aLeLbdpypeMEUvxrJM
 hd6CHty/QZfVYFlkQv7/vQM152/YfCM+9dKspSRqoC4RFjPZsRT7KwbbYlZbAuG/4LrGfnQgVy
 F7uz3UB0wuO7zp7n0Uw18honlpXuaFpziP3rSby4lzcPX5TAVUIQYNhdiOB1jhfa8l7Klc0WF/
 OF38fLTMSbVXv5pVMcBS/p8iY3BcA5Fv9FN088yQHhHPCkjiZcfIoyg5Ms2GNbq3muSW5+cvtG
 lgM=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392147"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:01 +0800
IronPort-SDR: zAeFFmBglJ32f65Y0X42F/EIyGnuyIzEreuu7mQPvdatXYt/8Xs4kNoB2j48IsSofpZK++I463
 O05eg/xf8EDd3mPVBHx7rOiaVbSTXsETGU2BwZ696Sr/IL4cAgXPMYqYwMF5Ko8Us5rX4RGplc
 laFF0V5mv+yeWGMmbCsD70qglXnX3UlT+0BpYMlfzBsNfPPhUDukl9poGpJSHNDOD9QgxVUyU5
 z6QAb6RsXMVSbNsN8pseKDLZH8JHPOr/R1m4OhhiUujIRWUeegJndPr5QkV2KrC5+PNClqvFlQ
 gacdgOIQWEnv5cg+vxsnYQYY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:31 -0800
IronPort-SDR: mP5mZDB2fErP3Vg2SZBJWcBADq4yM3sbADXDJVmjI2LOx4zp0qll7HrBgInYfXMFMUmQEKznRa
 CHkymZmcc0XdOwHiRr8v7pfQYn8Q39PWc03xgejow/be3Vzz+bz4hZ/lNGDTob2b0jLSA2+yfY
 2HmgnM1Sg6K9Gsk3BnvP+85kAsFcj4CKMnQQZwcix70Tk5g5uzYUwvtLJX9F4htOTx1C6eV/6m
 +EqR84s1Cw3UBC/XrcD5dSb0PqG6R2/eaNOyh2iutIbVCxnmHLCHcHu8EZUf/TFrrQH1KzKYex
 ieU=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 18:00:01 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 17/19] hw/riscv: virt: Drop the 'link_up' parameter of
 gpex_pcie_init()
Date: Wed, 17 Feb 2021 17:59:32 -0800
Message-Id: <20210218015934.1623959-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

`link_up` is never used in gpex_pcie_init(). Drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210122122958.12311-3-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cfd52bc59b..1d05bb3ef9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -449,7 +449,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *plic, bool link_up)
+                                          DeviceState *plic)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -669,12 +669,12 @@ static void virt_machine_init(MachineState *machine)
     }
 
     gpex_pcie_init(system_memory,
-                         memmap[VIRT_PCIE_ECAM].base,
-                         memmap[VIRT_PCIE_ECAM].size,
-                         memmap[VIRT_PCIE_MMIO].base,
-                         memmap[VIRT_PCIE_MMIO].size,
-                         memmap[VIRT_PCIE_PIO].base,
-                         DEVICE(pcie_plic), true);
+                   memmap[VIRT_PCIE_ECAM].base,
+                   memmap[VIRT_PCIE_ECAM].size,
+                   memmap[VIRT_PCIE_MMIO].base,
+                   memmap[VIRT_PCIE_MMIO].size,
+                   memmap[VIRT_PCIE_PIO].base,
+                   DEVICE(pcie_plic));
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
-- 
2.30.0


