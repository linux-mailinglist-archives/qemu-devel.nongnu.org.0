Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74764223C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 05:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p231x-0002d8-9P; Sun, 04 Dec 2022 23:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p231v-0002a0-5y
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p231t-0002tH-Js
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670214272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8n5fxGwWYcu15nmomTbV4cNBstkBFYb9k2K8ul1sbM=;
 b=B2n3lHoY1nvAyhyK3X+riPX6XoVd3gQknYrI1hDT+slpkGEV78mwgdVqaou5TBeR8mSYZI
 tGyK7gaJnErDWngM+LQLw4FX3tKBFVjbCon4jIR1ocOszmVpBnDHryOtXeeoGN/BP4nXlS
 pcQtcjYPwDuOBXTojPeCsZ51GTJAClM=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-CeGQWxAmOAC-p4vRdDKbNg-1; Sun, 04 Dec 2022 23:24:25 -0500
X-MC-Unique: CeGQWxAmOAC-p4vRdDKbNg-1
Received: by mail-ot1-f71.google.com with SMTP id
 l5-20020a9d7a85000000b0066ec7926f9cso738605otn.18
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 20:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8n5fxGwWYcu15nmomTbV4cNBstkBFYb9k2K8ul1sbM=;
 b=17C9x5c2lXyp0sY4RyLp/vfCUpbtJEFKwp8KjQDqVZG55PU/JT8Fef5i3P+sZS8DIs
 O8QYrw7+GU+K3ZJIkdN689IHNxXNO8qUoIqbIEZXVLvXR/z9b6GfkjNx4NPfVFS7FxP1
 isUvOeZqmHAsHJ0UKvTO8fbHfEfurWX9p55J2Wuij2oz0EAau51RSKILC7Gmq6RLGag4
 mzYQuuBfPweNMNxZ9Y11bcF7D5hB1Kw/tzb2+Owrk7MVr6oRsNbsjWY/HGEUh7QWz4CU
 2R/sTe1jGTCVsJhnhCVryEvF0VYJ5vFa2XicrENHisXfbTlwPrnn780CTrgGxJoFQhNa
 glXQ==
X-Gm-Message-State: ANoB5pnBXsR5/M7v9SIAKN+vwn6Vqw0AFLGIUKbBVoGKutvy4gE/OiQc
 B6H0Gra5aUSv2M69Cq1oYO1WK1cX1ivKkxFxIVk5j8huabuzOBbv8R+y/KDC6enpmJC1ksrhN2L
 1LgDgyXlWS6kUoSECm46Xdg8d8P+QOHI=
X-Received: by 2002:a9d:61ca:0:b0:66e:6d59:b2df with SMTP id
 h10-20020a9d61ca000000b0066e6d59b2dfmr10522449otk.201.1670214264939; 
 Sun, 04 Dec 2022 20:24:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4RmLbd7rUQksRMHkj9ik2O62qZVkkYm6Hly+Fv/Xv8q2NeYMX08gt01mq3ZbeT9soaY3c9pKmYRi9xo7xo4Uo=
X-Received: by 2002:a9d:61ca:0:b0:66e:6d59:b2df with SMTP id
 h10-20020a9d61ca000000b0066e6d59b2dfmr10522436otk.201.1670214264729; Sun, 04
 Dec 2022 20:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20221124155158.2109884-1-eperezma@redhat.com>
 <20221124155158.2109884-7-eperezma@redhat.com>
 <CACGkMEubBA9NYR5ynT_2C=iMEk3fph2GEOBvcw73BOuqiFKzJg@mail.gmail.com>
 <CAJaqyWcR_3vdXLJ4=z+_uaoVN47gEXr7KHx3w6z8HtmqquK7zA@mail.gmail.com>
 <CACGkMEs3xfGsptV9H+P+O1yjVzo_vugGnS72EwpE8FLECkccpQ@mail.gmail.com>
 <CAJaqyWemta-dmaqaVphqn=riEiVrVsm5K5nSZYxBZVY6Zt8Eow@mail.gmail.com>
In-Reply-To: <CAJaqyWemta-dmaqaVphqn=riEiVrVsm5K5nSZYxBZVY6Zt8Eow@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 5 Dec 2022 12:24:13 +0800
Message-ID: <CACGkMEs=6fv-DG_bvbMpu2xwj9s_neBcm=CqKnOArVE4_z-yHA@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Dec 1, 2022 at 5:50 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Dec 1, 2022 at 9:45 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 3:40 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Wed, Nov 30, 2022 at 7:43 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Thu, Nov 24, 2022 at 11:52 PM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> > > > >
> > > > > It can be allocated either if all virtqueues must be shadowed or =
if
> > > > > vdpa-net detects it can shadow only cvq.
> > > > >
> > > > > Extract in its own function so we can reuse it.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  net/vhost-vdpa.c | 29 +++++++++++++++++------------
> > > > >  1 file changed, 17 insertions(+), 12 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 88e0eec5fa..9ee3bc4cd3 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -240,6 +240,22 @@ static NetClientInfo net_vhost_vdpa_info =3D=
 {
> > > > >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> > > > >  };
> > > > >
> > > > > +static int vhost_vdpa_get_iova_range(int fd,
> > > > > +                                     struct vhost_vdpa_iova_rang=
e *iova_range)
> > > > > +{
> > > > > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range)=
;
> > > > > +
> > > > > +    return ret < 0 ? -errno : 0;
> > > > > +}
> > > >
> > > > I don't get why this needs to be moved to net specific code.
> > > >
> > >
> > > It was already in net, this code just extracted it in its own functio=
n.
> >
> > Ok, there's similar function that in vhost-vdpa.c:
> >
> > static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > {
> >     int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> >                               &v->iova_range);
> >     if (ret !=3D 0) {
> >         v->iova_range.first =3D 0;
> >         v->iova_range.last =3D UINT64_MAX;
> >     }
> >
> >     trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> >                                     v->iova_range.last);
> > }
> >
> > I think we can reuse that.
> >
>
> That's right, but I'd do the reverse: I would store iova_min, iova_max
> in VhostVDPAState and would set it to vhost_vdpa at
> net_vhost_vdpa_init. That way, we only have one ioctl call at the
> beginning instead of having (#vq pairs + cvq) calls each time the
> device starts. I can send it in a new change if you see it ok.
>
> There are a few functions like that we can reuse in net/. To get the
> features and the backend features are two other examples. Even if we
> don't cache them since device initialization mandates the read, we
> could reduce code duplication that way.
>
> However, they use vhost_dev or vhost_vdpa instead of directly the file
> descriptor. Not a big deal but it's an extra step.
>
> What do you think?

I'm fine with this.

Thanks

>
> Thanks!
>


