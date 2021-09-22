Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73A41451A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 11:27:30 +0200 (CEST)
Received: from localhost ([::1]:34676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSyXJ-0007W1-6U
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 05:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSyTu-0006Lt-DQ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mSyTp-0004KZ-M8
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632302631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZOxtW8jJkQXh1r9B0LqkX7gcH/7G2ROnZiZK9f8mDs=;
 b=DLclxVXc20Q1NurOWh8JnfziJrIekaEejNYZ7lTxtOzQzyE/ph380tyjN9/6huIT0AwHMJ
 s+GGs1/r3tFIq6XliXaHADeIw3B7O8sQzRYeucNVOPzSKppqmYUQ0FmtkNhYuxlJQb2NUo
 vxRW3t8eAQKb97DOGOz4yDBOZYXOliA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-wLPsLo7AM1mgZLbjCXwPww-1; Wed, 22 Sep 2021 05:23:50 -0400
X-MC-Unique: wLPsLo7AM1mgZLbjCXwPww-1
Received: by mail-ed1-f70.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso2401772edx.2
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 02:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qZOxtW8jJkQXh1r9B0LqkX7gcH/7G2ROnZiZK9f8mDs=;
 b=6Dh2aIxS7ERo2fu3pcGV/J0dnLLSJKCxLkMbqHp7wjjBlQM6GomPpiXLhKCM0Or6a5
 8o7QtI9u4DLwY2BTrMllj3UW0a7G3LbKP8PaRv3DGE7GfDmOE7Fh2xN1EgE7V2komQCt
 2gql10WOADjx0h23iX2vvSTEhpi1nhfknJdFv+nYncv7lOIixfPt2yImsmkYa7v07AbK
 LYDo8RDTXeHV037/QR6lUDnaMEm4Xp7mDHmyqu2TOEEP0LKCNQj8mr7GCdUlA6t0pTPF
 t0H4LgIV2AkmpeUFbGvKUgxuJquPdLVeBwvq85AZq3nx1AU1FWvSTTAWtu7HjH4AOJLr
 AxdQ==
X-Gm-Message-State: AOAM531BwMHOAM5xtRBfL1xicifR41zSV5LwzqgLt0XVXPgBnbM5ptBK
 3pbcn9FXpR4UIF7tW8lcbhBIe45Kot49cjIaWv5XoMfh6jLShsR9xkXEH314myQX+H4PmtsCdyh
 mFbEqYqsejlRer/k=
X-Received: by 2002:a17:906:9bf2:: with SMTP id
 de50mr23041364ejc.516.1632302629309; 
 Wed, 22 Sep 2021 02:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2yV+8BrWcjYyqeUcQSogAr+2spdCKrHBYNDNOIrYajIwizLkr06suJUIkTusuyueND196VQ==
X-Received: by 2002:a17:906:9bf2:: with SMTP id
 de50mr23041340ejc.516.1632302629067; 
 Wed, 22 Sep 2021 02:23:49 -0700 (PDT)
Received: from steredhat (host-79-26-68-6.retail.telecomitalia.it.
 [79.26.68.6])
 by smtp.gmail.com with ESMTPSA id o13sm765716ejm.56.2021.09.22.02.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:23:48 -0700 (PDT)
Date: Wed, 22 Sep 2021 11:23:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v7] virtio/vsock: add two more queues for datagram types
Message-ID: <20210922092346.gxpc3w62ofimyhhh@steredhat>
References: <20210922000024.524646-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210922000024.524646-1-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 22, 2021 at 12:00:24AM +0000, Jiang Wang wrote:
>Datagram sockets are connectionless and unreliable.
>The sender does not know the capacity of the receiver
>and may send more packets than the receiver can handle.
>
>Add two more dedicate virtqueues for datagram sockets,
>so that it will not unfairly steal resources from
>stream and future connection-oriented sockets.
>
>The two new virtqueues are enabled by default and will
>be removed if the guest does not support. This will help
>migration work.
>
>btw: enable_dgram argument in vhost_vsock_common_realize
>is redundant for now, but will be used later when we
>want to disable DGRAM feature bit for old versions.
>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>---
>v1 -> v2: use qemu cmd option to control number of queues,
>        removed configuration settings for dgram.
>v2 -> v3: use ioctl to get features and decide number of
>        virt queues, instead of qemu cmd option.
>v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>        in vhost_vsock_common_realize to indicate dgram is supported or not.
>v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
>        enable_dgram
>v5 -> v6: fix style errors. Imporve error handling of
>        vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and another one.
>v6 -> v7: Always enable dgram for vhost-user and vhost kernel.
>        Delete unused virtqueues at the beginning of
>        vhost_vsock_common_start for migration. Otherwise, migration will fail.
>
> hw/virtio/vhost-user-vsock.c                  |  2 +-
> hw/virtio/vhost-vsock-common.c                | 32 +++++++++++++++++--
> hw/virtio/vhost-vsock.c                       |  6 +++-
> include/hw/virtio/vhost-vsock-common.h        |  6 ++--
> include/hw/virtio/vhost-vsock.h               |  3 ++
> include/standard-headers/linux/virtio_vsock.h |  1 +
> 6 files changed, 43 insertions(+), 7 deletions(-)
>
>diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>index 6095ed7349..9823a2f3bd 100644
>--- a/hw/virtio/vhost-user-vsock.c
>+++ b/hw/virtio/vhost-user-vsock.c
>@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>         return;
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", true);
>
>     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>
>diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>index 4ad6e234ad..7d89b4d242 100644
>--- a/hw/virtio/vhost-vsock-common.c
>+++ b/hw/virtio/vhost-vsock-common.c
>@@ -26,6 +26,18 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
>     int ret;
>     int i;
>
>+    if (!virtio_has_feature(vdev->guest_features, VIRTIO_VSOCK_F_DGRAM)) {
>+        struct vhost_virtqueue *vqs;
>+        virtio_delete_queue(vvc->dgram_recv_vq);
>+        virtio_delete_queue(vvc->dgram_trans_vq);
>+

Are you sure it works removing queues here?
The event_queue would always be #4, but the guest will use #2 which 
we're removing.

>+        vqs = vvc->vhost_dev.vqs;
>+        vvc->vhost_dev.nvqs = MAX_VQS_WITHOUT_DGRAM;
>+        vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue,
>+                                   vvc->vhost_dev.nvqs);
>+        g_free(vqs);
>+    }
>+
>     if (!k->set_guest_notifiers) {
>         error_report("binding does not support guest notifiers");
>         return -ENOSYS;
>@@ -196,9 +208,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>     return 0;
> }
>
>-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
>+                               bool enable_dgram)
                                       ^
