Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0674BEFF4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 04:18:06 +0100 (CET)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMLgj-0007eD-4j
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 22:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMLfU-0006wI-PS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 22:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMLfR-00006e-Bp
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 22:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645499798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHY8uuapAXsf5KULdO4mEh+Xne/2fBaTYxBgL4rXrS8=;
 b=NzCWF168EQDkJYuu0TSDcatQPI6yJmp+gqq0kmw8NyX0r8QhnHdtmqx2XRb8s+DPwiHxe9
 hN7b38+1Eyt7zK0MlkHfPe/JrOL5y3aqlDzKoWqY3qMsYW+e2oXxxeWoPxyPwFS3PHCjPK
 /JPMIZ3ehSInX1TXJWZP8aBnWPD0HKQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-OeoXBTxuPPOc2RRmOCVsmQ-1; Mon, 21 Feb 2022 22:16:37 -0500
X-MC-Unique: OeoXBTxuPPOc2RRmOCVsmQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 h21-20020a05651c125500b002464536cf4eso1624591ljh.23
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 19:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gHY8uuapAXsf5KULdO4mEh+Xne/2fBaTYxBgL4rXrS8=;
 b=llCB8siKDXhd/fgsAgf2Gj+oOcuyohrLQSVC24Z0GACwp8DmDsuZEt5bS6zGzgqEFf
 ihtFQ3VGp+vpMbjzVV0IYO/umE6byqNjCbpjiBsncM10S+ePV9zNuR9nSHdeM5h2muQK
 COZiyXPItwjBImkP247s4OSZF2klAEVhHRAoLAlFTmzCLhhFYNDbdyHaI2oZBCNfuUx/
 vQ5teVs49nKOJ/8IWYDLh8MeObEG6674VibGLhmDfc6OBtkpY1lF5GcXyBHIaAhBMgCO
 Bnj6MEtt8e+EeDswDK9RjRceMydOJqve2cnTAWq5bwv2pdozsU7qmPhp/z91djXsuUzc
 4b6Q==
X-Gm-Message-State: AOAM531G2wGhMPO2DXDV5ZfSByuo306o81YcYrOWlP6oyP69pfHjkDkp
 3dNuYYt+SSjv4ojhePw3P6Mzeupo5Yq4D5AmpnJzLQDbAYetrytsfgG6p7gwilAWk2VLhqBY3ln
 d0zBlgzVhBoTrvtNBUkOePbUIjcXaiLo=
X-Received: by 2002:ac2:4194:0:b0:442:ed9e:4a25 with SMTP id
 z20-20020ac24194000000b00442ed9e4a25mr15714990lfh.629.1645499795430; 
 Mon, 21 Feb 2022 19:16:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFQXM4KXylMKw7WbdxhpVZyCLXX/jI0XWCwc7r24OEqocGHtKuqW/T+EEktOtw/EgdVyRb88GzMPXSR/TEEqw=
X-Received: by 2002:ac2:4194:0:b0:442:ed9e:4a25 with SMTP id
 z20-20020ac24194000000b00442ed9e4a25mr15714952lfh.629.1645499795020; Mon, 21
 Feb 2022 19:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-18-eperezma@redhat.com>
 <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
 <CAJaqyWdRKZp6CwnE+HAr0JALhSRh-trJbZ01kddnLTuRX_tMKQ@mail.gmail.com>
 <3d0dfaaa-a67c-6f48-fd03-45d2661ba92a@redhat.com>
 <CAJaqyWfEEg2PKgxBAFwYhF9LD1oDtwVYXSjHHnCbstT3dvL2GA@mail.gmail.com>
 <02f29b62-6656-ba2f-1475-251b16e0e978@redhat.com>
 <CAJaqyWcoHgToqsR-bVRctTnhgufmarR_2hh4O_VoCbCGp8WNhg@mail.gmail.com>
