Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEFB4EFDD4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 03:50:38 +0200 (CEST)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naSuS-0004F4-N0
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 21:50:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naSsY-0003Yt-FL
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:48:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naSsU-00047J-HU
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648864113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RN7AFWKrXiKtwFaN2bVVdrBx29L0mb2CfZmiVGpWtTI=;
 b=MsQBgP6aBLLlYQ2FNK9iJnN5tMlzFs5gLbyvGGe70oFu3afzCkeOA9d/NoS3sIrRM6527l
 Dz/b+xy5DFNw2RfOxFuHTQplvuobkdj5ePfUrwOpfjamVt2+HShcNjLHZaHNd0Z8ZVn1BC
 PlXZTWyv8FDTiu7yUNCCryKAAcA74UE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-eJ-pa8wgNgik32pC3UA7hg-1; Fri, 01 Apr 2022 21:48:32 -0400
X-MC-Unique: eJ-pa8wgNgik32pC3UA7hg-1
Received: by mail-lf1-f72.google.com with SMTP id
 u29-20020ac251dd000000b0044a245bcc1aso1920372lfm.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 18:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RN7AFWKrXiKtwFaN2bVVdrBx29L0mb2CfZmiVGpWtTI=;
 b=U6MdVoOTrIWM1u+vVQtXeh20EXa24Hm6zXE1pwsrmRsxYy93Ieivp6cZDDCAUXTvTa
 EGOqAZoxDYerXAcDHSthwcQmtLEGAfVjab1bupsayRapsrV+n2XnYm9UybW3xAWa7RkF
 C6UFIGntms2Jrkl1dkRkhZj4OHZU3WQLTr/0jegmYUNaiXEYLpQN8YYMqyxJzHE0Z3qi
 zHMpPsrkGPjlS0UEuwVXVHtlOhAM46C1G5BCZpO8SzJyMj4G8xFymu3kH4YGekJcF3X7
 IUjiU04ZeUPqrzVE81iDmOkwXUFYghhCmRbRp7u6rm/401vVKCteoBKHgaTKoFNSWjH7
 GApg==
X-Gm-Message-State: AOAM5322SFRH1nvf7qoAf8cg9jrfYMqVBeIyygjogZgsWVRUKysqy65+
 rnJMEMy0eMI0CJ0aWsy9EQBahiEhmJCyj6bacxGaW8ODm5GLx5MQwMWkU+Pht9++G/Nsgdsir2w
 +aC45ZFIcowZORk/pDMM4x+uCugOsitQ=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr88290ljg.97.1648864110320; 
 Fri, 01 Apr 2022 18:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN7MH9H1xT7Y/rA+XO/jEvGex3j1A+xuIiYICYrixAE51cSXzldwRTvB7gRqrZveFKNkEd9AmtT2Lsew2EkOs=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr88269ljg.97.1648864109895; Fri, 01 Apr
 2022 18:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
 <62466fff.1c69fb81.8817a.d813SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <62466fff.1c69fb81.8817a.d813SMTPIN_ADDED_BROKEN@mx.google.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 2 Apr 2022 09:48:18 +0800
Message-ID: <CACGkMEsRr-Di3Rd=XUCN=e+N6r+HWe7bqVLUAkAa9ek-PuUPwQ@mail.gmail.com>
Subject: Re: [PATCH v4] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Michael Qiu <qiudayu@archeros.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 11:22 AM Michael Qiu <qiudayu@archeros.com> wrote:
>
>
>
> On 2022/4/1 10:53, Jason Wang wrote:
> > On Fri, Apr 1, 2022 at 9:31 AM Michael Qiu <qiudayu@archeros.com> wrote:
> >>
> >> Currently, when VM poweroff, it will trigger vdpa
> >> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
> >> queue pair and one control queue, triggered 3 times), this
> >> leads to below issue:
> >>
> >> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
> >>
> >> This because in vhost_net_stop(), it will stop all vhost device bind to
> >> this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
> >> , then stop the queue: vhost_virtqueue_stop().
> >>
> >> In vhost_dev_stop(), it resets the device, which clear some flags
> >> in low level driver, and in next loop(stop other vhost backends),
> >> qemu try to stop the queue corresponding to the vhost backend,
> >>   the driver finds that the VQ is invalied, this is the root cause.
> >>
> >> To solve the issue, vdpa should set vring unready, and
> >> remove reset ops in device stop: vhost_dev_start(hdev, false).
> >>
> >> and implement a new function vhost_dev_reset, only reset backend
> >> device after all vhost(per-queue) stoped.
> >
> > Typo.
> >
> >>
> >> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
> >> Acked-by: Jason Wang <jasowang@redhat.com>
> >
> > Rethink this patch, consider there're devices that don't support
> > set_vq_ready(). I wonder if we need
> >
> > 1) uAPI to tell the user space whether or not it supports set_vq_ready()
> > 2) userspace will call SET_VRING_ENABLE() when the device supports
> > otherwise it will use RESET.
>
> if the device does not support set_vq_ready() in kernel, it will trigger
> kernel oops, at least in current kernel, it does not check where
> set_vq_ready has been implemented.
>
> And I checked all vdpa driver in kernel, all drivers has implemented
> this ops.

