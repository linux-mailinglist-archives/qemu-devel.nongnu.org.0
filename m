Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7AC56B7DB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:59:01 +0200 (CEST)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lhM-0005II-Er
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZc-0000YV-Mr
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZb-0007wX-4q
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0o8pmntHuZD5pDfTt7BRb04k8Z8B6rQhvSeFhaEdYs=;
 b=RHoYH8dswYi1+MK1bs4kRlEsW4PbuJC5hsvzUvUrk56UXSmgZVLJLlkanzjaPEA+G4X6Hd
 JnHwHR5FlKjKl55W/dVedql/01SQC0KYNFhc7kosAdCaIGeI2r0ege1CHk6BwGoyoyedyG
 +XeSTREEt7Oy0ZWBJgVuQhLT0pjWJCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-eyPKcPBTP12UXsYMN8-9qw-1; Fri, 08 Jul 2022 06:50:55 -0400
X-MC-Unique: eyPKcPBTP12UXsYMN8-9qw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F7F4101A54E;
 Fri,  8 Jul 2022 10:50:55 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4673B1121314;
 Fri,  8 Jul 2022 10:50:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 12/22] vhost: Add vhost_svq_inject
Date: Fri,  8 Jul 2022 12:50:03 +0200
Message-Id: <20220708105013.1899854-13-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

This allows qemu to inject buffers to the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 37 ++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 855fa82e3e..09b87078af 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -84,6 +84,8 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
 void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
                          const VirtQueueElement *elem, uint32_t len);
+int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                     size_t out_num, size_t in_num, void *opaque);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 2b0a268655..4d59954f1b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -282,6 +282,43 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
     return ok;
 }
 
+/**
+ * Inject a chain of buffers to the device
+ *
+ * @svq: Shadow VirtQueue
+ * @iov: I/O vector
+ * @out_num: Number of front out descriptors
+ * @in_num: Number of last input descriptors
+ * @opaque: Contextual data to store in descriptor
+ *
+ * Return 0 on success, -ENOMEM if cannot inject
+ */
+int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                     size_t out_num, size_t in_num, void *opaque)
+{
+    bool ok;
+    size_t num = out_num + in_num;
+
+    /*
+     * All vhost_svq_inject calls are controlled by qemu so we won't hit this
+     * assertions.
+     */
+    assert(out_num || in_num);
+
+    if (unlikely(num > vhost_svq_available_slots(svq))) {
+        error_report("Injecting in a full queue");
+        return -ENOMEM;
+    }
+
+    ok = vhost_svq_add(svq, iov, out_num, iov + out_num, in_num, opaque);
+    if (unlikely(!ok)) {
+        return -EINVAL;
+    }
+
+    vhost_svq_kick(svq);
+    return 0;
+}
+
 /**
  * Forward available buffers.
  *
-- 
2.31.1


