Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD2613ED6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbBx-0007fq-VJ; Mon, 31 Oct 2022 16:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBv-0007db-Ve; Mon, 31 Oct 2022 16:15:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBt-0000ji-Lz; Mon, 31 Oct 2022 16:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BcQWcJ8ZXDwC4gCuiLb2NZ74ZtI95D38mrxv5HNu1aA=; b=Ioy9YoROlC29uqn++XVPgMd9kr
 IgXB5br9hh80yZjqZJlhSsK3JsvT5DYOdEfwz2IrpP6E6c5KXvv1A/Dei51fYKfJt8ZEhi8rbojub
 oUI8wLgam8JYrBTAPGJUSqdgyNno21ZSLFBJElqQKPVCpEBCEzkDpjxQVt1qbe8afsoLeQ3GBCCj8
 xwW45bjyuo2M2loR8AnyPvTs6pG90+M/iFXkTgYmgIMmmts2YhpZ4YvhWO3Up0DwtX83tPSpMFhX6
 whNQFM+zzTGhj7MWM2t71rgye41A5fUA83OxEskjDfNosGZZ19+JOfuxQv5Urfclr4B7Rhf/K9jVR
 aUN90g2WTP9kLjUuUZSA1GWnbE5w9UXNAeDSuznucTEWU8oGjJKItGuWJ2+8O02l7CivaXsdLLQq8
 dojN7eNsnHCWb4pdRvMxg3Jw2ZHq518p70/XqfH8hKnbeBUc60kTZwFhRz3rGHyL77rMIm4FcYcaq
 pzFYLJArOBP8f6cFqH5cuWIr1rjZxbsBQAmmhS+CXoP9jRV44gVYpJ4SaJ3mcc/CWT9qBEQuxQUcl
 ghYfpWK83dLZKIA5RAasda90pih7XhE6zPPpkcwePsnxx2oy+TDlw02ldnRQqQ+mvHuh+nm3ujfZP
 kcNTGCDHlCInMTdecf22bis2QdocN5+idr+IbL8sk=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBn-0003Dd-SW; Mon, 31 Oct 2022 20:15:20 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:26 +0000
Message-Id: <20221031201435.677168-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 05/14] mac_newworld: Clean up creation of Uninorth devices
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Map regions in ascending order and reorganise code a bit to avoid some
casts and move Uninorth parts together.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <a6263b23757dd4a1e1b17a9aa9fb87115f3a1e71.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 6bc3bd19be..e2f456b547 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -228,13 +228,6 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
-    /* UniN init */
-    dev = qdev_new(TYPE_UNI_NORTH);
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), 0xf8000000,
-                                sysbus_mmio_get_region(s, 0));
-
     openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
     for (i = 0; i < machine->smp.cpus; i++) {
         /* Mac99 IRQ connection between OpenPIC outputs pins
@@ -275,24 +268,30 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
+    /* UniN init */
+    s = SYS_BUS_DEVICE(qdev_new(TYPE_UNI_NORTH));
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), 0xf8000000,
+                                sysbus_mmio_get_region(s, 0));
+
     if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
+        machine_arch = ARCH_MAC99_U3;
         /* 970 gets a U3 bus */
         /* Uninorth AGP bus */
         dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
         s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_mmio_map(s, 0, 0xf0800000);
+        sysbus_mmio_map(s, 1, 0xf0c00000);
         /* PCI hole */
-        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
+        memory_region_add_subregion(get_system_memory(), 0x80000000,
                                     sysbus_mmio_get_region(s, 2));
         /* Register 8 MB of ISA IO space */
         memory_region_add_subregion(get_system_memory(), 0xf2000000,
                                     sysbus_mmio_get_region(s, 3));
-        sysbus_mmio_map(s, 0, 0xf0800000);
-        sysbus_mmio_map(s, 1, 0xf0c00000);
-
-        machine_arch = ARCH_MAC99_U3;
     } else {
+        machine_arch = ARCH_MAC99;
         /* Use values found on a real PowerMac */
         /* Uninorth AGP bus */
         uninorth_agp_dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
@@ -309,22 +308,20 @@ static void ppc_core99_init(MachineState *machine)
         sysbus_mmio_map(s, 0, 0xf4800000);
         sysbus_mmio_map(s, 1, 0xf4c00000);
 
-        /* Uninorth main bus */
+        /* Uninorth main bus - this must be last to make it the default */
         dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
         qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
         s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        sysbus_mmio_map(s, 0, 0xf2800000);
+        sysbus_mmio_map(s, 1, 0xf2c00000);
         /* PCI hole */
-        memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
+        memory_region_add_subregion(get_system_memory(), 0x80000000,
                                     sysbus_mmio_get_region(s, 2));
         /* Register 8 MB of ISA IO space */
         memory_region_add_subregion(get_system_memory(), 0xf2000000,
                                     sysbus_mmio_get_region(s, 3));
-        sysbus_mmio_map(s, 0, 0xf2800000);
-        sysbus_mmio_map(s, 1, 0xf2c00000);
-
-        machine_arch = ARCH_MAC99;
     }
 
     machine->usb |= defaults_enabled() && !machine->usb_disabled;
-- 
2.30.2


