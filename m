Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E56834553D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:04:15 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWP0-0006dT-F9
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWI8-0000BQ-C1
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lOWI6-0005vQ-NU
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616464626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGAzWDTrIjGDHX4rVMpnYXXGBsYI6SmYqOJ2KJK6sxo=;
 b=R1Q5uaJXjCu6PTyxOhfsgCGn1fXWyetq8Sf8bSbOC5O1QPQwnEc41BR5QM3m5Ai2AA3JLP
 tWFnfHwvVFl7dIinFEGigUTzw76ouZ8BTWy2cLOfID3G7UpuVQQ5NAojNv9roOLmGPtqJX
 fNnXaHbhrSyBXjy2HqWL2yxNptrwf64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-xquu9QXuOxq8no8kbjWkFw-1; Mon, 22 Mar 2021 21:57:04 -0400
X-MC-Unique: xquu9QXuOxq8no8kbjWkFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2406180FCA0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 01:57:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ED0262A6F;
 Tue, 23 Mar 2021 01:57:01 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] virtio-mmio: add support for configure interrupt
Date: Tue, 23 Mar 2021 09:56:40 +0800
Message-Id: <20210323015641.10820-4-lulu@redhat.com>
In-Reply-To: <20210323015641.10820-1-lulu@redhat.com>
References: <20210323015641.10820-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add configure interrupt support for virtio-mmio bus. This
interrupt will working while backend is vhost-vdpa

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-mmio.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index e1b5c3b81e..beabd129ef 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -627,12 +627,30 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
     }
 
     if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
-        vdc->guest_notifier_mask(vdev, n, !assign);
+        vdc->guest_notifier_mask(vdev, n, !assign, VIRTIO_VQ_VECTOR);
     }
-
     return 0;
 }
+static int virtio_mmio_set_config_notifier(DeviceState *d,  bool assign)
+{
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
 
+    EventNotifier *notifier = virtio_get_config_notifier(vdev);
+    int r = 0;
+    if (assign) {
+        r = event_notifier_init(notifier, 0);
+        virtio_set_config_notifier_fd_handler(vdev, true, false);
+    } else {
+        virtio_set_config_notifier_fd_handler(vdev, false, false);
+        event_notifier_cleanup(notifier);
+    }
+        if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
+            vdc->guest_notifier_mask(vdev, 0, !assign, VIRTIO_CONFIG_VECTOR);
+    }
+    return r;
+}
 static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
                                            bool assign)
 {
@@ -654,8 +672,15 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
             goto assign_error;
         }
     }
+   r = virtio_mmio_set_config_notifier(d, assign);
+   if (r < 0) {
+            goto config_assign_error;
+   }
 
     return 0;
+config_assign_error:
+    assert(assign);
+    r = virtio_mmio_set_config_notifier(d, false);
 
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
@@ -666,6 +691,7 @@ assign_error:
     return r;
 }
 
+
 static void virtio_mmio_pre_plugged(DeviceState *d, Error **errp)
 {
     VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
-- 
2.21.3


