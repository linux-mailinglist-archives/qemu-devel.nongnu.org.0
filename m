Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C462C1DE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:08:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovK0B-0007lN-W0; Wed, 16 Nov 2022 10:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ovJzr-0007MV-T1
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:06:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ovJzo-00065V-Pl
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668611194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+au/UM9VIHTmPOqBDQ2vQGnj810Su87nJuzkIxq8kA=;
 b=HDxlgE+Q1c3t6ps+7270esQNMiPmS8OaldKlNL8s0pUTvogXfP/QH0f4QU739z5+HwpynH
 cCZyMFQqgTbF1QmmFJGLbixp+fgOko/HGO3mvrpjn6s6tRuOI/M5vmxO/Bu+VAzIq1ds35
 Gm5Brdmo3PQPTUrVI/eliFzXp6+DjYk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-9Gm-IvmuNJy1Q4ZfMHUb3w-1; Wed, 16 Nov 2022 10:06:24 -0500
X-MC-Unique: 9Gm-IvmuNJy1Q4ZfMHUb3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5827803D49;
 Wed, 16 Nov 2022 15:06:23 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E5C8140EBF3;
 Wed, 16 Nov 2022 15:06:20 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 kvm@vger.kernel.org
Subject: [PATCH for 8.0 v7 05/10] vdpa: move SVQ vring features check to net/
Date: Wed, 16 Nov 2022 16:05:51 +0100
Message-Id: <20221116150556.1294049-6-eperezma@redhat.com>
In-Reply-To: <20221116150556.1294049-1-eperezma@redhat.com>
References: <20221116150556.1294049-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

The next patches will start control SVQ if possible. However, we don't
know if that will be possible at qemu boot anymore.

Since the moved checks will be already evaluated at net/ to know if it
is ok to shadow CVQ, move them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
 net/vhost-vdpa.c       |  3 ++-
 2 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 3df2775760..146f0dcb40 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
     return ret;
 }
 
-static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
-                               Error **errp)
+static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v)
 {
     g_autoptr(GPtrArray) shadow_vqs = NULL;
-    uint64_t dev_features, svq_features;
-    int r;
-    bool ok;
-
-    if (!v->shadow_vqs_enabled) {
-        return 0;
-    }
-
-    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
-    if (r != 0) {
-        error_setg_errno(errp, -r, "Can't get vdpa device features");
-        return r;
-    }
-
-    svq_features = dev_features;
-    ok = vhost_svq_valid_features(svq_features, errp);
-    if (unlikely(!ok)) {
-        return -1;
-    }
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
@@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     }
 
     v->shadow_vqs = g_steal_pointer(&shadow_vqs);
-    return 0;
 }
 
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
@@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
-    ret = vhost_vdpa_init_svq(dev, v, errp);
-    if (ret) {
-        goto err;
-    }
-
+    vhost_vdpa_init_svq(dev, v);
     vhost_vdpa_get_iova_range(v);
 
     if (!vhost_vdpa_first_dev(dev)) {
@@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
                                VIRTIO_CONFIG_S_DRIVER);
 
     return 0;
-
-err:
-    ram_block_discard_disable(false);
-    return ret;
 }
 
 static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e98d5f5eac..dd9cea42d0 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error **errp)
     if (invalid_dev_features) {
         error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
                    invalid_dev_features);
+        return false;
     }
 
-    return !invalid_dev_features;
+    return vhost_svq_valid_features(features, errp);
 }
 
 static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
-- 
2.31.1


