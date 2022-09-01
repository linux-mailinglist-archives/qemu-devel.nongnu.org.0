Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A45A9DDC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:15:16 +0200 (CEST)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnmd-00010c-8T
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2a-0002RM-Py
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:43 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2T-0001Sk-Fj
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:40 -0400
Received: by mail-ej1-x629.google.com with SMTP id y3so35863548ejc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6PTQG7Rh7gB42f/nPpnGgEmjzyYid/w5xRMdsUMhn+c=;
 b=mJYllN+f3r4jRflfGmUoQBYUElCT674wHKTFlMsofBI3PsZn6yiz+nYnZ5kffqqvkt
 nA+6bn0lU+kOXjHxe8TPr0/iURP9nyZVjwcr/H6aJl3WC6/gDX8dYz4EA3kaZDXL2Eu+
 qJrGY8Eu1qynrZJl/mILh8Q7D96qEDHvZgWgc6GTyoim1PRUSTwzrn1ifOdJjZF4nM1+
 rE/ZAKXFav6PoR84Qo89C5MhfiIB5J3r1l4QkOrWLiKIIELBBpO3xkCBn3LJ7LTwwG0a
 pwZhqTN+idVaQLh8xiZqCaO9gKmsuRHlhQNB6M36bPGVvDoDknfe85MYUshKORN7vn+C
 GHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6PTQG7Rh7gB42f/nPpnGgEmjzyYid/w5xRMdsUMhn+c=;
 b=H1k5AcaLUqhwuMejWQr6IrczPelFgtp8cpY8BS/zaJLw+AZTudC/WK9tlByOjBW8X1
 LWOSKRbl6Qh/mAHhXOds44qWmvo55QqS9gWvBhlFdVMut81xkXyH+CznlZvGwNxMrZBz
 eZ33AZY8HLTCdoNp8iIs1qicnnH/1xXCiX4IIDzvCW5IJ08lEMn/mGR/WcG9kLw9mPU3
 K3EuQMnQjZbkhK/uOvPqfSVrhMYcxtAR+oai2o2Cx1XchbPCk3I7s04d65q0fBFEEymd
 YAmC3ju1M6kIbIJLX0HKVGqxuYB2fAgdLEzcMnQfWlDGuFjB1MDkKgrs/d9iFSVuZVNh
 +kgQ==
X-Gm-Message-State: ACgBeo14/3NUAgKpyeuJif3wnIfWW373FKNFREz1AFdPB13WeIi3+owS
 mt7Val/j048nwQUz0675MrLbpaZ/Dw4=
X-Google-Smtp-Source: AA6agR7801B9EsNhGdJXU1v5gf6+0yVEToN6okldlVzFFGerKVJ03BA4ncbCXqN0DApXgCu8irW95g==
X-Received: by 2002:a17:907:2d20:b0:741:a251:1f10 with SMTP id
 gs32-20020a1709072d2000b00741a2511f10mr11869101ejc.400.1662049651444; 
 Thu, 01 Sep 2022 09:27:31 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 40/42] hw/isa/piix: Share PIIX3 base class with PIIX4
Date: Thu,  1 Sep 2022 18:26:11 +0200
Message-Id: <20220901162613.6939-41-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Having a common base class allows for substituting PIIX3 with PIIX4
and vice versa. Moreover, it makes PIIX4 implement the
acpi-dev-aml-interface.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 53 +++++++++++++++++++++++----------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index c503a6e836..25b86ddf17 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -473,13 +473,12 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     }
 }
 
-static void pci_piix3_init(Object *obj)
+static void pci_piix_init(Object *obj)
 {
     PIIXState *d = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
-    object_initialize_child(obj, "ide", &d->ide, "piix3-ide");
 }
 
 static Property pci_piix_props[] = {
@@ -494,7 +493,7 @@ static Property pci_piix_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void pci_piix3_class_init(ObjectClass *klass, void *data)
+static void pci_piix_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -502,11 +501,8 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 
     dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
-    dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
     k->vendor_id    = PCI_VENDOR_ID_INTEL;
-    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
-    k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
     k->class_id     = PCI_CLASS_BRIDGE_ISA;
     /*
      * Reason: part of PIIX3 southbridge, needs to be wired up by
@@ -517,13 +513,13 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-static const TypeInfo piix3_pci_type_info = {
+static const TypeInfo piix_pci_type_info = {
     .name = TYPE_PIIX3_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIXState),
-    .instance_init = pci_piix3_init,
+    .instance_init = pci_piix_init,
     .abstract = true,
-    .class_init = pci_piix3_class_init,
+    .class_init = pci_piix_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { TYPE_ACPI_DEV_AML_IF },
@@ -547,17 +543,29 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
+static void piix3_init(Object *obj)
+{
+    PIIXState *d = PIIX_PCI_DEVICE(obj);
+
+    object_initialize_child(obj, "ide", &d->ide, "piix3-ide");
+}
+
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix_write_config;
     k->realize = piix3_realize;
+    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
+    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
+    dc->vmsd = &vmstate_piix3;
 }
 
 static const TypeInfo piix3_info = {
     .name          = TYPE_PIIX3_DEVICE,
     .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .instance_init = piix3_init,
     .class_init    = piix3_class_init,
 };
 
@@ -584,15 +592,20 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
     k->realize = piix3_xen_realize;
+    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
+    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
+    dc->vmsd = &vmstate_piix3;
 }
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
     .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .instance_init = piix3_init,
     .class_init    = piix3_xen_class_init,
 };
 
@@ -624,8 +637,6 @@ static void piix4_init(Object *obj)
 {
     PIIXState *s = PIIX_PCI_DEVICE(obj);
 
-    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
-    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
 }
 
@@ -636,36 +647,20 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
     k->config_write = piix_write_config;
     k->realize = piix4_realize;
-    k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-    k->class_id = PCI_CLASS_BRIDGE_ISA;
-    dc->reset = piix_reset;
-    dc->desc = "ISA bridge";
     dc->vmsd = &vmstate_piix4;
-    /*
-     * Reason: part of PIIX4 southbridge, needs to be wired up,
-     * e.g. by mips_malta_init()
-     */
-    dc->user_creatable = false;
-    dc->hotpluggable = false;
-    device_class_set_props(dc, pci_piix_props);
 }
 
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIXState),
+    .parent        = TYPE_PIIX3_PCI_DEVICE,
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
 };
 
 static void piix3_register_types(void)
 {
-    type_register_static(&piix3_pci_type_info);
+    type_register_static(&piix_pci_type_info);
     type_register_static(&piix3_info);
     type_register_static(&piix3_xen_info);
     type_register_static(&piix4_info);
-- 
2.37.3


