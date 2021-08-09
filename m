Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB53E444D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:59:18 +0200 (CEST)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD301-0007qc-3a
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mD2zA-0006p1-EN
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mD2z8-0001fM-Jv
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628506701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NujImyYy/OM+DnI8bz3vo1Y9jDQure5g5/AtuyVLBtc=;
 b=Phe4gFSeKQisTK3iM58F4IfSgdVKSw60lH/jtmh6ZCaRIU0BJm/TB7Uhs3m/LKOOrURh48
 +rijPSwAo2xq0G0PYp3xkvXPXk8G54jHo6Og4wrZ3hVVWTBDxuNaIXyOqWjSPpL6uQjoic
 Q2zS1qE1gDavqKWUl3Gz/ulg/q+KKEQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-qEauRKzMMtqvWqrVeUdj2Q-1; Mon, 09 Aug 2021 06:58:20 -0400
X-MC-Unique: qEauRKzMMtqvWqrVeUdj2Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 g3-20020a0564024243b02903be33db5ae6so4562711edb.18
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NujImyYy/OM+DnI8bz3vo1Y9jDQure5g5/AtuyVLBtc=;
 b=ul7nqF6tGvDqEmsgQc9FL9zSO5TzMoHoWpheW/1ZTu1N3B7vN4WUfduxG6JE++an4K
 s9Y7TdWbZTSnoSAHwGEXUb384Z654ZmOXdVZ0O/IDZJpNrM8a0lrX8aPiUx+e5pQleel
 LftmWUslEGPahbHl9ZK3+giVNWmWtn+tsuFUo59GP+/7KxIqSaOCMYEhOUuVs/9nR7rN
 56BUzZc6hhRqaqgRiwlCB2jqDTm/LckD/MhlkeT+wal6ApL1ed1YMrGF88vvkVfXfywc
 M9C0cRfZ3o3bBri/e8jCtzLU0AzLhAt1H89Qir8CHPgF5VRVi9UTDlsbc8k2yW22J7DG
 oDKA==
X-Gm-Message-State: AOAM5334Q159I8gj13SFfYP0IIr7vio3kxcfXNA+bhUc35MNm119CxBn
 s105cQ5feqGZBI7e8OFcJG/R2PXSrWetSiFOJ1UieqoVE9GkozBHFkm2Tn4WE3TUexnPbD4Yy6V
 e4kaWLi+Mqx3Fay0=
X-Received: by 2002:a05:6402:70c:: with SMTP id
 w12mr7927970edx.288.1628506699383; 
 Mon, 09 Aug 2021 03:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyih2SmDBJPc8dIP13BdT+9sOa4F29qTskBSN73F939/otz/fmoy80QJuXlNn8plTujYiWUeg==
X-Received: by 2002:a05:6402:70c:: with SMTP id
 w12mr7927949edx.288.1628506699199; 
 Mon, 09 Aug 2021 03:58:19 -0700 (PDT)
Received: from steredhat (a-nu5-14.tin.it. [212.216.181.13])
 by smtp.gmail.com with ESMTPSA id d23sm7962437edt.39.2021.08.09.03.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 03:58:18 -0700 (PDT)
Date: Mon, 9 Aug 2021 12:58:16 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [PATCH v4] virtio/vsock: add two more queues for datagram types
Message-ID: <20210809105816.l4qtlvq2r6np2e2w@steredhat>
References: <20210803234132.1557394-1-jiang.wang@bytedance.com>
 <20210804081349.44gifmmks2uut6r5@steredhat>
 <CAP_N_Z_yhrNJtL0_xZ+Ar8OKqxx=JC-eBejjcPZPbNREWeq_Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z_yhrNJtL0_xZ+Ar8OKqxx=JC-eBejjcPZPbNREWeq_Yg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 12:07:02PM -0700, Jiang Wang . wrote:
>On Wed, Aug 4, 2021 at 1:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Tue, Aug 03, 2021 at 11:41:32PM +0000, Jiang Wang wrote:
>> >Datagram sockets are connectionless and unreliable.
>> >The sender does not know the capacity of the receiver
>> >and may send more packets than the receiver can handle.
>> >
>> >Add two more dedicate virtqueues for datagram sockets,
>> >so that it will not unfairly steal resources from
>> >stream and future connection-oriented sockets.
>> >
>> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>> >---
>> >v1 -> v2: use qemu cmd option to control number of queues,
>> >       removed configuration settings for dgram.
>> >v2 -> v3: use ioctl to get features and decide number of
>> >        virt queues, instead of qemu cmd option.
>> >v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>> >       in vhost_vsock_common_realize to indicate dgram is supported or not.
>> >
>> > hw/virtio/vhost-user-vsock.c                  |  2 +-
>> > hw/virtio/vhost-vsock-common.c                | 58 ++++++++++++++++++-
>> > hw/virtio/vhost-vsock.c                       |  5 +-
>> > include/hw/virtio/vhost-vsock-common.h        |  6 +-
>> > include/hw/virtio/vhost-vsock.h               |  4 ++
>> > include/standard-headers/linux/virtio_vsock.h |  1 +
>> > 6 files changed, 69 insertions(+), 7 deletions(-)
>> >
>> >diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>> >index 6095ed7349..e9ec0e1c00 100644
>> >--- a/hw/virtio/vhost-user-vsock.c
>> >+++ b/hw/virtio/vhost-user-vsock.c
>> >@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>> >         return;
>> >     }
>> >
>> >-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>> >+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
>> >
>> >     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>> >
>> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>> >index 4ad6e234ad..c78536911a 100644
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
>> >@@ -196,9 +198,39 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
>> >     return 0;
>> > }
>> >
>> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>> >+static int vhost_vsock_get_max_qps(bool enable_dgram)
>> >+{
>> >+    uint64_t features;
>> >+    int ret;
>> >+    int fd = -1;
>> >+
>> >+    if (!enable_dgram)
>> >+        return MAX_VQS_WITHOUT_DGRAM;
>> >+
>> >+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);
>>
>>
>> As I said in the previous version, we cannot directly open
>> /dev/vhost-vsock, for two reasons:
>>
>>    1. this code is common with vhost-user-vsock which does not use
>>    /dev/vhost-vsock.
>>
>>    2. the fd may have been passed from the management layer and qemu may
>>    not be able to directly open /dev/vhost-vsock.
>>
>> I think is better to move this function in hw/virtio/vhost-vsock.c,
>> using the `vhostfd`, returning true or false if dgram is supported, then
>> you can use it for `enable_dgram` param ...
>>
>
>Yes, you are right. Now I remember you said that before but I forgot about that
>when I changed the code. I will fix it. Sorry about that.

No problem :-)

>
>> >+    if (fd == -1) {
>> >+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
>> >+        return -1;
>> >+    }
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
>> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
>> > {
>> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> >+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
>> >
>> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>> >                 sizeof(struct virtio_vsock_config));
>> >@@ -209,12 +241,24 @@ void vhost_vsock_common_realize(VirtIODevice
>> >*vdev, const char *name)
>> >     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >                                        vhost_vsock_common_handle_output);
>> >
>> >+    nvqs = vhost_vsock_get_max_qps(enable_dgram);
>> >+
>> >+    if (nvqs < 0)
>> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
>>
>> ... and here, if `enable_dgram` is true, you can set `nvqs =
>> MAX_VQS_WITH_DGRAM``
>>
>sure.
>
>> >+
>> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >+                                              vhost_vsock_common_handle_output);
>> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >+
>> >vhost_vsock_common_handle_output);
>> >+    }
>> >+
>>
>> I'm still concerned about compatibility with guests that don't 
>> support
>> dgram, as I mentioned in the previous email.
>>
>> I need to do some testing, but my guess is it won't work if the host
>> (QEMU and vhost-vsock) supports it and the guest doesn't.
>>
>> I still think that we should allocate an array of queues and then decide
>> at runtime which one to use for events (third or fifth) after the guest
>> has acked the features.
>>
>Agree. I will check where the guest ack the feature. If you have any 

I'm not sure we should delete them, I think we can allocate 5 queues and 
then use queue 3 or 5 for events in vhost_vsock_common_start(), when the 
guest already acked the features.

>pointers,
>just let me know. Also, could we just remove the vq allocation in common_realize
>and do it at a later time? Or need to delete and add again as I mentioned in the
>previous email?

Instead of having 'recv_vq', 'trans_vq', 'event_vq' fields, we can have 
an array of VirtQueue pointers and a field that indicates what the index 
of the event queue is. (or a boolean that indicates if we are enabling 
dgram or not).

This should simplify the management.

Thanks,
Stefano


