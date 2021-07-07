Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F53BED52
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:43:44 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BaJ-0007HW-8u
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m1BKu-00011v-VZ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m1BKq-0006xZ-O1
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625678863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0omSRNHAGrR0Vt5hpF9H9B/yhkPl6LOPNcbo7PgHcyM=;
 b=HXdttZZW0ddr8WUCk2l5JySkXCePqamY2tLcOvi5ahjdv3+4xRjgozE1PRIHmIy4gapwbj
 VUjUFMof1U+Os8e7sxrKalzjhukWUySRhmQNgLHzSiMcpKjovOCtyVK5npcrQz2gNW8EnE
 fN6YH92JMmkyDZGLtirKwj6X5eDOMUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-TzZSwB2iOnWf-XxL9jVbqQ-1; Wed, 07 Jul 2021 13:27:42 -0400
X-MC-Unique: TzZSwB2iOnWf-XxL9jVbqQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so1021864wrm.14
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 10:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0omSRNHAGrR0Vt5hpF9H9B/yhkPl6LOPNcbo7PgHcyM=;
 b=Trfbww2AbdyIdARDhKfRSFoGUCi84dlD2st/G0kJLKJjvhf1ivyy6WAkops5EQFmEJ
 a8ujsLgORaZdoggUPrkoS5UuLgG6SNr1uEZcJx4QccmvEaXfDrEO9mKJHTON6GY53/wV
 XOjpERxcdiz1ajxCN0QZQ0RwpG4rjPoh4D7y1AferLJcKJM0k/Bv7O9lEgOISODrTMRX
 73furZWZa6o8MNxrrMDVeNukc2LdFWSAKBVnWzYtKBoxU3mn4Vpvwe2G0rDzJnam+LuE
 gDvwNmVv9Ca7HrHUZtcueyDUW3Hxq9Pkeh8wo1NFhDLQea1p45yNC6BL6AdXsHf9xABU
 5Z6A==
X-Gm-Message-State: AOAM532nSR0MO51hA90z9uoVvaroNVrbgTXBUmYRqT34JIYlirH8WpIs
 6MPe5ESebXPlzis1kM5O2diVvuHOl1rCZVQ6raz9mh+3vi4HvYFRSyY6aGkPeHgoyK2ahiqC/bA
 JD3UcuQMjjLO2FsM=
X-Received: by 2002:adf:e743:: with SMTP id c3mr10412142wrn.354.1625678860834; 
 Wed, 07 Jul 2021 10:27:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWwxD8PKaKOknpavHHltwx+/Gi/pwW6xn1jwkNJe+WMa+0pfusLIifQuygH3S3QeNfYZ7b/A==
X-Received: by 2002:adf:e743:: with SMTP id c3mr10412129wrn.354.1625678860602; 
 Wed, 07 Jul 2021 10:27:40 -0700 (PDT)
Received: from steredhat.lan (host-87-7-214-34.retail.telecomitalia.it.
 [87.7.214.34])
 by smtp.gmail.com with ESMTPSA id c8sm20454206wri.91.2021.07.07.10.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 10:27:40 -0700 (PDT)
