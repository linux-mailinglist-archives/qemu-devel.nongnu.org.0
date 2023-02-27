Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F16A44A2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFP-0001u1-7T; Mon, 27 Feb 2023 09:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeE4-0000Kn-7e
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeE1-00019T-5o
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso6829433wmi.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sBFWnYaBV5LobNifphxCr/7ICfJ1EzExfLTH5mqS1MU=;
 b=Y0/FUavWfdI56DsxJg7GtASbRBpMN6RBrBooYPHjapwYS98kR6aecCDoG9t9y/Vo7W
 WLhazEh57Bs9rL3oLPx/CvyBZ1vdIX22Ca9OWgA3aguhFL8rufHx1SU1NJSZjhWD7FQG
 YjyUirnNRV+c1zk7Q3EtHuY7MbnxqEToYSd9l9H5BCp1rEepfMaFwKMWn0jJUJr6PE09
 M5PTee+KvZaq4eRtI6mFMutVSmrg8+IDctuYTtM0W9xjZndAJWMek0ugDNz/mhytAi3e
 DXunMJAzXvH8gX8sMpnJNUSmjWo4wwL+n6ZnfhHRELcnDosTZ6rI9OhBHMTfebDxLx20
 X4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sBFWnYaBV5LobNifphxCr/7ICfJ1EzExfLTH5mqS1MU=;
 b=b/Th6/GcpIOxb4NfQXMs3lKARl1VGTh+XFdRyuKIgMqkow7RJHH+hcRm79eLvOLr9j
 RNEqQ+o9P5daV2IMvamUmNtca+sD0/VSCqCkEaAYkiTQkoDW6PWNOiFoPnLb8f9d5f9x
 CPsEcHz2cu6wJR+ZrllH8pXq2mm8ihpay/uQ0i3/vWxqS6rRjan0vkgAgcL1sReSYO7r
 mDT/Wdn+Z87docgykCtD+BEMGlG6Er7uERGY4HiWiffFjhbI/GkS5y7vt+bGi2FmecxA
 OZDUAgMkj8mbGJtPHYdn9hjb4vlsLGV2eomz8AlZSYQy3WUkaFvSf4s5Cpy3iR6zKYzb
 UL+Q==
X-Gm-Message-State: AO0yUKUXPdCctyydIZ4qvBackX48sSBHVidaYL3q2Wb0GMvGeXx29MFU
 c8PoF3F+E9esCDhKhZmKRmMoZY7UykJu4B5i
X-Google-Smtp-Source: AK7set/Y1QY/CiSHQOvlfRRIRXGbRFyZDrtNOuSfLOZVYBMhpwqFnF9vxmiiI7MMaEXnUEjzgxvyNA==
X-Received: by 2002:a05:600c:714:b0:3e2:a8e:ba4a with SMTP id
 i20-20020a05600c071400b003e20a8eba4amr17970875wmn.21.1677507087750; 
 Mon, 27 Feb 2023 06:11:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003e00c453447sm12353398wmr.48.2023.02.27.06.11.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 111/126] hw/ide: Rename ide_init2() -> ide_bus_init_output_irq()
Date: Mon, 27 Feb 2023 15:01:58 +0100
Message-Id: <20230227140213.35084-102-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

ide_init2() initializes a IDEBus, and set its output IRQ.
To emphasize this, rename it as ide_bus_init_output_irq().

Mechanical change using:

  $ sed -i -e 's/ide_init2/ide_bus_init_output_irq/g' \
        $(git grep -l ide_init2)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-15-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ahci.c             | 2 +-
 hw/ide/cmd646.c           | 2 +-
 hw/ide/core.c             | 4 ++--
 hw/ide/isa.c              | 2 +-
 hw/ide/macio.c            | 2 +-
 hw/ide/microdrive.c       | 2 +-
 hw/ide/mmio.c             | 2 +-
 hw/ide/piix.c             | 3 ++-
 hw/ide/sii3112.c          | 2 +-
 hw/ide/via.c              | 2 +-
 include/hw/ide/internal.h | 4 ++--
 11 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index e6498964af..55902e1df7 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1554,7 +1554,7 @@ void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
         AHCIDevice *ad = &s->dev[i];
 
         ide_bus_init(&ad->port, sizeof(ad->port), qdev, i, 1);
