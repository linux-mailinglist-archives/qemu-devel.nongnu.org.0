Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85A6A1F1F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:59:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaQC-00061J-TD; Fri, 24 Feb 2023 10:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pVaPn-0005cZ-7F
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pVaPg-0005sL-DL
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677254111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdfE0nCxLA0iEBNRdfCG3ox5I4m2523p5+WhZcH/Tzs=;
 b=HUMqf3jhzQdDNFz12RLuZoNMjKtSl64XiSEnkRc8V1KS67cm2WB/cO6SR6gNAWJkEi7lVU
 ntXJhN/SV4dYQXTZsr6VBZ4ZVcNbe+cqYEQSkDPmsWv+ZbnjVmNI6yX05h5R4FA8NbTQ2a
 Vc8YnS38kORwHL7MyzoWRg+RH5OwvoI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-CBFGFpjNNOycquzJM8dPCA-1; Fri, 24 Feb 2023 10:55:08 -0500
X-MC-Unique: CBFGFpjNNOycquzJM8dPCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2554F1C05B02;
 Fri, 24 Feb 2023 15:55:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 478BCC15BA0;
 Fri, 24 Feb 2023 15:55:04 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Jason Wang <jasowang@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 alvaro.karsz@solid-run.com, longpeng2@huawei.com,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Subject: [PATCH v4 07/15] vdpa: add vhost_vdpa_suspend
Date: Fri, 24 Feb 2023 16:54:30 +0100
Message-Id: <20230224155438.112797-8-eperezma@redhat.com>
In-Reply-To: <20230224155438.112797-1-eperezma@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
v4:
* Look for _F_SUSPEND at vhost_dev->backend_cap, not backend_features
* Fall back on reset & fetch used idx from guest's memory
---
 hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++++++++
 hw/virtio/trace-events |  1 +
 2 files changed, 26 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 228677895a..f542960a64 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -712,6 +712,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
 
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
     trace_vhost_vdpa_reset_device(dev, status);
+    v->suspended = false;
     return ret;
 }
 
@@ -1109,6 +1110,29 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
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
+    if (!(dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
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
@@ -1123,6 +1147,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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


