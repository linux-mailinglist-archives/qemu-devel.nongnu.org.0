Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB34662C9D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:26:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtp-0002mX-Tc; Mon, 09 Jan 2023 12:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtY-0002fa-KT; Mon, 09 Jan 2023 12:25:12 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtW-00010R-NP; Mon, 09 Jan 2023 12:25:12 -0500
Received: by mail-ej1-x634.google.com with SMTP id cf18so15590617ejb.5;
 Mon, 09 Jan 2023 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iEfe8DszwIoCvxSU0reKf5l+UfAr8tT4LsXbGha4/uw=;
 b=q7auXqbaxFTU0U0zqmVmLx47mkNJiYaj1V/bU2uj5BLvNBgGvUmxtyvzNfqgNalOVs
 puCc+LJf27Kujk9HIHNzkHHbJnlknetTOmvxLbRovpRStTV/rRJc8ucMwjGfYeejemfq
 LXFXzDhPqFTNslMVZEH5XtbAiZn3zaYtGQEhL1Ql3foDGxFILsuHW5UbiGgxx8NeVSck
 t6kMqX+m1a6FT4iY3TtgcifxzXRqalsXtq9HGLjQDh4ZW+Ro56jU3PVSPrzMWqwTypV7
 mDE+r1QNduPfE78zPKLS3ulapPu1s7ZbOd0jZC2yfLJcRnk1sfoKX1fOMrIIfp3xuWDV
 O3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iEfe8DszwIoCvxSU0reKf5l+UfAr8tT4LsXbGha4/uw=;
 b=EsmSkCp1VZ7ZUhPOwEFgj4OhUD1SuAn9pMlZXMvqKCrnu8AzogHPezBDjkGEe2Tme6
 hzVj2tWU3FWCzBnTey+c5mRXdnuiYaFTYzc4MeJAZCqPlVrcSK9rgXswKXbuXKo3ZPUv
 3vhVq9BWg2/MPdfnuyfzaqGpIBi9CBBbqJr4QrWmUX2mbJVy698HNz8yoStivkClbLTd
 cSoBlllaTbuUwSzM6M3iIfCgymjYu50o3HuaH45QJ3YKA7q98es4Q3dg3OZYnT02gsH3
 G+5e2/71q7BEh8sDONMdXpXzSTPrtah2avH/5Tc4/mfOdVhbbhvVLNB72JiCYqcweAUq
 /EbA==
X-Gm-Message-State: AFqh2koVvEmhIuU6vrIBYB3b2TpTS+OfU7ROmNsGcfCM4GtWEqTV4KT8
 cG/jrq01lLFOtdASbAmkNtZhkDvCdY+k8Q==
X-Google-Smtp-Source: AMrXdXtN/apqJjHI16o4dfREGHyfDXrn6HpkGdRy0/bd8GWMCHfU+visPPZH0HcYmQ8MjOMA/7Yjug==
X-Received: by 2002:a17:906:1ccc:b0:7c0:d88b:4323 with SMTP id
 i12-20020a1709061ccc00b007c0d88b4323mr50299546ejh.61.1673285108472; 
 Mon, 09 Jan 2023 09:25:08 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 14/33] hw/isa/piix3: Create USB controller in host device
Date: Mon,  9 Jan 2023 18:23:27 +0100
Message-Id: <20230109172347.1830-15-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

The USB controller is an integral part of PIIX3 (function 2). So create
it as part of the south bridge.

Note that the USB function is optional in QEMU. This is why it gets
object_initialize_child()'ed in realize rather than in instance_init.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-13-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  4 ++++
 hw/i386/pc_piix.c             |  7 ++-----
 hw/isa/piix3.c                | 17 +++++++++++++++++
 hw/isa/Kconfig                |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b06d26fa11..762709f2fd 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci_device.h"
 #include "qom/object.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/usb/hcd-uhci.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
@@ -54,12 +55,15 @@ struct PIIXState {
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
     RTCState rtc;
+    UHCIState uhci;
 
     /* Reset Control Register contents */
     uint8_t rcr;
 
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
+
+    bool has_usb;
 };
 typedef struct PIIXState PIIX3State;
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 37afc01d30..61d8152078 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -52,7 +52,6 @@
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
-#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -236,6 +235,8 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_new_multifunction(-1, true, type);
+        object_property_set_bool(OBJECT(pci_dev), "has-usb",
+                                 machine_usb(machine), &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
@@ -314,10 +315,6 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
-    }
-
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         PCIDevice *piix4_pm;
 
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e8ddb6a602..45c20dea17 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -288,6 +288,7 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
     isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
@@ -308,6 +309,16 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
         return;
     }
+
+    /* USB */
+    if (d->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
+                                TYPE_PIIX3_USB_UHCI);
+        qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
+        if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
+            return;
+        }
+    }
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -341,6 +352,11 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
 }
 
+static Property pci_piix3_props[] = {
+    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -360,6 +376,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
+    device_class_set_props(dc, pci_piix3_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index c10cbc5fc1..f01bc0dff3 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -36,6 +36,7 @@ config PIIX3
     select I8257
     select ISA_BUS
     select MC146818RTC
+    select USB_UHCI
 
 config PIIX4
     bool
-- 
2.39.0


