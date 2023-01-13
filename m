Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A487B66A12F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHv-0002hg-73; Fri, 13 Jan 2023 10:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHs-0002fO-HY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHq-0006Xt-RY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:12 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so19056035wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZv1aBP22CJYNPpwWsHYyzzFVllV/sO8yGsxaU0io8I=;
 b=bm+dGUdhHEfD75vWbztUhfTJ0PxzE8gf4WERZKG3a6E7v+qJebAQpVuCDK9mikJwJd
 j1ji8NDg/oBqdMrTwq+cUU/ZSq9l1gVY8gq8y4O6+UeTY/EGwGIrBamCe25hyqhI02sh
 Yhfrl48DMvouFonhdx6k1QdQ1b70z8u5eYOikNrr+pnKoYZcDCt04f8CkYaLD3gEocId
 TjjXVy2GTr2Iu1DV1BgKOrV8YVzSAhIwPAfPGjowZpuIANAJDT8bOMeyvm5y7DRGqbU3
 ax/ulOy3fIlFDGmccgnIjTimmvQLr3enFTSiZ8DE3uz7BQSsgP9TCdNa6pDmRSOQ8Dxz
 +sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZv1aBP22CJYNPpwWsHYyzzFVllV/sO8yGsxaU0io8I=;
 b=KotCjj8QK/b4IHgDWHMEJB8pkTQINLGL5irCtIPAhqtiPjznVUsaE36jDQQPsHfnnj
 w/Y3oT+hLuguLnMQ2DahY3oNLARcmo+wiJJAFnzJGBbOe8BwD8BBzr4Z8PYH3ZCm5lyu
 DYN7CJ4wmnYMK7woFJFmdPiRPDvXxn98sjRmJPrzjXshsMxuVDaiqTx64NWeaM8y4Zi/
 QmtkZ5G3+uc1dJ/fdwJaviHzo5ZleDk6B6oPeN0KLvM5Ljtd2cnjT4hzznsqMYcO6iG4
 QvQGdvr1gBEpO6vRIB5eNVwZm1bqq11+qik2siQtPNOt3SKlXdxmuadl/6Khl3/7dX7I
 7eFQ==
X-Gm-Message-State: AFqh2kpCacXf9KD97nGlMOFGG+lNSCfc98eSBKYH7nbUiYgfiA/ASl8d
 oAQ+CMz012gBN3RDezJIxIzLZsnLJVplGwYF
X-Google-Smtp-Source: AMrXdXuAru47IE3qtXS2KfStwuAZIgg+DkbyEVLOST03AhPyAKRt8p6Xk4RaIG5LWVSHfdv1mKFmqA==
X-Received: by 2002:a05:600c:4fcf:b0:3d1:d396:1ade with SMTP id
 o15-20020a05600c4fcf00b003d1d3961ademr58308745wmq.9.1673624889098; 
 Fri, 13 Jan 2023 07:48:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003cffd3c3d6csm27758505wmq.12.2023.01.13.07.48.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 32/46] hw/isa/piix4: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Fri, 13 Jan 2023 16:45:18 +0100
Message-Id: <20230113154532.49979-33-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

pci_map_irq_fn's in general seem to be board-specific, and PIIX4's
pci_slot_get_pirq() in particular seems very Malta-specific. So move the
latter to malta.c to 1/ keep the board logic in one place and 2/ avoid
PIIX4 to make assumptions about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230109172347.1830-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index 8bf2e2ff5f..ec172b111a 100644
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
@@ -993,6 +994,31 @@ static void malta_mips_config(MIPSCPU *cpu)
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
@@ -1225,6 +1251,7 @@ void mips_malta_init(MachineState *machine)
     qdev_prop_set_bit(dev, "cpu-little-endian", !be);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
+    pci_bus_map_irqs(pci_bus, malta_pci_slot_get_pirq);
 
     /* Southbridge */
     piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
-- 
2.38.1


