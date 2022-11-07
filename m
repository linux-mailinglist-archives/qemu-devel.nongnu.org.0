Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3133561EEEE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 10:27:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oryOl-0007V1-Sp; Mon, 07 Nov 2022 04:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oryOh-0007Tn-RQ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 04:26:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oryOe-0001QP-OI
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 04:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667813183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xql76EEDJHzc72dGbSx3XxSkB/fsqypRXaaKUfDWDJg=;
 b=LWEPRmcFV8mR/jpF8eyw/BSe0kCGemZz/IaGYYpC1TlLJ99kwQhTxAbv2qQYnWUnqq96eY
 XuXLzIiUW3uKgUphRRfxRBBnnsofJBk9E5znJrCEzluHGLX0uJRL9+VQ/dvbagmlbaS86L
 fpgb9tHZYCVwEPiVHBY8M7Xp4BzWQL4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-SFjWUV__N7O3jjaAiC4hkA-1; Mon, 07 Nov 2022 04:26:19 -0500
X-MC-Unique: SFjWUV__N7O3jjaAiC4hkA-1
Received: by mail-pj1-f71.google.com with SMTP id
 w2-20020a17090a8a0200b002119ea856edso10080915pjn.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 01:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xql76EEDJHzc72dGbSx3XxSkB/fsqypRXaaKUfDWDJg=;
 b=lPZwg7aYAOHNJZ5aRhy/8JmLiTS4KElDrGhBc7ZVEX2T3RrtDyD3XZtNGbjpSATNUS
 8uze9mf20vgFd+Squ7sij864HOIgYzbZvhxZf02jGRs/LIE8p8LcP/5ybqbjkFu7FluV
 RQVTwRkHbShBmqhsulb/9Jl2y+wogyU04rLpxc3mBpKxnXSk1UcsvlAmPfpPWdUoATyT
 JZj1ce8Q5ubEFnyp1D70mngzDPg0/4PT2ouFSvDn+8v03sQcQhgAwWV6c0GT8nVlSPr1
 LxeDZ7yDOaL+CN6++Z3UxFsZ9ppPXcqJCVHj8GIB8kK4P93lRJ2FqnlULhmGROtHtCAs
 d0LA==
X-Gm-Message-State: ACrzQf1RVntt3BSTjGmRa5zTPShbrkTdx/aVW/7fqJuV447othecPCoL
 pPolgb9AnURSJEpoLKbKYUaSa32HvkBlap3tf7SiQIZBTKOUfv+kuOBAvko6p0kgWm6x0BGdtnA
 /Tkalvl2LSm8HZDdvIVm4wfe4duquGYc=
X-Received: by 2002:a17:90a:8d15:b0:216:df8f:3de with SMTP id
 c21-20020a17090a8d1500b00216df8f03demr18345334pjo.80.1667813177541; 
 Mon, 07 Nov 2022 01:26:17 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5eMXXbH7yOmRY2MDq0R0PkbYu7zv8Fbrd27Fo0uPO3Z31UhgXkphXM93Y+21sT1LCDkVT3R3C9bGdGgxd90k8=
X-Received: by 2002:a17:90a:8d15:b0:216:df8f:3de with SMTP id
 c21-20020a17090a8d1500b00216df8f03demr18345298pjo.80.1667813177148; Mon, 07
 Nov 2022 01:26:17 -0800 (PST)
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
 <CACGkMEtnLMwR6nOfy6wz+YcN+k-LpMCpaRhVt6WHUt1zFAOyGQ@mail.gmail.com>
 <CAJaqyWfaTuTo78UGKa+0__=hvC0r0oLV7B6+TCuNMA2Yq6LAdw@mail.gmail.com>
 <CACGkMEsqO4f8NCTEU3O_aXktvggW4FO6cRkPiX9B5FmkpDgjUA@mail.gmail.com>
