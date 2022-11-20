Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C526C6314C3
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 16:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owlu6-0002KL-Nw; Sun, 20 Nov 2022 10:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owlu5-0002JR-7D; Sun, 20 Nov 2022 10:06:41 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owlu3-0001xl-Cz; Sun, 20 Nov 2022 10:06:40 -0500
Received: by mail-ej1-x633.google.com with SMTP id m22so23387426eji.10;
 Sun, 20 Nov 2022 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Zh5kljSKyLV2en7a07D0RyTRcfllpFZEVpu0lha4HU=;
 b=fJk2e5FTLNeAu8w5XXddGM0l9T0K8W37jumtAcoQ1pasLTAsRkB8HnwP1D7uzXYf5k
 DJ1DbWoHnjS8pUlRS9Sr9Ng0efjldfYp1cEqmGJ7FaD9vM+hf9vF+HqDsg+/ju2qkx6U
 AfK9FcSCBBbLdrJv1qifZpAccsr9WED5xwePAKNKIxMtYoQbxh4d3emGsMpwsGIn24Em
 G1L8nvLhHH0ZHhz2ljwjf9fifNrQXy76o11PmileFXCt4jjbalCCXDyLP1T7qlg4jba8
 M25PY+zoPZAbkg6c0QcK6fmau+l1aKZd/aPGE27IHhRevrggSUl1Sw8BAGNNDruWK8Ea
 xsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Zh5kljSKyLV2en7a07D0RyTRcfllpFZEVpu0lha4HU=;
 b=FW5nzy8lCDdwqq081FdfcwWMDwC4QwZbix1RRCDZksqGwLJWAZPPtnzBnmWSZHL2/d
 wl27xQ1xFgXEHA343LiMV06pOyBJqGhKpNN71Q7t2nuNmt15GZ2lkYtru0krIr+3HhLf
 mTrWerDwRr4Tco9bO9yJriMtlYPYvoTCcTtRt15pmJc/sCj1PAaNoEKlPvWxOxxNI69q
 xNTr0VT1B2RRcAQet2CByc6XkGWb0VCEymi9Jm0mfZ3G6jbhDJBcXnZO/41BByySIHfO
 8NZArgN+AvKvGAbD+4bQBI8Wk88E+pydnM9/MipBL8oNcRGy/hBqqprjKoalvCjxFzL4
 XHIQ==
X-Gm-Message-State: ANoB5pl0HY1aBRc8cuXXVmQqF2suK90EKZMWFUGTr2x17NBnQ9TyWP0U
 iFgWi5PExPBkfeX8FsaHg5IHu2goLKI=
X-Google-Smtp-Source: AA0mqf5cKphuOh8pzn7WzNY+JoeS33iZ4JlPEN2FvPREDFodMamcjjhsJ1fHmd0OF1GUWg8pwbMnqA==
X-Received: by 2002:a17:906:706:b0:7ac:2e16:eb05 with SMTP id
 y6-20020a170906070600b007ac2e16eb05mr12937504ejb.26.1668956796802; 
 Sun, 20 Nov 2022 07:06:36 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-067-205.77.13.pool.telefonica.de. [77.13.67.205])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b007b2a3cad2cfsm4026785ejh.132.2022.11.20.07.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 07:06:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 3/3] hw/isa/piix4: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Sun, 20 Nov 2022 16:05:50 +0100
Message-Id: <20221120150550.63059-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120150550.63059-1-shentey@gmail.com>
References: <20221120150550.63059-1-shentey@gmail.com>
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

pci_map_irq_fn's in general seem to be board-specific, and PIIX4's
pci_slot_get_pirq() in particular seems very Malta-specific. So move the
latter to malta.c to 1/ keep the board logic in one place and 2/ avoid
PIIX4 to make assumptions about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c  | 26 --------------------------
 hw/mips/malta.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index f9211d085f..eca96fb8f0 100644
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
index c0a2e0ab04..e435f80973 100644
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
@@ -1140,6 +1141,31 @@ static void malta_mips_config(MIPSCPU *cpu)
     }
 }
 
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
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
@@ -1411,6 +1437,8 @@ void mips_malta_init(MachineState *machine)
     /* Interrupt controller */
     qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
 
+    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
+
     /* generate SPD EEPROM data */
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
     smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
-- 
2.38.1


