Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C845EBBC9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:43:32 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5Fb-0007B2-R9
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53L-0003le-ET
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53J-0001ig-R5
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FD975SYmlJwwhn9UZUoZj7/QsX5Joxs8qt+mys0CNx4=;
 b=fChA/vDW6ngkftK9IEDnqGQl6vlGsjs+pCSIUXKEXjyHxY6WT4QoZ311y2MnH6+EAD6rq6
 UL9zv1Fdrx3q6yprBjYcWBNIeBnq4q2V858sxZ+Q2IlZ+QJQpNe5f3rMlTwITAgnLhyT/a
 nKkOLjYAy1mneH9bR9KEsbutNh/j17U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-WQaxQZzbMrWIlvrf3fbbmg-1; Tue, 27 Sep 2022 03:30:47 -0400
X-MC-Unique: WQaxQZzbMrWIlvrf3fbbmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48FAD185A78F;
 Tue, 27 Sep 2022 07:30:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E62D2166B26;
 Tue, 27 Sep 2022 07:30:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	stefanha@redhat.com
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 6/8] virtio-net: Update virtio-net curr_queue_pairs in vdpa
 backends
Date: Tue, 27 Sep 2022 15:30:20 +0800
Message-Id: <20220927073022.28378-7-jasowang@redhat.com>
In-Reply-To: <20220927073022.28378-1-jasowang@redhat.com>
References: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

It was returned as error before. Instead of it, simply update the
corresponding field so qemu can send it in the migration data.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Si-Wei Liu <si-wei.liu@oracle.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056..63a8332 100644
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
2.7.4