In-Reply-To: <CACGkMEsqO4f8NCTEU3O_aXktvggW4FO6cRkPiX9B5FmkpDgjUA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 7 Nov 2022 10:25:40 +0100
Message-ID: <CAJaqyWcUtBhxMb0jcQw8r8vwyb-4dKCRA5PLhyY4WwGLgh=hnw@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
To: Jason Wang <jasowang@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, qemu-devel@nongnu.org, 
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 7, 2022 at 8:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Nov 3, 2022 at 4:12 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Thu, Nov 3, 2022 at 4:21 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Nov 2, 2022 at 7:19 PM Eugenio Perez Martin <eperezma@redhat.=
com> wrote:
> > > >
> > > > On Tue, Nov 1, 2022 at 9:10 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > > >
> > > > > On Fri, Oct 28, 2022 at 5:30 PM Eugenio Perez Martin
> > > > > <eperezma@redhat.com> wrote:
> > > > > >
> > > > > > On Fri, Oct 28, 2022 at 3:59 AM Jason Wang <jasowang@redhat.com=
> wrote:
> > > > > > >
> > > > > > > On Thu, Oct 27, 2022 at 6:18 PM Eugenio Perez Martin
> > > > > > > <eperezma@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Oct 27, 2022 at 8:54 AM Jason Wang <jasowang@redhat=
.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Oct 27, 2022 at 2:47 PM Eugenio Perez Martin
> > > > > > > > > <eperezma@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@re=
dhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > > > > > > > > > > Now that qemu can handle and emulate it if the vdpa=
 backend does not
> > > > > > > > > > > > support it we can offer it always.
> > > > > > > > > > > >
> > > > > > > > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.=
com>
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > I may miss something but isn't more easier to simply =
remove the
> > > > > > > > > > > _F_STATUS from vdpa_feature_bits[]?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > How is that? if we remove it, the guest cannot ack it s=
o it cannot
> > > > > > > > > > access the net status, isn't it?
> > > > > > > > >
> > > > > > > > > My understanding is that the bits stored in the vdpa_feat=
ure_bits[]
> > > > > > > > > are the features that must be explicitly supported by the=
 vhost
> > > > > > > > > device.
> > > > > > > >
> > > > > > > > (Non English native here, so maybe I don't get what you mea=
n :) ) The
> > > > > > > > device may not support them. net simulator lacks some of th=
em
> > > > > > > > actually, and it works.
> > > > > > >
> > > > > > > Speaking too fast, I think I meant that, if the bit doesn't b=
elong to
> > > > > > > vdpa_feature_bits[], it is assumed to be supported by the Qem=
u without
> > > > > > > the support of the vhost. So Qemu won't even try to validate =
if vhost
> > > > > > > has this support. E.g for vhost-net, we only have:
> > > > > > >
> > > > > > > static const int kernel_feature_bits[] =3D {
> > > > > > >     VIRTIO_F_NOTIFY_ON_EMPTY,
> > > > > > >     VIRTIO_RING_F_INDIRECT_DESC,
> > > > > > >     VIRTIO_RING_F_EVENT_IDX,
> > > > > > >     VIRTIO_NET_F_MRG_RXBUF,
> > > > > > >     VIRTIO_F_VERSION_1,
> > > > > > >     VIRTIO_NET_F_MTU,
> > > > > > >     VIRTIO_F_IOMMU_PLATFORM,
> > > > > > >     VIRTIO_F_RING_PACKED,
> > > > > > >     VIRTIO_NET_F_HASH_REPORT,
> > > > > > >     VHOST_INVALID_FEATURE_BIT
> > > > > > > };
> > > > > > >
> > > > > > > You can see there's no STATUS bit there since it is emulated =
by Qemu.
> > > > > > >
> > > > > >
> > > > > > Ok now I get what you mean, and yes we may modify the patches i=
n that direction.
> > > > > >
> > > > > > But if we go then we need to modify how qemu ack the features, =
because
> > > > > > the features that are not in vdpa_feature_bits are not acked to=
 the
