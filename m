Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06068A2B4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO1U6-0006lb-Pi; Fri, 03 Feb 2023 14:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1Ty-0006eN-SR
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1Tw-0007aN-LG
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675451540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxC+Vd6JV8f/ObrRy4WUX4ESGQzNBsPdSPtazpTn/24=;
 b=gRBzn1aQ7FFPMJw2Lh4oOh1ehrFQD2/jaz3KLL7hPwuMnkK3ZW8kxeQthAWEHSOZEI8T3t
 mMe1NBj5w5I6azF8qZr2P7NXhY7n7VG74DIIf2yIlFGtzQ8FO7HZfN8jNcb2NGj4nP1xLX
 zghocIv0yUtOMZrdmON3pz3HPa3IkUM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-GVFOv-b5MiWS3yuERPqIsQ-1; Fri, 03 Feb 2023 14:12:14 -0500
X-MC-Unique: GVFOv-b5MiWS3yuERPqIsQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7575F80D0E8;
 Fri,  3 Feb 2023 19:12:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94A4D492C14;
 Fri,  3 Feb 2023 19:12:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, longpeng2@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>, si-wei.liu@oracle.com,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 08/13] vdpa: disable RAM block discard only for the first
 device
Date: Fri,  3 Feb 2023 20:11:37 +0100
Message-Id: <20230203191142.362623-9-eperezma@redhat.com>
In-Reply-To: <20230203191142.362623-1-eperezma@redhat.com>
References: <20230203191142.362623-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Although it does not make a big difference, its more correct and
simplifies the cleanup path in subsequent patches.

Move ram_block_discard_disable(false) call to the top of
vhost_vdpa_cleanup because:
* We cannot use vhost_vdpa_first_dev after dev->opaque = NULL
  assignment.
* Improve the stack order in cleanup: since it is the last action taken
  in init, it should be the first at cleanup.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 6385c16a55..b0d69df9e6 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -431,16 +431,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     trace_vhost_vdpa_init(dev, opaque);
     int ret;
 
-    /*
-     * Similar to VFIO, we end up pinning all guest memory and have to
-     * disable discarding of RAM.
-     */
-    ret = ram_block_discard_disable(true);
-    if (ret) {
-        error_report("Cannot set discarding of RAM broken");
-        return ret;
-    }
-
     v = opaque;
     v->dev = dev;
     dev->opaque =  opaque ;
@@ -452,6 +442,16 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
         return 0;
     }
 
+    /*
+     * Similar to VFIO, we end up pinning all guest memory and have to
+     * disable discarding of RAM.
+     */
+    ret = ram_block_discard_disable(true);
+    if (ret) {
+        error_report("Cannot set discarding of RAM broken");
+        return ret;
+    }
+
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                VIRTIO_CONFIG_S_DRIVER);
 
@@ -577,12 +577,15 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
+    if (vhost_vdpa_first_dev(dev)) {
+        ram_block_discard_disable(false);
+    }
+
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
-    ram_block_discard_disable(false);
 
     return 0;
 }
-- 
2.31.1


