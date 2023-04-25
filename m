Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81E6EE6B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:30:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMS4-0006pO-NY; Tue, 25 Apr 2023 13:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMRy-0006nm-Sw
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMRv-00034j-Mb
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ct1ICfub90ccCopLja+U3Sq9ZQX/65uvuN+fpfLMIoc=;
 b=crdN+cRJHPjeNNk/pgdjRPlkZtEh7NIcuXTjP4zapEM+/lO52/2+qWUcz1RUGqMDkiYrtM
 QZ1Tfclz4Dp1vtqmh7PGnWIrdBovUKZ+Qqk/DjCYZ/SVYUsHHmljKp2jKJwzyTMvRxnhco
 s4grhqzEx5+dbxVcQBlOtO2jtb12Fmc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-zygUM1aeMOCsWjm0lHqwCg-1; Tue, 25 Apr 2023 13:27:27 -0400
X-MC-Unique: zygUM1aeMOCsWjm0lHqwCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92D2A28082B1;
 Tue, 25 Apr 2023 17:27:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0ED82027043;
 Tue, 25 Apr 2023 17:27:25 +0000 (UTC)
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
 Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [PATCH v4 03/20] virtio-scsi: avoid race between unplug and transport
 event
Date: Tue, 25 Apr 2023 13:26:59 -0400
Message-Id: <20230425172716.1033562-4-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Only report a transport reset event to the guest after the SCSIDevice
has been unrealized by qdev_simple_device_unplug_cb().

qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
to false so that scsi_device_find/get() no longer see it.

scsi_target_emulate_report_luns() also needs to be updated to filter out
SCSIDevices that are unrealized.

These changes ensure that the guest driver does not see the SCSIDevice
that's being unplugged if it responds very quickly to the transport
reset event.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/scsi-bus.c    |  3 ++-
 hw/scsi/virtio-scsi.c | 18 +++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 07275fb631..64d7311757 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -486,7 +486,8 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
             DeviceState *qdev = kid->child;
             SCSIDevice *dev = SCSI_DEVICE(qdev);
 
-            if (dev->channel == channel && dev->id == id && dev->lun != 0) {
+            if (dev->channel == channel && dev->id == id && dev->lun != 0 &&
+                qdev_is_realized(&dev->qdev)) {
                 store_lun(tmp, dev->lun);
                 g_byte_array_append(buf, tmp, 8);
                 len += 8;
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 612c525d9d..000961446c 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1063,15 +1063,6 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     SCSIDevice *sd = SCSI_DEVICE(dev);
     AioContext *ctx = s->ctx ?: qemu_get_aio_context();
 
-    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
-        virtio_scsi_acquire(s);
-        virtio_scsi_push_event(s, sd,
-                               VIRTIO_SCSI_T_TRANSPORT_RESET,
-                               VIRTIO_SCSI_EVT_RESET_REMOVED);
-        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
-        virtio_scsi_release(s);
-    }
-
     aio_disable_external(ctx);
     qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
     aio_enable_external(ctx);
@@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL);
         virtio_scsi_release(s);
     }
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
+        virtio_scsi_acquire(s);
+        virtio_scsi_push_event(s, sd,
+                               VIRTIO_SCSI_T_TRANSPORT_RESET,
+                               VIRTIO_SCSI_EVT_RESET_REMOVED);
+        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
+        virtio_scsi_release(s);
+    }
 }
 
 static struct SCSIBusInfo virtio_scsi_scsi_info = {
-- 
2.39.2


