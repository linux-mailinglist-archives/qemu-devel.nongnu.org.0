Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B13E4F82
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 00:51:02 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDE6n-0000GU-Sl
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 18:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mDE5z-0007xU-Q0
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 18:50:11 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:43969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mDE5x-0002uK-1R
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 18:50:10 -0400
Received: by mail-oi1-x22a.google.com with SMTP id s13so16660783oie.10
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 15:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2RrrY0zwAPS4OoGNvgIPdp2PrqzbNjQc7RYXvPx+D0U=;
 b=CXwqsm/93LXpDNwd/b3bEwuvwmpY1O24mF+P2PKG9ZtgCsABuK3WhuPqdVhV2FlBmb
 94T6jehBHdQSOrW1H05K/suMo4wPwWYHz1HJd4wrRaYM9AmVN6uPyrdVtOcm8KkgslPA
 09Oh2WM5+21pobsRwGlTnS5w/mhZq7+Sqe/Sosc8aF8FSZ7OviuugTeooKfLHF8Sli3x
 +hxDCIfe+npmrM0ynm0B767BOR1s4KuVg/Qiah80qw5gsjx9yDzvaqYDYVcPJAkRikyk
 xQhTii0iU2o5yz1YnAOLqehx4W5lSrcw6Zpb+jFQSgnIcX/7/0hTzXNj2XLT0Wcsb664
 vtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2RrrY0zwAPS4OoGNvgIPdp2PrqzbNjQc7RYXvPx+D0U=;
 b=hN+jQX/f0L3k16TJNgmqP+01lcK743guz1QWyjqTxNbGd9PfYSN60vLZHVS2OrPblc
 A1epyWza1lhVPFJp9LHKgOxZ/6+1pGnPz/cFYObAOVVxyibZuCBjII4UxWGcc9g5ldP0
 A+qCiPT9MNjqaIElHwJUFf6upn9EcMUXPBoeRBlshdmqtlpENRalCsb5fnN7PgCBY0Yt
 ttp9gUWVfpPbLK6pT6OPdN61dMkxwtlsF2Kd892cdQHEUDfKUdhKdK3nN4LsJIRKyjV3
 L2PjewQa8Qri+j6YcZS8cszW9VSZHMXnWh+4chbZSfopnAOo7OWqrdirdcQoOfW0pArL
 rt4A==
X-Gm-Message-State: AOAM533My64h0qlzaoO2GYUku30jg4jIgMqUt4WLP4uIagHd/bDyOk0e
 3h6ECCdl3v0qWVxRlYnd7yTwIy71yGP0X+GzDk6Y6w==
X-Google-Smtp-Source: ABdhPJw03Cgw2MOtByvdvbTXNx/sIndlUZrwEQ+jBdIvo50Hvym5piPa0cmXtivSaOGiSXUKEIaBH2a5Q3NuZDKFXUg=
X-Received: by 2002:aca:c1c3:: with SMTP id r186mr18063855oif.97.1628549407562; 
 Mon, 09 Aug 2021 15:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210803234132.1557394-1-jiang.wang@bytedance.com>
 <20210804081349.44gifmmks2uut6r5@steredhat>
 <CAP_N_Z_yhrNJtL0_xZ+Ar8OKqxx=JC-eBejjcPZPbNREWeq_Yg@mail.gmail.com>
 <20210809105816.l4qtlvq2r6np2e2w@steredhat>
In-Reply-To: <20210809105816.l4qtlvq2r6np2e2w@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Mon, 9 Aug 2021 15:49:56 -0700
Message-ID: <CAP_N_Z9h1SOm3vkO149LOpk4KGOuYvRTpabkf_tZCF2kyPWJ_Q@mail.gmail.com>
Subject: Re: Re: [PATCH v4] virtio/vsock: add two more queues for datagram
 types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=jiang.wang@bytedance.com; helo=mail-oi1-x22a.google.com
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

Got it.

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
I see. I will dig more. thanks.

> Thanks,
> Stefano
>

