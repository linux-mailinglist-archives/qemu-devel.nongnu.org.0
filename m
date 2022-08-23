Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B4F59EB9F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:58:03 +0200 (CEST)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQZ6A-0005v2-DR
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgq-0000QK-3c
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgl-0004WC-U2
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661279494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6UNOTTwjb9/JGAV61+drQA/RK8go9Kptgh7fY2TS9c=;
 b=XxjCYzRY40uj4Sj3n5TR3eXVo5GyPPQysLLAxHh+oUvK1x8UQVurUdjauFmiK/WaDHiEZa
 L/13Pet4dhWTP5NbV2V74r1Iq4X08Ih73sXfQ5vRjrowEAVHDUzpjPTCoKEXnorH45AyWD
 xPAPW4bs5hIF6FwJKrIKxuEN+tub/78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-H2uAHNXfN8uRzvn8xJoaKw-1; Tue, 23 Aug 2022 14:31:30 -0400
X-MC-Unique: H2uAHNXfN8uRzvn8xJoaKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9D988039CF;
 Tue, 23 Aug 2022 18:31:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5096C15BB3;
 Tue, 23 Aug 2022 18:31:24 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v10 12/12] vdpa: Delete CVQ migration blocker
Date: Tue, 23 Aug 2022 20:30:37 +0200
Message-Id: <20220823183037.98470-13-eperezma@redhat.com>
In-Reply-To: <20220823183037.98470-1-eperezma@redhat.com>
References: <20220823183037.98470-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

We can restore the device state in the destination via CVQ now. Remove
the migration blocker.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 -
 hw/virtio/vhost-vdpa.c         | 15 ---------------
 net/vhost-vdpa.c               |  2 --
 3 files changed, 18 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index d10a89303e..1111d85643 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -35,7 +35,6 @@ typedef struct vhost_vdpa {
     bool shadow_vqs_enabled;
     /* IOVA mapping used by the Shadow Virtqueue */
     VhostIOVATree *iova_tree;
-    Error *migration_blocker;
     GPtrArray *shadow_vqs;
     const VhostShadowVirtqueueOps *shadow_vq_ops;
     void *shadow_vq_ops_opaque;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 23ae5ef48b..7468e44b87 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1033,13 +1033,6 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
         return true;
     }
 
-    if (v->migration_blocker) {
-        int r = migrate_add_blocker(v->migration_blocker, &err);
-        if (unlikely(r < 0)) {
-            return false;
-        }
-    }
-
     for (i = 0; i < v->shadow_vqs->len; ++i) {
         VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
@@ -1082,10 +1075,6 @@ err:
         vhost_svq_stop(svq);
     }
 
-    if (v->migration_blocker) {
-        migrate_del_blocker(v->migration_blocker);
-    }
-
     return false;
 }
 
@@ -1101,10 +1090,6 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
         vhost_vdpa_svq_unmap_rings(dev, svq);
     }
-
-    if (v->migration_blocker) {
-        migrate_del_blocker(v->migration_blocker);
-    }
 }
 
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 640434d1ea..6ce68fcd3f 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -555,8 +555,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
-        error_setg(&s->vhost_vdpa.migration_blocker,
-                   "Migration disabled: vhost-vdpa uses CVQ.");
     }
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
-- 
2.31.1


