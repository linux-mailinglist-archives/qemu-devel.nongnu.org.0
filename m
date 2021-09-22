Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B40414FF7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:36:22 +0200 (CEST)
Received: from localhost ([::1]:35628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT76S-000102-UJ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mT6Al-0004XY-4D
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:36:43 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:36843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mT6Ag-00045n-3Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:36:40 -0400
Received: by mail-lf1-x12b.google.com with SMTP id b20so15038223lfv.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=/kJM+E21foMqQwkI0/R+56qbdwSsEAterXhd9tqqINg=;
 b=HArP0h6oH8ZqITAfqBh37T79eRXCUXcj2QEChFXur69iK2aNv3spN6ZkpTBVTEmOEd
 dVEzt4B8uS+K38M2sRJCFAlb9eut22CX5vfzn9KtFzoIPRjlZYRF3aODrsnpIHnYAauJ
 c5EkKDlYXPEnRW2IjmrpVjBLeIA0obSyw7fn1uQS6KGcYWp3/P3B0K5yqAfGRxyVnRqk
 fNPf/zQ9o3bt5nVxHboubvbgyBDWoC6leW3PKZUIDX1+Rd/nRk0ylbmUmTi6Ez3e5dGf
 xfvt95Qhel3yqSoLcfctHtmQ8/AA6udUaZpk/7vuT4K+o59VUGoEr0E6IWZavVCsmPmc
 dY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=/kJM+E21foMqQwkI0/R+56qbdwSsEAterXhd9tqqINg=;
 b=lo38/v4zFM2Kid/4m7gU9G+wOU1rJlA+kOdK+6spsC9Ow2e2cbtlKDU4POw9S1FDXm
 YPREYZzg8O97jEnKkOMqrgUaVv+BMftKqJgkUX7yqfpPgzxzbW4a6/uNIU+jfPK+CHXX
 9Sy7W0/AxMSlXl1Az3bBXTvNqx72+k01n6DirqZTj8jek+ZqUdKC+K81eNdtT7e9pbBy
 h9i3v79T69tueQLfB+NA6pfLttLNCWK7tdsU1qGzv9UbDRruXgV6Ohn31vqUzWsrgLi5
 OtXuEQyT9MHZy9b3gA56Tb/jElWA/lBYW27euPZwvwbbv461S0r6DLY+begtnvvwTTCb
 ZUQA==
X-Gm-Message-State: AOAM533FeUYqxUn0AYlEiOlHY+ViB29XLVa7o5bKlpep6R1pHTBhWzTe
 jejfJ84JfmizJ9rbLtMg8ABAK6V9OOV88mu7fSkF0g==
X-Google-Smtp-Source: ABdhPJxW5jmCRjSzDzA73Idxza1oLEWYsih+d10zsfR6xq28Rw/B9FbTYvgWSuOnHWwzE1ZK/PsK/NLYd8Sf97wInXQ=
X-Received: by 2002:a19:ca03:: with SMTP id a3mr207118lfg.176.1632332195565;
 Wed, 22 Sep 2021 10:36:35 -0700 (PDT)
MIME-Version: 1.0
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Wed, 22 Sep 2021 10:36:24 -0700
Message-ID: <CAP_N_Z8p+qsOAm15TtUFhCG-bJHM+zOQ4UJkr4XBdUQnm2wtzQ@mail.gmail.com>
Subject: Re: Re: [RFC v7] virtio/vsock: add two more queues for datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=jiang.wang@bytedance.com; helo=mail-lf1-x12b.google.com
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

On Wed, Sep 22, 2021 at 2:23 AM Stefano Garzarella <sgarzare@redhat.com> wr=
ote:
>
> On Wed, Sep 22, 2021 at 12:00:24AM +0000, Jiang Wang wrote:
> >Datagram sockets are connectionless and unreliable.
> >The sender does not know the capacity of the receiver
> >and may send more packets than the receiver can handle.
> >
> >Add two more dedicate virtqueues for datagram sockets,
> >so that it will not unfairly steal resources from
> >stream and future connection-oriented sockets.
> >
> >The two new virtqueues are enabled by default and will
> >be removed if the guest does not support. This will help
> >migration work.
> >
> >btw: enable_dgram argument in vhost_vsock_common_realize
> >is redundant for now, but will be used later when we
> >want to disable DGRAM feature bit for old versions.
> >
> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> >---
> >v1 -> v2: use qemu cmd option to control number of queues,
> >        removed configuration settings for dgram.
> >v2 -> v3: use ioctl to get features and decide number of
> >        virt queues, instead of qemu cmd option.
> >v3 -> v4: change DGRAM feature bit value to 2. Add an argument
> >        in vhost_vsock_common_realize to indicate dgram is supported or =
not.
> >v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
> >        enable_dgram
> >v5 -> v6: fix style errors. Imporve error handling of
> >        vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and anoth=
er one.
> >v6 -> v7: Always enable dgram for vhost-user and vhost kernel.
> >        Delete unused virtqueues at the beginning of
> >        vhost_vsock_common_start for migration. Otherwise, migration wil=
l fail.
> >
> > hw/virtio/vhost-user-vsock.c                  |  2 +-
> > hw/virtio/vhost-vsock-common.c                | 32 +++++++++++++++++--
> > hw/virtio/vhost-vsock.c                       |  6 +++-
> > include/hw/virtio/vhost-vsock-common.h        |  6 ++--
> > include/hw/virtio/vhost-vsock.h               |  3 ++
> > include/standard-headers/linux/virtio_vsock.h |  1 +
> > 6 files changed, 43 insertions(+), 7 deletions(-)
> >
> >diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> >index 6095ed7349..9823a2f3bd 100644
> >--- a/hw/virtio/vhost-user-vsock.c
> >+++ b/hw/virtio/vhost-user-vsock.c
> >@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Err=
or **errp)
> >         return;
> >     }
> >
> >-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> >+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", true);
> >
> >     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> >
> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-comm=
on.c
> >index 4ad6e234ad..7d89b4d242 100644
> >--- a/hw/virtio/vhost-vsock-common.c
> >+++ b/hw/virtio/vhost-vsock-common.c
> >@@ -26,6 +26,18 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
> >     int ret;
> >     int i;
> >
> >+    if (!virtio_has_feature(vdev->guest_features, VIRTIO_VSOCK_F_DGRAM)=
) {
> >+        struct vhost_virtqueue *vqs;
> >+        virtio_delete_queue(vvc->dgram_recv_vq);
> >+        virtio_delete_queue(vvc->dgram_trans_vq);
> >+
>
> Are you sure it works removing queues here?
> The event_queue would always be #4, but the guest will use #2 which
> we're removing.
>
Yes, this works. In fact, I should include this in v6 and my tests done
in my previous emails have these changes. But before I submitted the patch,
I thought this code was redundant and removed it without further testing.

To explain it, I think the event queue number does not matter for the
vhost and qemu. The vhost-vsock kernel module does not allocate any
data structure for the event queue.  Qemu also only allocates an array of
size 2 or 4 for the tx, rx queues. The event queue is handled separately.

The event queue number only shows up in the spec, but in real code, I don't
see anywhere that the event queue number is used explicitly or implicitly.
The Event queue looks independent of tx, rx queues.

> >+        vqs =3D vvc->vhost_dev.vqs;
> >+        vvc->vhost_dev.nvqs =3D MAX_VQS_WITHOUT_DGRAM;
> >+        vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue,
> >+                                   vvc->vhost_dev.nvqs);
> >+        g_free(vqs);
> >+    }
> >+
> >     if (!k->set_guest_notifiers) {
> >         error_report("binding does not support guest notifiers");
> >         return -ENOSYS;
> >@@ -196,9 +208,11 @@ int vhost_vsock_common_post_load(void *opaque, int =
version_id)
> >     return 0;
> > }
> >
> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
> >+                               bool enable_dgram)
>                                        ^
> It seems always true, and also unused.
>
Yes, I can remove it. I am just wondering when we modify the feature
bit as in your recent seqpacket patch, do we want to change it to false whe=
n
the feature is not supported and make the code logically more resonable=EF=
=BC=9F
Or do we still make it true even if the feature bit is not supported?

