Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A648CE25
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 23:00:39 +0100 (CET)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7lfa-0006Ew-JJ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 17:00:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n7lIk-0008RB-Tu; Wed, 12 Jan 2022 16:37:03 -0500
Received: from [2a00:1450:4864:20::541] (port=45963
 helo=mail-ed1-x541.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n7lIi-00052V-Gw; Wed, 12 Jan 2022 16:37:02 -0500
Received: by mail-ed1-x541.google.com with SMTP id z22so15216143edd.12;
 Wed, 12 Jan 2022 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWSHJ466Gc/72HN7jFQTmp67kv9rm6BTkU0JJlveaDs=;
 b=SOWC83Nc1ovSWNM2GXItL0p+oUK9PT/iV1kdiQAzYn/QOQHu0Vql6j9La61xez9zIi
 z5J+A2TPqXEJmKu2n1rQYjdKkNn3PeMuP0971BPBC+ytvE4qXaNRVj301hKZ4DFxZ9lj
 PHlRptS1tFqgSGQ2S60ULn5PTDeq/lKrQgoodaf5tIIAZdaIiosN/kMMMAmul6nWPH8c
 m+94kl1OE4aa3bsLSmLyVUAeHkTlcI0rdKV5mk0ZSsMPtAgnXfm/PB5mADBesmNX9P+q
 AUnPu4JAt8KoKOfqIMxeGg8ao2ofKGmhJskXC6a3ojyQwN+G/xT3sGNqLhEco8Kx/sBD
 Y/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWSHJ466Gc/72HN7jFQTmp67kv9rm6BTkU0JJlveaDs=;
 b=5w9/6+Ieo5/kF95BkVbHL5G7+tvlSB6sh1qbZHbvJZsz2ggvECZC1x1QVKgfSwEtq3
 ePr5elIvF2BWiyI255BOPZNX/zNcuHZ8J3PMIjPECErABZnLx4NF8btVv00VXJRddAJh
 yKpwH9GJ/eQ2N9Owj/sQyZrRRTCTpiPD6qbhchWcclMmc0nYGxzPsOJjDYZ5jGAWjxCQ
 RgCEzZwHj2Rnt23+/j39nJHNVDLifNlC+aMhe2VXAK/cEj6gLemYA+Aw4rzJyIHMCVOH
 x6Mzlo6E3S3330O03+pF3HaSd9ln76iuKn0Bjk5Ecj9xrkReHwLpyAndhsOgk4xZTMpY
 NrWw==
X-Gm-Message-State: AOAM532S13o4t+gNjz36NpUZzJKYvL1Eqfih/xdwFY1lirCo9diEopPo
 f1udx6Mq33Z+t4INZzXti7nazAg4RiT6laHSOi6ktA==
X-Google-Smtp-Source: ABdhPJyFnaG031s16D0kL20oMpU40WvAU6JlyBhGfsmJ4j82e4yQpJqUvDILA0ftypVxk67b1YnJBA==
X-Received: by 2002:a17:907:1692:: with SMTP id
 hc18mr1240574ejc.25.1642023418496; 
 Wed, 12 Jan 2022 13:36:58 -0800 (PST)
Received: from osoxes.fritz.box (mue-88-130-49-239.dsl.tropolys.de.
 [88.130.49.239])
 by smtp.gmail.com with ESMTPSA id b2sm257288ejh.221.2022.01.12.13.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:36:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] pci: Always pass own DeviceState to pci_map_irq_fn's
Date: Wed, 12 Jan 2022 22:36:27 +0100
Message-Id: <20220112213629.9126-3-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112213629.9126-1-shentey@gmail.com>
References: <20220112213629.9126-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::541
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Jan 2022 16:56:18 -0500
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>,
 Bernhard Beschow <shentey@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Passing own DeviceState rather than just the IRQs allows for resolving
global variables.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c          | 6 +++---
 hw/pci-host/sh_pci.c    | 6 +++---
 hw/pci-host/versatile.c | 6 +++---
 hw/ppc/ppc440_pcix.c    | 6 +++---
 hw/ppc/ppc4xx_pci.c     | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 5a86308689..a31e9714cf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -60,7 +60,7 @@ static int pci_irq_levels[4];
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
-    qemu_irq *pic = opaque;
+    PIIX4State *s = opaque;
 
     pci_irq_levels[irq_num] = level;
 
