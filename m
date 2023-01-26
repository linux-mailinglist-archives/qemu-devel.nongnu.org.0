Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DFC67D78C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dT-00089f-5S; Thu, 26 Jan 2023 16:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dC-0007zN-JM; Thu, 26 Jan 2023 16:18:04 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dA-0007ki-T7; Thu, 26 Jan 2023 16:18:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id me3so8622228ejb.7;
 Thu, 26 Jan 2023 13:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZsBlYIVLivHH9TZQ9hPd1AFL1bCBF6f+F/1DMZlLLw0=;
 b=kJpga6Fa3WYMl4Sa4cUx+96O0Ajw0d5HVVHvVleSEmGl7J85jQKFBZiBfdHssV91wt
 KzOph/4YPN+HQtO4S9TtsvoCHPf5R2aZMk4ympofFCM+OLEg8n1lSJ6fGX3cx01r+13i
 JGqadbYV4MSKNZjzQaMsn8oaNrzMahMN9j1jwWwjQDFqOxcF+nOF6Cgp1IOeFQFC8VxX
 5FjwIofv0BLz2aHDIT1kgvnlYR5skIQI4lC52d1KJT5zt1oGRdbS4RZ8uVdrB82cx3+4
 vn3f0jEOgMHuftji8Ff5ofnbU5R4VQbnlaf4495gHacG0V6uOtmyCwR3qQxBBWw0z4g+
 opzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZsBlYIVLivHH9TZQ9hPd1AFL1bCBF6f+F/1DMZlLLw0=;
 b=4UjK/m1O8/TveIm2QJgMD2AbtbTi22Ksd4M36Q3I+D6Y54wfqV9TbBTnTeNz+qX8oe
 8Oa5dD+CWBRoVnNh2mn4uAmCl7+EZGWi9JyTJvSNj1j0vOY3gihWob2w7h/M6yfyGcSG
 Vos72DTDsttxfNh+Ne9nieK1UIJgj5PgdvUcO/AvLFyZ4MYlj/npYSMtEcRp2yWvXXoe
 evcKVBehEYQkwyDcjnmy/zn/z30+JuHpi0kARmksPrPbP/7fYrmF48QbySNY8yjmUNLr
 KWuh1x46TweT3HTk7Rbg9TI/stOSIio2HXGX9HWwgiT87kVgEvuX5t/cv3OBJQwVtf6p
 zrSQ==
X-Gm-Message-State: AFqh2kqQP1+aO7pgvdEKQM1Ac2z+YxBDbJQDxD/+mU11XrT6dUg1/moR
 /9fINI115KEt/fI4S1xP4ioZpwjpU1w/9w==
X-Google-Smtp-Source: AMrXdXs03IvcnUkRF2y8A/OBDZBxG0TAAAvjaEWu2oipECPwLqB1Uc42JyrgHZXIAJe/h5x5NDAJuw==
X-Received: by 2002:a17:907:9d09:b0:7c0:efb4:71fb with SMTP id
 kt9-20020a1709079d0900b007c0efb471fbmr40543003ejc.28.1674767878579; 
 Thu, 26 Jan 2023 13:17:58 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 20210518215545.1793947-10-philmd@redhat.com
Subject: [PATCH v2 08/10] hw/ide: Let ide_init_ioport() take a MemoryRegion
 argument instead of ISADevice
Date: Thu, 26 Jan 2023 22:17:38 +0100
Message-Id: <20230126211740.66874-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

Both callers to ide_init_ioport() have access to the I/O memory region
of the ISA bus, so can pass it directly. This allows ide_init_ioport()
to directly call portio_list_init().

Note, now the callers become the owner of the PortioList.

Inspired-by: <20210518215545.1793947-10-philmd@redhat.com>
  'hw/ide: Let ide_init_ioport() take an ISA bus argument instead of device'
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/internal.h |  3 ++-
 hw/ide/ioport.c           | 15 ++++++++-------
 hw/ide/isa.c              |  4 +++-
 hw/ide/piix.c             |  8 ++++++--
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 42c49414f4..c3e4d192fa 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -628,7 +628,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
-void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Object *owner,
+                     int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index b613ff3bba..00e9baf0d1 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,15 +50,16 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Object *owner,
+                     int iobase, int iobase2)
 {
-    /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
-       bridge has been setup properly to always register with ISA.  */
-    isa_register_portio_list(dev, &bus->portio_list,
-                             iobase, ide_portio_list, bus, "ide");
+    assert(address_space_io);
+
+    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "ide",
+                     address_space_io, iobase);
 
     if (iobase2) {
-        isa_register_portio_list(dev, &bus->portio2_list,
-                                 iobase2, ide_portio2_list, bus, "ide");
+        portio_list_init(&bus->portio2_list, owner, ide_portio2_list, bus,
+                         "ide", address_space_io, iobase2);
     }
 }
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 8bedbd13f1..cab5d0a07a 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -72,9 +72,11 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 {
     ISADevice *isadev = ISA_DEVICE(dev);
     ISAIDEState *s = ISA_IDE(dev);
+    ISABus *isabus = isa_bus_from_device(isadev);
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
-    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
+    ide_init_ioport(&s->bus, isabus->address_space_io, OBJECT(dev),
+                    s->iobase, s->iobase2);
     s->irq = isa_get_irq(isadev, s->isairq);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index f0d95761ac..236b5b7416 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -29,6 +29,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
@@ -143,8 +144,11 @@ static void pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
+    PCIBus *pci_bus = pci_get_bus(&d->parent_obj);
     int i;
 
+    assert(pci_bus);
+
     if (isa_bus) {
         d->isa_irqs[0] = isa_bus->irqs[port_info[0].isairq];
         d->isa_irqs[1] = isa_bus->irqs[port_info[1].isairq];
@@ -154,8 +158,8 @@ static void pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                        port_info[i].iobase2);
+        ide_init_ioport(&d->bus[i], pci_bus->address_space_io, OBJECT(d),
+                        port_info[i].iobase, port_info[i].iobase2);
         ide_init2(&d->bus[i], qdev_get_gpio_in(DEVICE(d), i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
-- 
2.39.1


