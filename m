Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4515B68E490
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:47:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXfZ-0006qh-2e; Tue, 07 Feb 2023 18:46:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPXfV-0006o8-JA
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:46:33 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPXfT-0004Hc-OH
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:46:33 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so15131685wrz.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2f0iha8SxJ3GTIIkMqw68cz2gxVup6DOW4gRrVYJtXA=;
 b=vTX1JPEVxPFIPk4stsaPRoda/zJ0XeM1JLo4jdwOAR3bNqqZWocbaJPSh9Wl0rXA/j
 /FYvJ4yPMzcFFm3r0lUM8cOzturJL28KXXu7D4tsvsSkqWfhii8hGbLuRIjoWEApZocE
 F8tltZ0WgjaCGnnVSlVT9LJPQK+Yno9FKlK+HUz7O0JgbGm67Fd3lZzUMfQqgYPUADr/
 yxzh9+59GmLzFbuZUxKe3hNnpkp/XmFa2hHsDlIP8ETbXzk6ZkFiBUXiULXqe4FX633s
 mbsz4ZCE2DPcVeh2KwpW2RjUeuKhOLJH4rrhCkqsxglweGXwrqUl+j4Sn2unB2d52ds3
 UL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2f0iha8SxJ3GTIIkMqw68cz2gxVup6DOW4gRrVYJtXA=;
 b=tELP/KJaW45Kum+68UVcfiwj6ZMVXF3AjiaJYYwtrrtQHwFru+n2p2Dp/OOi4SH885
 AGBYWsLB16Is05/qvJrzI29fFj/kVeqIlpD1wB6lerDGEG3mAgZ5coGKLE5CIvcU2Tw+
 wPPpZ4acnvBOHAdw14HE6uiX87txRGFhtvuzp6lduAyCY2Ca1bWdvpDdSniJNWWNxMIg
 UWccPJD0HyyD9Ad/t9CRShnYDaJynWTAKdSSPC0+jMVM6ygG96HGK4RXh+sp1wnkAYqG
 +31YNja8EY/Ra9tJN5gtMDa5nAPsCUGUCErOHrER/PZHHA4wV6kCnHruAAQGaNZKW/U+
 gOrg==
X-Gm-Message-State: AO0yUKXcRyKLdNCM0abVC+X++tfyxaNb4gqz6k69zh69jyBbqMAwpq2c
 xqjDxc/XdqQ2bmvTa5OZhXkvbCTKBzET/Ygs
X-Google-Smtp-Source: AK7set+recNrTmfrfExHIEvOjeErWbOaUWOiR58WUmEwUkPdTq/RZbAYa1K/Tfx8ScmrWxtrnF+3eg==
X-Received: by 2002:a5d:5646:0:b0:2bf:f4f7:be9c with SMTP id
 j6-20020a5d5646000000b002bff4f7be9cmr4507364wrw.14.1675813589472; 
 Tue, 07 Feb 2023 15:46:29 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adf8b41000000b002be505ab59asm12704537wra.97.2023.02.07.15.46.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 15:46:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] exec/ioport: Factor portio_list_register() out
Date: Wed,  8 Feb 2023 00:46:15 +0100
Message-Id: <20230207234615.77300-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207234615.77300-1-philmd@linaro.org>
References: <20230207234615.77300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We always follow the same pattern when registering
non-coalesced portio:

  - portio_list_init()
  - portio_list_add()

Factor these 2 operations in a single helper named
portio_list_register(). Since both calls become local
to ioport.c, reduce their scope by declaring them static.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/adlib.c        |  4 ++--
 hw/display/vga.c        |  4 ++--
 hw/dma/i82374.c         |  7 +++----
 hw/isa/isa-bus.c        |  6 ++----
 hw/watchdog/wdt_ib700.c |  4 ++--
 include/exec/ioport.h   | 10 ++++------
 softmmu/ioport.c        | 21 ++++++++++++++-------
 7 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 5f979b1487..cc03c99306 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -291,8 +291,8 @@ static void adlib_realizefn (DeviceState *dev, Error **errp)
 
     adlib_portio_list[0].offset = s->port;
     adlib_portio_list[1].offset = s->port + 8;
