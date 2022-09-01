Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654265A961D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:58:50 +0200 (CEST)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTiqN-00014p-QH
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaQ-0005gx-T9; Thu, 01 Sep 2022 07:42:27 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaE-0000Ea-Cc; Thu, 01 Sep 2022 07:42:18 -0400
Received: by mail-ej1-x636.google.com with SMTP id kk26so34031239ejc.11;
 Thu, 01 Sep 2022 04:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JrsI/ne9g59XtZZjXBIVmp2BYTys8MQfr3EVDlgHowE=;
 b=SlwUrs3C2zc73Bdrq0Xnf7bvB3L/WMsUYGtqZiq6z7tam3PVRr5274CGhH5EqEXk+7
 e3+T13FxAtPaGWQ3a/o5QugFvQmPDJIVF1SwBXItBcws5dtQtFLfXNd3S9smdB1tBDCg
 MkxANfxUIX2xAgV8U7tQX0hUD72YEiU6fyuMeFTuxs6ojVYXof9+9qEbNpnlVw6UDHT2
 hHF9AtTqL3f3P7MTkI+rX1CPE05VeKDBHC0S5B+Bo7MdL2VCFZkRMANPeVBq3+x5eScV
 p7KEDtWs0Q66Xj/1is/lvpCnwwWHcb/N5/Ct91l2sCT/RCF06yEB9zukAoSDd5/4cPiX
 TeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JrsI/ne9g59XtZZjXBIVmp2BYTys8MQfr3EVDlgHowE=;
 b=clMTqiq//qOz9nqakzIY+IyNRx2IKSVNx3+GHjee2KfBLNQjKjamzIkVKl2+rxnoy4
 tDumlpWSwdlCVWHVL70lRw2ctYay/dzuN/kr0SnYrsYs4mVy67ej20B0rOAIKe/eZnSP
 xzDAbgWoiwZEqOhuF4gtxUKlpW4slZnBsa7fw7ow7FV6wyD7NRt3Uycc5OSS4YCJ3FkO
 V9q/n/S6vMIgtc8IOg03qwZRDZYQUMYbBhrgeSkfseyxzezL2osZ6GfcutFJmK+dvt1K
 KLTX7JcYNklROVfLbBysSiPOqKdFc0ie5VAv5abH8Ws9KymNSB6by/7cPRIJamv0FNPF
 CY8Q==
X-Gm-Message-State: ACgBeo1arOJgW2WCCG5ZbPUiKfesHhG0kdEymk0JC0NioBghhtdv3kSu
 dQpUoKRKWHGKYlCan2MzTajxyuVGp/k=
X-Google-Smtp-Source: AA6agR52ODAk6m2govsXpT/yoB/6UmFivJWfKT7MhVJiSfVqrDNeYMyESVfIeqD04ZM4j72IptkXhw==
X-Received: by 2002:a17:907:60c7:b0:731:4b42:4e3e with SMTP id
 hv7-20020a17090760c700b007314b424e3emr23459351ejc.236.1662032524089; 
 Thu, 01 Sep 2022 04:42:04 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 07/13] hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI
 define
Date: Thu,  1 Sep 2022 13:41:21 +0200
Message-Id: <20220901114127.53914-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/fuloong2e.c        | 4 ++--
 hw/ppc/pegasos2.c          | 4 ++--
 hw/usb/vt82c686-uhci-pci.c | 4 ++--
 include/hw/isa/vt82c686.h  | 1 +
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 32605901e7..6b7370f2aa 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -208,8 +208,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), TYPE_VT82C686B_USB_UHCI);
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), TYPE_VT82C686B_USB_UHCI);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 8bc528a560..70776558c9 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -169,8 +169,8 @@ static void pegasos2_init(MachineState *machine)
     pci_ide_create_devs(dev);
 
     /* VT8231 function 2-3: USB Ports */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), TYPE_VT82C686B_USB_UHCI);
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), TYPE_VT82C686B_USB_UHCI);
 
     /* VT8231 function 4: Power Management Controller */
     dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 0bf2b72ff0..46a901f56f 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -31,7 +31,7 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 
 static UHCIInfo uhci_info[] = {
     {
-        .name      = "vt82c686b-usb-uhci",
+        .name      = TYPE_VT82C686B_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_VIA,
         .device_id = PCI_DEVICE_ID_VIA_UHCI,
         .revision  = 0x01,
@@ -45,7 +45,7 @@ static UHCIInfo uhci_info[] = {
 
 static const TypeInfo vt82c686b_usb_uhci_type_info = {
     .parent         = TYPE_UHCI,
-    .name           = "vt82c686b-usb-uhci",
+    .name           = TYPE_VT82C686B_USB_UHCI,
     .class_init     = uhci_data_class_init,
     .class_data     = uhci_info,
 };
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 87aca3e5bb..e6f6dd4d43 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -5,6 +5,7 @@
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
+#define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
 #define TYPE_VT8231_ISA "vt8231-isa"
 #define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
-- 
2.37.3


