Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DDF332FCE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:22:34 +0100 (CET)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJisD-000463-F0
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiS-0005ju-Iv
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:24 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJhiQ-00010s-U4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:08:24 -0500
Received: by mail-ed1-x535.google.com with SMTP id x9so22443448edd.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 11:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JlWRzP7BEt7P68aDoGigCLgcJlZLTJDqyDnSuE3SPXE=;
 b=G14L+VoIPwURp8R0lB3ymUTv2j79m52/BMzNQZK1nsH2t6FzItEz0rpVmUetYkxwFw
 MpvLcUcWGaannciMJJPaul9XIZl8t+kD0yF5+nzqjO+IWII86yecKg3xsHgHvhAxwkr4
 2yBV0sTmrwOje7AAq/sf42z0go4tzVE1PMwND44avkWWnpjumXHODh8swKthzgPvdO/K
 aYwLInj/899KpiJ6mj1cxUgU/WpFV/WjjKu9R7gZKfcoJ+eJgkWFo0+KxjUcKOL01TDB
 8pz/GtByuv+96Gd81/AKfWy76WRDOfEcI9XlVwDKp3jzmpoWV/5doWLazyDMn4Vi5/Qv
 FWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JlWRzP7BEt7P68aDoGigCLgcJlZLTJDqyDnSuE3SPXE=;
 b=L01kbzgWLWDPB8Bzzm+j1KsUgSoiGNUXl6ucyNqGiMqonWRF7aoScKlQSomB3hCMOk
 a5ip6jmW0Ivgn84/WTU3YILVQ9uHI/38Ay5sDSWsVoAYGdwrj4UUEyA8LvkOzwRZgATG
 zKumfDlgP1pyrbv8zfXAlttx6luKGYlEovMBp8F+FffSTFLXKw4vzq03a57i1kOWXUq7
 DEEh1zWmVri/ZAcN3x4/0IsHH91acp1Txarv/cFFFn/Q1dhcZ7q12XoGuDh7dqSUCW3N
 s/1N+c6kt4ouThs4Q6nh8oe2qsUmlL1V7kFtfhyMqDtfa/tnILvI4v/2r4R6JFVnc6/x
 bI2g==
X-Gm-Message-State: AOAM532x01lFgoECsST0F1OLoS1yycn8EP9hRdO1MbJ3zTj4gndIid1v
 qLpIZN0h4/7uSPlHT9Agv9tFdbZaroQ=
X-Google-Smtp-Source: ABdhPJzy32OZSVDrtf0NDfQk6ouNddtI8j3TK9hk4SWeSTjFARsHeaV5T+7dvK6gPZgM4z1SJ1LqNg==
X-Received: by 2002:a50:ec0e:: with SMTP id g14mr5995286edr.264.1615316901354; 
 Tue, 09 Mar 2021 11:08:21 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c7sm3403695edk.50.2021.03.09.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:08:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/usb: Extract VT82C686 UHCI PCI function into a new unit
Date: Tue,  9 Mar 2021 20:08:02 +0100
Message-Id: <20210309190802.830969-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309190802.830969-1-f4bug@amsat.org>
References: <20210309190802.830969-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the VT82C686 PCI UHCI function into a new unit so
it is only build when the VT82C686 south bridge is selected.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-uhci.c          | 23 --------------------
 hw/usb/vt82c686-uhci-pci.c | 43 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                |  1 +
 hw/usb/meson.build         |  1 +
 4 files changed, 45 insertions(+), 23 deletions(-)
 create mode 100644 hw/usb/vt82c686-uhci-pci.c

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index d6338c33d86..0cb02a64321 100644
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
index 00000000000..b109c216033
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
index f22d83c1782..6fd55c0a40c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1173,6 +1173,7 @@ S: Odd Fixes
 F: hw/mips/fuloong2e.c
 F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
+F: hw/usb/vt82c686-uhci-pci.c
 F: include/hw/isa/vt82c686.h
 
 Loongson-3 virtual platforms
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 653192cff6f..6e3159798e9 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -32,6 +32,7 @@
 softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
+softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
 specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
 
-- 
2.26.2


