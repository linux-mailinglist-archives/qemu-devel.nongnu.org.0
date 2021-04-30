Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64136FA28
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:30:22 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSHl-0007aq-E4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRf-0000er-Nw
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRb-0001Pi-4l
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOvyha5542i4mdxbIN7WTp4XctpbTj5g8szd3EOgRX4=;
 b=UFv+Pvc6lhFcQFa8GpY19y8lCgHxjIuUdjA0T11CT9LJer4GeCBaFIq3Tv3cE0Qh3FnebF
 E8bCD0rzgmC7w01RSwb82EE73RuO5nrYqFj2RPBZtAHfpkqx5ZymLFsOKd02AIZ9lTe8AZ
 /lLTrUghHx0d9zPje1GBIhfr14EfXik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-UnmTvodYO2GTulgU2yRtWg-1; Fri, 30 Apr 2021 07:36:23 -0400
X-MC-Unique: UnmTvodYO2GTulgU2yRtWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A43139196A5;
 Fri, 30 Apr 2021 11:36:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4BA63BA7;
 Fri, 30 Apr 2021 11:36:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51110180060D; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/16] virtio-gpu: move virgl reset
Date: Fri, 30 Apr 2021 13:35:35 +0200
Message-Id: <20210430113547.1816178-5-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  1 +
 hw/display/virtio-gpu-gl.c     | 17 +++++++++++++++++
 hw/display/virtio-gpu.c        | 19 +------------------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 4c1a8faebec9..a7b7d78310ea 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -221,6 +221,7 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
+void virtio_gpu_reset(VirtIODevice *vdev);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 9b7b5f00d7e6..c3e562f835f7 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -23,6 +23,22 @@
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+static void virtio_gpu_gl_reset(VirtIODevice *vdev)
+{
+    VirtIOGPU *g = VIRTIO_GPU(vdev);
+
+    virtio_gpu_reset(vdev);
+
+    if (g->parent_obj.use_virgl_renderer) {
+        if (g->parent_obj.renderer_blocked) {
+            g->renderer_reset = true;
+        } else {
+            virtio_gpu_virgl_reset(g);
+        }
+        g->parent_obj.use_virgl_renderer = false;
+    }
+}
+
 static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
 {
     VirtIOGPU *g = VIRTIO_GPU(qdev);
@@ -56,6 +72,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
 
     vdc->realize = virtio_gpu_gl_device_realize;
+    vdc->reset = virtio_gpu_gl_reset;
     device_class_set_props(dc, virtio_gpu_gl_properties);
 }
 
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2ee6ba756aba..68286f75a01a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1126,18 +1126,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->fenceq);
 }
 
-static void virtio_gpu_reset(VirtIODevice *vdev)
+void virtio_gpu_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
     struct virtio_gpu_simple_resource *res, *tmp;
     struct virtio_gpu_ctrl_command *cmd;
 
-#ifdef CONFIG_VIRGL
-    if (g->parent_obj.use_virgl_renderer) {
-        virtio_gpu_virgl_reset(g);
-    }
-#endif
-
     QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
         virtio_gpu_resource_destroy(g, res);
     }
@@ -1155,17 +1149,6 @@ static void virtio_gpu_reset(VirtIODevice *vdev)
         g_free(cmd);
     }
 
-#ifdef CONFIG_VIRGL
-    if (g->parent_obj.use_virgl_renderer) {
-        if (g->parent_obj.renderer_blocked) {
-            g->renderer_reset = true;
-        } else {
-            virtio_gpu_virgl_reset(g);
-        }
-        g->parent_obj.use_virgl_renderer = false;
-    }
-#endif
-
     virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
 }
 
-- 
2.30.2