> > > > > > device. More on this later.
> > > > > >
> > > > > > > >
> > > > > > > > From what I see these are the only features that will be fo=
rwarded to
> > > > > > > > the guest as device_features. If it is not in the list, the=
 feature
> > > > > > > > will be masked out,
> > > > > > >
> > > > > > > Only when there's no support for this feature from the vhost.
> > > > > > >
> > > > > > > > as if the device does not support it.
> > > > > > > >
> > > > > > > > So now _F_STATUS it was forwarded only if the device suppor=
ts it. If
> > > > > > > > we remove it from bit_mask, it will never be offered to the=
 guest. But
> > > > > > > > we want to offer it always, since we will need it for
> > > > > > > > _F_GUEST_ANNOUNCE.
> > > > > > > >
> > > > > > > > Things get more complex because we actually need to ack it =
back if the
> > > > > > > > device offers it, so the vdpa device can report link_down. =
We will
> > > > > > > > only emulate LINK_UP always in the case the device does not=
 support
> > > > > > > > _F_STATUS.
> > > > > > > >
> > > > > > > > > So if we remove _F_STATUS, Qemu vhost code won't validate=
 if
> > > > > > > > > vhost-vdpa device has this support:
> > > > > > > > >
> > > > > > > > > uint64_t vhost_get_features(struct vhost_dev *hdev, const=
 int *feature_bits,
> > > > > > > > >                             uint64_t features)
> > > > > > > > > {
> > > > > > > > >     const int *bit =3D feature_bits;
> > > > > > > > >     while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
> > > > > > > > >         uint64_t bit_mask =3D (1ULL << *bit);
> > > > > > > > >         if (!(hdev->features & bit_mask)) {
> > > > > > > > >             features &=3D ~bit_mask;
> > > > > > > > >         }
> > > > > > > > >         bit++;
> > > > > > > > >     }
> > > > > > > > >     return features;
> > > > > > > > > }
> > > > > > > > >
> > > > > > > >
> > > > > > > > Now maybe I'm the one missing something, but why is this no=
t done as a
> > > > > > > > masking directly?
> > > > > > >
> > > > > > > Not sure, the code has been there since day 0.
> > > > > > >
> > > > > > > But you can see from the code:
> > > > > > >
> > > > > > > 1) if STATUS is in feature_bits, we need validate the hdev->f=
eatures
> > > > > > > and mask it if the vhost doesn't have the support
> > > > > > > 2) if STATUS is not, we don't do the check and driver may sti=
ll see STATUS
> > > > > > >
> > > > > >
> > > > > > That's useful for _F_GUEST_ANNOUNCE, but we need to ack _F_STAT=
US for
> > > > > > the device if it supports it.
> > > > >
> > > > > Rethink about this, I don't see why ANNOUNCE depends on STATUS (s=
pec
> > > > > doesn't say so).
> > > > >
> > > >
> > > > It is needed for the guest to read the status bit:
> > > > """
> > > > status only exists if VIRTIO_NET_F_STATUS is set. Two read-only bit=
s
> > > > (for the driver) are currently defined for the status field:
> > > > VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
> > > > """
> > > >
> > > > A change on the standard could be possible, like "status only exist=
s
> > > > if VIRTIO_NET_F_STATUS or VIRTIO_NET_F_GUEST_ANNOUNCE is set".
> > > > However, Linux drivers already expect _F_STATUS to read _S_ANNOUNCE
> > > > and to emulate _F_STATUS in case the device doesn't support it shou=
ld
> > > > not be a big deal in my opinion.
> > >
> > > RIght, so I think we need a spec patch to clarify the dependency,
> > > currently, spec said ANNOUNCE depends on CTRL_VQ.
> > >
> >
> > Would it be enough to expand it under the "Feature bit requirements" se=
ction?
> >
>
> Yes.
>
> > > >
> > > > > > QEMU cannot detect by itself when the
> > > > > > link is not up. I think that setting unconditionally
> > > > > > VIRTIO_NET_S_LINK_UP is actually a regression, since the guest =
cannot
> > > > > > detect the link down that way.
> > > > >
> > > > > I think the idea is to still read status from config if the devic=
e
> > > > > supports this.
> > > > >
> > > >
> > > > Yes, that's my point. If I delete it from vdpa_feature_bits, it wil=
l
> > > > not be acked to the device, so we cannot read status from the devic=
e.
> > > >
> > > > > >
> > > > > > To enable _F_STATUS unconditionally is only done in the case th=
e
> > > > > > device does not support it, because its emulation is very easy.=
 That
