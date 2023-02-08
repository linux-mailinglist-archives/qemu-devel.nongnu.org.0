Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6568EBFA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgzG-0005IW-Ts; Wed, 08 Feb 2023 04:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgzD-0005I6-Pk
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgzC-0005kn-Al
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkku9aH4T9JQtO9QmdQbLIfMKt6EPaHeWgWAoXaYqTk=;
 b=PtQwsc7NgaG2m05FYXLM7YdksSVoUPL373VM4JDDgEMXQ5b7SGGQx/mjnUxpu2V+likTXg
 TCrVPf0TRqxjdqSL1oIwhhbE4uUAHPZe0HM/elL+fzWEQ97m+2gfZa2CG0k4Mvl2jyWrsv
 pYmm0FdY/cPFUit+npQWYMNCgObkUpg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-NDZ2oySOMveDVwJosrRhog-1; Wed, 08 Feb 2023 04:43:26 -0500
X-MC-Unique: NDZ2oySOMveDVwJosrRhog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB218027FD;
 Wed,  8 Feb 2023 09:43:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A60F02166B29;
 Wed,  8 Feb 2023 09:43:22 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 08/13] vdpa: disable RAM block discard only for the first
 device
Date: Wed,  8 Feb 2023 10:42:48 +0100
Message-Id: <20230208094253.702672-9-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
index d99db0bd03..84a6b9690b 100644
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


