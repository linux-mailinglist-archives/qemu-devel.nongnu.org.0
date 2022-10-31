Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B64C613AFE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 17:10:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opXKp-0000DY-Hh; Mon, 31 Oct 2022 12:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opXJ5-00086e-EZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opXIt-0005BW-9G
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667232380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NExbgZ4Gvv5gAMqoF9dtywVXU0EhWwt5IRMfjKTC7qY=;
 b=U3tIBdRzWoR9KS8X1+fGL3uy5oPajI0M7lPBkMUf5hDOy65s48puGmsKmpNd1qkg8mVJdi
 YtCI8PLKfkqggTB7eAcUcHteTf/7ViXuM95sHr4PsdIF/u5huH+Yzh45e0Bu3/MjkIKP/y
 Amo1K+TtHupzTe/N8bjeKVoInJ8tMdY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-MiNwY8WbNFaG7yssWajc9w-1; Mon, 31 Oct 2022 12:06:19 -0400
X-MC-Unique: MiNwY8WbNFaG7yssWajc9w-1
Received: by mail-qt1-f199.google.com with SMTP id
 fp9-20020a05622a508900b003a503ff1d4cso6518836qtb.22
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 09:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NExbgZ4Gvv5gAMqoF9dtywVXU0EhWwt5IRMfjKTC7qY=;
 b=BKZRWoRdyVVE0LGXcYbzENLFX/juBbdE1z6IUJ2zNo6r90Muea9O2knz9h5Iet9pF1
 IUH2LywhxNUSfJn55pFx8ak6u8KEVvs8y5RX9CUnAxPAlMHn2ajqWd8J9AvxCJ4FIh9a
 +m7cMv2kcijfbf37R/B27axogtkKtkx3o3cgeKO5pQpIq7j04NatSOlAZj60mYxiCdKe
 avlBlmdiV/Q6PT2BOObDEzozRucgkfp/EWjg7v9Tletj18nByycSJS6yTJyMLJNNBtxS
 HVOipohNl3iK4/Uy2dfcy8pTugWmEMZdnh7zZXWnF7BjAuqYleguN2/Z/XJKxBDcYOXV
 gPQQ==
X-Gm-Message-State: ACrzQf0JDjqVOGAqmcMNFlUw9wb/RVMn0X4a+R6Q/QZ+r3CvnwScnOyW
 +tUlKSKSPHY+OA6IHgiArp8Cz4K0Jh5adHiaoh1Vo3be7/NSVmdTuSykG6y9MZdqhY5dHgFcNNe
 aNWQmBP+Q9H+46zWMGDd5jZ+snU9y/wQ=
X-Received: by 2002:a05:6214:2345:b0:473:a82c:34eb with SMTP id
 hu5-20020a056214234500b00473a82c34ebmr11746393qvb.9.1667232378804; 
 Mon, 31 Oct 2022 09:06:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6iSUzun+VrsFzazU3I+jATYuGrMC7rQ6KAw357Z1U5oMTlh6cArwiTBdP4cayZSzRqLSswgz0/PcwiYjFjf5Q=
X-Received: by 2002:a05:6214:2345:b0:473:a82c:34eb with SMTP id
 hu5-20020a056214234500b00473a82c34ebmr11746367qvb.9.1667232378576; Mon, 31
 Oct 2022 09:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
 <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
 <CAJaqyWdj2OPyjZ1s9jK1botrVEHd2+K+Q783soLtmf5WVnArFg@mail.gmail.com>
 <20221031083210-mutt-send-email-mst@kernel.org>
 <CAJaqyWeLrKZGet7q+sJUQ_DzAHQGm5onvVK8vdbq9C1xVrD77w@mail.gmail.com>
 <20221031110630-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031110630-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Oct 2022 17:05:42 +0100
