Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3818A6A8B21
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNo-0000sI-Ts; Thu, 02 Mar 2023 16:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNn-0000ro-MT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:35 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNl-0002RM-VE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:35 -0500
Received: by mail-ed1-x531.google.com with SMTP id o12so2403965edb.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Kx/g2VrS2dX5K0SmH0rYqZrQLtmH4+SmEOJoYir288=;
 b=FPG8K2qpTSDxamN0GCgLKOZ+IAFarwUzSiwDvcttUpRw7UU98fNIM/NxmNBnV6qY1a
 /aRm7cfz6qS+/XuSREvUkzSrXUzEcZi5bwdRsschnu50lBu5uMaN7QHPeHO2tzmabj4K
 UiTCCYtvTK8U0EGG4GpL0NNIC53mz3L6amIyJGsP2B8HbYEFVxsFxzPbY2zcRkY7HTxT
 86jFxpGoiC0Ud7JkFDnMryCEHd7fGHmF67RtjKXtN05hwfMHL5eiO6s0rM7wzrpwfemr
 XC3Lqx5ALBChIFjhzCJJT/Mk/iUYwaIUMWTqoT5pBhH0ArgeXfduU08djG5ewtXnCKaB
 iWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Kx/g2VrS2dX5K0SmH0rYqZrQLtmH4+SmEOJoYir288=;
 b=kDt1USSPd413DCALJ0Z1qnYql5vnceuRo3V2CSxmRxdndjmXdVfreWRxwSQyOTg6y6
 sybtl6IV8tXVaKsUpFoifZziYn9xUQXMh0mW0dRIHdMaL/9AXycD6TPc7t8IRUdfgX1+
 dQ5cjlvZYfm+4L6rpoKIlv+lIjyCBkPmS/N6rY/MEsAFdNaK+EV9Mwp/WwO1XzJ8f1XM
 lDrH13bdwOa3yzgRpsiI/jYnhWkIMyiJXJSyDxdzURzMCBYrEPGPZgQ9FNB7a4GS31EP
 K3wzIPs82fSoSXBpY/g/u/X7jMPWkU6EMZnlUxc1By3Q/GXbCi011fur+vuKhHWzYsbI
 aE4w==
X-Gm-Message-State: AO0yUKXFuXbSUYEaxcR1tYchnzR1VC7aJ8Jv70xWJS9xj/t1mT7KESGd
 5mIgb34mvjjo383Q+aWjFLdRerx7McM=
X-Google-Smtp-Source: AK7set9mmAyb0ELf3cnLM/5o4Pg+b88TKRIm2/FbNsvcbIcbz9K3qcQyLQkDTDfpsQUVxd0UtbEHzA==
X-Received: by 2002:a17:907:c15:b0:879:bff:55c with SMTP id
 ga21-20020a1709070c1500b008790bff055cmr17368486ejc.1.1677792153073; 
 Thu, 02 Mar 2023 13:22:33 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 22/23] hw/isa/piix: Share PIIX3's base class with PIIX4
Date: Thu,  2 Mar 2023 22:22:00 +0100
Message-Id: <20230302212201.224360-23-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
index 30873b0764..5d4e411e33 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -388,12 +388,11 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
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
@@ -404,7 +403,7 @@ static Property pci_piix_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void pci_piix3_class_init(ObjectClass *klass, void *data)
+static void pci_piix_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -412,11 +411,8 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 
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
@@ -431,9 +427,9 @@ static const TypeInfo piix_pci_type_info = {
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
 
@@ -492,15 +500,20 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 
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
 
@@ -585,7 +598,6 @@ static void piix4_init(Object *obj)
 
     qdev_init_gpio_out_named(DEVICE(obj), &s->cpu_intr, "intr", 1);
 
-    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
 
@@ -596,31 +608,15 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
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
2.39.2


