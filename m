Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30944DE6B0
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 08:22:53 +0100 (CET)
Received: from localhost ([::1]:52932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVTQK-00057C-Sz
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 03:22:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nVTO7-0002Fx-P6
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 03:20:35 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nVTO4-0005EJ-3Q
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 03:20:35 -0400
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KLC0q39qCzfYnp;
 Sat, 19 Mar 2022 15:18:51 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 15:20:21 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 15:20:20 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <cohuck@redhat.com>,
 <sgarzare@redhat.com>
CC: <pbonzini@redhat.com>, <arei.gonglei@huawei.com>, <yechuan@huawei.com>,
 <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>, Longpeng
 <longpeng2@huawei.com>
Subject: [PATCH v3 07/10] vdpa-dev: implement the get_config/set_config
 interface
Date: Sat, 19 Mar 2022 15:20:09 +0800
Message-ID: <20220319072012.525-8-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220319072012.525-1-longpeng2@huawei.com>
References: <20220319072012.525-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Implements the .get_config and .set_config interface.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index 1713818bc3..f28d3ed5f9 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -189,13 +189,23 @@ static void vhost_vdpa_device_unrealize(DeviceState *dev)
 static void
 vhost_vdpa_device_get_config(VirtIODevice *vdev, uint8_t *config)
 {
-    return;
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+
+    memcpy(config, s->config, s->config_size);
 }
 
 static void
 vhost_vdpa_device_set_config(VirtIODevice *vdev, const uint8_t *config)
 {
-    return;
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    int ret;
+
+    ret = vhost_dev_set_config(&s->dev, s->config, 0, s->config_size,
+                               VHOST_SET_CONFIG_TYPE_MASTER);
+    if (ret) {
+        error_report("set device config space failed");
+        return;
+    }
 }
 
 static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
-- 
2.23.0


