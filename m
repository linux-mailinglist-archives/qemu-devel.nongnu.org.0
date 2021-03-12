Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914EE3389C1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:13:00 +0100 (CET)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKemx-00057t-HN
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKees-0001y6-JU
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeeq-0003pI-Qm
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29uN9b+TR+Ruixt9pZtraK6VYZFptSAxO2ZoujOTlps=;
 b=YNaeS1apmZVlOrFfPERBBP3QfBvkY570DQVDd7jprqEGotHyP2HwDYtkLtykzgcqrCChWc
 o9cay8D9gPURyXXo4qSAQbmSGi+BAD8PQF5c42n7b/OdNRGlSD6dpDQPm6zsGwuaFt4mma
 0KJLYmfQq8QLl7OQ4Cla2oAg1XECO+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271--sNotPwCOPmCavaSvDuFMw-1; Fri, 12 Mar 2021 05:04:34 -0500
X-MC-Unique: -sNotPwCOPmCavaSvDuFMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B08319200C0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:04:33 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E8DF5C1C5;
 Fri, 12 Mar 2021 10:04:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 18/27] vhost-user-gpu: add vg_send_dmabuf_update()
Date: Fri, 12 Mar 2021 14:00:59 +0400
Message-Id: <20210312100108.2706195-19-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 contrib/vhost-user-gpu/vugpu.h          |  6 +++++
 contrib/vhost-user-gpu/vhost-user-gpu.c | 32 +++++++++++++++----------
 contrib/vhost-user-gpu/virgl.c          | 11 +--------
 3 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 759de56502..f2e80d255d 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -188,5 +188,11 @@ void    vg_send_dmabuf_scanout(VuGpu *g,
                                int fd_drm_fourcc,
                                uint32_t fd_flags,
                                int fd);
+void    vg_send_dmabuf_update(VuGpu *g,
+                              uint32_t scanout_id,
+                              uint32_t x,
+                              uint32_t y,
+                              uint32_t width,
+                              uint32_t height);
 
 #endif
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 8c3ee8aad8..fc8e62f20e 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -618,6 +618,25 @@ vg_send_dmabuf_scanout(VuGpu *g,
     vg_send_msg(g, &msg, fd);
 }
 
+void
+vg_send_dmabuf_update(VuGpu *g,
+                      uint32_t scanout_id,
+                      uint32_t x,
+                      uint32_t y,
+                      uint32_t width,
+                      uint32_t height)
+{
+    VhostUserGpuMsg msg = {
+        .request = VHOST_USER_GPU_DMABUF_UPDATE,
+        .size = sizeof(VhostUserGpuUpdate),
+        .payload.update.scanout_id = scanout_id,
+        .payload.update.x = x,
+        .payload.update.y = y,
+        .payload.update.width = width,
+        .payload.update.height = height
+    };
+    vg_send_msg(g, &msg, -1);
+}
 
 static void
 vg_set_scanout(VuGpu *g,
@@ -765,18 +784,7 @@ vg_resource_flush(VuGpu *g,
         size_t height = extents->y2 - extents->y1;
 
         if (vugbm_buffer_can_get_dmabuf_fd(&res->buffer)) {
-            VhostUserGpuMsg vmsg = {
-                .request = VHOST_USER_GPU_DMABUF_UPDATE,
-                .size = sizeof(VhostUserGpuUpdate),
-                .payload.update = (VhostUserGpuUpdate) {
-                    .scanout_id = i,
-                    .x = extents->x1,
-                    .y = extents->y1,
-                    .width = width,
-                    .height = height,
-                }
-            };
-            vg_send_msg(g, &vmsg, -1);
+            vg_send_dmabuf_update(g, i, extents->x1, extents->y1, width, height);
             vg_wait_ok(g);
         } else {
             size_t bpp =
diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 0c7f118556..b17cf22986 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -370,16 +370,7 @@ virgl_cmd_resource_flush(VuGpu *g,
         if (g->scanout[i].resource_id != rf.resource_id) {
             continue;
         }
-        VhostUserGpuMsg msg = {
-            .request = VHOST_USER_GPU_DMABUF_UPDATE,
-            .size = sizeof(VhostUserGpuUpdate),
-            .payload.update.scanout_id = i,
-            .payload.update.x = rf.r.x,
-            .payload.update.y = rf.r.y,
-            .payload.update.width = rf.r.width,
-            .payload.update.height = rf.r.height
-        };
-        vg_send_msg(g, &msg, -1);
+        vg_send_dmabuf_update(g, i, rf.r.x, rf.r.y, rf.r.width, rf.r.height);
         vg_wait_ok(g);
     }
 }
-- 
2.29.0


