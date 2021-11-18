Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A03456373
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 20:23:32 +0100 (CET)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnn0M-0004ll-Qp
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 14:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmxX-0002hm-3G
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:20:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmxT-0006Br-SK
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637263231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jpwc1njUDX9WFQ9m4sbdQwM8ZWsmcA+LTfVamkkDYw8=;
 b=bCBQKwaTIfVwms8+lJE7/+Xo8Vg9oxqUM0cWaboZvmbUR7plXu81aXpQk4e7U0BQXshuhU
 bS86iJ7OY3SavoUxN7otSFrQVwxN816vS1hw5G3tYYcyQsNVygAH3I4LnIM+WVkLVz/5x1
 fz9mRPK6626ZRNvl3Hjw1F6m9nR1Z1s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-OU6N3iRMPzeqkbZ1_TXv5Q-1; Thu, 18 Nov 2021 14:20:30 -0500
X-MC-Unique: OU6N3iRMPzeqkbZ1_TXv5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so3592561wmh.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 11:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jpwc1njUDX9WFQ9m4sbdQwM8ZWsmcA+LTfVamkkDYw8=;
 b=Mg+vZdmmbnlFr64rEROzb/m+rtOYHW/z7Fw4dUXx49fqrVmeVpyxIRUR19kq1T8IW7
 Uixq018nIHGNn+b9uzVROL/B0aK1jrMVbK/nuanZvWixd9mVBQUw1CkZiurmKJRn9yEL
 ZAmuJXCwQmSgxLfedwRy511PS7w4CzwYgDFAu/aymA7LUJWQ+VJKFFxbxdqJA22QuqJD
 snyF4kpWzl+Ri7GWxFCu30G/W9LBeygYh54qGl63QWFziXjORC2nNZn36+ZPqu5/iRI1
 P6Jt1sAGgdPAXlovzK4xJ6MhtSC5yPEVEpchdqw8Jr88I2QQ+pVIBcJTpgqZyOxEw5J8
 cTgg==
X-Gm-Message-State: AOAM533Zjwr3BMNgbxycKjtVda+KDyfv11xVDV0CVtvoUbVx4UZ3nHvh
 ePevz0NQEaPFFcnNRr3xgcWVrAxT9kx8hUJPLbbnVgwkeSZYr2At1B16tll5ICziB7CFwlda5mU
 1weXS7ikVWDdbHbMSd7sAw5eV4GKX23jL06DfkHawrh2Yfw/A9KbF0nh7rNUb97PE
X-Received: by 2002:a1c:f416:: with SMTP id z22mr13418592wma.121.1637263227714; 
 Thu, 18 Nov 2021 11:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmDTEBhR/CAMDNlUfC7jrP22ptSXJQeEhhe99lMJj3i1mF1yRQibbMwEQd1RamjtlOmMIEnQ==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr13418546wma.121.1637263227469; 
 Thu, 18 Nov 2021 11:20:27 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h13sm693837wrx.82.2021.11.18.11.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 11:20:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/2] hw/display: Add Error* handle to vga_common_init()
Date: Thu, 18 Nov 2021 20:20:19 +0100
Message-Id: <20211118192020.61245-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118192020.61245-1-philmd@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want vga_common_init() to fail gracefully,
therefore allow it to take an Error* handle.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/vga_int.h        | 2 +-
 hw/display/ati.c            | 4 +++-
 hw/display/cirrus_vga.c     | 4 +++-
 hw/display/cirrus_vga_isa.c | 4 +++-
 hw/display/qxl.c            | 4 +++-
 hw/display/vga-isa-mm.c     | 3 ++-
 hw/display/vga-isa.c        | 4 +++-
 hw/display/vga-pci.c        | 8 ++++++--
 hw/display/vga.c            | 4 +++-
 hw/display/virtio-vga.c     | 4 +++-
 hw/display/vmware_vga.c     | 2 +-
 11 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 847e784ca6a..305e700014d 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
     return (v << 2) | (b << 1) | b;
 }
 
-void vga_common_init(VGACommonState *s, Object *obj);
+bool vga_common_init(VGACommonState *s, Object *obj, Error **errp);
 void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
               MemoryRegion *address_space_io, bool init_vga_ports);
 MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 31f22754dce..6e38e005022 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -955,7 +955,9 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
     }
 
     /* init vga bits */
-    vga_common_init(vga, OBJECT(s));
+    if (!vga_common_init(vga, OBJECT(s), errp)) {
+        return;
+    }
     vga_init(vga, OBJECT(s), pci_address_space(dev),
              pci_address_space_io(dev), true);
     vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, &s->vga);
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index fdca6ca659f..5a7ddb84ff0 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2954,7 +2954,9 @@ static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
          return;
      }
      /* setup VGA */
