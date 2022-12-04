Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9E5641F2D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:14:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLZ-0002IN-0m; Sun, 04 Dec 2022 14:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLU-0002Gm-FE; Sun, 04 Dec 2022 14:08:12 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLS-0001it-Ns; Sun, 04 Dec 2022 14:08:12 -0500
Received: by mail-ej1-x630.google.com with SMTP id b2so23071363eja.7;
 Sun, 04 Dec 2022 11:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfldgsgnZIXfF7T040WVVojKz+zBXQftfJeOFtrxOKg=;
 b=au2gG86lPML1mpIs3GGvlNXfIu8jtnAuTDtKUleEB+ZLTcKxP4imLVd5tq/Df+gtiB
 JQHJq2mhgs3ZSW6kUpVduogeJK0BXmj4rh4wy3B+HF9KhMsZjj4Ej/V3OxfiBwyyqz2y
 00K8hZ6S/90Sojv3NG9iM6HOmQp2a6l7tcwQsM8D1Iz1fUXo9DmU/o7/rT50G0RlP801
 Rc9QbaHkhkWbqarhI2P/F8edTsGkw6Pic+y0kNVa6Rpa+QVTLUCGdjEj3ngUKZ2YEIzl
 +nP4ZjM/K+CrJXCPH1XBhTospQkrjjwKaKZrvVjvf/NMufeQAHIWpuWttgx5/exvFH2S
 iCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WfldgsgnZIXfF7T040WVVojKz+zBXQftfJeOFtrxOKg=;
 b=AxzsAsXXKFc+8vvYrjC0kRAGGd1VXpaGkNuw/rpxv6fYYW5PB6HdsA0o9LJUPRwsJL
 wJOZElq7R23FDH8mx9eNNVM+AFcyZrKNlfmFxb+K/t1N3qZeK9SIe0CECe5yQg3O5r2m
 fhxZiUgA8V3lmxhWM/RuACx+z8pUZvm7ljeuN/+7mNe6R/xL4rTQ+5bxahf/ko6wlHrD
 23amOcUrq+2IM7ITRC3daQcTEIKjMNs2KKDk/OlSW/54mOgXbMaj9K98VyRjVUxpOBkc
 XBzm10wZxDGzfGCrsriUS64wRCWeAPEBtkO15bRVY+fDDIBdcaYAOknPE0Ct1x1VSSfk
 wVdw==
X-Gm-Message-State: ANoB5pkP4IXoHsx7aIH/z5GhJNH77Pj6Brmmt7YgGogAkMSFwQNi30yQ
 qChKDNFPKIQxXy4o0e2lghAZp74jlC4=
X-Google-Smtp-Source: AA0mqf7/ZssFwg12j5TwFgIMBHKcps/Dl+y0ckAD/NX2zOQbsCrJZDCGbBEj6g37UdBi2OG9uwMURQ==
X-Received: by 2002:a17:906:2851:b0:78d:88c7:c1bf with SMTP id
 s17-20020a170906285100b0078d88c7c1bfmr51454933ejc.299.1670180888861; 
 Sun, 04 Dec 2022 11:08:08 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:08:08 -0800 (PST)
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
Subject: [PATCH 29/32] hw/isa/piix: Rename functions to be shared for
 interrupt triggering
Date: Sun,  4 Dec 2022 20:05:50 +0100
Message-Id: <20221204190553.3274-30-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

PIIX4 will get the same optimizations which are already implemented for
PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-40-shentey@gmail.com>
---
 hw/isa/piix.c | 56 +++++++++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index f37851c5f4..3d1659e5fd 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -40,47 +40,47 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-static void piix3_set_irq_pic(PIIXState *piix3, int pic_irq)
