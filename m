Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16763BDC1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:15:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozxch-0001FM-JO; Tue, 29 Nov 2022 05:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ozxcf-0001Eg-MZ
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ozxcc-0005Cn-GP
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669716829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJ+1lNqyeoKHXCxyA47Aw+3CR6RToV/Jhj3jvHQVxzw=;
 b=LOsDUBPzcFF8FJtsy/mVAZ/tAomI9644mCnffz2y+drXvNJT9RzSDF5nXofpd8/DCd+dXq
 nzWqZDcIX3RqQIi/brwDFIwNsC/nNBlySQpR8u9mz9e80mdIOOYQ7odKttwX4C/fMEzISD
 0EaHYLxWgyjhXwYoXqe+ulqlBjyyjvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-9PbgqZW-MXq23aSgWCg0Kg-1; Tue, 29 Nov 2022 05:13:47 -0500
X-MC-Unique: 9PbgqZW-MXq23aSgWCg0Kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 094C4811E75;
 Tue, 29 Nov 2022 10:13:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24D4D2024CBE;
 Tue, 29 Nov 2022 10:13:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 for-8.0 1/2] remove DEC 21154 PCI bridge
Date: Tue, 29 Nov 2022 11:13:40 +0100
Message-Id: <20221129101341.185621-2-imammedo@redhat.com>
In-Reply-To: <20221129101341.185621-1-imammedo@redhat.com>
References: <20221129101341.185621-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Code has not been used practically since its inception (2004)
  f2aa58c6f4a20 UniNorth PCI bridge support
or maybe even earlier, but it was consuming contributors time
as QEMU was being rewritten.
Drop it for now. Whomever would like to actually
use the thing, can make sure it actually works/reintroduce
it back when there is a user.

PS:
I've stumbled upon this when replacing PCIDeviceClass::is_bridge
field with QOM cast to PCI_BRIDGE type. Unused DEC 21154
was the only one trying to use the field with plain PCIDevice.
It's not worth keeping the field around for the sake of the code
that was commented out 'forever'.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  (BALATON Zoltan <balaton@eik.bme.hu>)
    - leave reminder about removed bridge so it would be easier to find
      commit that removed it
---
 hw/pci-bridge/dec.h       |   9 ---
 include/hw/pci/pci_ids.h  |   1 -
 hw/pci-bridge/dec.c       | 164 --------------------------------------
 hw/pci-bridge/meson.build |   2 -
 hw/pci-host/uninorth.c    |   9 +--
 5 files changed, 4 insertions(+), 181 deletions(-)
 delete mode 100644 hw/pci-bridge/dec.h
 delete mode 100644 hw/pci-bridge/dec.c

diff --git a/hw/pci-bridge/dec.h b/hw/pci-bridge/dec.h
deleted file mode 100644
index 869e90b136..0000000000
--- a/hw/pci-bridge/dec.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef HW_PCI_BRIDGE_DEC_H
-#define HW_PCI_BRIDGE_DEC_H
-
-
-#define TYPE_DEC_21154 "dec-21154-sysbus"
-
-PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn);
-
-#endif
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index bc9f834fd1..e4386ebb20 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -169,7 +169,6 @@
 
 #define PCI_VENDOR_ID_DEC                0x1011
 #define PCI_DEVICE_ID_DEC_21143          0x0019
