Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4F5A9D39
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:37:07 +0200 (CEST)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnBi-0005ZW-Fj
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1s-0001cX-N9
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:56 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1p-0001TY-Q1
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bj12so35783176ejb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=E8CdrfDzNOCCHxJsZeXx/7U1h4ccAVACKCfHIdwwrww=;
 b=eNWXWBT9k61wDTAq9YS9IWiA9ljDsk9chfV48TH++0KPLi3xa1uhBojj3K3cQ1sl6X
 JeNMKBNFgSSYLFJh/hC4Cq1AcN5AtY8MLHa3GF9dW89TeCzS8FaaoVXlgeKjwC4LcZUX
 DT5Cci9APwkAQj3rp+ysQdht/5KQW1zH9SvO1tlrvLZjiz1sxTnL1H6zwJk5urAkz7iF
 GvAMSMRg+80gUJbFrAz3Cjo4y4PfCYZ39HVnKKdys6kKtVX7D15k0NA455QVGcaS2EgX
 KQeqm0wpdrl41c1zCGwTYPDywWPmx1HLJigjDe5L7L78L4HvI54KufoVjvKev6rKMaKT
 YXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=E8CdrfDzNOCCHxJsZeXx/7U1h4ccAVACKCfHIdwwrww=;
 b=S/Rd2LTVPdPK8lAXEPtt6mdtjxeafQjnribeFf3HMzSiLSl/aoN7iYa210XhELmTru
 49S9xBq5l3GU7CQDtugO8q1uFTU6pJf5TlVsOlHTqj5a2kzVuFFtkw0AqjgKcMa16B09
 BQ9yblpXvhweeAipPw0Mk03iNNCTZlA1nnnPrlshjHJ9O++QSl+ACCwy+fHBVtXhKTQF
 IOAYWwid9vKBsam8jiEdid79iw61eI3nE9wD7efRdi/86eUb+BKtS6+JagSE0qRCwL9e
 3OPOmHCC/PIPLxfSZjAwnZQFCRmZoaf4xsNNreOQYulztoyInlgUA+z4UF3lJGo/1Xgi
 C0Mw==
X-Gm-Message-State: ACgBeo3isi9aHRJRLGqztU1ZZ4jHzThpEtbNTwpuo1qVqbrEn25oaS1q
 06NGPfjMGPaaqVBftC2gxsGf9pLSTCA=
X-Google-Smtp-Source: AA6agR5Rr3oRXbOzvRovbQV1aiuTe00PRSi/eAehrBZkf62yoIGXRcSyYD0iEujLLQU6kIImFo7img==
X-Received: by 2002:a17:907:7215:b0:741:416f:fb59 with SMTP id
 dr21-20020a170907721500b00741416ffb59mr18594301ejc.150.1662049611881; 
 Thu, 01 Sep 2022 09:26:51 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:51 -0700 (PDT)
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
Subject: [PATCH 05/42] hw/isa/piix3: Create USB controller in host device
Date: Thu,  1 Sep 2022 18:25:36 +0200
Message-Id: <20220901162613.6939-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

The USB controller is an integral part of PIIX3 (function 2). So create
it as part of the south bridge.

Note that the USB function is optional in QEMU. This is why it gets
object_initialize_child()'ed in realize rather than in instance_init.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             |  6 ++----
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                | 17 +++++++++++++++++
 include/hw/southbridge/piix.h |  4 ++++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b08d946992..76ac8b2035 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -219,6 +219,8 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_new_multifunction(-1, true, type);
+        object_property_set_bool(OBJECT(pci_dev), "has-usb",
+                                 machine_usb(machine), &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
@@ -297,10 +299,6 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
-    }
-
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         PCIDevice *piix4_pm;
 
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 6e8f9cac54..f02eca3c3e 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -36,6 +36,7 @@ config PIIX3
     select I8257
     select ISA_BUS
     select MC146818RTC
+    select USB_UHCI
 
 config PIIX4
     bool
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 96ab7107e2..27052a5546 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -297,6 +297,7 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
     isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
@@ -319,6 +320,16 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
         return;
     }
+
+    /* USB */
+    if (d->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
+                                "piix3-usb-uhci");
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
@@ -359,6 +375,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
+    device_class_set_props(dc, pci_piix3_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b1fa08dd2b..5367917182 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
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
 
-- 
2.37.3


