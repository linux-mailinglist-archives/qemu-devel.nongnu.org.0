Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A006174E2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 04:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqQnk-000375-M3; Wed, 02 Nov 2022 23:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oqQnj-00036V-49
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 23:21:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oqQnf-0000g1-P7
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 23:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667445707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gw+sATqcBeq+M4nscnyql5zFCI6IfDX2XIUAd+hH2Tw=;
 b=h6l+vjGa9ksL9ZEMDgFQHvRQZtZA5T1iXggJ1QC8lqG7xdYw8QbRUJ6tLfkc6vPk29xAhH
 mXrzcmtqWnTOcmyCXJ6XgmPTBuha7cgcc9yk1wDBZ2z8zo9Vcw/bkVe6eYbCnwyuE6xzpe
 3w4zSe9SBZLkP5i3DH59NHeEDXSbOMQ=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-7oWVdjCdMyWTGTq6SJW_kQ-1; Wed, 02 Nov 2022 23:21:46 -0400
X-MC-Unique: 7oWVdjCdMyWTGTq6SJW_kQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13bf576ffa6so472422fac.9
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 20:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gw+sATqcBeq+M4nscnyql5zFCI6IfDX2XIUAd+hH2Tw=;
 b=wu3z9i6Kao8tysGxAkjcUPGJBxnoLjtqoi0qi3UHM1rQDkoU6/nODUZ/1A4+Fk/KXy
 R1I6XzKgl1CK5wewMHE2uWkEmoNxJY9G7HxbG+0lUEBoE4LmErcA1N3lwLtgXKm2sQSV
 NFVB6RF2+ts4OnAgcUFaC8q+qXnJWUPZunhyYwXc8wsTF62G7BZFALhv5SCMNZTqVy0q
 FIarqxCJuLjsJVToiyf5l6WWwLMIY9XgIcoD/CoLEKr8gIDZKLBVwcGxEnrK1bNbnVml
 q71FcOHv5aUol/+45Q6V9i/b2fV/KjIHnCgbpZ+22pjEbUjnkRAQy8JaVfLE5VBA4WGY
 vHVA==
X-Gm-Message-State: ACrzQf0a/Yxr8ee5wknF66dgvM1tqTcdkznXSQQpShTuExE1BlxqcCAz
 elaVfLMajdpCHIbBHDGTTx0SiwxXnkamp4mQtbjSVyarNNjrqENfZ6vSHkQspA0KXUpyXoDNPY8
 MO0TEHeZTbspSdkfllEMhqkYKYBTsS38=
X-Received: by 2002:aca:905:0:b0:359:cfa1:ebb1 with SMTP id
 5-20020aca0905000000b00359cfa1ebb1mr14557830oij.280.1667445700758; 
 Wed, 02 Nov 2022 20:21:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cOi2i2Arag0ELI6KIplWJ/Yu6H6ShTZGe2EHdCiehKcgXjzayTfcWO2jyx5v3Oj4/yeUSUa7syuOobEVNmXs=
X-Received: by 2002:aca:905:0:b0:359:cfa1:ebb1 with SMTP id
 5-20020aca0905000000b00359cfa1ebb1mr14557812oij.280.1667445700391; Wed, 02
 Nov 2022 20:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
 <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
 <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
 <CACGkMEuv2zNLAr_BxPcQ3RCH5S91bm6sJFvhL7QetJNXaM_FmQ@mail.gmail.com>
 <CAJaqyWfyDWAe18MYzKmwjm8icCR7Ju4eHx1XRQCVb3M1p9uu+A@mail.gmail.com>
 <CACGkMEsEm6cLuQ9uB+wsbyyjExzYP6ua=cS74p12JdBoqModQg@mail.gmail.com>
 <CAJaqyWeD3KnGeVnmWVFdhf1zX8_62zp9VvM1x=YsAmvPFqX8Sw@mail.gmail.com>
 <CACGkMEv4vm5=-zsBjcLePg0=DAXoDXWMNpv2Z-p-Fz2=M_5Bpg@mail.gmail.com>
 <CAJaqyWdj77zojhcf80FtuYeoE9Kmj1oVimbzdHD942QeScUGaQ@mail.gmail.com>
