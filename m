Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D36612D54
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGoN-0000ZX-C8; Sun, 30 Oct 2022 18:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoB-0000Uf-8T
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:35 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGo9-0007D2-JA
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:35 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so9822452wms.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Whyv3BXRJ6VWOnTQ1DAYj2diPnC5pT8crq6E+lTYIk=;
 b=TebcZ4VxJ8S/tlkFgvuv3OmFLDrCM6mqw3EnTIIsUBoNOQTBgiWKiM9Xg7QajjIif7
 croOCIm9q0+B0hbaabB+G1wT3+7q+uJ9xlvLfoIyF5AVA1tytuvVaWFHntCObKAdBWr3
 0VStmqxbMZsCXQbfnUqtPlsCGtRpIHQ3Zw8RGeeQ1e+j5NsHehjstXWFa4oeBhJFLhXM
 HJ7HX88JKPpidTlKMlXuzuTkD9SJw5bOHKF5yeW5mHW7YJ4Ib5qJm6wOB8jNgFSGyBu+
 by0CiVxjSR3Nr3BvwYO4/MOiSlhSa4/p6NhhmwGzp9DeESmeC8FTcBgNM6i1lpek8GP6
 1w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Whyv3BXRJ6VWOnTQ1DAYj2diPnC5pT8crq6E+lTYIk=;
 b=C7JEP6f/UjVuIftLwcS1n4apVjiRa7jn9Xco6cea1bJEoTYoqWNxg9C3AtbGLRx0NR
 6GfKIslxGmHX/e+SXZmvdGs93AswFb6ytTw75v9vdMxRAlMVT+UhCR3mv0IRoIk2Men8
 rvHf4MYg/e6Fk1Q9qL/bPZAnn0kWIL5MWczAGlQxlmLTUD5qucgORwLZgkzFxPGSMnEi
 3IxPVUu8JniThCtlVIrqplpueXzA7uLQpxUhe6hnnvZ+WTxJlTMw1LEjRqqr0gaGrIqh
 3K0V5/asY1XNLdii8fetqfOa4H+13FtW/7zLC2F6a+ow8koFTEIlGGXmLLg1UKjnheah
 wuyg==
X-Gm-Message-State: ACrzQf3BwZ15D7lJ7rrkg913ut6ktqovS6xc7Ba0jpX57AuFiTaBXs6N
 7XXAxDfDMEtc2rdeskR5K2fTiSezRnMMEQ==
X-Google-Smtp-Source: AMsMyM4UHHnS3Wc56S1Yf9hAUx8bMJ6C5nrDWXj9brvywMNTABj9TshEgD5jHmzqEY/spt3FXaYbQQ==
X-Received: by 2002:a1c:35c9:0:b0:3c3:d9a:385f with SMTP id
 c192-20020a1c35c9000000b003c30d9a385fmr5994710wma.139.1667168971319; 
 Sun, 30 Oct 2022 15:29:31 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b0023677fd2657sm5202420wro.52.2022.10.30.15.29.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 07/55] hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define
Date: Sun, 30 Oct 2022 23:27:53 +0100
Message-Id: <20221030222841.42377-8-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220901114127.53914-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 76f0dee4aa..23b4156a5e 100644
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


