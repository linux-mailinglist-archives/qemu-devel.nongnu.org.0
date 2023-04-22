Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E623C6EB9E2
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:10:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq7-0001we-MX; Sat, 22 Apr 2023 11:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq3-0001tz-PQ; Sat, 22 Apr 2023 11:07:47 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq0-0005A4-S7; Sat, 22 Apr 2023 11:07:47 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94ef8b88a5bso386990766b.2; 
 Sat, 22 Apr 2023 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176062; x=1684768062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9kVTPlX8DiGsGTShCFlllQtTOdseSDfVb7thuNqOyg=;
 b=VLKqI8gNsQPIaJbKx16jDSeWJV4Ikref3wbhLJOtNTCbixMywEFHy92saAj5/BMCN7
 LrYuEW9/EuCf6x5Hrx+3cXcWOyEPukqNGQmmVN7flAfB30fj3T2sfmmBebQvTRtxsFob
 zZWOI4cYog2tKNUCWQ1DOqBBSEuHpWRVXieDwQUlZWn4PWW82az46/UanFO9zJPRkwia
 c4HpnvFss8+jvuw13cCBYvmN28qoHtmLdHnWGDlxbh8bUYBREVOXtc6+LB1ivJWAN4Ly
 P7q5DKaMyuq79rutyYsR1muMcHe6umEJxbof7hpoVV0E3wOmcUt1ntWwWXV6tE7+zOk0
 yHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176062; x=1684768062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9kVTPlX8DiGsGTShCFlllQtTOdseSDfVb7thuNqOyg=;
 b=J+z/HGg5VzDqphJ5WsQT0OoNWQJbdcCVc5wptg+pBYiZ0l0o93eaNF/n2r1d5plCpJ
 7Cd1M2PhM/VyxGApjL2WB1KaYsorQWgptWPCXXivSDnXF2M6kt5xFqZlJ9lPBr07MK9z
 Y4VyfMlcSnCunRs2B0MbJ3ZwhoDrhkD2jiGSg2Spk0Cy+epdPbj7RkF/GHmtnwkrw6M3
 9aylS7+i0UhkV/1kecImX9FoeoUni3ZuUaBvLyTRYkuWOMHxo5By7EYdltDgRC8ITl7Q
 +uHNJy7mkhnKTF/DBHcGxAd4pLWnQ6jG6aiXo5cVpf1bQ2W9E0cYB33nTKLhhCjZmoeZ
 b8Nw==
X-Gm-Message-State: AAQBX9c/sZXlMoqIdeBPukEAoLs/9K0Y67uSQ78jQL5XYOUhy7+epl/K
 Smn3ybnmDfFVbyxq0i5O2mki7NjmkvM=
X-Google-Smtp-Source: AKy350YCypsV4Mj5V1yrp6VJRmNSWYB8u5Xj+hsc8m5KCArmKOe84e6S1bkbau/imE50hTeg8ACZQg==
X-Received: by 2002:a17:906:b88d:b0:94a:a0d7:b7bc with SMTP id
 hb13-20020a170906b88d00b0094aa0d7b7bcmr5489920ejb.10.1682176062453; 
 Sat, 22 Apr 2023 08:07:42 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 06/13] hw/ide: Extract bmdma_init_ops()
Date: Sat, 22 Apr 2023 17:07:21 +0200
Message-Id: <20230422150728.176512-7-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There are three private copies of bmdma_setup_bar() with small adaptions.
Consolidate them into one public implementation.

While at it rename the function to bmdma_init_ops() to reflect that the memory
regions being initialized represent BMDMA operations. The actual mapping as a
PCI BAR is still performed separately in each device.

Note that the bmdma_bar attribute will be renamed in a separate commit.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/pci.h |  1 +
 hw/ide/cmd646.c      | 20 +-------------------
 hw/ide/pci.c         | 16 ++++++++++++++++
 hw/ide/piix.c        | 19 +------------------
 hw/ide/via.c         | 19 +------------------
 5 files changed, 20 insertions(+), 55 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 7bc4e53d02..597c77c7ad 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -57,6 +57,7 @@ struct PCIIDEState {
 };
 
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
+void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
 void pci_ide_create_devs(PCIDevice *dev);
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 9aabf80e52..6fd09fe74e 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -161,24 +161,6 @@ static const MemoryRegionOps cmd646_bmdma_ops = {
     .write = bmdma_write,
 };
 
