Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7176A8B24
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNq-0000si-Et; Thu, 02 Mar 2023 16:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNm-0000r9-Fq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:34 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNk-0002Sy-IT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:34 -0500
Received: by mail-ed1-x536.google.com with SMTP id da10so2537420edb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qAhyJnCASmVYNz2C++4x3cLZkEKpScng4rvFLIxlK/s=;
 b=H8viYHdahmkcNBlynrHMJaN+00UOQhXQbqcVMdUbg9HHUuvnk55XwVfuzOu0kORNq9
 cyMaScuGPTjrG872jaYT9Kx8rG12+Q8RZya7L2phVzL+mzjsD0VCTLhZgpyxXC776b5C
 msyVqfo1YkQjegr3P1KFRE4JClY9mTQY/Eah2Z23WQDZ0LZtBpVFRu3TIBnoE7do/2LM
 DPwDrTj/Z0n+R992vXEPjhsb7DYl7yde0kojqpae/5HycuA3fOOHbkFF0zh83asXYXhD
 lQxEqpGMc6iY9HcmaYKsUL2X51gHqKXVe/ZeR9ZzUKFTMTW+vHkUI0ZjV84/4KRu4c6w
 T/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAhyJnCASmVYNz2C++4x3cLZkEKpScng4rvFLIxlK/s=;
 b=z+A3IOl/o0krj2dmWk52cb1aEqZiv8apxa1jaMUh6NmQMwXJ3wjN3ikQVEpIUr9YKS
 A/Fl0bG9XY00SLYsSqYuTxkg7vqIGB0HrlZJeezidBLTkuM9JvEkYcUcbTC/D0xNDI99
 pptZ4k76Z9Ybsg9+xxOeVYd/SToMNjdLzzBkovaT2U9HKxndro/p68j71yg5Z/LNnchY
 scieS4ZI9Yc8zaL3+L9cNrmaaNY0OWHLIREmEvbWvtkx2lF5mbj/Jk1aSY345jytwzJ8
 +eKjWpgyTMf9yiR8Yvg5wUc7rGKzsalj4bzSBpd78/bLzzU237aDg62Hj7Lk1i8HtdJf
 kV4w==
X-Gm-Message-State: AO0yUKUa+k1dfEUcftNN9XKmYo5ygBdRwBhZfTLnXFvpLoYnjk/TvqKX
 uyJedrHgNvWSe4aRLu1VHZZ2MjPAKCg=
X-Google-Smtp-Source: AK7set9a1+JtTcjxg5Kz6kXoaCfM/E5/r87D6HWYt+3sFw9/iC72o9/oR9fpULFeyQPhuy9901UWVg==
X-Received: by 2002:a17:906:b748:b0:8fc:c566:dc67 with SMTP id
 fx8-20020a170906b74800b008fcc566dc67mr12636491ejb.64.1677792151044; 
 Thu, 02 Mar 2023 13:22:31 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 20/23] hw/isa/piix: Rename functions to be shared for
 interrupt triggering
Date: Thu,  2 Mar 2023 22:21:58 +0100
Message-Id: <20230302212201.224360-21-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
index 8206cbebf3..d6c39d6f37 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -41,47 +41,47 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-static void piix3_set_irq_pic(PIIXState *piix3, int pic_irq)
+static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
-    qemu_set_irq(piix3->pic[pic_irq],
-                 !!(piix3->pic_levels &
+    qemu_set_irq(piix->pic[pic_irq],
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
@@ -122,29 +122,29 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
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
@@ -166,7 +166,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
         }
     }
 
-    piix3_write_config(dev, address, val, len);
+    piix_write_config(dev, address, val, len);
 }
 
 static void piix_reset(DeviceState *dev)
@@ -226,7 +226,7 @@ static int piix3_post_load(void *opaque, int version_id)
      */
     piix3->pic_levels = 0;
     for (pirq = 0; pirq < PIIX_NUM_PIRQS; pirq++) {
-        piix3_set_irq_level_internal(piix3, pirq,
+        piix_set_irq_level_internal(piix3, pirq,
             pci_bus_get_irq_level(pci_get_bus(&piix3->dev), pirq));
     }
     return 0;
@@ -473,7 +473,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix_set_irq, piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -481,7 +481,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
+    k->config_write = piix_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.39.2


