Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B39589909
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:11:35 +0200 (CEST)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVx8-0001Vl-IQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVfx-0004dj-HA
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVfu-000787-OF
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659599626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5pJ4vT8W9lschBMc1OdFDNJ7KAv4QhAYE1/fksJYk8=;
 b=cBgRCwx9bcagRUXPd2Rc+hI6I/4wmPVh79G0mjXH0FtmqKm2nbEpFMhAcsr4Tbo4IkWs68
 a98ftMaIjVJgrbKIRjdYn2t/i3+lrCmikinNdOQEkZ3cW9MQQpe2ffHJ3usCDJcDLGiz06
 BefJP45HAfUmFC/gUxNNTzeyBKFC4eo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-pYf5Y5_-O6qZEW98cy2DWw-1; Thu, 04 Aug 2022 03:53:44 -0400
X-MC-Unique: pYf5Y5_-O6qZEW98cy2DWw-1
Received: by mail-lj1-f199.google.com with SMTP id
 z7-20020a2ebe07000000b0025e5c7d6a2eso2133501ljq.20
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p5pJ4vT8W9lschBMc1OdFDNJ7KAv4QhAYE1/fksJYk8=;
 b=TJzzugvOnORVVaWt8npnMyCJvxFSseDjC/wdr+Mv2e6f80NzO4uWR3zWO8PzH4xnRd
 4230hs8fiPGIU3GB1moYKOud8S9wlW4sNy+nhtSZR3M1ydPkhQQ7OszU8I5Fpo2SKtVo
 kh+wJI/w/fyIC45kGzUvOEg35qVgzB/0uJKo90WMwRFyxjLTElksbRKHFCNhgauNPxmD
 XE2OkOWeLzXmbTcUfLVygS/WhU7MO4XFexS47eDC/4hEh5wPSWsljA/ZGVpPhOOtm6Av
 mbZqNhssOSHEgGruTTkQPFPHiHIDHm4CTJNwnP0LU49s8v6fd5OVCh04UqrEHwLQtM1u
 GVjQ==
X-Gm-Message-State: ACgBeo1WEHKpIYYJT1CRcZL1JUy6gcCcgqyVRDeEoOz+/T9ETux8rbZx
 O29Br7+rs084Km+fGRS5J5XmFHgDncjE4Ab8RusQppNIM0bqIUbYDBKNlYm1Vx30NhQ6eZLd8k0
 hPKTS/aGxvfXA8IpxTwch/04od7qEAkg=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr192300ljq.496.1659599623415; 
 Thu, 04 Aug 2022 00:53:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77h50JZbDLdow9b/rL2hz22Xc6xmVQDqQR5Tp3yI2A4iDS/sL66r+cEBOc3mtCs6y2407g9U5Fb2iXzox6dxw=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr192281ljq.496.1659599623181; Thu, 04 Aug
 2022 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220803171821.481336-1-eperezma@redhat.com>
 <20220803171821.481336-7-eperezma@redhat.com>
 <c25c142f-ad9d-a5cf-9837-5570d563ad07@redhat.com>
 <CAJaqyWd8ddjFLk=C=Mw_6o2=+0w=ior5fvCV2jSMx7LodVnmAA@mail.gmail.com>
In-Reply-To: <CAJaqyWd8ddjFLk=C=Mw_6o2=+0w=ior5fvCV2jSMx7LodVnmAA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Aug 2022 15:53:26 +0800
Message-ID: <CACGkMEuDm1uACYL+NgKw9BEo1UpKRb0CoDh04SZeUuNbGTbJAA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] vhost_net: Add NetClientInfo prepare callback
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm list <kvm@vger.kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, Aug 4, 2022 at 3:52 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Aug 4, 2022 at 6:46 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/8/4 01:18, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > This is used by the backend to perform actions before the device is
> > > started.
> > >
> > > In particular, vdpa will use it to isolate CVQ in its own ASID if
> > > possible, and start SVQ unconditionally only in CVQ.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   include/net/net.h  | 2 ++
> > >   hw/net/vhost_net.c | 4 ++++
> > >   2 files changed, 6 insertions(+)
> > >
> > > diff --git a/include/net/net.h b/include/net/net.h
> > > index a8d47309cd..efa6448886 100644
> > > --- a/include/net/net.h
> > > +++ b/include/net/net.h
> > > @@ -44,6 +44,7 @@ typedef struct NICConf {
> > >
> > >   typedef void (NetPoll)(NetClientState *, bool enable);
> > >   typedef bool (NetCanReceive)(NetClientState *);
> > > +typedef void (NetPrepare)(NetClientState *);
> > >   typedef int (NetLoad)(NetClientState *);
> > >   typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, siz=
e_t);
> > >   typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iove=
c *, int);
> > > @@ -72,6 +73,7 @@ typedef struct NetClientInfo {
> > >       NetReceive *receive_raw;
> > >       NetReceiveIOV *receive_iov;
> > >       NetCanReceive *can_receive;
> > > +    NetPrepare *prepare;
> > >       NetLoad *load;
> > >       NetCleanup *cleanup;
> > >       LinkStatusChanged *link_status_changed;
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index a9bf72dcda..bbbb6d759b 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -244,6 +244,10 @@ static int vhost_net_start_one(struct vhost_net =
*net,
> > >       struct vhost_vring_file file =3D { };
> > >       int r;
> > >
> > > +    if (net->nc->info->prepare) {
> > > +        net->nc->info->prepare(net->nc);
> > > +    }
> >
> >
> > Any chance we can reuse load()?
> >
>
> We would be setting the ASID of CVQ after DRIVER_OK, vring
> addresses... if we move to load.

Ok, then this patch should be fine.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > > +
> > >       r =3D vhost_dev_enable_notifiers(&net->dev, dev);
> > >       if (r < 0) {
> > >           goto fail_notifiers;
> >
>


