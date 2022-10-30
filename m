Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADB612D5C
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:31:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGoW-0001CW-MS; Sun, 30 Oct 2022 18:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoU-00016N-HP
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoN-0007TA-BF
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 5so6233567wmo.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o1FwdKp3nLabmB4WPYTY40s0ENpWueeIflLLvKR5cYc=;
 b=p3j4sCKHUlXdpGijQRau7/5kWIvU9WK4hzTXiSMPhzOR0P8Ozgj/feVWtkqMx1FAk5
 hzGME5podqddR9Z2fxpLuBUoRTv5/g4grRTueR9B83EnyLDnLCvmMJfkk18Nl2XsIIfm
 0J6w//M+0M6KnjHBqliizGphYJSpp1pYiidpSjReGCJDPs+3ywLcY/Vbpg6osjl8b40B
 Y0rwa/IBMMX2lmsKywU1CgI5wyfR0XuwzENC6/URDgaZWmjqE4qFHDhrNXhkqECx3trP
 44ILXFfyoGJwU/+RSGbLbES5iRIo9M3QOvsjDUTvGDb+B4HB+82M9rTMAGT9D6fGXhZt
 /TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1FwdKp3nLabmB4WPYTY40s0ENpWueeIflLLvKR5cYc=;
 b=uBwZdqChdK/wWIdUqWvJSg5uaXAbFSOSCf/Og+nHlMijH3PYipwMyhdraUGWSKiQ6D
 u5Us309qAoUFkWNV7utmLrE3QwP+l1F4fhe+mjX0cWagS+BkviZZRknyvpwMGQf/0qxS
 yK1LXAbOVq2d8Xg+Miil2vQVhAD4iSqFrHH8wCxa/CqXz23nEeHA6jEDZdBKii1bbEtl
 OL4DrAFINZQg/QoeiASOj8M1eyBPE1g6WkHH7KIn/fQIUEqTqzzXDsg7dKv63wkbv1f0
 mufLe7usH05GPOuxsjz6+TFSdSpWwos821+OSVzpz1S1TVSnrJChdBrwZPwece/D3KUf
 dN5w==
X-Gm-Message-State: ACrzQf01SSz5Y6efSJA3suYw0HbErhV34uTqj8CzgAM2ZpiWAwME8v2m
 wlEjzZS/qsi4lnIFuJukPNFwcPdC3U8JKg==
X-Google-Smtp-Source: AMsMyM5FC7lbbM77cJtQYqbN+9ZH/dGn6Y1JHGzPE6jME3JOm3LG3lQVQH6exR7bowAwFvuH+3U4Iw==
X-Received: by 2002:a05:600c:5119:b0:3c6:cae1:1512 with SMTP id
 o25-20020a05600c511900b003c6cae11512mr16602742wms.80.1667168985718; 
 Sun, 30 Oct 2022 15:29:45 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adffdca000000b00236674840e9sm5181726wrs.59.2022.10.30.15.29.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:45 -0700 (PDT)
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
Subject: [PULL 09/55] hw/isa/vt82c686: Instantiate PM function in host device
Date: Sun, 30 Oct 2022 23:27:55 +0100
Message-Id: <20221030222841.42377-10-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

The PM controller has activity bits which monitor activity of other
built-in devices in the host device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220901114127.53914-10-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c         | 13 +++++++++++++
 hw/mips/fuloong2e.c       |  2 +-
 hw/ppc/pegasos2.c         |  3 +--
 include/hw/isa/vt82c686.h |  2 --
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f05fd9948a..d048607079 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -250,6 +250,8 @@ static const ViaPMInitInfo vt82c686b_pm_init_info = {
     .device_id = PCI_DEVICE_ID_VIA_82C686B_PM,
 };
 
+#define TYPE_VT82C686B_PM "vt82c686b-pm"
+
 static const TypeInfo vt82c686b_pm_info = {
     .name          = TYPE_VT82C686B_PM,
     .parent        = TYPE_VIA_PM,
@@ -261,6 +263,8 @@ static const ViaPMInitInfo vt8231_pm_init_info = {
     .device_id = PCI_DEVICE_ID_VIA_8231_PM,
 };
 
+#define TYPE_VT8231_PM "vt8231-pm"
+
 static const TypeInfo vt8231_pm_info = {
     .name          = TYPE_VT8231_PM,
     .parent        = TYPE_VIA_PM,
@@ -548,6 +552,7 @@ struct ViaISAState {
     ViaSuperIOState via_sio;
     PCIIDEState ide;
     UHCIState uhci[2];
+    ViaPMState pm;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -641,6 +646,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
             return;
         }
     }
+
+    /* Function 4: Power Management */
+    qdev_prop_set_int32(DEVICE(&s->pm), "addr", d->devfn + 4);
+    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
@@ -683,6 +694,7 @@ static void vt82c686b_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -746,6 +758,7 @@ static void vt8231_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT8231_PM);
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index dc92223b76..377108d313 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -208,7 +208,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
     /* Audio support */
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index bd3c5cf835..6b5d7265d3 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -168,8 +168,7 @@ static void pegasos2_init(MachineState *machine)
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    /* VT8231 function 4: Power Management Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index e6f6dd4d43..eaa07881c5 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -4,10 +4,8 @@
 #include "hw/pci/pci.h"
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
-#define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
 #define TYPE_VT8231_ISA "vt8231-isa"
-#define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_IDE "via-ide"
 #define TYPE_VIA_MC97 "via-mc97"
-- 
2.37.3


