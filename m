Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413416EE6C3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:33:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMS4-0006pf-Nc; Tue, 25 Apr 2023 13:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMRz-0006np-2S
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMRx-000354-0B
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEUiDYhTGG6/grGbCAPXx5jwh+m436EKZLWWN7O6BQM=;
 b=J7awGJXaGlRQsRG4NuTIr0Q9Q1sBmBOsuYB8pBg2gMaURy9dsvQBMQloGhPnnFtFQTMWv7
 tzl/MWOLavHeOb6fR+3Jf3r5NBy0Y1L4BlYZHX1WcrDTmXaNlx+F/c7hLRS3+8z7R9Z6Nr
 a0+Ia6DBu3ZYErgkmIa7IoJUZNJMAJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-1GkdNZ8vNFmRijBei6Lasw-1; Tue, 25 Apr 2023 13:27:30 -0400
X-MC-Unique: 1GkdNZ8vNFmRijBei6Lasw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57853885626;
 Tue, 25 Apr 2023 17:27:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B06A2166B41;
 Tue, 25 Apr 2023 17:27:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Lieven <pl@kamp.de>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Zhengui Li <lizhengui@huawei.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [PATCH v4 04/20] virtio-scsi: stop using aio_disable_external()
 during unplug
Date: Tue, 25 Apr 2023 13:27:00 -0400
Message-Id: <20230425172716.1033562-5-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
aio_disable_external(). It was only used by commit 9c5aad84da1c
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
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
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


