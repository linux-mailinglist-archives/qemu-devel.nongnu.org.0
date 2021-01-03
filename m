Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE972E8E3A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:59:50 +0100 (CET)
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwATd-00031l-GI
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALQ-0003Gu-CX
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:20 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALO-0005wc-Gt
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id 91so29445501wrj.7
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xkAWBB0fCP8oR4s0bz1IL0feMKGP5FSRQjkwoaDMIDQ=;
 b=ZTZXGFGaXkVU/ZHDY4aU/GSrpW18xclGnlYSWDNe98gr4dvj1rsRPiTwOpoxKN6m52
 jNebBo9bVAZmUjzJIVJ+2T5aOPkNSaI5SAJEjtDXBdsRLrUj8P0dkd0QYhKG1YMdu/PB
 KCke/aj4+WAlG5aK8FzI0bWmZGHqtkwJ1mOGlkDo0qfiRYAQFG14+F0C/JQGCT73q2WO
 KdRYR25fjM/qU6PFCNXq/7eG+K9Jp3vVJfB35EA6x+R/3R/qEQ+FNSglhw7GiXOVPUol
 LL1SUbPOJ0LdOTX6jsV1nrOPZdhy0OS4LgQX7+rE4zeaMt042bmbZgcPcIVqW1VcCOx8
 xMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xkAWBB0fCP8oR4s0bz1IL0feMKGP5FSRQjkwoaDMIDQ=;
 b=Cu/MKhJBiUOSa0Pcq2nXuY5eSIbQ4wysy83cKQ12wjVi/G7ngd+4jpmFucX4dDxoio
 HxpOSjGX2E86wA8rcqc7N/T5sz0MVAcWSKvK29mSan6Frpu4pCutdeRUNhQVY+21jNJy
 kexqCqDd01YI7RSyQiM4SyTiJYfB3Cb6lqO/9B/Ij8lMeHjWq/Rls012ZUTq/GAYcuSp
 dWfaha9WJ0DG55mhYGPjtdnYCHf65by+mmBzm4P8TTg2XuxWPn1GSPPKlQDm0Njmhpii
 Agn+1nrMWKFs2+Z3oWjOamYzUHRlaKaius4z20JFwxFXIwNZ1CfKUdNd/UvjN351d4gG
 qxgg==
X-Gm-Message-State: AOAM5312KraPE1ErV7TQzuFUPceNsUBYf1SirgvGUikET/jHlU2kpgx+
 n5bUYHLdR0+OJ4AITSV3LOYZxENGMU8=
X-Google-Smtp-Source: ABdhPJzo6LCf4mytO+6npZ1V9YQJxFr5mWMpGvgDdfl7aNkJgWsVRnvHKOC54TR37780TaHHcOOTFQ==
X-Received: by 2002:adf:9506:: with SMTP id 6mr76437798wrs.172.1609707077100; 
 Sun, 03 Jan 2021 12:51:17 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id y11sm29615018wmi.0.2021.01.03.12.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/35] vt82c686: Split off via-[am]c97 into separate file in
 hw/audio
Date: Sun,  3 Jan 2021 21:49:57 +0100
Message-Id: <20210103205021.2837760-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The via-[am]c97 code is supposed to implement the audio part of VIA
south bridge chips so it is better placed under hw/audio/. Split it
off into a separate file.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <af083634e3b9efe67e6c4247cf0185d3fa7b1810.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/via-ac97.c  | 106 +++++++++++++++++++++++++++++++++++++++++++
 hw/isa/vt82c686.c    |  91 -------------------------------------
 hw/audio/meson.build |   1 +
 3 files changed, 107 insertions(+), 91 deletions(-)
 create mode 100644 hw/audio/via-ac97.c

diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
new file mode 100644
index 00000000000..e617416ff76
--- /dev/null
+++ b/hw/audio/via-ac97.c
@@ -0,0 +1,106 @@
+/*
+ * VIA south bridges sound support
+ *
+ * This work is licensed under the GNU GPL license version 2 or later.
+ */
+
+/*
+ * TODO: This is entirely boiler plate just registering empty PCI devices
+ * with the right ID guests expect, functionality should be added here.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/isa/vt82c686.h"
+#include "hw/pci/pci.h"
+
+struct VIAAC97State {
+    PCIDevice dev;
+};
+
+struct VIAMC97State {
+    PCIDevice dev;
+};
+
+OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
+OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
+
+static void via_ac97_realize(PCIDevice *dev, Error **errp)
+{
+    VIAAC97State *s = VIA_AC97(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
+                 PCI_COMMAND_PARITY);
+    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_CAP_LIST |
+                 PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+}
+
+static void via_ac97_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = via_ac97_realize;
+    k->vendor_id = PCI_VENDOR_ID_VIA;
+    k->device_id = PCI_DEVICE_ID_VIA_AC97;
+    k->revision = 0x50;
+    k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
+    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
+    dc->desc = "AC97";
+}
+
+static const TypeInfo via_ac97_info = {
+    .name          = TYPE_VIA_AC97,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(VIAAC97State),
+    .class_init    = via_ac97_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void via_mc97_realize(PCIDevice *dev, Error **errp)
+{
+    VIAMC97State *s = VIA_MC97(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
+                 PCI_COMMAND_VGA_PALETTE);
+    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+}
+
+static void via_mc97_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = via_mc97_realize;
+    k->vendor_id = PCI_VENDOR_ID_VIA;
+    k->device_id = PCI_DEVICE_ID_VIA_MC97;
+    k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+    k->revision = 0x30;
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->desc = "MC97";
+}
+
+static const TypeInfo via_mc97_info = {
+    .name          = TYPE_VIA_MC97,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(VIAMC97State),
+    .class_init    = via_mc97_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void via_ac97_register_types(void)
+{
+    type_register_static(&via_ac97_info);
+    type_register_static(&via_mc97_info);
+}
+
+type_init(via_ac97_register_types)
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 8677a2d212b..9567326d8e2 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -168,14 +168,6 @@ struct VT686PMState {
     uint32_t smb_io_base;
 };
 
-struct VIAAC97State {
-    PCIDevice dev;
-};
-
-struct VIAMC97State {
-    PCIDevice dev;
-};
-
 #define TYPE_VT82C686B_PM "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
@@ -247,87 +239,6 @@ static const VMStateDescription vmstate_acpi = {
     }
 };
 
-/*
- * TODO: VIA_AC97 and VIA_MC97
- * just register a PCI device now, functionalities will be implemented later.
- */
-
-OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
-OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
-
-static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
-{
-    VIAAC97State *s = VIA_AC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_PARITY);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_CAP_LIST |
-                 PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
-}
-
-static void via_ac97_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = vt82c686b_ac97_realize;
-    k->vendor_id = PCI_VENDOR_ID_VIA;
-    k->device_id = PCI_DEVICE_ID_VIA_AC97;
-    k->revision = 0x50;
-    k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
-    set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
-    dc->desc = "AC97";
-}
-
-static const TypeInfo via_ac97_info = {
-    .name          = TYPE_VIA_AC97,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAAC97State),
-    .class_init    = via_ac97_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
-{
-    VIAMC97State *s = VIA_MC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_VGA_PALETTE);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
-}
-
-static void via_mc97_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = vt82c686b_mc97_realize;
-    k->vendor_id = PCI_VENDOR_ID_VIA;
-    k->device_id = PCI_DEVICE_ID_VIA_MC97;
-    k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
-    k->revision = 0x30;
-    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
-    dc->desc = "MC97";
-}
-
-static const TypeInfo via_mc97_info = {
-    .name          = TYPE_VIA_MC97,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAMC97State),
-    .class_init    = via_mc97_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
 /* vt82c686 pm init */
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 {
@@ -516,8 +427,6 @@ static const TypeInfo via_superio_info = {
 
 static void vt82c686b_register_types(void)
 {
-    type_register_static(&via_ac97_info);
-    type_register_static(&via_mc97_info);
     type_register_static(&via_pm_info);
     type_register_static(&via_superio_info);
     type_register_static(&via_info);
diff --git a/hw/audio/meson.build b/hw/audio/meson.build
index 549e9a0396a..32c42bdebe4 100644
--- a/hw/audio/meson.build
+++ b/hw/audio/meson.build
@@ -11,4 +11,5 @@
 softmmu_ss.add(when: 'CONFIG_PCSPK', if_true: files('pcspk.c'))
 softmmu_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
 softmmu_ss.add(when: 'CONFIG_SB16', if_true: files('sb16.c'))
+softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('via-ac97.c'))
 softmmu_ss.add(when: 'CONFIG_WM8750', if_true: files('wm8750.c'))
-- 
2.26.2


