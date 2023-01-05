Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9565E801
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:39:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLh-0002Qg-QH; Thu, 05 Jan 2023 04:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLT-0002EK-TK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLR-00076n-U3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+xcXVTlPeptVuSlj1Zo7g+4j3dPj3ynx76m4Fa2ITrk=;
 b=dOCwKsgKyH3UEkSSVyhj+3BBbzw+Hg13PADeUpgRxs9p5o2KTL4WdqXZAnaiLv700gYWG/
 zREpC9uO5c2UioAEeLq3+EYMuBMlTeFs/sr/cUgoLhCxa/E1YBnxZu+BeptMmR8vtoVXyz
 JbVEh4iDlp149fqcLdQLm/dITG79c6k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-7AgBp5IOMRSYZ6-CGrnNoQ-1; Thu, 05 Jan 2023 04:15:28 -0500
X-MC-Unique: 7AgBp5IOMRSYZ6-CGrnNoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so17469792wms.7
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xcXVTlPeptVuSlj1Zo7g+4j3dPj3ynx76m4Fa2ITrk=;
 b=E2AP8dOCUXtJTKVBxiB8js/T6SJZDbZP/YMOu/sOM1d3Zi0YSMoF2UDy/mswglWdLR
 +bNryUGh4bgcjZ+ZK/L8g4aZyzSvxUNWQfgtsfXY9E/Z6J8A794xb2pizBbhg/0ep9cg
 2bWnm4mxA41cTY1pYhdNNSk4YImyccD6X5LAiUTLWqDf8aufDtMhcqV0F4uZp8U8RUFe
 e4rG2Bv8ErHeLI9sK4ej/nGmKdUnjaAL7Ks+dxiTJH70Ln+q6XW36gak+VY4yjdIUP9w
 mCAMfKuQDiEG58eS+t0zdFu8dpb5MgVbYgqrl8nvgsENl4MYATAFDMYaYjwtd3wK5XUp
 NMRw==
X-Gm-Message-State: AFqh2kpTXM18pbJn6tLGZGIvqrqw7eh+o5glTVSk8QSvMistYrWVQAyL
 rnOXZeua/bKcuEFYkovvb9BciagKV33PZDnpDZQCRB+VCyOckl3CnGUD++iLiiUgP+apeDimqWz
 O9U3g7IwV2GOxSb4f4h9L6uEqVfDKyKLKfThGrBHPjpdI7ycLyPcG47NDntdn
X-Received: by 2002:a05:600c:1911:b0:3d9:8635:a916 with SMTP id
 j17-20020a05600c191100b003d98635a916mr30162095wmq.9.1672910126733; 
 Thu, 05 Jan 2023 01:15:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvdevg0tfB91G+b6HdmKDjwT9Rleaj7VWZ7cag8pRKP+6sqr4L9YYFZgOn4VPtG1Jo5H6gBGg==
X-Received: by 2002:a05:600c:1911:b0:3d9:8635:a916 with SMTP id
 j17-20020a05600c191100b003d98635a916mr30162081wmq.9.1672910126447; 
 Thu, 05 Jan 2023 01:15:26 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003c6f8d30e40sm1857080wms.31.2023.01.05.01.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:25 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 21/51] vhost: add support for configure interrupt
Message-ID: <20230105091310.263867-22-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Cindy Lu <lulu@redhat.com>

Add functions to support configure interrupt.
The configure interrupt process will start in vhost_dev_start
and stop in vhost_dev_stop.

Also add the functions to support vhost_config_pending and
vhost_config_mask.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-8-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h |  4 ++
 hw/virtio/vhost.c         | 78 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 1cafa0d776..a52f273347 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -33,6 +33,7 @@ struct vhost_virtqueue {
     unsigned used_size;
     EventNotifier masked_notifier;
     EventNotifier error_notifier;
+    EventNotifier masked_config_notifier;
     struct vhost_dev *dev;
 };
 
