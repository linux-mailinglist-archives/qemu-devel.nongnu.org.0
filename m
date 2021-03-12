Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66570338A04
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:24:59 +0100 (CET)
Received: from localhost ([::1]:38204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeyY-00067o-DJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeeh-0001ot-31
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeee-0003hR-ON
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6pxl5yDwflMgqVOKCxk4hLs6wLJ80bog2NQ9POr9wk=;
 b=a14/k9UcZxHioc2ZMJvvgSnGoCvHXwVQM5SrLHCAAxN812eF77hgJCDZm7ZDmhmu3mdjb9
 nP+M6wWNjxY8By5rjSo8ss5G4X7cvD1ot2eKB0SN67NjSr1EA+a1X6VTbu9hIvMzIj5Piy
 9nBhQy1yWeXa14k7UtKnIoDblNJENYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-IkAdlEsKPx6HTOw9Do7Ohw-1; Fri, 12 Mar 2021 05:04:21 -0500
X-MC-Unique: IkAdlEsKPx6HTOw9Do7Ohw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7750F100C619
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:04:20 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C481969E;
 Fri, 12 Mar 2021 10:04:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 17/27] vhost-user-gpu: add vg_send_scanout_dmabuf()
Date: Fri, 12 Mar 2021 14:00:58 +0400
Message-Id: <20210312100108.2706195-18-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h          |  8 ++++
 contrib/vhost-user-gpu/vhost-user-gpu.c | 57 +++++++++++++++++--------
 contrib/vhost-user-gpu/virgl.c          | 23 ++++------
 3 files changed, 56 insertions(+), 32 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index e19abb670d..759de56502 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -180,5 +180,13 @@ bool    vg_recv_msg(VuGpu *g, uint32_t expect_req, uint32_t expect_size,
                     gpointer payload);
 
 void    vg_send_disable_scanout(VuGpu *g, int scanout_id);
+void    vg_send_dmabuf_scanout(VuGpu *g,
+                               const struct virtio_gpu_set_scanout *ss,
+                               uint32_t fd_width,
+                               uint32_t fd_height,
+                               uint32_t fd_stride,
+                               int fd_drm_fourcc,
+                               uint32_t fd_flags,
+                               int fd);
 
 #endif
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 69fedd376b..8c3ee8aad8 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -587,6 +587,38 @@ vg_transfer_to_host_2d(VuGpu *g,
     }
 }
 
+void
+vg_send_dmabuf_scanout(VuGpu *g,
+                       const struct virtio_gpu_set_scanout *ss,
+                       uint32_t fd_width,
+                       uint32_t fd_height,
+                       uint32_t fd_stride,
+                       int fd_drm_fourcc,
+                       uint32_t fd_flags,
+                       int fd)
+{
+    VhostUserGpuMsg msg = {
+        .request = VHOST_USER_GPU_DMABUF_SCANOUT,
+        .size = sizeof(VhostUserGpuDMABUFScanout),
+        .payload.dmabuf_scanout = (VhostUserGpuDMABUFScanout) {
+            .scanout_id = ss->scanout_id,
+            .x = ss->r.x,
+            .y = ss->r.y,
+            .width = ss->r.width,
+            .height = ss->r.height,
+            .fd_width = fd_width,
+            .fd_height = fd_height,
+            .fd_stride = fd_stride,
+            .fd_drm_fourcc = fd_drm_fourcc,
+            .fd_flags = fd_flags,
+        }
+    };
+
+    g_debug("send dmabuf scanout: %d", ss->scanout_id);
+    vg_send_msg(g, &msg, fd);
+}
+
+
 static void
 vg_set_scanout(VuGpu *g,
                struct virtio_gpu_ctrl_command *cmd)
@@ -651,24 +683,15 @@ vg_set_scanout(VuGpu *g,
     struct vugbm_buffer *buffer = &res->buffer;
 
     if (vugbm_buffer_can_get_dmabuf_fd(buffer)) {
-        VhostUserGpuMsg msg = {
-            .request = VHOST_USER_GPU_DMABUF_SCANOUT,
-            .size = sizeof(VhostUserGpuDMABUFScanout),
-            .payload.dmabuf_scanout = (VhostUserGpuDMABUFScanout) {
-                .scanout_id = ss.scanout_id,
-                .x = ss.r.x,
-                .y = ss.r.y,
-                .width = ss.r.width,
-                .height = ss.r.height,
-                .fd_width = buffer->width,
-                .fd_height = buffer->height,
-                .fd_stride = buffer->stride,
-                .fd_drm_fourcc = buffer->format
-            }
-        };
-
         if (vugbm_buffer_get_dmabuf_fd(buffer, &fd)) {
-            vg_send_msg(g, &msg, fd);
+            vg_send_dmabuf_scanout(g,
+                                   &ss,
+                                   buffer->width,
+                                   buffer->height,
+                                   buffer->stride,
+                                   buffer->format,
+                                   0,
+                                   fd);
             close(fd);
         }
     } else {
diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index fe153425f5..0c7f118556 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -337,21 +337,14 @@ virgl_cmd_set_scanout(VuGpu *g,
             return;
         }
         assert(fd >= 0);
-        VhostUserGpuMsg msg = {
-            .request = VHOST_USER_GPU_DMABUF_SCANOUT,
-            .size = sizeof(VhostUserGpuDMABUFScanout),
-            .payload.dmabuf_scanout.scanout_id = ss.scanout_id,
-            .payload.dmabuf_scanout.x =  ss.r.x,
-            .payload.dmabuf_scanout.y =  ss.r.y,
-            .payload.dmabuf_scanout.width = ss.r.width,
-            .payload.dmabuf_scanout.height = ss.r.height,
-            .payload.dmabuf_scanout.fd_width = info.width,
-            .payload.dmabuf_scanout.fd_height = info.height,
-            .payload.dmabuf_scanout.fd_stride = info.stride,
-            .payload.dmabuf_scanout.fd_flags = info.flags,
-            .payload.dmabuf_scanout.fd_drm_fourcc = info.drm_fourcc
-        };
-        vg_send_msg(g, &msg, fd);
+        vg_send_dmabuf_scanout(g,
+                               &ss,
+                               info.width,
+                               info.height,
+                               info.stride,
+                               info.drm_fourcc,
+                               info.flags,
+                               fd);
         close(fd);
     } else {
         vg_send_disable_scanout(g, ss.scanout_id);
-- 
2.29.0


