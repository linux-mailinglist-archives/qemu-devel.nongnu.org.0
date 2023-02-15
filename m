Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBE69825B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:40:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLkw-0007iQ-2Z; Wed, 15 Feb 2023 12:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSLku-0007hm-Gm
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:39:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSLkt-0005tC-2n
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676482782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KsmVepERaqequSlE7Ur8f0K0Vum9v+5eQxFNg0Nb1f4=;
 b=WXejWHZOpJ4sSadV6pl1L9vd3UBP1376E+Lu2GgxfL+xJUgk48pIZDfnjcNus57O7TJJo/
 rI0KvhjkNinaT4W95dmsU/diQYmgdHZu7/2Ttxm2dnTcLMN7yYNLnqqdduZgVhe7ZNtiyY
 mcwpiKbu36aCkTwT58ukRfQAH3VqOjg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-kH0QAkMrOvihIxQwPIAiww-1; Wed, 15 Feb 2023 12:39:38 -0500
X-MC-Unique: kH0QAkMrOvihIxQwPIAiww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E02F618E0921;
 Wed, 15 Feb 2023 17:39:37 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90432140EBF4;
 Wed, 15 Feb 2023 17:39:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Shannon Nelson <snelson@pensando.io>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, si-wei.liu@oracle.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, alvaro.karsz@solid-run.com,
 Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Subject: [PATCH v3 12/14] vdpa: block migration if dev does not have _F_SUSPEND
Date: Wed, 15 Feb 2023 18:38:48 +0100
Message-Id: <20230215173850.298832-13-eperezma@redhat.com>
In-Reply-To: <20230215173850.298832-1-eperezma@redhat.com>
References: <20230215173850.298832-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Next patches enable devices to be migrated even if vdpa netdev has not
been started with x-svq. However, not all devices are migratable, so we
need to block migration if we detect that.

Block vhost-vdpa device migration if it does not offer _F_SUSPEND and it
has not been started with x-svq.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 52c72e7c94..3a85f9f1ed 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -443,6 +443,27 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
         return 0;
     }
 
+    /*
+     * If dev->shadow_vqs_enabled at initialization that means the device has
+     * been started with x-svq=on, so don't block migration
+     */
+    if (dev->migration_blocker == NULL && !v->shadow_vqs_enabled) {
+        uint64_t backend_features;
+
+        /* We don't have dev->backend_features yet */
+        ret = vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES,
+                              &backend_features);
+        if (unlikely(ret)) {
+            error_setg_errno(errp, -ret, "Could not get backend features");
+            return ret;
+        }
+
+        if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
+            error_setg(&dev->migration_blocker,
+                "vhost-vdpa backend lacks VHOST_BACKEND_F_SUSPEND feature.");
+        }
+    }
+
     /*
      * Similar to VFIO, we end up pinning all guest memory and have to
      * disable discarding of RAM.
-- 
2.31.1


