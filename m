Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1F5A7ADE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:05:03 +0200 (CEST)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKak-0003gm-IM
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXl-0006NA-82; Wed, 31 Aug 2022 06:01:57 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXi-0002sW-7z; Wed, 31 Aug 2022 06:01:56 -0400
Received: by mail-ej1-x633.google.com with SMTP id qh18so7039446ejb.7;
 Wed, 31 Aug 2022 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I6LPJZUvTPv4BSyUK+1MUo2I6TDAef6EvKzOqmCgYAk=;
 b=YGNWllmJgZffUoYl652TgA6Z8aGkGVgFYkAq3XDBpX3hfqwBWqhk3vpfJoLZpVZUNq
 TT3B7FC4Zjjco6cItiA8JLXVA/e80GwKWHB16BUTgi5Wb2ybMUgd7jJ/j1wQCbPMdOzn
 M4DaW1xxG6Y7ImpEgZ6DtE4KLyuyTun7xOYtUMn7GKim0ws0smhuAcwxf43DKgIhqbhO
 ALtNc+e6KGXviGGMMRBK9JrLhpk4O6A7UOfKR4wccTqwUzXdsB0DFcHD147mg1nvhE6M
 OnakrCFG2SUrXBbgR5V4lhtp/xa3vVD0XQ/RXN3z5x9QxtkmC6DBXNFHbFtye3Kc1tPe
 Dcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I6LPJZUvTPv4BSyUK+1MUo2I6TDAef6EvKzOqmCgYAk=;
 b=1F6sb4cn/c8l548OTP+3JhIN6R8eexY2FYZl+RZkq2aP098T8Kk+IXCOAlgmjZQYaA
 wFmNH67xsEZ0wSqcGXIJ70dwt0nfXmlFYy/7adncxDdTz1lNCbwd/gYGLW1zDKYq577k
 M/bMJM8g5Fp2NvodoB9mYyldXy/gltdkL4SXWjAbUxdK4g0hK4i3lyyRgcOOjBMqR604
 vSk4aZYy752nnFyTQLqpiDnYjWGMz0VWrDpozAWuMUXnM5uICQ/0WXwqDOegMa7N/chY
 ScNzaI+n2vv6gFBDWAMnGM1AkmdZwSK25TwZ1PCi7+ygFi9qD/XGCmhpWjn8R2Zg4Y/j
 auRQ==
X-Gm-Message-State: ACgBeo2wAK6AotOK28swVV2kS+zaZWljXtyLoSD1Z6zQHMrzDxesMB4L
 lJm3REzpPB5yOLoBdCf5pbx/8ojSmZU=
X-Google-Smtp-Source: AA6agR6Ep7QxLRaKNpzh8Da48p2gg5klf69WkAXwbQEIq7KkPikpiAqFULV+5D4cobUC4/650qV0lQ==
X-Received: by 2002:a17:906:9bf3:b0:741:6900:61a5 with SMTP id
 de51-20020a1709069bf300b00741690061a5mr11050768ejc.286.1661940112122; 
 Wed, 31 Aug 2022 03:01:52 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:51 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 01/10] hw/isa/vt82c686: Resolve chip-specific realize
 methods
Date: Wed, 31 Aug 2022 11:59:05 +0200
Message-Id: <20220831095914.2041-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831095914.2041-1-shentey@gmail.com>
References: <20220831095914.2041-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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
parent object's init methods are called implicitly - like constructors
in object-oriented languages.

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
2.37.3


