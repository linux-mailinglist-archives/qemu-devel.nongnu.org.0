Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938A1B63F8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 20:46:51 +0200 (CEST)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRgs6-0002IY-Dp
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 14:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dimastep@yandex-team.ru>) id 1jRgmJ-0001WE-V7
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 14:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dimastep@yandex-team.ru>) id 1jRgmI-0004g3-Fm
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 14:40:51 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:39752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1jRgmD-0004YU-RO; Thu, 23 Apr 2020 14:40:47 -0400
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id ACA512E14E5;
 Thu, 23 Apr 2020 21:40:42 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 pcbgbebQ4k-efJusTgp; Thu, 23 Apr 2020 21:40:42 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1587667242; bh=5FKUZYsWXSmWGJbzPGJ+rs4aPqD/ORGDojQy3boMTtI=;
 h=In-Reply-To:In-Reply-To:Message-Id:References:References:Date:
 Subject:To:From:Cc;
 b=rMobuxyHc5x4g6A2pejKni5IaV8SRrbf+O1fcjyDAZhhN4mT+0BG5n42RjHD/JB6O
 juaZ878nkfrXoMoLW7Ov+8gpAkyd1AyVlc/gdysTZtrZWE8e51cBlTNRe0lLcowl7N
 /KTorukp4wIxxpVLM8CqAqYt2W+D5i1zZ2/Wwp4w=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1313::1:e])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7hClKENKMK-eeXeQske; Thu, 23 Apr 2020 21:40:40 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 6/7] vhost: check vring address before calling unmap
Date: Thu, 23 Apr 2020 21:39:37 +0300
Message-Id: <696f43b4883f0ce1d3695458653da885f7693692.1587667007.git.dimastep@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1587667007.git.dimastep@yandex-team.ru>
References: <cover.1587667007.git.dimastep@yandex-team.ru>
In-Reply-To: <cover.1587667007.git.dimastep@yandex-team.ru>
References: <cover.1587667007.git.dimastep@yandex-team.ru>
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a02:6b8:0:1619::183
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, yc-core@yandex-team.ru,
 qemu-block@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, mreitz@redhat.com, arei.gonglei@huawei.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since disconnect can happen at any time during initialization not all
vring buffers (for instance used vring) can be intialized successfully.
If the buffer was not initialized then vhost_memory_unmap call will lead
to SIGSEGV. Add checks for the vring address value before calling unmap.
Also add assert() in the vhost_memory_unmap() routine.

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
---
 hw/virtio/vhost.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index ddbdc53..3ee50c4 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -314,6 +314,8 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
                                hwaddr len, int is_write,
                                hwaddr access_len)
 {
+    assert(buffer);
+
     if (!vhost_dev_has_iommu(dev)) {
         cpu_physical_memory_unmap(buffer, len, is_write, access_len);
     }
@@ -1132,12 +1134,25 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
                                                 vhost_vq_index);
     }
 
-    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
-                       1, virtio_queue_get_used_size(vdev, idx));
-    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
-                       0, virtio_queue_get_avail_size(vdev, idx));
-    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
-                       0, virtio_queue_get_desc_size(vdev, idx));
+    /*
+     * Since the vhost-user disconnect can happen during initialization
+     * check if vring was initialized, before making unmap.
+     */
+    if (vq->used) {
+        vhost_memory_unmap(dev, vq->used,
+                           virtio_queue_get_used_size(vdev, idx),
+                           1, virtio_queue_get_used_size(vdev, idx));
+    }
+    if (vq->avail) {
+        vhost_memory_unmap(dev, vq->avail,
+                           virtio_queue_get_avail_size(vdev, idx),
+                           0, virtio_queue_get_avail_size(vdev, idx));
+    }
+    if (vq->desc) {
+        vhost_memory_unmap(dev, vq->desc,
+                           virtio_queue_get_desc_size(vdev, idx),
+                           0, virtio_queue_get_desc_size(vdev, idx));
+    }
 }
 
 static void vhost_eventfd_add(MemoryListener *listener,
-- 
2.7.4


