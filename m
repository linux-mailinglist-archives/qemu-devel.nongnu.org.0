Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93053041A6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:10:26 +0100 (CET)
Received: from localhost ([::1]:35426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pz6-0002QB-Ru
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l4PiZ-00040K-Tg
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:53:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l4PiW-0008Kl-1D
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611672794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iVzHitjQ65d9rNoOvG8RgaLLL8tAG3yv5PeD4xwGVIQ=;
 b=L3FZoQKe3jn0wXXLYRXf+HBoGd06NwRMgrwE2dPIxSCAfDJz5hLCyOEHoY+WRuJhhDqJrX
 2mrBWc8xGWlIP0kns72BYRqGDCxxet+slXNzi7IVMAX8GtKw3NQaXJuy9Fc/pcSjD04jEa
 vu5woA37W3xAo0Ob05B9+W2het/hz+k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-rGcExjbaOvuI_ssClJ8Umg-1; Tue, 26 Jan 2021 09:53:09 -0500
X-MC-Unique: rGcExjbaOvuI_ssClJ8Umg-1
Received: by mail-ej1-f69.google.com with SMTP id gt18so5042382ejb.18
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iVzHitjQ65d9rNoOvG8RgaLLL8tAG3yv5PeD4xwGVIQ=;
 b=qvfSq4qmxva4J2LM0+ag859j8RAG8f/WjYKxIWPcTKYqKEMzuBN7M7QXoiMdnvLW7n
 qPVK8POFMlZ9KleQPGneKKBorxS9mKrU8Dz79sHIHo940kD95DaIcsCPg79k7YeMn44v
 wugiG1vkvAjKq/3I2hw2Krby3HAvIAp5EpLXd0qWvvNRJ7R9vtrduIokFnXGGpDfflpW
 2GBiTqSXGZrJ/LsHcFNTlT8hwN2H5bH8HQkrZgj9r5trSyBlR8VU9F0gDs83wNh/jzaB
 lJujK98j/8BaQyr1tOmJq1Kog6kBaRlGQI77kDIh6sUqE3TJpFLPypeDzCix9NTtgYYK
 7iXQ==
X-Gm-Message-State: AOAM530ZyCqHzHQ+l/qwOOIPzEDgIRNu9j/iJZMHfvoKxuc0NHAQE2m8
 xJmr8m+mAVEf6jmw0ix4GIRJKo/tQYYjU761efrRxHjdZtS6mNq58xfiBO2MpPOyWtrtaSzrhGT
 xDHUZ3lLiViUirds=
X-Received: by 2002:a17:906:cc89:: with SMTP id
 oq9mr3644555ejb.154.1611672787936; 
 Tue, 26 Jan 2021 06:53:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZNHFLio7Xk4gE3NQ/xaycSK1mToeolc4hKtUyc+dOgdwHXv2WDutXHCrjIcpKp/D2q6C2kQ==
X-Received: by 2002:a17:906:cc89:: with SMTP id
 oq9mr3644540ejb.154.1611672787650; 
 Tue, 26 Jan 2021 06:53:07 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id zg24sm9953010ejb.120.2021.01.26.06.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:53:06 -0800 (PST)
Date: Tue, 26 Jan 2021 15:53:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v3 5/5] vhost-vdpa: add callback function for configure
 interrupt
Message-ID: <20210126145304.4zln64yyjbrdbq4p@steredhat>
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-6-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210126074254.3225-6-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 03:42:54PM +0800, Cindy Lu wrote:
>Add call back function for configure interrupt.
>Set the notifier's fd to the kernel driver when vdpa start.
>also set -1 while vdpa stop. then the kernel will release
>the related resource
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> hw/virtio/trace-events            |  2 ++
> hw/virtio/vhost-vdpa.c            | 37 ++++++++++++++++++++++++++++++-
> include/hw/virtio/vhost-backend.h |  4 ++++
> 3 files changed, 42 insertions(+), 1 deletion(-)
>
>diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>index 2060a144a2..6710835b46 100644
>--- a/hw/virtio/trace-events
>+++ b/hw/virtio/trace-events
>@@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
> vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
> vhost_vdpa_set_owner(void *dev) "dev: %p"
> vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
>+vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
>+
>
> # virtio.c
> virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index 01d2101d09..cc1d39d663 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -467,20 +467,47 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>     }
>     return ret;
>  }
>+static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
>+                                struct VirtIODevice *vdev, bool start)
>+{
>+    int fd, r;
>+    if (start) {
>+        fd = event_notifier_get_fd(&vdev->config_notifier);
>+        vdev->use_config_notifier = true;
>+     } else {
       ^
>+        fd = -1;
>+        vdev->use_config_notifier = false;
>+     }
       ^
>+     /*set the fd call back to vdpa driver*/
       ^
       It seems to me that there is an extra space in these places.

>+    r = dev->vhost_ops->vhost_set_config_call(dev, &fd);
>+    if (r) {
>+        vdev->use_config_notifier = false;
>+        info_report("vhost_vdpa_config_notify not started!");
>+    }
>+    /*active the config_notifier when vdev->use_config_notifier is true*/
>+    if ((vdev->use_config_notifier) && (start)) {
>+        event_notifier_set(&vdev->config_notifier);
>+    }
>+    return;
>
>+}

Here and also in other patches I would leave a new line between two 
functions.

> static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> {
>     struct vhost_vdpa *v = dev->opaque;
>     trace_vhost_vdpa_dev_start(dev, started);
>+    VirtIODevice *vdev = dev->vdev;
>+
>     if (started) {
>         uint8_t status = 0;
>         memory_listener_register(&v->listener, &address_space_memory);
>         vhost_vdpa_set_vring_ready(dev);
>         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
>-
>+        /*set the configure interrupt call back*/
>+        vhost_vdpa_config_notify_start(dev, vdev, true);
>         return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
>     } else {
>+        vhost_vdpa_config_notify_start(dev, vdev, false);
>         vhost_vdpa_reset_device(dev);
>         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                    VIRTIO_CONFIG_S_DRIVER);
>@@ -546,6 +573,13 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> }
>
>+static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
>+                                       int *fd)
>+{
>+    trace_vhost_vdpa_set_config_call(dev, fd);
>+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
>+}
>+
> static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                      uint64_t *features)
> {
>@@ -611,4 +645,5 @@ const VhostOps vdpa_ops = {
>         .vhost_get_device_id = vhost_vdpa_get_device_id,
>         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>         .vhost_force_iommu = vhost_vdpa_force_iommu,
>+        .vhost_set_config_call = vhost_vdpa_set_config_call,
> };
>diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>index 8a6f8e2a7a..1a2fee8994 100644
>--- a/include/hw/virtio/vhost-backend.h
>+++ b/include/hw/virtio/vhost-backend.h
>@@ -125,6 +125,9 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
>
> typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>
>+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
>+                                       int *fd);
                                          ^
                                          One more space :-)

Thanks,
Stefano


