Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5538693763
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBib-0005fI-Fg; Sun, 12 Feb 2023 07:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdV-0007wJ-LC; Sun, 12 Feb 2023 07:39:19 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdT-0001TP-Q2; Sun, 12 Feb 2023 07:39:17 -0500
Received: by mail-ej1-x636.google.com with SMTP id ud5so25900506ejc.4;
 Sun, 12 Feb 2023 04:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QHbUaI0Ec+Hdq+N8Eab5ijhnfOTiXt3yR08zteSDcjU=;
 b=BHw5+ogMjzt39rCs44vok85WDJeloBHs7bSwJulBYzO8btrCXVPki4e4R0N9K2+T1T
 y8g5lowZ2VBanL7CoU+Wxg29XMiBbCCm18AlcqFbv7XMrHeOWhQssUeW4WNWu5eKLpCe
 GuH+FagaC03WkKLks1pkuvEQfj3C7XostvCX5Y4RX7PJUwcIFOcUVU9bp6wDM88ki4Xq
 qMPVaq3ENvozPzw/Cd0HMQHW4pD6dm9PXKMrSmnsXpSvU1jhFPdObNzAM3AK7Dkato9b
 Phr3L0e8NsEMFA31YLcXVRezCGhVV8Sj31SgGdJD7pCmLSS5laVe/vZckHXx3/TX2JCm
 58mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHbUaI0Ec+Hdq+N8Eab5ijhnfOTiXt3yR08zteSDcjU=;
 b=xBGPonQTuI30bvbu0lAK81A+2x+phg4gjwBt6jZAanqoUKNpVEynk5KUc0ehPd+VuW
 vF5q1oOWqcR6OXSfKBXZqend0jtiuBm3SnzpPnxbviMjjYA+2LLCkrg98FDOewOmwpQd
 AIUcWP3gTwd4GiJ18ugCej6HbKSBNuUVz1TGlR8FOctt0SR7yf9ZITSIR2iKgveQPW5E
 eAI3ExPDiAPmB/qjsvfiuPgawa3mPpcPQ7jsbpkhJAq/P4UgbNzP5/sbL7mUyGPHCmyk
 Oo5WesRx51YBmcTrCw5borhpa6KCKFi7haCI8cyYij7S7QtmhYEueeckSvNM1ZvsRQxh
 iUPg==
X-Gm-Message-State: AO0yUKWgtbMoem3iff531ftgU+Ks9pN0zPs1uq/5s5kT0dc3coBNIv7L
 qcYDxDV9cdrxlSDMibRZYxhalKEgDM0=
X-Google-Smtp-Source: AK7set8S2sSwpjZAPsKnMi4RoYYXi7ir0Q6c3QUEH7r1D2tBR5BuC0bnd+FkqC/uKYgjaZ+nyBV36g==
X-Received: by 2002:a17:906:4084:b0:878:7471:6da7 with SMTP id
 u4-20020a170906408400b0087874716da7mr24578323ejj.66.1676205552878; 
 Sun, 12 Feb 2023 04:39:12 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:39:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 23/23] hw/isa/piix: Share PIIX3's base class with PIIX4
Date: Sun, 12 Feb 2023 13:38:05 +0100
Message-Id: <20230212123805.30799-24-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Having a common base class will allow for substituting PIIX3 with PIIX4
and vice versa. Moreover, it makes PIIX4 implement the
acpi-dev-aml-interface.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-42-shentey@gmail.com>
---
 hw/isa/piix.c | 48 ++++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 0c644dc6e6..0c2d560b85 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -381,12 +381,11 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     qbus_build_aml(bus, scope);
 }
 
-static void pci_piix3_init(Object *obj)
+static void pci_piix_init(Object *obj)
 {
     PIIXState *d = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
-    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
 static Property pci_piix_props[] = {
@@ -397,7 +396,7 @@ static Property pci_piix_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void pci_piix3_class_init(ObjectClass *klass, void *data)
+static void pci_piix_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -405,11 +404,8 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 
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
@@ -424,9 +420,9 @@ static const TypeInfo piix_pci_type_info = {
     .name = TYPE_PIIX_PCI_DEVICE,
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
@@ -456,17 +452,29 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
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
     .parent        = TYPE_PIIX_PCI_DEVICE,
+    .instance_init = piix3_init,
     .class_init    = piix3_class_init,
 };
 
@@ -499,15 +507,20 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 
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
     .parent        = TYPE_PIIX_PCI_DEVICE,
+    .instance_init = piix3_init,
     .class_init    = piix3_xen_class_init,
 };
 
@@ -555,7 +568,6 @@ static void piix4_init(Object *obj)
 
     qdev_init_gpio_out_named(DEVICE(obj), &s->cpu_intr, "intr", 1);
 
-    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
 
@@ -566,31 +578,15 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
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
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
 };
 
 static void piix3_register_types(void)
-- 
2.39.1


