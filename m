Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860256EB9DA
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEqB-00022u-VU; Sat, 22 Apr 2023 11:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq9-0001yX-7m; Sat, 22 Apr 2023 11:07:53 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq6-00059f-BF; Sat, 22 Apr 2023 11:07:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so20427980a12.0; 
 Sat, 22 Apr 2023 08:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176068; x=1684768068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJpI+E7seMl1Wg5225zCGbACaVQwDu0wCPc1qczA8pM=;
 b=MFS9cXIRVuhGUq1DdjJtEKgDKYuBxt8dA2lrO5QPclLetgISCa+HBlGhSQqDhmdLqB
 AVhY8L7/ta7CZZ+acHTNgPzdBvUIeTWL4qRJ3AX62kKwVQ54NAiRmEXjMoREbaizapO9
 g1KkMbIEB058WU4tz7kSMFlWVOKochz9QJ73tsT44j4Lwq1zn541Pyz5+R1OQX/iWugu
 0J0ThHcqj2r676lDUzdBy80Dd2nOM+sm+SidW6gNckEzkPJjAC9gXFQRPsZIIo8zRc/5
 QzCWUw0O5YoPCxVKXLaUNhry1heNRCTkuGvofjVWAyVk4iXlzwCpAAeNoBhZni+MRrFA
 Wv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176068; x=1684768068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJpI+E7seMl1Wg5225zCGbACaVQwDu0wCPc1qczA8pM=;
 b=EPVm8TO+JqRMks5Czvvv/XCKCl2rFByItHIYwvhwNURBqFNkK/t3lfy6Uw7Q7uMoJZ
 YGNGgrZq8KW3AyyrWriaVcn1Bt7RJxccmLIW8xcCqDoT97GtTb325/QZtUmHitV0a7b/
 dvc842vZOO4hGcSs74DrluSnoitpd1d9GAHAmwE0I/uAow5y9Sq9ViNoziGu9Hi4wYbc
 EMEaK8uz14ABbZdoD3Ze/K33XjR4DRyVriPa5GjLYu/lcvymIOjtS5zEIRGx42jE8dmE
 /k95ow/SZjzybAiWE2nhkbH3HLfX2pcrH9zNLoyzTgR0gkfz6Ta/eNczPA+BbmgAahq6
 BX0A==
X-Gm-Message-State: AAQBX9enNlkfvIAkzsTNk3GDojgPckszXZDR55MMLPkrlksT8+Lrlm6k
 eJTqa7dnOE1S8HXhmTOHKt4taPJrfTE=
X-Google-Smtp-Source: AKy350ailoOg60oz8XOqT33HN9t/n19tmlgpVdgtKvgk/1MEjbejWYeYGCqQgLnRh7JNq4LL3hw0HA==
X-Received: by 2002:a17:906:7141:b0:94f:2a13:4df4 with SMTP id
 z1-20020a170906714100b0094f2a134df4mr5197835ejj.22.1682176067626; 
 Sat, 22 Apr 2023 08:07:47 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 11/13] hw/ide/sii3112: Reuse PCIIDEState::{cmd,data}_ops
Date: Sat, 22 Apr 2023 17:07:26 +0200
Message-Id: <20230422150728.176512-12-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

Allows to unexport pci_ide_{cmd,data}_le_ops and models TYPE_SII3112_PCI as a
standard-compliant PCI IDE device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/pci.h |  2 --
 hw/ide/pci.c         |  4 ++--
 hw/ide/sii3112.c     | 50 ++++++++++++++++----------------------------
 3 files changed, 20 insertions(+), 36 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 5025df5b82..dbb4b13161 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -62,6 +62,4 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
 void pci_ide_create_devs(PCIDevice *dev);
 
-extern const MemoryRegionOps pci_ide_cmd_le_ops;
-extern const MemoryRegionOps pci_ide_data_le_ops;
 #endif
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index b2fcc00a64..97ccc75aa6 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -60,7 +60,7 @@ static void pci_ide_ctrl_write(void *opaque, hwaddr addr,
     ide_ctrl_write(bus, addr + 2, data);
 }
 
