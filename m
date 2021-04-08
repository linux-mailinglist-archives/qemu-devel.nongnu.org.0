Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C8357FA2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:45:27 +0200 (CEST)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURE6-0002wA-DI
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7j-0006hS-3y
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lUR7g-0004NG-L4
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PEcKC2Yko0rz3J3ciQK5MVymGM2xuxXf9mgN9ZYEUaE=;
 b=YvZP6Jy/XJxh5Pf/OwzoWCWSU4UYj/acYy2sawxFH8h3wBJlNsIwPxynDrr9e+ltGQw+3h
 ueSeCs6Z+4+wNL5CNDV5KMJrea4jjxAFqA3OiHsVN5esbUunMtW6Qy4gXoj1T6ndk2mw0o
 X/JMuEDMzVFWA2Lk7QLovGDsiaACeks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-g8Oj3hVpNnOH9ISDabVC2Q-1; Thu, 08 Apr 2021 05:38:46 -0400
X-MC-Unique: g8Oj3hVpNnOH9ISDabVC2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B7EAC7403
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 09:38:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-72.pek2.redhat.com [10.72.13.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED6865D9DC;
 Thu,  8 Apr 2021 09:38:43 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] vhost-vdpa: add support for configure interrupt
Date: Thu,  8 Apr 2021 17:38:22 +0800
Message-Id: <20210408093824.14985-5-lulu@redhat.com>
In-Reply-To: <20210408093824.14985-1-lulu@redhat.com>
References: <20210408093824.14985-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Add support for configure interrupt. Set the notifier's fd to
the kernel driver when vdpa start. also set -1 while vdpa stop.
then the kernel will release the related resource

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 9ba2a2bed4..7825366f64 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -467,11 +467,33 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
     }
     return ret;
  }
-
+static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
+                                struct VirtIODevice *vdev, bool start)
+{
+    int fd = 0;
+    int r = 0;
+    if (!(dev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
+        return;
+    }
+    if (start) {
+        fd = event_notifier_get_fd(&vdev->config_notifier);
+        r = dev->vhost_ops->vhost_set_config_call(dev, &fd);
+        if (!r) {
+            vdev->use_config_notifier = true;
+            event_notifier_set(&vdev->config_notifier);
+        }
+    } else {
+        fd = -1;
+        vdev->use_config_notifier = false;
+        r = dev->vhost_ops->vhost_set_config_call(dev, &fd);
+    }
+    return;
+}
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
     trace_vhost_vdpa_dev_start(dev, started);
+    VirtIODevice *vdev = dev->vdev;
     if (started) {
         uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
@@ -479,8 +501,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
 
+        vhost_vdpa_config_notify_start(dev, vdev, true);
         return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
+        vhost_vdpa_config_notify_start(dev, vdev, false);
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
-- 
2.21.3


