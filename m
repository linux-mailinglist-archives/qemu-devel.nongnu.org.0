Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA96A8C23
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrds-0002Nh-V4; Thu, 02 Mar 2023 17:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdn-0002FP-Rd
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:43:12 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdl-0000Ea-SK
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:43:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p16so560576wmq.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCQQownvKCVofCZuEa1Oy69oYC3998RQioNT+3DKDLE=;
 b=X230GNs6TA/wXFb+OGBc8RQbVeviM+3I4GAiwsKtGhv7ul2+Td+pcVGXsAB9iaHYDk
 l16CHZlGSvMqjr6auJSu1URzjv5MzO+vERWRorZlP4Q4b+GC/eTCl1RV+vhLZtVHBXzX
 ISBd1An18H3YjjgmleKfyuZs+dSsBR4RuTDgk/DNBQbrJXGhpQolrlLolDYz3v6dNoz9
 Q57Qg4ItS9f0faVoWieM8BVaJwxzwemZ48o8mZivD97/TC1uDRM6ka65Dlx5bcFFVkML
 3NDnksqQQ1RYC1uGaZcVU65yyNBIc7WWRSNatARsHKWlHEzRtUQAa1uNmzR6D/Ybh2Gl
 hWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCQQownvKCVofCZuEa1Oy69oYC3998RQioNT+3DKDLE=;
 b=tL91EUPTw60qB6W7euN9p3B8D6vZoojkX1t4Ru8DfiWF+1aRcPiWrtOqhXA0pS05w7
 vbu0caQByzWBthvELljkVRzur/MgLgkCl19Oot7NBu5XNdmcF7ZcMASje8NqoCFrPxE8
 w9UhsTCzdv5qrPlJHMhH8x/+8R555h2mC5VsqmEQEUeWCqJIhG4kAtb+9t9WdMBpdYd5
 4XuscjSKQ0IBUfz6pUMFvGBpFkR2vdfFoO3dNvZveEc0dVatWMkijs33ySJpeoX1Upr4
 aELaJPLrYSPCD3QKi9gp1dXd8lExd31ljYJnNXHPp0so5TYk20sLCfj5pZZdmQKolBEt
 K9dQ==
X-Gm-Message-State: AO0yUKV6gBJ/fdMLtOwkyaKSvkV4Q9mcywSCyrOI+9sPMd9oPvvDpPdY
 WwWt6ycAprlTfcZJVpXC1gKMS3inslXnXUXW
X-Google-Smtp-Source: AK7set+qVc5pgspySjAMDEJ4RrC6OcXwmBOJ+aldd16JLs46rGwiV/ODqVtZ7vXFF5ldFP62f4uzeQ==
X-Received: by 2002:a05:600c:450d:b0:3eb:3945:d3f9 with SMTP id
 t13-20020a05600c450d00b003eb3945d3f9mr9625867wmo.4.1677796988825; 
 Thu, 02 Mar 2023 14:43:08 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 h9-20020a5d5049000000b002c54d8b89efsm511156wrt.26.2023.03.02.14.43.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:43:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v3 17/18] hw/isa/piix: Unify QOM type name of PIIX ISA function
Date: Thu,  2 Mar 2023 23:40:57 +0100
Message-Id: <20230302224058.43315-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Mechanical change doing:

  $ sed -i -e 's/PIIX4_PCI_DEVICE/PIIX4_ISA/g' $(git grep -l PIIX4_PCI_DEVICE)
  $ sed -i -e 's/PIIX3_XEN_DEVICE/PIIX3_ISA_XEN/g' $(git grep -l PIIX3_XEN_DEVICE)
  $ sed -i -e 's/PIIX3_DEVICE/PIIX3_ISA/g' $(git grep -l PIIX3_DEVICE)
  $ sed -i -e 's/PIIX3_PCI_DEVICE/PIIX_ISA/g' $(git grep -l PIIX3_PCI_DEVICE)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c             |  5 ++---
 hw/isa/piix3.c                | 20 ++++++++++----------
 hw/isa/piix4.c                | 10 +++++-----
 hw/mips/malta.c               |  2 +-
 include/hw/southbridge/piix.h | 10 +++++-----
 5 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1e90b9ff0d..c887b27009 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -221,8 +221,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
         PCIDevice *pci_dev;
