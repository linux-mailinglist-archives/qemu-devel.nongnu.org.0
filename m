Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D023260F0C6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:56:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwn9-0001JD-H3; Thu, 27 Oct 2022 02:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onwn1-0001CU-82
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onwml-0006Fh-Vg
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666853676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=um7V3PnEgPVO+LZ8Lc5wUOEN407J5CnAC2iBWnpGTns=;
 b=a7k/Ho2X/LDY6FiNLpuKP/IRV+VAu3ixS1Q4sTsJHHJ/cNx/kmKdsaf/oEUwTEFLeEsE4v
 0vN3jPDwmkoQ1cGFzdr6HSmlQKGDlbTG5C87x1kg1/r5IUgmBpJwlm7osrqfM357TCg7Fk
 PGRwfzqwfobXBydR6u8iCNCKgeaZThc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-N3_OBRPFNMq5gPqML-_DMQ-1; Thu, 27 Oct 2022 02:54:35 -0400
X-MC-Unique: N3_OBRPFNMq5gPqML-_DMQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 a22-20020a0568300b9600b0065c0cef3662so297909otv.14
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=um7V3PnEgPVO+LZ8Lc5wUOEN407J5CnAC2iBWnpGTns=;
 b=7g1ccGi6Qw/NJVg4lGier3pAbp4KzXUQpwUw2GKrIlI3a3KTu2nMFj8prGqKmRg6Ax
 bRSW9hPkml+MFTDmQ+hhqZllHWscoWAn27c+r82lagyRf7/frrOmt6x3D4KxFGif0kdj
 1q7A+ZdqXPvTAnazLOPuHpceCxQM/h0/9pUTkJh4SLJilPkqfHtbekmJvtDq6CbDc6Cd
 a39brbJkqqNflfjyFn0oVdOUJS33OXoMD67g4Q7LFGU02RWNZ9V3mgw7sSeWCJARdoyv
 UapBPEF9XcudRr8UVFH55Lp84/sqoC785GoHN+0hvsXJKH2xo2id//06g6IsxZZa5jys
 b18Q==
X-Gm-Message-State: ACrzQf0ReDTcPvrUTtZptNYKTraaCDt5D/Oy2nvx0xJJKzH+UOU0QIUN
 bLIx86mOqcD+L+iJcqsLXR1f/FIvwY63uDnUP2ES8ohyVMdPhSvc4j73skgzEPZdCBqal1i5wj4
 86ee8oUaYgW3z8aY74gDABgNNLB2gElo=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr4543961oab.280.1666853673429; 
 Wed, 26 Oct 2022 23:54:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SiDABFZNETYAeJP2g8JlaquAjUxfiRgPBLQ4mSQdIwSoEG8zcGDrERC8+UGAPwHuVmz4YSegbD8glITqpQPQ=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr4543942oab.280.1666853673204; Wed, 26
 Oct 2022 23:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
 <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
 <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
In-Reply-To: <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 27 Oct 2022 14:54:21 +0800
Message-ID: <CACGkMEuv2zNLAr_BxPcQ3RCH5S91bm6sJFvhL7QetJNXaM_FmQ@mail.gmail.com>
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
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 27, 2022 at 2:47 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > Now that qemu can handle and emulate it if the vdpa backend does not
> > > support it we can offer it always.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> >
> > I may miss something but isn't more easier to simply remove the
> > _F_STATUS from vdpa_feature_bits[]?
> >
>
> How is that? if we remove it, the guest cannot ack it so it cannot
> access the net status, isn't it?

My understanding is that the bits stored in the vdpa_feature_bits[]
are the features that must be explicitly supported by the vhost
device. So if we remove _F_STATUS, Qemu vhost code won't validate if
vhost-vdpa device has this support:

uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits=
,
                            uint64_t features)
{
    const int *bit =3D feature_bits;
    while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
        uint64_t bit_mask =3D (1ULL << *bit);
        if (!(hdev->features & bit_mask)) {
            features &=3D ~bit_mask;
        }
        bit++;
    }
    return features;
}

Thanks



>
> The goal with this patch series is to let the guest access the status
> always, even if the device doesn't support _F_STATUS.
>
> > Thanks
> >
> >
> > > ---
> > >   include/net/vhost-vdpa.h |  1 +
> > >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> > >   net/vhost-vdpa.c         |  3 +++
> > >   3 files changed, 18 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> > > index b81f9a6f2a..cfbcce6427 100644
> > > --- a/include/net/vhost-vdpa.h
> > > +++ b/include/net/vhost-vdpa.h
> > > @@ -17,5 +17,6 @@
> > >   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
> > >
> > >   extern const int vdpa_feature_bits[];
> > > +extern const uint64_t vhost_vdpa_net_added_feature_bits;
> > >
> > >   #endif /* VHOST_VDPA_H */
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index d28f8b974b..7c15cc6e8f 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -109,10 +109,22 @@ static const int *vhost_net_get_feature_bits(st=
ruct vhost_net *net)
> > >       return feature_bits;
> > >   }
> > >
> > > +static uint64_t vhost_net_add_feature_bits(struct vhost_net *net)
> > > +{
> > > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA) {
> > > +        return vhost_vdpa_net_added_feature_bits;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >   uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t fea=
tures)
> > >   {
> > > -    return vhost_get_features(&net->dev, vhost_net_get_feature_bits(=
net),
> > > -            features);
> > > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > > +                                      vhost_net_get_feature_bits(net=
),
> > > +                                      features);
> > > +
> > > +    return ret | vhost_net_add_feature_bits(net);
> > >   }
> > >   int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
> > >                            uint32_t config_len)
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 6d64000202..24d2857593 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_features =3D
> > >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> > >
> > > +const uint64_t vhost_vdpa_net_added_feature_bits =3D
> > > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > > +
> > >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > >   {
> > >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >
>


