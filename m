Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A504F67D78B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dP-00084s-9H; Thu, 26 Jan 2023 16:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d6-0007wM-FD; Thu, 26 Jan 2023 16:17:56 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d4-0007ix-7N; Thu, 26 Jan 2023 16:17:56 -0500
Received: by mail-ej1-x629.google.com with SMTP id vw16so8543647ejc.12;
 Thu, 26 Jan 2023 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PzZ3R1BYdECVzNFKQABQW6t7uLiAQAn5aLsoxndi4do=;
 b=WeY1LrSTvMKPUVlHl8jMF1vUHvuRMRMgLUGQDbfWyLpsTmzhZC0jpHdnKlfMl9pt5j
 m0nyJ55gr3HM8iZ2FaA9NaEPCAVP/mJB59VI3PeDylv2RO3u6UqS9NWSR/A5BrcvpqqB
 lwm2975b6LPye2HKwSqz3UUb7mojj4+oFGV2M38L7u1mOiHMhX1QQxCcbsKKO3SmMNhN
 lK4zP1RQZQISR2LRuGLQKP3x+XoG5pYlpO+B3da6DEyEZ9EI+wExiRUewdq3iXBlRVsV
 MoGQqK8dfDBH4ahMdIuUH11P0/L9Xa2c6WKF8LqKsOTjEoAGC5LhcdNq55JjvFsWcV7m
 OZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzZ3R1BYdECVzNFKQABQW6t7uLiAQAn5aLsoxndi4do=;
 b=l3KFZwj3T9GajFcQvKxTw9XAKJJHbRtOpxSSekQ87hDf2HLvckRvjiVFTgYODC8V0L
 Em01U/yTxqbsRkrxCll4cxkuQMUXE3W+gBeM01CSTnaTG0XWMDHmf/BG8pyLeVRog76p
 UWnNH9GHQRoW7y4QLp6LuwY5e3rIMVB4hm6QTsStNJBmESGsepZKA+1jeO5qkk/QFqJU
 59f12buHH7Rg3tjdICLI4fx6FoxO13MylPNcLFCyB7/sd8u/hxGL9MwwR+6FzDbCh//g
 XquAt5PkWaO1Ua7lT2WjJJabUHez9EZXozEBeh2Zqja2r7EClcGYvvbIQdwWvGOfj9Z/
 7REw==
X-Gm-Message-State: AFqh2kqWjxZr7iZpwJk2qcJMzAuI/gH3OKtj5HbNIiY9c2cMYYK6Vghb
 8akOEaX0WinKjG0uzEq4L/1nFErQWDjICg==
X-Google-Smtp-Source: AMrXdXvdhtjZ6jV1vaLfkO3UdWukBzWfeqeP27TZtWC4OOZyLE8Wt21QKjDKOV+4ZnZ8FqAMCSPbbA==
X-Received: by 2002:a17:907:8b08:b0:860:c12c:14fd with SMTP id
 sz8-20020a1709078b0800b00860c12c14fdmr41829712ejc.76.1674767872089; 
 Thu, 26 Jan 2023 13:17:52 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:51 -0800 (PST)
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
 20210518215545.1793947-9-philmd@redhat.com
Subject: [PATCH v2 02/10] softmmu/ioport: Merge portio_list_add() into
 portio_list_init()
Date: Thu, 26 Jan 2023 22:17:32 +0100
Message-Id: <20230126211740.66874-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
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

Both functions are always used together and in the same order. Let's
reflect this in the API.

Inspired-by: <20210518215545.1793947-9-philmd@redhat.com>
          'hw/isa: Extract bus part from isa_register_portio_list()'
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/exec/ioport.h   |  6 ++----
 hw/audio/adlib.c        |  4 ++--
 hw/display/qxl.c        |  5 ++---
 hw/display/vga.c        |  8 ++++----
 hw/dma/i82374.c         |  6 ++----
 hw/isa/isa-bus.c        |  6 ++----
 hw/watchdog/wdt_ib700.c |  4 ++--
 softmmu/ioport.c        | 19 +++++++------------
 8 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index e34f668998..ec3e8e5942 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -64,12 +64,10 @@ typedef struct PortioList {
 
 void portio_list_init(PortioList *piolist, Object *owner,
                       const struct MemoryRegionPortio *callbacks,
-                      void *opaque, const char *name);
+                      void *opaque, const char *name,
+                      MemoryRegion *address_space_io, uint16_t start);
 void portio_list_set_flush_coalesced(PortioList *piolist);
 void portio_list_destroy(PortioList *piolist);
-void portio_list_add(PortioList *piolist,
-                     struct MemoryRegion *address_space,
-                     uint32_t addr);
 void portio_list_del(PortioList *piolist);
 
 #endif /* IOPORT_H */
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 5f979b1487..957abe3da7 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -291,8 +291,8 @@ static void adlib_realizefn (DeviceState *dev, Error **errp)
 
     adlib_portio_list[0].offset = s->port;
     adlib_portio_list[1].offset = s->port + 8;