@@ -75,7 +75,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_irq_levels[i];
             }
         }
-        qemu_set_irq(pic[pic_irq], pic_level);
+        qemu_set_irq(s->i8259[pic_irq], pic_level);
     }
 }
 
@@ -323,7 +323,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
 
     for (int i = 0; i < ISA_NUM_IRQS; i++) {
         s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 719d6ca2a6..ae0aa462b3 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -111,9 +111,9 @@ static int sh_pci_map_irq(PCIDevice *d, int irq_num)
 
 static void sh_pci_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pic = opaque;
+    SHPCIState *s = opaque;
 
-    qemu_set_irq(pic[irq_num], level);
+    qemu_set_irq(s->irq[irq_num], level);
 }
 
 static void sh_pci_device_realize(DeviceState *dev, Error **errp)
@@ -128,7 +128,7 @@ static void sh_pci_device_realize(DeviceState *dev, Error **errp)
     }
     phb->bus = pci_register_root_bus(dev, "pci",
                                      sh_pci_set_irq, sh_pci_map_irq,
-                                     s->irq,
+                                     s,
                                      get_system_memory(),
                                      get_system_io(),
                                      PCI_DEVFN(0, 0), 4, TYPE_PCI_BUS);
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index f66384fa02..5fbcb72d7d 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -362,9 +362,9 @@ static int pci_vpb_rv_map_irq(PCIDevice *d, int irq_num)
 
 static void pci_vpb_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pic = opaque;
+    PCIVPBState *s = opaque;
 
-    qemu_set_irq(pic[irq_num], level);
+    qemu_set_irq(s->irq[irq_num], level);
 }
 
 static void pci_vpb_reset(DeviceState *d)
@@ -422,7 +422,7 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
         mapfn = pci_vpb_map_irq;
     }
 
-    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s->irq, 4);
+    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s, 4);
 
     /* Our memory regions are:
      * 0 : our control registers
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index 788d25514a..291c1bfbe7 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -431,14 +431,14 @@ static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
 
 static void ppc440_pcix_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pci_irq = opaque;
+    PPC440PCIXState *s = opaque;
 
     trace_ppc440_pcix_set_irq(irq_num);
     if (irq_num < 0) {
         error_report("%s: PCI irq %d", __func__, irq_num);
         return;
     }
-    qemu_set_irq(*pci_irq, level);
+    qemu_set_irq(s->irq, level);
 }
 
 static AddressSpace *ppc440_pcix_set_iommu(PCIBus *b, void *opaque, int devfn)
@@ -492,7 +492,7 @@ static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init(&s->busmem, OBJECT(dev), "pci bus memory", UINT64_MAX);
     h->bus = pci_register_root_bus(dev, NULL, ppc440_pcix_set_irq,
-                         ppc440_pcix_map_irq, &s->irq, &s->busmem,
+                         ppc440_pcix_map_irq, s, &s->busmem,
                          get_system_io(), PCI_DEVFN(0, 0), 1, TYPE_PCI_BUS);
 
     s->dev = pci_create_simple(h->bus, PCI_DEVFN(0, 0), "ppc4xx-host-bridge");
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 5df97e6d15..f6718746a1 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -256,11 +256,11 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 
 static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pci_irqs = opaque;
+    PPC4xxPCIState *s = opaque;
 
     trace_ppc4xx_pci_set_irq(irq_num);
     assert(irq_num >= 0 && irq_num < PPC4xx_PCI_NUM_DEVS);
-    qemu_set_irq(pci_irqs[irq_num], level);
+    qemu_set_irq(s->irq[irq_num], level);
 }
 
 static const VMStateDescription vmstate_pci_master_map = {
@@ -319,7 +319,7 @@ static void ppc4xx_pcihost_realize(DeviceState *dev, Error **errp)
     }
 
     b = pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
-                              ppc4xx_pci_map_irq, s->irq, get_system_memory(),
+                              ppc4xx_pci_map_irq, s, get_system_memory(),
                               get_system_io(), 0, ARRAY_SIZE(s->irq),
                               TYPE_PCI_BUS);
     h->bus = b;
-- 
2.34.1


