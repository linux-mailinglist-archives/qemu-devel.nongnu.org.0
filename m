Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B14610791
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 04:00:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooEeF-0004XD-3c; Thu, 27 Oct 2022 21:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEeE-0004X6-2x
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooEeC-0001wd-C3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666922339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEa6fJ5cyVWbwX01KN2X4eHuCtCTQG1vpIU92UUdy4Y=;
 b=c72cJw1r+NQlxIsOBspj3aGf+FHlXS4SI1UOEJWRv/sTicMLHEu2IHsmKLH7wplX5yQBqR
 wDLk5MiPFItaG02SiSN3APvfpDMI6jMjVZVnsCFahnVyTMpVDPalpSAz4pqZQ13l+ulQcV
 pZ+dape3ngHAdjU0RQQZfiqLN4U9Pxg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-bM9k-BROMauNwPwm-Mp6hA-1; Thu, 27 Oct 2022 21:58:58 -0400
X-MC-Unique: bM9k-BROMauNwPwm-Mp6hA-1
Received: by mail-oo1-f71.google.com with SMTP id
 a29-20020a4a9b1d000000b00480db71d44bso1592303ook.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 18:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEa6fJ5cyVWbwX01KN2X4eHuCtCTQG1vpIU92UUdy4Y=;
 b=a4GSDwYMYrT/pcRmQqGOI24gVvfFuu53Y153MB3et4hAqrB589DWCbo11erf8fa3Mh
 XIo0kjxt8QYZp37LsAvEQeTaRpnLxAubOkcF4q9/ZzxfgJGDqBfRnLET4jNsJvhiil7l
 xwG09qFVy+JyOQWmnVAEQBfr5gdEzR9YHxIBcR/f88f13d1ap9z5t3aijUV9LZ60u0zc
 H/S4fKfHubl+HX4fuMgAKAkoALTAFpAdlkZzEqW/AabCgkrdCqCuNBwrnHFGmGZMPtU+
 71Zj39UmZ+3dqOzMpJ6p6VHOrEVeKAF4EGM0oyfem7wWyJnEiywIGKhfM/0SHz6J7Jjl
 j9+g==
X-Gm-Message-State: ACrzQf2XIA4ed3My+xFuMnSZ8La40UqrcFDKAcg0JIzDXiqUhs+0dcCc
 CMoEhFvhmZctTo2zNPjLjKBo3t7wMmkTYY73njx1jhav3vLPccWmsr8uOFd18XGfBuML5/vO7E/
 wnP9nyIHRpvqO2Mx1ACZcvR86M6R/y9w=
X-Received: by 2002:aca:905:0:b0:359:cfa1:ebb1 with SMTP id
 5-20020aca0905000000b00359cfa1ebb1mr1150030oij.280.1666922332828; 
 Thu, 27 Oct 2022 18:58:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5W3dLyJvM2h4nfuSFVMlX6MWapbA3ycVMbYJtUab476myhVO8XJ7SPvbbrf10CJL8TkKDA6VW+NWhtyh8DjX0=
X-Received: by 2002:aca:905:0:b0:359:cfa1:ebb1 with SMTP id
 5-20020aca0905000000b00359cfa1ebb1mr1150012oij.280.1666922332582; Thu, 27 Oct
 2022 18:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
 <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
 <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
 <CACGkMEuv2zNLAr_BxPcQ3RCH5S91bm6sJFvhL7QetJNXaM_FmQ@mail.gmail.com>
 <CAJaqyWfyDWAe18MYzKmwjm8icCR7Ju4eHx1XRQCVb3M1p9uu+A@mail.gmail.com>
