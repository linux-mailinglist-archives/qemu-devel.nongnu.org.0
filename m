Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77100609728
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 01:08:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhlj-0002fr-TA
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5x-0007R5-Ko; Sat, 22 Oct 2022 11:07:29 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5v-0002Ex-UI; Sat, 22 Oct 2022 11:07:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id l22so16110428edj.5;
 Sat, 22 Oct 2022 08:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8hu31e9pDHJWjjPPm2MkBHAytS07YvU4Lx1ZTlY5J4=;
 b=i0jUN5G6AXoczHlUo3Zx9tWvYoR0jVnKmJHKGThwv+DUGQ3hjSl5HtY84/AQajpWQ9
 fGP9+oE3xwo5urA2hlbrbyv+Ybuq98JXbfB1nruCblc71vcKJBcckvYvdIkKEGt4HVJL
 vGa5dR6B5tM29FuFC28EeHPRC0Ou98hJUqywl7cDPktriwYA3U/4/dQTvvEYbleNFcBt
 ceal65OxG5bO9wOvi8oQNMFkFFYwdxXwOoqwFUXV45vt8wJs5/yFpT3qO8RqNPooqj8b
 AoLEWm89A97Y0xEjyaBwKJNN0s5gmmM1pZmKNu4j8wlIfM4Y5mD8I6uz0AEl7/MgvGc/
 hIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8hu31e9pDHJWjjPPm2MkBHAytS07YvU4Lx1ZTlY5J4=;
 b=av3rESMlCwtAhiSgKZ5Jf0ghb6Y3A0Y36u1Yu8P0Rl/3QJr6cveFVQkektPhvmYQkG
 6KmvLege6We5VKCU5DzcqQNRlP0W4RlH3M2Wd6scT9Wd+3CY+OuHT3IXMFiM+uLSqM1i
 DbwCpD380o4rLZs9q3jzgmKLbRjPRdooIW3AEMwquA/gzIR41zJCVbyOUBVL0YOseBGM
 JQXcmj4rpx6LcG1PXNj9LPwPjO3BFZv7C+9P219CEzAThq5rnRYaH005+/YKlcuZv3H3
 xTdFy7p14VUf9p5odSnqw/BSUiWhwsX2+FcihYiZA2kM66/JVs3xrEqwTt4DS6JFPlZV
 pooA==
X-Gm-Message-State: ACrzQf3xT5tLynIWQHvFNmmoh6wWQtSTTHcSebcazNwsZS14hL4ybYO5
 F6w5ltvcz6oP9jAYm55hUFtqtJdalEUTfg==
X-Google-Smtp-Source: AMsMyM6cXM5nmUjPyR4TU6WYwlk64B4+O4e05Iv9WIQeY1tYietFOqJCsQieR2U7fuuvIEuDdFBcKw==
X-Received: by 2002:a17:907:94c1:b0:792:56d7:2879 with SMTP id
 dn1-20020a17090794c100b0079256d72879mr15416676ejc.144.1666451246590; 
 Sat, 22 Oct 2022 08:07:26 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 39/43] hw/isa/piix: Rename functions to be shared for
 interrupt triggering
Date: Sat, 22 Oct 2022 17:05:04 +0200
Message-Id: <20221022150508.26830-40-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PIIX4 will get the same optimizations which are already implemented for
PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 56 +++++++++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 9e7b11bcdd..446105a7a1 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -41,47 +41,47 @@
 
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
@@ -158,29 +158,29 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
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
@@ -202,7 +202,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
         }
     }
 
-    piix3_write_config(dev, address, val, len);
+    piix_write_config(dev, address, val, len);
 }
 
 static void piix_reset(DeviceState *dev)
@@ -262,7 +262,7 @@ static int piix3_post_load(void *opaque, int version_id)
      */
     piix3->pic_levels = 0;
     for (pirq = 0; pirq < PIIX_NUM_PIRQS; pirq++) {
-        piix3_set_irq_level_internal(piix3, pirq,
+        piix_set_irq_level_internal(piix3, pirq,
             pci_bus_get_irq_level(pci_get_bus(&piix3->dev), pirq));
     }
     return 0;
@@ -512,7 +512,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, piix3_pci_slot_get_pirq,
+    pci_bus_irqs(pci_bus, piix_set_irq, piix3_pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
@@ -521,7 +521,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
+    k->config_write = piix_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.38.1