-    portio_list_init (&s->port_list, OBJECT(s), adlib_portio_list, s, "adlib");
-    portio_list_add (&s->port_list, isa_address_space_io(&s->parent_obj), 0);
+    portio_list_init(&s->port_list, OBJECT(s), adlib_portio_list, s, "adlib",
+                     isa_address_space_io(&s->parent_obj), 0);
 }
 
 static Property adlib_properties[] = {
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index ec712d3ca2..6d5a931425 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2224,10 +2224,9 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
     }
     vga_init(vga, OBJECT(dev),
              pci_address_space(dev), pci_address_space_io(dev), false);
-    portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list,
-                     vga, "vga");
+    portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list, vga,
+                     "vga", pci_address_space_io(dev), 0x3b0);
     portio_list_set_flush_coalesced(&qxl->vga_port_list);
-    portio_list_add(&qxl->vga_port_list, pci_address_space_io(dev), 0x3b0);
     qxl->have_vga = true;
 
     vga->con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 7a5fdff649..2b606a526c 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2309,12 +2309,12 @@ void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
                                         1);
     memory_region_set_coalescing(vga_io_memory);
     if (init_vga_ports) {
-        portio_list_init(&s->vga_port_list, obj, vga_ports, s, "vga");
+        portio_list_init(&s->vga_port_list, obj, vga_ports, s, "vga",
+                         address_space_io, 0x3b0);
         portio_list_set_flush_coalesced(&s->vga_port_list);
-        portio_list_add(&s->vga_port_list, address_space_io, 0x3b0);
     }
     if (vbe_ports) {
-        portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe");
-        portio_list_add(&s->vbe_port_list, address_space_io, 0x1ce);
+        portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe",
+                         address_space_io, 0x1ce);
     }
 }
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 34c3aaf7d3..5914b34079 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -131,10 +131,8 @@ static void i82374_realize(DeviceState *dev, Error **errp)
     }
     i8257_dma_init(isa_bus, true);
 
-    portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
-                     "i82374");
-    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj),
-                    s->iobase);
+    portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s, "i82374",
+                     isa_address_space_io(&s->parent_obj), s->iobase);
 
     memset(s->commands, 0, sizeof(s->commands));
 }
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 1bee1a47f1..b3497dad61 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -124,8 +124,6 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *pio_start,
                              void *opaque, const char *name)
 {
-    assert(piolist && !piolist->owner);
-
     if (!isabus) {
         return -ENODEV;
     }
@@ -135,8 +133,8 @@ int isa_register_portio_list(ISADevice *dev,
        actually handled e.g. the FDC device.  */
     isa_init_ioport(dev, start);
 
-    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
-    portio_list_add(piolist, isabus->address_space_io, start);
+    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name,
+                     isabus->address_space_io, start);
 
     return 0;
 }
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index b116c3a3aa..e53e474b83 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -115,8 +115,8 @@ static void wdt_ib700_realize(DeviceState *dev, Error **errp)
 
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ib700_timer_expired, s);
 
-    portio_list_init(&s->port_list, OBJECT(s), wdt_portio_list, s, "ib700");
-    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj), 0);
+    portio_list_init(&s->port_list, OBJECT(s), wdt_portio_list, s, "ib700",
+                     isa_address_space_io(&s->parent_obj), 0);
 }
 
 static void wdt_ib700_reset(DeviceState *dev)
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index 215344467b..c92e3cb27d 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -231,8 +231,13 @@ static void portio_list_add_1(PortioList *piolist,
 
 void portio_list_init(PortioList *piolist, Object *owner,
                       const MemoryRegionPortio *callbacks,
-                      void *opaque, const char *name)
+                      void *opaque, const char *name,
+                      MemoryRegion *address_space_io, uint16_t start)
 {
+    assert(piolist && !piolist->owner);
+
+    const MemoryRegionPortio *pio, *pio_start = callbacks;
+    unsigned int off_low, off_high, off_last, count;
     unsigned n = 0;
 
     while (callbacks[n].size) {
@@ -242,21 +247,11 @@ void portio_list_init(PortioList *piolist, Object *owner,
     piolist->ports = callbacks;
     piolist->nr = 0;
     piolist->regions = g_new0(MemoryRegion *, n);
-    piolist->address_space = NULL;
+    piolist->address_space = address_space_io;
     piolist->opaque = opaque;
     piolist->owner = owner;
     piolist->name = name;
     piolist->flush_coalesced_mmio = false;
-}
-
-void portio_list_add(PortioList *piolist,
-                     MemoryRegion *address_space,
-                     uint32_t start)
-{
-    const MemoryRegionPortio *pio, *pio_start = piolist->ports;
-    unsigned int off_low, off_high, off_last, count;
-
-    piolist->address_space = address_space;
 
     /* Handle the first entry specially.  */
     off_last = off_low = pio_start->offset;
-- 
2.39.1


