Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2F6E8D66
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:01:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQ9m-00033X-P7; Thu, 20 Apr 2023 05:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppQ9e-0002xk-AJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppQ9c-0000pE-9Q
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681981235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rFVBM8Gvu01aSIwjLuHMvsaMqoZb0KmRTgX5GiBgf8=;
 b=Tt9VuqE4mEyoDA7sV+Alii5UWn0IoEvk/qGNmQekd1MOQBlsgu7RLVlajOWz4t1qDhrQ9U
 kQhmaUhFjjRQRLtbEehMh7JVlZvoBAhUIpfkU/5J5xQCe+PLtYQBnfnVPfKH32XNLC6jmE
 wOytRu3SvI5EkepgAGBUuEOXcmaPf/c=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-HIl9hNxOMey6IRF0tSQ0tQ-1; Thu, 20 Apr 2023 05:00:34 -0400
X-MC-Unique: HIl9hNxOMey6IRF0tSQ0tQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-54f8b46f399so17687117b3.10
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981233; x=1684573233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rFVBM8Gvu01aSIwjLuHMvsaMqoZb0KmRTgX5GiBgf8=;
 b=UMKRPaJnJMSOxpTKK9dqoW9QMvCnFhzWugGx7rhZ47RqSaTsIWvjCpDgn4q5iKr7dg
 bJ6HoWATouT6yqnaAOEnTXenBOs+kdweQ7oysarsiSz3D+jEp0XLgz9ZIaL63PnNF9/W
 mN1BIg9GCC/yqxU37429ehNhj8OTesND1KhnraNhXOYvUr0CsayUQSSP3cDeVkN4I9hR
 z+lCtc4FpnBW5owZcuE/1TI3Vf2bpwpuJfX+ICPYO3eDbiY4CS+cr6ID+rMQ5OsNxBds
 T4pbRJuTwBSY61CpryU3I/fm9bmGj07Riwl8rDwH+ii5MepajLvjZDz4jelGhXROAQjF
 zt/A==
X-Gm-Message-State: AAQBX9eazlwH7aFeVwuakhH4bAjw7ciijUKJzmOmtWCQJbLXM5hTGA2m
 LCEwpvjY0Am1UDbBopZ6PKrwUCYsTTmqhYaPHbyfvjVKIZn6uwYhr1/5sjk4dhSCh6YmsnVFQYh
 cyT/LtH3u9ETyB3ZDWDr4RV92Xp6zgVM=
X-Received: by 2002:a0d:c643:0:b0:539:1b13:3d64 with SMTP id
 i64-20020a0dc643000000b005391b133d64mr258240ywd.48.1681981233611; 
 Thu, 20 Apr 2023 02:00:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1J/GTXEPWYdTKitqZTeV2QS+QtCSZTx2G6E10V5QvYZ+E+MJkEgd2Jr2ypW+tx2qogjZ6m1gBEkLIXkxQwFo=
X-Received: by 2002:a0d:c643:0:b0:539:1b13:3d64 with SMTP id
 i64-20020a0dc643000000b005391b133d64mr258220ywd.48.1681981233163; Thu, 20 Apr
 2023 02:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230418225638.1467969-1-peili.dev@gmail.com>
 <CAJaqyWebSowMMWh+HCjj7tmbA3Ey6C69T=SPA4k+6fd_-GjfoA@mail.gmail.com>
 <CACGkMEu0d0y82wo1p2g-ovbUTYJcVon0-t8fvgFQLokZmd7hDQ@mail.gmail.com>
 <CACCFcFr8rYbM3OF8Hk=WnS7mAUv49aTsYHWnMwkMVg8SWRhp+Q@mail.gmail.com>
In-Reply-To: <CACCFcFr8rYbM3OF8Hk=WnS7mAUv49aTsYHWnMwkMVg8SWRhp+Q@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 20 Apr 2023 10:59:56 +0200
Message-ID: <CAJaqyWeOuUDKyXd7QAOUhMb-6G+P_q_X4Nz7K+QSJwqdE8UO2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Reduce vdpa initialization / startup overhead
To: Pei Li <peili@andrew.cmu.edu>
Cc: Jason Wang <jasowang@redhat.com>, peili.dev@gmail.com,
 qemu-devel@nongnu.org, 
 Michael Tsirkin <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Thu, Apr 20, 2023 at 7:25=E2=80=AFAM Pei Li <peili@andrew.cmu.edu> wrote=
