Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED106E890C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 06:20:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppLlR-00004t-Tr; Thu, 20 Apr 2023 00:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ppLlP-0008WI-B6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 00:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ppLlI-0002mC-TY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 00:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681964350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2WjbfwM1g6JIJ8PFzZBV6S6SxYklBUylgmABqOdk04=;
 b=K0cd4znx37vIE6ResNvomoAPZbHkdJ+t9sJX1FefREngYICe9PPgjixUPqqdrZKEFrsLm4
 +7xWcvO3RKccVARR0JbDm/Cyl3kmiEezPSj7n5riPnzoUvWCTyVIfhzBoCD+1NlVLEz3hs
 Dclxedsf1ZFm2MYMVnVs9KLAZC4yjrg=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-G73M2u3WMAWM53qNr9eUrw-1; Thu, 20 Apr 2023 00:19:09 -0400
X-MC-Unique: G73M2u3WMAWM53qNr9eUrw-1
Received: by mail-ot1-f71.google.com with SMTP id
 b5-20020a9d4785000000b006a60790ec37so32276otf.10
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 21:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681964348; x=1684556348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2WjbfwM1g6JIJ8PFzZBV6S6SxYklBUylgmABqOdk04=;
 b=TZi9EEQ6GA5VfsMSmd/zw+caffonYkBWwKx5Y78bogMsBE/Kq1SiGm7sFhDwDTxm/Y
 OEiYtYVMmrK4Hsogq12dkcrqS8i8vdCjvHKbNREOAuZc2yiGcdMzqiMym/mSaJdY6qbG
 1TiGBJyz6pWWJKd0Qxz1JFDwljwu6DX0+VH213hh3Y1q9Qma2UFFL7W52hrtzBTI2+Q0
 bUd1e+fIOp9wLh9G+Uv5WGbuZsVkZlPmoS/RVWNzjRRbK80GZM4jeZLV+uj7UHITNs3j
 tlwwwcvRpP8/B4IU1pCo1APY9VWpTgloCOSJ7JeIIqkbLZYUp9mGyUf1P6KE5+mR73BU
 dnAQ==
X-Gm-Message-State: AAQBX9f18aQGkj+V3+VmCnfbQeoODb22JgmjnTzBwv/hWhexLegmJhHl
 sA+J+7+s7CdhhKIAa4PLO+Wfn79wybdZRet1oR9+SqC+Odv7k8Z3pK87LrjFuVUEDZjjD/w+Jr9
 XV7EcqxXItHVD8HjNyy/1BwwZsFqOoLs=
X-Received: by 2002:a4a:4583:0:b0:547:2801:d37b with SMTP id
 y125-20020a4a4583000000b005472801d37bmr252474ooa.5.1681964348444; 
 Wed, 19 Apr 2023 21:19:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZWzDe6BZa/BTwWGpFv6ZqlRZhw7OEybghD/tS2+g7+N08br6+soy0V5R3XOgIgIicxJfZIlBe5PuBbL3b/LWo=
X-Received: by 2002:a4a:4583:0:b0:547:2801:d37b with SMTP id
 y125-20020a4a4583000000b005472801d37bmr252466ooa.5.1681964348138; Wed, 19 Apr
 2023 21:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230418225638.1467969-1-peili.dev@gmail.com>
 <CAJaqyWebSowMMWh+HCjj7tmbA3Ey6C69T=SPA4k+6fd_-GjfoA@mail.gmail.com>
In-Reply-To: <CAJaqyWebSowMMWh+HCjj7tmbA3Ey6C69T=SPA4k+6fd_-GjfoA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Apr 2023 12:18:57 +0800
Message-ID: <CACGkMEu0d0y82wo1p2g-ovbUTYJcVon0-t8fvgFQLokZmd7hDQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Reduce vdpa initialization / startup overhead
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: peili.dev@gmail.com, qemu-devel@nongnu.org, 
 Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 19, 2023 at 11:33=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Apr 19, 2023 at 12:56=E2=80=AFAM <peili.dev@gmail.com> wrote:
> >
> > From: Pei Li <peili.dev@gmail.com>
> >
> > Currently, part of the vdpa initialization / startup process
> > needs to trigger many ioctls per vq, which is very inefficient
> > and causing unnecessary context switch between user mode and
> > kernel mode.
> >
> > This patch creates an additional ioctl() command, namely
> > VHOST_VDPA_GET_VRING_GROUP_BATCH, that will batching
> > commands of VHOST_VDPA_GET_VRING_GROUP into a single
> > ioctl() call.

I'd expect there's a kernel patch but I didn't see that?

If we want to go this way. Why simply have a more generic way, that is
introducing something like:

VHOST_CMD_BATCH which did something like

struct vhost_cmd_batch {
    int ncmds;
    struct vhost_ioctls[];
};

