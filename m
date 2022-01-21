Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108549671E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:08:55 +0100 (CET)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB19S-0007L1-Ld
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0ab-0007N9-NS
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0aY-00044k-Kw
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8brTVOPh41D9JIYPtyJmyj23Qq54zpyRadZPX14hoHI=;
 b=MotHynt6UO92/DHWNGfh3bmviMJ84sljvJ5sZ3ZFoK+Yy4NHRQ0H/1q3Dq34ocTJGKJZyJ
 C+9Mf8aRRsoqd/GNJoterJJbrPBTZvs7Op19sxSO2PJ9efgDqdVIqxxz32P2slWBaUQpFv
 AQqku4Ut/m8rNscTgOpfDVpzMByQEvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-tmR_tWvQOvOZKJ0gjpW7jA-1; Fri, 21 Jan 2022 15:32:46 -0500
X-MC-Unique: tmR_tWvQOvOZKJ0gjpW7jA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B12E193F561;
 Fri, 21 Jan 2022 20:32:44 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87A1716A31;
 Fri, 21 Jan 2022 20:32:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/31] vhost: Add vhost_svq_ack_guest_features to shadow vq
Date: Fri, 21 Jan 2022 21:27:15 +0100
Message-Id: <20220121202733.404989-14-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This combines the previous two feature functions, forwarding the guest
ones to the device and setting the transport ones that the SVQ supports
with the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  3 +++
 hw/virtio/vhost-shadow-virtqueue.c | 31 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 1aae6a2297..af8f8264c0 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,9 @@ typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
 
 bool vhost_svq_valid_device_features(uint64_t *features);
 bool vhost_svq_valid_guest_features(uint64_t *features);
+bool vhost_svq_ack_guest_features(uint64_t dev_features,
+                                  uint64_t guest_features,
+                                  uint64_t *acked_features);
 
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index f70160d7ca..a6fb7e3c8f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -113,6 +113,37 @@ bool vhost_svq_valid_guest_features(uint64_t *guest_features)
     return !(guest_transport_features & (transport ^ valid));
 }
 
+/**
+ * VirtIO features that SVQ must acknowledge to device.
+ *
+ * It combines the SVQ transport compatible features with the guest's device
+ * features.
+ *
+ * @dev_features    The device offered features
+ * @guest_features  The guest acknowledge features
+ * @acked_features  The guest acknowledge features in the device side plus SVQ
+ *                  transport ones.
+ *
+ * Returns true if SVQ can work with this features, false otherwise
+ */
+bool vhost_svq_ack_guest_features(uint64_t dev_features,
+                                  uint64_t guest_features,
+                                  uint64_t *acked_features)
+{
+    static const uint64_t transport = MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
+                            VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
+
+    bool ok = vhost_svq_valid_device_features(&dev_features) &&
+              vhost_svq_valid_guest_features(&guest_features);
+    if (unlikely(!ok)) {
+        return false;
+    }
+
+    *acked_features = (dev_features & transport) |
+                      (guest_features & ~transport);
+    return true;
+}
+
 /* Forward guest notifications */
 static void vhost_handle_guest_kick(EventNotifier *n)
 {
-- 
2.27.0


