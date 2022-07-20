Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4B57B166
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:09:31 +0200 (CEST)
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3pq-0000Ls-B9
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3gv-0000Mr-1Z
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3gt-0006SI-KA
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658300414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYzwUSJhFbQty0HVMHgdAJGcmPXpX3YLF4SWmZGpIh8=;
 b=d4kz+nL0Jdkcy6Yhk6VA/6huDphnT4X6fQX0IsL98J/ZAJpElJanm1zI8QAUlSnAHyt5HK
 wjqANbqcu82VcITm+hWKyzMtenNK6q3dBW/6Gyo3uiR7RMA6u1R41lEE/3RkTOd0oLFZbH
 AiU0knVOS0NfB1zJVsBJ1WA7CtROXZo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-iP1nCl9sPH-nZuu20s_i5g-1; Wed, 20 Jul 2022 03:00:10 -0400
X-MC-Unique: iP1nCl9sPH-nZuu20s_i5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF2CA3C10220;
 Wed, 20 Jul 2022 07:00:09 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D219A18ECC;
 Wed, 20 Jul 2022 07:00:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v6 05/21] vhost: Reorder vhost_svq_kick
Date: Wed, 20 Jul 2022 08:59:30 +0200
Message-Id: <20220720065946.3122611-6-eperezma@redhat.com>
In-Reply-To: <20220720065946.3122611-1-eperezma@redhat.com>
References: <20220720065946.3122611-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Future code needs to call it from vhost_svq_add.

No functional change intended.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 560d07ab36..043a185b96 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -215,6 +215,20 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
     return true;
 }
 
+static void vhost_svq_kick(VhostShadowVirtqueue *svq)
+{
+    /*
+     * We need to expose the available array entries before checking the used
+     * flags
+     */
+    smp_mb();
+    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
+        return;
+    }
+
+    event_notifier_set(&svq->hdev_kick);
+}
+
 /**
  * Add an element to a SVQ.
  *
@@ -235,20 +249,6 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
     return true;
 }
 
-static void vhost_svq_kick(VhostShadowVirtqueue *svq)
-{
-    /*
-     * We need to expose the available array entries before checking the used
-     * flags
-     */
-    smp_mb();
-    if (svq->vring.used->flags & VRING_USED_F_NO_NOTIFY) {
-        return;
-    }
-
-    event_notifier_set(&svq->hdev_kick);
-}
-
 /**
  * Forward available buffers.
  *
-- 
2.31.1


