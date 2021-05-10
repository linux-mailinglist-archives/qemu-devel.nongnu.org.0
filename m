Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDBF378CDD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:37:26 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg66A-0006qm-0b
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5sH-0006m8-S4
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5sF-0003Va-TA
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoFyKsSFk8GJAfA1oW6HnVClxWcBlMQLcfatjKnEVrk=;
 b=AVJd4ks7fkQLMUyF1vJxB34q+d2IzKc+ZIXBpTrcF+KQ2f+/ZMkKwfNQvKOCSp/hsa5zwK
 C1rmD3C3Ex+g09MfTDkGKNiu4cBZXATCg+u8Szm9OYcsyJsKnl/vbEX9OXDqtYvoxC5O2P
 UZEkmXunPRj5cH/Zesy9FLUYQCI4T1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-ycFoLSyZMbyrNde-1ljJWw-1; Mon, 10 May 2021 09:23:01 -0400
X-MC-Unique: ycFoLSyZMbyrNde-1ljJWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2989107ACF4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:23:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E66F2C14A;
 Mon, 10 May 2021 13:22:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C0241800904; Mon, 10 May 2021 15:20:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/25] virtio-gpu: add virtio-vga-gl
Date: Mon, 10 May 2021 15:20:51 +0200
Message-Id: <20210510132051.2208563-26-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add pci proxy for virtio-gpu-gl-device, with vga compatibility.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210430113547.1816178-1-kraxel@redhat.com
Message-Id: <20210430113547.1816178-17-kraxel@redhat.com>
---
 hw/display/virtio-vga-gl.c | 47 ++++++++++++++++++++++++++++++++++++++
 util/module.c              |  2 ++
 hw/display/meson.build     |  5 ++++
 3 files changed, 54 insertions(+)
 create mode 100644 hw/display/virtio-vga-gl.c

diff --git a/hw/display/virtio-vga-gl.c b/hw/display/virtio-vga-gl.c
new file mode 100644
index 000000000000..c971340ebb1a
--- /dev/null
+++ b/hw/display/virtio-vga-gl.c
@@ -0,0 +1,47 @@
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-gpu.h"
+#include "hw/display/vga.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "virtio-vga.h"
+#include "qom/object.h"
+
+#define TYPE_VIRTIO_VGA_GL "virtio-vga-gl"
+
+typedef struct VirtIOVGAGL VirtIOVGAGL;
+DECLARE_INSTANCE_CHECKER(VirtIOVGAGL, VIRTIO_VGA_GL,
+                         TYPE_VIRTIO_VGA_GL)
+
+struct VirtIOVGAGL {
+    VirtIOVGABase parent_obj;
+
+    VirtIOGPUGL   vdev;
+};
+
+static void virtio_vga_gl_inst_initfn(Object *obj)
+{
+    VirtIOVGAGL *dev = VIRTIO_VGA_GL(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_GPU_GL);
+    VIRTIO_VGA_BASE(dev)->vgpu = VIRTIO_GPU_BASE(&dev->vdev);
+}
+
+
+static VirtioPCIDeviceTypeInfo virtio_vga_gl_info = {
+    .generic_name  = TYPE_VIRTIO_VGA_GL,
+    .parent        = TYPE_VIRTIO_VGA_BASE,
+    .instance_size = sizeof(VirtIOVGAGL),
+    .instance_init = virtio_vga_gl_inst_initfn,
+};
+
+static void virtio_vga_register_types(void)
+{
+    if (have_vga) {
+        virtio_pci_types_register(&virtio_vga_gl_info);
+    }
+}
+
+type_init(virtio_vga_register_types)
diff --git a/util/module.c b/util/module.c
index fc545c35bcd2..eee8ff2de136 100644
--- a/util/module.c
+++ b/util/module.c
@@ -184,6 +184,7 @@ static const struct {
 
     { "hw-display-virtio-gpu-gl", "hw-display-virtio-gpu" },
     { "hw-display-virtio-gpu-pci-gl", "hw-display-virtio-gpu-pci" },
+    { "hw-display-virtio-vga-gl", "hw-display-virtio-vga" },
 
 #ifdef CONFIG_OPENGL
     { "ui-egl-headless", "ui-opengl"    },
@@ -313,6 +314,7 @@ static struct {
     { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
     { "virtio-vga",            "hw-", "display-virtio-vga"    },
+    { "virtio-vga-gl",         "hw-", "display-virtio-vga-gl" },
     { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
     { "chardev-braille",       "chardev-", "baum"             },
     { "chardev-spicevmc",      "chardev-", "spice"            },
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 8ca2e7ab6362..612cd6582d0c 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -87,6 +87,11 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   virtio_vga_ss.add(when: 'CONFIG_VHOST_USER_VGA',
                     if_true: files('vhost-user-vga.c'))
   hw_display_modules += {'virtio-vga': virtio_vga_ss}
+
+  virtio_vga_gl_ss = ss.source_set()
+  virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', 'CONFIG_VIRGL', opengl],
+                       if_true: [files('virtio-vga-gl.c'), pixman])
+  hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
 
 specific_ss.add(when: [x11, opengl, 'CONFIG_MILKYMIST_TMU2'], if_true: files('milkymist-tmu2.c'))
-- 
2.31.1


