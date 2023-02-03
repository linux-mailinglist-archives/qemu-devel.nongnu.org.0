Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8468A2B0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:13:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO1U4-0006eR-GW; Fri, 03 Feb 2023 14:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1Tr-0006ai-Eg
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1Tn-0007Ya-0i
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675451523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t41R//2gXUTGFX/p6w1zeOJkuTeMOogk+bxpMqyKN7U=;
 b=GmYUk3XX1g20PCgNDMz8+4XcYeQhW5IyjHgRkaGBTSzpfkj9E1IvS3DSk+hh+kArkuyTs8
 oSdWyXR69tVEVq1WqlRiF/fgWa6MUXVGA+RQHhnmh2cr2xF6qmNN7EYtEISclQgX2ap6h5
 HBjLFY1c3xdWoyJP0BH0Z+mWUWdJBh8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-4Fz9PczwOLW3OQA--H8akQ-1; Fri, 03 Feb 2023 14:11:58 -0500
X-MC-Unique: 4Fz9PczwOLW3OQA--H8akQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92FD180006E;
 Fri,  3 Feb 2023 19:11:57 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A859D492C14;
 Fri,  3 Feb 2023 19:11:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, longpeng2@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>, si-wei.liu@oracle.com,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 03/13] vdpa: add vhost_vdpa_suspend
Date: Fri,  3 Feb 2023 20:11:32 +0100
Message-Id: <20230203191142.362623-4-eperezma@redhat.com>
In-Reply-To: <20230203191142.362623-1-eperezma@redhat.com>
References: <20230203191142.362623-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
 hw/virtio/vhost-vdpa.c | 19 +++++++++++++++++++
 hw/virtio/trace-events |  1 +
 2 files changed, 20 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 2e79fbe4b2..b681841cdc 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1108,6 +1108,24 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
     }
 }
 
+static void vhost_vdpa_suspend(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+    int r;
+
+    if (!vhost_vdpa_first_dev(dev) ||
+        !(dev->backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
+        return;
+    }
+
+    trace_vhost_vdpa_suspend(dev);
+    r = ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
+    if (unlikely(r)) {
+        error_report("Cannot suspend: %s(%d)", g_strerror(errno), errno);
+        /* Not aborting since we're called from stop context */
+    }
+}
+
 static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
@@ -1122,6 +1140,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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


