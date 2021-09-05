Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323240111A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 20:09:50 +0200 (CEST)
Received: from localhost ([::1]:36352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMwaT-0005MY-08
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 14:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mMwZa-0004hv-Oo
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:08:54 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mMwZV-0003O6-B0
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:08:52 -0400
Received: by mail-lj1-x22b.google.com with SMTP id g14so7281747ljk.5
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BugyQAIlGT7XWc0m2haGUHPh8iey5SQdcxMU37p0AqQ=;
 b=MUnT2pw0sgeKCokdJIwj7lfZKrX7iVCBKuD5t4AqQggl4LlopmBOGvkullJo1DK+AC
 0cuSpkGIQd+eauQjQzXacJllt/DUR8ARtShiDYDiY4D3W4jXgiEURRx36jXW+h0/f/ri
 6002SmIK0rn2dWO2cbKVCoLM64sdfidmpnxs6B6+LiSZMsH+3GA21SL0JaAabQRtdsp+
 kZPGAZcePRjBcmPS4HcdpmwYT/1BX4EpFevcpmF9ob02jgt+6U90D9Dj2MJ/8GE/i2Dt
 V63XeaRpZa7PJqM3IxAu0Ql3WD63J8pwV3Ex8/3+eiczJCtwkmc2gy92ghegmQq/OSmA
 ADLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BugyQAIlGT7XWc0m2haGUHPh8iey5SQdcxMU37p0AqQ=;
 b=kZs8L2eUSIWQw2f+etyawdLrqh8wYrZ8hzOFvlim578xmcHgiTQfJVA3NAvfETX9dM
 wYUZlxP27DNGGEDC0eJz8XPWoA5AUeB0BDMhLaBxoN9Fyx2B/SzSo9jXCuJ5TLHViwHi
 hleRS2UydZQzPIpysHI1ULlIKzPfBOUgERKHbRAccqGAO9Fxr0VDlC3ty8Zs55DwqE55
 WSzTcKYc6wybXDxX5TGbrwbiQIMDyNBVLHUzVq/BweulaMb3lhUhGVnfAE4InktqJagX
 Cq8hJI5UJGOOJUr/g5PJAtE88mfH+1LjTpjbDZzkAU3iwUaydoLYdtYiaM7h7Kl/YQ0P
 ek1w==
X-Gm-Message-State: AOAM531iL2UdGAvp7qErL5ZlDhkKAuACZ7PVRpTqx6Nl4gMK+S4EH1a7
 +8LAMT72cewtmWezfhDzv0y5cR/nC1bkhZQkUQQZ0A==
X-Google-Smtp-Source: ABdhPJxvHZxbgPu5C7fLeJdHwJMig7yzoJbiHEtbX40gDaPL0roG+vHu3ufSwuEtlcTE4lb3XLuVFa9RUmB8UoZpDts=
X-Received: by 2002:a05:651c:1257:: with SMTP id
 h23mr7559644ljh.49.1630865325311; 
 Sun, 05 Sep 2021 11:08:45 -0700 (PDT)
MIME-Version: 1.0
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Sun, 5 Sep 2021 11:08:34 -0700
Message-ID: <CAP_N_Z_FWCQuzxKG7uXAZRm_-X4A1m1c3Rh_FcBiDAksSbMWug@mail.gmail.com>
Subject: Re: Re: [PATCH v4] virtio/vsock: add two more queues for datagram
 types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=jiang.wang@bytedance.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 9, 2021 at 3:58 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Thu, Aug 05, 2021 at 12:07:02PM -0700, Jiang Wang . wrote:
> >On Wed, Aug 4, 2021 at 1:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >>
> >> On Tue, Aug 03, 2021 at 11:41:32PM +0000, Jiang Wang wrote:
> >> >Datagram sockets are connectionless and unreliable.
> >> >The sender does not know the capacity of the receiver
> >> >and may send more packets than the receiver can handle.
> >> >
> >> >Add two more dedicate virtqueues for datagram sockets,
> >> >so that it will not unfairly steal resources from
> >> >stream and future connection-oriented sockets.
> >> >
> >> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> >> >---
> >> >v1 -> v2: use qemu cmd option to control number of queues,
> >> >       removed configuration settings for dgram.
> >> >v2 -> v3: use ioctl to get features and decide number of
> >> >        virt queues, instead of qemu cmd option.
> >> >v3 -> v4: change DGRAM feature bit value to 2. Add an argument
> >> >       in vhost_vsock_common_realize to indicate dgram is supported or not.
> >> >
> >> > hw/virtio/vhost-user-vsock.c                  |  2 +-
> >> > hw/virtio/vhost-vsock-common.c                | 58 ++++++++++++++++++-
> >> > hw/virtio/vhost-vsock.c                       |  5 +-
> >> > include/hw/virtio/vhost-vsock-common.h        |  6 +-
> >> > include/hw/virtio/vhost-vsock.h               |  4 ++
> >> > include/standard-headers/linux/virtio_vsock.h |  1 +
> >> > 6 files changed, 69 insertions(+), 7 deletions(-)
> >> >
> >> >diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> >> >index 6095ed7349..e9ec0e1c00 100644
> >> >--- a/hw/virtio/vhost-user-vsock.c
> >> >+++ b/hw/virtio/vhost-user-vsock.c
> >> >@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
> >> >         return;
> >> >     }
> >> >
> >> >-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> >> >+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
> >> >
> >> >     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> >> >
> >> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> >> >index 4ad6e234ad..c78536911a 100644
> >> >--- a/hw/virtio/vhost-vsock-common.c
> >> >+++ b/hw/virtio/vhost-vsock-common.c
> >> >@@ -17,6 +17,8 @@
> >> > #include "hw/virtio/vhost-vsock.h"
> >> > #include "qemu/iov.h"
> >> > #include "monitor/monitor.h"
> >> >+#include <sys/ioctl.h>
> >> >+#include <linux/vhost.h>
> >> >
> >> > int vhost_vsock_common_start(VirtIODevice *vdev)
> >> > {
> >> >@@ -196,9 +198,39 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
> >> >     return 0;
> >> > }
> >> >
> >> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> >> >+static int vhost_vsock_get_max_qps(bool enable_dgram)
> >> >+{
> >> >+    uint64_t features;
> >> >+    int ret;
> >> >+    int fd = -1;
> >> >+
> >> >+    if (!enable_dgram)
> >> >+        return MAX_VQS_WITHOUT_DGRAM;
> >> >+
> >> >+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);
> >>
> >>
> >> As I said in the previous version, we cannot directly open
> >> /dev/vhost-vsock, for two reasons:
> >>
> >>    1. this code is common with vhost-user-vsock which does not use
> >>    /dev/vhost-vsock.
> >>
> >>    2. the fd may have been passed from the management layer and qemu may
> >>    not be able to directly open /dev/vhost-vsock.
> >>
> >> I think is better to move this function in hw/virtio/vhost-vsock.c,
> >> using the `vhostfd`, returning true or false if dgram is supported, then
> >> you can use it for `enable_dgram` param ...
> >>
> >
> >Yes, you are right. Now I remember you said that before but I forgot about that
> >when I changed the code. I will fix it. Sorry about that.
>
> No problem :-)
>
> >
> >> >+    if (fd == -1) {
> >> >+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
> >> >+        return -1;
> >> >+    }
> >> >+
> >> >+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
> >> >+    if (ret) {
> >> >+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));
> >> >+        qemu_close(fd);
> >> >+        return ret;
> >> >+    }
> >> >+
> >> >+    qemu_close(fd);
> >> >+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
> >> >+        return MAX_VQS_WITH_DGRAM;
> >> >+
> >> >+    return MAX_VQS_WITHOUT_DGRAM;
> >> >+}
> >> >+
> >> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
> >> > {
> >> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >> >+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
> >> >
> >> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> >> >                 sizeof(struct virtio_vsock_config));
> >> >@@ -209,12 +241,24 @@ void vhost_vsock_common_realize(VirtIODevice
> >> >*vdev, const char *name)
> >> >     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >                                        vhost_vsock_common_handle_output);
> >> >
> >> >+    nvqs = vhost_vsock_get_max_qps(enable_dgram);
> >> >+
> >> >+    if (nvqs < 0)
> >> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
> >>
> >> ... and here, if `enable_dgram` is true, you can set `nvqs =
> >> MAX_VQS_WITH_DGRAM``
> >>
> >sure.
> >
> >> >+
> >> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
> >> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >+                                              vhost_vsock_common_handle_output);
> >> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >+
> >> >vhost_vsock_common_handle_output);
> >> >+    }
> >> >+
> >>
> >> I'm still concerned about compatibility with guests that don't
> >> support
> >> dgram, as I mentioned in the previous email.
> >>
> >> I need to do some testing, but my guess is it won't work if the host
> >> (QEMU and vhost-vsock) supports it and the guest doesn't.
> >>
> >> I still think that we should allocate an array of queues and then decide
> >> at runtime which one to use for events (third or fifth) after the guest
> >> has acked the features.
> >>
> >Agree. I will check where the guest ack the feature. If you have any
>
> I'm not sure we should delete them, I think we can allocate 5 queues and
> then use queue 3 or 5 for events in vhost_vsock_common_start(), when the
> guest already acked the features.
>

I think I just solved most compatibility issues during migration. The
previous error I saw was due to a bug in vhost-vsock kernel module.
After fixing that, I did not change anything for qemu ( i.e, still the same
version 4, btw I will fix fd issue in v5) and did a few migration tests.
Most of them are good.

There are two test cases that migration failed with "Features 0x130000002
unsupported"error, which is due to
SEQPACKET qemu patch (my dgram patch
is based on seqpacket patch). Not sure if we need to
fix it or not.  I think the compatibility is good as of now. Let me
know if you have other concerns or more test cases to test.
Otherwise, I will submit V5 soon.

Test results:
Left three columns are the source set-up,  right are destination set up.
Host and Guest refers to the host and guest kernel respectively. These
tests are not complete, and I make the src and dest kernel mostly the
same version. But I did test one case where source kernel has dgram
support while dest kernel does not and it is good. Btw, if the src kernel
and dest kernel have a big difference( like 5.14 vs 4.19), then QEMU
will show some msr errors which I guess is kind of expected.

Host        QEMU        Guest            --> Host        QEMU            result
dgram       no-dgram    no-dgram        dgram       no-dgram        Good
dgram       no-dgram    dgram           dgram       no-dgram        Good
dgram       dgram       no-dgram        dgram       dgram           Good
dgram       dgram       no-dgram        dgram       no-dgram        Good
dgram       dgram       dgram           dgram       no-dgram
load feature error *1

no-dgram    no-dgram    dgram           no-dgram    no-dgram        Good
no-dgram    dgram       dgram           no-dgram    dgram             Good
no-dgram    dgram       no-dgram        no-dgram    dgram           Good
no-dgram    dgram       no-dgram        no-dgram    no-dgram        Good
no-dgram    dgram       dgram           no-dgram    no-dgram
load feature error *1

dgram       dgram       no-dgram        no-dgram    no-dgram        Good

*1 Qemu shows following error messages:
qemu-system-x86_64: Features 0x130000002 unsupported. Allowed
features: 0x179000000
qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
qemu-system-x86_64: error while loading state for instance 0x0 of
device '0000:00:05.0/virtio-vhost_vsock'
qemu-system-x86_64: load of migration failed: Operation not permitted

This is due to SEQPACKET feature bit.


Step back and rethink about whether the event vq number should be 3 or or 5,
now I think it does not matter. The tx and rx queues (whether 2 or 4 queues)
belong to vhost, but event queue belongs to QEMU. The qemu code
allocates an array  for vhost_dev.vqs only for tx and rx queues. So
event queue is never in that array. That means we don't need to
worry about even queue number is 3 or 5. And my tests confirmed that.
I think for the virtio spec, we need to put event queue somewhere and
it looks like having a relative position to tx rx queues. But for vhost kernel
implementation, the event queue is a special case and not related to
tx or rx queues.

Regards,

Jiang


> >pointers,
> >just let me know. Also, could we just remove the vq allocation in common_realize
> >and do it at a later time? Or need to delete and add again as I mentioned in the
> >previous email?
>
> Instead of having 'recv_vq', 'trans_vq', 'event_vq' fields, we can have
> an array of VirtQueue pointers and a field that indicates what the index
> of the event queue is. (or a boolean that indicates if we are enabling
> dgram or not).
>
> This should simplify the management.
>
> Thanks,
> Stefano
>

