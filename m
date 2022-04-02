Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B154EFDEF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:22:04 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naTOt-0002FM-L2
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:22:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naTNm-00013j-Mv
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naTNj-0008JD-KU
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648866050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIDmzNSQ5wsCNyrwFnSXQXkbm9AZuu4zhs8SitZcJNU=;
 b=IqS80qM5vcRyFaPLbCk7n/ZuV/A/qtDvudScilUcbh0Ck9gNSot3u76xF04a/5Y+4MWOIE
 szoM5jAXeXd85lPYCJ4YNBBQ+U5v7TDJUzBUlg0gWmnAwInOA7Yu7eflyUboCqtFycuLuF
 7CYNz3HClhwLYoNUbqYRrGGX8mNU+dM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-Iy42wsYLMYqbuoauSXZwpQ-1; Fri, 01 Apr 2022 22:20:49 -0400
X-MC-Unique: Iy42wsYLMYqbuoauSXZwpQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 126-20020a2e0584000000b0024af05cbffdso1307257ljf.19
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 19:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIDmzNSQ5wsCNyrwFnSXQXkbm9AZuu4zhs8SitZcJNU=;
 b=xOOJJTbqwTJBNkeJFQ1S8sFYYDNQWAbt4FchcEuX8lzBgUQnSXgK+vv0R2DL1xAbLN
 1oHZoVMod5rZr34F63SY+utnZzzf4BDwjOJBBZwdC/StKAdW7UKT83f34STiAn8cdl2f
 6skA2xh4x+cA2zWY+kmFDpHomWeHzAyZjHVbCFruicUGQxnqW/x/Fzim1WciEOOQhK8s
 Iytj5aC+HCZB0DivEPqihgiX6/ALJ1zJXq/MnHQ3NBAIO7g4I8uhRJp042xRCgT4mncJ
 +6wcKydACouUpe5C8e1RkSDV2UaeQIt2in3+dXNBDp13Uw/E3jIsv/vGNGwKEgWW7WvR
 LXLw==
X-Gm-Message-State: AOAM530VexnVPwBIDKEkqDwf0PF+hNj/Ph0oUmEUyY/l3F9pjYEg7aYV
 Xdknjrg8mthikMAIov0HKJbn7oxUC0mbhbcgcRIXN8Y7BQHtssiAiYW0xuQ31+G2z/Y1pAzYJ9M
 9ob3nu2SwZ4Dryl9ZBlV4WJLto5DLxfk=
X-Received: by 2002:a05:6512:2203:b0:44a:12c9:8696 with SMTP id
 h3-20020a056512220300b0044a12c98696mr16252131lfu.98.1648866048029; 
 Fri, 01 Apr 2022 19:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOZmdH7RJklM0giOeUKilItp2PblCf+pnWHLsarVgyMdnC2xUQvmEpF+F3xFFZkHgjoIB7Aw/ML8RlrAs+3N8=
X-Received: by 2002:a05:6512:2203:b0:44a:12c9:8696 with SMTP id
 h3-20020a056512220300b0044a12c98696mr16252110lfu.98.1648866047593; Fri, 01
 Apr 2022 19:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
 <ab772bc3-4acd-bb79-7f97-0518e04bb7fe@oracle.com>
In-Reply-To: <ab772bc3-4acd-bb79-7f97-0518e04bb7fe@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 2 Apr 2022 10:20:36 +0800
Message-ID: <CACGkMEv8+XC39G4wK_bUY0ZdFd29YoR7D3ugrMy-iT7cO1arew@mail.gmail.com>
Subject: Re: [PATCH v4] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Michael Qiu <qiudayu@archeros.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Michael.

On Sat, Apr 2, 2022 at 7:08 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/31/2022 7:53 PM, Jason Wang wrote:
> > On Fri, Apr 1, 2022 at 9:31 AM Michael Qiu <qiudayu@archeros.com> wrote:
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
> > Typo.
> >
> >> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
> >> Acked-by: Jason Wang <jasowang@redhat.com>
> > Rethink this patch, consider there're devices that don't support
> > set_vq_ready(). I wonder if we need
> >
> > 1) uAPI to tell the user space whether or not it supports set_vq_ready()
> I guess what's more relevant here is to define the uAPI semantics for
> unready i.e. set_vq_ready(0) for resuming/stopping virtqueue processing,
> as starting vq is comparatively less ambiguous.

Yes.

> Considering the
> likelihood that this interface may be used for live migration, it would
> be nice to come up with variants such as 1) discard inflight request
> v.s. 2) waiting for inflight processing to be done,

Or inflight descriptor reporting (which seems to be tricky). But we
can start from net that a discarding may just work.

>and 3) timeout in
> waiting.

Actually, that's the plan and Eugenio is proposing something like this
via virtio spec:

https://lists.oasis-open.org/archives/virtio-dev/202111/msg00020.html

>
> > 2) userspace will call SET_VRING_ENABLE() when the device supports
> > otherwise it will use RESET.
> Are you looking to making virtqueue resume-able through the new
> SET_VRING_ENABLE() uAPI?
>
> I think RESET is inevitable in some case, i.e. when guest initiates
> device reset by writing 0 to the status register.

Yes, that's all my plan.

> For suspend/resume and
> live migration use cases, indeed RESET can be substituted with
> SET_VRING_ENABLE. Again, it'd need quite some code refactoring to
> accommodate this change. Although I'm all for it, it'd be the best to
> lay out the plan for multiple phases rather than overload this single
> patch too much. You can count my time on this endeavor if you don't mind. :)

You're welcome, I agree we should choose a way to go first:

1) manage to use SET_VRING_ENABLE (more like a workaround anyway)
2) go with virtio-spec (may take a while)
3) don't wait for the spec, have a vDPA specific uAPI first. Note that
I've chatted with most of the vendors and they seem to be fine with
the _S_STOP. If we go this way, we can still provide the forward
compatibility of _S_STOP
4) or do them all (in parallel)

Any thoughts?

Thanks

>
> >
> > And for safety, I suggest tagging this as 7.1.
> +1
>
> Regards,
> -Siwei
>
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
> > So we've already reset the device in vhost_vdpa_dev_start(), any
> > reason we need to do it again here?
> >
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
> > This seems to contradict the semantic of reset.
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
>