-static void bmdma_setup_bar(PCIIDEState *d)
-{
-    BMDMAState *bm;
-    int i;
-
-    memory_region_init(&d->bmdma_bar, OBJECT(d), "cmd646-bmdma", 16);
-    for(i = 0;i < 2; i++) {
-        bm = &d->bmdma[i];
-        memory_region_init_io(&bm->extra_io, OBJECT(d), &cmd646_bmdma_ops, bm,
-                              "cmd646-bmdma-bus", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
-        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
-                              &bmdma_addr_ioport_ops, bm,
-                              "cmd646-bmdma-ioport", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
-    }
-}
-
 static void cmd646_update_irq(PCIDevice *pd)
 {
     int pci_level;
@@ -285,7 +267,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
                           &d->bus[1], "cmd646-cmd1", 4);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
 
-    bmdma_setup_bar(d);
+    bmdma_init_ops(d, &cmd646_bmdma_ops);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
     /* TODO: RST# value should be 0 */
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 8bea92e394..65ed6f7f72 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -523,6 +523,22 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
     bm->pci_dev = d;
 }
 
+void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops)
+{
+    size_t i;
+
+    memory_region_init(&d->bmdma_bar, OBJECT(d), "bmdma-container", 16);
+    for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
+        BMDMAState *bm = &d->bmdma[i];
+
+        memory_region_init_io(&bm->extra_io, OBJECT(d), bmdma_ops, bm, "bmdma-ops", 4);
+        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
+        memory_region_init_io(&bm->addr_ioport, OBJECT(d), &bmdma_addr_ioport_ops, bm,
+                              "bmdma-ioport-ops", 4);
+        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
+    }
+}
+
 static void pci_ide_init(Object *obj)
 {
     PCIIDEState *d = PCI_IDE(obj);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 4e6ca99123..5611473d37 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -86,23 +86,6 @@ static const MemoryRegionOps piix_bmdma_ops = {
     .write = bmdma_write,
 };
 
-static void bmdma_setup_bar(PCIIDEState *d)
-{
-    int i;
-
-    memory_region_init(&d->bmdma_bar, OBJECT(d), "piix-bmdma-container", 16);
-    for(i = 0;i < 2; i++) {
-        BMDMAState *bm = &d->bmdma[i];
-
-        memory_region_init_io(&bm->extra_io, OBJECT(d), &piix_bmdma_ops, bm,
-                              "piix-bmdma", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
-        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
-                              &bmdma_addr_ioport_ops, bm, "bmdma", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
-    }
-}
-
 static void piix_ide_reset(DeviceState *dev)
 {
     PCIIDEState *d = PCI_IDE(dev);
@@ -156,7 +139,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
-    bmdma_setup_bar(d);
+    bmdma_init_ops(d, &piix_bmdma_ops);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
     for (unsigned i = 0; i < 2; i++) {
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 287143a005..40704e2857 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -86,23 +86,6 @@ static const MemoryRegionOps via_bmdma_ops = {
     .write = bmdma_write,
 };
 
-static void bmdma_setup_bar(PCIIDEState *d)
-{
-    int i;
-
-    memory_region_init(&d->bmdma_bar, OBJECT(d), "via-bmdma-container", 16);
-    for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
-        BMDMAState *bm = &d->bmdma[i];
-
-        memory_region_init_io(&bm->extra_io, OBJECT(d), &via_bmdma_ops, bm,
-                              "via-bmdma", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
-        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
-                              &bmdma_addr_ioport_ops, bm, "bmdma", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
-    }
-}
-
 static void via_ide_set_irq(void *opaque, int n, int level)
 {
     PCIIDEState *s = opaque;
@@ -187,7 +170,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
                           &d->bus[1], "via-ide1-cmd", 4);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
 
-    bmdma_setup_bar(d);
+    bmdma_init_ops(d, &via_bmdma_ops);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
     qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
-- 
2.40.0


