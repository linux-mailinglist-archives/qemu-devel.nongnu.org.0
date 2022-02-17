Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC74BA6F5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:18:57 +0100 (CET)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkQi-00084G-3b
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:18:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKkLo-0001Xk-LX
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKkLj-0001wD-Qw
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645118026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSO34owMBMgDO9KomQOW8dNh7SicBELlfjkeVV2eW+c=;
 b=G1aJ42g7CDhFKEc1ZER7NUdfnpnB0UCdYqecuYcxA770ad0NyAVpblHr2eoM/nqliMW+jE
 LeooqvRkG92XDih42sL7hHVEkhOlaEcDZEj5LSonlvRkUcH4CdNew58kZmF8Ycttw7PG8+
 tMc4F8icSmcFEJ/zaOriZDSprcYzFf8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-0g7R4SrDNOe3_X4bhfvS8A-1; Thu, 17 Feb 2022 12:13:45 -0500
X-MC-Unique: 0g7R4SrDNOe3_X4bhfvS8A-1
Received: by mail-qk1-f198.google.com with SMTP id
 z1-20020ae9f441000000b00507a22b2d00so4755156qkl.8
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KSO34owMBMgDO9KomQOW8dNh7SicBELlfjkeVV2eW+c=;
 b=4/n8yNavAdKmEhQmsqT1HiAfJywMb2yCqCQSWz/SubcwRMrzrppOejCrIDxl8GoEiY
 y8o6gAoL0R3snPqv6BWFr+hW3pLAq7kMEJ2EoflUTb/5rHh1vo1XyOf1eRloU9P55zgq
 IlIeg7fXG2sus6daIW52vkC747GoS27qttwL5faOKZx892XAD4xMKUm58BzdK/5SMyam
 09NUsZ32QHPkVDVCD0aPQlZDS4k7mDrWm4CCFSmKt3r7eKnYMhRwm7Yds7UIm1TCVMvn
 pDw6jOMjGIX1OH/v6OmN8/vzzfxhzHcgsVTIvA6GS1ivSvYibnclGwTqCNrYGb3SkWOY
 QCng==
X-Gm-Message-State: AOAM533CYIT3ioW2jewNfBAoxtpkrS9PTKpa2DLweqKurjxtAnz/5+y/
 EO3BGEJRVKwq+QOyP/LI1XsfnnSc+WazCkiTL5QzFJdCKrs29MqNmc+lUaZvFmZ8xa2fN49z8hv
 IZuzICzImyDWN9CiW557WCVo1sbZuaeA=
X-Received: by 2002:a0c:e98d:0:b0:42c:fcfa:610d with SMTP id
 z13-20020a0ce98d000000b0042cfcfa610dmr2928756qvn.91.1645118025083; 
 Thu, 17 Feb 2022 09:13:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYLgeesn/6BtkoKf5bxvbClNVRkfHnhPivtIp4iJyT+eWtlGp3yMmzHghSnJgsHlJucn+clawd6rGvDDcX8Sk=
X-Received: by 2002:a0c:e98d:0:b0:42c:fcfa:610d with SMTP id
 z13-20020a0ce98d000000b0042cfcfa610dmr2928735qvn.91.1645118024800; Thu, 17
 Feb 2022 09:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-18-eperezma@redhat.com>
 <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
 <CAJaqyWdRKZp6CwnE+HAr0JALhSRh-trJbZ01kddnLTuRX_tMKQ@mail.gmail.com>
 <3d0dfaaa-a67c-6f48-fd03-45d2661ba92a@redhat.com>
In-Reply-To: <3d0dfaaa-a67c-6f48-fd03-45d2661ba92a@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 17 Feb 2022 18:13:08 +0100
Message-ID: <CAJaqyWfEEg2PKgxBAFwYhF9LD1oDtwVYXSjHHnCbstT3dvL2GA@mail.gmail.com>
Subject: Re: [PATCH 17/31] vdpa: adapt vhost_ops callbacks to svq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Feb 8, 2022 at 4:58 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/1 =E4=B8=8A=E5=8D=882:58, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Sun, Jan 30, 2022 at 5:03 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> First half of the buffers forwarding part, preparing vhost-vdpa
> >>> callbacks to SVQ to offer it. QEMU cannot enable it at this moment, s=
o
> >>> this is effectively dead code at the moment, but it helps to reduce
> >>> patch size.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-shadow-virtqueue.h |   2 +-
> >>>    hw/virtio/vhost-shadow-virtqueue.c |  21 ++++-
> >>>    hw/virtio/vhost-vdpa.c             | 133 +++++++++++++++++++++++++=
+---
> >>>    3 files changed, 143 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-sha=
dow-virtqueue.h
> >>> index 035207a469..39aef5ffdf 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> >>> @@ -35,7 +35,7 @@ size_t vhost_svq_device_area_size(const VhostShadow=
Virtqueue *svq);
> >>>
> >>>    void vhost_svq_stop(VhostShadowVirtqueue *svq);
> >>>
> >>> -VhostShadowVirtqueue *vhost_svq_new(void);
> >>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
> >>>
> >>>    void vhost_svq_free(VhostShadowVirtqueue *vq);
> >>>
> >>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> >>> index f129ec8395..7c168075d7 100644
> >>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> >>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> >>> @@ -277,9 +277,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >>>    /**
> >>>     * Creates vhost shadow virtqueue, and instruct vhost device to us=
e the shadow
> >>>     * methods and file descriptors.
> >>> + *
> >>> + * @qsize Shadow VirtQueue size
> >>> + *
> >>> + * Returns the new virtqueue or NULL.
> >>> + *
> >>> + * In case of error, reason is reported through error_report.
> >>>     */
> >>> -VhostShadowVirtqueue *vhost_svq_new(void)
> >>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
> >>>    {
> >>> +    size_t desc_size =3D sizeof(vring_desc_t) * qsize;
> >>> +    size_t device_size, driver_size;
> >>>        g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVir=
tqueue, 1);
> >>>        int r;
> >>>
> >>> @@ -300,6 +308,15 @@ VhostShadowVirtqueue *vhost_svq_new(void)
> >>>        /* Placeholder descriptor, it should be deleted at set_kick_fd=
 */
