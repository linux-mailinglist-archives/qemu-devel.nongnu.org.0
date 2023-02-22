Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5A669EF51
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 08:30:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUjZT-0002YS-1s; Wed, 22 Feb 2023 02:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUjZJ-0002YC-3Y
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:29:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUjZG-00082A-IF
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677050973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZg8mqev84eDMcSr29zdH/7+DvNuqK9Ob1HwjpGo1Q8=;
 b=fmIBse6IzvulW2aAdtz76AWPCf4eT6P0fwpG/EU/GxejrgeEpw8k0g78zLW/LWc1dCKZG1
 1KbBKv58O3AbEM5BWLnFewrK3jLzgJ8OMkPT1NRUvxysQsT7N2CQeq2Kl7ptoYRpM6ofWI
 iL6dZr8qMxhwAlQcHZ14fFEA5BpKN5s=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-e6lBXrnxM6GP4DoHiZHUeg-1; Wed, 22 Feb 2023 02:29:32 -0500
X-MC-Unique: e6lBXrnxM6GP4DoHiZHUeg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-536bf635080so60258867b3.23
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 23:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZg8mqev84eDMcSr29zdH/7+DvNuqK9Ob1HwjpGo1Q8=;
 b=VBMeUTAa6BjQ+4Hq3MOpsGBGy/ipvPOP3if3NW2UoFjWjxZDC/NyIItX1wXWHNtGF1
 ZgHXQECKm7GssCNfisN3c8q8EbEja5c8lKkGd2N2XrtvJ85RoOImuZ2Hy+T+FYkYgCqp
 dKraDuASfWRfpAMRoMW5Nmqm8bcQXaRvt4OR6a0GY2ljRJI7XfgqoHalWcxUToCD/xci
 OxAdXKnH7uKYiP2FHSWNDC1CJRYJd/LAuzEhSdVtap4MKqUkqXh/35TlzW5SAEJqzhXm
 dvxK+UkMGQCVgundfVaU5Gj4rAq9TrF5KPU73YyKEwFEptXjVJsVgjfvgykAq8Gx71St
 +Spw==
X-Gm-Message-State: AO0yUKXgzCzB345f6ZhPYnjNUjY7zr4qB91tY4XNRHIgzTiJ4fChL3u2
 6kuaT0rVPP+qrvay2tfhkW0+9CMOiRSMZtb37c6tDmLvBZEUG45HxIg+B2m+5Qu8C65qcnwHnWt
 jdqRQPRWYEoD6mn8pHU9Q8NWvIxKmu1M=
X-Received: by 2002:a25:9983:0:b0:802:4849:af69 with SMTP id
 p3-20020a259983000000b008024849af69mr2849372ybo.13.1677050972043; 
 Tue, 21 Feb 2023 23:29:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8D7mvbMEsYhL3oAniSsfAxhm4Mbq7dPqSUH0Vs4SQElSDNn48B7ZkS6eJLRXeeTaC/+l6usZjxKHvukEqPjNU=
X-Received: by 2002:a25:9983:0:b0:802:4849:af69 with SMTP id
 p3-20020a259983000000b008024849af69mr2849364ybo.13.1677050971809; Tue, 21 Feb
 2023 23:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-10-eperezma@redhat.com>
 <de141eaa-6cc4-e942-9fff-de4dcee8625f@redhat.com>
In-Reply-To: <de141eaa-6cc4-e942-9fff-de4dcee8625f@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 22 Feb 2023 08:28:55 +0100
Message-ID: <CAJaqyWerBtkw1KxiAThXza0htxV=PkJZGtoAxeHKKd5p_Dq55g@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] vdpa net: block migration if the device has CVQ
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Feb 22, 2023 at 5:01 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Devices with CVQ needs to migrate state beyond vq state.  Leaving this
> > to future series.
>
>
> I may miss something but what is missed to support CVQ/MQ?
>

To restore all the device state set by CVQ in the migration source
(MAC, MQ, ...) before data vqs start. We don't have a reliable way to
not start data vqs until the device [1].

Thanks!

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02652.html

> Thanks
>
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index bca13f97fd..309861e56c 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -955,11 +955,17 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >       }
> >
> >       if (has_cvq) {
> > +        VhostVDPAState *s;
> > +
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                    vdpa_device_fd, i, 1, false,
> >                                    opts->x_svq, iova_range);
> >           if (!nc)
> >               goto err;
> > +
> > +        s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +        error_setg(&s->vhost_vdpa.dev->migration_blocker,
> > +                   "net vdpa cannot migrate with MQ feature");
> >       }
> >
> >       return 0;
>


