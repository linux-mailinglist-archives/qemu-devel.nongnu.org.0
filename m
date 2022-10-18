Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ECE6030AC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:21:10 +0200 (CEST)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okpL1-0007p6-Q5
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okov0-0003yt-Kv
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okoux-00042T-Em
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666108450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+nsA7fbJ3UVE7PKf+3TO5eQ8AmCw5MIwi9DZeLdXqE=;
 b=XtOIoIfVIwjxA7eAXGJQGsqYogSpKe94qRVJm81ZLCpRDnZKjcxLclPnApReeTa74TOt2j
 pRXT4ZSOgzMF02jEXsK/pSSOc+E/2pZipcAj2O55R7z9IkCZgm8Hcid1MxVBvjKqxBJ7bG
 LuAUFHn8q2DvbqY4/s8jMXmZRz45sMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-Swd0_2YIM-OuYBlaL9j3Pg-1; Tue, 18 Oct 2022 11:54:07 -0400
X-MC-Unique: Swd0_2YIM-OuYBlaL9j3Pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86AC5811E67;
 Tue, 18 Oct 2022 15:54:06 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3230215CDCC;
 Tue, 18 Oct 2022 15:53:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 4/5] vhost_net: return VIRTIO_NET_S_ANNOUNCE is device
 model has it set
Date: Tue, 18 Oct 2022 17:53:20 +0200
Message-Id: <20221018155321.145135-5-eperezma@redhat.com>
In-Reply-To: <20221018155321.145135-1-eperezma@redhat.com>
References: <20221018155321.145135-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Temporal, as this affects other vhost backends and we must check status
feature first.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..46da037aac 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -117,7 +117,35 @@ uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t features)
 int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
                          uint32_t config_len)
 {
-    return vhost_dev_get_config(&net->dev, config, config_len, NULL);
+    VirtIODevice *vdev;
+    VirtIONet *n;
+    int r = vhost_dev_get_config(&net->dev, config, config_len, NULL);
+
+    if (unlikely(r != 0)) {
+        return r;
+    }
+
+    if (config_len < endof(struct virtio_net_config, status)) {
+        return 0;
+    }
+
+    /*
+     * TODO: To check for VIRTIO_NET_F_STATUS too.
+     * TODO: Perform this only if vhost_vdpa.
+     */
+    vdev = net->dev.vdev;
+    if (!vdev) {
+        /* Device is starting */
+        return 0;
+    }
+    if (!(net->dev.acked_features & BIT_ULL(VIRTIO_NET_F_GUEST_ANNOUNCE))) {
+        return 0;
+    }
+
+    n = VIRTIO_NET(vdev);
+    ((struct virtio_net_config *)config)->status |=
+                                           (n->status & VIRTIO_NET_S_ANNOUNCE);
+    return 0;
 }
 int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
                          uint32_t offset, uint32_t size, uint32_t flags)
-- 
2.31.1


