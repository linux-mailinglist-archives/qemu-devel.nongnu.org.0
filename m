Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9C56FCA73
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:45:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPWN-0004xb-JN; Tue, 09 May 2023 11:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPWL-0004wC-Ms
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPWJ-0005My-77
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oej3CwSaPAyBbeSVGmHu/E36bVyIht93U3E1NX6tTdk=;
 b=SWu+Ea8tWd4Ne0uV2s7UvvkAn4NCLrsVXYKq4JDuhuCReN835Qina9i6Rjrfl3lUS7b1aR
 27bGlVOse9K+QzoZwjMMtoij6PMgNLcY87QL1i8hkhz0zVNt4skRAy2jcLGUDmX5wcFz0v
 22TAx3jGTiiKOmK9BmWmRajjBUDhzmY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-4LioqHxqMG6qwZeUayXYDg-1; Tue, 09 May 2023 11:44:49 -0400
X-MC-Unique: 4LioqHxqMG6qwZeUayXYDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBA69100F651;
 Tue,  9 May 2023 15:44:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AD84C15BA0;
 Tue,  9 May 2023 15:44:45 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 longpeng2@huawei.com, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, alvaro.karsz@solid-run.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 si-wei.liu@oracle.com, Shannon Nelson <snelson@pensando.io>,
 Lei Yang <leiyang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v3 3/5] vdpa: add vhost_vdpa_set_dev_features_fd
Date: Tue,  9 May 2023 17:44:33 +0200
Message-Id: <20230509154435.1410162-4-eperezma@redhat.com>
In-Reply-To: <20230509154435.1410162-1-eperezma@redhat.com>
References: <20230509154435.1410162-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This allows to set the features of a vhost-vdpa device from external
subsystems like vhost-net.  It is used in subsequent patches to
negotiate features and probe for CVQ ASID isolation.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
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


