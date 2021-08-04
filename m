Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA393DFC97
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:14:46 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBC33-0007Xo-RU
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBC2G-0006rn-V9
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBC2E-0003jc-Uc
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628064834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LwoNzU3RDZ5XTh5ueYdOi4y66uq/p+JoJqnS8OH1w3g=;
 b=AdZ6JWxmN3JqMxjqVLhaa7ESJ/1J79IGKHnrqEqyYWW/6P0UOvRGwccPZPNVVsv2DjNAb8
 2BeVRKUNH2l8ZwZ/dSV4bU//EWwu851c3guttMf3uaKuFR8/XokfRQHGPGSyzbxDhKuVV3
 hXxsUO6Z3j+hEMlBi/0frtEu7XpUUqs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-l_30tm7zOg2vppJRmeQIrQ-1; Wed, 04 Aug 2021 04:13:52 -0400
X-MC-Unique: l_30tm7zOg2vppJRmeQIrQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso1070250edh.6
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LwoNzU3RDZ5XTh5ueYdOi4y66uq/p+JoJqnS8OH1w3g=;
 b=UCpZfIFmPAM/daLP3dce7iC8p3wqU/GpEV+BEzrhSNzqTQf9ZQlM2RXGZQ2SX4MuEl
 2TjwPlp/H+TEOi5wGHZroiqaeWCtwO4pV2FwtrWGDLnIX43svhetaSTXddkyaLmc1Eff
 NaRcSySGaGnAaCxQoK12qN/Z1L4jLYqlOps8KmStr2um8gwT47kPpVC6YR2fx3JoN2ve
 fTmYAswP4fDKlIz1l1HBSpzyIpjvIAF1uqz2jFWSZJdLHmJY1f5mSYXmh0XLETErhQNQ
 ZmblCBkobgcgd7pU7HHgioiGOIVaiLXAE6bLMiEBBMjybANghfkZAuRQRIWQLZK7w8rO
 OusQ==
X-Gm-Message-State: AOAM530jalGx9b/rQ85+eMzPj2rxI7PnnUXhab2iATWUZCumL6SleHt8
 nunj2IXCb8fxc8VILbaWFK9BIiu/NrMHlcxW1en0dUwI5X3DsrB6s8UeMdJW3+kUUz2MBikveW5
 ZXntHJ1JtRb7kToI=
X-Received: by 2002:a50:d651:: with SMTP id c17mr31045305edj.69.1628064831667; 
 Wed, 04 Aug 2021 01:13:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfjR/AXynZgO0KIdweF4b5DEKY/o5FO9AJc6uoe5cacW+SIHktBYbtPOwY5RKMAYfaCQiV/g==
X-Received: by 2002:a50:d651:: with SMTP id c17mr31045272edj.69.1628064831375; 
 Wed, 04 Aug 2021 01:13:51 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id o7sm431537ejy.48.2021.08.04.01.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:13:51 -0700 (PDT)
Date: Wed, 4 Aug 2021 10:13:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [PATCH v4] virtio/vsock: add two more queues for datagram types
Message-ID: <20210804081349.44gifmmks2uut6r5@steredhat>
References: <20210803234132.1557394-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210803234132.1557394-1-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: arseny.krasnov@kaspersky.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 11:41:32PM +0000, Jiang Wang wrote:
>Datagram sockets are connectionless and unreliable.
>The sender does not know the capacity of the receiver
>and may send more packets than the receiver can handle.
>
>Add two more dedicate virtqueues for datagram sockets,
>so that it will not unfairly steal resources from
>stream and future connection-oriented sockets.
>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>---
>v1 -> v2: use qemu cmd option to control number of queues,
>	removed configuration settings for dgram.
>v2 -> v3: use ioctl to get features and decide number of
>        virt queues, instead of qemu cmd option.
>v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>	in vhost_vsock_common_realize to indicate dgram is supported or not.
>
> hw/virtio/vhost-user-vsock.c                  |  2 +-
> hw/virtio/vhost-vsock-common.c                | 58 ++++++++++++++++++-
> hw/virtio/vhost-vsock.c                       |  5 +-
> include/hw/virtio/vhost-vsock-common.h        |  6 +-
> include/hw/virtio/vhost-vsock.h               |  4 ++
> include/standard-headers/linux/virtio_vsock.h |  1 +
> 6 files changed, 69 insertions(+), 7 deletions(-)
>
>diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>index 6095ed7349..e9ec0e1c00 100644
>--- a/hw/virtio/vhost-user-vsock.c
>+++ b/hw/virtio/vhost-user-vsock.c
>@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>         return;
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
>
>     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>
>diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>index 4ad6e234ad..c78536911a 100644
>--- a/hw/virtio/vhost-vsock-common.c
>+++ b/hw/virtio/vhost-vsock-common.c
>@@ -17,6 +17,8 @@
> #include "hw/virtio/vhost-vsock.h"
> #include "qemu/iov.h"
> #include "monitor/monitor.h"
>+#include <sys/ioctl.h>
>+#include <linux/vhost.h>
>
> int vhost_vsock_common_start(VirtIODevice *vdev)
> {
>@@ -196,9 +198,39 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>     return 0;
> }
>
>-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>+static int vhost_vsock_get_max_qps(bool enable_dgram)
>+{
>+    uint64_t features;
>+    int ret;
>+    int fd = -1;
>+
>+    if (!enable_dgram)
>+        return MAX_VQS_WITHOUT_DGRAM;
>+
>+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);


