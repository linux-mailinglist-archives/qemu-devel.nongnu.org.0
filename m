Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215D519BB8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:31:25 +0200 (CEST)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBLw-00028c-J9
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBH8-0007Qw-UA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBH7-0003xg-FZ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:26 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBG9-0002VG-8B; Wed, 04 May 2022 10:25:29 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:12 +0100
Message-Id: <20220504092600.10048-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 02/50] dino: move registers from dino_init() to
 DINO_PCI_BRIDGE init function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/dino.c | 44 +++++++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 4031cfb7f0..9401b68ff7 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -526,21 +526,6 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     s->iar0 = s->iar1 = CPU_HPA + 3;
     s->toc_addr = 0xFFFA0030; /* IO_COMMAND of CPU */
 
-    /* Dino PCI access from main memory.  */
-    memory_region_init_io(&s->this_mem, OBJECT(s), &dino_chip_ops,
-                          s, "dino", 4096);
-    memory_region_add_subregion(addr_space, DINO_HPA, &s->this_mem);
-
-    /* Dino PCI config. */
-    memory_region_init_io(&s->parent_obj.conf_mem, OBJECT(&s->parent_obj),
-                          &dino_config_addr_ops, dev, "pci-conf-idx", 4);
-    memory_region_init_io(&s->parent_obj.data_mem, OBJECT(&s->parent_obj),
-                          &dino_config_data_ops, dev, "pci-conf-data", 4);
-    memory_region_add_subregion(&s->this_mem, DINO_PCI_CONFIG_ADDR,
-                                &s->parent_obj.conf_mem);
-    memory_region_add_subregion(&s->this_mem, DINO_CONFIG_DATA,
-                                &s->parent_obj.data_mem);
-
     /* Dino PCI bus memory.  */
     memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 4 * GiB);
 
@@ -550,6 +535,9 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     s->parent_obj.bus = b;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
+    memory_region_add_subregion(addr_space, DINO_HPA,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
+
     /* Set up windows into PCI bus memory.  */
     for (i = 1; i < 31; i++) {
         uint32_t addr = 0xf0000000 + i * DINO_MEM_CHUNK_SIZE;
@@ -588,6 +576,31 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     return b;
 }
 
+static void dino_pcihost_init(Object *obj)
+{
+    DinoState *s = DINO_PCI_HOST_BRIDGE(obj);
+    PCIHostState *phb = PCI_HOST_BRIDGE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    /* Dino PCI access from main memory.  */
+    memory_region_init_io(&s->this_mem, OBJECT(s), &dino_chip_ops,
+                          s, "dino", 4096);
+
+    /* Dino PCI config. */
+    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
+                          &dino_config_addr_ops, DEVICE(s),
+                          "pci-conf-idx", 4);
+    memory_region_init_io(&phb->data_mem, OBJECT(phb),
+                          &dino_config_data_ops, DEVICE(s),
+                          "pci-conf-data", 4);
+    memory_region_add_subregion(&s->this_mem, DINO_PCI_CONFIG_ADDR,
+                                &phb->conf_mem);
+    memory_region_add_subregion(&s->this_mem, DINO_CONFIG_DATA,
+                                &phb->data_mem);
+
+    sysbus_init_mmio(sbd, &s->this_mem);
+}
+
 static void dino_pcihost_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -598,6 +611,7 @@ static void dino_pcihost_class_init(ObjectClass *klass, void *data)
 static const TypeInfo dino_pcihost_info = {
     .name          = TYPE_DINO_PCI_HOST_BRIDGE,
     .parent        = TYPE_PCI_HOST_BRIDGE,
+    .instance_init = dino_pcihost_init,
     .instance_size = sizeof(DinoState),
     .class_init    = dino_pcihost_class_init,
 };
-- 
2.20.1


