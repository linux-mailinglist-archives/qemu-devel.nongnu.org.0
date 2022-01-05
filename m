Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9EF484BE8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 02:02:11 +0100 (CET)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ugr-0002FX-UP
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 20:02:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue2-0007rQ-9s
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:14 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4udz-0007uy-Ov
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:13 -0500
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTB1763Y5z9s4d;
 Wed,  5 Jan 2022 08:58:03 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:05 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:05 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Date: Wed, 5 Jan 2022 08:58:52 +0800
Message-ID: <20220105005900.860-3-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
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

To support generic vdpa deivce, we need add the following ioctls:
- GET_VECTORS_NUM: the count of vectors that supported
- GET_CONFIG_SIZE: the size of the virtio config space
- GET_VQS_NUM: the count of virtqueues that exported

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 linux-headers/linux/vhost.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index c998860d7b..c5edd75d15 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -150,4 +150,14 @@
 /* Get the valid iova range */
 #define VHOST_VDPA_GET_IOVA_RANGE	_IOR(VHOST_VIRTIO, 0x78, \
 					     struct vhost_vdpa_iova_range)
+
+/* Get the number of vectors */
+#define VHOST_VDPA_GET_VECTORS_NUM	_IOR(VHOST_VIRTIO, 0x79, int)
+
+/* Get the virtio config size */
+#define VHOST_VDPA_GET_CONFIG_SIZE	_IOR(VHOST_VIRTIO, 0x80, int)
+
+/* Get the number of virtqueues */
+#define VHOST_VDPA_GET_VQS_NUM		_IOR(VHOST_VIRTIO, 0x81, int)
+
 #endif
-- 
2.23.0


