Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C69662C9C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:26:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtS-0002Vp-1Q; Mon, 09 Jan 2023 12:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtN-0002Ra-Bd; Mon, 09 Jan 2023 12:25:01 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtL-0000zp-73; Mon, 09 Jan 2023 12:25:01 -0500
Received: by mail-ej1-x629.google.com with SMTP id fy8so21837879ejc.13;
 Mon, 09 Jan 2023 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8jrOub/s1hNNY+Y6dIq5uqtkEpcH/mb81af1xqTfykQ=;
 b=XhFI/8jSLU1D2UA2vvycN342EtwRnlbhWYpkw1XXTcLf9t/kKCl8wPHVysdK+jwghL
 +CLE9ky5OcvDlCes0lMoNwK9u9TKIaPmNatFoktrFz8NRb0YLV8ebULLZRQIc8+7HHsG
 SlHVajb8jc+ixfQ4EE0oHFcOuq8UdBeTQt0jn518y66TImbns30/rNjj0aA5/wE7ZQvG
 t0LbzaPl1uMPgwFd+ZZvMFKzK9ZUeV3C6YeIrOBn+myXpvXGeYR0jF1Ed7aPS394A9N6
 +JU9F7uc1se2AMXD94pTD2kFNSW6UtjOb+VIiW+22FLSbLr8V1z9RrQmsjdPy+nPCz8e
 eYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8jrOub/s1hNNY+Y6dIq5uqtkEpcH/mb81af1xqTfykQ=;
 b=Hjj27EZ+uwyYAKwQc49mJshZtI9x1rSWkSxju34mBaU6Lq0i8CZCdqIwOsXhv8u1Rj
 bwJcwkym/tRkhUwrar5AsXl8ZuOawwwzCVIX+khj7U6A11qLPc4+9fGSQqRjXPNdxmjp
 CJdkdcDTEE6yhr2orUzOQvHkdoQh4SerNfSK4MUQljiV/X6UIMidNnpVyonyv5iMPiCe
 t2oL0iVLjt92kgPTWlJV9moumy240izj0x7IpOZHdJRiBtMkcZPHBzWimrskxArWb3Zl
 tJf8DTCDxG6JLtmZXTbLHqYHxU5zrCxboParaFKg1X2SjuwpHFkm3arkjdbTgdA28y+D
 7X1g==
X-Gm-Message-State: AFqh2krGcXR+2rB/pkoOQ3V1MJyhjAdk4sPK/e9A1TemNadza8LFVZvT
 Ab5YA5fNoVRmZeC5+uKIMRXU1hwM1K71RQ==
X-Google-Smtp-Source: AMrXdXu9QdI1C0WINbrrBrUKLRdCztx0EO0Yyx5+HDXlCFA2NgNgpcbCKr2eN5fz6EMl8jfsgIOl+Q==
X-Received: by 2002:a17:907:a641:b0:7c0:f7b0:95d3 with SMTP id
 vu1-20020a170907a64100b007c0f7b095d3mr57983355ejc.36.1673285096295; 
 Mon, 09 Jan 2023 09:24:56 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 04/33] hw/pci/pci: Factor out pci_bus_map_irqs() from
 pci_bus_irqs()
Date: Mon,  9 Jan 2023 18:23:17 +0100
Message-Id: <20230109172347.1830-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci.h    |  3 ++-
 hw/i386/pc_q35.c        |  4 ++--
 hw/isa/piix3.c          |  8 ++++----
 hw/isa/piix4.c          |  3 ++-
 hw/pci-host/raven.c     |  3 ++-
 hw/pci-host/versatile.c |  3 ++-
 hw/pci/pci.c            | 12 +++++++++---
 hw/remote/machine.c     |  3 ++-
 8 files changed, 25 insertions(+), 14 deletions(-)

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
-- 
2.39.0


