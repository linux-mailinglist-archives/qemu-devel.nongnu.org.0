Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17173609E5A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 11:56:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omtiz-00043Y-8w; Mon, 24 Oct 2022 05:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1omtix-00043C-1Z
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 05:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1omtiu-0005V6-SO
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 05:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666603579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEu3hD3gXhclm8xSr45jeYMG53LUvrPP7+MltOGk3n8=;
 b=Y2Qg6m0lzSDsOzVXnrUrmgfzqliEWg3DWVKQLRRFBzhPRyFhGuPbhHJMdiVbopqrexXVeM
 7yBMYjvEO2weoSeFg1j5ZrZLqoCpClnw7KAYIlbEYE6e+l9Lh5EqIGjUmJf5y5cS6ogNKt
 USrrCylGbV54UnunEHLyN3DOI3ajxTk=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-adflYwCONtqmY1RIamwCRw-1; Mon, 24 Oct 2022 05:26:17 -0400
X-MC-Unique: adflYwCONtqmY1RIamwCRw-1
Received: by mail-pg1-f199.google.com with SMTP id
 j191-20020a638bc8000000b0046eacc32423so4487752pge.23
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 02:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nEu3hD3gXhclm8xSr45jeYMG53LUvrPP7+MltOGk3n8=;
 b=nwrS5U9iGgU8obq/16RTcUUuQrHYHOBcxlrfr6mOk0vPugLKHhiWCX3KCp3DWUDQc+
 R9ZFtnqEvCiJt7Eu5QzU/3IX22bZ3vbUbPgRBCDajXpfdsi5e/JdeTtqG9erTJWAIFcz
 JQeN5GtRxdAgVt8YTy0BKckDbBp6/hpGOLEMlKA6PHHejU+Biipoy5QR86v76sCad+dn
 VsSrSDuuRljz+hhKz4Vlql1zeXpHwCf1H6HKymwH4zBlTtxq0tQJZTDPwC8vgYTYpUFX
 Ml+jiHUQI0lawKb2oiqFO3d1/jXtLpNbXCPmyYvoNNSzMfHVB7KBgyF4b4cWrZzdwDGz
 Ycxw==
X-Gm-Message-State: ACrzQf0Ia0tsn9wbqoBRAMWtsXHvqoWRdveoGCrUhKqKj3znLW5UR2ho
 8mWdFPVFHDQSsgiw2+iN3i5IpnIAhlYHG8l1FZHhrupGGDxxpQuq8q/2bYC1+9fiNkPsaRCyko3
 HjaHSTESDWebpqRzcAmWXriVHjnRKl6s=
X-Received: by 2002:a17:903:1303:b0:186:969d:97cf with SMTP id
 iy3-20020a170903130300b00186969d97cfmr8717389plb.17.1666603575500; 
 Mon, 24 Oct 2022 02:26:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM733y1oUxajS+mtTF7Kh5YyQjeTrEOaC6SL4IU+edorXYoj6J1d/mzH9jKbdMA4JCAxvS1oG/xd28NaXpzp1VU=
X-Received: by 2002:a17:903:1303:b0:186:969d:97cf with SMTP id
 iy3-20020a170903130300b00186969d97cfmr8717360plb.17.1666603575170; Mon, 24
 Oct 2022 02:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
 <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
 <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
 <CACGkMEs9mc5pqRr8XNhVw8pvQZ+hvnPRiMmyuzJvNsSU=Cfoxg@mail.gmail.com>
 <CAJaqyWfCn0gPc=+GY-0ASutwSP+1-AyFhp0XO4v6K+3JJZktuA@mail.gmail.com>
 <CACGkMEuwq_s6P9AxQD4Pmhb5R3naETeiQG+Nx0TJLbpdF6Xesg@mail.gmail.com>
