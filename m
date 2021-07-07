Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2603BE480
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:35:47 +0200 (CEST)
Received: from localhost ([::1]:55288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1322-00031g-Ky
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m12zh-0000RC-Em
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:33:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m12ze-0005fV-R0
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625646797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yz9cnu5TKsNwUG7BVyniu5x6VkvqRaoWmZoxrapcnd0=;
 b=FDXLvDuwmMcoy0kUCvqUC/Wc6GBEHdCNUB+O1eOPogFyIlM3o0+808hzo2CrnYc10CGiP6
 ssq+ZEhZmC3QvKgCyTIAepsGNeaa/V/bwzwo0MS+wb3Q1SuumTd4rykfzZuMLdFNxXkwMr
 WlrebvGOMF6+rrYtBCes5MynqTznFA8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-iLrY0yF2OpS1Kpv4BG0Qtw-1; Wed, 07 Jul 2021 04:33:16 -0400
X-MC-Unique: iLrY0yF2OpS1Kpv4BG0Qtw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g4-20020a5d64e40000b029013398ce8904so499694wri.16
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 01:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yz9cnu5TKsNwUG7BVyniu5x6VkvqRaoWmZoxrapcnd0=;
 b=mrU4T02Yx8JKEE0reSfPBGAF/1ykKhwPAnji1ZxVq3mIeVgSrUP0g4aQCD2FV0SjtY
 K5XZ+NPbMKKF1JD41inWtuJ07IWJ4BFE6D3o0vzJ/ozgBau+Sx9Mbcu0oETDUc1BL5Ae
 oN+X57cB1n3FjzSR4UaxAuhp2TbgPs+8JJs303Dr+RHZi9J2CzKcBQ1ygGp21DlHb59u
 i5SJx1lchsd8cfNwyBBHGcdMSb8p8ng15VPflgq63twezLU5EXovM/uJ5cntrGZgxZio
 02w92lDkEpHbRNZg/9YodYhhyufbdXkdClvb+WvXfo+M2j+AKkzGWOmpwDk5fxQCOMZ7
 v5PA==
X-Gm-Message-State: AOAM5303V35zIUxLNmSD4WJAROiQcjtPJul1qZjJe0uGUmKZjZ7E3cMw
 IDMFvSsAQKDVzS1eaiHJssHV2J8QV7Bl/7CMjh2MhpeJ9b9SqcfTNTAN8PfrngrnxBjvCyICxjd
 T4njZrBM3sgBS0dQ=
X-Received: by 2002:adf:9466:: with SMTP id 93mr26881117wrq.340.1625646795471; 
 Wed, 07 Jul 2021 01:33:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxtephxj0L92DaGftgyTOS81VrgoM4j4EOzmYj95SonX4Xu16/WfhG0jkZ1sqTE7junlGR8A==
X-Received: by 2002:adf:9466:: with SMTP id 93mr26881087wrq.340.1625646795151; 
 Wed, 07 Jul 2021 01:33:15 -0700 (PDT)
Received: from steredhat (host-87-7-214-34.retail.telecomitalia.it.
 [87.7.214.34])
 by smtp.gmail.com with ESMTPSA id m6sm23253033wrw.9.2021.07.07.01.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 01:33:14 -0700 (PDT)
Date: Wed, 7 Jul 2021 10:33:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v3] virtio/vsock: add two more queues for datagram types
Message-ID: <20210707083312.algmreafmfofg7el@steredhat>
References: <20210706222607.1058040-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210706222607.1058040-1-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Jul 06, 2021 at 10:26:07PM +0000, Jiang Wang wrote:
>Datagram sockets are connectionless and unreliable.
>The sender does not know the capacity of the receiver
>and may send more packets than the receiver can handle.
>
>Add two more dedicate virtqueues for datagram sockets,
>so that it will not unfairly steal resources from
>stream and future connection-oriented sockets.
>---
>v1 -> v2: use qemu cmd option to control number of queues,
>        removed configuration settings for dgram.
>v2 -> v3: use ioctl to get features and decie numbr of
>       virt queues, instead of qemu cmd option.
>
>btw: this patch is based on Arseny's SEQPACKET patch.
>
> hw/virtio/vhost-vsock-common.c                | 53 ++++++++++++++++++++++++++-
> hw/virtio/vhost-vsock.c                       |  3 ++
> include/hw/virtio/vhost-vsock-common.h        |  3 +-
> include/hw/virtio/vhost-vsock.h               |  4 ++
> include/standard-headers/linux/virtio_vsock.h |  3 ++
> 5 files changed, 63 insertions(+), 3 deletions(-)
>
>diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>index 4ad6e234ad..8164e09445 100644
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
>@@ -196,9 +198,36 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>     return 0;
> }
>
>+static int vhost_vsock_get_max_qps(void)
>+{
>+    uint64_t features;
>+    int ret;
>+    int fd = -1;
>+
>+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);
>+    if (fd == -1) {
>+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
>+        return -1;
>+    }

