Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BE203524
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 12:54:50 +0200 (CEST)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnK6D-0000BD-FK
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 06:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnJv5-0007eK-Nk
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:43:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29417
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnJuw-0005PZ-Hx
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592822588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Anw6eNfwwT4QFHzvBoTnJ7slmXYArw8lveXY2DPWAYI=;
 b=WP23aa6cbkNqg8jgC0LTMnXkOmh3qVqcisFI15coVnBhYO3Ai2Tc1dMawPVV1h4V2kTXHJ
 wCfPVNKJ/zhac1wfuFwTuhkLH4jydrnvuQHM56xPqr8uFwKPq8bJmnyuLql5ciD77a/QT1
 kh65GOqCCwi3xociYVA0DC8IMK9KElA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-jSK6n2K6Oj-BtN6fHpqa6A-1; Mon, 22 Jun 2020 06:43:04 -0400
X-MC-Unique: jSK6n2K6Oj-BtN6fHpqa6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43168EC1A0;
 Mon, 22 Jun 2020 10:43:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 394667167C;
 Mon, 22 Jun 2020 10:42:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A84E113847E; Mon, 22 Jun 2020 12:42:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] hw: Fix error API violation around
 object_property_set_link()
Date: Mon, 22 Jun 2020 12:42:44 +0200
Message-Id: <20200622104250.1404835-17-armbru@redhat.com>
In-Reply-To: <20200622104250.1404835-1-armbru@redhat.com>
References: <20200622104250.1404835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Auger <eric.auger@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

virtio_gpu_pci_base_realize(), virtio_vga_base_realize(),
sparc32_ledma_device_realize(), sparc32_dma_realize(),
sparc32_dma_realize() xilinx_axidma_realize(), mips_cps_realize(),
macio_realize_ide(), xilinx_enet_realize(), and
virtio_iommu_pci_realize() are wrong that way: they reuse the argument
they pass to object_property_set_link() for another call.

Harmless, because object_property_set_link() can't actually fail for
them: it fails when the property doesn't exist, is not settable, or
its .check() method fails.  Fix by passing &error_abort instead.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/display/virtio-gpu-pci.c  |  2 +-
 hw/display/virtio-vga.c      |  2 +-
 hw/dma/sparc32_dma.c         |  6 +++---
 hw/dma/xilinx_axidma.c       | 12 ++----------
 hw/mips/cps.c                |  6 ++++--
 hw/misc/macio/macio.c        |  3 ++-
 hw/net/xilinx_axienet.c      | 12 ++----------
 hw/virtio/virtio-iommu-pci.c |  2 +-
 8 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index b532fe8b5f..41b88b878d 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -44,7 +44,7 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     for (i = 0; i < g->conf.max_outputs; i++) {
         object_property_set_link(OBJECT(g->scanout[i].con),
                                  OBJECT(vpci_dev),
-                                 "device", errp);
+                                 "device", &error_abort);
     }
 }
 
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 68a062ece6..67f409e106 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -154,7 +154,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     for (i = 0; i < g->conf.max_outputs; i++) {
         object_property_set_link(OBJECT(g->scanout[i].con),
                                  OBJECT(vpci_dev),
-                                 "device", errp);
+                                 "device", &error_abort);
     }
 }
 
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index f02aca6f40..2d7dbbb92d 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -346,7 +346,7 @@ static void sparc32_ledma_device_realize(DeviceState *dev, Error **errp)
     d = qdev_new(TYPE_LANCE);
     object_property_add_child(OBJECT(dev), "lance", OBJECT(d));
     qdev_set_nic_properties(d, nd);
-    object_property_set_link(OBJECT(d), OBJECT(dev), "dma", errp);
+    object_property_set_link(OBJECT(d), OBJECT(dev), "dma", &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(d), &error_fatal);
 }
 
@@ -379,7 +379,7 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
     }
 
     espdma = qdev_new(TYPE_SPARC32_ESPDMA_DEVICE);
-    object_property_set_link(OBJECT(espdma), iommu, "iommu", errp);
+    object_property_set_link(OBJECT(espdma), iommu, "iommu", &error_abort);
     object_property_add_child(OBJECT(s), "espdma", OBJECT(espdma));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(espdma), &error_fatal);
 