As I said in the previous version, we cannot directly open 
/dev/vhost-vsock, for two reasons:

   1. this code is common with vhost-user-vsock which does not use 
   /dev/vhost-vsock.

   2. the fd may have been passed from the management layer and qemu may 
   not be able to directly open /dev/vhost-vsock.

I think is better to move this function in hw/virtio/vhost-vsock.c, 
using the `vhostfd`, returning true or false if dgram is supported, then 
you can use it for `enable_dgram` param ...

>+    if (fd == -1) {
>+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
>+        return -1;
>+    }
>+
>+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
>+    if (ret) {
>+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));
>+        qemu_close(fd);
>+        return ret;
>+    }
>+
>+    qemu_close(fd);
>+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
>+        return MAX_VQS_WITH_DGRAM;
>+
>+    return MAX_VQS_WITHOUT_DGRAM;
>+}
>+
>+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
>
>     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>                 sizeof(struct virtio_vsock_config));
>@@ -209,12 +241,24 @@ void vhost_vsock_common_realize(VirtIODevice 
>*vdev, const char *name)
>     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);
>
>+    nvqs = vhost_vsock_get_max_qps(enable_dgram);
>+
>+    if (nvqs < 0)
>+        nvqs = MAX_VQS_WITHOUT_DGRAM;

... and here, if `enable_dgram` is true, you can set `nvqs = 
MAX_VQS_WITH_DGRAM``

>+
>+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                              vhost_vsock_common_handle_output);
>+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                               
>vhost_vsock_common_handle_output);
>+    }
>+

I'm still concerned about compatibility with guests that don't support 
dgram, as I mentioned in the previous email.

I need to do some testing, but my guess is it won't work if the host 
(QEMU and vhost-vsock) supports it and the guest doesn't.

I still think that we should allocate an array of queues and then decide 
at runtime which one to use for events (third or fifth) after the guest 
has acked the features.

>     /* The event queue belongs to QEMU */
>     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);
>
>-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
>-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
>+    vvc->vhost_dev.nvqs = nvqs;
>+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
>
>     vvc->post_load_timer = NULL;
> }
>@@ -227,6 +271,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>
>     virtio_delete_queue(vvc->recv_vq);
>     virtio_delete_queue(vvc->trans_vq);
>+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>+        virtio_delete_queue(vvc->dgram_recv_vq);
>+        virtio_delete_queue(vvc->dgram_trans_vq);
>+    }
>+
>+    if (vvc->vhost_dev.vqs)
>+        g_free(vvc->vhost_dev.vqs);
>+
>     virtio_delete_queue(vvc->event_vq);
>     virtio_cleanup(vdev);
> }
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index 1b1a5c70ed..f73523afaf 100644
>--- a/hw/virtio/vhost-vsock.c
>+++ b/hw/virtio/vhost-vsock.c
>@@ -23,6 +23,7 @@
>
> const int feature_bits[] = {
>     VIRTIO_VSOCK_F_SEQPACKET,
>+    VIRTIO_VSOCK_F_DGRAM,
>     VHOST_INVALID_FEATURE_BIT
> };
>
>@@ -116,6 +117,8 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>
>     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM)
>+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
>     return vhost_get_features(&vvc->vhost_dev, feature_bits,
>                                 requested_features);
> }
>@@ -175,7 +178,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>         qemu_set_nonblock(vhostfd);
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-vsock");
>+    vhost_vsock_common_realize(vdev, "vhost-vsock", true);
>
>     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
>diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
>index e412b5ee98..6669d24714 100644
>--- a/include/hw/virtio/vhost-vsock-common.h
>+++ b/include/hw/virtio/vhost-vsock-common.h
>@@ -27,12 +27,13 @@ enum {
> struct VHostVSockCommon {
>     VirtIODevice parent;
>
>-    struct vhost_virtqueue vhost_vqs[2];
>     struct vhost_dev vhost_dev;
>
>     VirtQueue *event_vq;
>     VirtQueue *recv_vq;
>     VirtQueue *trans_vq;
>+    VirtQueue *dgram_recv_vq;
>+    VirtQueue *dgram_trans_vq;
>
>     QEMUTimer *post_load_timer;
> };
>@@ -41,7 +42,8 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
> void vhost_vsock_common_stop(VirtIODevice *vdev);
> int vhost_vsock_common_pre_save(void *opaque);
> int vhost_vsock_common_post_load(void *opaque, int version_id);
>-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
>+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
>+			       bool enable_dgram);
> void vhost_vsock_common_unrealize(VirtIODevice *vdev);
>
> #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
>diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
>index 84f4e727c7..e10319785d 100644
>--- a/include/hw/virtio/vhost-vsock.h
>+++ b/include/hw/virtio/vhost-vsock.h
>@@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
> typedef struct {
>     uint64_t guest_cid;
>     char *vhostfd;
>+    bool enable_dgram;

This seems unused.

Thanks,
Stefano


