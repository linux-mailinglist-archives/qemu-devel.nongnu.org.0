Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7A641F1A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:09:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLe-0002Lg-Hs; Sun, 04 Dec 2022 14:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLZ-0002JF-24; Sun, 04 Dec 2022 14:08:17 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLW-0001jn-UD; Sun, 04 Dec 2022 14:08:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id qk9so5327492ejc.3;
 Sun, 04 Dec 2022 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPBJYaNb5t8JLFccVseFLIPVe5ir62CAXXTwo5Sx7Qs=;
 b=Q3ukOjQwopTt527Vytz7WFZt53fm/aBhoK5rhy5YZ/noEUKNuygtsGquKLlcZmCVeG
 V8OuZciHTKicMiY1wCSotYkxwRgX/fGCC+IB5avc1L6/sOXXxpdLIIy+RUXFN/yHA7tk
 Byy09W7FKjWUq9k8K2FupYQCQsB5zVMu8oeY6/i8tnk8Sol1Tkzxt66E052+2ongIm0u
 YAjsswTb4lRHC7O09gTUY+fHw1oXQJeCgIiznL7lQX8ENRPCvAPDDaCKAh9qgMNGM28a
 eCj+jh7MBcXoy+3tPAGCu9cG7is5V5iQNYjx2DjQSTBTGMuEKWp5CD5kN6g3a3AkHU+k
 0APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPBJYaNb5t8JLFccVseFLIPVe5ir62CAXXTwo5Sx7Qs=;
 b=10mZMbj2fo1mgusYrNY53QbbHxXyvkymb8tSKTARNvs7FP9ZhplbYJE1/BlLY05JWk
 xADKdI69xvF83sUX90SEghzKhe3fNek9yIaCSOInAudCVoWvjYt88cicA0MDTvfDoYpg
 qaMjCmKbQSD28zSUaOrC27uWd8CDug9Ijv+GI1GBMxJvD5cST2hdb8OV+Imsj7vDuQzJ
 Rvs6NCHwfoCi0oN76O2bHLnLmq4ux1EB4Y/N33rNt4ssz6VeXZ8/rd+e9jVE4vorrh/m
 JJgck1xJTGLIsn47PH5UwENU8I+KB8abJOnn7j9hWOSG8631JfMtxP4H8k61dyjbG0UF
 Ipgg==
X-Gm-Message-State: ANoB5pkh0DGPGAcC/ixmRWuBphGwSfiRNs+v8th8ZLQGjsnTW6W63/Tt
 nBzaqvp/aRI8bm7zkJsANaqhgsHhTeU=
X-Google-Smtp-Source: AA0mqf53KPRJc1dTz1DouQM6GeflLVy4d4K53vsVm2pUfdKsClIK+ud9Sgw+2wrVeoaIIdpyaUisQA==
X-Received: by 2002:a17:906:f2c8:b0:7c0:eeae:242d with SMTP id
 gz8-20020a170906f2c800b007c0eeae242dmr2443772ejb.672.1670180891986; 
 Sun, 04 Dec 2022 11:08:11 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:08:11 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 31/32] hw/isa/piix: Share PIIX3 base class with PIIX4
Date: Sun,  4 Dec 2022 20:05:52 +0100
Message-Id: <20221204190553.3274-32-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

Having a common base class allows for substituting PIIX3 with PIIX4
and vice versa. Moreover, it makes PIIX4 implement the
acpi-dev-aml-interface.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-42-shentey@gmail.com>
---
 hw/isa/piix.c | 53 +++++++++++++++++++++++----------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index d05f1aa4ff..70fe1166c1 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -432,13 +432,12 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     }
 }
 
-static void pci_piix3_init(Object *obj)
+static void pci_piix_init(Object *obj)
 {
     PIIXState *d = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_PROXY_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
-    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
 static Property pci_piix_props[] = {
@@ -449,7 +448,7 @@ static Property pci_piix_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void pci_piix3_class_init(ObjectClass *klass, void *data)
+static void pci_piix_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -457,11 +456,8 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 
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
@@ -472,13 +468,13 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
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
@@ -502,17 +498,29 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
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
 
@@ -539,15 +547,20 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 
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
 
@@ -579,8 +592,6 @@ static void piix4_init(Object *obj)
 {
     PIIXState *s = PIIX_PCI_DEVICE(obj);
 
-    object_initialize_child(obj, "pic", &s->pic, TYPE_PROXY_PIC);
-    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
 
@@ -591,36 +602,20 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 
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


