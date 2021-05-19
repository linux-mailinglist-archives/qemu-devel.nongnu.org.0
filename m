Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25C389414
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:49:11 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPNe-0005qm-81
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP72-0006Ft-CJ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6y-00060h-CF
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pG7/gEG0Z91i9qQ6wBTx25rr6oZJeVJWvV5Jsi0WAfU=;
 b=AbEdTuS8VgDS63xAj9jf8dj5QTRYK+nYqfWgohiLeuvlyRNNQluZDE3lfUAipt4k6FxZ8c
 RT6b5regT7v+lqhtOdTChimfM7OBpAP2oPYkh8knfeJjBAJEMMwmE/cAVwl+rckNBYr8Nl
 QU0mgQtyXQP2+EophFS/hgpAoM0eUOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-rFf2W_B9M-mGvDBX_Wi46g-1; Wed, 19 May 2021 12:31:49 -0400
X-MC-Unique: rFf2W_B9M-mGvDBX_Wi46g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93C2B10082E0;
 Wed, 19 May 2021 16:31:47 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D5DA5D6AC;
 Wed, 19 May 2021 16:31:44 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 20/29] vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call
 on shadow virtqueue
Date: Wed, 19 May 2021 18:28:54 +0200
Message-Id: <20210519162903.1172366-21-eperezma@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 6b42147449..934d3bb27b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -64,8 +64,30 @@ typedef struct VhostShadowVirtqueue {
 
     /* Next head to consume from device */
     uint16_t used_idx;
+
+    /* Cache for the exposed notification flag */
+    bool notification;
 } VhostShadowVirtqueue;
 
+static void vhost_shadow_vq_set_notification(VhostShadowVirtqueue *svq,
+                                             bool enable)
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
@@ -231,7 +253,7 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
     do {
         unsigned i = 0;
 
-        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
+        vhost_shadow_vq_set_notification(svq, false);
         while (true) {
             g_autofree VirtQueueElement *elem = vhost_shadow_vq_get_buf(svq);
             if (!elem) {
@@ -249,6 +271,7 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
             svq->masked_notifier.signaled = true;
             event_notifier_set(svq->masked_notifier.n);
         }
+        vhost_shadow_vq_set_notification(svq, true);
     } while (vhost_shadow_vq_more_used(svq));
 }
 
-- 
2.27.0


