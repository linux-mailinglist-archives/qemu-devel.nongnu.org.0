Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0BE43313F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:41:36 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckge-00005V-2U
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mckfH-0007gx-1u
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mckfE-0002IU-4K
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634632802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnKvhFFzzs9dLgJkh8miW0paqi9+3Fb4ETj82Vkdvxs=;
 b=PsQ8U2ppqKx7YN5X0BuMxD9pWD7ZM5KTfZdEb6/SlPc9r9b1TbI/68g7G5qlFrIpip8V+v
 7DFqXy+WJUkS/JFJAhxnQQBLT8P1eOCBA7HH2Yn0LuAYtQj6zyagA5ldY9GfowGELZswsA
 Or9cMp+B1va0DcDdK8nSHEE7YxIh/7w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-18T94T9fOfC52sWpzAEuvA-1; Tue, 19 Oct 2021 04:40:01 -0400
X-MC-Unique: 18T94T9fOfC52sWpzAEuvA-1
Received: by mail-qv1-f70.google.com with SMTP id
 gw8-20020a0562140f0800b0038366347de1so16897342qvb.16
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 01:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jnKvhFFzzs9dLgJkh8miW0paqi9+3Fb4ETj82Vkdvxs=;
 b=G2HZ7EKw448JdTeMczdFsGGS5cMWqABXG5Vb93jMyv0jXBSm1UjCXYBZUL8jp1+qCD
 giowQHa07k4f0z3t4hCjBTozDh7D/yGQaC5+52et7e2upMOJt0ShgxdGKCJTqNEmGBw9
 fZ3zVcDLHi60KVU20Afw+Af8k8hHpDDAXGaTmF9Xot2ZDXvI0k8rUPT5SKckVCpBbIDh
 uOKZWZx8SdujkeAzMKnl9XvjfXeWHek6b3nqdmgH5JSeidICbTDSxxExJEaotYo0+o7o
 /7jHWAY7GC4RPkf+CPk5iVvhRvM+Q4z4g9frQ69H4akqUXcA0RwnvMQ1eaf5/tvm+APl
 7B4w==
X-Gm-Message-State: AOAM5334r2KqpgnJfcfQOU1F4MHOmawS0saVKk1JDwA1NfpK0Oks0lkO
 N9Qj1i+6Zl8yqDiNqBPIvqs8RFUldCm4buRi/hzBDHc0RVkg2TT/HrbpSz9EqLYZlLFt4mWLXz1
 ha16tFbSWFx4vNcHaFDKVkSQMwP3sFf8=
X-Received: by 2002:a05:6214:1763:: with SMTP id
 et3mr30357080qvb.37.1634632801040; 
 Tue, 19 Oct 2021 01:40:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgLAMZjdUzVpqa37qSz5b3bEuoWS1g04LY6ZjT3vqTjFhQVMNTd17OMoD2NMIMEjcQpCCRMmbS2er0RF21Nc0=
X-Received: by 2002:a05:6214:1763:: with SMTP id
 et3mr30357063qvb.37.1634632800689; 
 Tue, 19 Oct 2021 01:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <ab9a7771-5f9b-6413-3e38-bd3dc7373256@redhat.com>
 <CAJaqyWfm734HrwTJK71hUQNYVkyDaR8OiqtGro_AX9i_pXfmBQ@mail.gmail.com>
 <78843cbf-0096-816b-da74-5406fdcc3783@redhat.com>
