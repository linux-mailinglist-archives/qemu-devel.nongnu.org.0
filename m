Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055556B81F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:14:38 +0200 (CEST)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lwT-0000u6-JW
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9laC-0000vD-Hx
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9laA-0008Cv-SW
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YuPBIjrUa0U3M7cbkWobx/tLGS80+dJPnJAI01T0OnY=;
 b=MBYdsYIqnPBPUptbCXj31sXgehZjuSyHcfPrvAK6dbn2QI8/YxcuBp1tyKP6TZ7CFVXPiG
 OcmUBsovH0wgmd5C5aV6++B7s3SN4S5qzisHTx8oGG5J23QXnaJyR+ygoli9bLeSO9amtc
 mSU47kZOvPoAxdY8Maa9fLzJvp/B3H0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-XE_eFcUkM9uWFu_KOImOXQ-1; Fri, 08 Jul 2022 06:51:23 -0400
X-MC-Unique: XE_eFcUkM9uWFu_KOImOXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F4D8101A595;
 Fri,  8 Jul 2022 10:51:22 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFCE61121314;
 Fri,  8 Jul 2022 10:51:19 +0000 (UTC)
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
Subject: [PATCH 21/22] vdpa: Add device migration blocker
Date: Fri,  8 Jul 2022 12:50:12 +0200
Message-Id: <20220708105013.1899854-22-eperezma@redhat.com>
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

The device may need to add migration blockers. For example, if vdpa
device uses features not compatible with migration.

Add the possibility here.

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
index c1162daecc..764a81b57f 100644
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
@@ -1016,6 +1017,13 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
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
@@ -1057,6 +1065,9 @@ err_svq_setup:
         vhost_svq_stop(svq);
     }
 
+err_migration_blocker:
+    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
+
     return false;
 }
 
@@ -1073,6 +1084,9 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
         vhost_vdpa_svq_unmap_rings(dev, svq);
     }
 
+    if (v->migration_blocker) {
+        migrate_del_blocker(v->migration_blocker);
+    }
 }
 
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
-- 
2.31.1


