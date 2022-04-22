Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0A50B3F9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:24:25 +0200 (CEST)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpWa-0005yU-8Q
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nhpQL-0002GR-1s
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nhpQH-0003se-Mk
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650619072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7dC+5S4vyarPKA/YZ4oBeclFf8Leo3H2F/MQZePGGs=;
 b=HUZHEpSsDp03J2mw3nW6ZT7vvMPmA3rgENo5KqLwFW2zOF9ot+ZeLidclio6p9zV4lh7AU
 GgTtg2qW1IIbkWUSPdAi4EwaXAd2f/K5w6MihyWCdKct3L7pv9Ts6DK3PyDE17+ElsvNyx
 GeOrnJoZBB+jfCaBXQ7fXRIjsCPamNU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-eIyrFf_JN_eE0njZY0Gdwg-1; Fri, 22 Apr 2022 05:17:51 -0400
X-MC-Unique: eIyrFf_JN_eE0njZY0Gdwg-1
Received: by mail-qv1-f69.google.com with SMTP id
 u7-20020a0cb407000000b00446687f0b1bso6062314qve.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m7dC+5S4vyarPKA/YZ4oBeclFf8Leo3H2F/MQZePGGs=;
 b=phcGSsHx/7gmntOyf8f1py1z/tE4J9LvFqZPuLrNxtUad4oiDGnrifGREHEsrUJYhz
 3uTjvR4arx6AG6PNCPFsez9DaDgXNysEFZ9d1lbwIgB+E+MTnDJo3JtM88zNMLeFJYA2
 0WPYKnl+JHkqESz9BS1yUgJVTF1CTaKZfBuduLZktxgWyXrTYDKz54vdq7QLYx1TNLu4
 S/YMI6za6D1sA9wlJEmVKaGaWEgwgtrpMCrCaVj+1JB78w5Hslb5db/PZg3Q8jRQ/2LQ
 qxNGK/WnD+4gaiVUZ6cAN96PCd60B6UsGVSH28ctlWOJKwgf/Dz9yTAyMbTtsxxoa067
 CDPA==
X-Gm-Message-State: AOAM5303doTJl8WH0n+mVLR7LsaPhkLquhQYzcvrw9b6UnsG35ccykq7
 6vR5o1SPdglnCQO7ldlihPrOV5uWBFic9YwhE0Bul3AR7GjH6uIVymsOiN/f+AghVjvh29e/pyC
 iC7S/J3GWc5ZrXVq7Tx+UEWEkUZhjZ5M=
X-Received: by 2002:a05:6214:89:b0:444:4e37:9d7a with SMTP id
 n9-20020a056214008900b004444e379d7amr2807831qvr.119.1650619070457; 
 Fri, 22 Apr 2022 02:17:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCFJtBqbBZBDP17uIkzsxuiDjjXusx0Qieifqr4ZV840ydSSUjxE3celavE5TdXOe74EBm5u+CD152uTODe5E=
X-Received: by 2002:a05:6214:89:b0:444:4e37:9d7a with SMTP id
 n9-20020a056214008900b004444e379d7amr2807823qvr.119.1650619070151; Fri, 22
 Apr 2022 02:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-7-eperezma@redhat.com>
 <c615a02d-ea43-77f2-8a2a-b306e2f6a450@redhat.com>
In-Reply-To: <c615a02d-ea43-77f2-8a2a-b306e2f6a450@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 22 Apr 2022 11:17:14 +0200
Message-ID: <CAJaqyWcTp1y5hRfjwo_C+6pT1MR-8VQWRzSA+p+sLzQwWDFJng@mail.gmail.com>
Subject: Re: [RFC PATCH v7 06/25] vdpa: Send all updates in memory listener
 commit
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 6:12 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/4/14 00:31, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > With the introduction of many ASID it can happen that many changes on
> > different listeners come before the commit call.
>
>
> I think we have at most one listener even for the case of MQ/CVQ?
>

In this series we will have one listener per ASID used. To do it
differently requires either not sending all the guest space to CVQ (I
find it ok although it may be slower and a little bit trickier) or to
make the last vhost_vdpa device model to be aware of all others ASID.

>
> >   Since kernel vhost-vdpa
> > still does not support it, send it all in one shot.
> >
> > This also have one extra advantage: If there is no update to notify, we
> > save the iotlb_{begin,end} calls.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/vhost-vdpa.h |  2 +-
> >   hw/virtio/vhost-vdpa.c         | 69 +++++++++++++++++----------------=
-
> >   2 files changed, 36 insertions(+), 35 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index a29dbb3f53..4961acea8b 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -27,7 +27,7 @@ typedef struct vhost_vdpa {
> >       int device_fd;
> >       int index;
> >       uint32_t msg_type;
> > -    bool iotlb_batch_begin_sent;
> > +    GArray *iotlb_updates;
> >       MemoryListener listener;
> >       struct vhost_vdpa_iova_range iova_range;
> >       uint64_t acked_features;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 1f229ff4cb..27ee678dc9 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -85,6 +85,11 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, =
hwaddr iova, hwaddr size,
> >       msg.iotlb.perm =3D readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
> >       msg.iotlb.type =3D VHOST_IOTLB_UPDATE;
> >
> > +    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_BATCH)) {
> > +        g_array_append_val(v->iotlb_updates, msg);
> > +        return 0;
> > +    }
>
>
> I think it's better to use a consistent way for !batch and batch (E.g we
> can do this even for the backend that doesn't support batching?)
>

