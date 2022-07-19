Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F423F579FC1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:35:59 +0200 (CEST)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnOJ-0006j4-4y
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6W-000893-Bl
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn6U-0004tD-Ot
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pFeeYQp3x+GoSIXdcSgiTFapgeqbB9OVnl7G9NNr70=;
 b=FB+m+J1ifFmB2c8dw/Xr77Y+snKRwMCtbGUnDT7qWpjdRL7sqOe1KmkxW0yAH2yi3H5Xgn
 QNlfmBRWswSULE+9MRGiSp1LJVqGveSMEA8+z+9Z4DjXnlhf0Cr9zRGkWRmIiRnKp2o6wI
 Pd6BjHMjE6G02pp7ije3wkH1kn5SiL8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-QPqTPSQuMNWnYbD6T0Ux3g-1; Tue, 19 Jul 2022 09:17:22 -0400
X-MC-Unique: QPqTPSQuMNWnYbD6T0Ux3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BC661C04B61;
 Tue, 19 Jul 2022 13:17:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1435740CF8E5;
 Tue, 19 Jul 2022 13:17:19 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 11/24] vhost: add vhost_svq_push_elem
Date: Tue, 19 Jul 2022 21:16:24 +0800
Message-Id: <20220719131637.46131-12-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

This function allows external SVQ users to return guest's available
buffers.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 16 ++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 8314405..1669b1f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -428,6 +428,22 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
 }
 
+/**
+ * Push an element to SVQ, returning it to the guest.
+ */
+void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
+                         const VirtQueueElement *elem, uint32_t len)
+{
+    virtqueue_push(svq->vq, elem, len);
+    if (svq->next_guest_avail_elem) {
+        /*
+         * Avail ring was full when vhost_svq_flush was called, so it's a
+         * good moment to make more descriptors available if possible.
+         */
+        vhost_handle_guest_kick(svq);
+    }
+}
+
 static void vhost_svq_flush(VhostShadowVirtqueue *svq,
                             bool check_for_avail_queue)
 {
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 5c7e7cb..d9fc1f1 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -84,6 +84,9 @@ typedef struct VhostShadowVirtqueue {
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
+void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
+                         const VirtQueueElement *elem, uint32_t len);
+
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
 void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
-- 
2.7.4


