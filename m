Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9EF6C709A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:57:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfQ6u-0005YI-TS; Thu, 23 Mar 2023 14:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfQ6q-0005We-BL
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfQ6o-0007CW-PK
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679597782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihjWHoUpo/s2BhU852TdjO8pxLzcezQe1b17yzJGEGs=;
 b=D+vpQQy+5knLx9V1Yg2WNnnKwcgI+vho+zfRJW3RrD1LjP8xqNLpPtiuUOLwn5vmLrASJw
 ySK50D+eoA0fRqzpGoIQ5X+b/RTonAlls0rF1G6nLP7RsjuKhv5UYlLnk74k4ezhBrVI1c
 YRITcVP60Xqre9FZw4TQGw7uCXwbVNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-NRdW6evqOQCOZ2_iylDJPw-1; Thu, 23 Mar 2023 14:56:20 -0400
X-MC-Unique: NRdW6evqOQCOZ2_iylDJPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 330C4802D1A;
 Thu, 23 Mar 2023 18:56:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75D5840C6E67;
 Thu, 23 Mar 2023 18:56:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Fam Zheng <fam@euphon.net>, kwolf@redhat.com, <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Zhengui Li <lizhengui@huawei.com>
Subject: [PATCH 2/2] virtio-scsi: stop using aio_disable_external() during
 unplug
Date: Thu, 23 Mar 2023 14:56:07 -0400
Message-Id: <20230323185607.1458987-3-stefanha@redhat.com>
In-Reply-To: <20230323185607.1458987-1-stefanha@redhat.com>
References: <20230323185607.1458987-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

This patch is part of an effort to remove the aio_disable_external()
API because it does not fit in a multi-queue block layer world where
many AioContexts may be submitting requests to the same disk.

The SCSI emulation code is already in good shape to stop using
aio_disable_external(). The API is only used by commit 9c5aad84da1c
("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi
disk") to ensure that virtio_scsi_hotunplug() works while the guest
driver is submitting I/O.

Ensure virtio_scsi_hotunplug() is safe as follows:

1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
   device_set_realized() calls qatomic_set(&dev->realized, false) so
   that future scsi_device_get() calls return NULL because they exclude
   SCSIDevices with realized=false.

   That means virtio-scsi will reject new I/O requests to this
   SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
   virtio_scsi_hotunplug() is still executing. We are protected against
   new requests!

2. Add a call to scsi_device_purge_requests() from scsi_unrealize() so
   that in-flight requests are cancelled synchronously. This ensures
   that no in-flight requests remain once qdev_simple_device_unplug_cb()
   returns.

Thanks to these two conditions we don't need aio_disable_external()
anymore.

Cc: Zhengui Li <lizhengui@huawei.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/scsi-disk.c   | 1 +
 hw/scsi/virtio-scsi.c | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 97c9b1c8cd..e01bd84541 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2522,6 +2522,7 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
 
 static void scsi_unrealize(SCSIDevice *dev)
 {
+    scsi_device_purge_requests(dev, SENSE_CODE(RESET));
     del_boot_device_lchs(&dev->qdev, NULL);
 }
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 000961446c..a02f9233ec 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1061,11 +1061,8 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtIODevice *vdev = VIRTIO_DEVICE(hotplug_dev);
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
     SCSIDevice *sd = SCSI_DEVICE(dev);
-    AioContext *ctx = s->ctx ?: qemu_get_aio_context();
 
-    aio_disable_external(ctx);
     qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
-    aio_enable_external(ctx);
 
     if (s->ctx) {
         virtio_scsi_acquire(s);
-- 
2.39.2