-        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                         : TYPE_PIIX3_DEVICE;
+        const char *type = xen_enabled() ? TYPE_PIIX3_ISA_XEN : TYPE_PIIX3_ISA;
 
         pci_bus = i440fx_init(pci_type,
                               i440fx_host,
@@ -236,7 +235,7 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
-        piix3 = PIIX3_PCI_DEVICE(pci_dev);
+        piix3 = PIIX3_ISA(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 0ee94a2313..38e0c269ae 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -112,7 +112,7 @@ static void piix3_write_config(PCIDevice *dev,
 {
     pci_default_write_config(dev, address, val, len);
     if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
-        PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+        PIIX3State *piix3 = PIIX3_ISA(dev);
         int pic_irq;
 
         pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
@@ -145,7 +145,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
 
 static void piix3_reset(DeviceState *dev)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIX3State *d = PIIX3_ISA(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; /* master, memory and I/O */
@@ -286,7 +286,7 @@ static const MemoryRegionOps rcr_ops = {
 
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIX3State *d = PIIX3_ISA(dev);
     ISABus *isa_bus;
 
     isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
@@ -349,7 +349,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 static void piix3_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIX3State *piix3 = PIIX3_ISA(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
@@ -372,7 +372,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIX3State *piix3 = PIIX3_ISA(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
@@ -399,7 +399,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix_isa_types[] = {
     {
-        .name           = TYPE_PIIX3_PCI_DEVICE,
+        .name           = TYPE_PIIX_ISA,
         .parent         = TYPE_PCI_DEVICE,
         .instance_size  = sizeof(PIIX3State),
         .class_init     = pci_piix3_class_init,
@@ -410,12 +410,12 @@ static const TypeInfo piix_isa_types[] = {
             { },
         },
     }, {
-        .name           = TYPE_PIIX3_DEVICE,
-        .parent         = TYPE_PIIX3_PCI_DEVICE,
+        .name           = TYPE_PIIX3_ISA,
+        .parent         = TYPE_PIIX_ISA,
         .class_init     = piix3_class_init,
     }, {
-        .name           = TYPE_PIIX3_XEN_DEVICE,
-        .parent         = TYPE_PIIX3_PCI_DEVICE,
+        .name           = TYPE_PIIX3_ISA_XEN,
+        .parent         = TYPE_PIIX_ISA,
         .class_init     = piix3_xen_class_init,
     }
 };
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 702b458a3e..90e19a4c37 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -56,7 +56,7 @@ struct PIIX4State {
     uint8_t rcr;
 };
 
-OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_ISA)
 
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
@@ -81,7 +81,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
 
 static void piix4_isa_reset(DeviceState *dev)
 {
-    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
+    PIIX4State *d = PIIX4_ISA(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; // master, memory and I/O
@@ -186,7 +186,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PIIX4State *s = PIIX4_ISA(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
@@ -253,7 +253,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
 static void piix4_init(Object *obj)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
+    PIIX4State *s = PIIX4_ISA(obj);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
@@ -285,7 +285,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix4_info = {
-    .name          = TYPE_PIIX4_PCI_DEVICE,
+    .name          = TYPE_PIIX4_ISA,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIX4State),
     .instance_init = piix4_init,
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ec172b111a..5aefeba581 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1255,7 +1255,7 @@ void mips_malta_init(MachineState *machine)
 
     /* Southbridge */
     piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
-                                            TYPE_PIIX4_PCI_DEVICE);
+                                            TYPE_PIIX4_ISA);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index a58bf13a41..71a82ef266 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -58,11 +58,11 @@ struct PIIX3State {
     MemoryRegion rcr_mem;
 };
 
-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-#define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
+#define TYPE_PIIX_ISA       "pci-piix3"
+#define TYPE_PIIX3_ISA      "PIIX3"
+#define TYPE_PIIX3_ISA_XEN  "PIIX3-xen"
+#define TYPE_PIIX4_ISA      "piix4-isa"
 
-OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_ISA)
 
 #endif
-- 
2.38.1


