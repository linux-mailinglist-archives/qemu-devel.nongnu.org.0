Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB259CBD1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:56:48 +0200 (CEST)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGLf-0003U8-Hb
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA6-0003rO-I5; Mon, 22 Aug 2022 18:44:51 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA4-0007vd-T2; Mon, 22 Aug 2022 18:44:50 -0400
Received: by mail-ed1-x536.google.com with SMTP id s11so15761338edd.13;
 Mon, 22 Aug 2022 15:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gNxGFhfTsaBI0LgZx1xEG8EunxZiX5hZtX81XqJAWHg=;
 b=QGn0TTagzMGPPfpwBxaqg2lWj9RhfUxaaGmCwIXhvYXJ2ypajQ9IXWyckEVriTGxoj
 caezscLzB60s7v1oQ7xvXkCBXRQgjzyCCOEkp3X/3qJYeJaHV4R1Wa9wLpkvHhTuCg92
 xvAq1O5UhAuzLnQIhcLZLDNwJs3Ra6cKXsYFcz/sxm90Ya/3x7lnTgS6UObAPie7JgsX
 Xg+FXAuP4wSXVbfMvr1sadhwrzydjlzDtWVXRNCvUktZFqKedSNaWofsSPXTrBORzH/K
 AzYyrG3BWoPrcitM6NOIZ9cVKtTpi4ifiM3+eVhgwfiwIPMvGwvqW0MLe5D+BgdPC4uc
 z/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gNxGFhfTsaBI0LgZx1xEG8EunxZiX5hZtX81XqJAWHg=;
 b=kegtSL7nG4/cjWGxGzJgrqD48J7rIV59d3xZERqeyTzRRsYJbkLWjQMZDyIYWaqaQr
 SdqMjNbFH2wKb4DOCTSP5LMj3N46kuN9bTLjE3aHxaqB+jxuwdpjsKcrILEMvwmIeTzZ
 y051Ygzp+NzFAN8RhxSqirjNcshK79kqLUR/GtCzw8+cTm3khUu3zpoWiH7S7RpxF+bz
 3ZqGK/1QQikhaQeIjpmlKbMdbUrsL/oohrb7Gi03c0/UyUlrYJIDWTxrTHi4mND00GeL
 3JYv6KXRMspFuv/lPYRlkyKqlBZl/+fLLT5/a0pTeouG5DvXx8SeBfNEmiFSCmjm5jjD
 iSwQ==
X-Gm-Message-State: ACgBeo0byz4m5xwn5mlx0QDWUMeFfcK9PmKv/PYaW/aFJss+fO7XxGrb
 GVHJnnNrrkfKQd7PExDSzmBawNVPG5w=
X-Google-Smtp-Source: AA6agR50IKLVIqHvgIg0XepNpfGpkeT1GLz0zlX6XY37/bmZD4Pm9vRADD6/VVHT4o+Dnx2yWB0Itw==
X-Received: by 2002:a05:6402:350e:b0:446:145d:a3bb with SMTP id
 b14-20020a056402350e00b00446145da3bbmr1072112edd.23.1661208286031; 
 Mon, 22 Aug 2022 15:44:46 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/9] hw/isa/vt82c686: QOM'ify Super I/O creation
Date: Tue, 23 Aug 2022 00:43:47 +0200
Message-Id: <20220822224355.11753-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

The object creation now happens in chip-specific init methods which
allows the realize methods to be consolidated into one method. Shifting
the logic into the init methods has the addidional advantage that the
parent object's init methods are called implicitly.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 8f656251b8..0217c98fe4 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -544,7 +544,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ISABus *isa_bus;
-    ViaSuperIOState *via_sio;
+    ViaSuperIOState via_sio;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -602,6 +602,11 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
             d->wmask[i] = 0;
         }
     }
+
+    /* Super I/O */
+    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
@@ -615,7 +620,7 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x85) {
         /* BIT(1): enable or disable superio config io ports */
-        via_superio_io_enable(s->via_sio, val & BIT(1));
+        via_superio_io_enable(&s->via_sio, val & BIT(1));
     }
 }
 
@@ -639,13 +644,11 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
 }
 
-static void vt82c686b_realize(PCIDevice *d, Error **errp)
+static void vt82c686b_init(Object *obj)
 {
-    ViaISAState *s = VIA_ISA(d);
+    ViaISAState *s = VIA_ISA(obj);
 
-    via_isa_realize(d, errp);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
-                                               TYPE_VT82C686B_SUPERIO));
+    object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -653,7 +656,7 @@ static void vt82c686b_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->realize = vt82c686b_realize;
+    k->realize = via_isa_realize;
     k->config_write = vt82c686b_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
     k->device_id = PCI_DEVICE_ID_VIA_82C686B_ISA;
@@ -670,6 +673,7 @@ static const TypeInfo vt82c686b_isa_info = {
     .name          = TYPE_VT82C686B_ISA,
     .parent        = TYPE_VIA_ISA,
     .instance_size = sizeof(ViaISAState),
+    .instance_init = vt82c686b_init,
     .class_init    = vt82c686b_class_init,
 };
 
@@ -684,7 +688,7 @@ static void vt8231_write_config(PCIDevice *d, uint32_t addr,
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x50) {
         /* BIT(2): enable or disable superio config io ports */
-        via_superio_io_enable(s->via_sio, val & BIT(2));
+        via_superio_io_enable(&s->via_sio, val & BIT(2));
     }
 }
 
@@ -703,13 +707,11 @@ static void vt8231_isa_reset(DeviceState *dev)
     pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
 }
 
-static void vt8231_realize(PCIDevice *d, Error **errp)
+static void vt8231_init(Object *obj)
 {
-    ViaISAState *s = VIA_ISA(d);
+    ViaISAState *s = VIA_ISA(obj);
 
-    via_isa_realize(d, errp);
-    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
-                                               TYPE_VT8231_SUPERIO));
+    object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
@@ -717,7 +719,7 @@ static void vt8231_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->realize = vt8231_realize;
+    k->realize = via_isa_realize;
     k->config_write = vt8231_write_config;
     k->vendor_id = PCI_VENDOR_ID_VIA;
     k->device_id = PCI_DEVICE_ID_VIA_8231_ISA;
@@ -734,6 +736,7 @@ static const TypeInfo vt8231_isa_info = {
     .name          = TYPE_VT8231_ISA,
     .parent        = TYPE_VIA_ISA,
     .instance_size = sizeof(ViaISAState),
+    .instance_init = vt8231_init,
     .class_init    = vt8231_class_init,
 };
 
-- 
2.37.2


