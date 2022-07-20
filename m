Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B388557B767
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:27:13 +0200 (CEST)
Received: from localhost ([::1]:34596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9jM-0003Ty-Pg
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9VU-0006ah-Pm
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oE9VT-0006uR-3P
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658322770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dWUiqrA8+8WzjUJe28tDqiNlABUFyFOqt552HIu4fHQ=;
 b=BV6sGPWB1sMcPujPuUDk2rav3Auu1ZhgJVBnW2FqLWO6nBp5uiWDkgSErPWpULmZJV0xP/
 PMrAfh+d0dOfkVV352GaK4gV7jwC7UtecGGJvr/vF9M6Q+vxmyj73HfB65/j7gYbqPosh4
 iUBh1JrrKCSrvN54cZT4o+pZYa0hG80=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-57JNpiVoN36LLC7QPRrt1w-1; Wed, 20 Jul 2022 09:12:49 -0400
X-MC-Unique: 57JNpiVoN36LLC7QPRrt1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31BE71C16B48;
 Wed, 20 Jul 2022 13:12:49 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8369EC28100;
 Wed, 20 Jul 2022 13:12:44 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v13 08/10] virtio-net: add support for configure interrupt
Date: Wed, 20 Jul 2022 21:12:02 +0800
Message-Id: <20220720131204.591104-9-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add functions to support configure interrupt in virtio_net
Add the functions to support vhost_net_config_pending
and vhost_net_config_mask.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/vhost_net.c      | 9 +++++++++
 hw/net/virtio-net.c     | 4 ++--
 include/net/vhost_net.h | 2 ++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2ca4..9c9fd0a73f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -457,6 +457,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
+bool vhost_net_config_pending(VHostNetState *net)
+{
+    return vhost_config_pending(&net->dev);
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
+{
+    vhost_config_mask(&net->dev, dev, mask);
+}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a566936e5c..b6e5efed61 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3178,7 +3178,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
      * support, the function will return false */
 
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
+        return vhost_net_config_pending(get_vhost_net(nc->peer));
     }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
@@ -3195,9 +3195,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
      * support, the function will return */
 
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
         return;
     }
-
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913e4e..fc37498550 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -39,6 +39,8 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
                               int idx, bool mask);
+bool vhost_net_config_pending(VHostNetState *net);
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask);
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
-- 
2.34.3


