Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB26A8C19
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:44:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrdU-00013w-9D; Thu, 02 Mar 2023 17:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdS-0000uz-AE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:50 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdQ-0000Ec-58
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso313062wmo.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fK7g34mJx6gNikGMTsffAMBcXAjcREVS1r1srhHHzWw=;
 b=Gd1XxVlQ07E87l2OZMVtr1TVfbvkYIypzLnuaJd/X8JWol3BTy6uFEAGHBSD7qlnfu
 WbtgGIVFx47u1J4R8A/QSyI/sigbA1XKLZWspwh3YCcn37Lih2gTCUjTB0spaEvCmYDy
 vj6n+vmfUzo5xPbNQsK25lN9sQQf7+br/PKvscR3FgNVKwaGX5Moj4D2cOCa7qS+Q18+
 AeNqSsQIe055aKSQbwulcsOsTt27jdHz9nrBNONutLI7eUJqeJ7UXEi6aS0nYS4HpJxd
 xm/LVARyS7uAjf0IdU7I4hBIx7Mpx9x8pte++HER4BcnGwjUYDF47whJ729e8oqEh0Dh
 dEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fK7g34mJx6gNikGMTsffAMBcXAjcREVS1r1srhHHzWw=;
 b=rmov1EErMcYxkhFpobsTOJp5bR+y3bQx5kcYRMRYpSdVN1mADRfNUvrr+MFmB0V0qK
 U6V0erg5xd9TTW4+VqBgRLiX9FnlGxCpSGVT//Dv1ppqNZzaAZ+MJDAnvVLS+vC07lTu
 4rScXV5zD3bg6GlqIwRYR9yV5mIypWOz8KQSDyTREZ2QFlkABI3gatvVrVwGKDRU+lA8
 iQI3rgKeDndmOl7hwFMWyzaR7p4DJ4cTveF23Bv3M1MYHHI8/rtkMPWoQlC6/4Z82VsH
 lTtK+VWUAGO1sM/YXpdHskemPEc9C8BjX2ngPQSuNHb5TPYO80vcI2q5cpPpPF3POd2d
 yq6Q==
X-Gm-Message-State: AO0yUKUko6WJ7zWU9zq6DdBateeBq/EEBgCiNofv4zcdw9QHggmb3fQG
 k031Ak/jRQh/UKE4P1wfWrVAMk4wIMr42KFV
X-Google-Smtp-Source: AK7set92ay8YYa8ki9PgExPvXTvaQs/6rznBXucVxslxNd9sRiFYtFH8ZQ352hYHzoWNsulJDaMlXQ==
X-Received: by 2002:a05:600c:a29e:b0:3eb:4150:a476 with SMTP id
 hu30-20020a05600ca29e00b003eb4150a476mr8352027wmb.0.1677796966220; 
 Thu, 02 Mar 2023 14:42:46 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c205400b003e8dcc67bdesm3967320wmg.30.2023.03.02.14.42.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 14/18] exec/ioport: Factor portio_list_register() out
Date: Thu,  2 Mar 2023 23:40:54 +0100
Message-Id: <20230302224058.43315-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230207234615.77300-3-philmd@linaro.org>
---
 hw/audio/adlib.c        |  4 ++--
 hw/display/vga.c        |  4 ++--
 hw/dma/i82374.c         |  7 +++----
 hw/ide/ioport.c         |  9 ++++-----
 hw/isa/isa-bus.c        |  5 ++---
 hw/watchdog/wdt_ib700.c |  4 ++--
 include/exec/ioport.h   | 10 ++++------
 softmmu/ioport.c        | 21 ++++++++++++++-------
 8 files changed, 33 insertions(+), 31 deletions(-)

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
index 63734c22c9..aeca0e8323 100644
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
diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index ed7957dbae..7a6f29955f 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -60,9 +60,8 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
 void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
                          int iobase, int iobase2)
 {
-    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "ide");
-    portio_list_add(&bus->portio_list, io, iobase);
-
-    portio_list_init(&bus->portio2_list, owner, ide_portio2_list, bus, "ide");
-    portio_list_add(&bus->portio_list, io, iobase2);
+    portio_list_register(&bus->portio_list, owner, ide_portio_list,
+                         bus, "ide", io, iobase);
+    portio_list_register(&bus->portio2_list, owner, ide_portio2_list,
+                         bus, "ide", io, iobase2);
 }
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 8e3ca3785e..087293108e 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -130,15 +130,14 @@ int isa_register_portio_list(ISADevice *dev,
                              void *opaque, const char *name)
 {
     assert(dev);
-    assert(piolist && !piolist->owner);
 
     /* START is how we should treat DEV, regardless of the actual
        contents of the portio array.  This is how the old code
        actually handled e.g. the FDC device.  */
     isa_init_ioport(dev, start);
 
-    portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
-    portio_list_add(piolist, isa_address_space_io(dev), start);
+    portio_list_register(piolist, OBJECT(dev), pio_start, opaque, name,
+                         isa_address_space_io(dev), start);
 
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


