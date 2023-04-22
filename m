Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE96EB9E1
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEqC-00023T-Gx; Sat, 22 Apr 2023 11:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq9-0001ya-Ca; Sat, 22 Apr 2023 11:07:53 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq7-0005D5-CU; Sat, 22 Apr 2023 11:07:53 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-956ff2399c9so404354666b.3; 
 Sat, 22 Apr 2023 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176069; x=1684768069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2D1F0gNtSe7iRxsA5al52OjOIzo7nGsj+lbPI2FLS4g=;
 b=JbWx8nYLYpezc9GvVNOIt5wdiTeLUelnYJ5Mjp9H6jsGLHxat4uZxAWqIyRYTBmja3
 M9JfAajkVbQesTNSxrVJqHq9Lr6puK8m/d1hqgYml37TlZ1Pw3DH3UkXbDJ0pKDJ//D7
 u6JXaSE6eglBOazqQ9IwJ24OaQ2zSFfcyaiQkH2C8pBzaoAhC9/fNdkbtu9t+ZVzkj85
 IInR8nyZSc0xkl3f391Ped6hg8nfo/dzXZ68jTLxDQMIHZcgS2NR5K1fu1C/7RoSJWg1
 mOFU2PCwZROzu4JRuCahll5CiPgQHmwONr8uHeovj2nr4qp+kwKqgKXwpwhFujNfRjPQ
 RFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176069; x=1684768069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2D1F0gNtSe7iRxsA5al52OjOIzo7nGsj+lbPI2FLS4g=;
 b=cuoUkGfJ/l5btexOde3lOBhP40G0CfzAI0618EUAUf9F7EJx0zdKwp7hSGTdIkYyMl
 5ttClS3GDJR5BvT4NMZ1pxKWoy7l0ZiskOZcNddYffVLsIFz993MLzj2MdQrUbr30ISc
 fWdwdReyF/dKQShei4sw6t4TZfoW9gm6XCVve0Tp+1t06i6V++kjYtddv9MiLsTQ7+VJ
 4gwUwlzHhrnJFzHvL8PnSAla/Hwo/gjUytbBq5B7pgmbcFxTRUeafuIqlbkdF3Dv+1lS
 sxZlL7/aNTlSh2w9F6oWZ8Fpjw/XdkH5iJiXxjmjt1HxkfcpKzS1ktfFHqH3GTmru8jZ
 65KA==
X-Gm-Message-State: AAQBX9eQ8JMJlXtr3rIry4dRkoI8ZS3ZFJtd0P792fa+J6HgrKqj2iz5
 wo8RI8YXC13a/PoVM7IJIWYAE3ItMRg=
X-Google-Smtp-Source: AKy350ayCPs2uBysDuezafiIO9Ij7OMMt6PReWte6mITA1Jdp/dl4hUkaZWew/6xpEAPKFjZeYeKDA==
X-Received: by 2002:a17:906:c41a:b0:94f:21cf:86c6 with SMTP id
 u26-20020a170906c41a00b0094f21cf86c6mr5339453ejz.51.1682176069071; 
 Sat, 22 Apr 2023 08:07:49 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:48 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 12/13] hw/ide/sii3112: Reuse PCIIDEState::bmdma_ops
Date: Sat, 22 Apr 2023 17:07:27 +0200
Message-Id: <20230422150728.176512-13-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

