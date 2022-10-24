Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C8B609A3C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:12:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omneD-0005DF-F9; Sun, 23 Oct 2022 22:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ommyt-00082R-4W
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 22:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ommyq-0002XL-FF
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 22:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666577659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85Xrb79og776l0CdQ16cUT7LtaTQN5ZTLqFUYw7qawo=;
 b=K9bVg6EHtEBzelIvfxNTvjXdIJQ3FPwnru8E6dpLFruHv+xqTdMWeS+mU177lCQ8WPZL0d
 A/f7FAVs1lussocSjEDYsnkmorIDB6TOiKBLRQ5/6WibDyRfN8cKH74iMosMWTIhbzPha5
 KpNSMb3eCjbayvLvktq0HcUezPrcQNU=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-MwgOu3SnOj2Q79xOFrlyVQ-1; Sun, 23 Oct 2022 22:14:18 -0400
X-MC-Unique: MwgOu3SnOj2Q79xOFrlyVQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13b88262940so1439104fac.15
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 19:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=85Xrb79og776l0CdQ16cUT7LtaTQN5ZTLqFUYw7qawo=;
 b=yWi767bwRbrjR+eVvxxttzvade+zKl14qKu7Rc5oBjOJ+W+jaJEofuL7oUyfCiNhlY
 oAhku0JHXTK5iZLO5dOOrYsPXhSjrl50PSZIpNVN8HDfSy/kEfuXYyBs7SobQ9HRINvJ
 V+2vYW61hQhvjICSE8hL5W/CckN+nc2yj7PUtnZqrNgLxxyMJiwVTZkCG+O10c1qUE9e
 gzdRhBQzZYbA7SHYsp5by4d72j2iwQQ0mvpDPVimOyMP1tbRL7qV7BiGOtgD5wFdvGQd
 O2xcsp+1EIV5i9TKOr6bv+ep9amT0+WwdwoU+DaElvbCaBu3MOvTyucyWfw4QnIX/sMY
 Z5rA==
X-Gm-Message-State: ACrzQf3cbIbVKHM91KkgEDiiKw7ExLcaSv+SGZCEu5GJtEk1aRgccnPX
 2WpaBq2dvPCzpH5MCT/AzQ0WnjRvRi4abwiDwDJH/uj6FXmwobkR2cCmHgI69prIJ0TbXCQNvmt
 RbWE2VHj5uvohWch3REEL4m/MS4opzY4=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr8743616oal.35.1666577652582; 
 Sun, 23 Oct 2022 19:14:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Q0uCdYd8yyPsG0MSgeZXb2FmFdyDhEX2IBCryJrkBlqwvLdyvOmCBqF36Lc+44LbRCU6xZL90DFo09OJ/EeE=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr8743597oal.35.1666577652369; Sun, 23
 Oct 2022 19:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
 <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
 <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
 <CACGkMEs9mc5pqRr8XNhVw8pvQZ+hvnPRiMmyuzJvNsSU=Cfoxg@mail.gmail.com>
 <CAJaqyWfCn0gPc=+GY-0ASutwSP+1-AyFhp0XO4v6K+3JJZktuA@mail.gmail.com>
In-Reply-To: <CAJaqyWfCn0gPc=+GY-0ASutwSP+1-AyFhp0XO4v6K+3JJZktuA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 24 Oct 2022 10:14:00 +0800
Message-ID: <CACGkMEuwq_s6P9AxQD4Pmhb5R3naETeiQG+Nx0TJLbpdF6Xesg@mail.gmail.com>
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
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

On Fri, Oct 21, 2022 at 4:56 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Oct 21, 2022 at 4:57 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Oct 20, 2022 at 2:34 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Thu, Oct 20, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > At this moment only _F_LOG is added there.
> > > > >
> > > > > However future patches add features that depend on the kind of de=
vice.
> > > > > In particular, only net devices can add VIRTIO_F_GUEST_ANNOUNCE. =
So
> > > > > let's allow vhost_vdpa creator to set custom emulated device feat=
ures.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  include/hw/virtio/vhost-vdpa.h | 2 ++
> > > > >  hw/virtio/vhost-vdpa.c         | 8 ++++----
> > > > >  net/vhost-vdpa.c               | 4 ++++
> > > > >  3 files changed, 10 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/v=
host-vdpa.h
> > > > > index 1111d85643..50083e1e3b 100644
> > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
> > > > >      bool iotlb_batch_begin_sent;
> > > > >      MemoryListener listener;
> > > > >      struct vhost_vdpa_iova_range iova_range;
> > > > > +    /* VirtIO device features that can be emulated by qemu */
> > > > > +    uint64_t added_features;
> > > >
> > > > Any reason we need a per vhost_vdpa storage for this? Or is there a
> > > > chance that this field could be different among the devices?
> > > >
> > >
> > > Yes, one device could support SVQ and the other one could not support
> > > it because of different feature sets for example.
> >
> > Right, but for those devices that don't support SVQ, we don't even
> > need mediation for feature like F_LOG and _F_STATUS?
> >
>
> No, and we cannot offer it to the guest either.

Just to make sure we are on the same page, what I meant is, consider
in the future SVQ get the support of all features, so we can remove
this field? This is because _F_STATUS can be mediated unconditionally
anyhow.

Thanks

>
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > > >      uint64_t acked_features;
> > > > >      bool shadow_vqs_enabled;
> > > > >      /* IOVA mapping used by the Shadow Virtqueue */
> > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > index 7468e44b87..ddb5e29288 100644
> > > > > --- a/hw/virtio/vhost-vdpa.c
> > > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > > @@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct vho=
st_dev *dev,
> > > > >
> > > > >          v->acked_features =3D features;
> > > > >
> > > > > -        /* We must not ack _F_LOG if SVQ is enabled */
> > > > > -        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > > > > +        /* Do not ack features emulated by qemu */
> > > > > +        features &=3D ~v->added_features;
> > > > >      }
> > > > >
> > > > >      trace_vhost_vdpa_set_features(dev, features);
> > > > > @@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(struct v=
host_dev *dev,
> > > > >      int ret =3D vhost_vdpa_get_dev_features(dev, features);
> > > > >
> > > > >      if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > > > > -        /* Add SVQ logging capabilities */
> > > > > -        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > > > > +        /* Add emulated capabilities */
> > > > > +        *features |=3D v->added_features;
> > > > >      }
> > > > >
> > > > >      return ret;
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index eebf29f5c1..3803452800 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_init(N=
etClientState *peer,
> > > > >      s->vhost_vdpa.index =3D queue_pair_index;
> > > > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > > >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > > > > +    if (svq) {
> > > > > +        /* Add SVQ logging capabilities */
> > > > > +        s->vhost_vdpa.added_features |=3D BIT_ULL(VHOST_F_LOG_AL=
L);
> > > > > +    }
> > > > >      if (!is_datapath) {
> > > > >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_p=
age_size(),
> > > > >                                              vhost_vdpa_net_cvq_c=
md_page_len());
> > > > > --
> > > > > 2.31.1
> > > > >
> > > >
> > >
> >
>