-        ide_init2(&ad->port, irqs[i]);
+        ide_bus_init_output_irq(&ad->port, irqs[i]);
 
         ad->hba = s;
         ad->port_no = i;
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 2865bc25fc..26a90ed45f 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -294,7 +294,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
     qdev_init_gpio_in(ds, cmd646_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
-        ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
+        ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 1be0731d1a..fd2215c506 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2771,7 +2771,7 @@ static IDEDMA ide_dma_nop = {
     .aiocb = NULL,
 };
 
-void ide_init2(IDEBus *bus, qemu_irq irq)
+void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out)
 {
     int i;
 
@@ -2779,7 +2779,7 @@ void ide_init2(IDEBus *bus, qemu_irq irq)
         ide_init1(bus, i);
         ide_reset(&bus->ifs[i]);
     }
-    bus->irq = irq;
+    bus->irq = irq_out;
     bus->dma = &ide_dma_nop;
 }
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index f8ed26b587..95053e026f 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -72,7 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
+    ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_bus_register_restart_cb(&s->bus);
 }
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 7efbbc720a..6be29e44bc 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -420,7 +420,7 @@ static void macio_ide_realizefn(DeviceState *dev, Error **errp)
 {
     MACIOIDEState *s = MACIO_IDE(dev);
 
-    ide_init2(&s->bus, s->ide_irq);
+    ide_bus_init_output_irq(&s->bus, s->ide_irq);
 
     /* Register DMA callbacks */
     s->dma.ops = &dbdma_ops;
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 08504b499f..84452ae4ef 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -599,7 +599,7 @@ static void microdrive_realize(DeviceState *dev, Error **errp)
 {
     MicroDriveState *md = MICRODRIVE(dev);
 
-    ide_init2(&md->bus, qemu_allocate_irq(md_set_irq, md, 0));
+    ide_bus_init_output_irq(&md->bus, qemu_allocate_irq(md_set_irq, md, 0));
 }
 
 static void microdrive_init(Object *obj)
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 4e2c1a4413..3aeacab3bb 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -122,7 +122,7 @@ static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
     SysBusDevice *d = SYS_BUS_DEVICE(dev);
     MMIOIDEState *s = MMIO_IDE(dev);
 
-    ide_init2(&s->bus, s->irq);
+    ide_bus_init_output_irq(&s->bus, s->irq);
 
     memory_region_init_io(&s->iomem1, OBJECT(s), &mmio_ide_ops, s,
                           "ide-mmio.1", 16 << s->shift);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index daeb9b605d..2f71376b93 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -145,7 +145,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
         if (ret) {
             return ret;
         }
-        ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+        ide_bus_init_output_irq(&d->bus[i],
+                                isa_get_irq(NULL, port_info[i].isairq));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index c918370220..f9becdff8e 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -284,7 +284,7 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
     qdev_init_gpio_in(ds, sii3112_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_init(&s->bus[i], sizeof(s->bus[i]), ds, i, 1);
-        ide_init2(&s->bus[i], qdev_get_gpio_in(ds, i));
+        ide_bus_init_output_irq(&s->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&s->bus[i], &s->bmdma[i], s);
         s->bmdma[i].bus = &s->bus[i];
diff --git a/hw/ide/via.c b/hw/ide/via.c
index fd398226d4..ab9e43e244 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -191,7 +191,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
-        ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
+        ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 11a4931ef9..c687282a78 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -488,7 +488,7 @@ struct IDEBus {
     IDEDMA *dma;
     uint8_t unit;
     uint8_t cmd;
-    qemu_irq irq;
+    qemu_irq irq; /* bus output */
 
     int error_status;
     uint8_t retry_unit;
@@ -616,8 +616,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    uint64_t wwn,
                    uint32_t cylinders, uint32_t heads, uint32_t secs,
                    int chs_trans, Error **errp);
-void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
+void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
 int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
-- 
2.38.1


