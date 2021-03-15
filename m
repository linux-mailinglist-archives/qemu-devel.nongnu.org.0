Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E321833C57B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:24:30 +0100 (CET)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrtF-000135-Sv
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYW-0002CA-JM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYN-0000XL-SM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzAN2TIAtzKIQCHNs4ewubbNW0R4HXiUsBmusDUXPrg=;
 b=d+dwx6JUcyPwbE6XjCmoa1H5qV5cXMR5scUaU2lDDlAk1D5QpPguQboEuctj3OJu2jPSmh
 qVdPvkjcOVlH5DKCSDN7oK70oVgrKPz1/Ka9Lz4f2t14bH1jITC0mb3kCV0Yq/KEB9L3Y0
 OE64eRohkp0m3VsAEm0fC/OPxyhC67o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-V1hCmUDdNmK1-soMiVBpBg-1; Mon, 15 Mar 2021 14:02:52 -0400
X-MC-Unique: V1hCmUDdNmK1-soMiVBpBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5726C108BD0D;
 Mon, 15 Mar 2021 18:02:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC8D96060F;
 Mon, 15 Mar 2021 18:02:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C2FE18007BE; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] hw/usb: Extract VT82C686 UHCI PCI function into a new
 unit
Date: Mon, 15 Mar 2021 19:02:35 +0100
Message-Id: <20210315180240.1597240-9-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Extract the VT82C686 PCI UHCI function into a new unit so
it is only build when the VT82C686 south bridge is selected.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210309190802.830969-4-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-uhci.c          | 23 --------------------
 hw/usb/vt82c686-uhci-pci.c | 43 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                |  1 +
 hw/usb/meson.build         |  1 +
 4 files changed, 45 insertions(+), 23 deletions(-)
 create mode 100644 hw/usb/vt82c686-uhci-pci.c

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index d6338c33d863..0cb02a643214 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1207,21 +1207,6 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
     pci_register_bar(&s->dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &s->io_bar);
 }
 
-static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
-{
-    UHCIState *s = UHCI(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    /* USB misc control 1/2 */
-    pci_set_long(pci_conf + 0x40,0x00001000);
-    /* PM capability */
-    pci_set_long(pci_conf + 0x80,0x00020001);
-    /* USB legacy support  */
-    pci_set_long(pci_conf + 0xc0,0x00002000);
-
-    usb_uhci_common_realize(dev, errp);
-}
-
 static void usb_uhci_exit(PCIDevice *dev)
 {
     UHCIState *s = UHCI(dev);
@@ -1318,14 +1303,6 @@ static UHCIInfo uhci_info[] = {
         .revision  = 0x01,
         .irq_pin   = 3,
         .unplug    = true,
-    },{
-        .name      = "vt82c686b-usb-uhci",
-        .vendor_id = PCI_VENDOR_ID_VIA,
-        .device_id = PCI_DEVICE_ID_VIA_UHCI,
-        .revision  = 0x01,
-        .irq_pin   = 3,
-        .realize   = usb_uhci_vt82c686b_realize,
-        .unplug    = true,
     },{
         .name      = "ich9-usb-uhci1", /* 00:1d.0 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
new file mode 100644
index 000000000000..b109c2160335
--- /dev/null
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -0,0 +1,43 @@
+#include "qemu/osdep.h"
+#include "hcd-uhci.h"
+
+static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
+{
+    UHCIState *s = UHCI(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    /* USB misc control 1/2 */
+    pci_set_long(pci_conf + 0x40, 0x00001000);
+    /* PM capability */
+    pci_set_long(pci_conf + 0x80, 0x00020001);
+    /* USB legacy support  */
+    pci_set_long(pci_conf + 0xc0, 0x00002000);
+
+    usb_uhci_common_realize(dev, errp);
+}
+
+static UHCIInfo uhci_info[] = {
+    {
+        .name      = "vt82c686b-usb-uhci",
+        .vendor_id = PCI_VENDOR_ID_VIA,
+        .device_id = PCI_DEVICE_ID_VIA_UHCI,
+        .revision  = 0x01,
+        .irq_pin   = 3,
+        .realize   = usb_uhci_vt82c686b_realize,
+        .unplug    = true,
+    }
+};
+
+static const TypeInfo vt82c686b_usb_uhci_type_info = {
+    .parent         = TYPE_UHCI,
+    .name           = "vt82c686b-usb-uhci",
+    .class_init     = uhci_data_class_init,
+    .class_data     = uhci_info,
+};
+
+static void vt82c686b_usb_uhci_register_types(void)
+{
+    type_register_static(&vt82c686b_usb_uhci_type_info);
+}
+
+type_init(vt82c686b_usb_uhci_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ca3c9f851f9..b6ab3d25a751 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1180,6 +1180,7 @@ S: Odd Fixes
 F: hw/mips/fuloong2e.c
 F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
+F: hw/usb/vt82c686-uhci-pci.c
 F: include/hw/isa/vt82c686.h
 
 Loongson-3 virtual platforms
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 653192cff6fa..6e3159798e93 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_USB_DWC3', if_true: files('hcd-dwc3.c'))
 softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
+softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
 specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
 
-- 
2.29.2


