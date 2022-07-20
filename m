Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4057B3A0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:17:28 +0200 (CEST)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5pf-0005eE-S3
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5ct-0000Vn-WD
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cr-0001To-4R
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2EAtPvsF4CeGJH8vvBNBf6Jt4GMpAr2uSF28zcF3D8=;
 b=L2y1WzwdARWoghujC2iD7VIHaD+zKMrcpg1gwD+oV91admGz1B4pgPRPvSNazSBu8CowTe
 uRbTtXmupFY/+LVwXV36w9xpW1+LuaegL8DoFAZ06S20nffeQlbceQ5hzlFbbP6XGbPT38
 3VMOsUhK6fyG2AVaadWBSGoJZzjqWCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-3F05olVdN0KJxVtTAllEgA-1; Wed, 20 Jul 2022 05:03:58 -0400
X-MC-Unique: 3F05olVdN0KJxVtTAllEgA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9605485A584;
 Wed, 20 Jul 2022 09:03:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1415A492C3B;
 Wed, 20 Jul 2022 09:03:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 13/25] vhost: add vhost_svq_poll
Date: Wed, 20 Jul 2022 17:03:01 +0800
Message-Id: <20220720090313.55169-14-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

It allows the Shadow Control VirtQueue to wait for the device to use the
available buffers.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 27 +++++++++++++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index c3a75ca..cc2ee47 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -486,6 +486,33 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 }
 
 /**
+ * Poll the SVQ for one device used buffer.
+ *
+ * This function race with main event loop SVQ polling, so extra
+ * synchronization is needed.
+ *
+ * Return the length written by the device.
+ */
+size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
+{
+    int64_t start_us = g_get_monotonic_time();
+    do {
+        uint32_t len;
+        VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
+        if (elem) {
+            return len;
+        }
+
+        if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
+            return 0;
+        }
+
+        /* Make sure we read new used_idx */
+        smp_rmb();
+    } while (true);
+}
+
+/**
  * Forward used buffers.
  *
  * @n: hdev call event notifier, the one that device set to notify svq.
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index dd78f4b..cf442f7 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
 int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
                   size_t out_num, const struct iovec *in_sg, size_t in_num,
                   VirtQueueElement *elem);
+size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
 
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
-- 
2.7.4


