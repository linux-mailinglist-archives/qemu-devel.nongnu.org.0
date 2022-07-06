Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BE569243
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:57:50 +0200 (CEST)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ADd-0003PZ-8B
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xG-0005Kv-AX
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99x4-0000pW-A9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mro7mQDdAvykXc9MUpTOitbSw+VVbx2upRRODnnToII=;
 b=ciVoow3Rb2ezG1k7Z0stIeJZolb3qYKMznV6R01s2tNOE0dsEylyMlacQGlJBYzwKDZsou
 AQz0O668FyNedCjXUOcp3m9HyCBjGB4PaegVWpg20mA8q2PI2ezflk/tNppIJi9lC3H32V
 bHH4PY1lO/h05zmR0JsGZNPmUjyqzTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-yPO70intPJeUIsx7w-RDyg-1; Wed, 06 Jul 2022 14:40:22 -0400
X-MC-Unique: yPO70intPJeUIsx7w-RDyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF2C7185A7BA;
 Wed,  6 Jul 2022 18:40:21 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D3581415116;
 Wed,  6 Jul 2022 18:40:19 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 03/23] vdpa: delay set_vring_ready after DRIVER_OK
Date: Wed,  6 Jul 2022 20:39:48 +0200
Message-Id: <20220706184008.1649478-4-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

To restore the device in the destination of a live migration we send the
commands through control virtqueue. For a device to read CVQ it must
have received DRIVER_OK status bit.

However this open a window where the device could start receiving
packets in rx queue 0 before it receive the RSS configuration. To avoid
that, we will not send vring_enable until all configuration is used by
the device.

As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 66f054a12c..2ee8009594 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -728,13 +728,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
     return idx;
 }
 
+/**
+ * Set ready all vring of the device
+ *
+ * @dev: Vhost device
+ */
 static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
 {
     int i;
     trace_vhost_vdpa_set_vring_ready(dev);
-    for (i = 0; i < dev->nvqs; ++i) {
+    for (i = 0; i < dev->vq_index_end; ++i) {
         struct vhost_vring_state state = {
-            .index = dev->vq_index + i,
+            .index = i,
             .num = 1,
         };
         vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
@@ -1097,7 +1102,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         if (unlikely(!ok)) {
             return -1;
         }
-        vhost_vdpa_set_vring_ready(dev);
     } else {
         ok = vhost_vdpa_svqs_stop(dev);
         if (unlikely(!ok)) {
@@ -1111,16 +1115,22 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
+        int r;
+
         memory_listener_register(&v->listener, &address_space_memory);
-        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
+        r = vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
+        if (unlikely(r)) {
+            return r;
+        }
+        vhost_vdpa_set_vring_ready(dev);
     } else {
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
         memory_listener_unregister(&v->listener);
-
-        return 0;
     }
+
+    return 0;
 }
 
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
-- 
2.31.1


