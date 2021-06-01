Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63782397464
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:34:19 +0200 (CEST)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4XC-0003G5-Bc
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Of-0003gY-Mv
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Od-0007yR-Ah
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r58GvhxLrmY2dDytrFRmBew30BmoSL5RtB2hkWehbGM=;
 b=aSbZET7qaDIWbo8Y9mVU01V+FnGTqp1TBp7mYQ0R54BII0MpmutHzj9q8zllz2ST4L5ZaT
 MhgtesLWiXRlmKSuvRLxMPo5x9Y6nYWEQuOOFUs7fSFIfC2idG0lo3a3+duQ79xZWnk6cM
 lYRiOahJiLkdcOxI3+8NZC4jsTZ6VGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-yv-i0tTEM0Gg5CFbvDz1-g-1; Tue, 01 Jun 2021 09:25:24 -0400
X-MC-Unique: yv-i0tTEM0Gg5CFbvDz1-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F4856D4F4
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:25:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 552905C1C4;
 Tue,  1 Jun 2021 13:25:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D492818007B5; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/13] virtio-gpu: split trace points
Date: Tue,  1 Jun 2021 15:24:12 +0200
Message-Id: <20210601132414.432430-12-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create separate trace points for the simple and virgl
variants of the virtio-gpu device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu-virgl.c | 48 +++++++++++++++++------------------
 hw/display/trace-events       | 30 ++++++++++++++--------
 2 files changed, 43 insertions(+), 35 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 092c6dc380d9..ae48b98382ad 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -28,8 +28,8 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
     struct virgl_renderer_resource_create_args args;
 
     VIRTIO_GPU_FILL_CMD(c2d);
-    trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
-                                       c2d.width, c2d.height);
+    trace_virtio_gpu_gl_cmd_res_create_2d(c2d.resource_id, c2d.format,
+                                          c2d.width, c2d.height);
 
     args.handle = c2d.resource_id;
     args.target = 2;
@@ -52,8 +52,8 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
     struct virgl_renderer_resource_create_args args;
 
     VIRTIO_GPU_FILL_CMD(c3d);
-    trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
-                                       c3d.width, c3d.height, c3d.depth);
+    trace_virtio_gpu_gl_cmd_res_create_3d(c3d.resource_id, c3d.format,
+                                          c3d.width, c3d.height, c3d.depth);
 
     args.handle = c3d.resource_id;
     args.target = c3d.target;
@@ -77,7 +77,7 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
     int num_iovs = 0;
 
     VIRTIO_GPU_FILL_CMD(unref);
-    trace_virtio_gpu_cmd_res_unref(unref.resource_id);
+    trace_virtio_gpu_gl_cmd_res_unref(unref.resource_id);
 
     virgl_renderer_resource_detach_iov(unref.resource_id,
                                        &res_iovs,
@@ -94,8 +94,8 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
     struct virtio_gpu_ctx_create cc;
 
     VIRTIO_GPU_FILL_CMD(cc);
-    trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
-                                    cc.debug_name);
+    trace_virtio_gpu_gl_cmd_ctx_create(cc.hdr.ctx_id,
+                                       cc.debug_name);
 
     virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
                                   cc.debug_name);
@@ -107,7 +107,7 @@ static void virgl_cmd_context_destroy(VirtIOGPU *g,
     struct virtio_gpu_ctx_destroy cd;
 
     VIRTIO_GPU_FILL_CMD(cd);
-    trace_virtio_gpu_cmd_ctx_destroy(cd.hdr.ctx_id);
+    trace_virtio_gpu_gl_cmd_ctx_destroy(cd.hdr.ctx_id);
 
     virgl_renderer_context_destroy(cd.hdr.ctx_id);
 }