In-Reply-To: <CACGkMEuwq_s6P9AxQD4Pmhb5R3naETeiQG+Nx0TJLbpdF6Xesg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 24 Oct 2022 11:25:38 +0200
Message-ID: <CAJaqyWfo4WJo_LJpBtLirHtNCUO23NZQETv7k_jWo0LjQ1tVLw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] vdpa: Save emulated features list in vhost_vdpa
To: Jason Wang <jasowang@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Mon, Oct 24, 2022 at 4:14 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Oct 21, 2022 at 4:56 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Oct 21, 2022 at 4:57 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Thu, Oct 20, 2022 at 2:34 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Thu, Oct 20, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redh=
at.com> wrote:
> > > > > >
> > > > > > At this moment only _F_LOG is added there.
> > > > > >
> > > > > > However future patches add features that depend on the kind of =
device.
> > > > > > In particular, only net devices can add VIRTIO_F_GUEST_ANNOUNCE=
. So
> > > > > > let's allow vhost_vdpa creator to set custom emulated device fe=
atures.
> > > > > >
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > ---
> > > > > >  include/hw/virtio/vhost-vdpa.h | 2 ++
> > > > > >  hw/virtio/vhost-vdpa.c         | 8 ++++----
> > > > > >  net/vhost-vdpa.c               | 4 ++++
> > > > > >  3 files changed, 10 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio=
/vhost-vdpa.h
> > > > > > index 1111d85643..50083e1e3b 100644
> > > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > > @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
> > > > > >      bool iotlb_batch_begin_sent;
> > > > > >      MemoryListener listener;
> > > > > >      struct vhost_vdpa_iova_range iova_range;
> > > > > > +    /* VirtIO device features that can be emulated by qemu */
> > > > > > +    uint64_t added_features;
> > > > >
> > > > > Any reason we need a per vhost_vdpa storage for this? Or is there=
 a
> > > > > chance that this field could be different among the devices?
> > > > >
> > > >
> > > > Yes, one device could support SVQ and the other one could not suppo=
rt
> > > > it because of different feature sets for example.
> > >
> > > Right, but for those devices that don't support SVQ, we don't even
> > > need mediation for feature like F_LOG and _F_STATUS?
> > >
> >
> > No, and we cannot offer it to the guest either.
>
> Just to make sure we are on the same page, what I meant is, consider
> in the future SVQ get the support of all features, so we can remove
> this field? This is because _F_STATUS can be mediated unconditionally
> anyhow.
>

For _F_STATUS that is right. But we cannot handle full
_F_GUEST_ANNOUNCE since control SVQ (will) needs features from the
device that cannot be emulated, like ASID.

I think your point is "Since qemu cannot migrate these devices it will
never set VIRTIO_NET_S_ANNOUNCE, so the guest will never send
VIRTIO_NET_CTRL_ANNOUNCE messages". And I think that is totally right,
but I still feel it is weird to expose it if we cannot handle it.

Maybe a good first step is to move added_features to vhost_net, or
maybe to convert it to "bool guest_announce_emulated" or something
similar?  This way hw/virtio/vhost-vdpa is totally unaware of this and
changes are more self contained.

Thanks!



> Thanks
>
> >
> > > Thanks
> > >
> > > >
> > > > Thanks!
> > > >
> > > > > Thanks
> > > > >
> > > > > >      uint64_t acked_features;
> > > > > >      bool shadow_vqs_enabled;
> > > > > >      /* IOVA mapping used by the Shadow Virtqueue */
> > > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > > index 7468e44b87..ddb5e29288 100644
> > > > > > --- a/hw/virtio/vhost-vdpa.c
> > > > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > > > @@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct v=
host_dev *dev,
> > > > > >
> > > > > >          v->acked_features =3D features;
> > > > > >
> > > > > > -        /* We must not ack _F_LOG if SVQ is enabled */
> > > > > > -        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > > > > > +        /* Do not ack features emulated by qemu */
> > > > > > +        features &=3D ~v->added_features;
> > > > > >      }
> > > > > >
> > > > > >      trace_vhost_vdpa_set_features(dev, features);
> > > > > > @@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(struct=
 vhost_dev *dev,
> > > > > >      int ret =3D vhost_vdpa_get_dev_features(dev, features);
> > > > > >
> > > > > >      if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > > > > > -        /* Add SVQ logging capabilities */
> > > > > > -        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > > > > > +        /* Add emulated capabilities */
> > > > > > +        *features |=3D v->added_features;
> > > > > >      }
> > > > > >
> > > > > >      return ret;
> > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > index eebf29f5c1..3803452800 100644
> > > > > > --- a/net/vhost-vdpa.c
> > > > > > +++ b/net/vhost-vdpa.c
> > > > > > @@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_init=
(NetClientState *peer,
> > > > > >      s->vhost_vdpa.index =3D queue_pair_index;
> > > > > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > > > >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > > > > > +    if (svq) {
> > > > > > +        /* Add SVQ logging capabilities */
> > > > > > +        s->vhost_vdpa.added_features |=3D BIT_ULL(VHOST_F_LOG_=
ALL);
> > > > > > +    }
> > > > > >      if (!is_datapath) {
> > > > > >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host=
_page_size(),
> > > > > >                                              vhost_vdpa_net_cvq=
_cmd_page_len());
> > > > > > --
> > > > > > 2.31.1
> > > > > >
> > > > >
> > > >
> > >
> >
>


