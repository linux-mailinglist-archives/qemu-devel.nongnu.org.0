Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81268E48F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:47:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXfS-0006ne-Tg; Tue, 07 Feb 2023 18:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPXfP-0006kn-Uh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:46:28 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPXfN-0004GK-Qc
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:46:27 -0500
Received: by mail-wr1-x429.google.com with SMTP id i5so7982606wrc.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0B/27v5fhkvj3rxQ4L912Gij24XP5X1PWCgVXuzjfw=;
 b=Zsm3FaMQGz6WOd/VxH8J/uOfdjYcjgyhQ9vgiuYP47AtGhRyvHPMHYDsejbkhju8NT
 X5ksYTVKilahLJuzPm0R3BC/Gw9knjNzTAnrT3aXMJC7hCQJ8CsO8NZUne1DED1DnCgV
 2YpkNUSFehsmz3YJIgTNbfB9Aeac8jMUj6piuvAFwFVyi1wkkVXXTTc0o9cgCNnxiSPT
 JJOCf1KkaFYYNoSQ0PlrsbScRUGBq1bzuI1JdtCE1ungPxVMT1T9moOZFptYn+ua5Sr9
 JM1DN7ejV+oYt120ouQ3RWur3boYex9GFMSIHJuiXs7ExDQrsS0Ud9T7Oak7k3E65SCW
 826A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0B/27v5fhkvj3rxQ4L912Gij24XP5X1PWCgVXuzjfw=;
 b=UjBhTJvvvF0RsaRXPWFzcvHJkRHTqJpYxnAlz2N03/4UAkjvv8r6CSINv6CO+AtvDD
 c0lFjiZUZlRF04izfrHDxQ2YdDtYYWAUrzPuayTlYSjU82jL+6mlDF7u3T9+Gv063vJk
 B3A286QhkGy13aCM4uk4owrkWkBgLrtgBA5DTQtAhfVKoOg9imfo1muEAe0ZTiqZPMmd
 jBer7n/5JTD/eLmbDWnHhanq8hndSM1bTcD0LcjGi+jbxmgglhKpobS59cnGhay+lbNG
 5TyJ7PkJjtrq16CzV+QjttiGvdbAi2K60KrqJWkZ2A8evt0fsdLT8kzd1LwmWAKeU/aL
 10Kg==
X-Gm-Message-State: AO0yUKVn/xFu55MUyCpfo9FRjqa+IWEd5CWYN2a4NYYjtiMTHn7O4oMs
 hLacpNpU+k+wnrT3PlWHmpl131mCfbDUSr8x
X-Google-Smtp-Source: AK7set+Zx8CV7SrUhfeW+yX7Y+SPS3aScggCQ/WJMKR6c7HP1Jx8zuQskbi7sH3SOZ5Wyu3DlLXxsQ==
X-Received: by 2002:adf:f212:0:b0:2bf:de33:61a8 with SMTP id
 p18-20020adff212000000b002bfde3361a8mr4915005wro.28.1675813583739; 
 Tue, 07 Feb 2023 15:46:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002c3f03d8851sm3862862wrw.16.2023.02.07.15.46.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 15:46:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] exec/ioport: Factor
 portio_list_register_flush_coalesced() out
Date: Wed,  8 Feb 2023 00:46:14 +0100
Message-Id: <20230207234615.77300-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207234615.77300-1-philmd@linaro.org>
References: <20230207234615.77300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
coalesced portio:

  - portio_list_init()
  - portio_list_set_flush_coalesced()
  - portio_list_add()

Factor these 3 operations in a single helper named
portio_list_register_flush_coalesced().

Drop portio_list_set_flush_coalesced() which is now
inlined.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/qxl.c      |  7 +++----
 hw/display/vga.c      |  5 ++---
 include/exec/ioport.h |  5 ++++-
 softmmu/ioport.c      | 27 ++++++++++++++++++++++-----
 4 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index ec712d3ca2..2ecaa0643f 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2224,10 +2224,9 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
     }
     vga_init(vga, OBJECT(dev),
              pci_address_space(dev), pci_address_space_io(dev), false);
