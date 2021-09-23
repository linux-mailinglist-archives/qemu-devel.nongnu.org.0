Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0954415E54
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:27:29 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNp3-0002QZ-0K
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNaB-0008GX-KN
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNa8-00008G-Ba
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:07 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i23so16659969wrb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=llOJ3+sWfZF3I0x4y3OCKjWL0ARmRV+YWlNErkdm1GY=;
 b=g9CRrAS8ZzgFInaTHnbaVQza+Jtg76O7UyX/8p7fO/OhPbOp1yC3jhbSBL6J/Ufy7G
 vscd+I+4diTjoGWenv4KQoqIXhp2E5XevbqbqYjGoaDLTDny6eQUFNCYYDDK46z5tt/Q
 9A8OLGThNZGaqkOuv68ZDMtg93TK+EcWRmTDYa7a3N2FsM7kAoacuKam6Wk9rbg9/O1A
 1TU50/tzOPc/JqyRmmwO/TnxQqxyQQcuIqsM3l0BY8Xc7Ngk2qEVErLRHfc5vKj8EgMh
 s00BukjKzBx+TMzYm0d+wiNKgprRruSgAazBAuOSttwCsoY8JXvx990IMBw73/8i7r1o
 Xpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=llOJ3+sWfZF3I0x4y3OCKjWL0ARmRV+YWlNErkdm1GY=;
 b=pFrT8qUASJWD6NFZ/BhzVhPXcfHjV+h3VjA8lPa4EW5VmNwg+S/W5NanpXGMEFdtUX
 L8J4Q7yuRbrXoP2KmWrdPTGHJcL/7A0GMf7x/KxDoCt7yNOt4jx56rONI2JdI0P6MNyo
 xxVQA0TVW6b6OU+Yde5ITUqF0J+26O5JlXpP4+2Uv4bINO2xqNesg1ICNUPHC5kAr6oa
 V0n53vGsvLqcqqW+G3ZCNINQf77YL9HtU6X0+eiEdWjjw+n+QrZDN/pLsqaIQ2Bby/tT
 WXBZjsOjWb+iMRBQJ5Net675nLG4ZyT0qhygEGpLzIUcDLjEMb6Rk06mYq5hrXQVQW9o
 lamg==
X-Gm-Message-State: AOAM530JnlRJiB9mR+1Q5PE9aET1WNyL/boseCp2bPEd3B0PCaK9SsDg
 IklElPxV00tmqmksSfuabcvi1VY5Uh7mow==
X-Google-Smtp-Source: ABdhPJy34Zp6nxcOJC6DAvyMARdZwGMFJII5x9CmJPJej5mtIlHc34CfyBsth3qbIRVNMl8+4YLF/Q==
X-Received: by 2002:adf:e447:: with SMTP id t7mr4775225wrm.221.1632399122999; 
 Thu, 23 Sep 2021 05:12:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t22sm1382349wmj.30.2021.09.23.05.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:12:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] ide: Rename ide_bus_new() to ide_bus_init()
Date: Thu, 23 Sep 2021 13:11:53 +0100
Message-Id: <20210923121153.23754-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923121153.23754-1-peter.maydell@linaro.org>
References: <20210923121153.23754-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function ide_bus_new() does an in-place initialization.  Rename
it to ide_bus_init() to follow our _init vs _new convention.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ide/internal.h | 4 ++--
 hw/ide/ahci.c             | 2 +-
 hw/ide/cmd646.c           | 2 +-
 hw/ide/isa.c              | 2 +-
 hw/ide/macio.c            | 2 +-
 hw/ide/microdrive.c       | 2 +-
 hw/ide/mmio.c             | 2 +-
 hw/ide/piix.c             | 2 +-
 hw/ide/qdev.c             | 2 +-
 hw/ide/sii3112.c          | 2 +-
 hw/ide/via.c              | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 79172217ccb..97e7e59dc58 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -648,8 +648,8 @@ void ide_atapi_cmd(IDEState *s);
 void ide_atapi_cmd_reply_end(IDEState *s);
 
 /* hw/ide/qdev.c */
