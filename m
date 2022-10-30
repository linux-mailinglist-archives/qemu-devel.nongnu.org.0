Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F9612D57
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGoX-0001F5-Bz; Sun, 30 Oct 2022 18:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoV-00019O-8H
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoT-0007Um-GW
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id l32so6238216wms.2
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mUBmgZQaRbCrdceZmerfhEqzkJcclof3ppYpEcXvUU=;
 b=Cnqn27EYmByA5xF9ABQP/aZAXWCJAxZdstimGr9C7nQS1yZ9zn3yYC+ByRmg/7gvCo
 Y/6b5iu4h0JzSTBr1DeY/W9Ify+MMm91Z/SiT81t3R8tKkLJvveRPAgOeLdS/UeAoguW
 sGz4xkrFUcmkgrNCVIaffRMbRMimr84GV+nZGMHcUnuThUHlfuWlx4cdM0ly91WlzUYp
 nhBOMjznVtkIIwCdr9vbeH+lx/3MuSvbjZnJGL/9urIp87Np+2eweCgjx0uweUYUXfZb
 DmeOnquojtE6TVGFUVY8AQ8qVvGMoJBQLF+GhdjXrfeUb0tSmDfc2lGbx+kp4PeTOk0a
 ugIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mUBmgZQaRbCrdceZmerfhEqzkJcclof3ppYpEcXvUU=;
 b=KkgzbQUNqRCl/AJw0LqxZqJYkdHauybcDz9QQ3Il1azA/WsafNm2JDr6C9zgazF0r6
 UG8w8MyPjZdy0oEPoSW4xYhxSCevGy0LSk0X4PuHXuGIp0Iesf4mnw12PbVBX6ZtZ1E8
 vPvt2Ha7/LGzq/B+YRxq5jQ1ji+CWTCNYBzz7c/UGyxZButw/1UmpBG8ivbPtbl1JiMe
 gbEHPwyOx8iexFvJ2kHBfwbSy/4i4Yq7iSsP3OksYlV1a3D3q/4lei/FQheLaXOU2qax
 duugaezEj4iWN9BMem1DKX/CZG4w+jT00t1HfyuafkoSIZHV7tv3LWhtMnir6Zyc1usF
 MK8w==
X-Gm-Message-State: ACrzQf2x/9XazNYHs1skBAe8F02ghG1chIeeXrFYayJS1SHbztXyVYD4
 53gy8lq4J1HQO+OMzJRdZkk0aYeP0yiUmw==
X-Google-Smtp-Source: AMsMyM5XoFO4BrddTI9umJxR10AwkXuZJpkjwfCBtfwY0s7WYaDVH99wPF6mJfww4SP3pMdH3KEyPg==
X-Received: by 2002:a7b:c5d6:0:b0:3c6:f970:e755 with SMTP id
 n22-20020a7bc5d6000000b003c6f970e755mr6102902wmk.132.1667168991935; 
 Sun, 30 Oct 2022 15:29:51 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a1c440b000000b003cf4ec90938sm5355232wma.21.2022.10.30.15.29.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 10/55] hw/isa/vt82c686: Instantiate AC97 and MC97 functions in
 host device
Date: Sun, 30 Oct 2022 23:27:56 +0100
Message-Id: <20221030222841.42377-11-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

The AC97 function's wakeup status is wired to the PM function and both
the AC97 and MC97 interrupt routing is determined by the ISA function.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220901114127.53914-11-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 16 ++++++++++++++++
 hw/mips/fuloong2e.c |  4 ----
 hw/ppc/pegasos2.c   |  5 -----
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d048607079..91686e9570 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -553,6 +553,8 @@ struct ViaISAState {
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
+    PCIDevice ac97;
+    PCIDevice mc97;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -572,6 +574,8 @@ static void via_isa_init(Object *obj)
     object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
     object_initialize_child(obj, "uhci1", &s->uhci[0], TYPE_VT82C686B_USB_UHCI);
     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
+    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
+    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
 }
 
 static const TypeInfo via_isa_info = {
@@ -652,6 +656,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
         return;
     }
+
+    /* Function 5: AC97 Audio */
+    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
+    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
+        return;
+    }
+
+    /* Function 6: MC97 Modem */
+    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
+    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 377108d313..2d8723ab74 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -210,10 +210,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-
-    /* Audio support */
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
 }
 
 /* Network support */
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 6b5d7265d3..474723ee27 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -159,7 +159,6 @@ static void pegasos2_init(MachineState *machine)
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
-    /* VT8231 function 0: PCI-to-ISA Bridge */
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
     qdev_connect_gpio_out(DEVICE(via), 0,
@@ -173,10 +172,6 @@ static void pegasos2_init(MachineState *machine)
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
 
-    /* VT8231 function 5-6: AC97 Audio & Modem */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
-
     /* other PC hardware */
     pci_vga_init(pci_bus);
 
-- 
2.37.3


