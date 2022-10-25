Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33F360C1E4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:48:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9we-0004UU-8X; Mon, 24 Oct 2022 22:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1on9wc-0004UH-Ch
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1on9wY-0000W6-RI
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666665930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFIPaa1MTvuP1jRm4KktRdY3E4MRaqtoItSDtCD+qSo=;
 b=Irfo8zDFfKSZwYSAl8Yx/U/zm3CUTg5y7QCM2oFaI6qfP+DHwV+BbQRSllwP41bEww3CEo
 6gTZvqpROR7lAL4H5uNVMD8R0YUZ2iVcmz000azEeXoMYV0kNmnaPLlEelo4rqrD/KMT08
 yUIyjhHnUFJwtNukQ1Ao8h8P1Kko2j0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-UmkYuW78O3mB-G5EnfFu_w-1; Mon, 24 Oct 2022 22:45:27 -0400
X-MC-Unique: UmkYuW78O3mB-G5EnfFu_w-1
Received: by mail-oo1-f72.google.com with SMTP id
 c20-20020a4ad214000000b0048086d0c456so5257303oos.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tFIPaa1MTvuP1jRm4KktRdY3E4MRaqtoItSDtCD+qSo=;
 b=oXgD2fDokue2tZO4cfAPyBRgHpPzAhU49Mh5NKnX3J+7S5j4w3GwM+F/bhCWICa4ZA
 2QiCJGtvQHaL5JFlCX5WI97AUvmLs3U5Y2QubTXamWL52ryyfLB9761nUerR+ie4uw2j
 vQV/CJPev+0p3UDjc+bfN1SPN41sUYnioyFPTMU9mv9K6tb7uSDtRGKvZCB5iF2jX/pw
 +jbaXWbXhCYI/awg94/XMElF2f71E5veMmm66z2Tc1eRRzu2gzTt8E2nomIJ6/TxDtUM
 TT0yygG4NYVCgfhMPAVD3XNZoiUgJy4p00oMY4i9pQEZF91uvsdZDWsrsCXcFhxgGnbH
 P1AA==
X-Gm-Message-State: ACrzQf2vMAZKplsPM2TnXtrz5kwcJ4EIabxqPAbLG5hNOJufPPtxR3IT
 LxuvGsJDSgbl+szpDfzR+ZXWOLm6qhcd97OK0fv9OIHO8B7AEXtP0XZQ5D7kpRWSzY0n5hDMWJD
 YPjM5kUI8jHs/NW6vHEOw6GV0CmWHtrI=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr22380838oab.280.1666665921575; 
 Mon, 24 Oct 2022 19:45:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YYX6DA5mbStdj6xt+S+Q6y3bWVZOdAEqHxhStoL/ccik6zPl991gN98JL3IhYxQsLDNTW3ZawNI2KhQX1gNc=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr22380821oab.280.1666665921286; Mon, 24
 Oct 2022 19:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
 <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
 <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
 <CACGkMEs9mc5pqRr8XNhVw8pvQZ+hvnPRiMmyuzJvNsSU=Cfoxg@mail.gmail.com>
 <CAJaqyWfCn0gPc=+GY-0ASutwSP+1-AyFhp0XO4v6K+3JJZktuA@mail.gmail.com>
 <CACGkMEuwq_s6P9AxQD4Pmhb5R3naETeiQG+Nx0TJLbpdF6Xesg@mail.gmail.com>
 <CAJaqyWfo4WJo_LJpBtLirHtNCUO23NZQETv7k_jWo0LjQ1tVLw@mail.gmail.com>
