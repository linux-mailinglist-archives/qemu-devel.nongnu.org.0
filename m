Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A039578002
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:43:49 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDOE8-0001RE-EB
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO1T-0000Xq-Vq
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO1S-0001VZ-BX
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658140240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1sjQXZ7pGh62ovINMUtfVB0I9xu7GNacygyfka+sgY=;
 b=c8ADumQj3Z0SDW++rk1833Wmy90m7Rf7NJkq8EPzHX1W+p3VZeAvfk7QCAdqwj8jDsVf/u
 MYAtjAmyzF0mVMfDsLb0Fxl/C/mV7jXAL8/oFMbRwAQffLQqQ2sK2OOb65e2SZc53vEFlU
 ynDAFowT/O9xHuA4jOI0qN026y2nJvs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-lFF28ODiNXe8m8NWQmUM6Q-1; Mon, 18 Jul 2022 06:30:28 -0400
X-MC-Unique: lFF28ODiNXe8m8NWQmUM6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5858F8037AC;
 Mon, 18 Jul 2022 10:30:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38ABD2166B26;
 Mon, 18 Jul 2022 10:30:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v4 07/19] vhost: Decouple vhost_svq_add from VirtQueueElement
Date: Mon, 18 Jul 2022 12:29:37 +0200
Message-Id: <20220718102949.2868267-8-eperezma@redhat.com>
In-Reply-To: <20220718102949.2868267-1-eperezma@redhat.com>
References: <20220718102949.2868267-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

VirtQueueElement comes from the guest, but we're heading SVQ to be able
to modify the element presented to the device without the guest's
knowledge.

To do so, make SVQ accept sg buffers directly, instead of using
VirtQueueElement.

Add vhost_svq_add_element to maintain element convenience.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 33 ++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index aee9891a67..b005a457c6 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -172,30 +172,31 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
-                                VirtQueueElement *elem, unsigned *head)
+                                const struct iovec *out_sg, size_t out_num,
+                                const struct iovec *in_sg, size_t in_num,
+                                unsigned *head)
 {
     unsigned avail_idx;
     vring_avail_t *avail = svq->vring.avail;
     bool ok;
-    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
+    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(out_num, in_num));
 
     *head = svq->free_head;
 
     /* We need some descriptors here */
-    if (unlikely(!elem->out_num && !elem->in_num)) {
+    if (unlikely(!out_num && !in_num)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Guest provided element with no descriptors");
         return false;
     }
 
-    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
-                                     elem->in_num > 0, false);
+    ok = vhost_svq_vring_write_descs(svq, sgs, out_sg, out_num, in_num > 0,
+                                     false);
     if (unlikely(!ok)) {
         return false;
     }
 
-    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
-                                     true);
+    ok = vhost_svq_vring_write_descs(svq, sgs, in_sg, in_num, false, true);
     if (unlikely(!ok)) {
         return false;
     }
@@ -237,17 +238,19 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
  *
  * Return -EINVAL if element is invalid, -ENOSPC if dev queue is full
  */
-static int vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
+static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
+                          size_t out_num, const struct iovec *in_sg,
+                          size_t in_num, VirtQueueElement *elem)
 {
     unsigned qemu_head;
-    unsigned ndescs = elem->in_num + elem->out_num;
+    unsigned ndescs = in_num + out_num;
     bool ok;
 
     if (unlikely(ndescs > vhost_svq_available_slots(svq))) {
         return -ENOSPC;
     }
 
-    ok = vhost_svq_add_split(svq, elem, &qemu_head);
+    ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num, &qemu_head);
     if (unlikely(!ok)) {
         g_free(elem);
         return -EINVAL;
@@ -258,6 +261,14 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
     return 0;
 }
 
+/* Convenience wrapper to add a guest's element to SVQ */
+static int vhost_svq_add_element(VhostShadowVirtqueue *svq,
+                                 VirtQueueElement *elem)
+{
+    return vhost_svq_add(svq, elem->out_sg, elem->out_num, elem->in_sg,
+                         elem->in_num, elem);
+}
+
 /**
  * Forward available buffers.
  *
@@ -294,7 +305,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                 break;
             }
 
-            r = vhost_svq_add(svq, elem);
+            r = vhost_svq_add_element(svq, elem);
             if (unlikely(r != 0)) {
                 if (r == -ENOSPC) {
                     /*
-- 
2.31.1


