Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B903C378CC4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:29:36 +0200 (CEST)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5yZ-0006Ko-RY
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rC-0004gG-1x
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rA-0002um-3D
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MO4I7oWUv/LeH/IhZrxXZNsEqSNGEQLA/6WF88ElAyM=;
 b=XjW3h9VJKNB278LuwIYNJW3oS9fh+c7qpSthKkfUHOgDN1h8RuYjOOJxh7Wo8QF+vSmBBc
 Tdv+fyfGUGzsDxseiRI0UGegJ1RJcqXUophtuZBlMeGSni66mmAZw+XjSe23eSuIOh6f33
 EIO/Ygop4iKizrPNG9PyIdnvasp8HSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-XS50ADJ9OGODygOX3S4iDw-1; Mon, 10 May 2021 09:21:53 -0400
X-MC-Unique: XS50ADJ9OGODygOX3S4iDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B916106BB3A
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D07345D9F0;
 Mon, 10 May 2021 13:21:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A0D73180079E; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/25] virtio-gpu: add virtio-gpu-gl-device
Date: Mon, 10 May 2021 15:20:37 +0200
Message-Id: <20210510132051.2208563-12-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Just a skeleton for starters, following patches will add more code.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210430113547.1816178-1-kraxel@redhat.com
Message-Id: <20210430113547.1816178-3-kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  7 ++++++
 hw/display/virtio-gpu-gl.c     | 41 ++++++++++++++++++++++++++++++++++
 util/module.c                  |  1 +
 hw/display/meson.build         |  2 +-
 4 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 hw/display/virtio-gpu-gl.c

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 0d15af41d96d..5b2d011b49d5 100644
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
index 7661d0f6234d..47bba1182841 100644
--- a/util/module.c
+++ b/util/module.c
@@ -301,6 +301,7 @@ static struct {
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
2.31.1


