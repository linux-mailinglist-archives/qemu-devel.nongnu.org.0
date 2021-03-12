Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1BB3389D6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:18:03 +0100 (CET)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKerq-0003Ro-SQ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefX-0002rC-Mz
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKefU-0004Ed-Eg
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXEZqmWWPXX4nkjljdJFPSS++pDg79FX4p5JF5FGaL0=;
 b=hjkPgm5I34kF3dxI2DIErrMt6Han4H+0lbVhWMcNGprlvSbsZDnXMMq5tF+Zk/HYA+JNop
 gGPviSoLmAfCH8iMGCD8U9BRYJKGrCoJAkmQGsyxfepHHJXVYIEkNCQQ9vuPp7je58yeM2
 v0PCTCjeId9wqPrAM+nZl7cCNdgITx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-_DL60FNiM8WUtKri1w6Pvg-1; Fri, 12 Mar 2021 05:05:14 -0500
X-MC-Unique: _DL60FNiM8WUtKri1w6Pvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09DE781746B
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:05:13 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6A041F065;
 Fri, 12 Mar 2021 10:05:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 21/27] vhost-user-gpu: add vg_send_cursor_pos()
Date: Fri, 12 Mar 2021 14:01:02 +0400
Message-Id: <20210312100108.2706195-22-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 contrib/vhost-user-gpu/vugpu.h          |  3 +++
 contrib/vhost-user-gpu/vhost-user-gpu.c | 28 +++++++++++++++----------
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 02a22bae34..1927fb4f24 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -198,4 +198,7 @@ void    vg_send_scanout(VuGpu *g, uint32_t scanout_id);
 void    vg_send_cursor_update(VuGpu *g,
                               const struct virtio_gpu_update_cursor *cursor,
                               const void *data);
+void    vg_send_cursor_pos(VuGpu *g,
+                           const struct virtio_gpu_update_cursor *cursor);
+
 #endif
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 32bcbaa9a1..4972448dbc 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -959,23 +959,29 @@ vg_send_cursor_update(VuGpu *g,
     vg_send_msg(g, &msg, -1);
 }
 
+void
+vg_send_cursor_pos(VuGpu *g, const struct virtio_gpu_update_cursor *cursor)
+{
+    VhostUserGpuMsg msg = {
+        .request = cursor->resource_id ?
+        VHOST_USER_GPU_CURSOR_POS : VHOST_USER_GPU_CURSOR_POS_HIDE,
+        .size = sizeof(VhostUserGpuCursorPos),
+        .payload.cursor_pos = {
+            .scanout_id = cursor->pos.scanout_id,
+            .x = cursor->pos.x,
+            .y = cursor->pos.y,
+        }
+    };
+    vg_send_msg(g, &msg, -1);
+}
+
 static void
 vg_process_cursor_cmd(VuGpu *g, struct virtio_gpu_update_cursor *cursor)
 {
     switch (cursor->hdr.type) {
     case VIRTIO_GPU_CMD_MOVE_CURSOR: {
-        VhostUserGpuMsg msg = {
-            .request = cursor->resource_id ?
-                VHOST_USER_GPU_CURSOR_POS : VHOST_USER_GPU_CURSOR_POS_HIDE,
-            .size = sizeof(VhostUserGpuCursorPos),
-            .payload.cursor_pos = {
-                .scanout_id = cursor->pos.scanout_id,
-                .x = cursor->pos.x,
-                .y = cursor->pos.y,
-            }
-        };
         g_debug("%s: move", G_STRFUNC);
-        vg_send_msg(g, &msg, -1);
+        vg_send_cursor_pos(g, cursor);
         break;
     }
     case VIRTIO_GPU_CMD_UPDATE_CURSOR: {
-- 
2.29.0


