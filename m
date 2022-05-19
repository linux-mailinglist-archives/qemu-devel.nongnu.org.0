Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3752DDD2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 21:30:13 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrlqe-00064V-OB
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 15:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlb5-0005fc-7Z
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nrlb2-0006Rp-Ii
 for qemu-devel@nongnu.org; Thu, 19 May 2022 15:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652987644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWiB2UPpPFNLsK1gITyT4zta7OXMHp9dwTDbjarxjKA=;
 b=MxSu1Gdcc7cTUtob4iGVqz/ZMNhwbkFUud4q+eIM+MeemvwUh1FVHAac1A/wEQj5U2GQh8
 yCd3QCuS5rt5DMBYhl5qoE5ZpX12jQB3HJZsP7OyFFOeEnavcHKTkK5ADqOSgKsh9X31Wx
 Ga0fgpWKd8YvQZXGv4+CQ6pL2mzhoUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-xuHyKZcAP3K8SBC49GAQ7g-1; Thu, 19 May 2022 15:14:01 -0400
X-MC-Unique: xuHyKZcAP3K8SBC49GAQ7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 650D4800B21;
 Thu, 19 May 2022 19:13:54 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF2C02024CAE;
 Thu, 19 May 2022 19:13:51 +0000 (UTC)
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
Subject: [RFC PATCH v8 15/21] vhost: add vhost_svq_poll
Date: Thu, 19 May 2022 21:13:00 +0200
Message-Id: <20220519191306.821774-16-eperezma@redhat.com>
In-Reply-To: <20220519191306.821774-1-eperezma@redhat.com>
References: <20220519191306.821774-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

It allows the Shadow Control VirtQueue to wait the device to use the commands
that restore the net device state after a live migration.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  1 +
 hw/virtio/vhost-shadow-virtqueue.c | 57 +++++++++++++++++++++++++++---
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 3c55fe2641..20ca59e9a7 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -124,6 +124,7 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
 int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
                      size_t out_num, size_t in_num);
+ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index c535c99905..831ffb71e5 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -10,6 +10,8 @@
 #include "qemu/osdep.h"
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 
+#include <glib/gpoll.h>
+
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
@@ -583,10 +585,11 @@ static bool vhost_svq_unmap_elem(VhostShadowVirtqueue *svq, SVQElement *svq_elem
     return true;
 }
 
-static void vhost_svq_flush(VhostShadowVirtqueue *svq,
-                            bool check_for_avail_queue)
+static size_t vhost_svq_flush(VhostShadowVirtqueue *svq,
+                              bool check_for_avail_queue)
 {
     VirtQueue *vq = svq->vq;
+    size_t ret = 0;
 
     /* Forward as many used buffers as possible. */
     do {
@@ -604,7 +607,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
             if (svq->copy_descs) {
                 bool ok = vhost_svq_unmap_elem(svq, svq_elem, len, true);
                 if (unlikely(!ok)) {
-                    return;
+                    return ret;
                 }
             }
 
@@ -621,10 +624,12 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                         i, svq->vring.num);
                     virtqueue_fill(vq, elem, len, i);
                     virtqueue_flush(vq, i);
-                    return;
+                    return ret + 1;
                 }
                 virtqueue_fill(vq, elem, len, i++);
             }
+
+            ret++;
         }
 
         if (i > 0) {
@@ -640,6 +645,50 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
             vhost_handle_guest_kick(svq);
         }
     } while (!vhost_svq_enable_notification(svq));
+
+    return ret;
+}
+
+/**
+ * Poll the SVQ for device used buffers.
+ *
+ * This function race with main event loop SVQ polling, so extra
+ * syncthronization is needed.
+ *
+ * Return the number of descriptors read from the device.
+ */
+ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq)
+{
+    int fd = event_notifier_get_fd(&svq->hdev_call);
+    GPollFD poll_fd = {
+        .fd = fd,
+        .events = G_IO_IN,
+    };
+    assert(fd >= 0);
+    int r = g_poll(&poll_fd, 1, -1);
+
+    if (unlikely(r < 0)) {
+        error_report("Cannot poll device call fd "G_POLLFD_FORMAT": (%d) %s",
+                     poll_fd.fd, errno, g_strerror(errno));
+        return -errno;
+    }
+
+    if (r == 0) {
+        return 0;
+    }
+
+    if (unlikely(poll_fd.revents & ~(G_IO_IN))) {
+        error_report(
+            "Error polling device call fd "G_POLLFD_FORMAT": revents=%d",
+            poll_fd.fd, poll_fd.revents);
+        return -1;
+    }
+
+    /*
+     * Max return value of vhost_svq_flush is (uint16_t)-1, so it's safe to
+     * convert to ssize_t.
+     */
+    return vhost_svq_flush(svq, false);
 }
 
 /**
-- 
2.27.0


