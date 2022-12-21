Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F7653180
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:15:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynn-0006a3-F5; Wed, 21 Dec 2022 08:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynO-0005yt-QW
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynM-0004NN-LT
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e8powB56JtbuYONWR+65Vy5r+z/+gbMt2xbscg5z9Vc=;
 b=TX+928GBKoLVaNA5TgZsf1cHfL4NfM68YaJeNpKBCFWWI9ynhJ2KpaskjGmzjY7ubXxiaW
 cV/JlXcclHCgZn/bwbhT2u3reao9BCMUK1aUqPdTOfwDvLGENGkMooZBQ0HSi/12SSA9sc
 Kv4W5Rj5JNGfw0gPpLz4tMJl+kucBoo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-279-Qo0WDWOJPwSBBlxF0TSr5Q-1; Wed, 21 Dec 2022 08:06:02 -0500
X-MC-Unique: Qo0WDWOJPwSBBlxF0TSr5Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 h5-20020adfa4c5000000b0026755f9b55eso970886wrb.11
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8powB56JtbuYONWR+65Vy5r+z/+gbMt2xbscg5z9Vc=;
 b=kAxv/MqytJa0VR87V14Zz2AwP5PG/KStOdhccKeJXBZg+mQ+j3dsJVIdid75FWH+nn
 xBVky/5uOMsmzkJ5V5NXbtyPR8Fr84SjGsjw3U3KkJc06Y0e/MVty16KSv8lxODvZVZM
 jJzdHluZmaKY4JIf/3FVkqkoGojL44ZImln3ORZN/k8c9YRRJRfalZEKfxiUAY6qdWJJ
 yZWls/bI0w9BHacbaXwTGwmTeqYRnHH7fsp3F9qSLgs1NWHom9z492bw8RIT0Y1Ecx8b
 Oe4G/0W9/R/4ZwahzFyi/kMQ3m6Btjp8cEHt9cwvOHSXtFHMwgyMap7zPt528+e5m3zk
 H4xw==
X-Gm-Message-State: AFqh2koddYIOxqxtmo7+r8UXQmY+Dv8cV8eQAXF6y9CLof5pKz2DsAjk
 x/3rl7PExpopmeu/cYQuTkaEQ8Ijf/9D0t5LXxrt/5yZin1e5ct/7lWKsMFNXT2XmkRp743/8Mz
 4dnWQr7Ono9cwD5pH8X2hcILtk3DzG8KuaO9W5AAbezFDif/QwsdeZauIH7Be
X-Received: by 2002:a5d:4008:0:b0:264:ae8b:7de0 with SMTP id
 n8-20020a5d4008000000b00264ae8b7de0mr1200878wrp.39.1671627960501; 
 Wed, 21 Dec 2022 05:06:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvAaJskPhcQdCjsDCOLn+wn/eFW0GiVL74cWIwiWlsmnfgs3Zmev1lo227Ga71YiwpZdeoIbA==
X-Received: by 2002:a5d:4008:0:b0:264:ae8b:7de0 with SMTP id
 n8-20020a5d4008000000b00264ae8b7de0mr1200858wrp.39.1671627960151; 
 Wed, 21 Dec 2022 05:06:00 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 r4-20020adfa144000000b002367ad808a9sm15646373wrr.30.2022.12.21.05.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:59 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 Lei Yang <leiyang@redhat.com>, Yalan Zhang <yalzhang@redhat.com>
Subject: [PULL 27/41] vhost: fix vq dirty bitmap syncing when vIOMMU is enabled
Message-ID: <20221221130339.1234592-28-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jason Wang <jasowang@redhat.com>

When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
GPA. So we need to translate it to GPA before the syncing otherwise we
may hit the following crash since IOVA could be out of the scope of
the GPA log size. This could be noted when using virtio-IOMMU with
vhost using 1G memory.

Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
Cc: qemu-stable@nongnu.org
Tested-by: Lei Yang <leiyang@redhat.com>
Reported-by: Yalan Zhang <yalzhang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221216033552.77087-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 84 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 20 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7fb008bc9e..fdcd1a8fdf 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -20,6 +20,7 @@
 #include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "qemu/memfd.h"
+#include "qemu/log.h"
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
@@ -106,6 +107,24 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
     }
 }
 
+static bool vhost_dev_has_iommu(struct vhost_dev *dev)
+{
+    VirtIODevice *vdev = dev->vdev;
+
+    /*
+     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
+     * incremental memory mapping API via IOTLB API. For platform that
+     * does not have IOMMU, there's no need to enable this feature
+     * which may cause unnecessary IOTLB miss/update transactions.
+     */
+    if (vdev) {
+        return virtio_bus_device_iommu_enabled(vdev) &&
+            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    } else {
+        return false;
+    }
+}
+
 static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
                                    MemoryRegionSection *section,
                                    hwaddr first,
@@ -137,8 +156,51 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
             continue;
         }
 
-        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
-                              range_get_last(vq->used_phys, vq->used_size));
+        if (vhost_dev_has_iommu(dev)) {
+            IOMMUTLBEntry iotlb;
+            hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
+            hwaddr phys, s, offset;
+
+            while (used_size) {
+                rcu_read_lock();
+                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
+                                                      used_phys,
+                                                      true,
+                                                      MEMTXATTRS_UNSPECIFIED);
+                rcu_read_unlock();
+
+                if (!iotlb.target_as) {
+                    qemu_log_mask(LOG_GUEST_ERROR, "translation "
+                                  "failure for used_iova %"PRIx64"\n",
+                                  used_phys);
+                    return -EINVAL;
+                }
+
+                offset = used_phys & iotlb.addr_mask;
+                phys = iotlb.translated_addr + offset;
+
+                /*
+                 * Distance from start of used ring until last byte of
+                 * IOMMU page.
+                 */
+                s = iotlb.addr_mask - offset;
+                /*
+                 * Size of used ring, or of the part of it until end
+                 * of IOMMU page. To avoid zero result, do the adding
+                 * outside of MIN().
+                 */
+                s = MIN(s, used_size - 1) + 1;
+
+                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
+                                      range_get_last(phys, s));
+                used_size -= s;
+                used_phys += s;
+            }
+        } else {
+            vhost_dev_sync_region(dev, section, start_addr,
+                                  end_addr, vq->used_phys,
+                                  range_get_last(vq->used_phys, vq->used_size));
+        }
     }
     return 0;
 }
@@ -306,24 +368,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
     dev->log_size = size;
 }
 
-static bool vhost_dev_has_iommu(struct vhost_dev *dev)
-{
-    VirtIODevice *vdev = dev->vdev;
-
-    /*
-     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
-     * incremental memory mapping API via IOTLB API. For platform that
-     * does not have IOMMU, there's no need to enable this feature
-     * which may cause unnecessary IOTLB miss/update transactions.
-     */
-    if (vdev) {
-        return virtio_bus_device_iommu_enabled(vdev) &&
-            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-    } else {
-        return false;
-    }
-}
-
 static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
                               hwaddr *plen, bool is_write)
 {
-- 
MST


