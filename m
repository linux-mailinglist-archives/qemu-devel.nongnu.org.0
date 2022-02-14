Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533554B5ABB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:54:59 +0100 (CET)
Received: from localhost ([::1]:33772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhR3-00031V-UH
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgr6-0003Xa-2n
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nJgr3-0001IH-O0
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644866264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttVEo/+ZROmIGEL207zZe/LUPDUmfNooymurI+X1u9g=;
 b=YChrs8csW9kCxw6Lm4C37V3mu4XdSWTNYyPssRzwO1VOWQLg29uMZwl5psoEtmbTHALgPY
 ArdoM7rSimYdZ+obMYgJEQS8o/4LXWh3sn52v26QMiuFfp1TPiOnPUCy+mUtpfV3yTBpxX
 exV0bagAHlHEj0KaIPZgHV7lcMHRcn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-wmcmhC3uNQGIvCn9SfpCXA-1; Mon, 14 Feb 2022 14:17:42 -0500
X-MC-Unique: wmcmhC3uNQGIvCn9SfpCXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC96100C661;
 Mon, 14 Feb 2022 19:17:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A26725FC08;
 Mon, 14 Feb 2022 19:17:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 8/9] vhost: Add vhost_svq_start_op
Date: Mon, 14 Feb 2022 20:16:34 +0100
Message-Id: <20220214191635.1604932-9-eperezma@redhat.com>
In-Reply-To: <20220214191635.1604932-1-eperezma@redhat.com>
References: <20220214191635.1604932-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 4 +++-
 hw/virtio/vhost-shadow-virtqueue.c | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 767b0a82ba..8f2377bbc4 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -15,11 +15,13 @@
 #include "hw/virtio/vhost-iova-tree.h"
 
 typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
-
+typedef bool (*vhost_svq_start_op)(VhostShadowVirtqueue *svq,
+                                   VirtIODevice *vdev);
 typedef void (*VirtQueueElementCallback)(VirtIODevice *vdev,
                                          const VirtQueueElement *elem);
 
 typedef struct VhostShadowVirtqueueOps {
+    vhost_svq_start_op start;
     VirtQueueElementCallback used_elem_handler;
 } VhostShadowVirtqueueOps;
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 26938b059c..18cdb35ea3 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -783,6 +783,10 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
         svq->vring.desc[i].next = cpu_to_le16(i + 1);
     }
+
+    if (svq->ops && svq->ops->start) {
+        svq->ops->start(svq, vdev);
+    }
 }
 
 /**
-- 
2.27.0


