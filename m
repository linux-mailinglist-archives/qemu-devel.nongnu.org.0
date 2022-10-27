Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE160F4BC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:19:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzyI-0003Ub-8B; Thu, 27 Oct 2022 06:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onzyF-000380-9F
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onzyC-0006d3-P9
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666865919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgDB/YSTz4eEMj1pIyGz67wnGjDyD7D3moR8yFhatAU=;
 b=Sm7osJ48vaCFxJb4K67dP5cMpZqjpxNGEBnHSInF8JrOYHC6t7nl15aEVE1pTfyS1rm+DV
 SDKicwEYziEXh5mCuNImb6fHZNKbv9CE40rP8rWQHjeznjHJmilXQdydSVn8hctvLLwHLQ
 dDSXua+Hm5RPcrb2vvpgHQl2NkSc2wc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-hhVPNl41PD-uBovugpoQyA-1; Thu, 27 Oct 2022 06:18:30 -0400
X-MC-Unique: hhVPNl41PD-uBovugpoQyA-1
Received: by mail-pl1-f199.google.com with SMTP id
 i17-20020a170902cf1100b00183e2a963f5so763030plg.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgDB/YSTz4eEMj1pIyGz67wnGjDyD7D3moR8yFhatAU=;
 b=d3vvV2smbe7PHOIdWiVgdvljUqNxOEb6SHg7GRRi6HyYxUQxJLcuUHSa14hbCSWGIN
 byHBY1QJAW6o7vye5u42vX2NpQ+EhmVCnGQF461iOQJWP4XbyZs5Wnaf1MXZW/+cKXtM
 +xzLgxbTNwcGF5eK27IaVdjv6A77fwI5ZkA7eyDvFT/EZy9fSpzf73kgCVSLlaLuyyV0
 nVzKnb13wgAnNPqTQdjgV83w842dJXmyL/RJrEs/keaNmx5oSdQufbz2pF7+4rY1WlLd
 K9IGmMyyRf/cdoIeY8nT3EcUfPytihxaSr5NKzXSoP2RuRQ9JfzZA7/Yw8lEaxrx3EZL
 vr7Q==
X-Gm-Message-State: ACrzQf1hWeIUOo1XN/L7ZUCZ3X7FuIywjZqIei8fyY8chl/X7H5TWFql
 va2RXEifExU7lf5ujpv+hCsmPeFqiB9S9ItQJ6tfjfjcpfdFcBOdbkA00qhtZMd7ou+G2usazqD
 SYc96PIIp19NIhsAJ3TII1uKSgXE3arA=
X-Received: by 2002:a17:903:1303:b0:186:969d:97cf with SMTP id
 iy3-20020a170903130300b00186969d97cfmr24545817plb.17.1666865908308; 
 Thu, 27 Oct 2022 03:18:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Az+IqX4TGwJDivXcBAl+ZthhQrkF6DsaQjzljNgeTAMrbq+kXVo8vdlDHubx56juYVkrhu6ijJGvKLenn98Y=
X-Received: by 2002:a17:903:1303:b0:186:969d:97cf with SMTP id
 iy3-20020a170903130300b00186969d97cfmr24545779plb.17.1666865908024; Thu, 27
 Oct 2022 03:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
 <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
 <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
 <CACGkMEuv2zNLAr_BxPcQ3RCH5S91bm6sJFvhL7QetJNXaM_FmQ@mail.gmail.com>
In-Reply-To: <CACGkMEuv2zNLAr_BxPcQ3RCH5S91bm6sJFvhL7QetJNXaM_FmQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Oct 2022 12:17:51 +0200
Message-ID: <CAJaqyWfyDWAe18MYzKmwjm8icCR7Ju4eHx1XRQCVb3M1p9uu+A@mail.gmail.com>
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

