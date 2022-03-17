Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85564DCDCD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:42:27 +0100 (CET)
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUv4s-0003zp-Q2
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:42:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUunc-0000eh-Fg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nUunZ-00067W-Oi
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647541473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+EiobyyqBfUJTUYk0WgZBrqFnD6RP5KGJVkzZLcgYyc=;
 b=MJXdc65mJjpsMPFQXzZm+Dt1QRLEqZys5DVvuXuCy4VPKRhgp9z2ARXJaPJ8vlMRTCVU0d
 9HKaEZ5J/qrW+jBDZMzH9RPzdXhAVAYpvh9PAqrppgiKNd/Ipmky3TqSychSZVFPehDjNB
 6xu6fAQDMDQ5dX5yUaAaI6yA9iSYF0c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-47n0H2udOG-9LUqVNNPqhw-1; Thu, 17 Mar 2022 14:24:30 -0400
X-MC-Unique: 47n0H2udOG-9LUqVNNPqhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC96F1C068D2;
 Thu, 17 Mar 2022 18:24:29 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B2021400E73;
 Thu, 17 Mar 2022 18:24:27 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 07/18] virtio: Make virtqueue_alloc_element non-static
Date: Thu, 17 Mar 2022 19:23:48 +0100
Message-Id: <20220317182400.651508-8-eperezma@redhat.com>
In-Reply-To: <20220317182400.651508-1-eperezma@redhat.com>
References: <20220317182400.651508-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So SVQ can allocate elements using it

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h | 1 +
 hw/virtio/virtio.c         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f095637058..6f4cccfd42 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -195,6 +195,7 @@ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
                     unsigned int len, unsigned int idx);
 
 void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem);
+void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num);
 void *virtqueue_pop(VirtQueue *vq, size_t sz);
 unsigned int virtqueue_drop_all(VirtQueue *vq);
 void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9e8f51dfb0..e143d900a1 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1376,7 +1376,7 @@ void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem)
                                                                         false);
 }
 
-static void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num)
+void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num)
 {
     VirtQueueElement *elem;
     size_t in_addr_ofs = QEMU_ALIGN_UP(sz, __alignof__(elem->in_addr[0]));
-- 
2.27.0


