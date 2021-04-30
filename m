Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D464E36FA21
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:28:39 +0200 (CEST)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSG6-0006R3-Ta
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRj-0000gO-7b
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRf-0001VB-FF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byEmvQrMpP/CdT9jGgCkT76amTfNmYOr0AitR0MffkY=;
 b=Ox7mOQ+q3pK0gzsk4XigvSePRjI14MJq6KnpQ/X9EY+E/te13NqHI1GRhOE76M0h6ew/+C
 YzyJnbqiPIHMOneLqbdQHWA8qUB3CyLlhxy6e4AcLmPLcqIN2fvSZ8ieGzumajWI88AQe3
 EQEOW+rnVpAi2YFhcU2uZfgZb4KY8Js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-aTs2OTMFMZKolHLDTCLLkg-1; Fri, 30 Apr 2021 07:36:29 -0400
X-MC-Unique: aTs2OTMFMZKolHLDTCLLkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 091E81922964;
 Fri, 30 Apr 2021 11:36:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EDCB5D719;
 Fri, 30 Apr 2021 11:36:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 78D8E1800792; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/16] virtio-gpu: move virgl gl_flushed
Date: Fri, 30 Apr 2021 13:35:38 +0200
Message-Id: <20210430113547.1816178-8-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
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
 hw/display/virtio-gpu-gl.c | 13 +++++++++++++
 hw/display/virtio-gpu.c    | 15 ---------------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 6d0ce5bcd6f1..e976fb8d04c4 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -23,6 +23,17 @@
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
+{
+    VirtIOGPU *g = VIRTIO_GPU(b);
+
+    if (g->renderer_reset) {
+        g->renderer_reset = false;
+        virtio_gpu_virgl_reset(g);
+    }
+    virtio_gpu_process_cmdq(g);
+}
+
 static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -100,8 +111,10 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+    VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
 
+    vbc->gl_flushed = virtio_gpu_gl_flushed;
     vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
 
     vdc->realize = virtio_gpu_gl_device_realize;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5901e09bcd81..ae80519c7356 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -843,19 +843,6 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
     g->processing_cmdq = false;
 }
 
-static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
-{
-    VirtIOGPU *g = VIRTIO_GPU(b);
-
-#ifdef CONFIG_VIRGL
-    if (g->renderer_reset) {
-        g->renderer_reset = false;
-        virtio_gpu_virgl_reset(g);
-    }
-#endif
-    virtio_gpu_process_cmdq(g);
-}
-
 static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1199,10 +1186,8 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
-    VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
 
-    vbc->gl_flushed = virtio_gpu_gl_flushed;
     vgc->handle_ctrl = virtio_gpu_handle_ctrl;
 
     vdc->realize = virtio_gpu_device_realize;
-- 
2.30.2