Allows to unexport bmdma_addr_ioport_ops and models TYPE_SII3112_PCI as a
standard-compliant PCI IDE device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/pci.h |  1 -
 hw/ide/pci.c         |  2 +-
 hw/ide/sii3112.c     | 94 ++++++++++++++++++++++++++------------------
 hw/ide/trace-events  |  6 ++-
 4 files changed, 60 insertions(+), 43 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index dbb4b13161..81e0370202 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -59,7 +59,6 @@ struct PCIIDEState {
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
 void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
-extern MemoryRegionOps bmdma_addr_ioport_ops;
 void pci_ide_create_devs(PCIDevice *dev);
 
 #endif
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 97ccc75aa6..3539b162b7 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -342,7 +342,7 @@ static void bmdma_addr_write(void *opaque, hwaddr addr,
     bm->addr |= ((data & mask) << shift) & ~3;
 }
 
-MemoryRegionOps bmdma_addr_ioport_ops = {
+static MemoryRegionOps bmdma_addr_ioport_ops = {
     .read = bmdma_addr_read,
     .write = bmdma_addr_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 9cf920369f..373c0dd1ee 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -34,47 +34,73 @@ struct SiI3112PCIState {
     SiI3112Regs regs[2];
 };
 
-/* The sii3112_reg_read and sii3112_reg_write functions implement the
- * Internal Register Space - BAR5 (section 6.7 of the data sheet).
- */
-
-static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
-                                unsigned int size)
+static uint64_t sii3112_bmdma_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    SiI3112PCIState *d = opaque;
+    BMDMAState *bm = opaque;
+    SiI3112PCIState *d = SII3112_PCI(bm->pci_dev);
+    int i = (bm == &bm->pci_dev->bmdma[0]) ? 0 : 1;
     uint64_t val;
 
     switch (addr) {
     case 0x00:
-        val = d->i.bmdma[0].cmd;
+        val = bm->cmd;
         break;
     case 0x01:
-        val = d->regs[0].swdata;
+        val = d->regs[i].swdata;
         break;
     case 0x02:
-        val = d->i.bmdma[0].status;
+        val = bm->status;
         break;
     case 0x03:
         val = 0;
         break;
-    case 0x04 ... 0x07:
-        val = bmdma_addr_ioport_ops.read(&d->i.bmdma[0], addr - 4, size);
-        break;
-    case 0x08:
-        val = d->i.bmdma[1].cmd;
+    default:
+        val = 0;
         break;
-    case 0x09:
-        val = d->regs[1].swdata;
+    }
+    trace_sii3112_bmdma_read(size, addr, val);
+    return val;
+}
+
+static void sii3112_bmdma_write(void *opaque, hwaddr addr,
+                                uint64_t val, unsigned int size)
+{
+    BMDMAState *bm = opaque;
+    SiI3112PCIState *d = SII3112_PCI(bm->pci_dev);
+    int i = (bm == &bm->pci_dev->bmdma[0]) ? 0 : 1;
+
+    trace_sii3112_bmdma_write(size, addr, val);
+    switch (addr) {
+    case 0x00:
+        bmdma_cmd_writeb(bm, val);
         break;
-    case 0x0a:
-        val = d->i.bmdma[1].status;
+    case 0x01:
+        d->regs[i].swdata = val & 0x3f;
         break;
-    case 0x0b:
-        val = 0;
+    case 0x02:
+        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 6);
         break;
-    case 0x0c ... 0x0f:
-        val = bmdma_addr_ioport_ops.read(&d->i.bmdma[1], addr - 12, size);
+    default:
         break;
+    }
+}
+
+static const MemoryRegionOps sii3112_bmdma_ops = {
+    .read = sii3112_bmdma_read,
+    .write = sii3112_bmdma_write,
+};
+
+/* The sii3112_reg_read and sii3112_reg_write functions implement the
+ * Internal Register Space - BAR5 (section 6.7 of the data sheet).
+ */
+
+static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
+                                unsigned int size)
+{
+    SiI3112PCIState *d = opaque;
+    uint64_t val;
+
+    switch (addr) {
     case 0x10:
         val = d->i.bmdma[0].cmd;
         val |= (d->regs[0].confstat & (1UL << 11) ? (1 << 4) : 0); /*SATAINT0*/
@@ -127,38 +153,26 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
 
     trace_sii3112_write(size, addr, val);
     switch (addr) {
-    case 0x00:
     case 0x10:
         bmdma_cmd_writeb(&d->i.bmdma[0], val);
         break;
-    case 0x01:
     case 0x11:
         d->regs[0].swdata = val & 0x3f;
         break;
-    case 0x02:
     case 0x12:
         d->i.bmdma[0].status = (val & 0x60) | (d->i.bmdma[0].status & 1) |
                                (d->i.bmdma[0].status & ~val & 6);
         break;
-    case 0x04 ... 0x07:
-        bmdma_addr_ioport_ops.write(&d->i.bmdma[0], addr - 4, val, size);
-        break;
-    case 0x08:
     case 0x18:
         bmdma_cmd_writeb(&d->i.bmdma[1], val);
         break;
-    case 0x09:
     case 0x19:
         d->regs[1].swdata = val & 0x3f;
         break;
-    case 0x0a:
     case 0x1a:
         d->i.bmdma[1].status = (val & 0x60) | (d->i.bmdma[1].status & 1) |
                                (d->i.bmdma[1].status & ~val & 6);
         break;
-    case 0x0c ... 0x0f:
-        bmdma_addr_ioport_ops.write(&d->i.bmdma[1], addr - 12, val, size);
-        break;
     case 0x100:
         d->regs[0].scontrol = val & 0xfff;
         if (val & 1) {
@@ -240,6 +254,9 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
     pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1]);
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]);
 