Actually, it's not about whether or not the set_vq_ready() is
implemented. It's about whether the parent supports it correctly:

The ability to suspend and resume a virtqueue is currently beyond the
ability of some transport (e.g PCI).

For IFCVF:

static void ifcvf_vdpa_set_vq_ready(struct vdpa_device *vdpa_dev,
                                    u16 qid, bool ready)
{
        struct ifcvf_hw *vf = vdpa_to_vf(vdpa_dev);

        vf->vring[qid].ready = ready;
}

It seems to follow the PCI transport, so if you just set it to zero,
it simply doesn't work at all. I can see some tricks that are used in
the DPDK driver, maybe we can use the same to "fix" this.

For VDUSE, we are basically the same:

static void vduse_vdpa_set_vq_ready(struct vdpa_device *vdpa,
                                        u16 idx, bool ready)
{
        struct vduse_dev *dev = vdpa_to_vduse(vdpa);
        struct vduse_virtqueue *vq = &dev->vqs[idx];

        vq->ready = ready;
}

It can't be stopped correctly if we just set it to zero.

For vp_vdpa, it basically wants to abuse the queue_enable, which may
result in a warning in Qemu (and the device isn't stopped).

static void vp_vdpa_set_vq_ready(struct vdpa_device *vdpa,
                                 u16 qid, bool ready)
{
        struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);

        vp_modern_set_queue_enable(mdev, qid, ready);
}

ENI did a trick in writing 0 to virtqueue address, so it works for
stop but not the start.

static void eni_vdpa_set_vq_ready(struct vdpa_device *vdpa, u16 qid,
                                  bool ready)
{
        struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);

        /* ENI is a legacy virtio-pci device. This is not supported
         * by specification. But we can disable virtqueue by setting
         * address to 0.
         */
        if (!ready)
                vp_legacy_set_queue_address(ldev, qid, 0);
}

mlx5 call suspend_vq() which should be fine.

Simulator is probably fine.

So I worry if we use the set_vq_ready(0) it won't work correctly and
will have other issues. The idea is:

- advertise the suspend/resume capability via uAPI, then mlx5_vdpa and
simulator can go with set_vq_ready()
- others can still go with reset(), and we can try to fix them
gradually (and introduce this in the virtio spec).

>
> So I think it is OK to call set_vq_ready without check.
>
> >
> > And for safety, I suggest tagging this as 7.1.
> >
> >> ---
> >> v4 --> v3
> >>      Nothing changed, becasue of issue with mimecast,
> >>      when the From: tag is different from the sender,
> >>      the some mail client will take the patch as an
> >>      attachment, RESEND v3 does not work, So resend
> >>      the patch as v4
> >>
> >> v3 --> v2:
> >>      Call vhost_dev_reset() at the end of vhost_net_stop().
> >>
> >>      Since the vDPA device need re-add the status bit
> >>      VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
> >>      simply, add them inside vhost_vdpa_reset_device, and
> >>      the only way calling vhost_vdpa_reset_device is in
> >>      vhost_net_stop(), so it keeps the same behavior as before.
> >>
> >> v2 --> v1:
> >>     Implement a new function vhost_dev_reset,
> >>     reset the backend kernel device at last.
> >> ---
> >>   hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
> >>   hw/virtio/vhost-vdpa.c    | 15 +++++++++------
> >>   hw/virtio/vhost.c         | 15 ++++++++++++++-
> >>   include/hw/virtio/vhost.h |  1 +
> >>   4 files changed, 45 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >> index 30379d2..422c9bf 100644
> >> --- a/hw/net/vhost_net.c
> >> +++ b/hw/net/vhost_net.c
> >> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> >>       int total_notifiers = data_queue_pairs * 2 + cvq;
> >>       VirtIONet *n = VIRTIO_NET(dev);
> >>       int nvhosts = data_queue_pairs + cvq;
> >> -    struct vhost_net *net;
> >> +    struct vhost_net *net = NULL;
> >>       int r, e, i, index_end = data_queue_pairs * 2;
> >>       NetClientState *peer;
> >>
> >> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> >>   err_start:
> >>       while (--i >= 0) {
> >>           peer = qemu_get_peer(ncs , i);
> >> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> >> +
> >> +        net = get_vhost_net(peer);
> >> +
> >> +        vhost_net_stop_one(net, dev);
> >>       }
> >> +
> >> +    /* We only reset backend vdpa device */
> >> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
> >> +        vhost_dev_reset(&net->dev);
> >> +    }
> >> +
> >>       e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
> >>       if (e < 0) {
> >>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
> >> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> >>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
> >>       VirtIONet *n = VIRTIO_NET(dev);
> >>       NetClientState *peer;
> >> +    struct vhost_net *net = NULL;
> >>       int total_notifiers = data_queue_pairs * 2 + cvq;
> >>       int nvhosts = data_queue_pairs + cvq;
> >>       int i, r;
> >> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
> >>           } else {
> >>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
> >>           }
> >> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> >> +
> >> +        net = get_vhost_net(peer);
> >> +
> >> +        vhost_net_stop_one(net, dev);
> >> +    }
> >> +
> >> +    /* We only reset backend vdpa device */
> >> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
> >> +        vhost_dev_reset(&net->dev);
> >>       }
> >
> > So we've already reset the device in vhost_vdpa_dev_start(), any
> > reason we need to do it again here?
>
> reset device in vhost_vdpa_dev_start if there is some error with start.

