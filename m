Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B252DDDC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:33:30 +0200 (CEST)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrltp-0002Cy-IE
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlaq-0005Uh-0J
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlao-0006Pv-GA
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuS07kiIQEXSFOQblRFIUzZ7Vg9qIIPzvSO/iExh9s4=;
 b=H310Lw+IfqQ2Jm1XnQ18sudkGEqsK26fF3ZmD6LM5r1fxxNeQKe3WfbBeReJ9AsAecVpG0
 LK9TzMZ/MSae6EQi7r/m2aSo9ND9o2tlll0iVHH/GigvHPcwS+oDTyP+bw4pDAXFX18Sy7
 S7peESyOVzhwfNfMUdcJsqoGDShj6J8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653--Wz40Z1KNPmUfbndZPXj9w-1; Thu, 19 May 2022 15:13:46 -0400
X-MC-Unique: -Wz40Z1KNPmUfbndZPXj9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DECBB800B21;
 Thu, 19 May 2022 19:13:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5571A2026D6A;
 Thu, 19 May 2022 19:13:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eric Blake <eblake@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH v8 12/21] vdpa: delay set_vring_ready after DRIVER_OK
Date: Thu, 19 May 2022 21:12:57 +0200
Message-Id: <20220519191306.821774-13-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 hw/virtio/vhost-vdpa.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 31b3d4d013..13e5e2a061 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -748,13 +748,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
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
@@ -1117,7 +1122,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         if (unlikely(!ok)) {
             return -1;
         }
-        vhost_vdpa_set_vring_ready(dev);
     } else {
         ok = vhost_vdpa_svqs_stop(dev);
         if (unlikely(!ok)) {
@@ -1131,16 +1135,22 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
+        int r;
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
 
-        return 0;
     }
+
+    return 0;
 }
 
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
-- 
2.27.0


