Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF1656922B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:50:40 +0200 (CEST)
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9A6h-0007IN-LQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xX-0005Up-BM
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xJ-0000rY-AQ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zks5sbDXsApuGo8sXmlR/yY7E4sTbJYTkFc3HYQXS/M=;
 b=XEF+8XSy5fukC0cW7aUaxB4DmAawSHucA5vzYBLTXFutgndpheNNVVW/M3C+hRgIGKX6qY
 a7vu/C5g4Z4b/6i1o5qLHiiUAWxGqN0hZcGHd+r8SQk7pTgdFx34cUM081v9Cp5UCq1H3D
 GX/cFUMOdF500S9tWKgqvKqByyECN2M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-4HthpFxQOFGT8sN6FLZSoQ-1; Wed, 06 Jul 2022 14:40:51 -0400
X-MC-Unique: 4HthpFxQOFGT8sN6FLZSoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D5A3C0F37D;
 Wed,  6 Jul 2022 18:40:51 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84EF91415116;
 Wed,  6 Jul 2022 18:40:48 +0000 (UTC)
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
Subject: [RFC PATCH v9 13/23] vhost: Add vhost_svq_inject
Date: Wed,  6 Jul 2022 20:39:58 +0200
Message-Id: <20220706184008.1649478-14-eperezma@redhat.com>
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

This allows qemu to inject buffers to the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  2 ++
 hw/virtio/vhost-shadow-virtqueue.c | 34 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index a811f90e01..d01d2370db 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -98,6 +98,8 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
 void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
                          const VirtQueueElement *elem, uint32_t len);
+int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
+                     size_t out_num, size_t in_num, void *opaque);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 492bb12b5f..bd9e34b413 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -283,6 +283,40 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
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
+
+    /*
+     * All vhost_svq_inject calls are controlled by qemu so we won't hit this
+     * assertions.
+     */
+    assert(out_num || in_num);
+    assert(svq->ops);
+
+    if (unlikely(svq->next_guest_avail_elem)) {
+        error_report("Injecting in a full queue");
+        return -ENOMEM;
+    }
+
+    ok = vhost_svq_add(svq, iov, out_num, iov + out_num, in_num, opaque);
+    assert(ok);
+    vhost_svq_kick(svq);
+    return 0;
+}
+
 /**
  * Forward available buffers.
  *
-- 
2.31.1


