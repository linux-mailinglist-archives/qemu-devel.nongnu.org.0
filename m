Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F5606985
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 22:28:28 +0200 (CEST)
Received: from localhost ([::1]:57216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZHd-0002xw-Ga
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:24:41 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYtp-0001wi-2l
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olXrS-0006Pz-Mk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olXrD-00065Q-7q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666281197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wxZEbQecvH0VDpYnnCfOiDlaLCxR12ly1QlIET+pvw=;
 b=KvDGFmsWpDf5R772+queO7igBTwrQGfz+KjOptu6fDxY5hR/WigLX7K3CsxJMp9seGF8t/
 hjM7AlK79foP3b+4wgh6i+kENToBvaDJiHASCi3D6Lcox8JJh/wyC8td2NWNXBLm833NV0
 Q/1uRXvh1dvqHZkB5ThciF4gp+ToZRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-bTDuVD0bMF2gN0OHYXojmQ-1; Thu, 20 Oct 2022 11:53:15 -0400
X-MC-Unique: bTDuVD0bMF2gN0OHYXojmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAE0E10115F5;
 Thu, 20 Oct 2022 15:53:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FBE940CA41E;
 Thu, 20 Oct 2022 15:53:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>
Subject: [PATCH 2/4] vhost: toggle device callbacks using used event idx
Date: Thu, 20 Oct 2022 17:52:49 +0200
Message-Id: <20221020155251.398735-3-eperezma@redhat.com>
In-Reply-To: <20221020155251.398735-1-eperezma@redhat.com>
References: <20221020155251.398735-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually use the new field of the used ring and tell the device if SVQ
wants to be notified.

The code is not reachable at the moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index a518f84772..f5c0fad3fc 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -369,15 +369,27 @@ static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
  */
 static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
 {
-    svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
-    /* Make sure the flag is written before the read of used_idx */
+    if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
+        uint16_t *used_event = (uint16_t *)&svq->vring.avail->ring[svq->vring.num];
+        *used_event = svq->shadow_used_idx;
+    } else {
+        svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
+    }
+
+    /* Make sure the event is enabled before the read of used_idx */
     smp_mb();
     return !vhost_svq_more_used(svq);
 }
 
 static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
 {
-    svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
+    /*
+     * No need to disable notification in the event idx case, since used event
+     * index is already an index too far away.
+     */
+    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
+        svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
+    }
 }
 
 static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
-- 
2.31.1


