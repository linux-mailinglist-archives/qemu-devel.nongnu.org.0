Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B734A798
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:55:11 +0100 (CET)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPlza-0002TJ-Mp
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluy-0005bK-O6
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluv-0003yQ-3E
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616763020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkQRFLotr81hYYBmwJM99a9KYbhdYBfCrWnmjeTnUPk=;
 b=bp4e6Z7xJIUSm5X/iEyDsvLLth0JIAR0scSiK9B9FD8XgyHLj5JWlsK8HerUpaQZLasye8
 gsdEtNxte93quL8UdGIDkZOEY0/y8uDv3neIkGTr1sTHUJ6mG2bXMR/ZOH6UnMNVlVLRye
 qVLIFp5tcxFIVSFpFl1E+uaO9Cr1FKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-QArfoZeOPZSW44nLS6bjFQ-1; Fri, 26 Mar 2021 08:50:18 -0400
X-MC-Unique: QArfoZeOPZSW44nLS6bjFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40360189CD03;
 Fri, 26 Mar 2021 12:50:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B84FC5C8AB;
 Fri, 26 Mar 2021 12:50:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D5A9F180038A; Fri, 26 Mar 2021 13:49:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] vhost-user-gpu: fix cursor move/update
Date: Fri, 26 Mar 2021 13:49:27 +0100
Message-Id: <20210326124932.481942-5-kraxel@redhat.com>
In-Reply-To: <20210326124932.481942-1-kraxel@redhat.com>
References: <20210326124932.481942-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

"move" is incorrectly initialized.

Fix it by using a switch statement and also treating unknown commands
with a fallback.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210312100108.2706195-5-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index ef40fbccbbd9..f73f292c9f72 100644
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
2.30.2


