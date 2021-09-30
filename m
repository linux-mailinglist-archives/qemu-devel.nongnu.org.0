Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534341D18A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 04:40:54 +0200 (CEST)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVm0C-0002Fz-NQ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 22:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVlyU-0000tG-Gc
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVlyT-00079h-0Z
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632969544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WivL5XHoGKIg6uyc+5t+RhLByI9cG4/m2nyr9qGRO/0=;
 b=TOBi0woYCDaAMc++B948wv7AOyDzSlB3wfJAIabatUy/3x5D8e4QSjsiOScIO2XVDDI2UT
 f5GcOBHH0GU1PzvbzuHewW6NqEiMkN3Jcu605n1W3dg+l+ttFBDX5QcXAFj20Ac5TB0d1E
 RpX9ppwgNOCg/bxvY5aRC0+VSM2pNj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-OgL-q7NdPw25D9cc6-e7tQ-1; Wed, 29 Sep 2021 22:39:03 -0400
X-MC-Unique: OgL-q7NdPw25D9cc6-e7tQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B98B1808316;
 Thu, 30 Sep 2021 02:39:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-120.pek2.redhat.com [10.72.12.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C22B10016F4;
 Thu, 30 Sep 2021 02:38:39 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com
Subject: [PATCH v9 07/10] virtio-net: add support for configure interrupt
Date: Thu, 30 Sep 2021 10:33:45 +0800
Message-Id: <20210930023348.17770-8-lulu@redhat.com>
In-Reply-To: <20210930023348.17770-1-lulu@redhat.com>
References: <20210930023348.17770-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for configure interrupt in virtio_net
The functions are config_pending and config_mask

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/vhost_net.c      | 10 ++++++++++
 hw/net/virtio-net.c     |  6 ++++++
 include/net/vhost_net.h |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 10a7780a13..1e78ef8349 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -433,6 +433,16 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
+bool vhost_net_config_pending(VHostNetState *net)
+{
+    return vhost_config_pending(&net->dev);
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
+                              bool mask)
+{
+    vhost_config_mask(&net->dev, dev, mask);
+}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 65b7cabcaf..005818a45a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3155,6 +3155,9 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     if (idx != VIRTIO_CONFIG_IRQ_IDX) {
         return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
     }
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return vhost_net_config_pending(get_vhost_net(nc->peer));
+   }
     return false;
 }
 
@@ -3167,6 +3170,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     if (idx != VIRTIO_CONFIG_IRQ_IDX) {
         vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
     }
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
+     }
 }
 
 static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 172b0051d8..478c127582 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -36,6 +36,9 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
                               int idx, bool mask);
+bool vhost_net_config_pending(VHostNetState *net);
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev,
+                              bool mask);
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
-- 
2.21.3