@@ -129,8 +129,8 @@ static void virgl_cmd_resource_flush(VirtIOGPU *g,
     int i;
 
     VIRTIO_GPU_FILL_CMD(rf);
-    trace_virtio_gpu_cmd_res_flush(rf.resource_id,
-                                   rf.r.width, rf.r.height, rf.r.x, rf.r.y);
+    trace_virtio_gpu_gl_cmd_res_flush(rf.resource_id,
+                                      rf.r.width, rf.r.height, rf.r.x, rf.r.y);
 
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
         if (g->parent_obj.scanout[i].resource_id != rf.resource_id) {
@@ -148,8 +148,8 @@ static void virgl_cmd_set_scanout(VirtIOGPU *g,
     int ret;
 
     VIRTIO_GPU_FILL_CMD(ss);
-    trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
-                                     ss.r.width, ss.r.height, ss.r.x, ss.r.y);
+    trace_virtio_gpu_gl_cmd_set_scanout(ss.scanout_id, ss.resource_id,
+                                        ss.r.width, ss.r.height, ss.r.x, ss.r.y);
 
     if (ss.scanout_id >= g->parent_obj.conf.max_outputs) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
@@ -194,7 +194,7 @@ static void virgl_cmd_submit_3d(VirtIOGPU *g,
     size_t s;
 
     VIRTIO_GPU_FILL_CMD(cs);
-    trace_virtio_gpu_cmd_ctx_submit(cs.hdr.ctx_id, cs.size);
+    trace_virtio_gpu_gl_cmd_ctx_submit(cs.hdr.ctx_id, cs.size);
 
     buf = g_malloc(cs.size);
     s = iov_to_buf(cmd->elem.out_sg, cmd->elem.out_num,
@@ -224,7 +224,7 @@ static void virgl_cmd_transfer_to_host_2d(VirtIOGPU *g,
     struct virtio_gpu_box box;
 
     VIRTIO_GPU_FILL_CMD(t2d);
-    trace_virtio_gpu_cmd_res_xfer_toh_2d(t2d.resource_id);
+    trace_virtio_gpu_gl_cmd_res_xfer_toh_2d(t2d.resource_id);
 
     box.x = t2d.r.x;
     box.y = t2d.r.y;
@@ -248,7 +248,7 @@ static void virgl_cmd_transfer_to_host_3d(VirtIOGPU *g,
     struct virtio_gpu_transfer_host_3d t3d;
 
     VIRTIO_GPU_FILL_CMD(t3d);
-    trace_virtio_gpu_cmd_res_xfer_toh_3d(t3d.resource_id);
+    trace_virtio_gpu_gl_cmd_res_xfer_toh_3d(t3d.resource_id);
 
     virgl_renderer_transfer_write_iov(t3d.resource_id,
                                       t3d.hdr.ctx_id,
@@ -266,7 +266,7 @@ virgl_cmd_transfer_from_host_3d(VirtIOGPU *g,
     struct virtio_gpu_transfer_host_3d tf3d;
 
     VIRTIO_GPU_FILL_CMD(tf3d);
-    trace_virtio_gpu_cmd_res_xfer_fromh_3d(tf3d.resource_id);
+    trace_virtio_gpu_gl_cmd_res_xfer_fromh_3d(tf3d.resource_id);
 
     virgl_renderer_transfer_read_iov(tf3d.resource_id,
                                      tf3d.hdr.ctx_id,
@@ -287,7 +287,7 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
     int ret;
 
     VIRTIO_GPU_FILL_CMD(att_rb);
-    trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
+    trace_virtio_gpu_gl_cmd_res_back_attach(att_rb.resource_id);
 
     ret = virtio_gpu_create_mapping_iov(g, att_rb.nr_entries, sizeof(att_rb),
                                         cmd, NULL, &res_iovs, &res_niov);
@@ -311,7 +311,7 @@ static void virgl_resource_detach_backing(VirtIOGPU *g,
     int num_iovs = 0;
 
     VIRTIO_GPU_FILL_CMD(detach_rb);
-    trace_virtio_gpu_cmd_res_back_detach(detach_rb.resource_id);
+    trace_virtio_gpu_gl_cmd_res_back_detach(detach_rb.resource_id);
 
     virgl_renderer_resource_detach_iov(detach_rb.resource_id,
                                        &res_iovs,
@@ -329,8 +329,8 @@ static void virgl_cmd_ctx_attach_resource(VirtIOGPU *g,
     struct virtio_gpu_ctx_resource att_res;
 
     VIRTIO_GPU_FILL_CMD(att_res);
-    trace_virtio_gpu_cmd_ctx_res_attach(att_res.hdr.ctx_id,
-                                        att_res.resource_id);
+    trace_virtio_gpu_gl_cmd_ctx_res_attach(att_res.hdr.ctx_id,
+                                           att_res.resource_id);
 
     virgl_renderer_ctx_attach_resource(att_res.hdr.ctx_id, att_res.resource_id);
 }
@@ -341,8 +341,8 @@ static void virgl_cmd_ctx_detach_resource(VirtIOGPU *g,
     struct virtio_gpu_ctx_resource det_res;
 
     VIRTIO_GPU_FILL_CMD(det_res);
-    trace_virtio_gpu_cmd_ctx_res_detach(det_res.hdr.ctx_id,
-                                        det_res.resource_id);
+    trace_virtio_gpu_gl_cmd_ctx_res_detach(det_res.hdr.ctx_id,
+                                           det_res.resource_id);
 
     virgl_renderer_ctx_detach_resource(det_res.hdr.ctx_id, det_res.resource_id);
 }
@@ -483,7 +483,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         return;
     }
 
-    trace_virtio_gpu_fence_ctrl(cmd->cmd_hdr.fence_id, cmd->cmd_hdr.type);
+    trace_virtio_gpu_gl_fence_ctrl(cmd->cmd_hdr.fence_id, cmd->cmd_hdr.type);
     virgl_renderer_create_fence(cmd->cmd_hdr.fence_id, cmd->cmd_hdr.type);
 }
 
@@ -500,7 +500,7 @@ static void virgl_write_fence(void *opaque, uint32_t fence)
         if (cmd->cmd_hdr.fence_id > fence) {
             continue;
         }
-        trace_virtio_gpu_fence_resp(cmd->cmd_hdr.fence_id);
+        trace_virtio_gpu_gl_fence_resp(cmd->cmd_hdr.fence_id);
         virtio_gpu_ctrl_response_nodata(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
         QTAILQ_REMOVE(&g->fenceq, cmd, next);
         g_free(cmd);
diff --git a/hw/display/trace-events b/hw/display/trace-events
index d9606677a436..9c1c972c29c6 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -25,30 +25,38 @@ vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
 # virtio-gpu-base.c
 virtio_gpu_features(bool virgl) "virgl %d"
 
-# virtio-gpu-3d.c
 # virtio-gpu.c
 virtio_gpu_cmd_get_display_info(void) ""
 virtio_gpu_cmd_get_edid(uint32_t scanout) "scanout %d"
 virtio_gpu_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
 virtio_gpu_cmd_set_scanout_blob(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
 virtio_gpu_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
-virtio_gpu_cmd_res_create_3d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h, uint32_t d) "res 0x%x, fmt 0x%x, w %d, h %d, d %d"
 virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" PRId64
 virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
-virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
-virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_flush(uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "res 0x%x, w %d, h %d, x %d, y %d"
-virtio_gpu_cmd_ctx_create(uint32_t ctx, const char *name) "ctx 0x%x, name %s"
-virtio_gpu_cmd_ctx_destroy(uint32_t ctx) "ctx 0x%x"
-virtio_gpu_cmd_ctx_res_attach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
-virtio_gpu_cmd_ctx_res_detach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
-virtio_gpu_cmd_ctx_submit(uint32_t ctx, uint32_t size) "ctx 0x%x, size %d"
 virtio_gpu_update_cursor(uint32_t scanout, uint32_t x, uint32_t y, const char *type, uint32_t res) "scanout %d, x %d, y %d, %s, res 0x%x"
-virtio_gpu_fence_ctrl(uint64_t fence, uint32_t type) "fence 0x%" PRIx64 ", type 0x%x"
-virtio_gpu_fence_resp(uint64_t fence) "fence 0x%" PRIx64
+
+# virtio-gpu-virgl.c
+virtio_gpu_gl_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_gl_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
+virtio_gpu_gl_cmd_res_create_3d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h, uint32_t d) "res 0x%x, fmt 0x%x, w %d, h %d, d %d"
+virtio_gpu_gl_cmd_res_unref(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_back_attach(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_back_detach(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
+virtio_gpu_gl_cmd_res_flush(uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_gl_cmd_ctx_create(uint32_t ctx, const char *name) "ctx 0x%x, name %s"
+virtio_gpu_gl_cmd_ctx_destroy(uint32_t ctx) "ctx 0x%x"
+virtio_gpu_gl_cmd_ctx_res_attach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
+virtio_gpu_gl_cmd_ctx_res_detach(uint32_t ctx, uint32_t res) "ctx 0x%x, res 0x%x"
+virtio_gpu_gl_cmd_ctx_submit(uint32_t ctx, uint32_t size) "ctx 0x%x, size %d"
+virtio_gpu_gl_fence_ctrl(uint64_t fence, uint32_t type) "fence 0x%" PRIx64 ", type 0x%x"
+virtio_gpu_gl_fence_resp(uint64_t fence) "fence 0x%" PRIx64
 
 # vga.c
 vga_std_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
-- 
2.31.1


