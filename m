Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BFC5797A6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:26:38 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkR2-0005hB-3u
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDjz9-0000jo-4Q
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDjz7-0005Cc-Mm
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658224665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEdG57l9gvKRzj3lLVhMYh2oZbsjhAPDKkn61ZkC7/0=;
 b=WqqAQrbQ9W6vC9AC+S9B3RHJM4KNTiK+71e2wLSA/NyGmPbhUW0sXEah0gnkTqd3Vq0yNE
 yKPHhGSvXeS+hFRRqFEbEmnEuEdQ8qw7aqXCgONKSoQTAmjCap8vxRQb7NVltRqVOWrPK8
 Ah/gsd3KSnyMKbVBKCJaKc9McDmWilU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-1aV56RUWPBqfqzg8J02x5g-1; Tue, 19 Jul 2022 05:57:36 -0400
X-MC-Unique: 1aV56RUWPBqfqzg8J02x5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9376B800124;
 Tue, 19 Jul 2022 09:57:35 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DB4718EA8;
 Tue, 19 Jul 2022 09:57:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH v5 19/20] vdpa: Add device migration blocker
Date: Tue, 19 Jul 2022 11:56:28 +0200
Message-Id: <20220719095629.3031338-20-eperezma@redhat.com>
In-Reply-To: <20220719095629.3031338-1-eperezma@redhat.com>
References: <20220719095629.3031338-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

Since the vhost-vdpa device is exposing _F_LOG, adding a migration blocker if
it uses CVQ.

However, qemu is able to migrate simple devices with no CVQ as long as
they use SVQ. To allow it, add a placeholder error to vhost_vdpa, and
only add to vhost_dev when used. vhost_dev machinery place the migration
blocker if needed.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

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
index beaaa7049a..291cd19054 100644
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
+            return false;
+        }
+    }
+
     for (i = 0; i < v->shadow_vqs->len; ++i) {
         VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
@@ -1064,6 +1072,10 @@ err:
         vhost_svq_stop(svq);
     }
 
+    if (v->migration_blocker) {
+        migrate_del_blocker(v->migration_blocker);
+    }
+
     return false;
 }
 
@@ -1083,6 +1095,9 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
         }
     }
 
+    if (v->migration_blocker) {
+        migrate_del_blocker(v->migration_blocker);
+    }
     return true;
 }
 
-- 
2.31.1


