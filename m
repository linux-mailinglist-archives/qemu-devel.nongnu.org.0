Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC15B8717
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:15:18 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQMP-0002fk-PF
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oYQAC-0000bs-2a
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oYQA3-0006cV-Ph
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663153332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMLYSteN78dx4xxHsSlkHbZOfV6t7AoXvubD7uCKBF8=;
 b=Ouh7cde6sZvNiqbS84c5LWzoAHPMWTq7BwW9TXRfqytv3GvEhRAyxGyePIszBb0jBf/Oxg
 61REL9Hg7RWQf7ThT2c22UQxriKMb4gY9QL6x8cSMfyeFzF17JlFfCyUJUXgLaDNqQ0/2b
 LrAZpDo/Z6IX/+u9sfHVhtLA+d78PrY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-y7_dAYozPqWCB_w2a0487g-1; Wed, 14 Sep 2022 07:02:11 -0400
X-MC-Unique: y7_dAYozPqWCB_w2a0487g-1
Received: by mail-qk1-f200.google.com with SMTP id
 bp17-20020a05620a459100b006ce7f4bb0b7so1909214qkb.5
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KMLYSteN78dx4xxHsSlkHbZOfV6t7AoXvubD7uCKBF8=;
 b=2Ppt1nzN5Y94ALxXDSp60QatRCLLnjetAr17NOB5O3rVcrakfHbqhC2+8B0zGFB4oM
 ZkNDxaOOjs4gpm45hhYBv46ddz3jAki6gsae3Tc91nmDRNeELntU1HYihmcfdn2SqoY5
 KXrNGPMzdfYyNSPvU5UQtnI5/FRVgc21/DBq+4KjJWUH9nKG4cDrN8J8VZ6hP8GcRAC9
 328uyyylhfY3/Rs8rZ3Ha19ceJKh93ZvfD05EoTtG3RgytNwDk9bMUSsfIu6OrKzyzNT
 j5oPwliBbJEgo83IVmJJWicIxRA3PpIIrmqHuo23ZWYKN3CfBPDm04P4s50nKMbc/p37
 90qg==
X-Gm-Message-State: ACgBeo3yW74Z3FjNu4t3QLBV8A1lVu6/uIHhWpHYhsPAMzJJnDsJ3ZkW
 kA1w2jDLeyvxHsZNdgsv1aXmbkbAmYIC4CVXTktJQq5dDxRBcqXoAmcuc3aqouq2jH8CqwGBCD3
 HDONzEY/4Jw3vrZ3/58yaqnFjtUx1X2w=
X-Received: by 2002:ac8:5f12:0:b0:343:6510:ed6f with SMTP id
 x18-20020ac85f12000000b003436510ed6fmr32645178qta.342.1663153331075; 
 Wed, 14 Sep 2022 04:02:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4YA72489eS4LKxWDiN/1zZKrK2Mp31krGqgHle8LzA4bYxKqjpVg8QNJnMbhdVoEBvyQKr+rF4yhD/Zs9R8Ag=
X-Received: by 2002:ac8:5f12:0:b0:343:6510:ed6f with SMTP id
 x18-20020ac85f12000000b003436510ed6fmr32645151qta.342.1663153330790; Wed, 14
 Sep 2022 04:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
In-Reply-To: <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 14 Sep 2022 13:01:34 +0200
Message-ID: <CAJaqyWf778WX1AG22dP0YU+=ZCAsHX1uHa4StZ14vMON_SQf+g@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 14, 2022 at 4:20 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > > On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > To have enabled vlans at device startup may happen in the destina=
tion of
> > > > > a live migration, so this configuration must be restored.
> > > > >
> > > > > At this moment the code is not accessible, since SVQ refuses to s=
tart if
> > > > > vlan feature is exposed by the device.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++=
++--
> > > > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 4bc3fd01a8..ecbfd08eb9 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_feature=
s =3D
> > > > >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > > >      BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > > >
> > > > > +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > > > > +
> > > > >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > > >  {
> > > > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > > @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAS=
tate *s,
> > > > >      return *s->status !=3D VIRTIO_NET_OK;
> > > > >  }
> > > > >
> > > > > +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> > > > > +                                           const VirtIONet *n,
> > > > > +                                           uint16_t vid)
> > > > > +{
> > > > > +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NE=
T_CTRL_VLAN,
> > > > > +                                                  VIRTIO_NET_CTR=
L_VLAN_ADD,
> > > > > +                                                  &vid, sizeof(v=
id));
> > > > > +    if (unlikely(dev_written < 0)) {
> > > > > +        return dev_written;
> > > > > +    }
> > > > > +
> > > > > +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> > > > > +        return -EINVAL;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> > > > > +                                    const VirtIONet *n)
> > > > > +{
> > > > > +    uint64_t features =3D n->parent_obj.guest_features;
> > > > > +
> > > > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> > > > > +        return 0;
> > > > > +    }
> > > > > +
> > > > > +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> > > > > +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> > > > > +            if (n->vlans[i] & (1U << j)) {
> > > > > +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, =
(i << 5) + j);
> > > >
> > > > This seems to cause a lot of latency if the driver has a lot of vla=
ns.
> > > >
> > > > I wonder if it's simply to let all vlan traffic go by disabling
> > > > CTRL_VLAN feature at vDPA layer.
> > >
> >
> > The guest will not be able to recover that vlan configuration.
>
> Spec said it's best effort and we actually don't do this for
> vhost-net/user for years and manage to survive.
>

If that is accepted I'm ok to do it that way.

> >
> > > Another idea is to extend the spec to allow us to accept a bitmap of
> > > the vlan ids via a single command, then we will be fine.
> > >
> >
> > I'm not sure if adding more ways to configure something is the answer,
> > but I'd be ok to implement it.
> >
> > Another idea is to allow the sending of many CVQ commands in parallel.
> > It shouldn't be very hard to achieve using exposed buffers as ring
> > buffers, and it will short down the start of the devices with many
> > features.
>
> In the extreme case, what if guests decide to filter all of the vlans?
> It means we need MAX_VLAN commands which may exceeds the size of the
> control virtqueue.
>

The buffers should be used in a circular manner: If not every vlan /
cmd could be sent, we should wait for previous buffers completion and
keep sending.

This would speed up not only vlan initialization but all NIC
configuration loading.

> Thanks
>
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > > Thanks
> > > >
> > > > > +                if (unlikely(r !=3D 0)) {
> > > > > +                    return r;
> > > > > +                }
> > > > > +            }
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > >  static int vhost_vdpa_net_load(NetClientState *nc)
> > > > >  {
> > > > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > > @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState=
 *nc)
> > > > >      if (unlikely(r)) {
> > > > >          return r;
> > > > >      }
> > > > > -
> > > > > -    return 0;
> > > > > +    return vhost_vdpa_net_load_vlan(s, n);
> > > > >  }
> > > > >
> > > > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > > > > --
> > > > > 2.31.1
> > > > >
> > >
> >
>


