Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE5610D42
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:31:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLh8-0005dd-16; Fri, 28 Oct 2022 05:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooLh0-0005av-4P
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ooLgu-0000EA-8h
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666949415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfQEUHP4L7tXvYpFlpqNoq6URfWry7TUGOTJsXeEmFo=;
 b=CiG03H/nkXh4FBlISGFoDA4z4hOI+DzYKmcO/A5PJYBjJbpO/aCA+wtHeU8+fucLZcEz3t
 PK1RqykUokftfMUfk/OThWN0OwuBfHxOjE7GMmg50l5nw94YCN0qHpcSt1+hSkLi82xCa4
 zpRoK4yc/jemkwRD1WYRj1VmybiiFjQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-cw27qRQ0OPmPkK5b_XPGqA-1; Fri, 28 Oct 2022 05:30:13 -0400
X-MC-Unique: cw27qRQ0OPmPkK5b_XPGqA-1
Received: by mail-pj1-f71.google.com with SMTP id
 px13-20020a17090b270d00b0020aa188aae8so2138267pjb.8
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nfQEUHP4L7tXvYpFlpqNoq6URfWry7TUGOTJsXeEmFo=;
 b=Hq4A2huzRk3F2llac5QVBpuvHBKF3HdEc+hmpaAh28V+7Oui05eYrNOdiAFHLTjBUX
 OfX5XOkERI/hMXpP9z17UOD/Tgtn400nWUy5pQDrHSZ0y2sZX0xNvhmyzZJBW0lrvrbz
 m2dTTQvHHfqoqifkYoXw4bkH6rffXCnRj0SCkp/uBKkpyDhaAKmAZ2WYzQqkTU6jBDZm
 l4eo101GEawbbodsJaB8K6RJp3UyXkFauKmRjt1u5+w4D4etIctB7XM6ooc6kN2FjYid
 Wyk/+k3hNRs2sJGfMICKNPIAS5i1jS0VXbYEiSTaB4L9xhzZ+e1kcSkAe/cMdxY98iSW
 lrzQ==
X-Gm-Message-State: ACrzQf3DDQhjvpwtW1CF3w/7BaBDNYdbnxGrs2P0qx/Nr6NJ/76RUdMq
 WQB2rE+4w1y1gf3+kEgIedIagn1CzZJLSGV6zDALUcrnsF8Su6axuYL26UhNMjRqon0GlNXXglU
 vEUpBdweVDeHpHgBWSW/FWsFBAbPFdY8=
X-Received: by 2002:a62:e80d:0:b0:56c:b8f6:7ecd with SMTP id
 c13-20020a62e80d000000b0056cb8f67ecdmr4895876pfi.68.1666949412309; 
 Fri, 28 Oct 2022 02:30:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wlIao1xkwB0kkP2ISQpHy522a/WuELRj77F/QmhuG1HeEbX1Hvd+U8vsNnm+rcxlifaWp9usHvYEVgG7BOgw=
X-Received: by 2002:a62:e80d:0:b0:56c:b8f6:7ecd with SMTP id
 c13-20020a62e80d000000b0056cb8f67ecdmr4895838pfi.68.1666949411988; Fri, 28
 Oct 2022 02:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
 <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
 <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
 <CACGkMEuv2zNLAr_BxPcQ3RCH5S91bm6sJFvhL7QetJNXaM_FmQ@mail.gmail.com>
 <CAJaqyWfyDWAe18MYzKmwjm8icCR7Ju4eHx1XRQCVb3M1p9uu+A@mail.gmail.com>
 <CACGkMEsEm6cLuQ9uB+wsbyyjExzYP6ua=cS74p12JdBoqModQg@mail.gmail.com>
