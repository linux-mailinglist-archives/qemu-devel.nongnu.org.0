Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A5741E849
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:24:07 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCtq-00085x-Kb
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCjM-0005Uu-KZ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCjL-0005q0-3a
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxfcG9Hve63YPITjYpliIf6LuctyQ6i/mHcmM3wdCOw=;
 b=Z+LjKCQVSRPwfv4xe0WuKR4ECo6KLpUiFR+MhdY/8PYsInJn9tUAA9Vg9pfwD0h6ckbwiY
 ROn0qytD71uJLwBMFf9ZjmHNw4n++DBxt/f4z0fbTkXab3DW/9C8urhknYP430DnSX8tTy
 pE/E5oeKHurOQBNZdMY1opO25pPLJog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-W5YLp4aZNsSLyvgwVv0_Pw-1; Fri, 01 Oct 2021 03:13:12 -0400
X-MC-Unique: W5YLp4aZNsSLyvgwVv0_Pw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA6F18D6A3E;
 Fri,  1 Oct 2021 07:13:10 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1761652A3;
 Fri,  1 Oct 2021 07:12:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 17/20] vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device
 call on shadow virtqueue
Date: Fri,  1 Oct 2021 09:06:00 +0200
Message-Id: <20211001070603.307037-18-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 775f8d36a0..2fd0bab75d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -60,6 +60,9 @@ typedef struct VhostShadowVirtqueue {
 
     /* Next head to consume from device */
     uint16_t used_idx;
+
+    /* Cache for the exposed notification flag */
+    bool notification;
 } VhostShadowVirtqueue;
 
 /* If the device is using some of these, SVQ cannot communicate */
@@ -105,6 +108,24 @@ bool vhost_svq_valid_device_features(uint64_t *dev_features)
     return r;
 }
 
+static void vhost_svq_set_notification(VhostShadowVirtqueue *svq, bool enable)
+{
+    uint16_t notification_flag;
+
+    if (svq->notification == enable) {
+        return;
+    }
+
+    notification_flag = cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
+
+    svq->notification = enable;
+    if (enable) {
+        svq->vring.avail->flags &= ~notification_flag;
+    } else {
+        svq->vring.avail->flags |= notification_flag;
+    }
+}
+
 static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
                                     const struct iovec *iovec,
                                     size_t num, bool more_descs, bool write)
@@ -273,7 +294,7 @@ static void vhost_svq_handle_call_no_test(EventNotifier *n)
     do {
         unsigned i = 0;
 
-        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
+        vhost_svq_set_notification(svq, false);
         while (true) {
             g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq);
             if (!elem) {
@@ -286,6 +307,7 @@ static void vhost_svq_handle_call_no_test(EventNotifier *n)
 
         virtqueue_flush(vq, i);
         event_notifier_set(&svq->guest_call_notifier);
+        vhost_svq_set_notification(svq, true);
     } while (vhost_svq_more_used(svq));
 }
 
-- 
2.27.0


