Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F319B6BEBF3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:57:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBVB-0000SF-GY; Fri, 17 Mar 2023 10:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBV7-0000R3-H2
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBV1-0007Kj-Rw
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679064959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpmyuWBcYlh2Hd+XeU5GfmO3PD9opnGLJrAwHvLGNp0=;
 b=ehA2nuqlLu5Sst2vYpcPZVKsBhiLFhBOr6HXteaGgb3dHPPSNWzfhS5bJytUSwk6+0MR4t
 VzWnhFZ1vNNstA4eUlzfu91DXYw/qsE+HKtZDa6ue0xGUji7X21TxA5/XSzRIrw5qJJfi/
 qd0ygFM/Pbd2dYTO53CwiXqTFxpLOXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-h_taBTzoM36OJNqe6LfmUQ-1; Fri, 17 Mar 2023 10:55:55 -0400
X-MC-Unique: h_taBTzoM36OJNqe6LfmUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38D9718E530C;
 Fri, 17 Mar 2023 14:55:55 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CA2643FBE;
 Fri, 17 Mar 2023 14:55:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: alvaro.karsz@solid-run.com, Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, Stefano Garzarella <sgarzare@redhat.com>,
 longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: [RFC PATCH for 8.1 3/6] vdpa: add vhost_vdpa_set_dev_features_fd
Date: Fri, 17 Mar 2023 15:55:39 +0100
Message-Id: <20230317145542.347368-4-eperezma@redhat.com>
In-Reply-To: <20230317145542.347368-1-eperezma@redhat.com>
References: <20230317145542.347368-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

This allows to set the features of a vhost-vdpa device from external
subsystems like vhost-net.  It is used in subsequent patches to
negotiate features and probe for CVQ ASID isolation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 28de7da91e..a9cb6f3a32 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -55,6 +55,7 @@ typedef struct vhost_vdpa {
 } VhostVDPA;
 
 void vhost_vdpa_reset_status_fd(int fd);
+int vhost_vdpa_set_dev_features_fd(int fd, uint64_t features);
 int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
 
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7a2053b8d9..acd5be46a9 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -651,11 +651,22 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
     return 0;
 }
 
+int vhost_vdpa_set_dev_features_fd(int fd, uint64_t features)
+{
+    int ret;
+
+    ret = vhost_vdpa_call_fd(fd, VHOST_SET_FEATURES, &features);
+    if (ret) {
+        return ret;
+    }
+
+    return vhost_vdpa_add_status_fd(fd, VIRTIO_CONFIG_S_FEATURES_OK);
+}
+
 static int vhost_vdpa_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
     struct vhost_vdpa *v = dev->opaque;
-    int ret;
 
     if (!vhost_vdpa_first_dev(dev)) {
         return 0;
@@ -678,12 +689,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     }
 
     trace_vhost_vdpa_set_features(dev, features);
-    ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
-    if (ret) {
-        return ret;
-    }
-
-    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
+    return vhost_vdpa_set_dev_features_fd(vhost_vdpa_dev_fd(dev), features);
 }
 
 static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
-- 
2.31.1


