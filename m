Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC54E9C24
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:23:37 +0200 (CEST)
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYs9Y-0000lf-8I
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:23:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1nYs7G-00084o-Nn; Mon, 28 Mar 2022 12:21:18 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1nYs7D-00023n-D8; Mon, 28 Mar 2022 12:21:14 -0400
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KRyYg0RGDzCrQc;
 Tue, 29 Mar 2022 00:18:47 +0800 (CST)
Received: from huawei.com (10.175.124.27) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 29 Mar
 2022 00:20:58 +0800
To: <qemu-block@nongnu.org>, <raphael.norwitz@nutanix.com>, <mst@redhat.com>, 
 <kwolf@redhat.com>, <hreitz@redhat.com>
CC: <qemu-devel@nongnu.org>, <wangjie88@huawei.com>, <weidong.huang@huawei.com>
Subject: [PATCH] hw/vhost-user-blk: fix ioeventfd add failed when start reenter
Date: Tue, 29 Mar 2022 00:15:46 +0800
Message-ID: <20220328161546.917234-1-wangjie88@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=wangjie88@huawei.com;
 helo=szxga02-in.huawei.com
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
Reply-to:  Jie Wang <wangjie88@huawei.com>
From:  Jie Wang via <qemu-devel@nongnu.org>

During Virtio1.0 dev(start_on_kick) in vhost_user_blk_start process,
if spdk abnormal after vhost_dev_enable_notifiers, then vhost_user_blk_start will
goto vhost_dev_disable_notifiers and reenter vhost_user_blk_start, and
add ioeventfd again.

func call Process as follows:
vhost_user_blk_start(spdk abnormal after vhost_dev_enable_notifiers)
->vhost_dev_disable_notifiers
->virtio_bus_cleanup_host_notifier
->virtio_queue_host_notifier_read
->virtio_queue_notify_vq
->vhost_user_blk_handle_output
->vhost_user_blk_start
->vhost_dev_enable_notifiers

then kvm_mem_ioeventfd_add will failed with errno17(File exists) and
abort().

The GDB stack is as follows:
(gdb) bt
0  0x00007fca4264c81b in raise () from /usr/lib64/libc.so.6
1  0x00007fca4264db41 in abort () from /usr/lib64/libc.so.6
2  0x00007fca423ebe8b in kvm_mem_ioeventfd_add
3  0x00007fca4241c816 in address_space_add_del_ioeventfds
4  0x00007fca4241ddc6 in address_space_update_ioeventfds
5  0x00007fca424203d5 in memory_region_commit ()
6  0x00007fca424204e5 in memory_region_transaction_commit ()
7  0x00007fca42421861 in memory_region_add_eventfd
8  0x00007fca42917a4c in virtio_pci_ioeventfd_assign
9  0x00007fca41054178 in virtio_bus_set_host_notifier
10 0x00007fca41058729 in vhost_dev_enable_notifiers
11 0x00007fca40fdec1e in vhost_user_blk_start
12 0x00007fca40fdefa8 in vhost_user_blk_handle_output
13 0x00007fca4104e135 in virtio_queue_notify_vq
14 0x00007fca4104f192 in virtio_queue_host_notifier_read
15 0x00007fca41054054 in virtio_bus_cleanup_host_notifier
16 0x00007fca41058916 in vhost_dev_disable_notifiers
17 0x00007fca40fdede0 in vhost_user_blk_start
18 0x00007fca40fdefa8 in vhost_user_blk_handle_output
19 0x00007fca41050a6d in virtio_queue_notify
20 0x00007fca4241bbae in memory_region_write_accessor
21 0x00007fca4241ab1d in access_with_adjusted_size
22 0x00007fca4241e466 in memory_region_dispatch_write
23 0x00007fca4242da36 in flatview_write_continue
24 0x00007fca4242db75 in flatview_write
25 0x00007fca42430beb in address_space_write
26 0x00007fca42430c25 in address_space_rw
27 0x00007fca423e8ecc in kvm_handle_io
28 0x00007fca423ecb48 in kvm_cpu_exec
29 0x00007fca424279d5 in qemu_kvm_cpu_thread_fn
30 0x00007fca423c9480 in qemu_thread_start
31 0x00007fca4257ff3b in ?? () from /usr/lib64/libpthread.so.0
32 0x00007fca4270b550 in clone () from /usr/lib64/libc.so.6

Signed-off-by: Jie Wang <wangjie88@huawei.com>
---
 hw/block/vhost-user-blk.c          | 12 +++++++++++-
 include/hw/virtio/vhost-user-blk.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1a42ae9187..2182769676 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -124,6 +124,13 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     int i, ret;
 
+    if (vdev->start_on_kick) {
+        if (s->starting) {
+            return 0;
+        }
+        s->starting = true;
+    }
+
     if (!k->set_guest_notifiers) {
         error_setg(errp, "binding does not support guest notifiers");
         return -ENOSYS;
@@ -178,6 +185,8 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         vhost_virtqueue_mask(&s->dev, vdev, i, false);
     }
 
+    s->starting = false;
+
     return ret;
 
 err_guest_notifiers:
@@ -344,7 +353,7 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
     }
 
     /* restore vhost state */
-    if (virtio_device_started(vdev, vdev->status)) {
+    if (s->starting || virtio_device_started(vdev, vdev->status)) {
         ret = vhost_user_blk_start(vdev, errp);
         if (ret < 0) {
             return ret;
@@ -500,6 +509,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
                                         vhost_user_blk_handle_output);
     }
 
+    s->starting = false;
     s->inflight = g_new0(struct vhost_inflight, 1);
     s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
 
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 7c91f15040..6e67f36962 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -51,6 +51,8 @@ struct VHostUserBlk {
     bool connected;
     /* vhost_user_blk_start/vhost_user_blk_stop */
     bool started_vu;
+
+    bool starting;
 };
 
 #endif
-- 
2.23.0