Date: Wed, 7 Jul 2021 19:27:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v3] virtio/vsock: add two more queues for datagram types
Message-ID: <20210707172737.j2xpyd45wmufdqc5@steredhat.lan>
References: <20210706222607.1058040-1-jiang.wang@bytedance.com>
 <20210707083312.algmreafmfofg7el@steredhat>
 <CAP_N_Z-NbofkoDbWby9Pe=VH1CjYQL6-gSbrwWDBZBNDwcnmuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z-NbofkoDbWby9Pe=VH1CjYQL6-gSbrwWDBZBNDwcnmuA@mail.gmail.com>
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
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 09:52:46AM -0700, Jiang Wang . wrote:
>On Wed, Jul 7, 2021 at 1:33 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Tue, Jul 06, 2021 at 10:26:07PM +0000, Jiang Wang wrote:
>> >Datagram sockets are connectionless and unreliable.
>> >The sender does not know the capacity of the receiver
>> >and may send more packets than the receiver can handle.
>> >
>> >Add two more dedicate virtqueues for datagram sockets,
>> >so that it will not unfairly steal resources from
>> >stream and future connection-oriented sockets.
>> >---
>> >v1 -> v2: use qemu cmd option to control number of queues,
>> >        removed configuration settings for dgram.
>> >v2 -> v3: use ioctl to get features and decie numbr of
>> >       virt queues, instead of qemu cmd option.
>> >
>> >btw: this patch is based on Arseny's SEQPACKET patch.
>> >
>> > hw/virtio/vhost-vsock-common.c                | 53 ++++++++++++++++++++++++++-
>> > hw/virtio/vhost-vsock.c                       |  3 ++
>> > include/hw/virtio/vhost-vsock-common.h        |  3 +-
>> > include/hw/virtio/vhost-vsock.h               |  4 ++
>> > include/standard-headers/linux/virtio_vsock.h |  3 ++
>> > 5 files changed, 63 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>> >index 4ad6e234ad..8164e09445 100644
>> >--- a/hw/virtio/vhost-vsock-common.c
>> >+++ b/hw/virtio/vhost-vsock-common.c
>> >@@ -17,6 +17,8 @@
>> > #include "hw/virtio/vhost-vsock.h"
>> > #include "qemu/iov.h"
>> > #include "monitor/monitor.h"
>> >+#include <sys/ioctl.h>
>> >+#include <linux/vhost.h>
>> >
>> > int vhost_vsock_common_start(VirtIODevice *vdev)
>> > {
>> >@@ -196,9 +198,36 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>> >     return 0;
>> > }
>> >
>> >+static int vhost_vsock_get_max_qps(void)
>> >+{
>> >+    uint64_t features;
>> >+    int ret;
>> >+    int fd = -1;
>> >+
>> >+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);
>> >+    if (fd == -1) {
>> >+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
>> >+        return -1;
>> >+    }
>>
>> You should use the `vhostfd` already opened in
>> vhost_vsock_device_realize(), since QEMU may not have permission to
>> access to the device, and the file descriptor can be passed from the
>> management layer.
>>
>Sure. Will do.
>
>> >+
>> >+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
>> >+    if (ret) {
>> >+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));
>> >+        qemu_close(fd);
>> >+        return ret;
>> >+    }
>> >+
>> >+    qemu_close(fd);
>> >+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
>> >+        return MAX_VQS_WITH_DGRAM;
>> >+
>> >+    return MAX_VQS_WITHOUT_DGRAM;
>> >+}
>> >+
>> > void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>> > {
>> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> >+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
>> >
>> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>> >                 sizeof(struct virtio_vsock_config));
>> >@@ -209,12 +238,24 @@ void vhost_vsock_common_realize(VirtIODevice 
>> >*vdev, const char *name)
>> >     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >                                        vhost_vsock_common_handle_output);
>> >
>> >+    nvqs = vhost_vsock_get_max_qps();
>>
>> You can't do this here, since the vhost-vsock-common.c functions are
>> used also by vhost-user-vsock, that doesn't use the /dev/vhost-vsock
>> device since the device is emulated in a separate user process.
>>
>> I think you can use something similar to what you did in v2, where you
>> passed a parameter to vhost_vsock_common_realize() to enable or not the
>> datagram queues.
>>
>Just to make sure, the qemu parameter will only be used for vhost-user-vsock,
>right? I think for the vhost-vsock kernel module, we will use ioctl and ignore
>the qemu parameter?

No, I mean a function parameter in vhost_vsock_common_realize() that we 
set to true when datagram is supported by the backend.

You can move the vhost_vsock_get_max_qps() call in 
vhost_vsock_device_realize(), just before call 
vhost_vsock_common_realize() where we can pass a parameter to specify if 
datagram is supported or not.

For now in vhost-user-vsock you can always pass `false`. When we will 
support it, we can add something similar to discover the features.

Just to be clear, we don't need any QEMU command line parameter.

>
>> >+
>> >+    if (nvqs < 0)
>> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
>> >+
>> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >+                                              vhost_vsock_common_handle_output);
>> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >+                                               vhost_vsock_common_handle_output);
>> >+    }
>> >+
>> >     /* The event queue belongs to QEMU */
>> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >                                        vhost_vsock_common_handle_output);
>>
>> Did you do a test with a guest that doesn't support datagram with QEMU
>> and hosts that do?
>>
>Yes, and it works.
>
>> I repost my thoughts that I had on v2:
>>
>>      What happen if the guest doesn't support dgram?
>>
>>      I think we should dynamically use the 3rd queue or the 5th queue for
>>      the events at runtime after the guest acked the features.
>>
>>      Maybe better to switch to an array of VirtQueue.
>>
>I think in current V3, it  already dynamically use 3rd or 5th queue 
>depending
>on the feature bit.

I'm not sure. IIUC when vhost_vsock_common_realize() is called, we don't 
know the features acked by the guest, so how can it be dynamic?

Here we should know only if the host kernel supports it.

