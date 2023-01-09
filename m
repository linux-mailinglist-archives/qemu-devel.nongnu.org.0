Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB807662CBD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:31:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtT-0002XQ-9X; Mon, 09 Jan 2023 12:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtQ-0002V6-JW; Mon, 09 Jan 2023 12:25:04 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtN-00011P-Iz; Mon, 09 Jan 2023 12:25:03 -0500
Received: by mail-ej1-x62a.google.com with SMTP id az20so2851990ejc.1;
 Mon, 09 Jan 2023 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFZLkOaHIgvv7qhFZA095vQcTQAdXZAkOVZq4bJbsfE=;
 b=g9araM3lg2wNSJzfp7RczUUcwINUOSLD3Mo8jgyiqMVkWwqFW6JCD05juS6vcquNgx
 fHYW9hidr6/St7fjR8rTIwyzRXsNXsPIFJjHQJK8zAIbjj2UOlAJ0HkQNLSTaJWALMtX
 etiB3VmGqS5P0J3klKnroOJFsnVxu8M6DnSFahYchELEO09vZKDwl6PwM+byHwvjZp2w
 8VXG2Tfl0ebk3KwL1w3p0Nrfh/BtYDfj/KxtTKgGBVYwi5s5+igyRT5OVjiU93iLv8x8
 Nx3W9+LSUkdTZjMPlLaW5Zi+PRxzWyJeHo0ljR/iOJ/E7UYL8nOMDVmhlniFS6sZTGfY
 GZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFZLkOaHIgvv7qhFZA095vQcTQAdXZAkOVZq4bJbsfE=;
 b=iwCX6q2vg7fgK3zCtLLsGnBf0AGFuIHgYtiHa+0ms6VvzDra5G7cwjMfgXJILXPtNy
 aMCQZUNjhOOzrL+QJkOEj+zidQjecmFQeO0PVYkNW5y4IggA63Qw3n8iQHZXZscmjd9c
 d8W06DJryxlmGddo3RBsvelcJ9u/DKtNg5DGrXcSw/+Ov3zlEVWGsaU3Xpk+YYd4ar/I
 oVe74WNHeZwb/sVVEpF9fKo/5kaUtWKsmxQSgTzntBLpGTGcVrwjXLtJsDQvmufZNn8f
 8giZafKJ84Wc0OokKhM3Oy1QGeckBoD6/6wOERm+KrJzMeoWqKV3KRyHR0X9BHuMiN06
 DZxw==
X-Gm-Message-State: AFqh2krPUot9ZgqaHLGy81KB2chMoBMbNDvPmA5xymC5r/a9bTeFlmDA
 ey+A+lIMD4uNFTXIMG2QIuayAbCTDrlFXg==
X-Google-Smtp-Source: AMrXdXutevugZNah43TQK1WxTCGu9IZqHbGVJ6UuSfI0k3nFmawfb7leXuGcprbwJz5QhsSiRLRQfg==
X-Received: by 2002:a17:906:2859:b0:7c1:32:3574 with SMTP id
 s25-20020a170906285900b007c100323574mr45893559ejc.12.1673285098622; 
 Mon, 09 Jan 2023 09:24:58 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:58 -0800 (PST)
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
Subject: [PATCH v6 06/33] hw/isa/piix4: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Mon,  9 Jan 2023 18:23:19 +0100
Message-Id: <20230109172347.1830-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

pci_map_irq_fn's in general seem to be board-specific, and PIIX4's
pci_slot_get_pirq() in particular seems very Malta-specific. So move the
latter to malta.c to 1/ keep the board logic in one place and 2/ avoid
PIIX4 to make assumptions about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c  | 26 --------------------------
 hw/mips/malta.c | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9c79c9677b..6e9434129d 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -79,31 +79,6 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    /* PIIX4 USB */
-    case 10:
-        return 3;
-    /* AMD 79C973 Ethernet */
-    case 11:
-        return 1;
-    /* Crystal 4281 Sound */
-    case 12:
-        return 2;
-    /* PCI slot 1 to 4 */
-    case 18 ... 21:
-        return ((slot - 18) + irq_num) & 0x03;
-    /* Unknown device, don't do any translation */
-    default:
-        return irq_num;
-    }
-}
-
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
@@ -272,7 +247,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
 
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
-    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
 }
 
 static void piix4_init(Object *obj)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c3dcd43f37..94d4c49bf5 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -39,6 +39,7 @@
 #include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
 #include "hw/ide/pci.h"
@@ -1161,6 +1162,31 @@ static void malta_mips_config(MIPSCPU *cpu)
     }
 }
 
+static int malta_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    /* PIIX4 USB */
+    case 10:
+        return 3;
+    /* AMD 79C973 Ethernet */
+    case 11:
+        return 1;
+    /* Crystal 4281 Sound */
+    case 12:
+        return 2;
+    /* PCI slot 1 to 4 */
+    case 18 ... 21:
+        return ((slot - 18) + irq_num) & 0x03;
+    /* Unknown device, don't do any translation */
+    default:
+        return irq_num;
+    }
+}
+
 static void main_cpu_reset(void *opaque)
 {
     MIPSCPU *cpu = opaque;
@@ -1414,6 +1440,7 @@ void mips_malta_init(MachineState *machine)
     /* Northbridge */
     dev = sysbus_create_simple("gt64120", -1, NULL);
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
+    pci_bus_map_irqs(pci_bus, malta_pci_slot_get_pirq);
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
      * exception when accessing invalid memory. Create an empty slot to
-- 
2.39.0


