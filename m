Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150633C722
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:53:58 +0100 (CET)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtHp-00021t-EB
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDf-0005X2-ID
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtDd-00045p-4p
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbWIH/kkEto2LZLZZe4BV9lZdunPIm7cSJBarpqzcYE=;
 b=HPf3O8suTSvUPppCF40/PlgdgSqsw50ijNZwv6bLGyZyBW3VVCWaPiCRroF+AmJtBrSUsE
 i6p0ESAf1/Z0fp/cX2SzJdUIISqtfMl82fPUCA8BHn7m+JXTeeDDpSE7VknOC7jrv8njhD
 E/9KnWXyRc9sCYuqwyJ7/zbc0Hm6I34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-aOCnnCaZOrCh2KrLGTjMAw-1; Mon, 15 Mar 2021 15:49:33 -0400
X-MC-Unique: aOCnnCaZOrCh2KrLGTjMAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 400F4801817;
 Mon, 15 Mar 2021 19:49:32 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C23E85F706;
 Mon, 15 Mar 2021 19:49:22 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 07/13] vhost: Avoid re-set masked notifier in shadow vq
Date: Mon, 15 Mar 2021 20:48:36 +0100
Message-Id: <20210315194842.277740-8-eperezma@redhat.com>
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all the shadow virtqueue device is done in software, we can avoid
the write syscall.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 8f6ffa729a..b6bab438d6 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -41,6 +41,9 @@ typedef struct VhostShadowVirtqueue {
          * set when the masked notifier has no uses
          */
         QemuEvent is_free;
+
+        /* Avoid re-sending signals */
+        bool signaled;
     } masked_notifier;
 
     /* Virtio queue shadowing */
@@ -81,7 +84,8 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
         unsigned n = virtio_get_queue_index(svq->vq);
         virtio_queue_invalidate_signalled_used(svq->vdev, n);
         virtio_notify_irqfd(svq->vdev, svq->vq);
-    } else {
+    } else if (!svq->masked_notifier.signaled) {
+        svq->masked_notifier.signaled = true;
         event_notifier_set(svq->masked_notifier.n);
     }
 
@@ -110,6 +114,7 @@ static void vhost_shadow_vq_handle_call(EventNotifier *n)
  */
 void vhost_shadow_vq_mask(VhostShadowVirtqueue *svq, EventNotifier *masked)
 {
+    svq->masked_notifier.signaled = false;
     qatomic_store_release(&svq->masked_notifier.n, masked);
 }
 
-- 
2.27.0


