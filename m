Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA7136FA4E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:33:45 +0200 (CEST)
Received: from localhost ([::1]:54510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSL2-00010b-T8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSL-0001CT-6u
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSC-0001kG-Vz
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2MSFZWInfdpArGGLWTQmBx3MJx3cUf05FRzeb35Kdg=;
 b=ealUJhrWQpi/oTydEMK1+CEnt+oRfEU/8/iiniiZhw55iyJJwGD3Z30wznTV4okKHhaMJg
 ghds+eWgO33m+AQ9CV0c+mXF5br63P+DwLTGdnkrXujD225jvAOrV/pFOWOnNoIVY8PnxR
 nYmwMvNG+cjF76z+QoEVuVa72ne/6IM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-6EQMCg-BMoOVY43vXgNv8Q-1; Fri, 30 Apr 2021 07:37:00 -0400
X-MC-Unique: 6EQMCg-BMoOVY43vXgNv8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750AB1020C24;
 Fri, 30 Apr 2021 11:36:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 293291007624;
 Fri, 30 Apr 2021 11:36:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DA40718007A4; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] virtio-gpu: add virtio-gpu-gl-pci
Date: Fri, 30 Apr 2021 13:35:45 +0200
Message-Id: <20210430113547.1816178-15-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Add pci proxy for virtio-gpu-gl-device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.30.2


