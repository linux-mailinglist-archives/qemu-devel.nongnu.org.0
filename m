Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345B378CBA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:25:48 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5ut-00045G-DA
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rD-0004lT-7U
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5rB-0002w8-Co
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFQ67HpM24tC4ZW1DULN3m2x4MPX5tazNY2ZLlXSUWo=;
 b=EAG+ZcQRyXfmdRRnvIO4ET5iA1U94Ad2cdKHn9gNJac5Ne45KY5nCs/XFm1u50guSU+TbU
 gW2vtw/s6TOATNY4WwrDU2NcRqkJT5EiguAYdTpHy3dKG+USNArNzkUj5VVSzT1FNYeD+a
 7QA992fPQrueC3+V1lck6rMIFDPoAdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-YudKfVfnMveKuQEpXFj7xg-1; Mon, 10 May 2021 09:21:55 -0400
X-MC-Unique: YudKfVfnMveKuQEpXFj7xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FD315B38D
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC6735D9F0;
 Mon, 10 May 2021 13:21:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B132D18007A0; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/25] virtio-gpu: move virgl realize + properties
Date: Mon, 10 May 2021 15:20:38 +0200
Message-Id: <20210510132051.2208563-13-kraxel@redhat.com>
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

Move device init (realize) and properties.

Drop the virgl property, the virtio-gpu-gl-device has virgl enabled no
matter what.  Just use virtio-gpu-device instead if you don't want
enable virgl and opengl.  This simplifies the logic and reduces the test
matrix.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210430113547.1816178-1-kraxel@redhat.com
Message-Id: <20210430113547.1816178-4-kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  1 +
 hw/display/virtio-gpu-gl.c     | 33 +++++++++++++++++++++++++++++++++
 hw/display/virtio-gpu.c        | 23 +----------------------
 3 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 5b2d011b49d5..7430f3cd9958 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -221,6 +221,7 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
 void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
+void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index a477cbe186d3..9b7b5f00d7e6 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -16,14 +16,47 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "sysemu/sysemu.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
+{
+    VirtIOGPU *g = VIRTIO_GPU(qdev);
+
+#if defined(HOST_WORDS_BIGENDIAN)
+    error_setg(errp, "virgl is not supported on bigendian platforms");
+    return;
+#endif
+
+    if (!display_opengl) {
+        error_setg(errp, "opengl is not available");
+        return;
+    }
+
+    g->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
+    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =
+        virtio_gpu_virgl_get_num_capsets(g);
+
+    virtio_gpu_device_realize(qdev, errp);
+}
+
+static Property virtio_gpu_gl_properties[] = {
+    DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_STATS_ENABLED, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    vdc->realize = virtio_gpu_gl_device_realize;
+    device_class_set_props(dc, virtio_gpu_gl_properties);
 }
 
 static const TypeInfo virtio_gpu_gl_info = {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 6f3791deb3ae..461b7769b457 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1121,25 +1121,10 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
     return 0;
 }
 
-static void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
+void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
     VirtIOGPU *g = VIRTIO_GPU(qdev);
-    bool have_virgl;
-
-#if !defined(CONFIG_VIRGL) || defined(HOST_WORDS_BIGENDIAN)
-    have_virgl = false;
-#else
-    have_virgl = display_opengl;
-#endif
-    if (!have_virgl) {
-        g->parent_obj.conf.flags &= ~(1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
-    } else {
-#if defined(CONFIG_VIRGL)
-        VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =
-            virtio_gpu_virgl_get_num_capsets(g);
-#endif
-    }
 
     if (!virtio_gpu_base_device_realize(qdev,
                                         virtio_gpu_handle_ctrl_cb,
@@ -1251,12 +1236,6 @@ static Property virtio_gpu_properties[] = {
     VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.conf),
     DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf_max_hostmem,
                      256 * MiB),
-#ifdef CONFIG_VIRGL
-    DEFINE_PROP_BIT("virgl", VirtIOGPU, parent_obj.conf.flags,
-                    VIRTIO_GPU_FLAG_VIRGL_ENABLED, true),
-    DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
-                    VIRTIO_GPU_FLAG_STATS_ENABLED, false),
-#endif
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


