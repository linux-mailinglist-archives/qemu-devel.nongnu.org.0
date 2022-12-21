Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF7653502
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82UE-0003tm-7A; Wed, 21 Dec 2022 12:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82T7-0002zh-3O; Wed, 21 Dec 2022 12:01:26 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82T4-0008BF-Vv; Wed, 21 Dec 2022 12:01:24 -0500
Received: by mail-ed1-x52d.google.com with SMTP id a16so22856251edb.9;
 Wed, 21 Dec 2022 09:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qvdQCOdq6I33qatd1xPhJ5uBvMd+KH7fqQdqEhmOJw=;
 b=awrFinTW0zNtz30KwvEsp3LwHOWk2El/RAyGlWti8KW35BIfizD/XiU9LRaBa5mWYl
 yIfY0jQdBrq/70yt8eNy9j7Rd+THDAcwcqVTs6q9qnLiur8l8F3Lhg3Hpe6+0aju4TZ/
 x/Ez794YjMRB7EB5qtL6eFEUEUZjgjHwXBd3DHB8MEWq1AgFbq9JbKRhlsFTKArpjOCB
 NIVj9v+Zu34g+Hez0KzKCbAXC0LdnK7jCclGP2/lNbyF8Tfp9Hn5z/DZ0u9wp1zednxf
 VJa6SEf6gyAPU8pAkeSJt93h2sXoUqCHbN5ZtHRnMtIo9TDHDz1lYZIQqM6rfnG3a7nB
 ZzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qvdQCOdq6I33qatd1xPhJ5uBvMd+KH7fqQdqEhmOJw=;
 b=17m2S6UQOu2KZMmEJ0qq/imiWAv2fPGKvpK+Wfzb/tCfCtlQyQhPED2haFSrI2AUEP
 z7iIT/dXh6eFU/y7Rhwfqby+DX8eO391W/RNTL2OsX9fxO65UQYJMmGPJ/5/dXwWgydX
 ddaK3wacprqkr6WtQ1toXvl2dCkTjsMCTnqxb/efognaPJdfzIeLhdh6gxUMJrRNOljF
 U265Cr98Ubk9YfJrnsUfxaw+Y2376Fpt351gprwi12cOeOg7xF7zDkXrH/Ga/p58Q2ac
 4idsjdJSvPpmKaSFdSrGbQwHdzr4CJymmP1zVzw3JZFu9vTM9MEB3j/qSPXIgXWRCg2I
 SgQQ==
X-Gm-Message-State: AFqh2krB+jcYSV3amxGj3NwAy9Lc21NQCsAzXeuD6qWGBEyxQqw2x4cs
 l/IP4zu2/0BQcTk4xj5lQNKhLyolU8A=
X-Google-Smtp-Source: AMrXdXvudmzE0regQJkpFiadJBmEdnEu0RM2qz2RFXDqryKNlCOhzKV+t/fbgb2SOzSF9tjidhyBNA==
X-Received: by 2002:a05:6402:321a:b0:472:3008:bcfc with SMTP id
 g26-20020a056402321a00b004723008bcfcmr2413645eda.15.1671642081060; 
 Wed, 21 Dec 2022 09:01:21 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:20 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 28/30] hw/isa/piix: Rename functions to be shared for
 interrupt triggering
Date: Wed, 21 Dec 2022 18:00:01 +0100
Message-Id: <20221221170003.2929-29-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-40-shentey@gmail.com>
---
 hw/isa/piix.c | 56 +++++++++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index de54ac5abe..db7ed72c1e 100644
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
@@ -121,29 +121,29 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
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
@@ -165,7 +165,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
         }
     }
 
-    piix3_write_config(dev, address, val, len);
+    piix_write_config(dev, address, val, len);
 }
 
 static void piix_reset(DeviceState *dev)
@@ -225,7 +225,7 @@ static int piix3_post_load(void *opaque, int version_id)
      */
     piix3->pic_levels = 0;
     for (pirq = 0; pirq < PIIX_NUM_PIRQS; pirq++) {
-        piix3_set_irq_level_internal(piix3, pirq,
+        piix_set_irq_level_internal(piix3, pirq,
             pci_bus_get_irq_level(pci_get_bus(&piix3->dev), pirq));
     }
     return 0;
@@ -482,7 +482,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix_set_irq, piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -490,7 +490,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
+    k->config_write = piix_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.39.0


