Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E204D56B7EC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:02:29 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lkj-0001PS-12
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZh-0000gC-1C
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZf-0007z7-EF
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xswl/Jc8b1wgHU6i3G9Ba66pY8Pzv6II872M9hZ4ZWc=;
 b=FZApXsAz2wDIP3I+pK6A/CCLrxTJSb0tFi31+LlI/VU2QKtnUDnSXz8un6SmRvIId3dttJ
 pM8GrE3LdI4urOpoKfbkJ8bM9GpdGLNbei/Uw4JIT26A9UPn+zkAcP8Pa/UMEFMb+tx64x
 ff5aMv6916VBmOy005W2+IfRsVvg2z0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-dXEciqZbM96ndOMV0pWTrw-1; Fri, 08 Jul 2022 06:50:58 -0400
X-MC-Unique: dXEciqZbM96ndOMV0pWTrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 309C23C0ED4F;
 Fri,  8 Jul 2022 10:50:58 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F2071121314;
 Fri,  8 Jul 2022 10:50:55 +0000 (UTC)
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
Subject: [PATCH 13/22] vhost: add vhost_svq_poll
Date: Fri,  8 Jul 2022 12:50:04 +0200
Message-Id: <20220708105013.1899854-14-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

It allows the Shadow Control VirtQueue to wait the device to use the commands
that restore the net device state after a live migration.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  1 +
 hw/virtio/vhost-shadow-virtqueue.c | 54 ++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 09b87078af..57ff97ce4f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -86,6 +86,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
                          const VirtQueueElement *elem, uint32_t len);
 int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
                      size_t out_num, size_t in_num, void *opaque);
+ssize_t vhost_svq_poll(VhostShadowVirtqueue *svq);
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 4d59954f1b..f4affa52ee 100644
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
@@ -492,10 +494,11 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
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
@@ -512,7 +515,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                          "More than %u used buffers obtained in a %u size SVQ",
                          i, svq->vring.num);
                 virtqueue_flush(vq, svq->vring.num);
-                return;
+                return ret;
             }
 
             svq_elem = vhost_svq_get_buf(svq, &len);
@@ -522,6 +525,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 
             elem = g_steal_pointer(&svq_elem.opaque);
             virtqueue_fill(vq, elem, len, i++);
+            ret++;
         }
 
         virtqueue_flush(vq, i);
@@ -535,6 +539,50 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
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