-const MemoryRegionOps pci_ide_cmd_le_ops = {
+static const MemoryRegionOps pci_ide_cmd_le_ops = {
     .read = pci_ide_status_read,
     .write = pci_ide_ctrl_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
@@ -98,7 +98,7 @@ static void pci_ide_data_write(void *opaque, hwaddr addr,
     }
 }
 
-const MemoryRegionOps pci_ide_data_le_ops = {
+static const MemoryRegionOps pci_ide_data_le_ops = {
     .read = pci_ide_data_read,
     .write = pci_ide_data_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 0af897a9ef..9cf920369f 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -88,21 +88,9 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
         val |= (d->regs[1].confstat & (1UL << 11) ? (1 << 4) : 0);
         val |= (uint32_t)d->i.bmdma[1].status << 16;
         break;
-    case 0x80 ... 0x87:
-        val = pci_ide_data_le_ops.read(&d->i.bus[0], addr - 0x80, size);
-        break;
-    case 0x8a:
-        val = pci_ide_cmd_le_ops.read(&d->i.bus[0], 2, size);
-        break;
     case 0xa0:
         val = d->regs[0].confstat;
         break;
-    case 0xc0 ... 0xc7:
-        val = pci_ide_data_le_ops.read(&d->i.bus[1], addr - 0xc0, size);
-        break;
-    case 0xca:
-        val = pci_ide_cmd_le_ops.read(&d->i.bus[1], 2, size);
-        break;
     case 0xe0:
         val = d->regs[1].confstat;
         break;
@@ -171,18 +159,6 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
     case 0x0c ... 0x0f:
         bmdma_addr_ioport_ops.write(&d->i.bmdma[1], addr - 12, val, size);
         break;
-    case 0x80 ... 0x87:
-        pci_ide_data_le_ops.write(&d->i.bus[0], addr - 0x80, val, size);
-        break;
-    case 0x8a:
-        pci_ide_cmd_le_ops.write(&d->i.bus[0], 2, val, size);
-        break;
-    case 0xc0 ... 0xc7:
-        pci_ide_data_le_ops.write(&d->i.bus[1], addr - 0xc0, val, size);
-        break;
-    case 0xca:
-        pci_ide_cmd_le_ops.write(&d->i.bus[1], 2, val, size);
-        break;
     case 0x100:
         d->regs[0].scontrol = val & 0xfff;
         if (val & 1) {
@@ -259,6 +235,11 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
     pci_config_set_interrupt_pin(dev->config, 1);
     pci_set_byte(dev->config + PCI_CACHE_LINE_SIZE, 8);
 
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[0]);
+    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[0]);
+    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1]);
+    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]);
+
     /* BAR5 is in PCI memory space */
     memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
                          "sii3112.bar5", 0x200);
@@ -266,17 +247,22 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
 
     /* BAR0-BAR4 are PCI I/O space aliases into BAR5 */
     mr = g_new(MemoryRegion, 1);
-    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &d->mmio, 0x80, 8);
-    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, mr);
+    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &s->data_ops[0], 0,
+                             memory_region_size(&s->data_ops[0]));
+    memory_region_add_subregion_overlap(&d->mmio, 0x80, mr, 1);
     mr = g_new(MemoryRegion, 1);
-    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &d->mmio, 0x88, 4);
-    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, mr);
+    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &s->cmd_ops[0], 0,
+                             memory_region_size(&s->cmd_ops[0]));
+    memory_region_add_subregion_overlap(&d->mmio, 0x88, mr, 1);
     mr = g_new(MemoryRegion, 1);
-    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &d->mmio, 0xc0, 8);
-    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, mr);
+    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &s->data_ops[1], 0,
+                             memory_region_size(&s->data_ops[1]));
+    memory_region_add_subregion_overlap(&d->mmio, 0xc0, mr, 1);
     mr = g_new(MemoryRegion, 1);
-    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &d->mmio, 0xc8, 4);
-    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, mr);
+    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &s->cmd_ops[1], 0,
+                             memory_region_size(&s->cmd_ops[1]));
+    memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
+
     mr = g_new(MemoryRegion, 1);
     memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &d->mmio, 0, 16);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
-- 
2.40.0


