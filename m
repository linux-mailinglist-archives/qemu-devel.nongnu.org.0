Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0A33C741
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:59:40 +0100 (CET)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtNL-0001FM-RE
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtE3-0005ve-M2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtE2-0004Fh-1L
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UiuTlgOtfMbdtiwceqwHYXYl3zo3bRNZ7YUjgCumRxI=;
 b=Wia2EJmYbkAcKaPDdcKFageLSt6M/LX94Jy4gxer/lqqu4Z1plKUFiG0wOH2BPK40rjhqs
 dJip/5z1eci/+mUkOofz856GRzkcO+CpYQytx1BwXLtvizcAtZjlM2mm8llAufzwvx50Tf
 byIEygZ86l2PkbBd0AGUwBoh4oDDPhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-v1DqsurKN0-K1MpbphjFng-1; Mon, 15 Mar 2021 15:49:59 -0400
X-MC-Unique: v1DqsurKN0-K1MpbphjFng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC049801597;
 Mon, 15 Mar 2021 19:49:57 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B46B5F9B8;
 Mon, 15 Mar 2021 19:49:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 13/13] vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call
 on shadow virtqueue
Date: Mon, 15 Mar 2021 20:48:42 +0100
Message-Id: <20210315194842.277740-14-eperezma@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 7df98fc43f..e3879a4622 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -71,10 +71,35 @@ typedef struct VhostShadowVirtqueue {
     /* Next head to consume from device */
     uint16_t used_idx;
 
+    /* Cache for the exposed notification flag */
+    bool notification;
+
     /* Descriptors copied from guest */
     vring_desc_t descs[];
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
+    notification_flag = virtio_tswap16(svq->vdev, VRING_AVAIL_F_NO_INTERRUPT);
+
+    svq->notification = enable;
+    if (enable) {
+        svq->vring.avail->flags &= ~notification_flag;
+    } else {
+        svq->vring.avail->flags |= notification_flag;
+    }
+
+    /* Make sure device reads our flag */
+    smp_mb();
+}
+
 static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
                                     const struct iovec *iovec,
                                     size_t num, bool more_descs, bool write)
@@ -251,7 +276,7 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
     do {
         unsigned i = 0;
 
-        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
+        vhost_shadow_vq_set_notification(svq, false);
         while (true) {
             g_autofree VirtQueueElement *elem = vhost_shadow_vq_get_buf(svq);
             if (!elem) {
@@ -269,6 +294,7 @@ static void vhost_shadow_vq_handle_call_no_test(EventNotifier *n)
             svq->masked_notifier.signaled = true;
             event_notifier_set(svq->masked_notifier.n);
         }
+        vhost_shadow_vq_set_notification(svq, true);
     } while (vhost_shadow_vq_more_used(svq));
 
     if (masked_notifier) {
-- 
2.27.0


