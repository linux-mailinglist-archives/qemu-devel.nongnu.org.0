Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AAF6314C4
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 16:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owlu3-0002Hh-Nt; Sun, 20 Nov 2022 10:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owlu1-0002HH-OS; Sun, 20 Nov 2022 10:06:37 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owltz-0001xH-OG; Sun, 20 Nov 2022 10:06:37 -0500
Received: by mail-ej1-x62d.google.com with SMTP id n12so23389552eja.11;
 Sun, 20 Nov 2022 07:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RupXXG9LxqizCm25x5DZfegVWd8XQCxByXgEiCGa2SA=;
 b=EecpGOO+oX4jGiep077zUttl5GqnN/LTL4zbMWKdzqfOxF2kEEfjXa984wcVWbLU9Z
 CbtmGovwCUvvWxUwGo0QZWQHCBk8v07PeM4ZCw+Zu7RJjzcsZmR5K2ioqYjDFArYhRLE
 pjKZSkKzqpCkg3mmqx1Rei80eUj6czdIkE6y2wo611+51b2M3ho2F37nPRuKTXVWuNzW
 GKDM1h85GjVnB9mLWcNnsWD2Wu1twKouPQ4OhcgHE24fbul9W5DkRgikPmI3CkxtqzUb
 VikMToTtJxes7tEFfg4vxy8ivQv+Fm6LmA2q6TxLfNygjP0dbwB8dYnoJL5z46n5yVEy
 gnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RupXXG9LxqizCm25x5DZfegVWd8XQCxByXgEiCGa2SA=;
 b=dUxnTkRS/Y5J9mUBLTaGzS37I61981MTmAm/BGTc+jomP0PB9XHObqOEzSUB32BiWB
 FRkCybyXrQ3STy5XKgDOqKweEyJJbHcgWe6VB1FuG0t5vcO+BYxet7aY2IC2kCcpQ9te
 qRRVAIQkQksjdeDf/uEr7mXv9RXNk3xo18e6a4ToGNtMfQiPZqMl+idi4pXCkNGXOHCm
 0aw/vvPp8VkzEv+dd3xTIfWx2jRED6EXRruUaMhmBv68U4ND/S+RZWQxN/id7micfOiB
 USSlpk7DnTFDLAXihvSnWgjoGJ5FeMK0CXUm/c/AdJhbHaAjWJTCPXSNz4+ZOhLmC9eE
 oCQw==
X-Gm-Message-State: ANoB5pmLbeyxjc/UBsf87csh2ukNFCUrekCyPAVOLhy83WETuUcyGluB
 cYilAQBUr57C+xkcQ30/KLiNeKBy8rc=
X-Google-Smtp-Source: AA0mqf6MYpKXFgkxCJ/ncrXsp9tZqca5Xouf4ywcs9vFL0RUbWcggUjFDxifj5FG3j9O6zdq3CSAMQ==
X-Received: by 2002:a17:906:fcd0:b0:7ad:b8c0:3057 with SMTP id
 qx16-20020a170906fcd000b007adb8c03057mr12455927ejb.440.1668956793445; 
 Sun, 20 Nov 2022 07:06:33 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-067-205.77.13.pool.telefonica.de. [77.13.67.205])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b007b2a3cad2cfsm4026785ejh.132.2022.11.20.07.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 07:06:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 1/3] hw/pci/pci: Factor out pci_bus_map_irqs() from
 pci_bus_irqs()
Date: Sun, 20 Nov 2022 16:05:48 +0100
Message-Id: <20221120150550.63059-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120150550.63059-1-shentey@gmail.com>
References: <20221120150550.63059-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
---
 hw/i386/pc_q35.c        |  4 ++--
 hw/isa/piix3.c          |  8 ++++----
 hw/isa/piix4.c          |  3 ++-
 hw/pci-host/raven.c     |  3 ++-
 hw/pci-host/versatile.c |  3 ++-
 hw/pci/pci.c            | 12 +++++++++---
 hw/remote/machine.c     |  3 ++-
 include/hw/pci/pci.h    |  3 ++-
 8 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a496bd6e74..39f035903c 100644
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
index f9b4af5c05..7ad26b82e8 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -388,8 +388,8 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
-                 piix3, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
+    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -424,8 +424,8 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
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
index 8fc1db6dc9..f9211d085f 100644
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
index 7a105e4a63..2db577df4f 100644
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
index f66384fa02..c77a999955 100644
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
index 2f450f6a72..6396cde004 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -283,6 +283,7 @@ static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)
     PCIBus *bus;
     for (;;) {
         bus = pci_get_bus(pci_dev);
+        assert(bus->map_irq);
         irq_num = bus->map_irq(pci_dev, irq_num);
         if (bus->set_irq)
             break;
@@ -521,16 +522,20 @@ void pci_root_bus_cleanup(PCIBus *bus)
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
@@ -552,7 +557,8 @@ PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,
 
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
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6ccaaf5154..01ea267253 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -446,8 +446,9 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
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


