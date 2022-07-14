Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B41575375
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:54:18 +0200 (CEST)
Received: from localhost ([::1]:50760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC26T-0007k7-O7
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lv-0008BB-Hp
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1ls-0003V4-1c
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657816376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oF55J2F/WdWJFH5uGX59cHC74FkBU6RmtMqfQyGsPgw=;
 b=a0o/XQvfgk1o5CnpIZ8rQipq8RD8GTTV5fxVR+bR/2oJRWQ/h50vTeY4Bn84EbVx4k1gMR
 oq7+1jn4gf9NUc2gDPjjU2fgeraLm/oweTQ835ah+fE2JQrt5tVChr9PBZY57rUx+otEXi
 pjXSTnm2AmVNbnegqyuq/QjnOiy7A4k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-ynhX6d-3M5ezNC4aNdFCbA-1; Thu, 14 Jul 2022 12:32:52 -0400
X-MC-Unique: ynhX6d-3M5ezNC4aNdFCbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 316DC1C05ABC;
 Thu, 14 Jul 2022 16:32:52 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BD241121314;
 Thu, 14 Jul 2022 16:32:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v2 18/19] vdpa: Add device migration blocker
Date: Thu, 14 Jul 2022 18:31:49 +0200
Message-Id: <20220714163150.2536327-19-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-1-eperezma@redhat.com>
References: <20220714163150.2536327-1-eperezma@redhat.com>
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

Since the vhost-vdpa device is exposing _F_LOG, adding a migration blocker if
it uses CVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 1111d85643..d10a89303e 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -35,6 +35,7 @@ typedef struct vhost_vdpa {
     bool shadow_vqs_enabled;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
+    Error *migration_blocker;
     GPtrArray *shadow_vqs;
     const VhostShadowVirtqueueOps *shadow_vq_ops;
     void *shadow_vq_ops_opaque;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index beaaa7049a..795ed5a049 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -20,6 +20,7 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
 #include "exec/address-spaces.h"
+#include "migration/blocker.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
@@ -1022,6 +1023,13 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
         return true;
     }
 
+    if (v->migration_blocker) {
+        int r = migrate_add_blocker(v->migration_blocker, &err);
+        if (unlikely(r < 0)) {
+            goto err_migration_blocker;
+        }
+    }
+
     for (i = 0; i < v->shadow_vqs->len; ++i) {
         VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
@@ -1064,6 +1072,9 @@ err:
         vhost_svq_stop(svq);
     }
 
+err_migration_blocker:
+    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
+
     return false;
 }
 
@@ -1083,6 +1094,9 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
         }
     }
 
+    if (v->migration_blocker) {
+        migrate_del_blocker(v->migration_blocker);
+    }
     return true;
 }
 
-- 
2.31.1


