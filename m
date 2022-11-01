Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27AE614581
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 09:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opmLa-0000GI-1H; Tue, 01 Nov 2022 04:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1opmLX-0000Fh-F0
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 04:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1opmLV-0007sR-EZ
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 04:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667290204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlYAoK+yRUXW0NdFBwE/3Q2TA0kDETY8fJLKNyg7ge0=;
 b=XmTkcAYuqdZNCFYBCT4Nfw85Sa4ZDFJSvYSSayLCUQuP3J2YK4vh67PcljU9UqjDBittRq
 jOqIpt7mVFEwJf9m+gN6uLlGQ70/Be/7R6cWv9fYuZi4Bl6Bd8KrvNGq5GG+Z+TdCDZXPc
 cDcaDekJEzgCOmuDwExMcdoprALD7e4=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-ngDcHyvVMlapwpHqkDBEVg-1; Tue, 01 Nov 2022 04:09:52 -0400
X-MC-Unique: ngDcHyvVMlapwpHqkDBEVg-1
Received: by mail-oo1-f72.google.com with SMTP id
 c13-20020a4a380d000000b00494059ad6f0so5089958ooa.9
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 01:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BlYAoK+yRUXW0NdFBwE/3Q2TA0kDETY8fJLKNyg7ge0=;
 b=0PKhbGHnJ2Gf8XPcLBadayjbVe12mWuwHr41s7kD7nN+vPu6gzBtIJfmtObYjf3lLj
 BeuPsQXUKg1YcbVSHdRT6/6NF0U5tGGw+sub/UhSL717r//sa0gAx99QemBE5H74aMEH
 qY5dUckMftKrRW2MOQ9jfvXlx+hJGVMUG5hbmAtHL5S6FUIP1fBDRgtthRNKsvjtwQ4X
 Ugf3Q419OMuQLF504leyZ8rM7UKctT3DH/r2iz6Izlcz1rLIEkKlO9FMX5a71b1Uz2ey
 BkTA6Ej6bUM/tJ+D1rhbyw2Z+LlWv/KHfkzOahwPy1Ot65m/mkuYpfd2Zev1fTUCjVaj
 joSA==
X-Gm-Message-State: ACrzQf0pC4lBB6deqY9mnXbkI6sncYf47eIA+EogacPyLQYi3jvwd+Ku
 GatGZ2iRYXScbeUODf//SVcM06e+iqXwABkjNHNk5OAMWNbUNIwLME1BszKt9gQ7QYcWnmD92H7
 W5CxqLyT0ieBDyQDoqBj4DnMQqT8rM14=
X-Received: by 2002:a05:6870:9595:b0:132:7b3:29ac with SMTP id
 k21-20020a056870959500b0013207b329acmr60390oao.35.1667290189059; 
 Tue, 01 Nov 2022 01:09:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SS+b2+GpIfR/IDkeX0AFrkHuvQDLi1jddZGTZetuHAG//x0wYQPP40Zz3/EerKwXSfOkVOJZwNHczuHvCEQM=
X-Received: by 2002:a05:6870:9595:b0:132:7b3:29ac with SMTP id
 k21-20020a056870959500b0013207b329acmr60378oao.35.1667290188782; Tue, 01 Nov
 2022 01:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
 <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
 <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
 <CACGkMEuv2zNLAr_BxPcQ3RCH5S91bm6sJFvhL7QetJNXaM_FmQ@mail.gmail.com>
 <CAJaqyWfyDWAe18MYzKmwjm8icCR7Ju4eHx1XRQCVb3M1p9uu+A@mail.gmail.com>
 <CACGkMEsEm6cLuQ9uB+wsbyyjExzYP6ua=cS74p12JdBoqModQg@mail.gmail.com>
 <CAJaqyWeD3KnGeVnmWVFdhf1zX8_62zp9VvM1x=YsAmvPFqX8Sw@mail.gmail.com>
