Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A668606613
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:45:36 +0200 (CEST)
Received: from localhost ([::1]:53436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYfm-0007Im-MP
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:45:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYcc-0008C2-Ds
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olXrV-0006Vc-5j
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:53:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olXrQ-00065s-F1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666281200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RamhPr+R79S4DWt0PCTa/7oGlJ1G2zaCAQ5LdEKZw3Y=;
 b=LpfLv1SNEfGRA0gupDK2yWOS65GWsFNo+gszDwnVmqNsMJYTRU+HsdowR4mf7VxCActGn4
 zZRDBku3N3Fx1GzvZyaVeBzmitEwbK5JIzBeHRSeLRqFXPAvtbHIz4etN4pXLM9W7u/vLU
 W0Hh1aO7NyBsgc6SvepEfes/tf5JS9M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-51VDzeblO7O4rDz06HO4yg-1; Thu, 20 Oct 2022 11:53:17 -0400
X-MC-Unique: 51VDzeblO7O4rDz06HO4yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81457804186;
 Thu, 20 Oct 2022 15:53:16 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CDD640CA41F;
 Thu, 20 Oct 2022 15:53:13 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>
Subject: [PATCH 3/4] vhost: use avail event idx on vhost_svq_kick
Date: Thu, 20 Oct 2022 17:52:50 +0200
Message-Id: <20221020155251.398735-4-eperezma@redhat.com>
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

So SVQ code knows if an event is needed.

The code is not reachable at the moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index f5c0fad3fc..f306ebef72 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -218,12 +218,22 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
 
 static void vhost_svq_kick(VhostShadowVirtqueue *svq)
 {
+    bool needs_kick;
+
     /*
      * We need to expose the available array entries before checking the used
      * flags
      */
     smp_mb();
-    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
+
+    if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
+        uint16_t avail_event = *(uint16_t *)(&svq->vring.used->ring[svq->vring.num]);
+        needs_kick = vring_need_event(avail_event, svq->shadow_avail_idx, svq->shadow_avail_idx - 1);
+    } else {
+        needs_kick = !(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY);
+    }
+
+    if (!needs_kick) {
         return;
     }
 
-- 
2.31.1


