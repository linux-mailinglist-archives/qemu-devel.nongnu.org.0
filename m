Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8C57A01F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:53:43 +0200 (CEST)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnfS-0008Ko-ML
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDnZh-00064m-Ss
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDnZf-0001kQ-ME
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658238463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dWUiqrA8+8WzjUJe28tDqiNlABUFyFOqt552HIu4fHQ=;
 b=HCS1uKnzlcyOEei/gG9ZNMy4SA1IvX93L/yAH4biKI4Ggvr7H1ia+fXRCBhyyuLByUQWZX
 yPE3T03ORlxR2D+C70Vwt+hcNZzHrN3yAAy1uw2zQS9vufmqrwOYIg+vvh4lDpTHreFEFS
 qOYeBOWwKtr07uotIy2fX5x5EGuQ5GE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-T6JcKvGVM6ize8F9t8mDwQ-1; Tue, 19 Jul 2022 09:47:40 -0400
X-MC-Unique: T6JcKvGVM6ize8F9t8mDwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC9191035343;
 Tue, 19 Jul 2022 13:47:39 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FCB490A04;
 Tue, 19 Jul 2022 13:47:35 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v12 08/10] virtio-net: add support for configure interrupt
Date: Tue, 19 Jul 2022 21:46:53 +0800
Message-Id: <20220719134655.522538-9-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


