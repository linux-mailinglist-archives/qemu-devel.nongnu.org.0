Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E25A1956
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 21:14:31 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRIJC-0003EC-BS
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 15:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9R-00005z-Qg
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9Q-0006Rb-9J
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661454259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoutYqkapS/nIMsepScl0jd/aod9k3GRqbKF46hCZW0=;
 b=Pr6LbfevWVtVqshcANWs+4TAZg4L0VFjdmwnFQJrYxs+laiOAsVfUXt7PMOF04jK8RJVRt
 4fUgFkfgehZ8ncnjWwrEkMVekXIxHw0EKwX/Qlgja5xKL7JN9+kFuB6cvRJCownMo0FWh7
 2ByRf1S7MAWL2S2hO6dKvfaaskOnl3g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-IEk8g8MFM7W2t7dXG8LUlA-1; Thu, 25 Aug 2022 15:04:18 -0400
X-MC-Unique: IEk8g8MFM7W2t7dXG8LUlA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95DE33C025D2;
 Thu, 25 Aug 2022 19:04:17 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0228492C3B;
 Thu, 25 Aug 2022 19:04:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 5/6] virtio-net: Update virtio-net curr_queue_pairs in vdpa
 backends
Date: Thu, 25 Aug 2022 21:03:55 +0200
Message-Id: <20220825190356.317527-6-eperezma@redhat.com>
In-Reply-To: <20220825190356.317527-1-eperezma@redhat.com>
References: <20220825190356.317527-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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


