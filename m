Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F1069374C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBdr-0007xz-2m; Sun, 12 Feb 2023 07:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdA-0007aR-2B; Sun, 12 Feb 2023 07:38:58 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBd4-0001L2-49; Sun, 12 Feb 2023 07:38:53 -0500
Received: by mail-ej1-x635.google.com with SMTP id dr8so25790505ejc.12;
 Sun, 12 Feb 2023 04:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHFEyRdyZW7De1L6zva0q2BgkJRTtjJyLn9KXbJlxR0=;
 b=kGmzfPSnxtACcyWtpMiOWRkdi4oHNCCYMVXveJqLhGLmS85wc3by3JoEhEs2oL9nlb
 yxEHp8of8BCbpV/hG1PeXmSUHHPO27oqLUKAdGk3/yA4YoWNqT5UYHL8gv8vbnhhDuP9
 XepYDsvOGwweuwtGlDbzteMxM+EbpCV/AHQIJ5JMNIuUjACRxGF4emE6RSfklgH+2G2O
 /5deZlnkstCUtHnWYCU2aXaWAeTkFc+Um4bTOmPLjq1s22UOEPbjBV0dfKoZhApcFriI
 egcWYatqhDfaaM9GoOZWL5G17/ogoDjwFORVVLpIKRRV2EsPK7AXp1MYxFya/Od4Rz23
 L1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHFEyRdyZW7De1L6zva0q2BgkJRTtjJyLn9KXbJlxR0=;
 b=DPne+mJlrJ1KaotHk21kgzb3HEDWBotx8PJgHzEncJgSSx6Mv5okWYAZkK8rY0669F
 GQRy/9ro+kkOrw+MYuE1Rw6wCovXPUnrw8XDMKZHc70BJXXtZ76jmt4H5t2Vmk1vGvnZ
 YCSgnmnlDRGjtsSNT1IkjN6ds5mlqQCIerEoeest7DW7zHufcz1lCuqhfNUlfCoSweBy
 LsUf+8pnBq+4N1t6zNDrjEGeP3yaczyBkM5bGHOQpl3go99ZpsDBJbRyT+FXaP5I1fm0
 MO2tI5LTyhWgb/Tx3K9EGEzFpBOnbQd4xf7nJC3MQnioxrxA+/gUEvTdNma8WgR53ifH
 siTw==
X-Gm-Message-State: AO0yUKUH8lVVSDU1wQ3tHo7dMu3SqstJC1+xPgVnc9Y2Y1Zo53L9amyB
 u78QMvrnEa484P6sj+GmE1altHuhKjs=
X-Google-Smtp-Source: AK7set/gYPJSwZdoriI0P28SP6/383/1n/x2CBe4OAn0/NX1az3FrkAyBd0TC6aGz/lAy1eKNIpV6A==
X-Received: by 2002:a17:906:310e:b0:878:702e:9dff with SMTP id
 14-20020a170906310e00b00878702e9dffmr21032795ejx.41.1676205527293; 
 Sun, 12 Feb 2023 04:38:47 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:46 -0800 (PST)
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
Subject: [PATCH v7 07/23] hw/isa/piix3: Create IDE controller in host device
Date: Sun, 12 Feb 2023 13:37:49 +0100
Message-Id: <20230212123805.30799-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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

Now that PIIX3 contains the new TYPE_ISA_PIC, it is possible to
instantiate PIIX3 IDE in the PIIX3 southbridge. PIIX3 IDE wires up its
interrupts to the ISA bus in its realize method which requires the
interrupt controller to provide fully populated qemu_irqs. This is the
case for TYPE_ISA_PIC even though the virtualization technology isn't
known yet.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-17-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  2 ++
 hw/i386/pc_piix.c             | 16 +++++++---------
 hw/isa/piix3.c                |  8 ++++++++
 hw/i386/Kconfig               |  1 -
 hw/isa/Kconfig                |  1 +
 5 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b1eaab1d95..f84a5d15cf 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci_device.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/ide/pci.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -56,6 +57,7 @@ struct PIIXState {
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
     RTCState rtc;
+    PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index dbddc3d060..bd66a5682b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -41,7 +41,6 @@
 #include "hw/usb.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
-#include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
@@ -98,7 +97,6 @@ static void pc_init1(MachineState *machine,
     PCIBus *pci_bus;
     ISABus *isa_bus;
     Object *piix4_pm;
-    int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
     BusState *idebus[MAX_IDE_BUS];
@@ -219,6 +217,7 @@ static void pc_init1(MachineState *machine,
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
     if (pcmc->pci_enabled) {
+        DeviceState *dev;
         PIIX3State *piix3;
         PCIDevice *pci_dev;
         const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
@@ -249,11 +248,14 @@ static void pc_init1(MachineState *machine,
         piix3->pic = x86ms->gsi;
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
 
-        piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
+        dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
+        pci_ide_create_devs(PCI_DEVICE(dev));
+        idebus[0] = qdev_get_child_bus(dev, "ide.0");
+        idebus[1] = qdev_get_child_bus(dev, "ide.1");
     } else {
         pci_bus = NULL;
         piix4_pm = NULL;
@@ -267,6 +269,8 @@ static void pc_init1(MachineState *machine,
 
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
+        idebus[0] = NULL;
+        idebus[1] = NULL;
     }
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
@@ -295,12 +299,6 @@ static void pc_init1(MachineState *machine,
     pc_nic_init(pcmc, isa_bus, pci_bus);
 
     if (pcmc->pci_enabled) {
-        PCIDevice *dev;
-
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
-        pci_ide_create_devs(dev);
-        idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
-        idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
 #ifdef CONFIG_IDE_ISA
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 007225a96e..dd8b712085 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -29,6 +29,7 @@
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
@@ -312,6 +313,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&d->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&d->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+
     /* USB */
     if (d->has_usb) {
         object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
@@ -360,6 +367,7 @@ static void pci_piix3_init(Object *obj)
     PIIX3State *d = PIIX3_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
 static Property pci_piix3_props[] = {
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 1bf47b0b0b..408301fd8d 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -74,7 +74,6 @@ config I440FX
     select PC_ACPI
     select PCI_I440FX
     select PIIX3
-    select IDE_PIIX
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index cf79580384..17ddb25afc 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -35,6 +35,7 @@ config PIIX3
     bool
     select ACPI_PIIX4
     select I8257
+    select IDE_PIIX
     select ISA_BUS
     select MC146818RTC
     select USB_UHCI
-- 
2.39.1