In-Reply-To: <CAJaqyWfyDWAe18MYzKmwjm8icCR7Ju4eHx1XRQCVb3M1p9uu+A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Oct 2022 09:58:41 +0800
Message-ID: <CACGkMEsEm6cLuQ9uB+wsbyyjExzYP6ua=cS74p12JdBoqModQg@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Oct 27, 2022 at 6:18 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Oct 27, 2022 at 8:54 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Oct 27, 2022 at 2:47 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > >
> > > > =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > > Now that qemu can handle and emulate it if the vdpa backend does =
not
> > > > > support it we can offer it always.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >
> > > >
> > > > I may miss something but isn't more easier to simply remove the
> > > > _F_STATUS from vdpa_feature_bits[]?
> > > >
> > >
> > > How is that? if we remove it, the guest cannot ack it so it cannot
> > > access the net status, isn't it?
> >
> > My understanding is that the bits stored in the vdpa_feature_bits[]
> > are the features that must be explicitly supported by the vhost
> > device.
>
> (Non English native here, so maybe I don't get what you mean :) ) The
> device may not support them. net simulator lacks some of them
> actually, and it works.

Speaking too fast, I think I meant that, if the bit doesn't belong to
vdpa_feature_bits[], it is assumed to be supported by the Qemu without
the support of the vhost. So Qemu won't even try to validate if vhost
has this support. E.g for vhost-net, we only have:

static const int kernel_feature_bits[] =3D {
    VIRTIO_F_NOTIFY_ON_EMPTY,
    VIRTIO_RING_F_INDIRECT_DESC,
    VIRTIO_RING_F_EVENT_IDX,
    VIRTIO_NET_F_MRG_RXBUF,
    VIRTIO_F_VERSION_1,
    VIRTIO_NET_F_MTU,
    VIRTIO_F_IOMMU_PLATFORM,
    VIRTIO_F_RING_PACKED,
    VIRTIO_NET_F_HASH_REPORT,
    VHOST_INVALID_FEATURE_BIT
};

You can see there's no STATUS bit there since it is emulated by Qemu.

>
> From what I see these are the only features that will be forwarded to
> the guest as device_features. If it is not in the list, the feature
> will be masked out,

Only when there's no support for this feature from the vhost.

> as if the device does not support it.
>
> So now _F_STATUS it was forwarded only if the device supports it. If
> we remove it from bit_mask, it will never be offered to the guest. But
> we want to offer it always, since we will need it for
> _F_GUEST_ANNOUNCE.
>
> Things get more complex because we actually need to ack it back if the
> device offers it, so the vdpa device can report link_down. We will
> only emulate LINK_UP always in the case the device does not support
> _F_STATUS.
>
> > So if we remove _F_STATUS, Qemu vhost code won't validate if
> > vhost-vdpa device has this support:
> >
> > uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_=
bits,
> >                             uint64_t features)
> > {
> >     const int *bit =3D feature_bits;
> >     while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
> >         uint64_t bit_mask =3D (1ULL << *bit);
> >         if (!(hdev->features & bit_mask)) {
> >             features &=3D ~bit_mask;
> >         }
> >         bit++;
> >     }
> >     return features;
> > }
> >
>
> Now maybe I'm the one missing something, but why is this not done as a
> masking directly?

Not sure, the code has been there since day 0.

But you can see from the code:

1) if STATUS is in feature_bits, we need validate the hdev->features
and mask it if the vhost doesn't have the support
2) if STATUS is not, we don't do the check and driver may still see STATUS

Thanks

>
> Instead of making feature_bits an array of ints, to declare it as a
> uint64_t with the valid feature bits and simply return features &
> feature_bits.
>
> Thanks!
>
> > Thanks
> >
> >
> >
> > >
> > > The goal with this patch series is to let the guest access the status
> > > always, even if the device doesn't support _F_STATUS.
> > >
> > > > Thanks
> > > >
> > > >
> > > > > ---
> > > > >   include/net/vhost-vdpa.h |  1 +
> > > > >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> > > > >   net/vhost-vdpa.c         |  3 +++
> > > > >   3 files changed, 18 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> > > > > index b81f9a6f2a..cfbcce6427 100644
> > > > > --- a/include/net/vhost-vdpa.h
> > > > > +++ b/include/net/vhost-vdpa.h
> > > > > @@ -17,5 +17,6 @@
> > > > >   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
> > > > >
> > > > >   extern const int vdpa_feature_bits[];
> > > > > +extern const uint64_t vhost_vdpa_net_added_feature_bits;
> > > > >
> > > > >   #endif /* VHOST_VDPA_H */
> > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > > index d28f8b974b..7c15cc6e8f 100644
> > > > > --- a/hw/net/vhost_net.c
> > > > > +++ b/hw/net/vhost_net.c
> > > > > @@ -109,10 +109,22 @@ static const int *vhost_net_get_feature_bit=
s(struct vhost_net *net)
> > > > >       return feature_bits;
> > > > >   }
> > > > >
> > > > > +static uint64_t vhost_net_add_feature_bits(struct vhost_net *net=
)
> > > > > +{
> > > > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA)=
 {
> > > > > +        return vhost_vdpa_net_added_feature_bits;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > >   uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t=
 features)
> > > > >   {
> > > > > -    return vhost_get_features(&net->dev, vhost_net_get_feature_b=
its(net),
> > > > > -            features);
> > > > > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > > > > +                                      vhost_net_get_feature_bits=
(net),
> > > > > +                                      features);
> > > > > +
> > > > > +    return ret | vhost_net_add_feature_bits(net);
> > > > >   }
> > > > >   int vhost_net_get_config(struct vhost_net *net,  uint8_t *confi=
g,
> > > > >                            uint32_t config_len)
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 6d64000202..24d2857593 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_features =
=3D
> > > > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > > >
> > > > > +const uint64_t vhost_vdpa_net_added_feature_bits =3D
> > > > > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > > > > +
> > > > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > > >   {
> > > > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > >
> > >
> >
>