In-Reply-To: <78843cbf-0096-816b-da74-5406fdcc3783@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 19 Oct 2021 10:39:24 +0200
Message-ID: <CAJaqyWcO9oaGsRe-oMNbmHx7G4Mw0vZfc+7WYQ23+SteoFVn4Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 6:42 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/15 =E4=B8=8A=E5=8D=8812:39, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Wed, Oct 13, 2021 at 5:47 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> This will make qemu aware of the device used buffers, allowing it to
> >>> write the guest memory with its contents if needed.
> >>>
> >>> Since the use of vhost_virtqueue_start can unmasks and discard call
> >>> events, vhost_virtqueue_start should be modified in one of these ways=
:
> >>> * Split in two: One of them uses all logic to start a queue with no
> >>>     side effects for the guest, and another one tha actually assumes =
that
> >>>     the guest has just started the device. Vdpa should use just the
> >>>     former.
> >>> * Actually store and check if the guest notifier is masked, and do it
> >>>     conditionally.
> >>> * Left as it is, and duplicate all the logic in vhost-vdpa.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.c | 19 +++++++++++++++
> >>>    hw/virtio/vhost-vdpa.c             | 38 ++++++++++++++++++++++++++=
+++-
> >>>    2 files changed, 56 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index 21dc99ab5d..3fe129cf63 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -53,6 +53,22 @@ static void vhost_handle_guest_kick(EventNotifier =
*n)
> >>>        event_notifier_set(&svq->kick_notifier);
> >>>    }
> >>>
> >>> +/* Forward vhost notifications */
> >>> +static void vhost_svq_handle_call_no_test(EventNotifier *n)
> >>> +{
> >>> +    VhostShadowVirtqueue *svq =3D container_of(n, VhostShadowVirtque=
ue,
> >>> +                                             call_notifier);
> >>> +
> >>> +    event_notifier_set(&svq->guest_call_notifier);
> >>> +}
> >>> +
> >>> +static void vhost_svq_handle_call(EventNotifier *n)
> >>> +{
> >>> +    if (likely(event_notifier_test_and_clear(n))) {
> >>> +        vhost_svq_handle_call_no_test(n);
> >>> +    }
> >>> +}
> >>> +
> >>>    /*
> >>>     * Obtain the SVQ call notifier, where vhost device notifies SVQ t=
hat there
> >>>     * exists pending used buffers.
> >>> @@ -180,6 +196,8 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_=
dev *dev, int idx)
> >>>        }
> >>>
> >>>        svq->vq =3D virtio_get_queue(dev->vdev, vq_idx);
> >>> +    event_notifier_set_handler(&svq->call_notifier,
> >>> +                               vhost_svq_handle_call);
> >>>        return g_steal_pointer(&svq);
> >>>
> >>>    err_init_call_notifier:
> >>> @@ -195,6 +213,7 @@ err_init_kick_notifier:
> >>>    void vhost_svq_free(VhostShadowVirtqueue *vq)
> >>>    {
> >>>        event_notifier_cleanup(&vq->kick_notifier);
> >>> +    event_notifier_set_handler(&vq->call_notifier, NULL);
> >>>        event_notifier_cleanup(&vq->call_notifier);
> >>>        g_free(vq);
> >>>    }
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index bc34de2439..6c5f4c98b8 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -712,13 +712,40 @@ static bool vhost_vdpa_svq_start_vq(struct vhos=
t_dev *dev, unsigned idx)
> >>>    {
> >>>        struct vhost_vdpa *v =3D dev->opaque;
> >>>        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 idx);
> >>> -    return vhost_svq_start(dev, idx, svq);
> >>> +    EventNotifier *vhost_call_notifier =3D vhost_svq_get_svq_call_no=
tifier(svq);
> >>> +    struct vhost_vring_file vhost_call_file =3D {
> >>> +        .index =3D idx + dev->vq_index,
> >>> +        .fd =3D event_notifier_get_fd(vhost_call_notifier),
> >>> +    };
> >>> +    int r;
> >>> +    bool b;
> >>> +
> >>> +    /* Set shadow vq -> guest notifier */
> >>> +    assert(v->call_fd[idx]);
> >>
> >> We need aovid the asser() here. On which case we can hit this?
> >>
> > I would say that there is no way we can actually hit it, so let's remov=
e it.
> >
> >>> +    vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
> >>> +
> >>> +    b =3D vhost_svq_start(dev, idx, svq);
> >>> +    if (unlikely(!b)) {
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    /* Set device -> SVQ notifier */
> >>> +    r =3D vhost_vdpa_set_vring_dev_call(dev, &vhost_call_file);
> >>> +    if (unlikely(r)) {
> >>> +        error_report("vhost_vdpa_set_vring_call for shadow vq failed=
");
> >>> +        return false;
> >>> +    }
> >>
> >> Similar to kick, do we need to set_vring_call() before vhost_svq_start=
()?
> >>
> > It should not matter at this moment because the device should not be
> > started at this point and device calls should not run
> > vhost_svq_handle_call until BQL is released.
>
>
> Yes, we stop virtqueue before.
>
>
> >
> > The "logic" of doing it after is to make clear that svq must be fully
> > initialized before processing device calls, even in the case that we
> > extract SVQ in its own iothread or similar. But this could be done
> > before vhost_svq_start for sure.
> >
> >>> +
> >>> +    /* Check for pending calls */
> >>> +    event_notifier_set(vhost_call_notifier);
> >>
> >> Interesting, can this result spurious interrupt?
> >>
> > This actually "queues" a vhost_svq_handle_call after the BQL release,
> > where the device should be fully reset. In that regard, if there are
> > no used descriptors there will not be an irq raised to the guest. Does
> > that answer the question? Or have I missed something?
>
>
> Yes, please explain this in the comment.
>

I'm reviewing this again, and actually I think I was wrong in solving the i=
ssue.

Since at this point the device is being configured, there is no chance
that we had a missing call notification here: A previous kick is
needed for the device to generate any calls, and these cannot be
processed.

What is not solved in this series is that we could have pending used
buffers in vdpa device stopping SVQ, but queuing a check for that is
not going to solve anything, since SVQ vring would be already
destroyed:

* vdpa device marks N > 0 buffers as used, and calls.
* Before processing them, SVQ stop is called. SVQ have not processed
these, and cleans them, making this event_notifier_set useless.

So this would require a few changes. Mainly, instead of queueing a
check for used, these need to be checked before svq cleaning. After
that, obtain the VQ state (is not obtained in the stop at the moment,
trusting in guest's used idx) and run a last
vhost_svq_handle_call_no_test while the device is paused.

Thanks!

>
> >
> >>> +    return true;
> >>>    }
> >>>
> >>>    static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool e=
nable)
> >>>    {
> >>>        struct vhost_dev *hdev =3D v->dev;
> >>>        unsigned n;
> >>> +    int r;
> >>>
> >>>        if (enable =3D=3D v->shadow_vqs_enabled) {
> >>>            return hdev->nvqs;
> >>> @@ -752,9 +779,18 @@ static unsigned vhost_vdpa_enable_svq(struct vho=
st_vdpa *v, bool enable)
> >>>        if (!enable) {
> >>>            /* Disable all queues or clean up failed start */
> >>>            for (n =3D 0; n < v->shadow_vqs->len; ++n) {
> >>> +            struct vhost_vring_file file =3D {
> >>> +                .index =3D vhost_vdpa_get_vq_index(hdev, n),
> >>> +                .fd =3D v->call_fd[n],
> >>> +            };
> >>> +
> >>> +            r =3D vhost_vdpa_set_vring_call(hdev, &file);
> >>> +            assert(r =3D=3D 0);
> >>> +
> >>>                unsigned vq_idx =3D vhost_vdpa_get_vq_index(hdev, n);
> >>>                VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->sha=
dow_vqs, n);
> >>>                vhost_svq_stop(hdev, n, svq);
> >>> +            /* TODO: This can unmask or override call fd! */
> >>
> >> I don't get this comment. Does this mean the current code can't work
> >> with mask_notifiers? If yes, this is something we need to fix.
> >>
> > Yes, but it will be addressed in the next series. I should have
> > explained it bette here, sorry :).
>
>
> Ok.
>
> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>>                vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n],=
 vq_idx);
> >>>            }
> >>>
>


