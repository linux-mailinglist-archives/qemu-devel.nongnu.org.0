Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6D6116C8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:04:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooRpR-0007e1-OL; Fri, 28 Oct 2022 12:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooRpB-0007Fm-Sv
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:03:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooRp9-0002aQ-9k
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666972989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x22TiB9j/DWlPE0VnTD3ZK7M9ov6FrfKxeqvh/djwuY=;
 b=ManEN9sKLzKek1+HxT1L8w02Co9s52YqV/0dIQUEp2q2zUQH2Ly+gffx+8CAQhmF+MUV+r
 2YP+SvJCvkzhhpJixoVSJorNA4wmiyN9pGTXAkeW0lBYAH7ragIkQMAWYrbEAOTdulHly7
 eUYAbhlo+Rvhqaa7Ub2qzrzi/eJZjtE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-7PskYx9TO-C88JSQTPcOEA-1; Fri, 28 Oct 2022 12:03:08 -0400
X-MC-Unique: 7PskYx9TO-C88JSQTPcOEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80444101A588
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 16:03:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5BCB4EA55;
 Fri, 28 Oct 2022 16:02:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 2/4] vhost: convert byte order on SVQ used event write
Date: Fri, 28 Oct 2022 18:02:49 +0200
Message-Id: <20221028160251.268607-3-eperezma@redhat.com>
In-Reply-To: <20221028160251.268607-1-eperezma@redhat.com>
References: <20221028160251.268607-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This causes errors on virtio modern devices on big endian hosts

Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event idx")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 70766ea740..467099f5d9 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
 {
     if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
         uint16_t *used_event = &svq->vring.avail->ring[svq->vring.num];
-        *used_event = svq->shadow_used_idx;
+        *used_event = cpu_to_le16(svq->shadow_used_idx);
     } else {
         svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
     }
-- 
2.31.1