On Thu, Oct 27, 2022 at 8:54 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Oct 27, 2022 at 2:47 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > Now that qemu can handle and emulate it if the vdpa backend does no=
t
> > > > support it we can offer it always.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >
> > >
> > > I may miss something but isn't more easier to simply remove the
> > > _F_STATUS from vdpa_feature_bits[]?
> > >
> >
> > How is that? if we remove it, the guest cannot ack it so it cannot
> > access the net status, isn't it?
>
> My understanding is that the bits stored in the vdpa_feature_bits[]
> are the features that must be explicitly supported by the vhost
> device.

(Non English native here, so maybe I don't get what you mean :) ) The
device may not support them. net simulator lacks some of them
actually, and it works.

From what I see these are the only features that will be forwarded to
the guest as device_features. If it is not in the list, the feature
will be masked out, as if the device does not support it.

So now _F_STATUS it was forwarded only if the device supports it. If
we remove it from bit_mask, it will never be offered to the guest. But
we want to offer it always, since we will need it for
_F_GUEST_ANNOUNCE.

Things get more complex because we actually need to ack it back if the
device offers it, so the vdpa device can report link_down. We will
only emulate LINK_UP always in the case the device does not support
_F_STATUS.

> So if we remove _F_STATUS, Qemu vhost code won't validate if
> vhost-vdpa device has this support:
>
> uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bi=
ts,
>                             uint64_t features)
> {
>     const int *bit =3D feature_bits;
>     while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
>         uint64_t bit_mask =3D (1ULL << *bit);
>         if (!(hdev->features & bit_mask)) {
>             features &=3D ~bit_mask;
>         }
>         bit++;
>     }
>     return features;
> }
>

Now maybe I'm the one missing something, but why is this not done as a
masking directly?

Instead of making feature_bits an array of ints, to declare it as a
uint64_t with the valid feature bits and simply return features &
feature_bits.

Thanks!

> Thanks
>
>
>
> >
> > The goal with this patch series is to let the guest access the status
> > always, even if the device doesn't support _F_STATUS.
> >
> > > Thanks
> > >
> > >
> > > > ---
> > > >   include/net/vhost-vdpa.h |  1 +
> > > >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> > > >   net/vhost-vdpa.c         |  3 +++
> > > >   3 files changed, 18 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> > > > index b81f9a6f2a..cfbcce6427 100644
> > > > --- a/include/net/vhost-vdpa.h
> > > > +++ b/include/net/vhost-vdpa.h
> > > > @@ -17,5 +17,6 @@
> > > >   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
> > > >
> > > >   extern const int vdpa_feature_bits[];
> > > > +extern const uint64_t vhost_vdpa_net_added_feature_bits;
> > > >
> > > >   #endif /* VHOST_VDPA_H */
> > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > index d28f8b974b..7c15cc6e8f 100644
> > > > --- a/hw/net/vhost_net.c
> > > > +++ b/hw/net/vhost_net.c
> > > > @@ -109,10 +109,22 @@ static const int *vhost_net_get_feature_bits(=
struct vhost_net *net)
> > > >       return feature_bits;
> > > >   }
> > > >
> > > > +static uint64_t vhost_net_add_feature_bits(struct vhost_net *net)
> > > > +{
> > > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA) {
> > > > +        return vhost_vdpa_net_added_feature_bits;
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > >   uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t f=
eatures)
> > > >   {
> > > > -    return vhost_get_features(&net->dev, vhost_net_get_feature_bit=
s(net),
> > > > -            features);
> > > > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > > > +                                      vhost_net_get_feature_bits(n=
et),
> > > > +                                      features);
> > > > +
> > > > +    return ret | vhost_net_add_feature_bits(net);
> > > >   }
> > > >   int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
> > > >                            uint32_t config_len)
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 6d64000202..24d2857593 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_features =
=3D
> > > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > >
> > > > +const uint64_t vhost_vdpa_net_added_feature_bits =3D
> > > > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > > > +
> > > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > >   {
> > > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > >
> >
>


