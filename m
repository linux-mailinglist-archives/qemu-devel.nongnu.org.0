Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF0489125
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:30:58 +0100 (CET)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6p8r-0007ku-12
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:30:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouk-0007H3-3v
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouh-0001ku-4U
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F/oNzty8wOZ0UJdfMdde20DU24oDHdNfaZ3a+zRdt7Y=;
 b=ISuVZJVhcbT9IFiNuzD1J3SMdBow4f3oKrwdjo7AZpBOPPCVPokRTDtMPZz5pLvF1aXXka
 6LGIj2/eIsQets9bABCRsTXZ7TuJMfzpQYPw9SIvwku9GNfC8Zrdwxryl0NQ8eRHrWhEJP
 /01uPsK4QMMRux/u4GYFWM0UmxkCPCI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-VK1bO4z0O8e_w_mpN6Cu7w-1; Mon, 10 Jan 2022 02:16:17 -0500
X-MC-Unique: VK1bO4z0O8e_w_mpN6Cu7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 h26-20020adfa4da000000b001a652d52d8eso1845578wrb.16
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F/oNzty8wOZ0UJdfMdde20DU24oDHdNfaZ3a+zRdt7Y=;
 b=kKZ43crIokZ4zDXsGbOiARZU+pod/9yVGgagIniOAwLqL9OAQsY27Xa6NVihMlWwDQ
 Ycqpkk9vQaurZESsZQnKvKdP0h2rIib2WSbYHQtGMu6MyosuP+0oElIxL8QSvCuUKAI+
 SnOcfz4wViR1cS4L50kAvwKNXRhrKurcJFUWRwXCGV/wbE29STFntF6xsm1nMql9pv/w
 rMsFrFZZjKeTLX/jhs6f3g9M/ecuUYGRLGr0SQNQ/fzoNLfjCEIiQUrCM+xd4jK5LToy
 dNQqHotBhqG60uRoUo8U84FvVhuij9Z+B2YDC7n3VjN33GANUpKzjADl4vCvKm3Wo12q
 ++pA==
X-Gm-Message-State: AOAM533j0a4v6yt/zIFe1yPvYCmStwiQQ2cqUvQuAMvqd6L1sft2UfjX
 d28uK/PInk/EAyqEuiSSUQ1Bu02gBowCvmAKs7fRlP1vnZDgl/vSMF66+RgxnpbaIYMxswVj11r
 Yn0Fncx0tKhOdoKNW4LhwqwH+jFDBqIARqtXiWOPdrbOec3CcpTIzi1rjopsX
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr1362873wmj.8.1641798976019; 
 Sun, 09 Jan 2022 23:16:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXdGNrSQsib8QIieFUXa0KgjuQTHraa9cLksGzACqu/ho8+vNYn+2nUBOHuxTyjcSWj1iI1w==
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr1362857wmj.8.1641798975844; 
 Sun, 09 Jan 2022 23:16:15 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id m5sm5831714wml.14.2022.01.09.23.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:15 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] Revert "vhost: add support for configure interrupt"
Message-ID: <20220110071547.195669-5-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit f7220a7ce21604a4bc6260ccca4dc9068c1f27f2.
---
 include/hw/virtio/vhost.h |  4 ---
 hw/virtio/vhost.c         | 76 ---------------------------------------
 2 files changed, 80 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index b0f3b78987..58a73e7b7a 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -29,7 +29,6 @@ struct vhost_virtqueue {
     unsigned long long used_phys;
     unsigned used_size;
     EventNotifier masked_notifier;
-    EventNotifier masked_config_notifier;
     struct vhost_dev *dev;
 };
 
@@ -38,7 +37,6 @@ typedef unsigned long vhost_log_chunk_t;
 #define VHOST_LOG_BITS (8 * sizeof(vhost_log_chunk_t))
 #define VHOST_LOG_CHUNK (VHOST_LOG_PAGE * VHOST_LOG_BITS)
 #define VHOST_INVALID_FEATURE_BIT   (0xff)
-#define VHOST_QUEUE_NUM_CONFIG_INR 0
 
 struct vhost_log {
     unsigned long long size;
@@ -118,8 +116,6 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
-bool vhost_config_pending(struct vhost_dev *hdev);
-void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask);
 
 /* Test and clear masked event pending status.
  * Should be called after unmask to avoid losing events.
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index cbf3b792da..7b03efccec 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1554,67 +1554,6 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
     }
 }
 
-bool vhost_config_pending(struct vhost_dev *hdev)
-{
-    assert(hdev->vhost_ops);
-    if ((hdev->started == false) ||
-        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
-        return false;
-    }
-
-    EventNotifier *notifier =
-        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier;
-    return event_notifier_test_and_clear(notifier);
-}
-
-void vhost_config_mask(struct vhost_dev *hdev, VirtIODevice *vdev, bool mask)
-{
-    int fd;
-    int r;
-    EventNotifier *notifier =
-        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier;
-    EventNotifier *config_notifier = &vdev->config_notifier;
-    assert(hdev->vhost_ops);
-
-    if ((hdev->started == false) ||
-        (hdev->vhost_ops->vhost_set_config_call == NULL)) {
-        return;
-    }
-    if (mask) {
-        assert(vdev->use_guest_notifier_mask);
-        fd = event_notifier_get_fd(notifier);
-    } else {
-        fd = event_notifier_get_fd(config_notifier);
-    }
-    r = hdev->vhost_ops->vhost_set_config_call(hdev, fd);
-    if (r < 0) {
-        VHOST_OPS_DEBUG(r, "vhost_set_config_call failed");
-    }
-}
-
-static void vhost_stop_config_intr(struct vhost_dev *dev)
-{
-    int fd = -1;
-    assert(dev->vhost_ops);
-    if (dev->vhost_ops->vhost_set_config_call) {
-        dev->vhost_ops->vhost_set_config_call(dev, fd);
-    }
-}
-
-static void vhost_start_config_intr(struct vhost_dev *dev)
-{
-    int r;
-
-    assert(dev->vhost_ops);
-    int fd = event_notifier_get_fd(&dev->vdev->config_notifier);
-    if (dev->vhost_ops->vhost_set_config_call) {
-        r = dev->vhost_ops->vhost_set_config_call(dev, fd);
-        if (!r) {
-            event_notifier_set(&dev->vdev->config_notifier);
-        }
-    }
-}
-
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features)
 {
@@ -1827,16 +1766,6 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
     }
 
-    r = event_notifier_init(
-        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier, 0);
-    if (r < 0) {
-        return r;
-    }
-    event_notifier_test_and_clear(
-        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
-    if (!vdev->use_guest_notifier_mask) {
-        vhost_config_mask(hdev, vdev, true);
-    }
     if (hdev->log_enabled) {
         uint64_t log_base;
 
@@ -1869,7 +1798,6 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
     }
-    vhost_start_config_intr(hdev);
     return 0;
 fail_log:
     vhost_log_put(hdev, false);
@@ -1895,9 +1823,6 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
 
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
-    event_notifier_test_and_clear(
-        &hdev->vqs[VHOST_QUEUE_NUM_CONFIG_INR].masked_config_notifier);
-    event_notifier_test_and_clear(&vdev->config_notifier);
 
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
@@ -1915,7 +1840,6 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
         memory_listener_unregister(&hdev->iommu_listener);
     }
-    vhost_stop_config_intr(hdev);
     vhost_log_put(hdev, true);
     hdev->started = false;
     hdev->vdev = NULL;
-- 
MST