Maybe it works, because in QEMU we use the event queue only after a 
migration to send a reset event, so you can try to migrate a guest to 
check this path.

I'll be off until July 16th, after that I'll check better, but I think 
there is something wrong here and we should use the 3rd or 5th queue for 
events only after the guest acked the features.

>
>> >
>> >-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
>> >-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
>> >+    vvc->vhost_dev.nvqs = nvqs;
>> >+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
>> >
>> >     vvc->post_load_timer = NULL;
>> > }
>> >@@ -227,6 +268,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>> >
>> >     virtio_delete_queue(vvc->recv_vq);
>> >     virtio_delete_queue(vvc->trans_vq);
>> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
>> >+        virtio_delete_queue(vvc->dgram_recv_vq);
>> >+        virtio_delete_queue(vvc->dgram_trans_vq);
>> >+    }
>> >+
>> >+    if (vvc->vhost_dev.vqs)
>>
>> g_free() already handles NULL pointers, so you can remove this check.
>>
>Got it.
>
>> >+        g_free(vvc->vhost_dev.vqs);
>> >+
>> >     virtio_delete_queue(vvc->event_vq);
>> >     virtio_cleanup(vdev);
>> > }
>> >diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>> >index 1b1a5c70ed..33bbe16983 100644
>> >--- a/hw/virtio/vhost-vsock.c
>> >+++ b/hw/virtio/vhost-vsock.c
>> >@@ -23,6 +23,7 @@
>> >
>> > const int feature_bits[] = {
>> >     VIRTIO_VSOCK_F_SEQPACKET,
>> >+    VIRTIO_VSOCK_F_DGRAM,
>> >     VHOST_INVALID_FEATURE_BIT
>> > };
>> >
>> >@@ -116,6 +117,8 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> >
>> >     virtio_add_feature(&requested_features, 
>> >     VIRTIO_VSOCK_F_SEQPACKET);
>> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM)
>> >+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
>> >     return vhost_get_features(&vvc->vhost_dev, feature_bits,
>> >                                 requested_features);
>> > }
>> >diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
>> >index e412b5ee98..798715241f 100644
>> >--- a/include/hw/virtio/vhost-vsock-common.h
>> >+++ b/include/hw/virtio/vhost-vsock-common.h
>> >@@ -27,12 +27,13 @@ enum {
>> > struct VHostVSockCommon {
>> >     VirtIODevice parent;
>> >
>> >-    struct vhost_virtqueue vhost_vqs[2];
>> >     struct vhost_dev vhost_dev;
>> >
>> >     VirtQueue *event_vq;
>> >     VirtQueue *recv_vq;
>> >     VirtQueue *trans_vq;
>> >+    VirtQueue *dgram_recv_vq;
>> >+    VirtQueue *dgram_trans_vq;
>> >
>> >     QEMUTimer *post_load_timer;
>> > };
>> >diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
>> >index 84f4e727c7..e10319785d 100644
>> >--- a/include/hw/virtio/vhost-vsock.h
>> >+++ b/include/hw/virtio/vhost-vsock.h
>> >@@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
>> > typedef struct {
>> >     uint64_t guest_cid;
>> >     char *vhostfd;
>> >+    bool enable_dgram;
>>
>> Leftover?
>>
>Right, but to support vhost-vsock-user, I think I will add this 
>parameter back?

I'm not sure it is needed.

>
>> > } VHostVSockConf;
>> >
>> > struct VHostVSock {
>> >@@ -33,4 +34,7 @@ struct VHostVSock {
>> >     /*< public >*/
>> > };
>> >
>> >+#define MAX_VQS_WITHOUT_DGRAM 2
>> >+#define MAX_VQS_WITH_DGRAM 4
>> >+
>> > #endif /* QEMU_VHOST_VSOCK_H */
>> >diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
>> >index 5eac522ee2..6ff8c5084c 100644
>> >--- a/include/standard-headers/linux/virtio_vsock.h
>> >+++ b/include/standard-headers/linux/virtio_vsock.h
>> >@@ -41,6 +41,9 @@
>> > /* The feature bitmap for virtio vsock */
>> > #define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET 
>> > supported */
>> >
>> >+/* Feature bits */
>> >+#define VIRTIO_VSOCK_F_DGRAM 0 /*Does vsock support dgram */
>>
>> Bit 0 is reserved for STREAM, IIRC also in the virtio-spec proposal you
>> used bit 2 for DGRAM.
>>
>My bad, I did not update the code here yet.
>

No problems :-)

Thanks,
Stefano