@@ -41,6 +42,7 @@ typedef unsigned long vhost_log_chunk_t;
 #define VHOST_LOG_BITS (8 * sizeof(vhost_log_chunk_t))
 #define VHOST_LOG_CHUNK (VHOST_LOG_PAGE * VHOST_LOG_BITS)
 #define VHOST_INVALID_FEATURE_BIT   (0xff)
+#define VHOST_QUEUE_NUM_CONFIG_INR 0
 
 struct vhost_log {
     unsigned long long size;
@@ -187,6 +189,8 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
  * Disable direct notifications to vhost device.
  */
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
+bool vhost_config_pending(struct vhost_dev *hdev);
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask);
 
 /**
  * vhost_dev_is_started() - report status of vhost device
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index fdcd1a8fdf..2c566dc539 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1640,7 +1640,68 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     file.index = hdev->vhost_ops->vhost_get_vq_index(hdev, n);
     r = hdev->vhost_ops->vhost_set_vring_call(hdev, &file);
     if (r < 0) {
-        VHOST_OPS_DEBUG(r, "vhost_set_vring_call failed");
+        error_report("vhost_set_vring_call failed %d", -r);
+    }
+}
+
+bool vhost_config_pending(struct vhost_dev *hdev)
+{
+    assert(hdev->vhost_ops);
+    if ((hdev->started == false) ||
+        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
+        return false;
+    }
+
+    EventNotifier *notifier =
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier;
+    return event_notifier_test_and_clear(notifier);
+}
+
+void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask)
+{
+    int fd;
+    int r;
+    EventNotifier *notifier =
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier;
+    EventNotifier *config_notifier = &vdev->config_notifier;
+    assert(hdev->vhost_ops);
+
+    if ((hdev->started == false) ||
+        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
+        return;
+    }
+    if (mask) {
+        assert(vdev->use_guest_notifier_mask);
+        fd = event_notifier_get_fd(notifier);
+    } else {
+        fd = event_notifier_get_fd(config_notifier);
+    }
+    r = hdev->vhost_ops->vhost_set_config_call(hdev, fd);
+    if (r < 0) {
+        error_report("vhost_set_config_call failed %d", -r);
+    }
+}
+
+static void vhost_stop_config_intr(struct vhost_dev *dev)
+{
+    int fd = -1;
+    assert(dev->vhost_ops);
+    if (dev->vhost_ops->vhost_set_config_call) {
+        dev->vhost_ops->vhost_set_config_call(dev, fd);
+    }
+}
+
+static void vhost_start_config_intr(struct vhost_dev *dev)
+{
+    int r;
+
+    assert(dev->vhost_ops);
+    int fd = event_notifier_get_fd(&dev->vdev->config_notifier);
+    if (dev->vhost_ops->vhost_set_config_call) {
+        r = dev->vhost_ops->vhost_set_config_call(dev, fd);
+        if (!r) {
+            event_notifier_set(&dev->vdev->config_notifier);
+        }
     }
 }
 
@@ -1880,6 +1941,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
         }
     }
 
+    r = event_notifier_init(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier, 0);
+    if (r < 0) {
+        return r;
+    }
+    event_notifier_test_and_clear(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
+    if (!vdev->use_guest_notifier_mask) {
+        vhost_config_mask(hdev, vdev, true);
+    }
     if (hdev->log_enabled) {
         uint64_t log_base;
 
@@ -1918,6 +1989,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
+    vhost_start_config_intr(hdev);
     return 0;
 fail_start:
     if (vrings) {
@@ -1947,6 +2019,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
+    event_notifier_test_and_clear(
+        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
+    event_notifier_test_and_clear(&vdev->config_notifier);
 
     trace_vhost_dev_stop(hdev, vdev->name, vrings);
 
@@ -1969,6 +2044,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
         }
         memory_listener_unregister(&hdev->iommu_listener);
     }
+    vhost_stop_config_intr(hdev);
     vhost_log_put(hdev, true);
     hdev->started = false;
     vdev->vhost_started = false;
-- 
MST


