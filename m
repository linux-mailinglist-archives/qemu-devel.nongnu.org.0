Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21E609838
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:27:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhoP-00037m-7W
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG62-0007SQ-EZ; Sat, 22 Oct 2022 11:07:36 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG60-0002Nu-Ny; Sat, 22 Oct 2022 11:07:34 -0400
Received: by mail-ed1-x533.google.com with SMTP id w8so13819712edc.1;
 Sat, 22 Oct 2022 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dS8kM3DSSBc7NZLLCGrwBWo7nHrXayCI+lmThiiO5j4=;
 b=XcLQpUejmyyzv0DZCdR3ILoAOmfb+mHksgQeEtG6iej1Y8HAn7+RJcJr/XFhfX9ktg
 dZfFLcKE7aKfPfTiDb9/R4DwqxtNl4T67emxwhBN5aa2YrY20sEgj0wKxAyAeb1LZZBm
 JUW0gwDe6BzslHTUKODmi7rQUugGA+NnfnZPkvMywgJKwTg9mbS891YXY6efZhmC42mG
 Zh0yFIPQEscE24aAXw/Xzw71SJCI7PF+hFdf85Fwo37GlVZbDycfPgqPDmeTeZuhdNLH
 KRloBR01gUEEg/+VDa8ZnqFFfosy41hKva5ARfdO4KMU1GQmF7i6lQo2yjmxitRTTum1
 vWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dS8kM3DSSBc7NZLLCGrwBWo7nHrXayCI+lmThiiO5j4=;
 b=QoX0rzBzykcDOWT1Z7V6VpuRs6cpF7u7GStqe9s+Pc2GWuHZ5X0o1k6PPVKuUGonvQ
 uZioCRela7mtHjmTDnXpOKgcJn8df6RuyVWRd1PkrXl9bb+O5bOVEOW2G2/nA+YkbvEi
 LEZ57CS3uOGQlILfW0AT5di8wZeb9ChlCkUVetut+6up5ELKETzChcLSTVifLDV5M107
 p4f7JuE9EyYvzYAYuyfPqGXASlraGYMTnHijaa4ZysdkPqSeQyIGwZcSHWhLdqFB5MY2
 Kep2xpVfZuiO+Wl9Io4Xshp6X+ABmrTfqfs1GRRGdLufDlHXxloTPnxouculVilk/oZB
 2K3w==
X-Gm-Message-State: ACrzQf2urYmEroDhIrgtnF/LMU3fUMUzPZIWiLiwyPkrkg+dAnWup/Is
 uaUI7rEET+T1pFdEQ+QBQK4mU2E3YG9Kbg==
X-Google-Smtp-Source: AMsMyM5zgrMsA+ioPu45+XJXhZsgv+lPlYJv/NBXeJ1h+J6nUxmlYl1CF9c5mdwyzF4hAsSGxpl4gQ==
X-Received: by 2002:a17:907:e93:b0:78d:b8ff:9b5f with SMTP id
 ho19-20020a1709070e9300b0078db8ff9b5fmr20523402ejc.12.1666451251440; 
 Sat, 22 Oct 2022 08:07:31 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 41/43] hw/isa/piix: Share PIIX3 base class with PIIX4
Date: Sat, 22 Oct 2022 17:05:06 +0200
Message-Id: <20221022150508.26830-42-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
index 4ced9995f9..c8c1a99bf1 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -422,13 +422,12 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     }
 }
 
-static void pci_piix3_init(Object *obj)
+static void pci_piix_init(Object *obj)
 {
     PIIXState *d = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
-    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
 static Property pci_piix_props[] = {
@@ -443,7 +442,7 @@ static Property pci_piix_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void pci_piix3_class_init(ObjectClass *klass, void *data)
+static void pci_piix_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -451,11 +450,8 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 
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
@@ -466,13 +462,13 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
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
@@ -496,17 +492,29 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
+static void piix3_init(Object *obj)
+{
+    PIIXState *d = PIIX_PCI_DEVICE(obj);
+
+    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
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
 
@@ -533,15 +541,20 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 
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
 
@@ -573,8 +586,6 @@ static void piix4_init(Object *obj)
 {
     PIIXState *s = PIIX_PCI_DEVICE(obj);
 
-    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
-    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
 
@@ -585,36 +596,20 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
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
2.38.1


