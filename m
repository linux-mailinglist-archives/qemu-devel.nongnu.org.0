Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD21C690ECA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 18:02:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQAHo-0006Tc-OM; Thu, 09 Feb 2023 12:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pQAHR-0006E7-Eb
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:00:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pQAHP-00048W-Lm
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675962014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t4BHCHdT1w0EG7MYuWUG8TmXFQlCJLQm4PToxYUOF3Y=;
 b=LeikSnlUAxl54EYUD8ZlUSjnJkYX0rvQTmYHAdGnCQay27sOpjAqmKI4ANomgDJ1AAympY
 VTrMJPHm2VEzcdjXYcsdH7iopfov/APkUwEIvZRgBbrzqIsX5aEYN4EX4lhWUNXNqbrb/C
 x1Xyod0uGEU3Aptzkwgh5D37buW4PWI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-1iPmsG_7OcypTX01ETFKhw-1; Thu, 09 Feb 2023 12:00:11 -0500
X-MC-Unique: 1iPmsG_7OcypTX01ETFKhw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 447F138173F1;
 Thu,  9 Feb 2023 17:00:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCEC7492C3E;
 Thu,  9 Feb 2023 17:00:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] vdpa: stop all svq on device deletion
Date: Thu,  9 Feb 2023 18:00:04 +0100
Message-Id: <20230209170004.899472-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Not stopping them leave the device in a bad state when virtio-net
fronted device is unplugged with device_del monitor command.

This is not triggable in regular poweroff or qemu forces shutdown
because cleanup is called right after vhost_vdpa_dev_start(false).  But
devices hot unplug does not call vdpa device cleanups.  This lead to all
the vhost_vdpa devices without stop the SVQ but the last.

Fix it and clean the code, making it symmetric with
vhost_vdpa_svqs_start.

Fixes: dff4426fa656 ("vhost: Add Shadow VirtQueue kick forwarding capabilities")
Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 542e003101..df3a1e92ac 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -689,26 +689,11 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
     return ret;
 }
 
-static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
-{
-    if (!v->shadow_vqs_enabled) {
-        return;
-    }
-
-    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
-        vhost_svq_stop(svq);
-    }
-}
-
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
-    struct vhost_vdpa *v = dev->opaque;
     int ret;
     uint8_t status = 0;
 
-    vhost_vdpa_reset_svq(v);
-
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
     return ret;
@@ -1100,6 +1085,8 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 
     for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+
+        vhost_svq_stop(svq);
         vhost_vdpa_svq_unmap_rings(dev, svq);
 
         event_notifier_cleanup(&svq->hdev_kick);
-- 
2.31.1