In-Reply-To: <CAJaqyWcoHgToqsR-bVRctTnhgufmarR_2hh4O_VoCbCGp8WNhg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 22 Feb 2022 11:16:23 +0800
Message-ID: <CACGkMEs+c8_TkrQ4rgtR9u5xYzhJfrzQ9Wuohs+Q_GXFLmOC7w@mail.gmail.com>
Subject: Re: [PATCH 17/31] vdpa: adapt vhost_ops callbacks to svq
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 1:23 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Mon, Feb 21, 2022 at 8:15 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/2/18 =E4=B8=8A=E5=8D=881:13, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > > On Tue, Feb 8, 2022 at 4:58 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >>
> > >> =E5=9C=A8 2022/2/1 =E4=B8=8A=E5=8D=882:58, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> > >>> On Sun, Jan 30, 2022 at 5:03 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > >>>> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > >>>>> First half of the buffers forwarding part, preparing vhost-vdpa
> > >>>>> callbacks to SVQ to offer it. QEMU cannot enable it at this momen=
t, so
> > >>>>> this is effectively dead code at the moment, but it helps to redu=
ce
> > >>>>> patch size.
> > >>>>>
> > >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>>>> ---
> > >>>>>     hw/virtio/vhost-shadow-virtqueue.h |   2 +-
> > >>>>>     hw/virtio/vhost-shadow-virtqueue.c |  21 ++++-
> > >>>>>     hw/virtio/vhost-vdpa.c             | 133 ++++++++++++++++++++=
++++++---
> > >>>>>     3 files changed, 143 insertions(+), 13 deletions(-)
> > >>>>>
> > >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost=
-shadow-virtqueue.h
> > >>>>> index 035207a469..39aef5ffdf 100644
> > >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> > >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > >>>>> @@ -35,7 +35,7 @@ size_t vhost_svq_device_area_size(const VhostSh=
adowVirtqueue *svq);
> > >>>>>
> > >>>>>     void vhost_svq_stop(VhostShadowVirtqueue *svq);
> > >>>>>
> > >>>>> -VhostShadowVirtqueue *vhost_svq_new(void);
> > >>>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
> > >>>>>
> > >>>>>     void vhost_svq_free(VhostShadowVirtqueue *vq);
> > >>>>>
> > >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost=
-shadow-virtqueue.c
> > >>>>> index f129ec8395..7c168075d7 100644
> > >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> > >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > >>>>> @@ -277,9 +277,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *sv=
q)
> > >>>>>     /**
> > >>>>>      * Creates vhost shadow virtqueue, and instruct vhost device =
to use the shadow
> > >>>>>      * methods and file descriptors.
> > >>>>> + *
> > >>>>> + * @qsize Shadow VirtQueue size
> > >>>>> + *
> > >>>>> + * Returns the new virtqueue or NULL.
> > >>>>> + *
> > >>>>> + * In case of error, reason is reported through error_report.
> > >>>>>      */
> > >>>>> -VhostShadowVirtqueue *vhost_svq_new(void)
> > >>>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
> > >>>>>     {
> > >>>>> +    size_t desc_size =3D sizeof(vring_desc_t) * qsize;
> > >>>>> +    size_t device_size, driver_size;
> > >>>>>         g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShad=
owVirtqueue, 1);
> > >>>>>         int r;
> > >>>>>
> > >>>>> @@ -300,6 +308,15 @@ VhostShadowVirtqueue *vhost_svq_new(void)
> > >>>>>         /* Placeholder descriptor, it should be deleted at set_ki=
ck_fd */
> > >>>>>         event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_F=
D);
> > >>>>>
> > >>>>> +    svq->vring.num =3D qsize;
> > >>>> I wonder if this is the best. E.g some hardware can support up to =
32K
> > >>>> queue size. So this will probably end up with:
> > >>>>
> > >>>> 1) SVQ use 32K queue size
> > >>>> 2) hardware queue uses 256
> > >>>>
> > >>> In that case SVQ vring queue size will be 32K and guest's vring can
> > >>> negotiate any number with SVQ equal or less than 32K,
> > >>
> > >> Sorry for being unclear what I meant is actually
> > >>
> > >> 1) SVQ uses 32K queue size
> > >>
> > >> 2) guest vq uses 256
> > >>
> > >> This looks like a burden that needs extra logic and may damage the
> > >> performance.
> > >>
> > > Still not getting this point.
> > >
> > > An available guest buffer, although contiguous in GPA/GVA, can expand
> > > in multiple buffers if it's not contiguous in qemu's VA (by the while
> > > loop in virtqueue_map_desc [1]). In that scenario it is better to hav=
e
> > > "plenty" of SVQ buffers.
> >
> >
> > Yes, but this case should be rare. So in this case we should deal with
> > overrun on SVQ, that is
> >
> > 1) SVQ is full
> > 2) guest VQ isn't
> >
> > We need to
> >
> > 1) check the available buffer slots
> > 2) disable guest kick and wait for the used buffers
> >
> > But it looks to me the current code is not ready for dealing with this =
case?
> >
>
> Yes it deals, that's the meaning of svq->next_guest_avail_elem.

