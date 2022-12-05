Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7F642E4A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:07:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Eur-0000WH-KM; Mon, 05 Dec 2022 12:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Etx-0000VT-Pc
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2Ets-0002nw-1j
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNbGMGhn4osZDau4Cy6mZ/L5GKVeEbNHeE8/WkHLsBc=;
 b=KaGCB9deP13ZOBuMJJcSgfS6uEQFSeYZpXWlu5yKG6yYkPpm9sLA1cb9TWPR2hh4omhdHE
 3VCPw6eDRdAo2+EqS4Rr8rkr5Xis0hXk6cK7WzlggXo30JHmai24bOeAahjM4LCSNuECaC
 8LFOFLSXCPnCOnelhKmjNCNc+2MaSjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-0-OCdQ-SPFK8tWVLumWFmA-1; Mon, 05 Dec 2022 12:04:59 -0500
X-MC-Unique: 0-OCdQ-SPFK8tWVLumWFmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75849857F8F;
 Mon,  5 Dec 2022 17:04:58 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1298C1912A;
 Mon,  5 Dec 2022 17:04:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH for 8.0 05/13] virtio: Specify uint32_t as
 VirtQueueElementOld members type
Date: Mon,  5 Dec 2022 18:04:28 +0100
Message-Id: <20221205170436.2977336-6-eperezma@redhat.com>
In-Reply-To: <20221205170436.2977336-1-eperezma@redhat.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

This struct will be the one used as a base to serialize and deserialize
the virtqueue elements within this RFC. The VMState fields are way more
simpler using this struct.

TODO: Use VirtQueueElement to serialize and deserialize inflight
elements.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/virtio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..6efff3d441 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2288,9 +2288,9 @@ unsigned int virtqueue_drop_all(VirtQueue *vq)
  * used before the change.
  */
 typedef struct VirtQueueElementOld {
-    unsigned int index;
-    unsigned int out_num;
-    unsigned int in_num;
+    uint32_t index;
+    uint32_t out_num;
+    uint32_t in_num;
     hwaddr in_addr[VIRTQUEUE_MAX_SIZE];
     hwaddr out_addr[VIRTQUEUE_MAX_SIZE];
     struct iovec in_sg[VIRTQUEUE_MAX_SIZE];
-- 
2.31.1