> > {
> >     VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> >+    int nvqs =3D MAX_VQS_WITH_DGRAM;
> >
> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> >                 sizeof(struct virtio_vsock_config));
> >@@ -209,12 +223,17 @@ void vhost_vsock_common_realize(VirtIODevice *vdev=
, const char *name)
> >     vvc->trans_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >                                        vhost_vsock_common_handle_output=
);
> >
> >+    vvc->dgram_recv_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZ=
E,
> >+                                          vhost_vsock_common_handle_out=
put);
> >+    vvc->dgram_trans_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SI=
ZE,
> >+                                          vhost_vsock_common_handle_out=
put);
> >+
> >     /* The event queue belongs to QEMU */
> >     vvc->event_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >                                        vhost_vsock_common_handle_output=
);
> >
> >-    vvc->vhost_dev.nvqs =3D ARRAY_SIZE(vvc->vhost_vqs);
> >-    vvc->vhost_dev.vqs =3D vvc->vhost_vqs;
> >+    vvc->vhost_dev.nvqs =3D nvqs;
> >+    vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, vvc->vhost_de=
v.nvqs);
> >
> >     vvc->post_load_timer =3D NULL;
> > }
> >@@ -227,6 +246,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vde=
v)
> >
> >     virtio_delete_queue(vvc->recv_vq);
> >     virtio_delete_queue(vvc->trans_vq);
> >+    if (vvc->vhost_dev.nvqs =3D=3D MAX_VQS_WITH_DGRAM) {
> >+        virtio_delete_queue(vvc->dgram_recv_vq);
> >+        virtio_delete_queue(vvc->dgram_trans_vq);
> >+    }
> >+
> >+    g_free(vvc->vhost_dev.vqs);
> >+
> >     virtio_delete_queue(vvc->event_vq);
> >     virtio_cleanup(vdev);
> > }
> >diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> >index 1b1a5c70ed..6e315ecf23 100644
> >--- a/hw/virtio/vhost-vsock.c
> >+++ b/hw/virtio/vhost-vsock.c
> >@@ -23,6 +23,7 @@
> >
> > const int feature_bits[] =3D {
> >     VIRTIO_VSOCK_F_SEQPACKET,
> >+    VIRTIO_VSOCK_F_DGRAM,
> >     VHOST_INVALID_FEATURE_BIT
> > };
> >
> >@@ -116,6 +117,9 @@ static uint64_t vhost_vsock_get_features(VirtIODevic=
e *vdev,
> >     VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> >
> >     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
> >+    if (vvc->vhost_dev.nvqs =3D=3D MAX_VQS_WITH_DGRAM) {
> >+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
> >+    }
>
> Take a look at
> https://lore.kernel.org/qemu-devel/20210921161642.206461-1-sgarzare@redha=
t.com/
>
Yes, I noticed that email. Thanks for reminding me. I did not make
similar changes yet because I want to wait for that patch to be merged.
I can start to make similar changes in the next version.

> If it will be accepted, we should use something similar (e.g.
> `datagram` prop) and handle this flag in vhost-vsock-common.
>
> And we should change a bit the queue handling:
> - if QEMU (new `datagram` prop is `on` or `auto`) and the kernel
>    supports F_DGRAM, we can allocate 5 queues.
Agree with the new prop. But when the kernel supports F_DGRAM, qemu
still only allocates 4 queues. As in the following code=EF=BC=9A

vvc->vhost_dev.nvqs =3D nvqs;
vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);

