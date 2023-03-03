Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08B6A9DA5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY99u-0000iO-OX; Fri, 03 Mar 2023 12:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99s-0000cO-BJ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99q-0005eQ-Sz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQxGvAul/Q+ZehzUo/rRKfGfTW9rsOXJygSItA3NCgA=;
 b=EJvn1/daEtCqvP00r06Kc/RYby0fyWSxp3LM6XYMf9wslkBz613HFelMPIwWPpjJgw/Crw
 u2iQjfMegANE8SW97eW0H5d0KbzPLF0lheATCH/kiDOzTTyoavtVJk3kAKem0p0D0nZwNh
 +qlrs9jy2065qT0soGks1B3ZGxiLjTQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-W8IVbMRWOdmftCiWT_0Txw-1; Fri, 03 Mar 2023 12:25:23 -0500
X-MC-Unique: W8IVbMRWOdmftCiWT_0Txw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14B5D3814591;
 Fri,  3 Mar 2023 17:25:22 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 246BD440D8;
 Fri,  3 Mar 2023 17:25:19 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Lei Yang <leiyang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Shannon Nelson <snelson@pensando.io>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v5 10/14] vdpa net: block migration if the device has CVQ
Date: Fri,  3 Mar 2023 18:24:41 +0100
Message-Id: <20230303172445.1089785-11-eperezma@redhat.com>
In-Reply-To: <20230303172445.1089785-1-eperezma@redhat.com>
References: <20230303172445.1089785-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

Devices with CVQ need to migrate state beyond vq state.  Leaving this to
future series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v5: Fix comment (s/v/s->vhost_vdpa/).
v3: Migration blocker is registered in vhost_dev.
---
 include/hw/virtio/vhost-vdpa.h | 1 +
 hw/virtio/vhost-vdpa.c         | 1 +
 net/vhost-vdpa.c               | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 4a7d396674..c278a2a8de 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -50,6 +50,7 @@ typedef struct vhost_vdpa {
     const VhostShadowVirtqueueOps *shadow_vq_ops;
     void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
+    Error *migration_blocker;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 49afa59261..e9167977d5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -438,6 +438,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->msg_type = VHOST_IOTLB_MSG_V2;
     vhost_vdpa_init_svq(dev, v);
 
+    error_propagate(&dev->migration_blocker, v->migration_blocker);
     if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 167b43679d..533ba54317 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -828,6 +828,15 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
         s->vhost_vdpa.shadow_vq_ops_opaque = s;
+
+        /*
+         * TODO: We cannot migrate devices with CVQ as there is no way to set
+         * the device state (MAC, MQ, etc) before starting the datapath.
+         *
+         * Migration blocker ownership now belongs to s->vhost_vdpa.
+         */
+        error_setg(&s->vhost_vdpa.migration_blocker,
+                   "net vdpa cannot migrate with CVQ feature");
     }
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
-- 
2.31.1


