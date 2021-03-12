Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66816338998
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:05:41 +0100 (CET)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKefs-0001z1-DM
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKecE-0006rA-SE
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKec8-0002MA-IV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7TfOlwtk+oXkEHe++07r6GbU+hgq4A9HJpOV3lez7c=;
 b=epLedIfmJDy7cwz89hLqG5+NVhETxfq7Cqo/kUuB09Okyy81F+TMsclkMzInaSkaWf9ykz
 ObPUp5NlqK6mXImnXb6EbPE3Ari+BBqVgtutV92lJKRKCSiZMb5RzhTmBIdnBzx2HTYxsK
 MgmyJoC61kuKhdDOHV3OM+5HmBboXXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-gIMxVuK-MG2A-3edA6wfWg-1; Fri, 12 Mar 2021 05:01:45 -0500
X-MC-Unique: gIMxVuK-MG2A-3edA6wfWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7741183DD23
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:01:44 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18DA61969E;
 Fri, 12 Mar 2021 10:01:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 04/27] vhost-user-gpu: fix cursor move/update
Date: Fri, 12 Mar 2021 14:00:45 +0400
Message-Id: <20210312100108.2706195-5-marcandre.lureau@redhat.com>
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

"move" is incorrectly initialized.

Fix it by using a switch statement and also treating unknown commands
with a fallback.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index ef40fbccbb..f73f292c9f 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -892,11 +892,8 @@ update_cursor_data_simple(VuGpu *g, uint32_t resource_id, gpointer data)
 static void
 vg_process_cursor_cmd(VuGpu *g, struct virtio_gpu_update_cursor *cursor)
 {
-    bool move = cursor->hdr.type != VIRTIO_GPU_CMD_MOVE_CURSOR;
-
-    g_debug("%s move:%d\n", G_STRFUNC, move);
-
-    if (move) {
+    switch (cursor->hdr.type) {
+    case VIRTIO_GPU_CMD_MOVE_CURSOR: {
         VhostUserGpuMsg msg = {
             .request = cursor->resource_id ?
                 VHOST_USER_GPU_CURSOR_POS : VHOST_USER_GPU_CURSOR_POS_HIDE,
@@ -907,8 +904,11 @@ vg_process_cursor_cmd(VuGpu *g, struct virtio_gpu_update_cursor *cursor)
                 .y = cursor->pos.y,
             }
         };
+        g_debug("%s: move", G_STRFUNC);
         vg_send_msg(g, &msg, -1);
-    } else {
+        break;
+    }
+    case VIRTIO_GPU_CMD_UPDATE_CURSOR: {
         VhostUserGpuMsg msg = {
             .request = VHOST_USER_GPU_CURSOR_UPDATE,
             .size = sizeof(VhostUserGpuCursorUpdate),
@@ -922,6 +922,7 @@ vg_process_cursor_cmd(VuGpu *g, struct virtio_gpu_update_cursor *cursor)
                 .hot_y = cursor->hot_y,
             }
         };
+        g_debug("%s: update", G_STRFUNC);
         if (g->virgl) {
             vg_virgl_update_cursor_data(g, cursor->resource_id,
                                         msg.payload.cursor_update.data);
@@ -930,6 +931,11 @@ vg_process_cursor_cmd(VuGpu *g, struct virtio_gpu_update_cursor *cursor)
                                       msg.payload.cursor_update.data);
         }
         vg_send_msg(g, &msg, -1);
+        break;
+    }
+    default:
+        g_debug("%s: unknown cmd %d", G_STRFUNC, cursor->hdr.type);
+        break;
     }
 }
 
-- 
2.29.0