> >>>        event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
> >>>
> >>> +    svq->vring.num =3D qsize;
> >>
> >> I wonder if this is the best. E.g some hardware can support up to 32K
> >> queue size. So this will probably end up with:
> >>
> >> 1) SVQ use 32K queue size
> >> 2) hardware queue uses 256
> >>
> > In that case SVQ vring queue size will be 32K and guest's vring can
> > negotiate any number with SVQ equal or less than 32K,
>
>
> Sorry for being unclear what I meant is actually
>
> 1) SVQ uses 32K queue size
>
> 2) guest vq uses 256
>
> This looks like a burden that needs extra logic and may damage the
> performance.
>

Still not getting this point.

An available guest buffer, although contiguous in GPA/GVA, can expand
in multiple buffers if it's not contiguous in qemu's VA (by the while
loop in virtqueue_map_desc [1]). In that scenario it is better to have
"plenty" of SVQ buffers.

I'm ok if we decide to put an upper limit though, or if we decide not
to handle this situation. But we would leave out valid virtio drivers.
Maybe to set a fixed upper limit (1024?)? To add another parameter
(x-svq-size-n=3DN)?

If you mean we lose performance because memory gets more sparse I
think the only possibility is to limit that way.

> And this can lead other interesting situation:
>
> 1) SVQ uses 256
>
> 2) guest vq uses 1024
>
> Where a lot of more SVQ logic is needed.
>

If we agree that a guest descriptor can expand in multiple SVQ
descriptors, this should be already handled by the previous logic too.

But this should only happen in case that qemu is launched with a "bad"
cmdline, isn't it?

If I run that example with vp_vdpa, L0 qemu will happily accept 1024
as a queue size [2]. But if the vdpa device maximum queue size is
effectively 256, this will result in an error: We're not exposing it
to the guest at any moment but with qemu's cmdline.

>
> > including 256.
> > Is that what you mean?
>
>
> I mean, it looks to me the logic will be much more simplified if we just
> allocate the shadow virtqueue with the size what guest can see (guest
> vring).
>
> Then we don't need to think if the difference of the queue size can have
> any side effects.
>

I think that we cannot avoid that extra logic unless we force GPA to
be contiguous in IOVA. If we are sure the guest's buffers cannot be at
more than one descriptor in SVQ, then yes, we can simplify things. If
not, I think we are forced to carry all of it.

But if we prove it I'm not opposed to simplifying things and making
head at SVQ =3D=3D head at guest.

Thanks!

[1] https://gitlab.com/qemu-project/qemu/-/blob/17e31340/hw/virtio/virtio.c=
#L1297
[2] But that's not the whole story: I've been running limited in tx
descriptors because of virtio_net_max_tx_queue_size, which predates
vdpa. I'll send a patch to also un-limit it.

>
> >
> > If with hardware queues you mean guest's vring, not sure why it is
> > "probably 256". I'd say that in that case with the virtio-net kernel
> > driver the ring size will be the same as the device export, for
> > example, isn't it?
> >
> > The implementation should support any combination of sizes, but the
> > ring size exposed to the guest is never bigger than hardware one.
> >
> >> ? Or we SVQ can stick to 256 but this will this cause trouble if we wa=
nt
> >> to add event index support?
> >>
> > I think we should not have any problem with event idx. If you mean
> > that the guest could mark more buffers available than SVQ vring's
> > size, that should not happen because there must be less entries in the
> > guest than SVQ.
> >
> > But if I understood you correctly, a similar situation could happen if
> > a guest's contiguous buffer is scattered across many qemu's VA chunks.
> > Even if that would happen, the situation should be ok too: SVQ knows
> > the guest's avail idx and, if SVQ is full, it will continue forwarding
> > avail buffers when the device uses more buffers.
> >
> > Does that make sense to you?
>
>
> Yes.
>
> Thanks
>