In-Reply-To: <CAJaqyWeD3KnGeVnmWVFdhf1zX8_62zp9VvM1x=YsAmvPFqX8Sw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Nov 2022 16:09:37 +0800
Message-ID: <CACGkMEv4vm5=-zsBjcLePg0=DAXoDXWMNpv2Z-p-Fz2=M_5Bpg@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 5:30 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Oct 28, 2022 at 3:59 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Oct 27, 2022 at 6:18 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Thu, Oct 27, 2022 at 8:54 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Thu, Oct 27, 2022 at 2:47 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > > > > >
> > > > > >
> > > > > > =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=
=93:
> > > > > > > Now that qemu can handle and emulate it if the vdpa backend d=
oes not
> > > > > > > support it we can offer it always.
> > > > > > >
> > > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > >
> > > > > >
> > > > > > I may miss something but isn't more easier to simply remove the
> > > > > > _F_STATUS from vdpa_feature_bits[]?
> > > > > >
> > > > >
> > > > > How is that? if we remove it, the guest cannot ack it so it canno=
t
> > > > > access the net status, isn't it?
> > > >
> > > > My understanding is that the bits stored in the vdpa_feature_bits[]
> > > > are the features that must be explicitly supported by the vhost
> > > > device.
> > >
> > > (Non English native here, so maybe I don't get what you mean :) ) The
> > > device may not support them. net simulator lacks some of them
> > > actually, and it works.
> >
> > Speaking too fast, I think I meant that, if the bit doesn't belong to
> > vdpa_feature_bits[], it is assumed to be supported by the Qemu without
> > the support of the vhost. So Qemu won't even try to validate if vhost
> > has this support. E.g for vhost-net, we only have:
> >
> > static const int kernel_feature_bits[] =3D {
> >     VIRTIO_F_NOTIFY_ON_EMPTY,
> >     VIRTIO_RING_F_INDIRECT_DESC,
> >     VIRTIO_RING_F_EVENT_IDX,
> >     VIRTIO_NET_F_MRG_RXBUF,
> >     VIRTIO_F_VERSION_1,
> >     VIRTIO_NET_F_MTU,
> >     VIRTIO_F_IOMMU_PLATFORM,
> >     VIRTIO_F_RING_PACKED,
> >     VIRTIO_NET_F_HASH_REPORT,
> >     VHOST_INVALID_FEATURE_BIT
> > };
> >
> > You can see there's no STATUS bit there since it is emulated by Qemu.
> >
>
> Ok now I get what you mean, and yes we may modify the patches in that dir=
ection.
>
> But if we go then we need to modify how qemu ack the features, because
> the features that are not in vdpa_feature_bits are not acked to the
> device. More on this later.
>
> > >
> > > From what I see these are the only features that will be forwarded to
> > > the guest as device_features. If it is not in the list, the feature
> > > will be masked out,
> >
> > Only when there's no support for this feature from the vhost.
> >
> > > as if the device does not support it.
> > >
> > > So now _F_STATUS it was forwarded only if the device supports it. If
> > > we remove it from bit_mask, it will never be offered to the guest. Bu=
t
> > > we want to offer it always, since we will need it for
> > > _F_GUEST_ANNOUNCE.
> > >
> > > Things get more complex because we actually need to ack it back if th=
e
> > > device offers it, so the vdpa device can report link_down. We will
> > > only emulate LINK_UP always in the case the device does not support
> > > _F_STATUS.
> > >
> > > > So if we remove _F_STATUS, Qemu vhost code won't validate if
> > > > vhost-vdpa device has this support:
> > > >
> > > > uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feat=
ure_bits,
> > > >                             uint64_t features)
> > > > {
> > > >     const int *bit =3D feature_bits;
> > > >     while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
> > > >         uint64_t bit_mask =3D (1ULL << *bit);
> > > >         if (!(hdev->features & bit_mask)) {
> > > >             features &=3D ~bit_mask;
> > > >         }
> > > >         bit++;
> > > >     }
> > > >     return features;
> > > > }
> > > >
> > >
> > > Now maybe I'm the one missing something, but why is this not done as =
a
> > > masking directly?
> >
> > Not sure, the code has been there since day 0.
> >
> > But you can see from the code:
> >
> > 1) if STATUS is in feature_bits, we need validate the hdev->features
> > and mask it if the vhost doesn't have the support
> > 2) if STATUS is not, we don't do the check and driver may still see STA=
TUS
> >
>
> That's useful for _F_GUEST_ANNOUNCE, but we need to ack _F_STATUS for
> the device if it supports it.

