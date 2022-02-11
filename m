Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8254B29FC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:18:48 +0100 (CET)
Received: from localhost ([::1]:46542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYdA-0003aQ-Uj
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nIYXw-0003M4-Qy
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nIYXt-0006lQ-AR
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644595996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T4mBfQ/E1e4vE9BWXUEIxiO3JSnrnGmV4HPLYuQnLzY=;
 b=WfoqePbQzZkTULgq+WVbcd3t9RM3KTN2v3IC64Qa3TS4mS8rYbOEKFOTBXZ3o35bcu7q0b
 4yPeEKg0NcRGlcnWcJUetwVnlJ7jUr40nCCfjTL61FGE+rrzEU0V9mpXy/l7vE+MAttrhy
 otwNsRfkGJtaPuQ4l8rInXBZBCHRKw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-1QZY5LQvOH2l7359wwexKQ-1; Fri, 11 Feb 2022 11:13:15 -0500
X-MC-Unique: 1QZY5LQvOH2l7359wwexKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D0261240
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:13:14 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E8E784761;
 Fri, 11 Feb 2022 16:13:12 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC] vhost-vdpa: make notifiers _init()/_uninit() symmetric
Date: Fri, 11 Feb 2022 17:13:09 +0100
Message-Id: <20220211161309.1385839-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost_vdpa_host_notifiers_init() initializes queue notifiers
for queues "dev->vq_index" to queue "dev->vq_index + dev->nvqs",
whereas vhost_vdpa_host_notifiers_uninit() uninitializes the
same notifiers for queue "0" to queue "dev->nvqs".

This asymmetry seems buggy, fix that by using dev->vq_index
as the base for both.

Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
Cc: jasowang@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 04ea43704f5d..9be3dc66580c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -395,15 +395,6 @@ static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
     }
 }
 
-static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
-{
-    int i;
-
-    for (i = 0; i < n; i++) {
-        vhost_vdpa_host_notifier_uninit(dev, i);
-    }
-}
-
 static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
 {
     size_t page_size = qemu_real_host_page_size;
@@ -442,6 +433,15 @@ err:
     return -1;
 }
 
+static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
+{
+    int i;
+
+    for (i = dev->vq_index; i < dev->vq_index + n; i++) {
+        vhost_vdpa_host_notifier_uninit(dev, i);
+    }
+}
+
 static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
 {
     int i;
@@ -455,7 +455,7 @@ static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
     return;
 
 err:
-    vhost_vdpa_host_notifiers_uninit(dev, i);
+    vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
     return;
 }
 
-- 
2.34.1