// nvqs will be either 2 or 4. Will not be 5. btw, in the new version, it w=
ill
// always be 4.

> - if the guest acked F_DGRAM we can use queue #4 for events, otherwise
>    switch back to queue #2, without removing them.
>
> >     return vhost_get_features(&vvc->vhost_dev, feature_bits,
> >                                 requested_features);
> > }
> >@@ -175,7 +179,7 @@ static void vhost_vsock_device_realize(DeviceState *=
dev, Error **errp)
> >         qemu_set_nonblock(vhostfd);
> >     }
> >
> >-    vhost_vsock_common_realize(vdev, "vhost-vsock");
> >+    vhost_vsock_common_realize(vdev, "vhost-vsock", true);
> >
> >     ret =3D vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
> >                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
> >diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/=
vhost-vsock-common.h
> >index e412b5ee98..80151aee35 100644
> >--- a/include/hw/virtio/vhost-vsock-common.h
> >+++ b/include/hw/virtio/vhost-vsock-common.h
> >@@ -27,12 +27,13 @@ enum {
> > struct VHostVSockCommon {
> >     VirtIODevice parent;
> >
> >-    struct vhost_virtqueue vhost_vqs[2];
> >     struct vhost_dev vhost_dev;
> >
> >     VirtQueue *event_vq;
> >     VirtQueue *recv_vq;
> >     VirtQueue *trans_vq;
> >+    VirtQueue *dgram_recv_vq;
> >+    VirtQueue *dgram_trans_vq;
> >
> >     QEMUTimer *post_load_timer;
> > };
> >@@ -41,7 +42,8 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
> > void vhost_vsock_common_stop(VirtIODevice *vdev);
> > int vhost_vsock_common_pre_save(void *opaque);
> > int vhost_vsock_common_post_load(void *opaque, int version_id);
> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
> >+                                bool enable_dgram);
> > void vhost_vsock_common_unrealize(VirtIODevice *vdev);
> >
> > #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
> >diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-v=
sock.h
> >index 84f4e727c7..7d16c0e218 100644
> >--- a/include/hw/virtio/vhost-vsock.h
> >+++ b/include/hw/virtio/vhost-vsock.h
> >@@ -33,4 +33,7 @@ struct VHostVSock {
> >     /*< public >*/
> > };
> >
> >+#define MAX_VQS_WITHOUT_DGRAM 2
> >+#define MAX_VQS_WITH_DGRAM 4
>
> I think was better the naming in the previous version.
>
Sure, will change it back in the next version.

> Thanks,
> Stefano
>