-     vga_common_init(&s->vga, OBJECT(dev));
+    if (!vga_common_init(&s->vga, OBJECT(dev), errp)) {
+        return;
+    }
      cirrus_init_common(s, OBJECT(dev), device_id, 1, pci_address_space(dev),
                         pci_address_space_io(dev));
      s->vga.con = graphic_console_init(DEVICE(dev), 0, s->vga.hw_ops, &s->vga);
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 4f6fb1af3bd..96144bd6906 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -56,7 +56,9 @@ static void isa_cirrus_vga_realizefn(DeviceState *dev, Error **errp)
         return;
     }
     s->global_vmstate = true;
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
+        return;
+    }
     cirrus_init_common(&d->cirrus_vga, OBJECT(dev), CIRRUS_ID_CLGD5430, 0,
                        isa_address_space(isadev),
                        isa_address_space_io(isadev));
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 29c80b4289b..16eb98c25d8 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2198,7 +2198,9 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
     qxl_init_ramsize(qxl);
     vga->vbe_size = qxl->vgamem_size;
     vga->vram_size_mb = qxl->vga.vram_size / MiB;
-    vga_common_init(vga, OBJECT(dev));
+    if (!vga_common_init(vga, OBJECT(dev), errp)) {
+        return;
+    }
     vga_init(vga, OBJECT(dev),
              pci_address_space(dev), pci_address_space_io(dev), false);
     portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list,
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 7321b7a06d5..420da1d7467 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "qemu/units.h"
+#include "qapi/error.h"
 #include "migration/vmstate.h"
 #include "hw/display/vga.h"
 #include "vga_int.h"
@@ -101,7 +102,7 @@ int isa_vga_mm_init(hwaddr vram_base,
 
     s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
     s->vga.global_vmstate = true;
-    vga_common_init(&s->vga, NULL);
+    vga_common_init(&s->vga, NULL, &error_fatal);
     vga_mm_init(s, vram_base, ctrl_base, it_shift, address_space);
 
     s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 8cea84f2bea..2782012196a 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -72,7 +72,9 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     }
 
     s->global_vmstate = true;
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
+        return;
+    }
     s->legacy_address_space = isa_address_space(isadev);
     vga_io_memory = vga_init_io(s, OBJECT(dev), &vga_ports, &vbe_ports);
     isa_register_portio_list(isadev, &d->portio_vga,
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 62fb5c38c1f..3e5bc259f7a 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -239,7 +239,9 @@ static void pci_std_vga_realize(PCIDevice *dev, Error **errp)
     bool edid = false;
 
     /* vga + console init */
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
+        return;
+    }
     vga_init(s, OBJECT(dev), pci_address_space(dev), pci_address_space_io(dev),
              true);
 
@@ -275,7 +277,9 @@ static void pci_secondary_vga_realize(PCIDevice *dev, Error **errp)
     bool edid = false;
 
     /* vga + console init */
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
+        return;
+    }
     s->con = graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
 
     /* mmio bar */
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 9d1f66af402..a6759c7e934 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2168,7 +2168,7 @@ static inline uint32_t uint_clamp(uint32_t val, uint32_t vmin, uint32_t vmax)
     return val;
 }
 
-void vga_common_init(VGACommonState *s, Object *obj)
+bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
 {
     int i, j, v, b;
 
@@ -2237,6 +2237,8 @@ void vga_common_init(VGACommonState *s, Object *obj)
     s->default_endian_fb = false;
 #endif
     vga_dirty_log_start(s);
+
+    return true;
 }
 
 static const MemoryRegionPortio vga_portio_list[] = {
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 9e57f61e9ed..d89735d7301 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -119,7 +119,9 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 
     /* init vga compat bits */
     vga->vram_size_mb = 8;
-    vga_common_init(vga, OBJECT(vpci_dev));
+    if (!vga_common_init(vga, OBJECT(vpci_dev), errp)) {
+        return;
+    }
     vga_init(vga, OBJECT(vpci_dev), pci_address_space(&vpci_dev->pci_dev),
              pci_address_space_io(&vpci_dev->pci_dev), true);
     pci_register_bar(&vpci_dev->pci_dev, 0,
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index e2969a6c81c..d67318e6e46 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1248,7 +1248,7 @@ static void vmsvga_init(DeviceState *dev, struct vmsvga_state_s *s,
                            &error_fatal);
     s->fifo_ptr = memory_region_get_ram_ptr(&s->fifo_ram);
 
-    vga_common_init(&s->vga, OBJECT(dev));
+    vga_common_init(&s->vga, OBJECT(dev), &error_fatal);
     vga_init(&s->vga, OBJECT(dev), address_space, io, true);
     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
     s->new_depth = 32;
-- 
2.31.1


