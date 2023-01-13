Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F31669EBA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHk-0002aw-SX; Fri, 13 Jan 2023 10:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHi-0002a5-Kb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:02 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHg-0006CN-Ju
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bk16so21435678wrb.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WH9GQjpC73Nm42Qui6dFATC8DIhCEY7mdkzf8yyt/VY=;
 b=lL/v/06gZRORqDp4mCEdSRwT//m8jtZb7Nvdlqt4B3ffXmwswHps8cKH1gN5GTc08X
 fNKi1sV8qdV5ezn1HjH6S+E7cGf5+qWvOVdHUCnuQoPTYbDNPkTazICE1rWT/9MJRrHI
 TxJRieqGTqSxMVWGFOQiEbV4S6dC1QbY1rpzjEWAE9Fg9opvIg8uv+Sd5NpLwSjxwt3H
 ypnh+vqk3fKnRVka/q++GpcIhtUff2CeAapAHG2vmzUaym75dOx5oNyTWptVnJNQpfOU
 lcgqnwrnyyb5JsCa6GLp9YgeTLWYbRJh9VGK0PJJuFKvG/FHVHVTaG7RVsKLLQiPwDii
 n6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WH9GQjpC73Nm42Qui6dFATC8DIhCEY7mdkzf8yyt/VY=;
 b=w9bfueNeu6XCqGRNk9YLb2KgCxdqlARzObwjxHMbX28YQWgcNtNZGrFqKy1nV99yz+
 KVr9zEdJaGC6vR0CysIHmBEB+C5XduXyJHtiyP2wmGCnjTPE9HtvvFpmeG2fKAGwY/lN
 HvP49Qg0vQC80G7+uyzGoRl/TbZRO5pK+iLYVrOJ8SZzQExPInEUu6aaRCdOTBJL3Rf8
 yQAKp0M7kc+d91XE3aRc6dS1v1EdxC2Ch7IuULH1Pljftkwk/G255ImwyhFiVtwdDMlJ
 qLhVO4g9hzSowbjTZ94SEkCCvJF0YNqplzuzZmQnlJkBMgqD9h/IhnYy5nT6A97bMU2d
 9Dog==
X-Gm-Message-State: AFqh2krXGmuXIkgj0MdLupzGzZUhZbmAwy1hRrj0SDY325sN7mBIdbIn
 LP08t1uKX0dOu9Aqb95EPAlDj4auJCq1SFaG
X-Google-Smtp-Source: AMrXdXtAP0+tdySnvA2teVg4gKE8xIaGI21Qp30CfrGPLLWHZnplU8JotO2ghAO02GxmDtJs6G3YsQ==
X-Received: by 2002:a05:6000:803:b0:2bd:da9b:b88f with SMTP id
 bt3-20020a056000080300b002bdda9bb88fmr203211wrb.8.1673624879441; 
 Fri, 13 Jan 2023 07:47:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm18722236wrn.92.2023.01.13.07.47.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 30/46] hw/pci/pci: Factor out pci_bus_map_irqs() from
 pci_bus_irqs()
Date: Fri, 13 Jan 2023 16:45:16 +0100
Message-Id: <20230113154532.49979-31-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

pci_bus_irqs() coupled together the assignment of pci_set_irq_fn and
pci_map_irq_fn to a PCI bus. This coupling gets in the way when the
pci_map_irq_fn is board-specific while the pci_set_irq_fn is device-
specific.

For example, both of QEMU's PIIX south bridge models have different
pci_map_irq_fn implementations which are board-specific rather than
device-specific. These implementations should therefore reside in board
code. The pci_set_irq_fn's, however, should stay in the device models
because they access memory internal to the model.

Factoring out pci_bus_map_irqs() from pci_bus_irqs() allows the
assignments to be decoupled, resolving the problem described above.