-    portio_list_init (&s->port_list, OBJECT(s), adlib_portio_list, s, "adlib");
-    portio_list_add (&s->port_list, isa_address_space_io(&s->parent_obj), 0);
+    portio_list_register(&s->port_list, OBJECT(s), adlib_portio_list, s,
+                         "adlib", isa_address_space_io(&s->parent_obj), 0);
 }
 
 static Property adlib_properties[] = {
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 98d644922e..aa899fddc3 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2313,7 +2313,7 @@ void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
                                              s, "vga", address_space_io, 0x3b0);
     }
     if (vbe_ports) {
-        portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe");
-        portio_list_add(&s->vbe_port_list, address_space_io, 0x1ce);
+        portio_list_register(&s->vbe_port_list, obj, vbe_ports, s,
+                             "vbe", address_space_io, 0x1ce);
     }
 }
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 34c3aaf7d3..cb68eee192 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -131,10 +131,9 @@ static void i82374_realize(DeviceState *dev, Error **errp)
     }
     i8257_dma_init(isa_bus, true);
 
-    portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
-                     "i82374");
-    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj),
-                    s->iobase);
+    portio_list_register(&s->port_list, OBJECT(s), i82374_portio_list, s,
+                         "i82374", isa_address_space_io(&s->parent_obj),
+                         s->iobase);
 
     memset(s->commands, 0, sizeof(s->commands));
 }
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index f155b80010..4fe61d6dfe 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -123,8 +123,6 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *pio_start,
                              void *opaque, const char *name)
 {
-    assert(piolist && !piolist->owner);
-
     if (!isabus) {
         return -ENODEV;
     }
@@ -134,8 +132,8 @@ int isa_register_portio_list(ISADevice *dev,
        actually handled e.g. the FDC device.  */
     isa_init_ioport(dev, start);
 
-    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
-    portio_list_add(piolist, isabus->address_space_io, start);
+    portio_list_register(piolist, OBJECT(dev), pio_start, opaque, name,
+                         isabus->address_space_io, start);
 
     return 0;
 }
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index b116c3a3aa..ac4f0be7d8 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -115,8 +115,8 @@ static void wdt_ib700_realize(DeviceState *dev, Error **errp)
 
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ib700_timer_expired, s);
 
-    portio_list_init(&s->port_list, OBJECT(s), wdt_portio_list, s, "ib700");
-    portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj), 0);
+    portio_list_register(&s->port_list, OBJECT(s), wdt_portio_list, s,
+                         "ib700", isa_address_space_io(&s->parent_obj), 0);
 }
 
 static void wdt_ib700_reset(DeviceState *dev)
diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index eb9882a3ee..ca44f269ea 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -62,17 +62,15 @@ typedef struct PortioList {
     bool flush_coalesced_mmio;
 } PortioList;
 
-void portio_list_init(PortioList *piolist, Object *owner,
-                      const struct MemoryRegionPortio *callbacks,
-                      void *opaque, const char *name);
+void portio_list_register(PortioList *piolist, Object *owner,
+                          const MemoryRegionPortio *callbacks,
+                          void *opaque, const char *name,
+                          MemoryRegion *mr, uint32_t offset);
 void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
                                           const MemoryRegionPortio *callbacks,
                                           void *opaque, const char *name,
                                           MemoryRegion *mr, uint32_t offset);
 void portio_list_destroy(PortioList *piolist);
-void portio_list_add(PortioList *piolist,
-                     struct MemoryRegion *address_space,
-                     uint32_t addr);
 void portio_list_del(PortioList *piolist);
 
 #endif /* IOPORT_H */
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index be0c920c5c..42d43f8b27 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -113,10 +113,9 @@ uint32_t cpu_inl(uint32_t addr)
     return val;
 }
 
-void portio_list_init(PortioList *piolist,
-                      Object *owner,
-                      const MemoryRegionPortio *callbacks,
-                      void *opaque, const char *name)
+static void portio_list_init(PortioList *piolist, Object *owner,
+                             const MemoryRegionPortio *callbacks,
+                             void *opaque, const char *name)
 {
     unsigned n = 0;
 
@@ -246,9 +245,8 @@ static void portio_list_add_1(PortioList *piolist,
     ++piolist->nr;
 }
 
-void portio_list_add(PortioList *piolist,
-                     MemoryRegion *address_space,
-                     uint32_t start)
+static void portio_list_add(PortioList *piolist, MemoryRegion *address_space,
+                            uint32_t start)
 {
     const MemoryRegionPortio *pio, *pio_start = piolist->ports;
     unsigned int off_low, off_high, off_last, count;
@@ -314,3 +312,12 @@ void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
     do_portio_list_register(piolist, owner, callbacks,
                             opaque, name, mr, offset, true);
 }
+
+void portio_list_register(PortioList *piolist, Object *owner,
+                          const MemoryRegionPortio *callbacks,
+                          void *opaque, const char *name,
+                          MemoryRegion *mr, uint32_t offset)
+{
+    do_portio_list_register(piolist, owner, callbacks,
+                            opaque, name, mr, offset, false);
+}
-- 
2.38.1


