Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C562E588189
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 20:00:19 +0200 (CEST)
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIwBm-00067t-VZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 14:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9K-0000w1-6R
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9I-0003ch-LH
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659463064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJjoWNgiO9pSxFfxgEXPumFynQaR4e570fIWsLS9YCg=;
 b=K1bfDVFLPS/lidyo8pO+6VFAjGoWgrB5bLdRJmTnahziZaImslZeNFkpHpmc8gTFvlfYxM
 ckA43/4rxZ4qTNjjXoO9B88a/2ugsCaYWWgagz/fJyPAbwHBOGQb/66cMnRoxwChUUX6wp
 WBSW+VMDZXUWr5TNNyf45bFSSuCYvu0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-b0w5GStNPlufniqS_oJqDQ-1; Tue, 02 Aug 2022 13:57:40 -0400
X-MC-Unique: b0w5GStNPlufniqS_oJqDQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E285029AA382;
 Tue,  2 Aug 2022 17:57:38 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E058492C3B;
 Tue,  2 Aug 2022 17:57:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH v5 01/10] vhost: stop transfer elem ownership in
 vhost_handle_guest_kick
Date: Tue,  2 Aug 2022 19:57:22 +0200
Message-Id: <20220802175731.312115-2-eperezma@redhat.com>
In-Reply-To: <20220802175731.312115-1-eperezma@redhat.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

It was easier to allow vhost_svq_add to handle the memory. Now that we
will allow qemu to add elements to a SVQ without the guest's knowledge,
it's better to handle it in the caller.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e4956728dd..ffd2b2c972 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -233,9 +233,6 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
 /**
  * Add an element to a SVQ.
  *
- * The caller must check that there is enough slots for the new element. It
- * takes ownership of the element: In case of failure not ENOSPC, it is free.
- *
  * Return -EINVAL if element is invalid, -ENOSPC if dev queue is full
  */
 int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
@@ -252,7 +249,6 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
 
     ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num, &qemu_head);
     if (unlikely(!ok)) {
-        g_free(elem);
         return -EINVAL;
     }
 
@@ -293,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
         virtio_queue_set_notification(svq->vq, false);
 
         while (true) {
-            VirtQueueElement *elem;
+            g_autofree VirtQueueElement *elem;
             int r;
 
             if (svq->next_guest_avail_elem) {
@@ -324,12 +320,14 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
                      * queue the current guest descriptor and ignore kicks
                      * until some elements are used.
                      */
-                    svq->next_guest_avail_elem = elem;
+                    svq->next_guest_avail_elem = g_steal_pointer(&elem);
                 }
 
                 /* VQ is full or broken, just return and ignore kicks */
                 return;
             }
+            /* elem belongs to SVQ or external caller now */
+            elem = NULL;
         }
 
         virtio_queue_set_notification(svq->vq, true);
-- 
2.31.1