Note also how pci_vpb_realize() which gets touched in this commit
assigns different pci_map_irq_fn's depending on the board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230109172347.1830-5-shentey@gmail.com>
[PMD: Factor out in vfu_object_set_bus_irq()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c          |  4 ++--
 hw/isa/piix3.c            |  8 ++++----
 hw/isa/piix4.c            |  3 ++-
 hw/pci-host/raven.c       |  3 ++-
 hw/pci-host/versatile.c   |  3 ++-
 hw/pci/pci.c              | 12 +++++++++---
 hw/remote/machine.c       |  3 ++-
 hw/remote/vfio-user-obj.c |  4 ++--
 include/hw/pci/pci.h      |  3 ++-
 9 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 67ceb04bcc..65ea226211 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -268,8 +268,8 @@ static void pc_q35_init(MachineState *machine)
     for (i = 0; i < GSI_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
-    pci_bus_irqs(host_bus, ich9_lpc_set_irq, ich9_lpc_map_irq, ich9_lpc,
-                 ICH9_LPC_NB_PIRQS);
+    pci_bus_irqs(host_bus, ich9_lpc_set_irq, ich9_lpc, ICH9_LPC_NB_PIRQS);
+    pci_bus_map_irqs(host_bus, ich9_lpc_map_irq);
     pci_bus_set_route_irq_fn(host_bus, ich9_route_intx_pin_to_irq);
     isa_bus = ich9_lpc->isa_bus;
 
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index eabad7ba58..666e794f77 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -384,8 +384,8 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
-                 piix3, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
+    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -420,8 +420,8 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
-                 piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_map_irqs(pci_bus, xen_pci_slot_get_pirq);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0d23e11a39..9c79c9677b 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -271,7 +271,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
     qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
+    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
 }
 
 static void piix4_init(Object *obj)
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 2c96ddf8fe..5b00b4e462 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -258,7 +258,8 @@ static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
 
     qdev_init_gpio_in(d, raven_change_gpio, 1);
 
-    pci_bus_irqs(&s->pci_bus, raven_set_irq, raven_map_irq, s, PCI_NUM_PINS);
+    pci_bus_irqs(&s->pci_bus, raven_set_irq, s, PCI_NUM_PINS);
+    pci_bus_map_irqs(&s->pci_bus, raven_map_irq);
 
     memory_region_init_io(&h->conf_mem, OBJECT(h), &pci_host_conf_le_ops, s,
                           "pci-conf-idx", 4);
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 0d50ea4cc0..60d4e7cd92 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -422,7 +422,8 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
         mapfn = pci_vpb_map_irq;
     }
 
-    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s->irq, 4);
+    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, s->irq, 4);
+    pci_bus_map_irqs(&s->pci_bus, mapfn);
 
     /* Our memory regions are:
      * 0 : our control registers
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c2fb88f9a3..39a7bb32aa 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -280,6 +280,7 @@ static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)
     PCIBus *bus;
     for (;;) {
         bus = pci_get_bus(pci_dev);
+        assert(bus->map_irq);
         irq_num = bus->map_irq(pci_dev, irq_num);
         if (bus->set_irq)
             break;
@@ -518,16 +519,20 @@ void pci_root_bus_cleanup(PCIBus *bus)
     qbus_unrealize(BUS(bus));
 }
 
-void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq, pci_map_irq_fn map_irq,
+void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
                   void *irq_opaque, int nirq)
 {
     bus->set_irq = set_irq;
-    bus->map_irq = map_irq;
     bus->irq_opaque = irq_opaque;
     bus->nirq = nirq;
     bus->irq_count = g_malloc0(nirq * sizeof(bus->irq_count[0]));
 }
 
+void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq)
+{
+    bus->map_irq = map_irq;
+}
+
 void pci_bus_irqs_cleanup(PCIBus *bus)
 {
     bus->set_irq = NULL;
@@ -549,7 +554,8 @@ PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,
 
     bus = pci_root_bus_new(parent, name, address_space_mem,
                            address_space_io, devfn_min, typename);
-    pci_bus_irqs(bus, set_irq, map_irq, irq_opaque, nirq);
+    pci_bus_irqs(bus, set_irq, irq_opaque, nirq);
+    pci_bus_map_irqs(bus, map_irq);
     return bus;
 }
 
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 75d550daae..519f855ec1 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -63,8 +63,9 @@ static void remote_machine_init(MachineState *machine)
     } else {
         remote_iohub_init(&s->iohub);
 
-        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq,
                      &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+        pci_bus_map_irqs(pci_host->bus, remote_iohub_map_irq);
     }
 
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index fe1fdfb5f7..88ffafc73e 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -665,8 +665,8 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
     int bus_num = pci_bus_num(pci_bus);
     int max_bdf = PCI_BUILD_BDF(bus_num, PCI_DEVFN_MAX - 1);
 
-    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus,
-                 max_bdf);
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, pci_bus, max_bdf);
+    pci_bus_map_irqs(pci_bus, vfu_object_map_irq);
 }
 
 static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7048a373d1..85ee458cd2 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -282,8 +282,9 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
                          MemoryRegion *address_space_io,
                          uint8_t devfn_min, const char *typename);
 void pci_root_bus_cleanup(PCIBus *bus);
-void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq, pci_map_irq_fn map_irq,
+void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
                   void *irq_opaque, int nirq);
+void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
 void pci_bus_irqs_cleanup(PCIBus *bus);
 int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
 /* 0 <= pin <= 3 0 = INTA, 1 = INTB, 2 = INTC, 3 = INTD */
-- 
2.38.1