In-Reply-To: <CAJaqyWdj77zojhcf80FtuYeoE9Kmj1oVimbzdHD942QeScUGaQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 3 Nov 2022 11:21:28 +0800
Message-ID: <CACGkMEtnLMwR6nOfy6wz+YcN+k-LpMCpaRhVt6WHUt1zFAOyGQ@mail.gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 2, 2022 at 7:19 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Nov 1, 2022 at 9:10 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Oct 28, 2022 at 5:30 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Fri, Oct 28, 2022 at 3:59 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Thu, Oct 27, 2022 at 6:18 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Thu, Oct 27, 2022 at 8:54 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > > > > >
> > > > > > On Thu, Oct 27, 2022 at 2:47 PM Eugenio Perez Martin
> > > > > > <eperezma@redhat.com> wrote:
> > > > > > >
> > > > > > > On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@redhat.c=
om> wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=99=E9=
=81=93:
> > > > > > > > > Now that qemu can handle and emulate it if the vdpa backe=
nd does not
> > > > > > > > > support it we can offer it always.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > > >
> > > > > > > >
> > > > > > > > I may miss something but isn't more easier to simply remove=
 the
> > > > > > > > _F_STATUS from vdpa_feature_bits[]?
> > > > > > > >
> > > > > > >
> > > > > > > How is that? if we remove it, the guest cannot ack it so it c=
annot
> > > > > > > access the net status, isn't it?
> > > > > >
> > > > > > My understanding is that the bits stored in the vdpa_feature_bi=
ts[]
> > > > > > are the features that must be explicitly supported by the vhost
> > > > > > device.
> > > > >
> > > > > (Non English native here, so maybe I don't get what you mean :) )=
 The
> > > > > device may not support them. net simulator lacks some of them
> > > > > actually, and it works.
> > > >
> > > > Speaking too fast, I think I meant that, if the bit doesn't belong =
to
> > > > vdpa_feature_bits[], it is assumed to be supported by the Qemu with=
out
> > > > the support of the vhost. So Qemu won't even try to validate if vho=
st
> > > > has this support. E.g for vhost-net, we only have:
> > > >
> > > > static const int kernel_feature_bits[] =3D {
> > > >     VIRTIO_F_NOTIFY_ON_EMPTY,
> > > >     VIRTIO_RING_F_INDIRECT_DESC,
> > > >     VIRTIO_RING_F_EVENT_IDX,
> > > >     VIRTIO_NET_F_MRG_RXBUF,
> > > >     VIRTIO_F_VERSION_1,
> > > >     VIRTIO_NET_F_MTU,
> > > >     VIRTIO_F_IOMMU_PLATFORM,
> > > >     VIRTIO_F_RING_PACKED,
> > > >     VIRTIO_NET_F_HASH_REPORT,
> > > >     VHOST_INVALID_FEATURE_BIT
> > > > };
> > > >
> > > > You can see there's no STATUS bit there since it is emulated by Qem=
u.
> > > >
> > >
> > > Ok now I get what you mean, and yes we may modify the patches in that=
 direction.
> > >
> > > But if we go then we need to modify how qemu ack the features, becaus=
e
> > > the features that are not in vdpa_feature_bits are not acked to the
> > > device. More on this later.
> > >
> > > > >
> > > > > From what I see these are the only features that will be forwarde=
d to
> > > > > the guest as device_features. If it is not in the list, the featu=
re
> > > > > will be masked out,
> > > >
> > > > Only when there's no support for this feature from the vhost.
> > > >
> > > > > as if the device does not support it.
> > > > >
> > > > > So now _F_STATUS it was forwarded only if the device supports it.=
 If
> > > > > we remove it from bit_mask, it will never be offered to the guest=
. But
> > > > > we want to offer it always, since we will need it for
> > > > > _F_GUEST_ANNOUNCE.
> > > > >
> > > > > Things get more complex because we actually need to ack it back i=
f the
> > > > > device offers it, so the vdpa device can report link_down. We wil=
l
> > > > > only emulate LINK_UP always in the case the device does not suppo=
rt
> > > > > _F_STATUS.
> > > > >
> > > > > > So if we remove _F_STATUS, Qemu vhost code won't validate if
> > > > > > vhost-vdpa device has this support:
> > > > > >
> > > > > > uint64_t vhost_get_features(struct vhost_dev *hdev, const int *=
feature_bits,
> > > > > >                             uint64_t features)
> > > > > > {
> > > > > >     const int *bit =3D feature_bits;
> > > > > >     while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
> > > > > >         uint64_t bit_mask =3D (1ULL << *bit);
> > > > > >         if (!(hdev->features & bit_mask)) {
> > > > > >             features &=3D ~bit_mask;
> > > > > >         }
> > > > > >         bit++;
> > > > > >     }
> > > > > >     return features;
> > > > > > }
> > > > > >
> > > > >
> > > > > Now maybe I'm the one missing something, but why is this not done=
 as a
