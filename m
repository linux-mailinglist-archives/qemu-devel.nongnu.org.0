Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303A698270
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:41:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLl2-0008Ik-Sf; Wed, 15 Feb 2023 12:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSLkz-0008B6-OW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:39:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pSLky-0005v3-1P
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676482787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPvLwzTrK7YlEIKvdB4pN/v9TIyGOunTullP7T+gwiw=;
 b=ZcbhRrlEAeZBtuH2OWQLDSWMaDboNiXcV3H1BRR5GBg7r6B2advY/z1XaeMenr1uo8/7cJ
 0r9eNS9NTw24leWjRJyjI5jQWwsFuJxvc4DeNZUSns0Y0sjqKWRPxoHL4k7RuFWOH5MITj
 zpjEJFJUm0I5ihCUv4jtp76DN5q96JY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-m0GD__rUMBe6jhMS963EfA-1; Wed, 15 Feb 2023 12:39:42 -0500
X-MC-Unique: m0GD__rUMBe6jhMS963EfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EB2A382C977;
 Wed, 15 Feb 2023 17:39:41 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D097140EBF4;
 Wed, 15 Feb 2023 17:39:38 +0000 (UTC)
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
Subject: [PATCH v3 13/14] vdpa: block migration if SVQ does not admit a feature
Date: Wed, 15 Feb 2023 18:38:49 +0100
Message-Id: <20230215173850.298832-14-eperezma@redhat.com>
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

Block migration if we detect the device expose a feature SVQ does not
know how to work with.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 3a85f9f1ed..9b8c22bda3 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -461,6 +461,15 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
         if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
             error_setg(&dev->migration_blocker,
                 "vhost-vdpa backend lacks VHOST_BACKEND_F_SUSPEND feature.");
+        } else {
+            /* We don't have dev->features yet */
+            uint64_t features;
+            ret = vhost_vdpa_get_dev_features(dev, &features);
+            if (unlikely(ret)) {
+                error_setg_errno(errp, -ret, "Could not get device features");
+                return ret;
+            }
+            vhost_svq_valid_features(features, &dev->migration_blocker);
         }
     }
 
-- 
2.31.1