In-Reply-To: <CACGkMEsEm6cLuQ9uB+wsbyyjExzYP6ua=cS74p12JdBoqModQg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 28 Oct 2022 11:29:35 +0200
Message-ID: <CAJaqyWeD3KnGeVnmWVFdhf1zX8_62zp9VvM1x=YsAmvPFqX8Sw@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Fri, Oct 28, 2022 at 3:59 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Oct 27, 2022 at 6:18 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Oct 27, 2022 at 8:54 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Thu, Oct 27, 2022 at 2:47 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93=
:
> > > > > > Now that qemu can handle and emulate it if the vdpa backend doe=
s not
> > > > > > support it we can offer it always.
> > > > > >
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > >
> > > > >
> > > > > I may miss something but isn't more easier to simply remove the
> > > > > _F_STATUS from vdpa_feature_bits[]?
> > > > >
> > > >
> > > > How is that? if we remove it, the guest cannot ack it so it cannot
> > > > access the net status, isn't it?
> > >
> > > My understanding is that the bits stored in the vdpa_feature_bits[]
> > > are the features that must be explicitly supported by the vhost
> > > device.
> >
> > (Non English native here, so maybe I don't get what you mean :) ) The
> > device may not support them. net simulator lacks some of them
> > actually, and it works.
>
> Speaking too fast, I think I meant that, if the bit doesn't belong to
> vdpa_feature_bits[], it is assumed to be supported by the Qemu without
> the support of the vhost. So Qemu won't even try to validate if vhost
> has this support. E.g for vhost-net, we only have:
>
> static const int kernel_feature_bits[] =3D {
>     VIRTIO_F_NOTIFY_ON_EMPTY,
>     VIRTIO_RING_F_INDIRECT_DESC,
>     VIRTIO_RING_F_EVENT_IDX,
>     VIRTIO_NET_F_MRG_RXBUF,
>     VIRTIO_F_VERSION_1,
>     VIRTIO_NET_F_MTU,
>     VIRTIO_F_IOMMU_PLATFORM,
>     VIRTIO_F_RING_PACKED,
>     VIRTIO_NET_F_HASH_REPORT,
>     VHOST_INVALID_FEATURE_BIT
> };
>
> You can see there's no STATUS bit there since it is emulated by Qemu.
>

Ok now I get what you mean, and yes we may modify the patches in that direc=
tion.

But if we go then we need to modify how qemu ack the features, because
the features that are not in vdpa_feature_bits are not acked to the
device. More on this later.

> >
> > From what I see these are the only features that will be forwarded to
> > the guest as device_features. If it is not in the list, the feature
> > will be masked out,
>
> Only when there's no support for this feature from the vhost.
>
> > as if the device does not support it.
> >
> > So now _F_STATUS it was forwarded only if the device supports it. If
> > we remove it from bit_mask, it will never be offered to the guest. But
> > we want to offer it always, since we will need it for
> > _F_GUEST_ANNOUNCE.
> >
> > Things get more complex because we actually need to ack it back if the
> > device offers it, so the vdpa device can report link_down. We will
> > only emulate LINK_UP always in the case the device does not support
> > _F_STATUS.
> >
> > > So if we remove _F_STATUS, Qemu vhost code won't validate if
> > > vhost-vdpa device has this support:
> > >
> > > uint64_t vhost_get_features(struct vhost_dev *hdev, const int *featur=
e_bits,
> > >                             uint64_t features)
> > > {
> > >     const int *bit =3D feature_bits;
> > >     while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
> > >         uint64_t bit_mask =3D (1ULL << *bit);
> > >         if (!(hdev->features & bit_mask)) {
> > >             features &=3D ~bit_mask;
> > >         }
> > >         bit++;
> > >     }
> > >     return features;
> > > }
> > >
> >
> > Now maybe I'm the one missing something, but why is this not done as a
> > masking directly?
>
> Not sure, the code has been there since day 0.
>
> But you can see from the code:
>
> 1) if STATUS is in feature_bits, we need validate the hdev->features
> and mask it if the vhost doesn't have the support
> 2) if STATUS is not, we don't do the check and driver may still see STATU=
S
>

That's useful for _F_GUEST_ANNOUNCE, but we need to ack _F_STATUS for
the device if it supports it. QEMU cannot detect by itself when the
link is not up. I think that setting unconditionally
VIRTIO_NET_S_LINK_UP is actually a regression, since the guest cannot
detect the link down that way.

To enable _F_STATUS unconditionally is only done in the case the
device does not support it, because its emulation is very easy. That
way we support _F_GUEST_ANNOUNCE in all cases without device's
cooperation.

Having said that, should we go the opposite route and ack _F_STATE as
long as the device supports it? As an advantage, all backends should
support that at this moment, isn't it?

Thanks!




> Thanks
>
> >
> > Instead of making feature_bits an array of ints, to declare it as a
> > uint64_t with the valid feature bits and simply return features &
> > feature_bits.
> >
> > Thanks!
> >
> > > Thanks
> > >
> > >
> > >
> > > >
> > > > The goal with this patch series is to let the guest access the stat=
us
> > > > always, even if the device doesn't support _F_STATUS.
> > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > > > ---
> > > > > >   include/net/vhost-vdpa.h |  1 +
> > > > > >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> > > > > >   net/vhost-vdpa.c         |  3 +++
> > > > > >   3 files changed, 18 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.=
h
> > > > > > index b81f9a6f2a..cfbcce6427 100644
> > > > > > --- a/include/net/vhost-vdpa.h
> > > > > > +++ b/include/net/vhost-vdpa.h
> > > > > > @@ -17,5 +17,6 @@
> > > > > >   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc=
);
> > > > > >
> > > > > >   extern const int vdpa_feature_bits[];
> > > > > > +extern const uint64_t vhost_vdpa_net_added_feature_bits;
> > > > > >
> > > > > >   #endif /* VHOST_VDPA_H */
> > > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > > > index d28f8b974b..7c15cc6e8f 100644
> > > > > > --- a/hw/net/vhost_net.c
> > > > > > +++ b/hw/net/vhost_net.c
> > > > > > @@ -109,10 +109,22 @@ static const int *vhost_net_get_feature_b=
its(struct vhost_net *net)
> > > > > >       return feature_bits;
> > > > > >   }
> > > > > >
> > > > > > +static uint64_t vhost_net_add_feature_bits(struct vhost_net *n=
et)
> > > > > > +{
> > > > > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDP=
A) {
> > > > > > +        return vhost_vdpa_net_added_feature_bits;
> > > > > > +    }
> > > > > > +
> > > > > > +    return 0;
> > > > > > +}
> > > > > > +
> > > > > >   uint64_t vhost_net_get_features(struct vhost_net *net, uint64=
_t features)
> > > > > >   {
> > > > > > -    return vhost_get_features(&net->dev, vhost_net_get_feature=
_bits(net),
> > > > > > -            features);
> > > > > > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > > > > > +                                      vhost_net_get_feature_bi=
ts(net),
> > > > > > +                                      features);
> > > > > > +
> > > > > > +    return ret | vhost_net_add_feature_bits(net);
> > > > > >   }
> > > > > >   int vhost_net_get_config(struct vhost_net *net,  uint8_t *con=
fig,
> > > > > >                            uint32_t config_len)
> > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > index 6d64000202..24d2857593 100644
> > > > > > --- a/net/vhost-vdpa.c
> > > > > > +++ b/net/vhost-vdpa.c
> > > > > > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_feature=
s =3D
> > > > > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > > > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > > > >
> > > > > > +const uint64_t vhost_vdpa_net_added_feature_bits =3D
> > > > > > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > > > > > +
> > > > > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > > > >   {
> > > > > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > >
> > > >
> > >
> >
>