:
>
> Hi all,
>
> My bad, I just submitted the kernel patch. If we are passing some generic=
 command, still we have to add an additional field in the structure to indi=
cate what is the unbatched version of this command, and the struct vhost_io=
ctls would be some command specific structure. In summary, the structure wo=
uld be something like
> struct vhost_cmd_batch {
>     int ncmds;
>     int cmd;

The unbatched version should go in each vhost_ioctls. That allows us
to send many different commands in one ioctl instead of having to
resort to many ioctls, each one for a different task.

The problem with that is the size of that struct vhost_ioctl, so we
can build an array. I think it should be enough with the biggest of
them (vhost_vring_addr ?) for a long time, but I would like to know if
anybody finds a drawback here. We could always resort to pointers if
we find we need more space, or start with them from the beginning.

CCing Si-Wei here too, as he is also interested in reducing the startup tim=
e.

Thanks!

>     struct vhost_ioctls[];
> };
>
> This is doable. Also, this is my first time submitting patches to open so=
urce, sorry about the mess in advance. That being said, feel free to throw =
questions / comments!
>
> Thanks and best regards,
> Pei
>
> On Wed, Apr 19, 2023 at 9:19=E2=80=AFPM Jason Wang <jasowang@redhat.com> =
wrote:
>>
>> On Wed, Apr 19, 2023 at 11:33=E2=80=AFPM Eugenio Perez Martin
>> <eperezma@redhat.com> wrote:
>> >
>> > On Wed, Apr 19, 2023 at 12:56=E2=80=AFAM <peili.dev@gmail.com> wrote:
>> > >
>> > > From: Pei Li <peili.dev@gmail.com>
>> > >
>> > > Currently, part of the vdpa initialization / startup process
>> > > needs to trigger many ioctls per vq, which is very inefficient
>> > > and causing unnecessary context switch between user mode and
>> > > kernel mode.
>> > >
>> > > This patch creates an additional ioctl() command, namely
>> > > VHOST_VDPA_GET_VRING_GROUP_BATCH, that will batching
>> > > commands of VHOST_VDPA_GET_VRING_GROUP into a single
>> > > ioctl() call.
>>
>> I'd expect there's a kernel patch but I didn't see that?
>>
>> If we want to go this way. Why simply have a more generic way, that is
>> introducing something like:
>>
>> VHOST_CMD_BATCH which did something like
>>
>> struct vhost_cmd_batch {
>>     int ncmds;
>>     struct vhost_ioctls[];
>> };
>>
>> Then you can batch other ioctls other than GET_VRING_GROUP?
>>
>> Thanks
>>
>> > >
>> >
>> > It seems to me you forgot to send the 0/2 cover letter :).
>> >
>> > Please include the time we save thanks to avoiding the repetitive
>> > ioctls in each patch.
>> >
>> > CCing Jason and Michael.
>> >
>> > > Signed-off-by: Pei Li <peili.dev@gmail.com>
>> > > ---
>> > >  hw/virtio/vhost-vdpa.c                       | 31 +++++++++++++++--=
---
>> > >  include/standard-headers/linux/vhost_types.h |  3 ++
>> > >  linux-headers/linux/vhost.h                  |  7 +++++
>> > >  3 files changed, 33 insertions(+), 8 deletions(-)
>> > >
>> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> > > index bc6bad23d5..6d45ff8539 100644
>> > > --- a/hw/virtio/vhost-vdpa.c
>> > > +++ b/hw/virtio/vhost-vdpa.c
>> > > @@ -679,7 +679,8 @@ static int vhost_vdpa_set_backend_cap(struct vho=
st_dev *dev)
>> > >      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
>> > >          0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
>> > >          0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
>> > > -        0x1ULL << VHOST_BACKEND_F_SUSPEND;
>> > > +        0x1ULL << VHOST_BACKEND_F_SUSPEND |
>> > > +        0x1ULL << VHOST_BACKEND_F_IOCTL_BATCH;
>> > >      int r;
>> > >
>> > >      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)=
) {
>> > > @@ -731,14 +732,28 @@ static int vhost_vdpa_get_vq_index(struct vhos=
t_dev *dev, int idx)
>> > >
>> > >  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>> > >  {
>> > > -    int i;
>> > > +    int i, nvqs =3D dev->nvqs;
>> > > +    uint64_t backend_features =3D dev->backend_cap;
>> > > +
>> > >      trace_vhost_vdpa_set_vring_ready(dev);
>> > > -    for (i =3D 0; i < dev->nvqs; ++i) {
>> > > -        struct vhost_vring_state state =3D {
>> > > -            .index =3D dev->vq_index + i,
>> > > -            .num =3D 1,
>> > > -        };
>> > > -        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>> > > +
>> > > +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOCTL_BATCH)))=
 {
>> > > +        for (i =3D 0; i < nvqs; ++i) {
>> > > +            struct vhost_vring_state state =3D {
>> > > +                .index =3D dev->vq_index + i,
>> > > +                .num =3D 1,
>> > > +            };
>> > > +            vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &stat=
e);
>> > > +        }
>> > > +    } else {
>> > > +        struct vhost_vring_state states[nvqs + 1];
>> > > +        states[0].num =3D nvqs;
>> > > +        for (i =3D 1; i <=3D nvqs; ++i) {
>> > > +            states[i].index =3D dev->vq_index + i - 1;
>> > > +            states[i].num =3D 1;
>> > > +        }
>> > > +
>> >
>> > I think it's more clear to share the array of vhost_vring_state
>> > states[nvqs + 1], and then fill it either in one shot with
>> > VHOST_VDPA_SET_VRING_ENABLE_BATCH or individually with
>> > VHOST_VDPA_SET_VRING_ENABLE.
>> >
>> > The same feedback goes for VHOST_VDPA_GET_VRING_GROUP_BATCH in the nex=
t patch.
>> >
>> > > +        vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE_BATCH, &st=
ates[0]);
>> > >      }
>> > >      return 0;
>> >
>> > This comment is previous to your patch but I just realized we don't
>> > check the return value of vhost_vdpa_call. Maybe it is worth
>> > considering addressing that in this series too.
>> >
>> > >  }
>> > > diff --git a/include/standard-headers/linux/vhost_types.h b/include/=
standard-headers/linux/vhost_types.h
>> > > index c41a73fe36..068d0e1ceb 100644
>> > > --- a/include/standard-headers/linux/vhost_types.h
>> > > +++ b/include/standard-headers/linux/vhost_types.h
>> > > @@ -164,4 +164,7 @@ struct vhost_vdpa_iova_range {
>> > >  /* Device can be suspended */
>> > >  #define VHOST_BACKEND_F_SUSPEND  0x4
>> > >
>> > > +/* IOCTL requests can be batched */
>> > > +#define VHOST_BACKEND_F_IOCTL_BATCH 0x6
>> > > +
>> > >  #endif
>> > > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost=
.h
>> > > index f9f115a7c7..4c9ddd0a0e 100644
>> > > --- a/linux-headers/linux/vhost.h
>> > > +++ b/linux-headers/linux/vhost.h
>> > > @@ -180,4 +180,11 @@
>> > >   */
>> > >  #define VHOST_VDPA_SUSPEND             _IO(VHOST_VIRTIO, 0x7D)
>> > >
>> > > +/* Batch version of VHOST_VDPA_SET_VRING_ENABLE
>> > > + *
>> > > + * Enable/disable the ring while batching the commands.
>> > > + */
>> > > +#define VHOST_VDPA_SET_VRING_ENABLE_BATCH      _IOW(VHOST_VIRTIO, 0=
x7F, \
>> > > +                                            struct vhost_vring_stat=
e)
>> > > +
>> >
>> > These headers should be updated with update-linux-headers.sh. To be
>> > done that way we need the changes merged in the kernel before.
>> >
>> > We can signal that the series is not ready for inclusion with the
>> > subject [RFC. PATCH], like [1], and note it in the commit message.
>> > That way, you can keep updating the header manually for demonstration
>> > purposes.
>> >
>> > Thanks!
>> >
>> > [1] https://lore.kernel.org/qemu-devel/20220413163206.1958254-23-epere=
zma@redhat.com/
>> >
>>
>>