Yes, with no batching it simply sends all the batch here instead of in comm=
it.

> Otherwise the codes are hard to be maintained.
>

I think it's hard to come back to the previous model as long as we
need two listeners. I can try to remove the need of the asid 1
listener, but if we're not able the possibility for this is to always
delay the maps to memory listener commit callback then.

>
> > +
> >      trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotl=
b.size,
> >                               msg.iotlb.uaddr, msg.iotlb.perm, msg.iotl=
b.type);
> >
> > @@ -109,6 +114,11 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa =
*v, hwaddr iova,
> >       msg.iotlb.size =3D size;
> >       msg.iotlb.type =3D VHOST_IOTLB_INVALIDATE;
> >
> > +    if (v->dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_IOTLB_BATCH)) {
> > +        g_array_append_val(v->iotlb_updates, msg);
> > +        return 0;
> > +    }
> > +
> >       trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> >                                  msg.iotlb.size, msg.iotlb.type);
> >
> > @@ -121,56 +131,47 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa=
 *v, hwaddr iova,
> >       return ret;
> >   }
> >
> > -static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
> > -{
> > -    int fd =3D v->device_fd;
> > -    struct vhost_msg_v2 msg =3D {
> > -        .type =3D v->msg_type,
> > -        .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> > -    };
> > -
> > -    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.t=
ype);
> > -    if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> > -        error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > -                     fd, errno, strerror(errno));
> > -    }
> > -}
> > -
> > -static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
> > -{
> > -    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH) =
&&
> > -        !v->iotlb_batch_begin_sent) {
> > -        vhost_vdpa_listener_begin_batch(v);
> > -    }
> > -
> > -    v->iotlb_batch_begin_sent =3D true;
> > -}
> > -
> >   static void vhost_vdpa_listener_commit(MemoryListener *listener)
> >   {
> >       struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa=
, listener);
> > -    struct vhost_dev *dev =3D v->dev;
> >       struct vhost_msg_v2 msg =3D {};
> >       int fd =3D v->device_fd;
> > +    size_t num =3D v->iotlb_updates->len;
> >
> > -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)))=
 {
> > +    if (!num) {
> >           return;
> >       }
> >
> > -    if (!v->iotlb_batch_begin_sent) {
> > -        return;
> > +    msg.type =3D v->msg_type;
> > +    msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> > +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.t=
ype);
> > +    if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
>
>
> We need check whehter the vhost-vDPA support batching first?
>

If it's not supported, num =3D=3D 0.

>
> > +        error_report("failed to write BEGIN_BATCH, fd=3D%d, errno=3D%d=
 (%s)",
> > +                     fd, errno, strerror(errno));
> > +        goto done;
> >       }
> >
> > -    msg.type =3D v->msg_type;
> > -    msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> > +    for (size_t i =3D 0; i < num; ++i) {
> > +        struct vhost_msg_v2 *update =3D &g_array_index(v->iotlb_update=
s,
> > +                                                     struct vhost_msg_=
v2, i);
> > +        if (write(fd, update, sizeof(*update)) !=3D sizeof(*update)) {
> > +            error_report("failed to write dma update, fd=3D%d, errno=
=3D%d (%s)",
> > +                         fd, errno, strerror(errno));
> > +            goto done;
>
>
> Maybe it's time to introduce v3 to allow a batch of messaged to be
> passed to vhost-vDPA in a single system call.
>

It would be nice but then we're not solving the problem for pre-v3 kernels.

Thanks!

> Thanks
>
>
> > +        }
> > +    }
> >
> > +    msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> >       trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type)=
;
> >       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >                        fd, errno, strerror(errno));
> >       }
> >
> > -    v->iotlb_batch_begin_sent =3D false;
> > +done:
> > +    g_array_set_size(v->iotlb_updates, 0);
> > +    return;
> > +
> >   }
> >
> >   static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > @@ -227,7 +228,6 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >           iova =3D mem_region.iova;
> >       }
> >
> > -    vhost_vdpa_iotlb_batch_begin_once(v);
> >       ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> >                                vaddr, section->readonly);
> >       if (ret) {
> > @@ -292,7 +292,6 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >           iova =3D result->iova;
> >           vhost_iova_tree_remove(v->iova_tree, &mem_region);
> >       }
> > -    vhost_vdpa_iotlb_batch_begin_once(v);
> >       ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >       if (ret) {
> >           error_report("vhost_vdpa dma unmap error!");
> > @@ -446,6 +445,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, v=
oid *opaque, Error **errp)
> >       dev->opaque =3D  opaque ;
> >       v->listener =3D vhost_vdpa_memory_listener;
> >       v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > +    v->iotlb_updates =3D g_array_new(false, false, sizeof(struct vhost=
_msg_v2));
> >       ret =3D vhost_vdpa_init_svq(dev, v, errp);
> >       if (ret) {
> >           goto err;
> > @@ -579,6 +579,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev=
)
> >       trace_vhost_vdpa_cleanup(dev, v);
> >       vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >       memory_listener_unregister(&v->listener);
> > +    g_array_free(v->iotlb_updates, true);
> >       vhost_vdpa_svq_cleanup(dev);
> >
> >       dev->opaque =3D NULL;
>


