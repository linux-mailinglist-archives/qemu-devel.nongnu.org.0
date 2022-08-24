Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B475A018C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:46:46 +0200 (CEST)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvOn-0002fZ-Mf
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEu-0007gf-3e
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEq-0005V9-S8
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661366187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoutYqkapS/nIMsepScl0jd/aod9k3GRqbKF46hCZW0=;
 b=adxO8Z6nZLm+2jLz4sEe4Z6olIlTNnTXJdgqT85m3zWyPd50h2km/8OS626ZBzyzp3t3zj
 AjBpJF+74uV+L67ckE967GREIvO926MX6qaVpK2o2aBlgb3PQMeMCgxAxCoJiRYJF97iN1
 QXS8vNlUyzpSD1wyK/PYlBHD5eZnOd4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-tP36kRF9MYqdDDUpy_rabQ-1; Wed, 24 Aug 2022 14:36:11 -0400
X-MC-Unique: tP36kRF9MYqdDDUpy_rabQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDE17101A56C;
 Wed, 24 Aug 2022 18:36:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70F032166B26;
 Wed, 24 Aug 2022 18:36:08 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Subject: [PATCH v2 5/6] virtio-net: Update virtio-net curr_queue_pairs in vdpa
 backends
Date: Wed, 24 Aug 2022 20:35:50 +0200
Message-Id: <20220824183551.197052-6-eperezma@redhat.com>
In-Reply-To: <20220824183551.197052-1-eperezma@redhat.com>
References: <20220824183551.197052-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

It was returned as error before. Instead of it, simply update the
corresponding field so qemu can send it in the migration data.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..63a8332cd0 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1412,19 +1412,14 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
         return VIRTIO_NET_ERR;
     }
 
-    /* Avoid changing the number of queue_pairs for vdpa device in
-     * userspace handler. A future fix is needed to handle the mq
-     * change in userspace handler with vhost-vdpa. Let's disable
-     * the mq handling from userspace for now and only allow get
-     * done through the kernel. Ripples may be seen when falling
-     * back to userspace, but without doing it qemu process would
-     * crash on a recursive entry to virtio_net_set_status().
-     */
+    n->curr_queue_pairs = queue_pairs;
     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
-        return VIRTIO_NET_ERR;
+        /*
+         * Avoid updating the backend for a vdpa device: We're only interested
+         * in updating the device model queues.
+         */
+        return VIRTIO_NET_OK;
     }
-
-    n->curr_queue_pairs = queue_pairs;
     /* stop the backend before changing the number of queue_pairs to avoid handling a
      * disabled queue */
     virtio_net_set_status(vdev, vdev->status);
-- 
2.31.1


