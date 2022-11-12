Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2403626A03
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 15:41:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otrgO-0005J0-KH; Sat, 12 Nov 2022 09:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1otrgM-0005G0-9l
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:40:30 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1otrgJ-0006RF-OX
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:40:30 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N8dX73WKSzRns9;
 Sat, 12 Nov 2022 22:40:07 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 22:40:20 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 <xiehong@huawei.com>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH v9 5/5] docs: Add generic vhost-vdpa device documentation
Date: Sat, 12 Nov 2022 22:40:13 +0800
Message-ID: <20221112144013.1349-6-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20221112144013.1349-1-longpeng2@huawei.com>
References: <20221112144013.1349-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 .../devices/vhost-vdpa-generic-device.rst     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst

diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
new file mode 100644
index 0000000000..d6db9af755
--- /dev/null
+++ b/docs/system/devices/vhost-vdpa-generic-device.rst
@@ -0,0 +1,46 @@
+
+=========================
+vhost-vDPA generic device
+=========================
+
+This document explains the usage of the vhost-vDPA generic device.
+
+Description
+-----------
+
+vDPA(virtio data path acceleration) device is a device that uses a datapath
+which complies with the virtio specifications with vendor specific control
+path.
+
+QEMU provides two types of vhost-vDPA devices to enable the vDPA device, one
+is type sensitive which means QEMU needs to know the actual device type
+(e.g. net, blk, scsi) and another is called "vhost-vDPA generic device" which
+is type insensitive.
+
+The vhost-vDPA generic device builds on the vhost-vdpa subsystem and virtio
+subsystem. It is quite small, but it can support any type of virtio device.
+
+Examples
+--------
+
+Prepare the vhost-vDPA backends first:
+
+::
+  host# ls -l /dev/vhost-vdpa-*
+  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
+
+Start QEMU with virtio-mmio bus:
+
+::
+  host# qemu-system                                                  \
+      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
+      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
+      ...
+
+Start QEMU with virtio-pci bus:
+
+::
+  host# qemu-system                                                  \
+      -M pc -m 512 -smp 2                                            \
+      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
+      ...
-- 
2.23.0