Rethink about this, I don't see why ANNOUNCE depends on STATUS (spec
doesn't say so).

> QEMU cannot detect by itself when the
> link is not up. I think that setting unconditionally
> VIRTIO_NET_S_LINK_UP is actually a regression, since the guest cannot
> detect the link down that way.

I think the idea is to still read status from config if the device
supports this.

>
> To enable _F_STATUS unconditionally is only done in the case the
> device does not support it, because its emulation is very easy. That
> way we support _F_GUEST_ANNOUNCE in all cases without device's
> cooperation.
>
> Having said that, should we go the opposite route and ack _F_STATE as
> long as the device supports it? As an advantage, all backends should
> support that at this moment, isn't it?

So I think the method used in this patch is fine, but I wonder if it's
better to move it to the vhost layer instead of doing it in vhost_net
since we do the features validation there. We probably need another
table as input for get/set features there?

Thanks

>
> Thanks!
>
>
>
>
> > Thanks
> >
> > >
> > > Instead of making feature_bits an array of ints, to declare it as a
> > > uint64_t with the valid feature bits and simply return features &
> > > feature_bits.
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > >
> > > >
> > > > >
> > > > > The goal with this patch series is to let the guest access the st=
atus
> > > > > always, even if the device doesn't support _F_STATUS.
> > > > >
> > > > > > Thanks
> > > > > >
> > > > > >
> > > > > > > ---
> > > > > > >   include/net/vhost-vdpa.h |  1 +
> > > > > > >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> > > > > > >   net/vhost-vdpa.c         |  3 +++
> > > > > > >   3 files changed, 18 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdp=
a.h
> > > > > > > index b81f9a6f2a..cfbcce6427 100644
> > > > > > > --- a/include/net/vhost-vdpa.h
> > > > > > > +++ b/include/net/vhost-vdpa.h
> > > > > > > @@ -17,5 +17,6 @@
> > > > > > >   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *=
nc);
> > > > > > >
> > > > > > >   extern const int vdpa_feature_bits[];
> > > > > > > +extern const uint64_t vhost_vdpa_net_added_feature_bits;
> > > > > > >
> > > > > > >   #endif /* VHOST_VDPA_H */
> > > > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > > > > index d28f8b974b..7c15cc6e8f 100644
> > > > > > > --- a/hw/net/vhost_net.c
> > > > > > > +++ b/hw/net/vhost_net.c
> > > > > > > @@ -109,10 +109,22 @@ static const int *vhost_net_get_feature=
_bits(struct vhost_net *net)
> > > > > > >       return feature_bits;
> > > > > > >   }
> > > > > > >
> > > > > > > +static uint64_t vhost_net_add_feature_bits(struct vhost_net =
*net)
> > > > > > > +{
> > > > > > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_V=
DPA) {
> > > > > > > +        return vhost_vdpa_net_added_feature_bits;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >   uint64_t vhost_net_get_features(struct vhost_net *net, uint=
64_t features)
> > > > > > >   {
> > > > > > > -    return vhost_get_features(&net->dev, vhost_net_get_featu=
re_bits(net),
> > > > > > > -            features);
> > > > > > > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > > > > > > +                                      vhost_net_get_feature_=
bits(net),
> > > > > > > +                                      features);
> > > > > > > +
> > > > > > > +    return ret | vhost_net_add_feature_bits(net);
> > > > > > >   }
> > > > > > >   int vhost_net_get_config(struct vhost_net *net,  uint8_t *c=
onfig,
> > > > > > >                            uint32_t config_len)
> > > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > > index 6d64000202..24d2857593 100644
> > > > > > > --- a/net/vhost-vdpa.c
> > > > > > > +++ b/net/vhost-vdpa.c
> > > > > > > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_featu=
res =3D
> > > > > > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > > > > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > > > > >
> > > > > > > +const uint64_t vhost_vdpa_net_added_feature_bits =3D
> > > > > > > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > > > > > > +
> > > > > > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > > > > >   {
> > > > > > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc)=
;
> > > > > >
> > > > >
> > > >
> > >
> >
>


