Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ADE378CCD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:32:29 +0200 (CEST)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg61L-0004c0-Ve
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5s9-0006Vg-86
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5s6-0003Rz-V5
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSuExPQr+SpR5lwc3jGzlq3xwEKAHRilRJXpa4549O8=;
 b=LLPXYEWmTaa1t1tKo/zVLqI6yDIuaQoW+p4WbkFY41GsvRV9Ju9/7CY26RtL1MfMGvN9Rb
 QCCMpRDJxyqJoGssU8IecA8AaqTKsz/g8tEgSN73YmjtzwVb7iBygWbOVRNqIVMKv8MpP4
 zZsPTEMlwJ2QJsk9hEYqvBTzfhA1ohY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-Gr1r5v6KPAGXJ5RlHuHaLg-1; Mon, 10 May 2021 09:22:52 -0400
X-MC-Unique: Gr1r5v6KPAGXJ5RlHuHaLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E10CE8014D8
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:22:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A65D62499;
 Mon, 10 May 2021 13:22:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5E63F1800902; Mon, 10 May 2021 15:20:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/25] virtio-gpu: add virtio-gpu-gl-pci
Date: Mon, 10 May 2021 15:20:49 +0200
Message-Id: <20210510132051.2208563-24-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

Add pci proxy for virtio-gpu-gl-device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210430113547.1816178-1-kraxel@redhat.com
Message-Id: <20210430113547.1816178-15-kraxel@redhat.com>
---
 hw/display/virtio-gpu-pci-gl.c | 55 ++++++++++++++++++++++++++++++++++
 util/module.c                  |  2 ++
 hw/display/meson.build         |  5 ++++
 3 files changed, 62 insertions(+)
 create mode 100644 hw/display/virtio-gpu-pci-gl.c

diff --git a/hw/display/virtio-gpu-pci-gl.c b/hw/display/virtio-gpu-pci-gl.c
new file mode 100644
index 000000000000..902dda345275
--- /dev/null
+++ b/hw/display/virtio-gpu-pci-gl.c
@@ -0,0 +1,55 @@
+/*
+ * Virtio video device
+ *
+ * Copyright Red Hat
+ *
+ * Authors:
+ *  Dave Airlie
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-gpu-pci.h"
+#include "qom/object.h"
+
+#define TYPE_VIRTIO_GPU_GL_PCI "virtio-gpu-gl-pci"
+typedef struct VirtIOGPUGLPCI VirtIOGPUGLPCI;
+DECLARE_INSTANCE_CHECKER(VirtIOGPUGLPCI, VIRTIO_GPU_GL_PCI,
+                         TYPE_VIRTIO_GPU_GL_PCI)
+
+struct VirtIOGPUGLPCI {
+    VirtIOGPUPCIBase parent_obj;
+    VirtIOGPUGL vdev;
+};
+
+static void virtio_gpu_gl_initfn(Object *obj)
+{
+    VirtIOGPUGLPCI *dev = VIRTIO_GPU_GL_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_GPU_GL);
+    VIRTIO_GPU_PCI_BASE(obj)->vgpu = VIRTIO_GPU_BASE(&dev->vdev);
+}
+
+static const VirtioPCIDeviceTypeInfo virtio_gpu_gl_pci_info = {
+    .generic_name = TYPE_VIRTIO_GPU_GL_PCI,
+    .parent = TYPE_VIRTIO_GPU_PCI_BASE,
+    .instance_size = sizeof(VirtIOGPUGLPCI),
+    .instance_init = virtio_gpu_gl_initfn,
+};
+
+static void virtio_gpu_gl_pci_register_types(void)
+{
+    virtio_pci_types_register(&virtio_gpu_gl_pci_info);
+}
+
+type_init(virtio_gpu_gl_pci_register_types)
diff --git a/util/module.c b/util/module.c
index c8f3e5a0a736..fc545c35bcd2 100644
--- a/util/module.c
+++ b/util/module.c
@@ -183,6 +183,7 @@ static const struct {
     { "ui-spice-app",   "chardev-spice" },
 
     { "hw-display-virtio-gpu-gl", "hw-display-virtio-gpu" },
+    { "hw-display-virtio-gpu-pci-gl", "hw-display-virtio-gpu-pci" },
 
 #ifdef CONFIG_OPENGL
     { "ui-egl-headless", "ui-opengl"    },
@@ -307,6 +308,7 @@ static struct {
     { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
+    { "virtio-gpu-gl-pci",     "hw-", "display-virtio-gpu-pci-gl" },
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 3c3e47c47ed1..8ca2e7ab6362 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -73,6 +73,11 @@ if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
   virtio_gpu_pci_ss.add(when: ['CONFIG_VHOST_USER_GPU', 'CONFIG_VIRTIO_PCI'],
                         if_true: files('vhost-user-gpu-pci.c'))
   hw_display_modules += {'virtio-gpu-pci': virtio_gpu_pci_ss}
+
+  virtio_gpu_pci_gl_ss = ss.source_set()
+  virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', 'CONFIG_VIRGL', opengl],
+                           if_true: [files('virtio-gpu-pci-gl.c'), pixman])
+  hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
-- 
2.31.1


