Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB61338A1C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:29:48 +0100 (CET)
Received: from localhost ([::1]:54484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKf3D-0005SM-Ry
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefJ-0002Pl-BX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefH-000470-H6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJIXxnKvWoutgHnZL1y3kNVVV/NbgaNgiGk58iEOQgU=;
 b=Nr9umOeAQRr+7zkJOc9xzkoXczCDMZwBbsVUlzVdbT07wHmkmqGfcozzlO/cZS684C80Xd
 T5u5XjEmEuEOhMY5D3FqD/5g0JzWUqBO37w+dl1NqDhT6ltZ7ktCli2hcYwlJYUkHcu0Zs
 sY58Hg2Ro3NAAvBIj35zAHtNExxSWTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-QrX3NiLRP_CfZ-NKSsObbg-1; Fri, 12 Mar 2021 05:05:00 -0500
X-MC-Unique: QrX3NiLRP_CfZ-NKSsObbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D5919200C0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:04:57 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9546D5C1C5;
 Fri, 12 Mar 2021 10:04:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 20/27] vhost-user-gpu: add vg_send_cursor_update()
Date: Fri, 12 Mar 2021 14:01:01 +0400
Message-Id: <20210312100108.2706195-21-marcandre.lureau@redhat.com>
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
 contrib/vhost-user-gpu/vugpu.h          |  4 ++-
 contrib/vhost-user-gpu/vhost-user-gpu.c | 46 +++++++++++++++----------
 2 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index bf513e9295..02a22bae34 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -195,5 +195,7 @@ void    vg_send_dmabuf_update(VuGpu *g,
                               uint32_t width,
                               uint32_t height);
 void    vg_send_scanout(VuGpu *g, uint32_t scanout_id);
-
+void    vg_send_cursor_update(VuGpu *g,
+                              const struct virtio_gpu_update_cursor *cursor,
+                              const void *data);
 #endif
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index a11f406350..32bcbaa9a1 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -935,6 +935,30 @@ update_cursor_data_simple(VuGpu *g, uint32_t resource_id, gpointer data)
     memcpy(data, pixman_image_get_data(res->image), 64 * 64 * sizeof(uint32_t));
 }
 
+void
+vg_send_cursor_update(VuGpu *g,
+                      const struct virtio_gpu_update_cursor *cursor,
+                      const void *data)
+{
+    VhostUserGpuMsg msg = {
+        .request = VHOST_USER_GPU_CURSOR_UPDATE,
+        .size = sizeof(VhostUserGpuCursorUpdate),
+        .payload.cursor_update = {
+            .pos = {
+                .scanout_id = cursor->pos.scanout_id,
+                .x = cursor->pos.x,
+                .y = cursor->pos.y,
+            },
+            .hot_x = cursor->hot_x,
+            .hot_y = cursor->hot_y,
+        }
+    };
+    /* we can afford that cursor copy */
+    memcpy(msg.payload.cursor_update.data, data,
+           sizeof(msg.payload.cursor_update.data));
+    vg_send_msg(g, &msg, -1);
+}
+
 static void
 vg_process_cursor_cmd(VuGpu *g, struct virtio_gpu_update_cursor *cursor)
 {
@@ -955,28 +979,14 @@ vg_process_cursor_cmd(VuGpu *g, struct virtio_gpu_update_cursor *cursor)
         break;
     }
     case VIRTIO_GPU_CMD_UPDATE_CURSOR: {
-        VhostUserGpuMsg msg = {
-            .request = VHOST_USER_GPU_CURSOR_UPDATE,
-            .size = sizeof(VhostUserGpuCursorUpdate),
-            .payload.cursor_update = {
-                .pos = {
-                    .scanout_id = cursor->pos.scanout_id,
-                    .x = cursor->pos.x,
-                    .y = cursor->pos.y,
-                },
-                .hot_x = cursor->hot_x,
-                .hot_y = cursor->hot_y,
-            }
-        };
+        uint32_t data[64 * 64] = { 0, };
         g_debug("%s: update", G_STRFUNC);
         if (g->virgl) {
-            vg_virgl_update_cursor_data(g, cursor->resource_id,
-                                        msg.payload.cursor_update.data);
+            vg_virgl_update_cursor_data(g, cursor->resource_id, data);
         } else {
-            update_cursor_data_simple(g, cursor->resource_id,
-                                      msg.payload.cursor_update.data);
+            update_cursor_data_simple(g, cursor->resource_id, data);
         }
-        vg_send_msg(g, &msg, -1);
+        vg_send_cursor_update(g, cursor, data);
         break;
     }
     default:
-- 
2.29.0


