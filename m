Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB256531BD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:28:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynn-0006ZA-62; Wed, 21 Dec 2022 08:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynS-00062V-9X
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynQ-0004O8-B5
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KtEaU7ZUdfH7aiyHY0WN2NywOP43io4TlcNXxYcdxak=;
 b=dzLtSkF9WSt8tOwBvj9IcMjIoct4NjcH8tHUlKOGTIKxvLABkPzhn/8KzcIw/p4PHEVmRH
 WqhD3GDKi/cN61nfauvRQ0SegBuAZw+5WaqAIuO1qgeMMqmlrWVKRscAfgMq0laS6/epAr
 lmrv51Ja+zANkjbo8r92FbWMXXbvCKg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-G1S7oZc4MIajXo0bQlZYdQ-1; Wed, 21 Dec 2022 08:06:05 -0500
X-MC-Unique: G1S7oZc4MIajXo0bQlZYdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so4303690wma.6
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtEaU7ZUdfH7aiyHY0WN2NywOP43io4TlcNXxYcdxak=;
 b=ZCxRt1HSb8wPleLhnKs5OXtZ5ziS96zf2I8TF84vT8Wf7XslLth+3MKXbVthz+DmZt
 tYAfz0ShaDkY7Va3u8QMgHYv9E87+3MXJF3R3Q8ULyzluEBKYQs+fNdvtVAGoVCYJd04
 K7ceyNx4MxEb5EQb9O+XnGA6HIhP1ALkK1mW65l3zszwuSjr5cTUWuML7gZ04HCvQ6MA
 BgVL78xJlZduklT/nmHQj7s4Fsj7ikuDKo4eVwaSVc1yuVMl3bp+Mk7ZlCvBuiobajRM
 pzY0iJ74Nl+FkY/O9b05S73zjXmTXTG1awlV2RsgPZOunHevZ/E8Yanu33qHQmnfshL6
 UbOw==
X-Gm-Message-State: AFqh2kq1syxGT80IZe7wcDzSLZ+sWakdkbtRsLF+CjAOfGV8ixebx4eE
 F4llbScxuq1jmFb9/N0cujx4yBzyoyeSLEpjz+mHcw8/eMKcdryOH/p0nzsatxu0wID4fYtl1SP
 OoBZtCdcPnmoOTKmHmrn5mkBKDam8YK0zOuAk+vykhl8MTuNTq9N4q+sc8JBC
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id
 y4-20020a1c4b04000000b003c6f0b874e6mr1662082wma.4.1671627963591; 
 Wed, 21 Dec 2022 05:06:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZNscTFIVPxAaAXktTT1jesJ7wDunxLKU7jpI5kMRRRaaQBoasaeIK7FevYuVanmoMLROHEA==
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id
 y4-20020a1c4b04000000b003c6f0b874e6mr1662052wma.4.1671627963245; 
 Wed, 21 Dec 2022 05:06:03 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056000108500b0023657e1b980sm15384215wrw.53.2022.12.21.05.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:02 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org
Subject: [PULL 28/41] remove DEC 21154 PCI bridge
Message-ID: <20221221130339.1234592-29-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

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
Message-Id: <20221129101341.185621-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/dec.h       |   9 ---
 include/hw/pci/pci_ids.h  |   1 -
 hw/pci-bridge/dec.c       | 164 --------------------------------------
 hw/pci-host/uninorth.c    |   9 +--
 hw/pci-bridge/meson.build |   2 -
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
 
-- 
MST


