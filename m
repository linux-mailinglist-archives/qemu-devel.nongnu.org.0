Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1DB3389E0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:20:07 +0100 (CET)
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKetq-0006M2-Ja
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefk-00033X-Ny
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefh-0004ML-Ro
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFlE2Il60LS/G7WTjCexwj1yhou10TIF5HHB94K1prQ=;
 b=RTl4iXS4EmPkLSqqL5i1VMljL9Q/efqKNJG73DCEU93/psIDQdig7fq6ealf01bvqJEvYL
 o3PqxqlohsBp3AulPtZyRLN+fjmUuV0vklwa2kJANnX8KGTCSjvenC/YtqplVBu9egXgKS
 vZsSZE6kmKpCNi6N2k3XgKi5yZijklM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-701fKpVpPoyVWefp4wV0qA-1; Fri, 12 Mar 2021 05:05:26 -0500
X-MC-Unique: 701fKpVpPoyVWefp4wV0qA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2453580006E
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:05:25 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8739610016FD;
 Fri, 12 Mar 2021 10:05:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 22/27] vhost-user-gpu: add vg_send_update()
Date: Fri, 12 Mar 2021 14:01:03 +0400
Message-Id: <20210312100108.2706195-23-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 contrib/vhost-user-gpu/vugpu.h          | 11 ++++
 contrib/vhost-user-gpu/vhost-user-gpu.c | 84 +++++++++++++++++--------
 2 files changed, 68 insertions(+), 27 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 1927fb4f24..370fd10667 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -201,4 +201,15 @@ void    vg_send_cursor_update(VuGpu *g,
 void    vg_send_cursor_pos(VuGpu *g,
                            const struct virtio_gpu_update_cursor *cursor);
 
+typedef void (*VgUpdateFill)(VuGpu *g, VhostUserGpuMsg *msg, void *fill_data);
+
+void    vg_send_update(VuGpu *g,
+                       uint32_t scanout_id,
+                       uint32_t x,
+                       uint32_t y,
+                       uint32_t width,
+                       uint32_t height,
+                       size_t data_size,
+                       VgUpdateFill fill_cb,
+                       void *fill_data);
 #endif
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 4972448dbc..d74ea127d8 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -734,6 +734,61 @@ vg_set_scanout(VuGpu *g,
     }
 }
 
+void
+vg_send_update(VuGpu *g,
+               uint32_t scanout_id,
+               uint32_t x,
+               uint32_t y,
+               uint32_t width,
+               uint32_t height,
+               size_t data_size,
+               VgUpdateFill fill_cb,
+               void *fill_data)
+{
+    void *p = g_malloc(VHOST_USER_GPU_HDR_SIZE +
+                       sizeof(VhostUserGpuUpdate) + data_size);
+    VhostUserGpuMsg *msg = p;
+    msg->request = VHOST_USER_GPU_UPDATE;
+    msg->size = sizeof(VhostUserGpuUpdate) + data_size;
+    msg->payload.update = (VhostUserGpuUpdate) {
+        .scanout_id = scanout_id,
+        .x = x,
+        .y = y,
+        .width = width,
+        .height = height,
+    };
+    fill_cb(g, msg, fill_data);
+    vg_send_msg(g, msg, -1);
+    g_free(msg);
+}
+
+static void
+fill_update_data(VuGpu *g, VhostUserGpuMsg *msg, void *fill_data)
+{
+    struct virtio_gpu_simple_resource *res = fill_data;
+    pixman_image_t *i;
+    size_t bpp;
+    uint32_t x, y, width, height;
+
+    x = msg->payload.update.x;
+    y = msg->payload.update.y;
+    width = msg->payload.update.width;
+    height = msg->payload.update.height;
+
+    bpp = PIXMAN_FORMAT_BPP(pixman_image_get_format(res->image)) / 8;
+    i = pixman_image_create_bits(pixman_image_get_format(res->image),
+                                 width, height,
+                                 (void *)msg + offsetof(VhostUserGpuMsg,
+                                                        payload.update.data),
+                                 width * bpp);
+    pixman_image_composite(PIXMAN_OP_SRC,
+                           res->image, NULL, i,
+                           x, y,
+                           0, 0, 0, 0,
+                           width, height);
+    pixman_image_unref(i);
+}
+
 static void
 vg_resource_flush(VuGpu *g,
                   struct virtio_gpu_ctrl_command *cmd)
@@ -798,33 +853,8 @@ vg_resource_flush(VuGpu *g,
                 PIXMAN_FORMAT_BPP(pixman_image_get_format(res->image)) / 8;
             size_t size = width * height * bpp;
 
-            void *p = g_malloc(VHOST_USER_GPU_HDR_SIZE +
-                               sizeof(VhostUserGpuUpdate) + size);
-            VhostUserGpuMsg *msg = p;
-            msg->request = VHOST_USER_GPU_UPDATE;
-            msg->size = sizeof(VhostUserGpuUpdate) + size;
-            msg->payload.update = (VhostUserGpuUpdate) {
-                .scanout_id = i,
-                .x = extents->x1,
-                .y = extents->y1,
-                .width = width,
-                .height = height,
-            };
-            pixman_image_t *i =
-                pixman_image_create_bits(pixman_image_get_format(res->image),
-                                         msg->payload.update.width,
-                                         msg->payload.update.height,
-                                         p + offsetof(VhostUserGpuMsg,
-                                                      payload.update.data),
-                                         width * bpp);
-            pixman_image_composite(PIXMAN_OP_SRC,
-                                   res->image, NULL, i,
-                                   extents->x1, extents->y1,
-                                   0, 0, 0, 0,
-                                   width, height);
-            pixman_image_unref(i);
-            vg_send_msg(g, msg, -1);
-            g_free(msg);
+            vg_send_update(g, i, extents->x1, extents->y1, width, height,
+                           size, fill_update_data, res);
         }
         pixman_region_fini(&region);
         pixman_region_fini(&finalregion);
-- 
2.29.0


