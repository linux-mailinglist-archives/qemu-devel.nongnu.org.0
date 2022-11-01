Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2C6150AD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprnE-00061a-0x; Tue, 01 Nov 2022 09:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnA-00060h-Mo
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprn9-0004ai-1V
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:00 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso12984372pjc.5
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
 b=kXoWPb7z90kKbAeXXd2etNNEnx4AafNiu06r/CJAVhGq2z68pG1b/vUsFYxMnvZS8p
 GDvOlUWukCAUbS7EwwDfNW0DDRLXDtvAsaS60t45zy7WlWSy8aUMKRk1+q+uxm/zMsfb
 WFalx++HDIKMHiRJDuLjz7sHm5TeleCwHOt8g4TOobIV9WMgy8MsMkaHBNjhnQ7FAxrG
 JIYk0peNdkRYMZy/DXLrVxWhJsQxg/6SJif+jT/0s5CYWBj7F43kRLHSq/y0DYvsWxtf
 Y6fmfZQ40utC+eYxro2e4g6PfzrIyPoI/c44pde3NLOI/Ys+Q2gOx1Ze4pfoYubykGo2
 HlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
 b=s4DNU28A/R8WT2vPu7lcAsRRcK0/VQSsx0OZkMKuhdVcIKfCL/8HxtpYayWw9ZIPZ9
 wc30gUOOg5eLbHSzNDx2YogZgbW+81XSeWtaU8Ruz4JFTojYwEczBvoC4gdj850TzTmk
 Mu4J2S8mGsVD6hweMbRLfCwN525U0tNla0lGFAQfAvAaiiJA/H2nNSbwuiNKV2KO/9XJ
 n7iAUKmfcxoDZEeg31CIS34jmWp6UZ6cC775CkPREOaEkWrkI9XKCnK+GIoQ+w+yFhX0
 7q3f0PsfX/XNnpSE8uaESoKyOshlEnCyVKHv7fCXuhZj0UTCUD9LlLbD7IH6oPK1DRrq
 C8dQ==
X-Gm-Message-State: ACrzQf28unomMuvZqLCH8yecg99ho3vrgB4pKSl6hIURUSG2Lopyn7pe
 s4cNn0BOjHMQ48e5Rmys+4yD2cKYrvFn7qze
X-Google-Smtp-Source: AMsMyM5G1FVGw2sTazsI1Oap5WQwTyIjarlpN6TU+ZXqu9/cf42JSWddZFVLq9xDE1KzsnTfzkVHew==
X-Received: by 2002:a17:902:e405:b0:186:b1bb:147a with SMTP id
 m5-20020a170902e40500b00186b1bb147amr19682358ple.19.1667311137354; 
 Tue, 01 Nov 2022 06:58:57 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 11/17] pci/shpc: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:43 +0900
Message-Id: <20221101135749.4477-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of shpc_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci-bridge/pci_bridge_dev.c  |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c |  2 +-
 hw/pci/shpc.c                   | 23 ++++++-----------------
 include/hw/pci/shpc.h           |  3 +--
 4 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 657a06ddbe..4b6d1876eb 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -66,7 +66,7 @@ static void pci_bridge_dev_realize(PCIDevice *dev, Error **errp)
         dev->config[PCI_INTERRUPT_PIN] = 0x1;
         memory_region_init(&bridge_dev->bar, OBJECT(dev), "shpc-bar",
                            shpc_bar_size(dev));
-        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0, errp);
+        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0);
         if (err) {
             goto shpc_error;
         }
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index df5dfdd139..99778e3e24 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -42,7 +42,7 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
     d->config[PCI_INTERRUPT_PIN] = 0x1;
     memory_region_init(&pcie_br->shpc_bar, OBJECT(d), "shpc-bar",
                        shpc_bar_size(d));
-    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0, errp);
+    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0);
     if (rc) {
         goto error;
     }
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e71f3a7483..5b3228c793 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -440,16 +440,11 @@ static void shpc_cap_update_dword(PCIDevice *d)
 }
 
 /* Add SHPC capability to the config space for the device. */
-static int shpc_cap_add_config(PCIDevice *d, Error **errp)
+static void shpc_cap_add_config(PCIDevice *d)
 {
     uint8_t *config;
-    int config_offset;
-    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC,
-                                       0, SHPC_CAP_LENGTH,
-                                       errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
+    uint8_t config_offset;
+    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC, 0, SHPC_CAP_LENGTH);
     config = d->config + config_offset;
 
     pci_set_byte(config + SHPC_CAP_DWORD_SELECT, 0);
@@ -459,7 +454,6 @@ static int shpc_cap_add_config(PCIDevice *d, Error **errp)
     /* Make dword select and data writable. */
     pci_set_byte(d->wmask + config_offset + SHPC_CAP_DWORD_SELECT, 0xff);
     pci_set_long(d->wmask + config_offset + SHPC_CAP_DWORD_DATA, 0xffffffff);
-    return 0;
 }
 
 static uint64_t shpc_mmio_read(void *opaque, hwaddr addr,
@@ -584,18 +578,13 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 }
 
 /* Initialize the SHPC structure in bridge's BAR. */
-int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned offset, Error **errp)
+int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar, unsigned offset)
 {
-    int i, ret;
+    int i;
     int nslots = SHPC_MAX_SLOTS; /* TODO: qdev property? */
     SHPCDevice *shpc = d->shpc = g_malloc0(sizeof(*d->shpc));
     shpc->sec_bus = sec_bus;
-    ret = shpc_cap_add_config(d, errp);
-    if (ret) {
-        g_free(d->shpc);
-        return ret;
-    }
+    shpc_cap_add_config(d);
     if (nslots < SHPC_MIN_SLOTS) {
         return 0;
     }
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index d5683b7399..18ab16ec9f 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -38,8 +38,7 @@ struct SHPCDevice {
 
 void shpc_reset(PCIDevice *d);
 int shpc_bar_size(PCIDevice *dev);
-int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned off, Error **errp);
+int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar, unsigned off);
 void shpc_cleanup(PCIDevice *dev, MemoryRegion *bar);
 void shpc_free(PCIDevice *dev);
 void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len);
-- 
2.38.1