In-Reply-To: <CAJaqyWfo4WJo_LJpBtLirHtNCUO23NZQETv7k_jWo0LjQ1tVLw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 25 Oct 2022 10:45:09 +0800
Message-ID: <CACGkMEtiJeSebHVFMQ79Zkx4LoKeywxRvyi6m63JF_Kvfc3YdA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] vdpa: Save emulated features list in vhost_vdpa
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 5:26 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Mon, Oct 24, 2022 at 4:14 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Oct 21, 2022 at 4:56 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Fri, Oct 21, 2022 at 4:57 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Thu, Oct 20, 2022 at 2:34 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Thu, Oct 20, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > > > > >
> > > > > > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@re=
dhat.com> wrote:
> > > > > > >
> > > > > > > At this moment only _F_LOG is added there.
> > > > > > >
> > > > > > > However future patches add features that depend on the kind o=
f device.
> > > > > > > In particular, only net devices can add VIRTIO_F_GUEST_ANNOUN=
CE. So
> > > > > > > let's allow vhost_vdpa creator to set custom emulated device =
features.
> > > > > > >
> > > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > > ---
> > > > > > >  include/hw/virtio/vhost-vdpa.h | 2 ++
> > > > > > >  hw/virtio/vhost-vdpa.c         | 8 ++++----
> > > > > > >  net/vhost-vdpa.c               | 4 ++++
> > > > > > >  3 files changed, 10 insertions(+), 4 deletions(-)
> > > > > > >
> > > > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virt=
io/vhost-vdpa.h
> > > > > > > index 1111d85643..50083e1e3b 100644
> > > > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > > > @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
> > > > > > >      bool iotlb_batch_begin_sent;
> > > > > > >      MemoryListener listener;
> > > > > > >      struct vhost_vdpa_iova_range iova_range;
> > > > > > > +    /* VirtIO device features that can be emulated by qemu *=
/
> > > > > > > +    uint64_t added_features;
> > > > > >
> > > > > > Any reason we need a per vhost_vdpa storage for this? Or is the=
re a
> > > > > > chance that this field could be different among the devices?
> > > > > >
> > > > >
> > > > > Yes, one device could support SVQ and the other one could not sup=
port
> > > > > it because of different feature sets for example.
> > > >
> > > > Right, but for those devices that don't support SVQ, we don't even
> > > > need mediation for feature like F_LOG and _F_STATUS?
> > > >
> > >
> > > No, and we cannot offer it to the guest either.
> >
> > Just to make sure we are on the same page, what I meant is, consider
> > in the future SVQ get the support of all features, so we can remove
> > this field? This is because _F_STATUS can be mediated unconditionally
> > anyhow.
> >
>
> For _F_STATUS that is right. But we cannot handle full
> _F_GUEST_ANNOUNCE since control SVQ (will) needs features from the
> device that cannot be emulated, like ASID.
>
> I think your point is "Since qemu cannot migrate these devices it will
> never set VIRTIO_NET_S_ANNOUNCE, so the guest will never send
> VIRTIO_NET_CTRL_ANNOUNCE messages". And I think that is totally right,
> but I still feel it is weird to expose it if we cannot handle it.
>
> Maybe a good first step is to move added_features to vhost_net, or
> maybe to convert it to "bool guest_announce_emulated" or something
> similar?  This way hw/virtio/vhost-vdpa is totally unaware of this and
> changes are more self contained.

This reminds me of something. For vhost, if Qemu can handle some
feature bits, we don't need to validate if vhost has such support.

E.g we don't have _F_SATAUS and _F_GUEST_ANNOUNCE in kernel_feature_bits.

I wonder if we can do something similar for vhost-vDPA? Then we don't
need to bother new fields.

Thanks

>
> Thanks!
>
>
>
> > Thanks
> >
> > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks!
> > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >      uint64_t acked_features;
> > > > > > >      bool shadow_vqs_enabled;
> > > > > > >      /* IOVA mapping used by the Shadow Virtqueue */
> > > > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > > > index 7468e44b87..ddb5e29288 100644
> > > > > > > --- a/hw/virtio/vhost-vdpa.c
> > > > > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > > > > @@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct=
 vhost_dev *dev,
> > > > > > >
> > > > > > >          v->acked_features =3D features;
> > > > > > >
> > > > > > > -        /* We must not ack _F_LOG if SVQ is enabled */
> > > > > > > -        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > > > > > > +        /* Do not ack features emulated by qemu */
> > > > > > > +        features &=3D ~v->added_features;
> > > > > > >      }
> > > > > > >
> > > > > > >      trace_vhost_vdpa_set_features(dev, features);
> > > > > > > @@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(stru=
ct vhost_dev *dev,
> > > > > > >      int ret =3D vhost_vdpa_get_dev_features(dev, features);
> > > > > > >
> > > > > > >      if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > > > > > > -        /* Add SVQ logging capabilities */
> > > > > > > -        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > > > > > > +        /* Add emulated capabilities */
> > > > > > > +        *features |=3D v->added_features;
> > > > > > >      }
> > > > > > >
> > > > > > >      return ret;
> > > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > > index eebf29f5c1..3803452800 100644
> > > > > > > --- a/net/vhost-vdpa.c
> > > > > > > +++ b/net/vhost-vdpa.c
> > > > > > > @@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_in=
it(NetClientState *peer,
> > > > > > >      s->vhost_vdpa.index =3D queue_pair_index;
> > > > > > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > > > > >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > > > > > > +    if (svq) {
> > > > > > > +        /* Add SVQ logging capabilities */
> > > > > > > +        s->vhost_vdpa.added_features |=3D BIT_ULL(VHOST_F_LO=
G_ALL);
> > > > > > > +    }
> > > > > > >      if (!is_datapath) {
> > > > > > >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_ho=
st_page_size(),
> > > > > > >                                              vhost_vdpa_net_c=
vq_cmd_page_len());
> > > > > > > --
> > > > > > > 2.31.1
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


