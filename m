Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668C15E932F
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:47:19 +0200 (CEST)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocR2U-0002Hu-HU
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQtl-0006CX-Py; Sun, 25 Sep 2022 08:38:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQtk-0007L2-5n; Sun, 25 Sep 2022 08:38:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 548A675A16B;
 Sun, 25 Sep 2022 14:38:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 36F1575A16A; Sun, 25 Sep 2022 14:38:12 +0200 (CEST)
Message-Id: <f6b0aa3528e9bd538c7111cd29e89a0c3623fbe5.1664108862.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664108862.git.balaton@eik.bme.hu>
References: <cover.1664108862.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 05/13] mac_oldworld: Do not open code sysbus_mmio_map()
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sun, 25 Sep 2022 14:38:12 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_oldworld.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index cb67e44081..75fbd2a7df 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -218,16 +218,12 @@ static void ppc_heathrow_init(MachineState *machine)
     qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
     s = SYS_BUS_DEVICE(grackle_dev);
     sysbus_realize_and_unref(s, &error_fatal);
-
     sysbus_mmio_map(s, 0, GRACKLE_BASE);
     sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
     /* PCI hole */
-    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
-                                sysbus_mmio_get_region(s, 2));
+    sysbus_mmio_map(s, 2, 0x80000000);
     /* Register 2 MB of ISA IO space */
-    memory_region_add_subregion(get_system_memory(), 0xfe000000,
-                                sysbus_mmio_get_region(s, 3));
-
+    sysbus_mmio_map(s, 3, 0xfe000000);
     pci_bus = PCI_HOST_BRIDGE(grackle_dev)->bus;
 
     /* MacIO */
-- 
2.30.4


