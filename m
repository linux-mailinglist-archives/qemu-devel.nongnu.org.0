Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D363EB7D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:47:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fCk-00058l-MX; Thu, 01 Dec 2022 03:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fCI-00056Z-Od
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:45:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fC4-0007F9-8b
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W30ub+31ugHFrai3M+pIk2IMe4pwCCCPHsxniWlqoNA=;
 b=HeAlwpV7++11vs9eWOZQ1I5lWkCo7wGN1W0SOU2yMnGgbGLptQWUYLwP1n0YY3EtaQtrsR
 Emo8VEvrC48IUkGVc4wcK/5blzJcg0FHWRTDotMrJl+GoAboBd6bL8Wq1I3u6SWg65bi5E
 VfZr3kw0MaGNs0DU5zNWmttP5/nqaDY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374--jBsgvg_MgeWRF9zKBtJxw-1; Thu, 01 Dec 2022 03:45:18 -0500
X-MC-Unique: -jBsgvg_MgeWRF9zKBtJxw-1
Received: by mail-ot1-f70.google.com with SMTP id
 a66-20020a9d2648000000b0066db1bff57eso481581otb.14
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W30ub+31ugHFrai3M+pIk2IMe4pwCCCPHsxniWlqoNA=;
 b=Z+s2zneS9qGBzvKd67mmalq0Mje7hvMQTOKN1GMuHci0oBzOcxMp+LlKrYp1ABwIS5
 iNCBnbs4F6roo4Vve/J9PMUk8LSdgBUHMnaLmbm/vToqQZI391+HBNx31gCQbwIzwKsD
 bQvLquJKLFRbE5jYof0Td3/oEnGFUbLQ8bZeykqMxS6ZzbtKas2Hmk8C6/sfbzXujWbc
 LgVhvgAyAQOtoHPMuWPfIVKUpBuXuBl/VBD318V96G/12Pubrx6Q+deWNU4O7U/OT8DI
 pUmCiVKtSqU+2bFSozf9aUmmCNLhOewgy2kPzdJSPi8qU1Ctay/1IFXpVf2HqzkI+plW
 pMzQ==
X-Gm-Message-State: ANoB5pmhnjE0Dx8+J6teDKw5l15mJKKkHWZbDmf4SVTHDLmriiNiWUij
 o+bTlKo0JArjMa6Rv6Be0XBcHD9+VGQHphiGgVIUV1ksZ6hERSHLGvjzKC5+3WoSKkwZXVfP7QL
 EyXNOF3VZPmO8+xYtvgDh/45jeriGBEo=
X-Received: by 2002:a9d:61ca:0:b0:66e:6d59:b2df with SMTP id
 h10-20020a9d61ca000000b0066e6d59b2dfmr2780185otk.201.1669884317495; 
 Thu, 01 Dec 2022 00:45:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf72xmd65QOUsfdxu+pwjZ4+Fr/69ptUR/h6mPkJMTebq5U3v8/IId5vnkEpyOCm6nZ0bdiixncWk1CeQpooN1c=
X-Received: by 2002:a9d:61ca:0:b0:66e:6d59:b2df with SMTP id
 h10-20020a9d61ca000000b0066e6d59b2dfmr2780180otk.201.1669884317289; Thu, 01
 Dec 2022 00:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20221124155158.2109884-1-eperezma@redhat.com>
 <20221124155158.2109884-7-eperezma@redhat.com>
 <CACGkMEubBA9NYR5ynT_2C=iMEk3fph2GEOBvcw73BOuqiFKzJg@mail.gmail.com>
 <CAJaqyWcR_3vdXLJ4=z+_uaoVN47gEXr7KHx3w6z8HtmqquK7zA@mail.gmail.com>
In-Reply-To: <CAJaqyWcR_3vdXLJ4=z+_uaoVN47gEXr7KHx3w6z8HtmqquK7zA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Dec 2022 16:45:06 +0800
Message-ID: <CACGkMEs3xfGsptV9H+P+O1yjVzo_vugGnS72EwpE8FLECkccpQ@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v8 06/12] vdpa: extract
 vhost_vdpa_svq_allocate_iova_tree
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Nov 30, 2022 at 3:40 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Nov 30, 2022 at 7:43 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Nov 24, 2022 at 11:52 PM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > >
> > > It can be allocated either if all virtqueues must be shadowed or if
> > > vdpa-net detects it can shadow only cvq.
> > >
> > > Extract in its own function so we can reuse it.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  net/vhost-vdpa.c | 29 +++++++++++++++++------------
> > >  1 file changed, 17 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 88e0eec5fa..9ee3bc4cd3 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -240,6 +240,22 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> > >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> > >  };
> > >
> > > +static int vhost_vdpa_get_iova_range(int fd,
> > > +                                     struct vhost_vdpa_iova_range *i=
ova_range)
> > > +{
> > > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > > +
> > > +    return ret < 0 ? -errno : 0;
> > > +}
> >
> > I don't get why this needs to be moved to net specific code.
> >
>
> It was already in net, this code just extracted it in its own function.

Ok, there's similar function that in vhost-vdpa.c:

static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
{
    int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
                              &v->iova_range);
    if (ret !=3D 0) {
        v->iova_range.first =3D 0;
        v->iova_range.last =3D UINT64_MAX;
    }

    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
                                    v->iova_range.last);
}

I think we can reuse that.

Thanks

>
> It's done in net because iova_tree must be the same for all queuepair
> vhost, so we need to allocate before them.
>
> Thanks!
>
> > Thanks
> >
> > > +
> > > +static VhostIOVATree *vhost_vdpa_svq_allocate_iova_tree(int vdpa_dev=
ice_fd)
> > > +{
> > > +    struct vhost_vdpa_iova_range iova_range;
> > > +
> > > +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > +    return vhost_iova_tree_new(iova_range.first, iova_range.last);
> > > +}
> > > +
> > >  static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *add=
r)
> > >  {
> > >      VhostIOVATree *tree =3D v->iova_tree;
> > > @@ -587,14 +603,6 @@ static NetClientState *net_vhost_vdpa_init(NetCl=
ientState *peer,
> > >      return nc;
> > >  }
> > >
> > > -static int vhost_vdpa_get_iova_range(int fd,
> > > -                                     struct vhost_vdpa_iova_range *i=
ova_range)
> > > -{
> > > -    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > > -
> > > -    return ret < 0 ? -errno : 0;
> > > -}
> > > -
> > >  static int vhost_vdpa_get_features(int fd, uint64_t *features, Error=
 **errp)
> > >  {
> > >      int ret =3D ioctl(fd, VHOST_GET_FEATURES, features);
> > > @@ -690,14 +698,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> > >      }
> > >
> > >      if (opts->x_svq) {
> > > -        struct vhost_vdpa_iova_range iova_range;
> > > -
> > >          if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> > >              goto err_svq;
> > >          }
> > >
> > > -        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_ran=
ge.last);
> > > +        iova_tree =3D vhost_vdpa_svq_allocate_iova_tree(vdpa_device_=
fd);
> > >      }
> > >
> > >      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> > > --
> > > 2.31.1
> > >
> >
>


