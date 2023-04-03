Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF76D3E4D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:43:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEp4-0001hg-PL; Mon, 03 Apr 2023 03:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEoy-0001fe-48
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEow-0006e3-A6
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id r11so28241272wrr.12
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680507700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EuJujhhzp9QT+Va/F4M2q8YBrUEweb2g4rehnqe99A=;
 b=hcViKZ3qPuwgtA4SsDAiRVSOd64zBPnpHxw+0VBLBeB50VFc/rKXi7fhu7V71wdQ1h
 FxpfO/RXYDuxhNYh2ttxusHsPNk+t2vE9+H9K9bhKMFQmuSkwffp5fkmeD16xMkbxQQ3
 LXpNEKoDVtB45+OBM29Ey1FV8APapXHq6pMgasM66BMhL7Waih4O+UCiJoBRyIbd16zz
 253w1Lis8Qh0rRlo2FH1+2zh1X8aqANyAQo//WYFAC4MkQPKgVheB4UURa3XhtGzyOrn
 Ar8I+OmZhfK340m5fuvAT+mWzcInzHAYzg7cJgstXkUtstVizW6nuDwjuLuv0636VIOC
 vMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/EuJujhhzp9QT+Va/F4M2q8YBrUEweb2g4rehnqe99A=;
 b=BuitH3cbAiN1yFOPP81AR1oqrP/YPYtHxl0wW/5w++Kv9/ZqSN8+B3jJ/Yys6k5hHV
 InjJjw8Q9aUfinFjymwbGwZVYcBRswvfm1H6/BrQoeDV52mW0TyLKHnczToxX9b9Tj8j
 o8g/PqZ++v9Uxz1mtKg4N/MDWfFP5sBrW5xziYxJSKhVlQeKGNTHoS0xl5LvBcQP5X8i
 aE+y0fgyjKphJIqUE7pa0VKdml+suwitziEw2OPhR/61LBYrh097Abf+zcGqJjVcneXH
 xq7z/mqVnXVylUkaTZzdABN10o/qkXZ52kXQBYFj+fol8aervlrhDiyC9QDZLngcyyO8
 OtHA==
X-Gm-Message-State: AAQBX9e0Xoj/SDTGzO1dQe0mJwKE9RznNIVsIlxIPqyR0FSd342Kpb9X
 kXcfgpKrmvrY1UG6+awd2ub0ZGluHMWMoQ==
X-Google-Smtp-Source: AKy350ZZP0vLfS334AXJ1QOOCUu1Iz6IfelFWZ0j6MBXF/9ON1OR+oP0rMSuxPQc4qp6H8kpAFlguw==
X-Received: by 2002:a5d:68cb:0:b0:2cf:fd6:b83f with SMTP id
 p11-20020a5d68cb000000b002cf0fd6b83fmr12153147wrw.8.1680507700653; 
 Mon, 03 Apr 2023 00:41:40 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 5/7] hw/isa/piix3: Avoid Xen-specific variant of
 piix3_write_config()
Date: Mon,  3 Apr 2023 09:41:22 +0200
Message-Id: <20230403074124.3925-6-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x433.google.com
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

Subscribe to pci_bus_fire_intx_routing_notifier() instead which allows for
having a common piix3_write_config() for the PIIX3 device models.

While at it, move the subscription into machine code to facilitate resolving
TYPE_PIIX3_XEN_DEVICE.

In a possible future followup, pci_bus_fire_intx_routing_notifier() could
be adjusted in such a way that subscribing to it doesn't require
knowledge of the device firing it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-5-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 18 ++++++++++++++++++
 hw/isa/piix3.c    | 22 +---------------------
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 99232701b1..1b70470dcd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -88,6 +88,21 @@ static int pc_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
     return (pci_intx + slot_addend) & 3;
 }
 
+static void piix_intx_routing_notifier_xen(PCIDevice *dev)
+{
+    int i;
+
+    /* Scan for updates to PCI link routes (0x60-0x63). */
+    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
+        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
+        if (v & 0x80) {
+            v = 0;
+        }
+        v &= 0xf;
+        xen_set_pci_link_route(i, v);
+    }
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -239,6 +254,9 @@ static void pc_init1(MachineState *machine,
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
 
         if (xen_enabled()) {
+            pci_device_set_intx_routing_notifier(
+                        pci_dev, piix_intx_routing_notifier_xen);
+
             /*
              * Xen supports additional interrupt routes from the PCI devices to
              * the IOAPIC: the four pins of each PCI device on the bus are also
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 7a31caf2b6..737f5c6a5d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -121,26 +121,6 @@ static void piix3_write_config(PCIDevice *dev,
     }
 }
 
-static void piix3_write_config_xen(PCIDevice *dev,
-                                   uint32_t address, uint32_t val, int len)
-{
-    int i;
-
-    /* Scan for updates to PCI link routes (0x60-0x63). */
-    for (i = 0; i < len; i++) {
-        uint8_t v = (val >> (8 * i)) & 0xff;
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
-        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
-        }
-    }
-
-    piix3_write_config(dev, address, val, len);
-}
-
 static void piix3_reset(DeviceState *dev)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
@@ -390,7 +370,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config_xen;
+    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.40.0