-void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
-                 int bus_id, int max_units);
+void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
+                  int bus_id, int max_units);
 IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
 
 int ide_handle_rw_error(IDEState *s, int error, int op);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index f2c51574839..a94c6e26fb0 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1548,7 +1548,7 @@ void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
     for (i = 0; i < s->ports; i++) {
         AHCIDevice *ad = &s->dev[i];
 
-        ide_bus_new(&ad->port, sizeof(ad->port), qdev, i, 1);
+        ide_bus_init(&ad->port, sizeof(ad->port), qdev, i, 1);
         ide_init2(&ad->port, irqs[i]);
 
         ad->hba = s;
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index c2546314855..94c576262c1 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -293,7 +293,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
 
     qdev_init_gpio_in(ds, cmd646_set_irq, 2);
     for (i = 0; i < 2; i++) {
-        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 6bc19de2265..24bbde24c2b 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -73,7 +73,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ISADevice *isadev = ISA_DEVICE(dev);
     ISAIDEState *s = ISA_IDE(dev);
 
-    ide_bus_new(&s->bus, sizeof(s->bus), dev, 0, 2);
+    ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
     isa_init_irq(isadev, &s->irq, s->isairq);
     ide_init2(&s->bus, s->irq);
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index b270a101632..b03d401ceb5 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -449,7 +449,7 @@ static void macio_ide_initfn(Object *obj)
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
     MACIOIDEState *s = MACIO_IDE(obj);
 
-    ide_bus_new(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
+    ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
     memory_region_init_io(&s->mem, obj, &pmac_ide_ops, s, "pmac-ide", 0x1000);
     sysbus_init_mmio(d, &s->mem);
     sysbus_init_irq(d, &s->real_ide_irq);
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 58a14fea363..6df9b4cbbe1 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -605,7 +605,7 @@ static void microdrive_init(Object *obj)
 {
     MicroDriveState *md = MICRODRIVE(obj);
 
-    ide_bus_new(&md->bus, sizeof(md->bus), DEVICE(obj), 0, 1);
+    ide_bus_init(&md->bus, sizeof(md->bus), DEVICE(obj), 0, 1);
 }
 
 static void microdrive_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 36e2f4790ab..fb2ebd4847f 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -142,7 +142,7 @@ static void mmio_ide_initfn(Object *obj)
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
     MMIOState *s = MMIO_IDE(obj);
 
-    ide_bus_new(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
+    ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
     sysbus_init_irq(d, &s->irq);
 }
 
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index d3e738320be..ce89fd0aa36 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -137,7 +137,7 @@ static int pci_piix_init_ports(PCIIDEState *d)
     int i, ret;
 
     for (i = 0; i < 2; i++) {
-        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
+        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
         ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
                               port_info[i].iobase2);
         if (ret) {
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index ca844419106..618045b85ac 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -68,7 +68,7 @@ static const TypeInfo ide_bus_info = {
     .class_init = ide_bus_class_init,
 };
 
-void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
+void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                  int bus_id, int max_units)
 {
     qbus_init(idebus, idebus_size, TYPE_IDE_BUS, dev, NULL);
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 34c347b9c20..46204f10d75 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -283,7 +283,7 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
 
     qdev_init_gpio_in(ds, sii3112_set_irq, 2);
     for (i = 0; i < 2; i++) {
-        ide_bus_new(&s->bus[i], sizeof(s->bus[i]), ds, i, 1);
+        ide_bus_init(&s->bus[i], sizeof(s->bus[i]), ds, i, 1);
         ide_init2(&s->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&s->bus[i], &s->bmdma[i], s);
diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b334..94cc2142c70 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -190,7 +190,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
 
     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
     for (i = 0; i < 2; i++) {
-        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
-- 
2.20.1


