Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2058F296
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 20:56:24 +0200 (CEST)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLqsR-0004yV-6E
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 14:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfG-00028u-FM
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfB-0006hD-6c
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660156956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTgbAuKIFtbiTbct78PH3a5nyxF/B2YC+cxL9w/h+/A=;
 b=a5d2jHuhAjq6UNSgjwcjWn9vFW7BsMwt5vS7XuLkgdZ4w8ZIZBDN7jcmUuM28s6/nurUS5
 2XmD9ejRphkN460/rUTW52utnFhWAZ7/aCvRz/sXHWvLEvlKrCDHSnCujNkPdIJHaODtz4
 nBRV7c4b0Yd7i1lIbv09335l/ZEH/7c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-1R6qhDMSNDmCdJcEso_lzA-1; Wed, 10 Aug 2022 14:42:34 -0400
X-MC-Unique: 1R6qhDMSNDmCdJcEso_lzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2674D29DD99A;
 Wed, 10 Aug 2022 18:42:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84C56C15BA3;
 Wed, 10 Aug 2022 18:42:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [RFC 3/8] vhost: expose memory listener priority
Date: Wed, 10 Aug 2022 20:42:15 +0200
Message-Id: <20220810184220.2362292-4-eperezma@redhat.com>
In-Reply-To: <20220810184220.2362292-1-eperezma@redhat.com>
References: <20220810184220.2362292-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

We need to perform changes to vhost_vdpa devices before the memory
listener inform them about the migration. Otherwise, it will reach them
with no SVQ enabled and it cannot be guaranteed that it will be enabled
afterwards.

Expose the vhost memory listener priority so we can assign a lower one
to net/vhost-vdpa one.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h | 2 ++
 hw/virtio/vhost.c         | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..ccd6cc5549 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -104,6 +104,8 @@ struct vhost_dev {
     const VhostDevConfigOps *config_ops;
 };
 
+#define VHOST_DEV_MEMORY_LISTENER_PRIORITY 10
+
 extern const VhostOps kernel_ops;
 extern const VhostOps user_ops;
 extern const VhostOps vdpa_ops;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 0827d631c0..a1e822b871 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1411,7 +1411,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
         .log_global_stop = vhost_log_global_stop,
         .eventfd_add = vhost_eventfd_add,
         .eventfd_del = vhost_eventfd_del,
-        .priority = 10
+        .priority = VHOST_DEV_MEMORY_LISTENER_PRIORITY
     };
 
     hdev->iommu_listener = (MemoryListener) {
-- 
2.31.1


