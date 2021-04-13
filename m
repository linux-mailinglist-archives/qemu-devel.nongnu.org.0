Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F835E03F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:39:28 +0200 (CEST)
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJGJ-0002sx-Hw
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lWJEx-0002Mv-KV
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:38:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lWJEt-0004Hd-O6
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:38:03 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FKRRd3zfXzNvSM;
 Tue, 13 Apr 2021 21:34:53 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 21:37:39 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
Subject: [PATCH] vhost-vdpa: Make vhost_vdpa_get_device_id() static
Date: Tue, 13 Apr 2021 21:37:37 +0800
Message-ID: <20210413133737.1574-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 jasowang@redhat.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As it's only used inside hw/virtio/vhost-vdpa.c.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/virtio/vhost-vdpa.c         | 4 ++--
 include/hw/virtio/vhost-vdpa.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..8f2fb9f10b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -371,8 +371,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
     return 0;
 }
 
-int vhost_vdpa_get_device_id(struct vhost_dev *dev,
-                                   uint32_t *device_id)
+static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
+                                    uint32_t *device_id)
 {
     int ret;
     ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_DEVICE_ID, device_id);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9b81a409da..28ca65018e 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -22,6 +22,4 @@ typedef struct vhost_vdpa {
 } VhostVDPA;
 
 extern AddressSpace address_space_memory;
-extern int vhost_vdpa_get_device_id(struct vhost_dev *dev,
-                                   uint32_t *device_id);
 #endif
-- 
2.19.1


