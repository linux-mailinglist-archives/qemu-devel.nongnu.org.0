Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1656A9D92
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:25:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY99k-00007n-RK; Fri, 03 Mar 2023 12:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99i-0008Um-71
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY99g-0005Zg-Df
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MRg15iecJFcqPzVnfYjb93A0PQx0/yZcarEusnpsbQ=;
 b=cplyQ1p3HJUFqp6+MvdA1K760a5kHFQ9FyScITLv1jKNc965157vFaMwVcSo9tokk7ULm4
 WqpgZoxzqzDa0EYtESL9YNBZHQLag53I9bZfisbk7NZFq4yfZVoNSMJxn+dZvK5/OJZv9a
 3ybtiS9X+D3W8avqOv9WQe3fvDDDPf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-3eLmwFoBPq6d5pvzh2q5cw-1; Fri, 03 Mar 2023 12:25:10 -0500
X-MC-Unique: 3eLmwFoBPq6d5pvzh2q5cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F51D811E9C;
 Fri,  3 Mar 2023 17:25:09 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EAD0440D8;
 Fri,  3 Mar 2023 17:25:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Lei Yang <leiyang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Shannon Nelson <snelson@pensando.io>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v5 06/14] vdpa: add vhost_vdpa_suspend
Date: Fri,  3 Mar 2023 18:24:37 +0100
Message-Id: <20230303172445.1089785-7-eperezma@redhat.com>
In-Reply-To: <20230303172445.1089785-1-eperezma@redhat.com>
References: <20230303172445.1089785-1-eperezma@redhat.com>
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

The function vhost.c:vhost_dev_stop fetches the vring base so the vq
state can be migrated to other devices.  However, this is unreliable in
vdpa, since we didn't signal the device to suspend the queues, making
the value fetched useless.

Suspend the device if possible before fetching first and subsequent
vring bases.

Moreover, vdpa totally reset and wipes the device at the last device
before fetch its vrings base, making that operation useless in the last
device. This will be fixed in later patches of this series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v5: Fix backend_cap & suspend check polarity.

v4:
* Look for _F_SUSPEND at vhost_dev->backend_cap, not backend_features
* Fall back on reset & fetch used idx from guest's memory
---
 hw/virtio/vhost-vdpa.c | 26 ++++++++++++++++++++++++++
 hw/virtio/trace-events |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 517e3cdc8d..aecc01c6a7 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -692,11 +692,13 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
 
 static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
     uint8_t status = 0;
 
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
+    v->suspended = false;
     return ret;
 }
 
@@ -1095,6 +1097,29 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
     }
 }
 
+static void vhost_vdpa_suspend(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    int r;
+
+    if (!vhost_vdpa_first_dev(dev)) {
+        return;
+    }
+
+    if (dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND)) {
+        trace_vhost_vdpa_suspend(dev);
+        r = ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
+        if (unlikely(r)) {
+            error_report("Cannot suspend: %s(%d)", g_strerror(errno), errno);
+        } else {
+            v->suspended = true;
+            return;
+        }
+    }
+
+    vhost_vdpa_reset_device(dev);
+}
+
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
@@ -1109,6 +1134,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         }
         vhost_vdpa_set_vring_ready(dev);
     } else {
+        vhost_vdpa_suspend(dev);
         vhost_vdpa_svqs_stop(dev);
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index a87c5f39a2..8f8d05cf9b 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -50,6 +50,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
 vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
 vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
 vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
+vhost_vdpa_suspend(void *dev) "dev: %p"
 vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
 vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
 vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
-- 
2.31.1


