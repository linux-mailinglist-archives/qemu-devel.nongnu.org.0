Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CF940D304
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 08:02:41 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQkTn-0007Ap-OR
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 02:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkOI-0000KG-BT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQkOG-0006u9-CQ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631771815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iERbLX8xJgi0BGmT9csPAQdSLsfYFV4nk8p/QhN+7CI=;
 b=EESkpWkvQPq27UqK8F/qAdOntfFRX0BOMyIxVVtR/quHpt2FuPuKmleDebH0Kn8IMYG2tC
 iT88Pi9D0BPsdo1Yf/lq1eizAWSseN7jFiYl11M07HRhuc9VMrDE40t7+ZGoZOClVAK4xt
 Y0AIO97N6l19PdexncD4S/r/tdjCUj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-l2MN6vl7O3u2K5OmFXHY4g-1; Thu, 16 Sep 2021 01:56:54 -0400
X-MC-Unique: l2MN6vl7O3u2K5OmFXHY4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112D08145E5;
 Thu, 16 Sep 2021 05:56:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAB6D60C2B;
 Thu, 16 Sep 2021 05:56:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C325180093B; Thu, 16 Sep 2021 07:56:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] virtio-gpu: Add gl_flushed callback
Date: Thu, 16 Sep 2021 07:56:23 +0200
Message-Id: <20210916055623.1846418-7-kraxel@redhat.com>
In-Reply-To: <20210916055623.1846418-1-kraxel@redhat.com>
References: <20210916055623.1846418-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

Adding this callback provides a way to resume the processing of
cmds in fenceq and cmdq that were not processed because the UI
was waiting on a fence and blocked cmd processing.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210914211837.3229977-6-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 72da5bf5002c..182e0868b09d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -985,8 +985,10 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
         break;
     }
     if (!cmd->finished) {
-        virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->error :
-                                        VIRTIO_GPU_RESP_OK_NODATA);
+        if (!g->parent_obj.renderer_blocked) {
+            virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->error :
+                                            VIRTIO_GPU_RESP_OK_NODATA);
+        }
     }
 }
 
@@ -1042,6 +1044,30 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
     g->processing_cmdq = false;
 }
 
+static void virtio_gpu_process_fenceq(VirtIOGPU *g)
+{
+    struct virtio_gpu_ctrl_command *cmd, *tmp;
+
+    QTAILQ_FOREACH_SAFE(cmd, &g->fenceq, next, tmp) {
+        trace_virtio_gpu_fence_resp(cmd->cmd_hdr.fence_id);
+        virtio_gpu_ctrl_response_nodata(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
+        QTAILQ_REMOVE(&g->fenceq, cmd, next);
+        g_free(cmd);
+        g->inflight--;
+        if (virtio_gpu_stats_enabled(g->parent_obj.conf)) {
+            fprintf(stderr, "inflight: %3d (-)\r", g->inflight);
+        }
+    }
+}
+
+static void virtio_gpu_handle_gl_flushed(VirtIOGPUBase *b)
+{
+    VirtIOGPU *g = container_of(b, VirtIOGPU, parent_obj);
+
+    virtio_gpu_process_fenceq(g);
+    virtio_gpu_process_cmdq(g);
+}
+
 static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1400,10 +1426,12 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
+    VirtIOGPUBaseClass *vgbc = &vgc->parent;
 
     vgc->handle_ctrl = virtio_gpu_handle_ctrl;
     vgc->process_cmd = virtio_gpu_simple_process_cmd;
     vgc->update_cursor_data = virtio_gpu_update_cursor_data;
+    vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
-- 
2.31.1


