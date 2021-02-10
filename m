Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB61315F80
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:33:06 +0100 (CET)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j3h-0001oE-3w
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip7-0001ds-Pr; Wed, 10 Feb 2021 01:18:01 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41209 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip3-0000MJ-S1; Wed, 10 Feb 2021 01:18:00 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gn02CZz9sW8; Wed, 10 Feb 2021 17:17:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937861;
 bh=oocNU8v789oYIS9SmO92zGwaC6D9a+0uYy6mMHD9CgU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WERd2x4SvvhoGyBtI4/xvyt1gwwDKPJ3v+nE4ZY3eZzw0HIS1goMQDoZTktYepy48
 K5xNoKwUiMnEAfEmPNXgts+IBmheVO6+5oi+1fRBuUs3qBSo9bIACubFVd+Bs/OTUB
 dI9qLJSGYm9qpwv1LNaeLvnYtAKqtFiHbjDlbKsg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/19] ppc/pnv: Introduce a LPC FW memory region attribute to
 map the PNOR
Date: Wed, 10 Feb 2021 17:17:27 +1100
Message-Id: <20210210061735.304384-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

This to map the PNOR from the machine init handler directly and finish
the cleanup of the LPC model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210126171059.307867-8-clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c         | 11 +++++++++++
 hw/ppc/pnv_lpc.c     |  7 -------
 include/hw/ppc/pnv.h |  1 +
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e500c2e243..50810df838 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -871,6 +871,14 @@ static void pnv_init(MachineState *machine)
         pnv_ipmi_bt_init(pnv->isa_bus, pnv->bmc, 10);
     }
 
+    /*
+     * The PNOR is mapped on the LPC FW address space by the BMC.
+     * Since we can not reach the remote BMC machine with LPC memops,
+     * map it always for now.
+     */
+    memory_region_add_subregion(pnv->chips[0]->fw_mr, PNOR_SPI_OFFSET,
+                                &pnv->pnor->mmio);
+
     /*
      * OpenPOWER systems use a IPMI SEL Event message to notify the
      * host to powerdown
@@ -1150,6 +1158,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     qdev_realize(DEVICE(&chip8->lpc), NULL, &error_fatal);
     pnv_xscom_add_subregion(chip, PNV_XSCOM_LPC_BASE, &chip8->lpc.xscom_regs);
 
+    chip->fw_mr = &chip8->lpc.isa_fw;
     chip->dt_isa_nodename = g_strdup_printf("/xscom@%" PRIx64 "/isa@%x",
                                             (uint64_t) PNV_XSCOM_BASE(chip),
                                             PNV_XSCOM_LPC_BASE);
@@ -1479,6 +1488,7 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV9_LPCM_BASE(chip),
                                 &chip9->lpc.xscom_regs);
 
+    chip->fw_mr = &chip9->lpc.isa_fw;
     chip->dt_isa_nodename = g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc@0",
                                             (uint64_t) PNV9_LPCM_BASE(chip));
 
@@ -1592,6 +1602,7 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV10_LPCM_BASE(chip),
                                 &chip10->lpc.xscom_regs);
 
+    chip->fw_mr = &chip10->lpc.isa_fw;
     chip->dt_isa_nodename = g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc@0",
                                             (uint64_t) PNV10_LPCM_BASE(chip));
 }
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index 11739e397b..bcbca3db97 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -824,7 +824,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool use_cpld, Error **errp)
     ISABus *isa_bus;
     qemu_irq *irqs;
     qemu_irq_handler handler;
-    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
 
     /* let isa_bus_new() create its own bridge on SysBus otherwise
      * devices specified on the command line won't find the bus and
@@ -850,11 +849,5 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool use_cpld, Error **errp)
 
     isa_bus_irqs(isa_bus, irqs);
 
-    /*
-     * TODO: Map PNOR on the LPC FW address space on demand ?
-     */
-    memory_region_add_subregion(&lpc->isa_fw, PNOR_SPI_OFFSET,
-                                &pnv->pnor->mmio);
-
     return isa_bus;
 }
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index ee7eda3e01..d69cee17b2 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -58,6 +58,7 @@ struct PnvChip {
     MemoryRegion xscom;
     AddressSpace xscom_as;
 
+    MemoryRegion *fw_mr;
     gchar        *dt_isa_nodename;
 };
 
-- 
2.29.2