> > > > > > way we support _F_GUEST_ANNOUNCE in all cases without device's
> > > > > > cooperation.
> > > > > >
> > > > > > Having said that, should we go the opposite route and ack _F_ST=
ATE as
> > > > > > long as the device supports it? As an advantage, all backends s=
hould
> > > > > > support that at this moment, isn't it?
> > > > >
> > > > > So I think the method used in this patch is fine, but I wonder if=
 it's
> > > > > better to move it to the vhost layer instead of doing it in vhost=
_net
> > > > > since we do the features validation there. We probably need anoth=
er
> > > > > table as input for get/set features there?
> > > > >
> > > >
> > > > We can discuss how to do it for sure. But as you pointed out,
> > > > vhost_net and virtio_net already modify the features received from =
the
> > > > devices, so it makes sense to me to modify the features set by the
> > > > guest.
> > > >
> > > > The problem is that we need to transmit to vhost when ack _F_STATUS
> > > > and when not. The first proposal was to add a new member of vhost_v=
dpa
> > > > but this is not optimal.
> > > >
> > > > If we add a new table it should be a static const one, and vhost_vd=
pa
> > > > should have a pointer to it, isn't it?
> > >
> > > Yes.
> > >
> > > > Something like features that
> > > > are emulated by qemu so they must be offered always to the guest?
> > >
> > > Kind of, actually it should be the features:
> > >
> > > 1) could be always seen by guest
> > > 2) when vhost device have this feature, use that
> > > 3) when vhost device doesn't have this feature, emulate one
> > >
> >
> > I'm fine with that approach, but restricting the changes to either
> > vhost_net or virtio_net makes more sense to me. The net config space
> > interception goes to virtio_net anyway, not to vhost-vdpa.
> >
> > I'll try to prepare the patches with a new array.
>
> I'm ok if Michael is ok with this. I think it might help if we add a
> comment in general vhost code like vhost_get_features(), then readers
> know that each individual vhost implementation can mediate the feature
> by their own.
>
> >
> > > But a question still, is there a vDPA parent that can't do _F_STATUS
> > > now (if not, we probably don't need to bother now).
> > >
> >
> > Only mlx have _F_STATUS at this moment.
> >
> > If I understand you correctly, you are proposing not to emulate
> > _F_STATUS if the device does not support it? To emulate _F_STATUS is
> > not a big deal emulating _F_GUEST_ANNOUNCE on top anyway.
>
> I meant if most of the vDPA parent supports _F_STATUS, there's
> probably no need to emulate it:
>
> 1) simulator, not hard to add status
> 2) vp_vdpa, should support _F_STATUS
> 3) IFCVF, I guess it should have this support, Ling Shan, can you clarify=
 this?
> 4) ENI, not sure but anyhow it's a legacy parent
>

If this is the case then yes, it might make more sense to add
_F_STATUS support to at least vdpa simulator.

We can always emulate it in qemu later for sure.

Thanks!

> Thanks
>
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > > Thanks!
> > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > > >
> > > > > > > > Instead of making feature_bits an array of ints, to declare=
 it as a
