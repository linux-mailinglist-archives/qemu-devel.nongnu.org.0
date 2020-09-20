Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C172712DF
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 10:24:26 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJue1-0008F7-6C
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 04:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJual-0003pj-16; Sun, 20 Sep 2020 04:21:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56576
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJuaj-0003vI-Ah; Sun, 20 Sep 2020 04:21:02 -0400
Received: from host81-154-161-117.range81-154.btcentralplus.com
 ([81.154.161.117] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kJubF-0006Dn-IG; Sun, 20 Sep 2020 09:21:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: armbru@redhat.com, david@gibson.dropbear.id.au, atar4qemu@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Sun, 20 Sep 2020 09:20:18 +0100
Message-Id: <20200920082018.16135-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920082018.16135-1-mark.cave-ayland@ilande.co.uk>
References: <20200920082018.16135-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.161.117
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 6/6] sabre: don't call sysbus_mmio_map() in sabre_realize()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device should not map itself but instead should be mapped to sysbus by the
sun4u machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci-host/sabre.c | 8 --------
 hw/sparc64/sun4u.c  | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
index 5ac6283623..5394ad5cd0 100644
--- a/hw/pci-host/sabre.c
+++ b/hw/pci-host/sabre.c
@@ -378,16 +378,8 @@ static void sabre_realize(DeviceState *dev, Error **errp)
 {
     SabreState *s = SABRE(dev);
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
     PCIDevice *pci_dev;
 
-    /* sabre_config */
-    sysbus_mmio_map(sbd, 0, s->special_base);
-    /* PCI configuration space */
-    sysbus_mmio_map(sbd, 1, s->special_base + 0x1000000ULL);
-    /* pci_ioport */
-    sysbus_mmio_map(sbd, 2, s->special_base + 0x2000000ULL);
-
     memory_region_init(&s->pci_mmio, OBJECT(s), "pci-mmio", 0x100000000ULL);
     memory_region_add_subregion(get_system_memory(), s->mem_base,
                                 &s->pci_mmio);
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index b4aabfc076..f80ddde5dc 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -592,6 +592,13 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
                              &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(sabre), &error_fatal);
 
+    /* sabre_config */
+    sysbus_mmio_map(SYS_BUS_DEVICE(sabre), 0, PBM_SPECIAL_BASE);
+    /* PCI configuration space */
+    sysbus_mmio_map(SYS_BUS_DEVICE(sabre), 1, PBM_SPECIAL_BASE + 0x1000000ULL);
+    /* pci_ioport */
+    sysbus_mmio_map(SYS_BUS_DEVICE(sabre), 2, PBM_SPECIAL_BASE + 0x2000000ULL);
+
     /* Wire up PCI interrupts to CPU */
     for (i = 0; i < IVEC_MAX; i++) {
         qdev_connect_gpio_out_named(DEVICE(sabre), "ivec-irq", i,
-- 
2.20.1


