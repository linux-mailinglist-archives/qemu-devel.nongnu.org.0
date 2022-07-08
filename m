Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10BC56B7B8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:53:14 +0200 (CEST)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9lbl-0002Sn-N4
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZ7-0008HK-IZ
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9lZ4-0007oi-KB
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657277426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbbeuVcdMLnUg8QSdjm8tfSk1mPpN9NaBIPoPghrH1c=;
 b=ipPUxkwbbHbmz4kMqCYxsY5ALjxoeMH94tL0W5mLj+DqMhSig9BKrQosU2WCRiRe+WA21G
 DC6fjmapgdAeBQ6wq0Gcpp6P4RIxagUoJP/1MiG8a3WrpUFesiZ8VWknEcoXWhVi58aeB3
 HxsdiN42525rFxu4Kqkq0qRBCSYQDDg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-F6HrS1zAOqWhduVENEsm7w-1; Fri, 08 Jul 2022 06:50:22 -0400
X-MC-Unique: F6HrS1zAOqWhduVENEsm7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D94F38041D2;
 Fri,  8 Jul 2022 10:50:21 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C392B1121314;
 Fri,  8 Jul 2022 10:50:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 01/22] vhost: Return earlier if used buffers overrun
Date: Fri,  8 Jul 2022 12:49:52 +0200
Message-Id: <20220708105013.1899854-2-eperezma@redhat.com>
In-Reply-To: <20220708105013.1899854-1-eperezma@redhat.com>
References: <20220708105013.1899854-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Previous function misses the just picked avail buffer from the queue.
This way keeps blocking the used queue forever, but is cleaner to check
before calling to vhost_svq_get_buf.

Fixes: 100890f7cad50 ("vhost: Shadow virtqueue buffers forwarding")
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 56c96ebd13..9280285435 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -405,19 +405,21 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
         vhost_svq_disable_notification(svq);
         while (true) {
             uint32_t len;
-            g_autofree VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
-            if (!elem) {
-                break;
-            }
+            g_autofree VirtQueueElement *elem = NULL;
 
             if (unlikely(i >= svq->vring.num)) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                          "More than %u used buffers obtained in a %u size SVQ",
                          i, svq->vring.num);
-                virtqueue_fill(vq, elem, len, i);
-                virtqueue_flush(vq, i);
+                virtqueue_flush(vq, svq->vring.num);
                 return;
             }
+
+            elem = vhost_svq_get_buf(svq, &len);
+            if (!elem) {
+                break;
+            }
+
             virtqueue_fill(vq, elem, len, i++);
         }
 
-- 
2.31.1