Oh right, I missed that.

>
> >
> > >
> > > I'm ok if we decide to put an upper limit though, or if we decide not
> > > to handle this situation. But we would leave out valid virtio drivers=
.
> > > Maybe to set a fixed upper limit (1024?)? To add another parameter
> > > (x-svq-size-n=3DN)?
> > >
> > > If you mean we lose performance because memory gets more sparse I
> > > think the only possibility is to limit that way.
> >
> >
> > If guest is not using 32K, having a 32K for svq may gives extra stress
> > on the cache since we will end up with a pretty large working set.
> >
>
> That might be true. My guess is that it should not matter, since SVQ
> and the guest's vring will have the same numbers of scattered buffers
> and the avail / used / packed ring will be consumed more or less
> sequentially. But I haven't tested.
>
> I think it's better to add an upper limit (either fixed or in the
> qemu's backend's cmdline) later if we see that this is a problem.

I'd suggest using the same size as what the guest saw.

> Another solution now would be to get the number from the frontend
> device cmdline instead of from the vdpa device. I'm ok with that, but
> it doesn't delete the svq->next_guest_avail_elem processing, and it
> comes with disadvantages in my opinion. More below.

Right, we should keep next_guest_avail_elem. Using the same queue size
is a balance between:

1) using next_guest_avail_elem (rare)
2) not give too much stress on the cache

>
> >
> > >
> > >> And this can lead other interesting situation:
> > >>
> > >> 1) SVQ uses 256
> > >>
> > >> 2) guest vq uses 1024
> > >>
> > >> Where a lot of more SVQ logic is needed.
> > >>
> > > If we agree that a guest descriptor can expand in multiple SVQ
> > > descriptors, this should be already handled by the previous logic too=
.
> > >
> > > But this should only happen in case that qemu is launched with a "bad=
"
> > > cmdline, isn't it?
> >
> >
> > This seems can happen when we use -device
> > virtio-net-pci,tx_queue_size=3D1024 with a 256 size vp_vdpa device at l=
east?
> >
>
> I'm going to use the rx queue here since it's more accurate, tx has
> its own limit separately.
>
> If we use rx_queue_size=3D256 in L0 and rx_queue_size=3D1024 in L1 with n=
o
> SVQ, L0 qemu will happily accept 1024 as size

Interesting, looks like a bug (I guess it works since you enable vhost?):

Per virtio-spec:

"""
Queue Size. On reset, specifies the maximum queue size supported by
the device. This can be modified by the driver to reduce memory
requirements. A 0 means the queue is unavailable.
"""

We can't increase the queue_size from 256 to 1024 actually. (Only
decrease is allowed).