-    portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list,
-                     vga, "vga");
-    portio_list_set_flush_coalesced(&qxl->vga_port_list);
-    portio_list_add(&qxl->vga_port_list, pci_address_space_io(dev), 0x3b0);
+    portio_list_register_flush_coalesced(&qxl->vga_port_list, OBJECT(dev),
+                                         qxl_vga_portio_list, vga, "vga",
+                                         pci_address_space_io(dev), 0x3b0);
     qxl->have_vga = true;
 
     vga->con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 7a5fdff649..98d644922e 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2309,9 +2309,8 @@ void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
                                         1);
     memory_region_set_coalescing(vga_io_memory);
     if (init_vga_ports) {
-        portio_list_init(&s->vga_port_list, obj, vga_ports, s, "vga");
-        portio_list_set_flush_coalesced(&s->vga_port_list);
-        portio_list_add(&s->vga_port_list, address_space_io, 0x3b0);
+        portio_list_register_flush_coalesced(&s->vga_port_list, obj, vga_ports,
+                                             s, "vga", address_space_io, 0x3b0);
     }
     if (vbe_ports) {
         portio_list_init(&s->vbe_port_list, obj, vbe_ports, s, "vbe");
diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index e34f668998..eb9882a3ee 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -65,7 +65,10 @@ typedef struct PortioList {
 void portio_list_init(PortioList *piolist, Object *owner,
                       const struct MemoryRegionPortio *callbacks,
                       void *opaque, const char *name);
-void portio_list_set_flush_coalesced(PortioList *piolist);
+void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
+                                          const MemoryRegionPortio *callbacks,
+                                          void *opaque, const char *name,
+                                          MemoryRegion *mr, uint32_t offset);
 void portio_list_destroy(PortioList *piolist);
 void portio_list_add(PortioList *piolist,
                      struct MemoryRegion *address_space,
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index cb8adb0b93..be0c920c5c 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -124,6 +124,7 @@ void portio_list_init(PortioList *piolist,
         ++n;
     }
 
+    assert(owner);
     piolist->ports = callbacks;
     piolist->nr = 0;
     piolist->regions = g_new0(MemoryRegion *, n);
@@ -134,11 +135,6 @@ void portio_list_init(PortioList *piolist,
     piolist->flush_coalesced_mmio = false;
 }
 
-void portio_list_set_flush_coalesced(PortioList *piolist)
-{
-    piolist->flush_coalesced_mmio = true;
-}
-
 void portio_list_destroy(PortioList *piolist)
 {
     MemoryRegionPortioList *mrpio;
@@ -297,3 +293,24 @@ void portio_list_del(PortioList *piolist)
         memory_region_del_subregion(piolist->address_space, &mrpio->mr);
     }
 }
+
+static void do_portio_list_register(PortioList *piolist, Object *owner,
+                                    const MemoryRegionPortio *callbacks,
+                                    void *opaque, const char *name,
+                                    MemoryRegion *mr, uint32_t offset,
+                                    bool flush_coalesced_mmio)
+{
+    assert(piolist && !piolist->owner);
+    portio_list_init(piolist, owner, callbacks, opaque, name);
+    piolist->flush_coalesced_mmio = flush_coalesced_mmio;
+    portio_list_add(piolist, mr, offset);
+}
+
+void portio_list_register_flush_coalesced(PortioList *piolist, Object *owner,
+                                          const MemoryRegionPortio *callbacks,
+                                          void *opaque, const char *name,
+                                          MemoryRegion *mr, uint32_t offset)
+{
+    do_portio_list_register(piolist, owner, callbacks,
+                            opaque, name, mr, offset, true);
+}
-- 
2.38.1