+    bmdma_init_ops(s, &sii3112_bmdma_ops);
+    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &s->bmdma_ops);
+
     /* BAR5 is in PCI memory space */
     memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
                          "sii3112.bar5", 0x200);
@@ -262,10 +279,10 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
     memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &s->cmd_ops[1], 0,
                              memory_region_size(&s->cmd_ops[1]));
     memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
-
     mr = g_new(MemoryRegion, 1);
-    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &d->mmio, 0, 16);
-    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
+    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &s->bmdma_ops, 0,
+                             memory_region_size(&s->bmdma_ops));
+    memory_region_add_subregion_overlap(&d->mmio, 0x0, mr, 1);
 
     qdev_init_gpio_in(ds, sii3112_set_irq, 2);
     for (i = 0; i < 2; i++) {
@@ -287,7 +304,6 @@ static void sii3112_pci_class_init(ObjectClass *klass, void *data)
     pd->class_id = PCI_CLASS_STORAGE_RAID;
     pd->revision = 1;
     pd->realize = sii3112_pci_realize;
-    pd->exit = NULL;
     dc->reset = sii3112_reset;
     dc->vmsd = NULL;
     dc->desc = "SiI3112A SATA controller";
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 57042cafdd..a479525e38 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -38,8 +38,10 @@ bmdma_read(uint64_t addr, uint8_t val) "bmdma: readb 0x%"PRIx64" : 0x%02x"
 bmdma_write(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" : 0x%02"PRIx64
 
 # sii3112.c
-sii3112_read(int size, uint64_t addr, uint64_t val) "bmdma: read (size %d) 0x%"PRIx64" : 0x%02"PRIx64
-sii3112_write(int size, uint64_t addr, uint64_t val) "bmdma: write (size %d) 0x%"PRIx64" : 0x%02"PRIx64
+sii3112_bmdma_read(int size, uint64_t addr, uint64_t val) "read (size %d) 0x%"PRIx64" : 0x%02"PRIx64
+sii3112_bmdma_write(int size, uint64_t addr, uint64_t val) "write (size %d) 0x%"PRIx64" : 0x%02"PRIx64
+sii3112_read(int size, uint64_t addr, uint64_t val) "read (size %d) 0x%"PRIx64" : 0x%02"PRIx64
+sii3112_write(int size, uint64_t addr, uint64_t val) "write (size %d) 0x%"PRIx64" : 0x%02"PRIx64
 sii3112_set_irq(int channel, int level) "channel %d level %d"
 
 # via.c
-- 
2.40.0


