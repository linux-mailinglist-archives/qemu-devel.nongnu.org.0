Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06E5B7EE2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 04:21:41 +0200 (CEST)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYI20-0000IL-DE
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 22:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI0v-0007J9-Uj
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI0s-0003GM-LH
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663122029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMZQk8gmp6mWWB9DYruMvbRhEpKnvvpbrpSmDkeUgZ8=;
 b=LPpCbVRtqk2CsLgrTsc/gcBWYqB91ST3Mirhy8qEAjtVOcbcbonT6GrDb3jLgDLiyGeArC
 Yi01KHUDvG4JRb+5dXnur5IKcLv6xy5MTR6vHeHXn9V3EfM3MTMyLIaKzmDRmH3N1f6CVN
 0df7mdJSRBDNbrrk8n5/eDYuJ7GVbn0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-lrA-k2nRPEm9wU6eq2C6CA-1; Tue, 13 Sep 2022 22:20:28 -0400
X-MC-Unique: lrA-k2nRPEm9wU6eq2C6CA-1
Received: by mail-vk1-f199.google.com with SMTP id
 t204-20020a1f2dd5000000b0039e8fb8258cso3128910vkt.11
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 19:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mMZQk8gmp6mWWB9DYruMvbRhEpKnvvpbrpSmDkeUgZ8=;
 b=aM0oMw3MWoZ6GMC5iadz9bR7Vew1FvHIHTU7ttfe5WzAmTorOl1MfKInM1FUsc+rHX
 0cnZO/Ll/yNeDM4d0F1Tfy5vs0zgIm1YMflCB13OQEYprMhDRbc8wS30cuiLyPk/B4B+
 Nic7TymfXWLNRvU4E21DQA2VuCGtg6BwaXBBNPx7qvaPnYRAr9KXmURMGzyod7PYo32z
 DyBKR8vH5qvSZrh87ueuanrtXJzCEt62149ac8RgbIA2GUbvI4siJNymd0PPsymdm0rd
 lUB0r1ufHAeaXWaFDshfbUImxaoFeKws7GxeO3fK3eEVUxgtOM7Kfrx3Em3busOZTiHE
 homw==
X-Gm-Message-State: ACgBeo2gYl6Avf/UmGUlOzYCNBhWBsSbsGpOpUXQx7r8hGBkbuvMu6Z/
 UoAc+Equ1HWT6UbANSj8ADgxYmWHROgbn/zNqdBcHHuxgImn0BSPcoYeppUY1EjpOSBjM2P6g57
 NXphe3882jNnFE1npivicNXNyBJ5w+9w=
X-Received: by 2002:a67:e218:0:b0:398:4d8c:8037 with SMTP id
 g24-20020a67e218000000b003984d8c8037mr8828199vsa.4.1663122028280; 
 Tue, 13 Sep 2022 19:20:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6VObkp9XN651mgdBW94g6OcMXCGYyAfkc8Auvqz82O2qPO4l4hpPVPOrwft5vHP0uAH59pPnnK2JpqXf8ndRI=
X-Received: by 2002:a67:e218:0:b0:398:4d8c:8037 with SMTP id
 g24-20020a67e218000000b003984d8c8037mr8828188vsa.4.1663122028000; Tue, 13 Sep
 2022 19:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
In-Reply-To: <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 Sep 2022 10:20:17 +0800
Message-ID: <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> > > >
> > > > To have enabled vlans at device startup may happen in the destinati=
on of
> > > > a live migration, so this configuration must be restored.
> > > >
> > > > At this moment the code is not accessible, since SVQ refuses to sta=
rt if
> > > > vlan feature is exposed by the device.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++=
--
> > > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 4bc3fd01a8..ecbfd08eb9 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
=3D
> > > >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > >      BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > >
> > > > +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > > > +
> > > >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > >  {
> > > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPASta=
te *s,
> > > >      return *s->status !=3D VIRTIO_NET_OK;
> > > >  }
> > > >
> > > > +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> > > > +                                           const VirtIONet *n,
> > > > +                                           uint16_t vid)
> > > > +{
> > > > +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_=
CTRL_VLAN,
> > > > +                                                  VIRTIO_NET_CTRL_=
VLAN_ADD,
> > > > +                                                  &vid, sizeof(vid=
));
> > > > +    if (unlikely(dev_written < 0)) {
> > > > +        return dev_written;
> > > > +    }
> > > > +
> > > > +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> > > > +                                    const VirtIONet *n)
> > > > +{
> > > > +    uint64_t features =3D n->parent_obj.guest_features;
> > > > +
> > > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> > > > +        return 0;
> > > > +    }
> > > > +
> > > > +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> > > > +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> > > > +            if (n->vlans[i] & (1U << j)) {
> > > > +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, (i=
 << 5) + j);
> > >
> > > This seems to cause a lot of latency if the driver has a lot of vlans=
.
> > >
> > > I wonder if it's simply to let all vlan traffic go by disabling
> > > CTRL_VLAN feature at vDPA layer.
> >
>
> The guest will not be able to recover that vlan configuration.

Spec said it's best effort and we actually don't do this for
vhost-net/user for years and manage to survive.

>
> > Another idea is to extend the spec to allow us to accept a bitmap of
> > the vlan ids via a single command, then we will be fine.
> >
>
> I'm not sure if adding more ways to configure something is the answer,
> but I'd be ok to implement it.
>
> Another idea is to allow the sending of many CVQ commands in parallel.
> It shouldn't be very hard to achieve using exposed buffers as ring
> buffers, and it will short down the start of the devices with many
> features.

In the extreme case, what if guests decide to filter all of the vlans?
It means we need MAX_VLAN commands which may exceeds the size of the
control virtqueue.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >
> > > Thanks
> > >
> > > > +                if (unlikely(r !=3D 0)) {
> > > > +                    return r;
> > > > +                }
> > > > +            }
> > > > +        }
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > >  static int vhost_vdpa_net_load(NetClientState *nc)
> > > >  {
> > > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *=
nc)
> > > >      if (unlikely(r)) {
> > > >          return r;
> > > >      }
> > > > -
> > > > -    return 0;
> > > > +    return vhost_vdpa_net_load_vlan(s, n);
> > > >  }
> > > >
> > > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > > > --
> > > > 2.31.1
> > > >
> >
>