-#define PCI_DEVICE_ID_DEC_21154          0x0026
 
 #define PCI_VENDOR_ID_CIRRUS             0x1013
 
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
deleted file mode 100644
index 4773d07e6d..0000000000
--- a/hw/pci-bridge/dec.c
+++ /dev/null
@@ -1,164 +0,0 @@
-/*
- * QEMU DEC 21154 PCI bridge
- *
- * Copyright (c) 2006-2007 Fabrice Bellard
- * Copyright (c) 2007 Jocelyn Mayer
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "dec.h"
-#include "hw/sysbus.h"
-#include "qapi/error.h"
-#include "qemu/module.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pci_host.h"
-#include "hw/pci/pci_bridge.h"
-#include "hw/pci/pci_bus.h"
-#include "qom/object.h"
-
-OBJECT_DECLARE_SIMPLE_TYPE(DECState, DEC_21154)
-
-struct DECState {
-    PCIHostState parent_obj;
-};
-
-static int dec_map_irq(PCIDevice *pci_dev, int irq_num)
-{
-    return irq_num;
-}
-
-static void dec_pci_bridge_realize(PCIDevice *pci_dev, Error **errp)
-{
-    pci_bridge_initfn(pci_dev, TYPE_PCI_BUS);
-}
-
-static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    k->realize = dec_pci_bridge_realize;
-    k->exit = pci_bridge_exitfn;
-    k->vendor_id = PCI_VENDOR_ID_DEC;
-    k->device_id = PCI_DEVICE_ID_DEC_21154;
-    k->config_write = pci_bridge_write_config;
-    k->is_bridge = true;
-    dc->desc = "DEC 21154 PCI-PCI bridge";
-    dc->reset = pci_bridge_reset;
-    dc->vmsd = &vmstate_pci_device;
-}
-
-static const TypeInfo dec_21154_pci_bridge_info = {
-    .name          = "dec-21154-p2p-bridge",
-    .parent        = TYPE_PCI_BRIDGE,
-    .instance_size = sizeof(PCIBridge),
-    .class_init    = dec_21154_pci_bridge_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn)
-{
-    PCIDevice *dev;
-    PCIBridge *br;
-
-    dev = pci_new_multifunction(devfn, false, "dec-21154-p2p-bridge");
-    br = PCI_BRIDGE(dev);
-    pci_bridge_map_irq(br, "DEC 21154 PCI-PCI bridge", dec_map_irq);
-    pci_realize_and_unref(dev, parent_bus, &error_fatal);
-    return pci_bridge_get_sec_bus(br);
-}
-
-static void pci_dec_21154_device_realize(DeviceState *dev, Error **errp)
-{
-    PCIHostState *phb;
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-
-    phb = PCI_HOST_BRIDGE(dev);
-
-    memory_region_init_io(&phb->conf_mem, OBJECT(dev), &pci_host_conf_le_ops,
-                          dev, "pci-conf-idx", 0x1000);
-    memory_region_init_io(&phb->data_mem, OBJECT(dev), &pci_host_data_le_ops,
-                          dev, "pci-data-idx", 0x1000);
-    sysbus_init_mmio(sbd, &phb->conf_mem);
-    sysbus_init_mmio(sbd, &phb->data_mem);
-}
-
-static void dec_21154_pci_host_realize(PCIDevice *d, Error **errp)
-{
-    /* PCI2PCI bridge same values as PearPC - check this */
-}
-
-static void dec_21154_pci_host_class_init(ObjectClass *klass, void *data)
-{
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    k->realize = dec_21154_pci_host_realize;
-    k->vendor_id = PCI_VENDOR_ID_DEC;
-    k->device_id = PCI_DEVICE_ID_DEC_21154;
-    k->revision = 0x02;
-    k->class_id = PCI_CLASS_BRIDGE_PCI;
-    k->is_bridge = true;
-    /*
-     * PCI-facing part of the host bridge, not usable without the
-     * host-facing part, which can't be device_add'ed, yet.
-     */
-    dc->user_creatable = false;
-}
-
-static const TypeInfo dec_21154_pci_host_info = {
-    .name          = "dec-21154",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
-    .class_init    = dec_21154_pci_host_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-static void pci_dec_21154_device_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = pci_dec_21154_device_realize;
-}
-
-static const TypeInfo pci_dec_21154_device_info = {
-    .name          = TYPE_DEC_21154,
-    .parent        = TYPE_PCI_HOST_BRIDGE,
-    .instance_size = sizeof(DECState),
-    .class_init    = pci_dec_21154_device_class_init,
-};
-
-static void dec_register_types(void)
-{
-    type_register_static(&pci_dec_21154_device_info);
-    type_register_static(&dec_21154_pci_host_info);
-    type_register_static(&dec_21154_pci_bridge_info);
-}
-
-type_init(dec_register_types)
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index 243ceeda50..fe92d43de6 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -8,8 +8,6 @@ pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'),
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
 pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c', 'cxl_downstream.c'))
 
-# NewWorld PowerMac
-pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
 # Sun4u
 pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
 
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index aebd44d265..8396c91d59 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -128,11 +128,10 @@ static void pci_unin_main_realize(DeviceState *dev, Error **errp)
 
     pci_create_simple(h->bus, PCI_DEVFN(11, 0), "uni-north-pci");
 
-    /* DEC 21154 bridge */
-#if 0
-    /* XXX: not activated as PPC BIOS doesn't handle multiple buses properly */
-    pci_create_simple(h->bus, PCI_DEVFN(12, 0), "dec-21154");
-#endif
+    /*
+     * DEC 21154 bridge was unused for many years, this comment is
+     * a placeholder for whoever wishes to resurrect it
+     */
 }
 
 static void pci_unin_main_init(Object *obj)
-- 
2.31.1


