Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A343642E4C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Euz-00012S-2i; Mon, 05 Dec 2022 12:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2EuI-0000fZ-11
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p2EuE-0002v7-Mj
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670259922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJnDIFDpZAEXu6Ik7SJDneyObvRfod4mGLHDS8td1QM=;
 b=ItKFAnbMJbNizEy1R8i1CY8Q1ewG52LfpgKNR69D6N17T/3oXAL5eun/hFjDsG222PUnZs
 dTKJODDZZd7XFPfMDTCP6FhhAFLX5Fq8NlpUfdXc/h37IRpA9svlDxPSKDidIo70/sCY9D
 iGsCqgXozYhURVhFAWAVQrhqK0oDOZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-qEAnpwi6NFyWCNdo4CfWYA-1; Mon, 05 Dec 2022 12:05:18 -0500
X-MC-Unique: qEAnpwi6NFyWCNdo4CfWYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93B23101A528;
 Mon,  5 Dec 2022 17:05:17 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C89D1C2C7D9;
 Mon,  5 Dec 2022 17:05:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC PATCH for 8.0 11/13] virtio-net: save inflight descriptors at
 vhost shutdown
Date: Mon,  5 Dec 2022 18:04:34 +0100
Message-Id: <20221205170436.2977336-12-eperezma@redhat.com>
In-Reply-To: <20221205170436.2977336-1-eperezma@redhat.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

So they can be migrated in virtio-net

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 043058ff43..480f4ac0a1 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -21,6 +21,7 @@
 
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-net.h"
+#include "hw/virtio/vhost-vdpa.h" /* TODO remove me */
 #include "net/vhost_net.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -319,6 +320,7 @@ static void vhost_net_stop_one(struct vhost_net *net,
                                VirtIODevice *dev)
 {
     struct vhost_vring_file file = { .fd = -1 };
+    VirtIONet *n = VIRTIO_NET(dev);
 
     if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
         for (file.index = 0; file.index < net->dev.nvqs; ++file.index) {
@@ -329,6 +331,26 @@ static void vhost_net_stop_one(struct vhost_net *net,
     if (net->nc->info->poll) {
         net->nc->info->poll(net->nc, true);
     }
+
+    for (size_t i = 0; i < net->dev.nvqs; ++i) {
+        struct vhost_vdpa *v = net->dev.opaque;
+
+        if (net->dev.nvqs != 2) {
+            continue;
+        }
+
+        if (!v->shadow_vqs_enabled) {
+            continue;
+        }
+
+        n->vqs[i].rx_inflight = vhost_svq_save_inflight(
+            g_ptr_array_index(v->shadow_vqs, 0),
+            &n->vqs[i].rx_inflight_num);
+        n->vqs[i].tx_inflight = vhost_svq_save_inflight(
+            g_ptr_array_index(v->shadow_vqs, 1),
+            &n->vqs[i].tx_inflight_num);
+    }
+
     vhost_dev_stop(&net->dev, dev, false);
     if (net->nc->info->stop) {
         net->nc->info->stop(net->nc);
-- 
2.31.1


