Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F043893EE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:38:13 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPD2-000828-7i
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5f-0003j9-KR
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP5d-0005W1-Tw
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBra4ZJJZMDqGQDXeQJipcotZaMkdrf847TS/vCHij4=;
 b=RFRsrTir/XUFDj45F7QklKN06TavUPoTJrwiTgVBxH32Bvaw7OfgeKTI3dxZkL9eHknXAC
 wqJ6MSvPywcLJEFrm/KtMA04lTKe8Ca/2Rkd924ylI6j+UAiYLViQYvjqbmnfU/xIx85yr
 LY4czL+DwF4UOPrGGSjNz+el0JuI1tQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-m1Yd4A-3NjOhezsZDz7ahw-1; Wed, 19 May 2021 12:30:31 -0400
X-MC-Unique: m1Yd4A-3NjOhezsZDz7ahw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 690621007477;
 Wed, 19 May 2021 16:30:30 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D75DA5D6AC;
 Wed, 19 May 2021 16:30:08 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 09/29] vhost: Avoid re-set masked notifier in shadow vq
Date: Wed, 19 May 2021 18:28:43 +0200
Message-Id: <20210519162903.1172366-10-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all the shadow virtqueue device is done in software, we can avoid
the write syscall.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 7d76e271a5..c22acb4605 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -35,6 +35,9 @@ typedef struct VhostShadowVirtqueue {
     /* (Possible) masked notifier */
     struct {
         EventNotifier *n;
+
+        /* Avoid re-sending signals */
+        bool signaled;
     } masked_notifier;
 
     /* Virtio queue shadowing */
@@ -70,7 +73,8 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
         unsigned n = virtio_get_queue_index(svq->vq);
         virtio_queue_invalidate_signalled_used(svq->vdev, n);
         virtio_notify_irqfd(svq->vdev, svq->vq);
-    } else {
+    } else if (!svq->masked_notifier.signaled) {
+        svq->masked_notifier.signaled = true;
         event_notifier_set(svq->masked_notifier.n);
     }
 }
@@ -93,6 +97,7 @@ static void vhost_shadow_vq_handle_call(EventNotifier *n)
  */
 void vhost_shadow_vq_mask(VhostShadowVirtqueue *svq, EventNotifier *masked)
 {
+    svq->masked_notifier.signaled = false;
     svq->masked_notifier.n = masked;
 }
 
-- 
2.27.0


