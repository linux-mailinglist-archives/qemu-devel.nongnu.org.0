Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57F6A8C1A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrdN-0000WH-Hm; Thu, 02 Mar 2023 17:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdK-0000L6-97
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:42 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdH-0000DJ-U4
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so578545wrb.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RidLNtwIoGn7ttcFWACRZC3LbU/oAHGplGzZSNvavi4=;
 b=B3Z2GZWF65YZNhmwCw6QzT+ty56a8uyLILDtPxnhdNSQ8I2n5QJ2Y+7wbhDIZX/Vgj
 1StwQJNzCNtgbAA7cgATHTt61ZpCmRG4O/ruUbl3x5WDwIzwouz6Gjsq30tgBXP0rJha
 ghw2wBo5LuS5P0RmtR5pO0jDeHeaV70Ey0DDvuGNCHB+doJVV0CNdamhyOHRCF6Fd9KJ
 4GXN74WZipb9fqK3J0zXJ8W082WKtJJr0VAQRwRnxxzFOFHDiHWJg3Svoaur+uleCfJV
 6eDq7m6V80mZXmSFb8/nf0QdNAR9Prd0qCj85i1V5z7Jzg8xHfyad/gmUxJEYUf6lLxQ
 P+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RidLNtwIoGn7ttcFWACRZC3LbU/oAHGplGzZSNvavi4=;
 b=ab76N21mRLJh4jn4KO8eSfYCdMj3zp2sGcgWzLpWSb8eDvgDiTJg7PAiBuxZ/cSIzG
 xJBA/jpDCKQ/wzSCZ1yakCcgllQZHdXzzRG41wP70ndA7LwqbF3lYvG8c/wHaXSeAQj5
 d3oa+cZF+Px9L/3QWgnps0BU7Bd9c7XtfyQJHl/kTKwbaC4dJP6pRBda9r9UKfdjz4RN
 3ZCecXsV5tcDXrz0G2+ods+zgbuPiyi0Zr5C1a8Lr9CKeiREjv79GEra31r13iymW2D9
 NRAAthYr9u58hBsixGiE3TFvRSWPoCq1UiCciqC8ULz+/mgLyhINZkRCCng2UBWqJ6EZ
 49pQ==
X-Gm-Message-State: AO0yUKWSVH3KNlnPgtHmDjpYxtjgTkaYi+JyKY7uaVg/0Aeb+rXqsMaH
 SNgPzNVDRTwhEsQULaIhjP5zjJG+hNoJqyev
X-Google-Smtp-Source: AK7set97gNA8pCbGhtrXeRiPllBW/plNbpaC2ZB8wZ036Ojn4gZMRyk1hGlFrElr2a9STTkqO2SmZw==
X-Received: by 2002:a5d:4c52:0:b0:2cd:ceab:df1a with SMTP id
 n18-20020a5d4c52000000b002cdceabdf1amr2248260wrt.32.1677796958300; 
 Thu, 02 Mar 2023 14:42:38 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d4e91000000b002c559626a50sm532985wru.13.2023.03.02.14.42.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 13/18] exec/ioport: Factor
 portio_list_register_flush_coalesced() out
Date: Thu,  2 Mar 2023 23:40:53 +0100
Message-Id: <20230302224058.43315-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230207234615.77300-2-philmd@linaro.org>
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


