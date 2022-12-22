Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9210653C6E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 08:08:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8FfG-0006SZ-J8; Thu, 22 Dec 2022 02:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p8Ff5-0006Ly-SY
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p8Ff2-0003VX-F9
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671692793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGoo6xtwgs7hXpbVUHEof+Ihaf7fPTu33nQzpjv+Qbs=;
 b=Lts+iM1uiRJ7z5ujw00IODeKtWbwG+0bL7KKFmMK7oX4oLY1Py8/Q5nlenzUda7uYJVbum
 mXXkk2kuWtYoar05/J6sIUQv2o4F8FzxGe+EZtViJE1KOZ4mLDG+jCLcDmkRnw+GK1xBZK
 No3hJjTS9YHLU5NoEPIVlm4Bqj7xUkw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-Cl9vZJMwPMG9YI2UOGzpwg-1; Thu, 22 Dec 2022 02:06:29 -0500
X-MC-Unique: Cl9vZJMwPMG9YI2UOGzpwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0F0D181E3EE
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 07:06:28 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-67.pek2.redhat.com [10.72.12.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7C64140EBF5;
 Thu, 22 Dec 2022 07:06:26 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v21 09/10] virtio-mmio: add support for configure interrupt
Date: Thu, 22 Dec 2022 15:04:50 +0800
Message-Id: <20221222070451.936503-10-lulu@redhat.com>
In-Reply-To: <20221222070451.936503-1-lulu@redhat.com>
References: <20221222070451.936503-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

Add configure interrupt support in virtio-mmio bus.
add function to set configure guest notifier.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index d240efef97..103260ec15 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -670,7 +670,30 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
 
     return 0;
 }
+static int virtio_mmio_set_config_guest_notifier(DeviceState *d, bool assign,
+                                                 bool with_irqfd)
+{
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    EventNotifier *notifier = virtio_config_get_guest_notifier(vdev);
+    int r = 0;
 
+    if (assign) {
+        r = event_notifier_init(notifier, 0);
+        if (r < 0) {
+            return r;
+        }
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+    } else {
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+        event_notifier_cleanup(notifier);
+    }
+    if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
+        vdc->guest_notifier_mask(vdev, VIRTIO_CONFIG_IRQ_IDX, !assign);
+    }
+    return r;
+}
 static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
                                            bool assign)
 {
@@ -692,6 +715,10 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
             goto assign_error;
         }
     }
+    r = virtio_mmio_set_config_guest_notifier(d, assign, with_irqfd);
+    if (r < 0) {
+        goto assign_error;
+    }
 
     return 0;
 
-- 
2.34.3