+static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
-    qemu_set_irq(piix3->pic.in_irqs[pic_irq],
-                 !!(piix3->pic_levels &
+    qemu_set_irq(piix->pic.in_irqs[pic_irq],
+                 !!(piix->pic_levels &
                     (((1ULL << PIIX_NUM_PIRQS) - 1) <<
                      (pic_irq * PIIX_NUM_PIRQS))));
 }
 
-static void piix3_set_irq_level_internal(PIIXState *piix3, int pirq, int level)
+static void piix_set_irq_level_internal(PIIXState *piix, int pirq, int level)
 {
     int pic_irq;
     uint64_t mask;
 
-    pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
+    pic_irq = piix->dev.config[PIIX_PIRQCA + pirq];
     if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
     mask = 1ULL << ((pic_irq * PIIX_NUM_PIRQS) + pirq);
-    piix3->pic_levels &= ~mask;
-    piix3->pic_levels |= mask * !!level;
+    piix->pic_levels &= ~mask;
+    piix->pic_levels |= mask * !!level;
 }
 
-static void piix3_set_irq_level(PIIXState *piix3, int pirq, int level)
+static void piix_set_irq_level(PIIXState *piix, int pirq, int level)
 {
     int pic_irq;
 
-    pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
+    pic_irq = piix->dev.config[PIIX_PIRQCA + pirq];
     if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
-    piix3_set_irq_level_internal(piix3, pirq, level);
+    piix_set_irq_level_internal(piix, pirq, level);
 
-    piix3_set_irq_pic(piix3, pic_irq);
+    piix_set_irq_pic(piix, pic_irq);
 }
 
-static void piix3_set_irq(void *opaque, int pirq, int level)
+static void piix_set_irq(void *opaque, int pirq, int level)
 {
-    PIIXState *piix3 = opaque;
-    piix3_set_irq_level(piix3, pirq, level);
+    PIIXState *piix = opaque;
+    piix_set_irq_level(piix, pirq, level);
 }
 
 static void piix4_set_irq(void *opaque, int irq_num, int level)
@@ -157,29 +157,29 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 }
 
 /* irq routing is changed. so rebuild bitmap */
-static void piix3_update_irq_levels(PIIXState *piix3)
+static void piix_update_irq_levels(PIIXState *piix)
 {
-    PCIBus *bus = pci_get_bus(&piix3->dev);
+    PCIBus *bus = pci_get_bus(&piix->dev);
     int pirq;
 
-    piix3->pic_levels = 0;
+    piix->pic_levels = 0;
     for (pirq = 0; pirq < PIIX_NUM_PIRQS; pirq++) {
-        piix3_set_irq_level(piix3, pirq, pci_bus_get_irq_level(bus, pirq));
+        piix_set_irq_level(piix, pirq, pci_bus_get_irq_level(bus, pirq));
     }
 }
 
-static void piix3_write_config(PCIDevice *dev,
-                               uint32_t address, uint32_t val, int len)
+static void piix_write_config(PCIDevice *dev, uint32_t address, uint32_t val,
+                              int len)
 {
     pci_default_write_config(dev, address, val, len);
     if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
-        PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
+        PIIXState *piix = PIIX_PCI_DEVICE(dev);
         int pic_irq;
 
-        pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
-        piix3_update_irq_levels(piix3);
+        pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix->dev));
+        piix_update_irq_levels(piix);
         for (pic_irq = 0; pic_irq < ISA_NUM_IRQS; pic_irq++) {
-            piix3_set_irq_pic(piix3, pic_irq);
+            piix_set_irq_pic(piix, pic_irq);
         }
     }
 }
@@ -201,7 +201,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
         }
     }
 
-    piix3_write_config(dev, address, val, len);
+    piix_write_config(dev, address, val, len);
 }
 
 static void piix_reset(DeviceState *dev)
@@ -261,7 +261,7 @@ static int piix3_post_load(void *opaque, int version_id)
      */
     piix3->pic_levels = 0;
     for (pirq = 0; pirq < PIIX_NUM_PIRQS; pirq++) {
-        piix3_set_irq_level_internal(piix3, pirq,
+        piix_set_irq_level_internal(piix3, pirq,
             pci_bus_get_irq_level(pci_get_bus(&piix3->dev), pirq));
     }
     return 0;
@@ -518,7 +518,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, piix3_pci_slot_get_pirq,
+    pci_bus_irqs(pci_bus, piix_set_irq, piix3_pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
@@ -527,7 +527,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
+    k->config_write = piix_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.38.1


