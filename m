Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8558A0F4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:57:05 +0200 (CEST)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJg1m-0003uR-UY
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfbV-0000XX-MV
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfbU-00037h-2u
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659637791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AyVpOpcBqShcr0HdWILIr+nUPv4LqmtbwcLeKqfGY58=;
 b=T8W2tp2B8/LmWnimMATPt2qr9gex3WKpgl/gRCdFkwRC2lrmpMmWJ7rduZ9F+HG8kHV6bX
 PyV/8CHI8iuT96JPsx7dVvBJ2RC/mxIBODUNeu+aZ6AiV+ypcEvzsRsMa6OtPWUItnI80E
 +LsdfqO89PqoSoaHvlCUZj/cRjhVWXk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-kAo1-TbaMACR-KKU25COpg-1; Thu, 04 Aug 2022 14:29:47 -0400
X-MC-Unique: kAo1-TbaMACR-KKU25COpg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2264F1C01B2F;
 Thu,  4 Aug 2022 18:29:47 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135FD492C3B;
 Thu,  4 Aug 2022 18:29:42 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH v7 12/12] vdpa: Delete CVQ migration blocker
Date: Thu,  4 Aug 2022 20:28:52 +0200
Message-Id: <20220804182852.703398-13-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-1-eperezma@redhat.com>
References: <20220804182852.703398-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

We can restore the device state in the destination via CVQ now. Remove
the migration blocker.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 -
 hw/virtio/vhost-vdpa.c         | 14 --------------
 net/vhost-vdpa.c               |  2 --
 3 files changed, 17 deletions(-)

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
index 7e28d2f674..4b0cfc0f56 100644
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
 
@@ -1105,9 +1094,6 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
         }
     }
 
-    if (v->migration_blocker) {
-        migrate_del_blocker(v->migration_blocker);
-    }
     return true;
 }
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4f1524c2e9..7c0d600aea 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -558,8 +558,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
-        error_setg(&s->vhost_vdpa.migration_blocker,
-                   "Migration disabled: vhost-vdpa uses CVQ.");
     }
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
-- 
2.31.1


