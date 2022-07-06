Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B93569244
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:58:05 +0200 (CEST)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ADs-0004AI-7P
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xi-0005aS-JW
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xT-0000sg-94
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZLwu+6AF4zkR9z1JXMp2MzIWH9CQtFIHGTsbAD4Jxk=;
 b=Kp/Nam1UMhk5ooTXg6uVBf2fZBHNRndKu6NFD4Hfzh8jmWUg+zykqVw3XxWe8vpvSAqJz2
 3PLAaR/Ouo8PUAcy9NEeGK8/42gYiCLn+/uLvqQu8sPbjyaXWBvoteY95x5fSUjmu6kSwe
 +zwe1Gd/ocUk7YVTqoln/XFE9FsHpLU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-o0mbc5fxOkST8cuBZv-bBA-1; Wed, 06 Jul 2022 14:40:54 -0400
X-MC-Unique: o0mbc5fxOkST8cuBZv-bBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6E0085A582;
 Wed,  6 Jul 2022 18:40:53 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53FD21415116;
 Wed,  6 Jul 2022 18:40:51 +0000 (UTC)
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
Subject: [RFC PATCH v9 14/23] vhost: add vhost_svq_poll
Date: Wed,  6 Jul 2022 20:39:59 +0200
Message-Id: <20220706184008.1649478-15-eperezma@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 hw/virtio/vhost-shadow-virtqueue.c | 54 ++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index d01d2370db..c8668fbdd6 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -100,6 +100,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
                          const VirtQueueElement *elem, uint32_t len);
 int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
                      size_t out_num, size_t in_num, void *opaque);
+ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index bd9e34b413..ed7f1d0bc9 100644
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
@@ -490,10 +492,11 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
     }
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
@@ -510,7 +513,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                          "More than %u used buffers obtained in a %u size SVQ",
                          i, svq->vring.num);
                 virtqueue_flush(vq, svq->vring.num);
-                return;
+                return ret;
             }
 
             svq_elem = vhost_svq_get_buf(svq, &len);
@@ -520,6 +523,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 
             elem = g_steal_pointer(&svq_elem.opaque);
             virtqueue_fill(vq, elem, len, i++);
+            ret++;
         }
 
         virtqueue_flush(vq, i);
@@ -533,6 +537,50 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
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
+ * synchronization is needed.
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
2.31.1


