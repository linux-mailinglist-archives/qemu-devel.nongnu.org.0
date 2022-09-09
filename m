Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D242C5B2F40
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 08:46:32 +0200 (CEST)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWXmZ-0000pg-Ui
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 02:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWXh8-0005GV-VL
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWXh7-0006fe-1g
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662705652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVojTNZ5lw2rZWteFnN3HLX6a7odX/tg6hwwPwgmehA=;
 b=M+KtMO5kDRNnWV2pp4xLV/BQiJaPJyhrVlPbCmCB74uUKy7QuLd9qC3ZUQEmSlV7YTpGS1
 3O6xecDc2kJiC0yB2ooQJwOF5NpviuK00TilU1fwHTihz6rDkwRkAB2M4HeukrOMxi1Cj5
 stpdiiTDpudROVQw6foV2nEgLSg1YEY=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-X51lBY6pOgGvlspdtW4rxQ-1; Fri, 09 Sep 2022 02:40:50 -0400
X-MC-Unique: X51lBY6pOgGvlspdtW4rxQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 n8-20020a9f3148000000b0039f22c5b291so273697uab.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 23:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KVojTNZ5lw2rZWteFnN3HLX6a7odX/tg6hwwPwgmehA=;
 b=Wf4WUPx32WMLYEXWCFodSxbi4ovXWYijA/AQHorxTk4iNULfB2hHDN5dkyXBGpLbA7
 73V4c3Q5WyDBLhHNa2FOQc32OkPIUZAqnXtiVkKC6AatZfryPZbpcbZTfd5/VDpSwrZO
 LHZj3JT34FbTCy4Xck+7xWSB83eEbeURpsRJDrjifBJExxQ8qwJ209RtDvpKMDBQ5d2n
 aTPnxzEc2UPF9Z/UVGgNh/RSslbOjc5OPAejsDUgj+j7OlnSkJJGB972ekyigD6QP50o
 a+cxMYL/kROxDbuFqIyqun+IfliwjNH0ujNeUmiys92qJCDXs4QLPHzV7XSSLrZuBpCp
 iVvA==
X-Gm-Message-State: ACgBeo2ljkfbKveS5AmR/greddsOs+jk6qTm8YnpCx9gM8GOIFWcIX8m
 aMuX4cY6n3pOEhJxKGqOBYTVj4ur6mD74r90a9KJKAL3qo4xiixRpRdGGALYa65Lyk9uo4XOnR5
 lK8NQreQ1aWBh+9yrWx+jYnnHEKIBqpk=
X-Received: by 2002:a67:a407:0:b0:390:e5b5:159f with SMTP id
 n7-20020a67a407000000b00390e5b5159fmr4565093vse.72.1662705650305; 
 Thu, 08 Sep 2022 23:40:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6wyYhw8e9JEcRXH+gDqOhbLu29KY9GHvdscumnqWpJ4pmugnFXb80CVwknak+bte4cXeyJEokctZFNjWakI9c=
X-Received: by 2002:a67:a407:0:b0:390:e5b5:159f with SMTP id
 n7-20020a67a407000000b00390e5b5159fmr4565091vse.72.1662705650096; Thu, 08 Sep
 2022 23:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
In-Reply-To: <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Sep 2022 14:40:39 +0800
Message-ID: <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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

On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Sep 7, 2022 at 12:36 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > To have enabled vlans at device startup may happen in the destination o=
f
> > a live migration, so this configuration must be restored.
> >
> > At this moment the code is not accessible, since SVQ refuses to start i=
f
> > vlan feature is exposed by the device.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 44 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 4bc3fd01a8..ecbfd08eb9 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =3D
> >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >      BIT_ULL(VIRTIO_NET_F_STANDBY);
> >
> > +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > +
> >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState *=
s,
> >      return *s->status !=3D VIRTIO_NET_OK;
> >  }
> >
> > +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> > +                                           const VirtIONet *n,
> > +                                           uint16_t vid)
> > +{
> > +    ssize_t dev_written =3D vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL=
_VLAN,
> > +                                                  VIRTIO_NET_CTRL_VLAN=
_ADD,
> > +                                                  &vid, sizeof(vid));
> > +    if (unlikely(dev_written < 0)) {
> > +        return dev_written;
> > +    }
> > +
> > +    if (unlikely(*s->status !=3D VIRTIO_NET_OK)) {
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> > +                                    const VirtIONet *n)
> > +{
> > +    uint64_t features =3D n->parent_obj.guest_features;
> > +
> > +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> > +        return 0;
> > +    }
> > +
> > +    for (int i =3D 0; i < MAX_VLAN >> 5; i++) {
> > +        for (int j =3D 0; n->vlans[i] && j <=3D 0x1f; j++) {
> > +            if (n->vlans[i] & (1U << j)) {
> > +                int r =3D vhost_vdpa_net_load_single_vlan(s, n, (i << =
5) + j);
>
> This seems to cause a lot of latency if the driver has a lot of vlans.
>
> I wonder if it's simply to let all vlan traffic go by disabling
> CTRL_VLAN feature at vDPA layer.

Another idea is to extend the spec to allow us to accept a bitmap of
the vlan ids via a single command, then we will be fine.

Thanks

>
> Thanks
>
> > +                if (unlikely(r !=3D 0)) {
> > +                    return r;
> > +                }
> > +            }
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  static int vhost_vdpa_net_load(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
> >      if (unlikely(r)) {
> >          return r;
> >      }
> > -
> > -    return 0;
> > +    return vhost_vdpa_net_load_vlan(s, n);
> >  }
> >
> >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > --
> > 2.31.1
> >


