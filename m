Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95A484BF5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 02:11:27 +0100 (CET)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4upq-0006NH-Qv
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 20:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue5-0007tO-3H
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:17 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue2-0007vN-0a
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:16 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JTB1k3q2czcbpl;
 Wed,  5 Jan 2022 08:58:34 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:08 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:07 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [RFC 06/10] vdpa-dev: implement the unrealize interface
Date: Wed, 5 Jan 2022 08:58:56 +0800
Message-ID: <20220105005900.860-7-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220105005900.860-1-longpeng2@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

Implements the .unrealize interface.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index 2d534d837a..4e4dd3d201 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -133,9 +133,29 @@ out:
     close(fd);
 }
 
+static void vhost_vdpa_vdev_unrealize(VhostVdpaDevice *s)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    int i;
+
+    for (i = 0; i < s->num_queues; i++) {
+        virtio_delete_queue(s->virtqs[i]);
+    }
+    g_free(s->virtqs);
+    virtio_cleanup(vdev);
+
+    g_free(s->config);
+}
+
 static void vhost_vdpa_device_unrealize(DeviceState *dev)
 {
-    return;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+
+    virtio_set_status(vdev, 0);
+    vhost_dev_cleanup(&s->dev);
+    vhost_vdpa_vdev_unrealize(s);
+    close(s->vdpa.device_fd);
 }
 
 static void
-- 
2.23.0


