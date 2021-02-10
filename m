Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C08315F75
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:27:52 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iyd-000461-2F
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip6-0001d0-Bs; Wed, 10 Feb 2021 01:18:00 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:35715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip3-0000ME-OH; Wed, 10 Feb 2021 01:17:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gm5Ttnz9sW5; Wed, 10 Feb 2021 17:17:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937860;
 bh=kta8DAjjj3gDwVJcwqU1hmnwFBmqS5CY5jA28QoXg04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pNHSKYAFR0/tJVb35jThF/LYe6yU1LT2F66c+E2J/I0THGrqR0VycKYdDE5ZyijUt
 xf23WeONc3epn3TntrjaNPQkZUFdiB1LUbUuexRME8V2fyuHBy1tI2BnucFVrW5/RP
 /gh/Fc9s6ArtZuC8YS9imfGCCP19js3jNCRDPVJg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 10/19] ppc/pnv: Remove default disablement of the PNOR contents
Date: Wed, 10 Feb 2021 17:17:26 +1100
Message-Id: <20210210061735.304384-11-david@gibson.dropbear.id.au>
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

On PowerNV systems, the BMC is in charge of mapping the PNOR contents
on the LPC FW address space using the HIOMAP protocol. Under QEMU, we
emulate this behavior and we also add an extra control on the flash
accesses by letting the HIOMAP command handler decide whether the
memory region is accessible or not depending on the firmware requests.

However, this behavior is not compatible with hostboot like firmwares
which need this mapping to be always available. For this reason, the
PNOR memory region is initially disabled for skiboot mode only.

This is badly placed under the LPC model and requires the use of the
machine. Since it doesn't add much, simply remove the initial setting.
The extra control in the HIOMAP command handler will still be performed.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210126171059.307867-7-clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_lpc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index 5903590220..11739e397b 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -825,7 +825,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool use_cpld, Error **errp)
     qemu_irq *irqs;
     qemu_irq_handler handler;
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
-    bool hostboot_mode = !!pnv->fw_load_addr;
 
     /* let isa_bus_new() create its own bridge on SysBus otherwise
      * devices specified on the command line won't find the bus and
@@ -856,13 +855,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool use_cpld, Error **errp)
      */
     memory_region_add_subregion(&lpc->isa_fw, PNOR_SPI_OFFSET,
                                 &pnv->pnor->mmio);
-    /*
-     * Start disabled. The HIOMAP protocol will activate the mapping
-     * with HIOMAP_C_CREATE_WRITE_WINDOW
-     */
-    if (!hostboot_mode) {
-        memory_region_set_enabled(&pnv->pnor->mmio, false);
-    }
 
     return isa_bus;
 }
-- 
2.29.2


