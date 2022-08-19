Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7459A2F7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:47:26 +0200 (CEST)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP65d-00049r-Tw
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5ZA-0001g4-Bw
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Z8-0003Rh-PY
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660929230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoutYqkapS/nIMsepScl0jd/aod9k3GRqbKF46hCZW0=;
 b=c66M0NkmMd3CUKX6J6s21l2fgI0U9RbU89ZplJVd2//37g4f4zy4wcdJHYVxa36z6DW5Gq
 fuA3s+WCOo/NheioFTNI8Lu6fTvOdL0kxZQ4IKhz7AL86TFGU0V40o4SNlXjU5TpjcoNHg
 4ZdJq2kjhT15R56J4QDaVcljna9YVsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-w261hrxRN6ugZDoYdbcFEw-1; Fri, 19 Aug 2022 13:13:47 -0400
X-MC-Unique: w261hrxRN6ugZDoYdbcFEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E53D804197;
 Fri, 19 Aug 2022 17:13:46 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECE7640CFD0A;
 Fri, 19 Aug 2022 17:13:43 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in vdpa
 backends
Date: Fri, 19 Aug 2022 19:13:28 +0200
Message-Id: <20220819171329.3597027-5-eperezma@redhat.com>
In-Reply-To: <20220819171329.3597027-1-eperezma@redhat.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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


