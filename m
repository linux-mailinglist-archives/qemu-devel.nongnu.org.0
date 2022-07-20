Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67157B3A5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:19:50 +0200 (CEST)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5rw-0001Qs-P4
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cc-0000BH-9u
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5ca-0001Re-LR
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTuZsaVTp6bB4Hy8t2eX0EL6FRWz9JmwozvVVhtmXhw=;
 b=DKayKqcKEx0paNiEGbY0huH+dY916i5K4F9LfYsZRFcyOUACNE1NpFE5oZclmi5Iox+qLS
 O+nNzhulPxlAQQtHDhaoYOVDEbAEaLzlye/yMIjUkmAivd6jG+aMf62RDXwRxpEbOL1wPe
 hZL/a8O0wa8jVgSPWJY2HaY8hsRqknQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-0GgylNSwMLaFuTK7gRwt3Q-1; Wed, 20 Jul 2022 05:03:49 -0400
X-MC-Unique: 0GgylNSwMLaFuTK7gRwt3Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 243083816845;
 Wed, 20 Jul 2022 09:03:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E698492C3B;
 Wed, 20 Jul 2022 09:03:46 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 10/25] vhost: Track number of descs in SVQDescState
Date: Wed, 20 Jul 2022 17:02:58 +0800
Message-Id: <20220720090313.55169-11-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

A guest's buffer continuos on GPA may need multiple descriptors on
qemu's VA, so SVQ should track its length sepparatedly.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 4 ++--
 hw/virtio/vhost-shadow-virtqueue.h | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e4c09e2..8314405 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -257,6 +257,7 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
     }
 
     svq->desc_state[qemu_head].elem = elem;
+    svq->desc_state[qemu_head].ndescs = ndescs;
     vhost_svq_kick(svq);
     return 0;
 }
@@ -418,8 +419,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    num = svq->desc_state[used_elem.id].elem->in_num +
-          svq->desc_state[used_elem.id].elem->out_num;
+    num = svq->desc_state[used_elem.id].ndescs;
     last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index d646c35..5c7e7cb 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,12 @@
 
 typedef struct SVQDescState {
     VirtQueueElement *elem;
+
+    /*
+     * Number of descriptors exposed to the device. May or may not match
+     * guest's
+     */
+    unsigned int ndescs;
 } SVQDescState;
 
 /* Shadow virtqueue to relay notifications */
-- 
2.7.4