You should use the `vhostfd` already opened in 
vhost_vsock_device_realize(), since QEMU may not have permission to 
access to the device, and the file descriptor can be passed from the 
management layer.

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
> void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
>
>     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>                 sizeof(struct virtio_vsock_config));
>@@ -209,12 +238,24 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);
>
>+    nvqs = vhost_vsock_get_max_qps();

You can't do this here, since the vhost-vsock-common.c functions are 
used also by vhost-user-vsock, that doesn't use the /dev/vhost-vsock 
device since the device is emulated in a separate user process.

I think you can use something similar to what you did in v2, where you 
passed a parameter to vhost_vsock_common_realize() to enable or not the 
datagram queues.

>+
>+    if (nvqs < 0)
>+        nvqs = MAX_VQS_WITHOUT_DGRAM;
>+
>+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                              vhost_vsock_common_handle_output);
>+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                               vhost_vsock_common_handle_output);
>+    }
>+
>     /* The event queue belongs to QEMU */
>     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);

Did you do a test with a guest that doesn't support datagram with QEMU 
and hosts that do?

I repost my thoughts that I had on v2:

     What happen if the guest doesn't support dgram?

     I think we should dynamically use the 3rd queue or the 5th queue for 
     the events at runtime after the guest acked the features.

     Maybe better to switch to an array of VirtQueue.

>
>-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
>-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
>+    vvc->vhost_dev.nvqs = nvqs;
>+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
>
>     vvc->post_load_timer = NULL;
> }
>@@ -227,6 +268,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>
>     virtio_delete_queue(vvc->recv_vq);
>     virtio_delete_queue(vvc->trans_vq);
>+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>+        virtio_delete_queue(vvc->dgram_recv_vq);
>+        virtio_delete_queue(vvc->dgram_trans_vq);
>+    }
>+
>+    if (vvc->vhost_dev.vqs)

g_free() already handles NULL pointers, so you can remove this check.

>+        g_free(vvc->vhost_dev.vqs);
>+
>     virtio_delete_queue(vvc->event_vq);
>     virtio_cleanup(vdev);
> }
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index 1b1a5c70ed..33bbe16983 100644
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
>diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
>index e412b5ee98..798715241f 100644
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
>diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
>index 84f4e727c7..e10319785d 100644
>--- a/include/hw/virtio/vhost-vsock.h
>+++ b/include/hw/virtio/vhost-vsock.h
>@@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
> typedef struct {
>     uint64_t guest_cid;
>     char *vhostfd;
>+    bool enable_dgram;

Leftover?

> } VHostVSockConf;
>
> struct VHostVSock {
>@@ -33,4 +34,7 @@ struct VHostVSock {
>     /*< public >*/
> };
>
>+#define MAX_VQS_WITHOUT_DGRAM 2
>+#define MAX_VQS_WITH_DGRAM 4
>+
> #endif /* QEMU_VHOST_VSOCK_H */
>diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
>index 5eac522ee2..6ff8c5084c 100644
>--- a/include/standard-headers/linux/virtio_vsock.h
>+++ b/include/standard-headers/linux/virtio_vsock.h
>@@ -41,6 +41,9 @@
> /* The feature bitmap for virtio vsock */
> #define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET supported */
>
>+/* Feature bits */
>+#define VIRTIO_VSOCK_F_DGRAM 0 /*Does vsock support dgram */

Bit 0 is reserved for STREAM, IIRC also in the virtio-spec proposal you 
used bit 2 for DGRAM.

Thanks,
Stefano


