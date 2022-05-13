Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814155268E3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:00:09 +0200 (CEST)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZaB-0006cQ-B6
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVG-0008Am-N5; Fri, 13 May 2022 13:55:02 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVE-0004jL-C9; Fri, 13 May 2022 13:55:02 -0400
Received: by mail-ej1-x62b.google.com with SMTP id z2so17691668ejj.3;
 Fri, 13 May 2022 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrxtAcaTGjuEUtnIiGymO3XGo8jE/fdwJXlC8ObcJxA=;
 b=QHLPNPYDQ89UyjPg5Bw679LR8mm+8wQM4JC8MbIrmQ9uO3xzTfoNZ+vKnE7kPZCBrb
 5d0oI63RH2NsakIH+9a4T48rBqINRdRIHcuQguBxRlJ6rdLBg3B8eJOO5pRNqEU5C+2u
 A3+0E3cpOB/CcCAmRDPSswweog0jGD/0s3vPAwaDy6dtz9GU04CAB85WmhfxdsIJwJG7
 eGMZpr5nnan10yD3tF5LwVNBTuDgOn7uTJGhBYFVeJoF11ZMrolx9wgiBRbhfN9qUHc3
 GZz7SxoutkweM1oJF1AQHzwe+CpCAowsKd/C1gWGWj07nlNTHVnoR+Yle6oM9fhAqOvp
 3Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrxtAcaTGjuEUtnIiGymO3XGo8jE/fdwJXlC8ObcJxA=;
 b=s2e+3Q8fmdVWG/yO/7mqBf9JfBYMJFE1TWJTg69lFZ7nuXjUSZ+KQO6Ol5mLMZa3nK
 iJU0pbamxpYsV/4tQv1oUyoW3+X6SiSL9kNc8IgEtW1BMSoY1yAD0k0nQGSIsmYsQt62
 NtyXgmU/KAPEKdJT+lVxnbArzGwUU/Kei5Zn3XT2quPA4NxlF/IXmTrVGqytsvtoZInV
 e3tjM5JPwCgtJaf9B95dPmHY3fI23UA+qMwz738+9PUaJ6WyUra2EZ2hZ7Mve2uyKEYD
 gsl2gDuzWG7Thm94m6a/j9805kU/pBOgU4NK93gagHvOEARqmWkigesnu/f3HK6+OeGA
 YCdA==
X-Gm-Message-State: AOAM530brQzEy1niKTQ5MPRxyn7DqBYpJWAWqo+B8s/dnjXgs+OSM2xm
 uN4yTI0uMNEwHQNRx7IR5ukHZUZbTw0=
X-Google-Smtp-Source: ABdhPJx/nzHCRWL86SlTyX6pKQ59KMS9KKQqj7NV9wT/W65/Io1eW8NPvatZ7Si8wxcz1a7M9TZ0jw==
X-Received: by 2002:a17:907:7745:b0:6f3:674a:339 with SMTP id
 kx5-20020a170907774500b006f3674a0339mr5219857ejc.207.1652464498541; 
 Fri, 13 May 2022 10:54:58 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e3esm953874ejc.164.2022.05.13.10.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 10:54:58 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 2/6] hw/isa/piix{3,
 4}: Move pci_map_irq_fn's near pci_set_irq_fn's
Date: Fri, 13 May 2022 19:54:41 +0200
Message-Id: <20220513175445.89616-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513175445.89616-1-shentey@gmail.com>
References: <20220513175445.89616-1-shentey@gmail.com>
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

The pci_map_irq_fn's were implemented below type_init() which made them
inaccessible to QOM functions. So move them up.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 22 +++++++++++-----------
 hw/isa/piix4.c | 50 +++++++++++++++++++++++++-------------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dab901c9ad..7d69420967 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -81,6 +81,17 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
     piix3_set_irq_level(piix3, pirq, level);
 }
 
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIX3State *piix3 = opaque;
@@ -353,17 +364,6 @@ static void piix3_register_types(void)
 
 type_init(piix3_register_types)
 
-/*
- * Return the global irq number corresponding to a given device irq
- * pin. We could also use the bus number to have a more precise mapping.
- */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
-{
-    int slot_addend;
-    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
-    return (pci_intx + slot_addend) & 3;
-}
-
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 {
     PIIX3State *piix3;
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8607e0ac36..a223b69e24 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -73,6 +73,31 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
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
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
@@ -265,31 +290,6 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
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
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
     PIIX4State *s;
-- 
2.36.1


