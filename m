Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997F930655B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:47:29 +0100 (CET)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4riq-0001mP-Lg
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l4rgZ-00014a-4Y
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:45:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l4rgW-0004Xm-79
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611780302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1F/SzFHBH5O5u5fDht5ykXXZCePcH1vGM0XKQkJoK4M=;
 b=ByeJ4IwhRGHanXfLWkzb8GZ2VsuNbxwqeEcGvyftcB6Fvp5VRyGaQFApYA2dO28uI2UFJj
 Vo4x9PCqmzIHtarS+iXUPA7h5RhekBiUx4k4x0khAL/QeJULXP6PNgWwWxjnBNMIdp6V9y
 VAUK3/EhdNkFvvuafrBribFAqtizV1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-pUPas7EnMcqAlgvii5y-mg-1; Wed, 27 Jan 2021 15:45:00 -0500
X-MC-Unique: pUPas7EnMcqAlgvii5y-mg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 318C61800D42
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:44:59 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-116-24.ams2.redhat.com [10.36.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F37A5C8AD;
 Wed, 27 Jan 2021 20:44:51 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user: Check for iotlb callback in iotlb_miss
Date: Wed, 27 Jan 2021 21:44:49 +0100
Message-Id: <20210127204449.745365-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: maxime.coquelin@redhat.com, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not registering this can lead to vhost_backend_handle_iotlb_msg and
vhost_device_iotlb_miss if backend issue a miss after qemu vhost device
stop.

This causes a try to access dev->vdev->dma_as with vdev == NULL.

Reproduced rebooting a guest with testpmd in txonly forward mode.
 #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
     dev=dev@entry=0x55a0012f6680, iova=10245279744, write=1)
     at ../hw/virtio/vhost.c:1013
 #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
     imsg=0x7ffddcfd32c0, dev=0x55a0012f6680)
     at ../hw/virtio/vhost-backend.c:411
 #2  vhost_backend_handle_iotlb_msg (dev=dev@entry=0x55a0012f6680,
     imsg=imsg@entry=0x7ffddcfd32c0)
     at ../hw/virtio/vhost-backend.c:404
 #3  0x0000559fffeded7b in slave_read (opaque=0x55a0012f6680)
     at ../hw/virtio/vhost-user.c:1464
 #4  0x000055a0000c541b in aio_dispatch_handler (
     ctx=ctx@entry=0x55a0010a2120, node=0x55a0012d9e00)
     at ../util/aio-posix.c:329

Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-user.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2fdd5daf74..a49b2229fb 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -238,6 +238,7 @@ struct vhost_user {
     /* Shared between vhost devs of the same virtio device */
     VhostUserState *user;
     int slave_fd;
+    bool iotlb_enabled;
     NotifierWithReturn postcopy_notifier;
     struct PostCopyFD  postcopy_fd;
     uint64_t           postcopy_client_bases[VHOST_USER_MAX_RAM_SLOTS];
@@ -1461,7 +1462,11 @@ static void slave_read(void *opaque)
 
     switch (hdr.request) {
     case VHOST_USER_SLAVE_IOTLB_MSG:
-        ret = vhost_backend_handle_iotlb_msg(dev, &payload.iotlb);
+        if (likely(u->iotlb_enabled)) {
+            ret = vhost_backend_handle_iotlb_msg(dev, &payload.iotlb);
+        } else {
+            ret = -EFAULT;
+        }
         break;
     case VHOST_USER_SLAVE_CONFIG_CHANGE_MSG :
         ret = vhost_user_slave_handle_config_change(dev);
@@ -2044,7 +2049,8 @@ static int vhost_user_send_device_iotlb_msg(struct vhost_dev *dev,
 
 static void vhost_user_set_iotlb_callback(struct vhost_dev *dev, int enabled)
 {
-    /* No-op as the receive channel is not dedicated to IOTLB messages. */
+    struct vhost_user *u = dev->opaque;
+    u->iotlb_enabled = enabled;
 }
 
 static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
-- 
2.27.0