Then you can batch other ioctls other than GET_VRING_GROUP?

Thanks

> >
>
> It seems to me you forgot to send the 0/2 cover letter :).
>
> Please include the time we save thanks to avoiding the repetitive
> ioctls in each patch.
>
> CCing Jason and Michael.
>
> > Signed-off-by: Pei Li <peili.dev@gmail.com>
> > ---
> >  hw/virtio/vhost-vdpa.c                       | 31 +++++++++++++++-----
> >  include/standard-headers/linux/vhost_types.h |  3 ++
> >  linux-headers/linux/vhost.h                  |  7 +++++
> >  3 files changed, 33 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index bc6bad23d5..6d45ff8539 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -679,7 +679,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_=
dev *dev)
> >      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> >          0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> >          0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
> > -        0x1ULL << VHOST_BACKEND_F_SUSPEND;
> > +        0x1ULL << VHOST_BACKEND_F_SUSPEND |
> > +        0x1ULL << VHOST_BACKEND_F_IOCTL_BATCH;
> >      int r;
> >
> >      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> > @@ -731,14 +732,28 @@ static int vhost_vdpa_get_vq_index(struct vhost_d=
ev *dev, int idx)
> >
> >  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >  {
> > -    int i;
> > +    int i, nvqs =3D dev->nvqs;
> > +    uint64_t backend_features =3D dev->backend_cap;
> > +
> >      trace_vhost_vdpa_set_vring_ready(dev);
> > -    for (i =3D 0; i < dev->nvqs; ++i) {
> > -        struct vhost_vring_state state =3D {
> > -            .index =3D dev->vq_index + i,
> > -            .num =3D 1,
> > -        };
> > -        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > +
> > +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOCTL_BATCH))) {
> > +        for (i =3D 0; i < nvqs; ++i) {
> > +            struct vhost_vring_state state =3D {
> > +                .index =3D dev->vq_index + i,
> > +                .num =3D 1,
> > +            };
> > +            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > +        }
> > +    } else {
> > +        struct vhost_vring_state states[nvqs + 1];
> > +        states[0].num =3D nvqs;
> > +        for (i =3D 1; i <=3D nvqs; ++i) {
> > +            states[i].index =3D dev->vq_index + i - 1;
> > +            states[i].num =3D 1;
> > +        }
> > +
>
> I think it's more clear to share the array of vhost_vring_state
> states[nvqs + 1], and then fill it either in one shot with
> VHOST_VDPA_SET_VRING_ENABLE_BATCH or individually with
> VHOST_VDPA_SET_VRING_ENABLE.
>
> The same feedback goes for VHOST_VDPA_GET_VRING_GROUP_BATCH in the next p=
atch.
>
> > +        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE_BATCH, &state=
s[0]);
> >      }
> >      return 0;
>
> This comment is previous to your patch but I just realized we don't
> check the return value of vhost_vdpa_call. Maybe it is worth
> considering addressing that in this series too.
>
> >  }
> > diff --git a/include/standard-headers/linux/vhost_types.h b/include/sta=
ndard-headers/linux/vhost_types.h
> > index c41a73fe36..068d0e1ceb 100644
> > --- a/include/standard-headers/linux/vhost_types.h
> > +++ b/include/standard-headers/linux/vhost_types.h
> > @@ -164,4 +164,7 @@ struct vhost_vdpa_iova_range {
> >  /* Device can be suspended */
> >  #define VHOST_BACKEND_F_SUSPEND  0x4
> >
> > +/* IOCTL requests can be batched */
> > +#define VHOST_BACKEND_F_IOCTL_BATCH 0x6
> > +
> >  #endif
> > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> > index f9f115a7c7..4c9ddd0a0e 100644
> > --- a/linux-headers/linux/vhost.h
> > +++ b/linux-headers/linux/vhost.h
> > @@ -180,4 +180,11 @@
> >   */
> >  #define VHOST_VDPA_SUSPEND             _IO(VHOST_VIRTIO, 0x7D)
> >
> > +/* Batch version of VHOST_VDPA_SET_VRING_ENABLE
> > + *
> > + * Enable/disable the ring while batching the commands.
> > + */
> > +#define VHOST_VDPA_SET_VRING_ENABLE_BATCH      _IOW(VHOST_VIRTIO, 0x7F=
, \
> > +                                            struct vhost_vring_state)
> > +
>
> These headers should be updated with update-linux-headers.sh. To be
> done that way we need the changes merged in the kernel before.
>
> We can signal that the series is not ready for inclusion with the
> subject [RFC. PATCH], like [1], and note it in the commit message.
> That way, you can keep updating the header manually for demonstration
> purposes.
>
> Thanks!
>
> [1] https://lore.kernel.org/qemu-devel/20220413163206.1958254-23-eperezma=
@redhat.com/
>