It seems always true, and also unused.

> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+    int nvqs = MAX_VQS_WITH_DGRAM;
>
>     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>                 sizeof(struct virtio_vsock_config));
>@@ -209,12 +223,17 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);
>
>+    vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                          vhost_vsock_common_handle_output);
>+    vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                          vhost_vsock_common_handle_output);
>+
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
>@@ -227,6 +246,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>
>     virtio_delete_queue(vvc->recv_vq);
>     virtio_delete_queue(vvc->trans_vq);
>+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>+        virtio_delete_queue(vvc->dgram_recv_vq);
>+        virtio_delete_queue(vvc->dgram_trans_vq);
>+    }
>+
>+    g_free(vvc->vhost_dev.vqs);
>+
>     virtio_delete_queue(vvc->event_vq);
>     virtio_cleanup(vdev);
> }
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index 1b1a5c70ed..6e315ecf23 100644
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
>@@ -116,6 +117,9 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>
>     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
>+    }

Take a look at 
https://lore.kernel.org/qemu-devel/20210921161642.206461-1-sgarzare@redhat.com/

If it will be accepted, we should use something similar (e.g.  
`datagram` prop) and handle this flag in vhost-vsock-common.

And we should change a bit the queue handling:
- if QEMU (new `datagram` prop is `on` or `auto`) and the kernel 
   supports F_DGRAM, we can allocate 5 queues.
- if the guest acked F_DGRAM we can use queue #4 for events, otherwise 
   switch back to queue #2, without removing them.

>     return vhost_get_features(&vvc->vhost_dev, feature_bits,
>                                 requested_features);
> }
>@@ -175,7 +179,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>         qemu_set_nonblock(vhostfd);
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-vsock");
>+    vhost_vsock_common_realize(vdev, "vhost-vsock", true);
>
>     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
>diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
>index e412b5ee98..80151aee35 100644
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
>+                                bool enable_dgram);
> void vhost_vsock_common_unrealize(VirtIODevice *vdev);
>
> #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
>diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
>index 84f4e727c7..7d16c0e218 100644
>--- a/include/hw/virtio/vhost-vsock.h
>+++ b/include/hw/virtio/vhost-vsock.h
>@@ -33,4 +33,7 @@ struct VHostVSock {
>     /*< public >*/
> };
>
>+#define MAX_VQS_WITHOUT_DGRAM 2
>+#define MAX_VQS_WITH_DGRAM 4

I think was better the naming in the previous version.

Thanks,
Stefano


