Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8F341B6C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:27:33 +0100 (CET)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDHw-0007F7-EK
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCc-0008K9-RM
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCZ-0007ej-5E
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CazhN+s4LUPCfiHbWXTqyiIPy68Xuh01R49WXADmg+U=;
 b=Kqqd5ittwowp/TZJwyCAL2NSl6n0CvyFH42AFHsryfZPmF0GaVOKz1VrRsGGPeLbTnkxEa
 AqpVv9i3BvcMXbIV+JWSwDJ51+M+cflLxfgWg/FwqEp+6aa9UDSv2LJeWB09kjFpSusnlL
 Fd3oacTbkk2fAis01VQRIVvEdBh6J7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-h-hbInqkOsW8ac8HltHZ_A-1; Fri, 19 Mar 2021 07:21:56 -0400
X-MC-Unique: h-hbInqkOsW8ac8HltHZ_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C838A83DD22;
 Fri, 19 Mar 2021 11:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51A7D19715;
 Fri, 19 Mar 2021 11:21:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF88C18003A4; Fri, 19 Mar 2021 12:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/15] virtio-gpu: add virtio-gpu-gl-device
Date: Fri, 19 Mar 2021 12:21:34 +0100
Message-Id: <20210319112147.4138943-3-kraxel@redhat.com>
In-Reply-To: <20210319112147.4138943-1-kraxel@redhat.com>
References: <20210319112147.4138943-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 vivek.kasireddy@intel.com, tina.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just a skeleton for starters, following patches will add more code.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  7 ++++++
 hw/display/virtio-gpu-gl.c     | 41 ++++++++++++++++++++++++++++++++++
 util/module.c                  |  1 +
 hw/display/meson.build         |  2 +-
 4 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 hw/display/virtio-gpu-gl.c

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fae149235c58..8ee6b8fe0fb8 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -31,6 +31,9 @@ OBJECT_DECLARE_TYPE(VirtIOGPUBase, VirtIOGPUBaseClass,
 #define TYPE_VIRTIO_GPU "virtio-gpu-device"
 OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPU, VIRTIO_GPU)
 
+#define TYPE_VIRTIO_GPU_GL "virtio-gpu-gl-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
+
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
@@ -163,6 +166,10 @@ struct VirtIOGPU {
     } stats;
 };
 
+struct VirtIOGPUGL {
+    struct VirtIOGPU parent_obj;
+};
+
 struct VhostUserGPU {
     VirtIOGPUBase parent_obj;
 
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
new file mode 100644
index 000000000000..a477cbe186d3
--- /dev/null
+++ b/hw/display/virtio-gpu-gl.c
@@ -0,0 +1,41 @@
+/*
+ * Virtio GPU Device
+ *
+ * Copyright Red Hat, Inc. 2013-2014
+ *
+ * Authors:
+ *     Dave Airlie <airlied@redhat.com>
+ *     Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/iov.h"
+#include "qemu/module.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-gpu.h"
+#include "hw/virtio/virtio-gpu-bswap.h"
+#include "hw/virtio/virtio-gpu-pixman.h"
+#include "hw/qdev-properties.h"
+
+static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
+{
+}
+
+static const TypeInfo virtio_gpu_gl_info = {
+    .name = TYPE_VIRTIO_GPU_GL,
+    .parent = TYPE_VIRTIO_GPU,
+    .instance_size = sizeof(VirtIOGPUGL),
+    .class_init = virtio_gpu_gl_class_init,
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&virtio_gpu_gl_info);
+}
+
+type_init(virtio_register_types)
diff --git a/util/module.c b/util/module.c
index c65060c167df..fb80b85fe606 100644
--- a/util/module.c
+++ b/util/module.c
@@ -300,6 +300,7 @@ static struct {
     { "qxl-vga",               "hw-", "display-qxl"           },
     { "qxl",                   "hw-", "display-qxl"           },
     { "virtio-gpu-device",     "hw-", "display-virtio-gpu"    },
+    { "virtio-gpu-gl-device",  "hw-", "display-virtio-gpu"    },
     { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 8e465731b85b..5161efa08a6e 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -58,7 +58,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman, virgl])
   virtio_gpu_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL'],
-                    if_true: [files('virtio-gpu-virgl.c'), pixman, virgl])
+                    if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 endif
-- 
2.30.2