Message-ID: <CAJaqyWcEmMD9jRAV_OR+ciJ+9dr7vYmTRz0ziwAMAgNMRtHKDQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 4:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 31, 2022 at 02:02:16PM +0100, Eugenio Perez Martin wrote:
> > On Mon, Oct 31, 2022 at 1:33 PM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > >
> > > On Mon, Oct 31, 2022 at 09:54:34AM +0100, Eugenio Perez Martin wrote:
> > > > On Sat, Oct 29, 2022 at 12:48 AM Philippe Mathieu-Daud=C3=A9
> > > > <philmd@linaro.org> wrote:
> > > > >
> > > > > On 28/10/22 18:02, Eugenio P=C3=A9rez wrote:
> > > > > > This causes errors on virtio modern devices on big endian hosts
> > > > > >
> > > > > > Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used=
 event idx")
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > ---
> > > > > >   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
> > > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vho=
st-shadow-virtqueue.c
> > > > > > index 70766ea740..467099f5d9 100644
> > > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > > @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(V=
hostShadowVirtqueue *svq)
> > > > > >   {
> > > > > >       if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVEN=
T_IDX)) {
> > > > > >           uint16_t *used_event =3D &svq->vring.avail->ring[svq-=
>vring.num];
> > > > > > -        *used_event =3D svq->shadow_used_idx;
> > > > > > +        *used_event =3D cpu_to_le16(svq->shadow_used_idx);
> > > > >
> > > > > This looks correct, but what about:
> > > > >
> > > > >             virtio_stw_p(svq->vdev, used_event, svq->shadow_used_=
idx);
> > > > >
> > > >
> > > > Hi Philippe,
> > > >
> > > > I think this has the same answer as [1], the endianness conversion
> > > > from the guest to the host may not be the same as the one needed fr=
om
> > > > qemu SVQ to the vdpa device. Please let me know if it is not the ca=
se.
> > > >
> > > > Thanks!
> > > >
> > > > [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg060=
81.html
> > >
> > > So considering legacy, i do not belive you can make a legacy
> > > device on top of modern one using SVQ alone.
> > >
> >
> > Right, more work is needed. For example, config r/w conversions. But
> > it's a valid use case where SVQ helps too.
>
> I am not sure why it's valid frankly.
>
> > > So I'd say SVQ should follow virtio endian-ness, not LE.
> >
> > At this moment both the device that the guest sees and the vdpa device
> > must be modern ones to enable SVQ. So the event idx must be stored in
> > the vring in LE. Similar access functions as virtio_ld* and virtio_st*
> > are needed if SVQ supports legacy vdpa devices in the future.
> >
> > The point is that svq->shadow_avail_idx is decoupled from the guest's
> > avail ring, event idx, etc. It will always be in the host's CPU
> > endianness, regardless of the guest's one. And, for the moment, the
> > event idx write must be in LE.
> >
> > There is a more fundamental problem about using virtio_{st,ld}* here:
> > These read from and write to guest's memory, but neither
> > svq->shadow_used_idx or shadow vring are in guest's memory but only in
> > qemu's VA. To start the support of legacy vdpa devices would involve a
> > deeper change here, since all shadow vring writes and reads are
> > written this way.
> >
> > Thanks!
>
> Yea generally, I don't know how it can work given legacy
> will never attach a PASID to a VQ.
>

The conversion I tried to put here was legacy guests communicating in
big endian with qemu, and then qemu communicating in little endian
with modern devices. For this to work SVQ should be enabled for all
the queues all the time.

Then the simplest conversion function here should be cpu_to_leNN,
isn't it? The only device we support here is a modern, little endian,

But maybe my example just added more noise. My point is that this
write and all the writes and loads added on these patches, have
nothing to do with the guest's endianness. They are only from the SVQ
vring to the device. And they are not forwarding the used_event of the
guest, but another decoupled one that may or may not match. That's why
the endianness we should take into account is not the vdev one, but
only the CPU and little endian.

> But maybe given we add yet another variant of endian-ness
> it is time to actually use sparse tags for this stuff.
>

I agree with this. I can try to do a fast POC.

Thanks!


> > >
> > >
> > > > > >       } else {
> > > > > >           svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL=
_F_NO_INTERRUPT);
> > > > > >       }
> > > > >
> > >
>


