Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C15A8244
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:52:11 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ0g-0000CD-Jn
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvE-0002fZ-4T; Wed, 31 Aug 2022 11:46:33 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvB-000367-JM; Wed, 31 Aug 2022 11:46:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id qh18so8957743ejb.7;
 Wed, 31 Aug 2022 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I6LPJZUvTPv4BSyUK+1MUo2I6TDAef6EvKzOqmCgYAk=;
 b=MR6e/qgQYm4FByKuk3UEBN+lkmU5XC/QcbkETFonaLinkQDb4js/IC4KMvtrja11Qo
 RiLerxiK3DLRvnTnRF7YlJOspvFglRvMoUys/yZyCe07viIgSMGZF0Ei7rR89+zitM+G
 T81755wyoZfmwinkvlMo39iUHYZbcPgAWZ6Dx/aI3JJWq0RPbJPg0uT09hLXfWPACYjZ
 hTRNPr736rYkwp3sVDqQ5Ka7HVd3Gp5+DltHuLDls4W7RiyKwFL0X6RiR/OtxHRm4hOg
 qDSzVwVLvIBQtyQHMDvNUYDkL78+91pA8to9ExyMpMUltFPSTJQ71HCcw57mBnwQWstD
 o7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I6LPJZUvTPv4BSyUK+1MUo2I6TDAef6EvKzOqmCgYAk=;
 b=z1WVhq10418cRDLi/EEhMdg/AGc5b9f+R4snEkBNvUbNG+PW+gvfbEYt6mT2SF2QdV
 EHNNhTGxmwJKkOxYPsfVuZgxTzL58F/mhzRyFQLMeHJ/ufcNHvnxZvBpHsB4fNiJvSb1
 yQNVCEYwlU4Q/S9MH/iaxmZMzF6Mh4D64nbHvTZxvEBlcB+tbrudLD6BzbIbxtNo/jOV
 v++NnqBmsJBpgBUyZwdbNFQIRsX4e+QByWHApa80z1SLBPBoe+JYb/l2TdPmyLDFW22P
 RWpgxO0/ygzsCk+hCurPlpF2JbCoX9UXVNmzk0MbUQpee1NbRmpodkqWPe6+DajKBlBS
 mGlg==
X-Gm-Message-State: ACgBeo0XseBr1MU+CUVin1+Dq2kj5VBASF898xOhozczPXysaro7Mwxh
 sEj//mNMlh5XCQN3tjisPWub2CBukTk=
X-Google-Smtp-Source: AA6agR4LQa3XrMPp9FBwfgTBWX0Skr3CKYfZ6pgCGL9gg7ekMNwSIk3rURiNGTFHe4J3Q4WFBGSXIQ==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr20786438ejv.677.1661960785971; 
 Wed, 31 Aug 2022 08:46:25 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 01/12] hw/isa/vt82c686: Resolve chip-specific realize
 methods
Date: Wed, 31 Aug 2022 17:45:54 +0200
Message-Id: <20220831154605.12773-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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