> when L1 qemu writes that
> value at vhost_virtqueue_start. I'm not sure what would happen with a
> real device, my guess is that the device will fail somehow. That's
> what I meant with a "bad cmdline", I should have been more specific.

I should say that it's something that is probably unrelated to this
series but needs to be addressed.

>
> If we add SVQ to the mix, the guest first negotiates the 1024 with the
> qemu device model. After that, vhost.c will try to write 1024 too but
> this is totally ignored by this patch's changes at
> vhost_vdpa_set_vring_num. Finally, SVQ will set 256 as a ring size to
> the device, since it's the read value from the device, leading to your
> scenario. So SVQ effectively isolates both sides and makes possible
> the communication, even with a device that does not support so many
> descriptors.
>
> But SVQ already handles this case: It's the same as if the buffers are
> fragmented in HVA and queue size is equal at both sides. That's why I
> think SVQ size should depend on the backend device's size, not
> frontend cmdline.

Right.

Thanks

>
> Thanks!
>
> >
> > >
> > > If I run that example with vp_vdpa, L0 qemu will happily accept 1024
> > > as a queue size [2]. But if the vdpa device maximum queue size is
> > > effectively 256, this will result in an error: We're not exposing it
> > > to the guest at any moment but with qemu's cmdline.
> > >
> > >>> including 256.
> > >>> Is that what you mean?
> > >>
> > >> I mean, it looks to me the logic will be much more simplified if we =
just
> > >> allocate the shadow virtqueue with the size what guest can see (gues=
t
> > >> vring).
> > >>
> > >> Then we don't need to think if the difference of the queue size can =
have
> > >> any side effects.
> > >>
> > > I think that we cannot avoid that extra logic unless we force GPA to
> > > be contiguous in IOVA. If we are sure the guest's buffers cannot be a=
t
> > > more than one descriptor in SVQ, then yes, we can simplify things. If
> > > not, I think we are forced to carry all of it.
> >
> >
> > Yes, I agree, the code should be robust to handle any case.
> >
> > Thanks
> >
> >
> > >
> > > But if we prove it I'm not opposed to simplifying things and making
> > > head at SVQ =3D=3D head at guest.
> > >
> > > Thanks!
> > >
> > > [1] https://gitlab.com/qemu-project/qemu/-/blob/17e31340/hw/virtio/vi=
rtio.c#L1297
> > > [2] But that's not the whole story: I've been running limited in tx
> > > descriptors because of virtio_net_max_tx_queue_size, which predates
> > > vdpa. I'll send a patch to also un-limit it.
> > >
> > >>> If with hardware queues you mean guest's vring, not sure why it is
> > >>> "probably 256". I'd say that in that case with the virtio-net kerne=
l
> > >>> driver the ring size will be the same as the device export, for
> > >>> example, isn't it?
> > >>>
> > >>> The implementation should support any combination of sizes, but the
> > >>> ring size exposed to the guest is never bigger than hardware one.
> > >>>
> > >>>> ? Or we SVQ can stick to 256 but this will this cause trouble if w=
e want
> > >>>> to add event index support?
> > >>>>
> > >>> I think we should not have any problem with event idx. If you mean
> > >>> that the guest could mark more buffers available than SVQ vring's
> > >>> size, that should not happen because there must be less entries in =
the
> > >>> guest than SVQ.
> > >>>
> > >>> But if I understood you correctly, a similar situation could happen=
 if
> > >>> a guest's contiguous buffer is scattered across many qemu's VA chun=
ks.
> > >>> Even if that would happen, the situation should be ok too: SVQ know=
s
> > >>> the guest's avail idx and, if SVQ is full, it will continue forward=
ing
> > >>> avail buffers when the device uses more buffers.
> > >>>
> > >>> Does that make sense to you?
> > >>
> > >> Yes.
> > >>
> > >> Thanks
> > >>
> >
>


