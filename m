Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78536FA90
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:40:20 +0200 (CEST)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSRP-0007fK-HU
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSS-0001Ie-Gc
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSM-0001o7-OC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldyAMmm/MqSouCO97qButlnMQ7+UyDEUdMOfe785qBA=;
 b=KRH2mB+KpbA1pod5kyyaPXK50p6TY3mfO2m0sd6e2w1kADRCs7ZP5/wTfgSZ2uVKaRu2W4
 Bi9fLIviwHOi+uwxOM9NbeEVd7Z01fEUr2/t3xqrVFrnO8RgV4Bxjm/skgc08Vvk3q0fJE
 ZeTyOmuHvkwySfESPEO78AoEv4agsdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-datoc80jOtqp5Ww6idu1EA-1; Fri, 30 Apr 2021 07:37:11 -0400
X-MC-Unique: datoc80jOtqp5Ww6idu1EA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA381922967;
 Fri, 30 Apr 2021 11:37:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D5919C45;
 Fri, 30 Apr 2021 11:37:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 01E7718007A7; Fri, 30 Apr 2021 13:35:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/16] virtio-gpu: add virtio-vga-gl
Date: Fri, 30 Apr 2021 13:35:47 +0200
Message-Id: <20210430113547.1816178-17-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, tina.zhang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vivek.kasireddy@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add pci proxy for virtio-gpu-gl-device, with vga compatibility.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.30.2


