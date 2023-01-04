Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB065DFEC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:23:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBr6-00071i-5z; Wed, 04 Jan 2023 17:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpn-00069e-4J; Wed, 04 Jan 2023 17:02:18 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpd-0003Bf-OB; Wed, 04 Jan 2023 17:02:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AA0457496AC;
 Wed,  4 Jan 2023 22:59:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8F8CE7496AB; Wed,  4 Jan 2023 22:59:37 +0100 (CET)
Message-Id: <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1672868854.git.balaton@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 2/7] mac_{old,new}world: Use local variable instead of
 qdev_get_machine()
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed,  4 Jan 2023 22:59:37 +0100 (CET)
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We already have machine in a local variable so no need to use
qdev_get_machine(), also remove now unneded line break.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 3 +--
 hw/ppc/mac_oldworld.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 601ea518f8..460c14b5e3 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -466,8 +466,7 @@ static void ppc_core99_init(MachineState *machine)
     fw_cfg = FW_CFG(dev);
     qdev_prop_set_uint32(dev, "data_width", 1);
     qdev_prop_set_bit(dev, "dma_enabled", false);
-    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
-                              OBJECT(fw_cfg));
+    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cfg));
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, CFG_ADDR);
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 558c639202..5a7b25a4a8 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -303,8 +303,7 @@ static void ppc_heathrow_init(MachineState *machine)
     fw_cfg = FW_CFG(dev);
     qdev_prop_set_uint32(dev, "data_width", 1);
     qdev_prop_set_bit(dev, "dma_enabled", false);
-    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
-                              OBJECT(fw_cfg));
+    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cfg));
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, CFG_ADDR);
-- 
2.30.6