> > > > > masking directly?
> > > >
> > > > Not sure, the code has been there since day 0.
> > > >
> > > > But you can see from the code:
> > > >
> > > > 1) if STATUS is in feature_bits, we need validate the hdev->feature=
s
> > > > and mask it if the vhost doesn't have the support
> > > > 2) if STATUS is not, we don't do the check and driver may still see=
 STATUS
> > > >
> > >
> > > That's useful for _F_GUEST_ANNOUNCE, but we need to ack _F_STATUS for
> > > the device if it supports it.
> >
> > Rethink about this, I don't see why ANNOUNCE depends on STATUS (spec
> > doesn't say so).
> >
>
> It is needed for the guest to read the status bit:
> """
> status only exists if VIRTIO_NET_F_STATUS is set. Two read-only bits
> (for the driver) are currently defined for the status field:
> VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
> """
>
> A change on the standard could be possible, like "status only exists
> if VIRTIO_NET_F_STATUS or VIRTIO_NET_F_GUEST_ANNOUNCE is set".
> However, Linux drivers already expect _F_STATUS to read _S_ANNOUNCE
> and to emulate _F_STATUS in case the device doesn't support it should
> not be a big deal in my opinion.

RIght, so I think we need a spec patch to clarify the dependency,
currently, spec said ANNOUNCE depends on CTRL_VQ.

>
> > > QEMU cannot detect by itself when the
> > > link is not up. I think that setting unconditionally
> > > VIRTIO_NET_S_LINK_UP is actually a regression, since the guest cannot
> > > detect the link down that way.
> >
> > I think the idea is to still read status from config if the device
> > supports this.
> >
>
> Yes, that's my point. If I delete it from vdpa_feature_bits, it will
> not be acked to the device, so we cannot read status from the device.
>
> > >
> > > To enable _F_STATUS unconditionally is only done in the case the
> > > device does not support it, because its emulation is very easy. That
> > > way we support _F_GUEST_ANNOUNCE in all cases without device's
> > > cooperation.
> > >
> > > Having said that, should we go the opposite route and ack _F_STATE as
> > > long as the device supports it? As an advantage, all backends should
> > > support that at this moment, isn't it?
> >
> > So I think the method used in this patch is fine, but I wonder if it's
> > better to move it to the vhost layer instead of doing it in vhost_net
> > since we do the features validation there. We probably need another
> > table as input for get/set features there?
> >
>
> We can discuss how to do it for sure. But as you pointed out,
> vhost_net and virtio_net already modify the features received from the
> devices, so it makes sense to me to modify the features set by the
> guest.
>
> The problem is that we need to transmit to vhost when ack _F_STATUS
> and when not. The first proposal was to add a new member of vhost_vdpa
> but this is not optimal.
>
> If we add a new table it should be a static const one, and vhost_vdpa
> should have a pointer to it, isn't it?