> > > > > > > > uint64_t with the valid feature bits and simply return feat=
ures &
> > > > > > > > feature_bits.
> > > > > > > >
> > > > > > > > Thanks!
> > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > The goal with this patch series is to let the guest acc=
ess the status
> > > > > > > > > > always, even if the device doesn't support _F_STATUS.
> > > > > > > > > >
> > > > > > > > > > > Thanks
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > ---
> > > > > > > > > > > >   include/net/vhost-vdpa.h |  1 +
> > > > > > > > > > > >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> > > > > > > > > > > >   net/vhost-vdpa.c         |  3 +++
> > > > > > > > > > > >   3 files changed, 18 insertions(+), 2 deletions(-)
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/include/net/vhost-vdpa.h b/include/net=
/vhost-vdpa.h
> > > > > > > > > > > > index b81f9a6f2a..cfbcce6427 100644
> > > > > > > > > > > > --- a/include/net/vhost-vdpa.h
> > > > > > > > > > > > +++ b/include/net/vhost-vdpa.h
> > > > > > > > > > > > @@ -17,5 +17,6 @@
> > > > > > > > > > > >   struct vhost_net *vhost_vdpa_get_vhost_net(NetCli=
entState *nc);
> > > > > > > > > > > >
> > > > > > > > > > > >   extern const int vdpa_feature_bits[];
> > > > > > > > > > > > +extern const uint64_t vhost_vdpa_net_added_feature=
_bits;
> > > > > > > > > > > >
> > > > > > > > > > > >   #endif /* VHOST_VDPA_H */
> > > > > > > > > > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.=
c
> > > > > > > > > > > > index d28f8b974b..7c15cc6e8f 100644
> > > > > > > > > > > > --- a/hw/net/vhost_net.c
> > > > > > > > > > > > +++ b/hw/net/vhost_net.c
> > > > > > > > > > > > @@ -109,10 +109,22 @@ static const int *vhost_net_g=
et_feature_bits(struct vhost_net *net)
> > > > > > > > > > > >       return feature_bits;
> > > > > > > > > > > >   }
> > > > > > > > > > > >
> > > > > > > > > > > > +static uint64_t vhost_net_add_feature_bits(struct =
vhost_net *net)
> > > > > > > > > > > > +{
> > > > > > > > > > > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIV=
ER_VHOST_VDPA) {
> > > > > > > > > > > > +        return vhost_vdpa_net_added_feature_bits;
> > > > > > > > > > > > +    }
> > > > > > > > > > > > +
> > > > > > > > > > > > +    return 0;
> > > > > > > > > > > > +}
> > > > > > > > > > > > +
> > > > > > > > > > > >   uint64_t vhost_net_get_features(struct vhost_net =
*net, uint64_t features)
> > > > > > > > > > > >   {
> > > > > > > > > > > > -    return vhost_get_features(&net->dev, vhost_net=
_get_feature_bits(net),
> > > > > > > > > > > > -            features);
> > > > > > > > > > > > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > > > > > > > > > > > +                                      vhost_net_ge=
t_feature_bits(net),
> > > > > > > > > > > > +                                      features);
> > > > > > > > > > > > +
> > > > > > > > > > > > +    return ret | vhost_net_add_feature_bits(net);
> > > > > > > > > > > >   }
> > > > > > > > > > > >   int vhost_net_get_config(struct vhost_net *net,  =
uint8_t *config,
> > > > > > > > > > > >                            uint32_t config_len)
> > > > > > > > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > > > > > > > index 6d64000202..24d2857593 100644
> > > > > > > > > > > > --- a/net/vhost-vdpa.c
> > > > > > > > > > > > +++ b/net/vhost-vdpa.c
> > > > > > > > > > > > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_de=
vice_features =3D
> > > > > > > > > > > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > > > > > > > > > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > > > > > > > > > >
> > > > > > > > > > > > +const uint64_t vhost_vdpa_net_added_feature_bits =
=3D
> > > > > > > > > > > > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > > > > > > > > > > > +
> > > > > > > > > > > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClient=
State *nc)
> > > > > > > > > > > >   {
> > > > > > > > > > > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAStat=
e, nc, nc);
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