The rest should have been done in vhost_net_stop_one()?

>
>
> >
> >>
> >>       r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
> >> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >> index c5ed7a3..3ef0199 100644
> >> --- a/hw/virtio/vhost-vdpa.c
> >> +++ b/hw/virtio/vhost-vdpa.c
> >> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
> >>
> >>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> >>       trace_vhost_vdpa_reset_device(dev, status);
> >> +
> >> +    /* Add back this status, so that the device could work next time*/
> >> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >> +                               VIRTIO_CONFIG_S_DRIVER);
> >
> > This seems to contradict the semantic of reset
>
> Yes, but it's hard to put it in other place, seems only vhost-vdpa need
> it, and for VM shutdown, qemu_del_nic() will do cleanup this like close
> vhost fds, which will call reset in kernel space without set those features.
>
> So at last I put it here with no other inpact.

Can we move this to the suitable caller of this function?

Thanks

>
> Thanks,
> Michael
> >
> >> +
> >>       return ret;
> >>   }
> >>
> >> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
> >>       return idx;
> >>   }
> >>
> >> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
> >>   {
> >>       int i;
> >>       trace_vhost_vdpa_set_vring_ready(dev);
> >>       for (i = 0; i < dev->nvqs; ++i) {
> >>           struct vhost_vring_state state = {
> >>               .index = dev->vq_index + i,
> >> -            .num = 1,
> >> +            .num = ready,
> >>           };
> >>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> >>       }
> >> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >>           if (unlikely(!ok)) {
> >>               return -1;
> >>           }
> >> -        vhost_vdpa_set_vring_ready(dev);
> >> +        vhost_vdpa_set_vring_ready(dev, 1);
> >>       } else {
> >> +        vhost_vdpa_set_vring_ready(dev, 0);
> >>           ok = vhost_vdpa_svqs_stop(dev);
> >>           if (unlikely(!ok)) {
> >>               return -1;
> >> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >>           memory_listener_register(&v->listener, &address_space_memory);
> >>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >>       } else {
> >> -        vhost_vdpa_reset_device(dev);
> >> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >> -                                   VIRTIO_CONFIG_S_DRIVER);
> >>           memory_listener_unregister(&v->listener);
> >>
> >>           return 0;
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index b643f42..7e0cdb6 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -1820,7 +1820,6 @@ fail_features:
> >>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
> >>   {
> >>       int i;
> >> -
> >
> > Unnecessary changes.
> >
> >>       /* should only be called after backend is connected */
> >>       assert(hdev->vhost_ops);
> >>
> >> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
> >>
> >>       return -ENOSYS;
> >>   }
> >> +
> >> +int vhost_dev_reset(struct vhost_dev *hdev)
> >> +{
> >
> > Let's use a separate patch for this.
> >
> > Thanks
> >
> >> +    int ret = 0;
> >> +
> >> +    /* should only be called after backend is connected */
> >> +    assert(hdev->vhost_ops);
> >> +
> >> +    if (hdev->vhost_ops->vhost_reset_device) {
> >> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
> >> +    }
> >> +
> >> +    return ret;
> >> +}
> >> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >> index 58a73e7..b8b7c20 100644
> >> --- a/include/hw/virtio/vhost.h
> >> +++ b/include/hw/virtio/vhost.h
> >> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
> >>   void vhost_dev_cleanup(struct vhost_dev *hdev);
> >>   int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
> >>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> >> +int vhost_dev_reset(struct vhost_dev *hdev);
> >>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
> >>   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
> >>
> >> --
> >> 1.8.3.1
> >>
> >>
> >>
> >
> >
> >
>
>
>