Yes.

> Something like features that
> are emulated by qemu so they must be offered always to the guest?

Kind of, actually it should be the features:

1) could be always seen by guest
2) when vhost device have this feature, use that
3) when vhost device doesn't have this feature, emulate one

But a question still, is there a vDPA parent that can't do _F_STATUS
now (if not, we probably don't need to bother now).

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > >
> > >
> > >
> > > > Thanks
> > > >
> > > > >
> > > > > Instead of making feature_bits an array of ints, to declare it as=
 a
> > > > > uint64_t with the valid feature bits and simply return features &
> > > > > feature_bits.
> > > > >
> > > > > Thanks!
> > > > >
> > > > > > Thanks
> > > > > >
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > The goal with this patch series is to let the guest access th=
e status
> > > > > > > always, even if the device doesn't support _F_STATUS.
> > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > >
> > > > > > > > > ---
> > > > > > > > >   include/net/vhost-vdpa.h |  1 +
> > > > > > > > >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> > > > > > > > >   net/vhost-vdpa.c         |  3 +++
> > > > > > > > >   3 files changed, 18 insertions(+), 2 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost=
-vdpa.h
> > > > > > > > > index b81f9a6f2a..cfbcce6427 100644
> > > > > > > > > --- a/include/net/vhost-vdpa.h
> > > > > > > > > +++ b/include/net/vhost-vdpa.h
> > > > > > > > > @@ -17,5 +17,6 @@
> > > > > > > > >   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientSta=
te *nc);
> > > > > > > > >
> > > > > > > > >   extern const int vdpa_feature_bits[];
> > > > > > > > > +extern const uint64_t vhost_vdpa_net_added_feature_bits;
> > > > > > > > >
> > > > > > > > >   #endif /* VHOST_VDPA_H */
> > > > > > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > > > > > > index d28f8b974b..7c15cc6e8f 100644
> > > > > > > > > --- a/hw/net/vhost_net.c
> > > > > > > > > +++ b/hw/net/vhost_net.c
> > > > > > > > > @@ -109,10 +109,22 @@ static const int *vhost_net_get_fea=
ture_bits(struct vhost_net *net)
> > > > > > > > >       return feature_bits;
> > > > > > > > >   }
> > > > > > > > >
> > > > > > > > > +static uint64_t vhost_net_add_feature_bits(struct vhost_=
net *net)
> > > > > > > > > +{
> > > > > > > > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHO=
ST_VDPA) {
> > > > > > > > > +        return vhost_vdpa_net_added_feature_bits;
> > > > > > > > > +    }
> > > > > > > > > +
> > > > > > > > > +    return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >   uint64_t vhost_net_get_features(struct vhost_net *net, =
uint64_t features)
> > > > > > > > >   {
> > > > > > > > > -    return vhost_get_features(&net->dev, vhost_net_get_f=
eature_bits(net),
> > > > > > > > > -            features);
> > > > > > > > > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > > > > > > > > +                                      vhost_net_get_feat=
ure_bits(net),
> > > > > > > > > +                                      features);
> > > > > > > > > +
> > > > > > > > > +    return ret | vhost_net_add_feature_bits(net);
> > > > > > > > >   }
> > > > > > > > >   int vhost_net_get_config(struct vhost_net *net,  uint8_=
t *config,
> > > > > > > > >                            uint32_t config_len)
> > > > > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > > > > index 6d64000202..24d2857593 100644
> > > > > > > > > --- a/net/vhost-vdpa.c
> > > > > > > > > +++ b/net/vhost-vdpa.c
> > > > > > > > > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_f=
eatures =3D
> > > > > > > > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > > > > > > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > > > > > > >
> > > > > > > > > +const uint64_t vhost_vdpa_net_added_feature_bits =3D
> > > > > > > > > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > > > > > > > > +
> > > > > > > > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState =
*nc)
> > > > > > > > >   {
> > > > > > > > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc,=
 nc);
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