@@ -394,7 +394,7 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
                                 sysbus_mmio_get_region(sbd, 0));
 
     ledma = qdev_new(TYPE_SPARC32_LEDMA_DEVICE);
-    object_property_set_link(OBJECT(ledma), iommu, "iommu", errp);
+    object_property_set_link(OBJECT(ledma), iommu, "iommu", &error_abort);
     object_property_add_child(OBJECT(s), "ledma", OBJECT(ledma));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(ledma), &error_fatal);
 
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 6a9df2c4db..a069637bf2 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -537,7 +537,6 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
     XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
     XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
                                                             &s->rx_control_dev);
-    Error *local_err = NULL;
     int i;
 
     object_property_add_link(OBJECT(ds), "dma", TYPE_XILINX_AXI_DMA,
@@ -548,11 +547,8 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
                              (Object **)&cs->dma,
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG);
-    object_property_set_link(OBJECT(ds), OBJECT(s), "dma", &local_err);
-    object_property_set_link(OBJECT(cs), OBJECT(s), "dma", &local_err);
-    if (local_err) {
-        goto xilinx_axidma_realize_fail;
-    }
+    object_property_set_link(OBJECT(ds), OBJECT(s), "dma", &error_abort);
+    object_property_set_link(OBJECT(cs), OBJECT(s), "dma", &error_abort);
 
     for (i = 0; i < 2; i++) {
         struct Stream *st = &s->streams[i];
@@ -567,10 +563,6 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
 
     address_space_init(&s->as,
                        s->dma_mr ? s->dma_mr : get_system_memory(), "dma");
-    return;
-
-xilinx_axidma_realize_fail:
-    error_propagate(errp, local_err);
 }
 
 static void xilinx_axidma_init(Object *obj)
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index cdfab19826..5382bc86f7 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -150,8 +150,10 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     object_property_set_int(OBJECT(&s->gcr), s->num_vp, "num-vp", &err);
     object_property_set_int(OBJECT(&s->gcr), 0x800, "gcr-rev", &err);
     object_property_set_int(OBJECT(&s->gcr), gcr_base, "gcr-base", &err);
-    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->gic.mr), "gic", &err);
-    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->cpc.mr), "cpc", &err);
+    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->gic.mr), "gic",
+                             &error_abort);
+    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->cpc.mr), "cpc",
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->gcr), &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 8ba7af073c..3251c79f46 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -136,7 +136,8 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
     sysbus_connect_irq(sysbus_dev, 0, irq0);
     sysbus_connect_irq(sysbus_dev, 1, irq1);
     qdev_prop_set_uint32(DEVICE(ide), "channel", dmaid);
-    object_property_set_link(OBJECT(ide), OBJECT(&s->dbdma), "dbdma", errp);
+    object_property_set_link(OBJECT(ide), OBJECT(&s->dbdma), "dbdma",
+                             &error_abort);
     macio_ide_register_dma(ide);
 
     qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index c2f40b8ea9..679a359f9a 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -980,7 +980,6 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
     XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
     XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
                                                             &s->rx_control_dev);
-    Error *local_err = NULL;
 
     object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
                              (Object **) &ds->enet,
@@ -990,11 +989,8 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
                              (Object **) &cs->enet,
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG);
-    object_property_set_link(OBJECT(ds), OBJECT(s), "enet", &local_err);
-    object_property_set_link(OBJECT(cs), OBJECT(s), "enet", &local_err);
-    if (local_err) {
-        goto xilinx_enet_realize_fail;
-    }
+    object_property_set_link(OBJECT(ds), OBJECT(s), "enet", &error_abort);
+    object_property_set_link(OBJECT(cs), OBJECT(s), "enet", &error_abort);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xilinx_enet_info, &s->conf,
@@ -1008,10 +1004,6 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
 
     s->rxmem = g_malloc(s->c_rxmem);
     s->txmem = g_malloc(s->c_txmem);
-    return;
-
-xilinx_enet_realize_fail:
-    error_propagate(errp, local_err);
 }
 
 static void xilinx_enet_init(Object *obj)
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 632533abaf..bd61d6e2f8 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -56,7 +56,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     }
     object_property_set_link(OBJECT(dev),
                              OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
-                             "primary-bus", errp);
+                             "primary-bus", &error_abort);
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
-- 
2.26.2


