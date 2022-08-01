Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E396586604
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 10:09:45 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQUh-0006XS-6d
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 04:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIQOK-0004Gp-Oj
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIQOG-0005S3-NY
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659340982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzWrGyrBnCRfJmLYE3x1rC5LOGlmZ8fsg3cSruvLgs0=;
 b=Hg0fnbu7v7xHqM66l62f1VqzQWY+KOsoG3E7K2NUgpwNkp+JHQpYsdhlAuuSs+8thriy69
 ufgzNi02cm8CeDce+WiY+drdozWTiev0UU7JeCmPQCBg4BebcxnOiGWOLh9Ixp7FokJ1Ae
 Q0vh+vMgFNO9/3xcUJHgVYEamR2WJ6c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-j9WV6sN3OIyu89BeFJimFw-1; Mon, 01 Aug 2022 04:03:01 -0400
X-MC-Unique: j9WV6sN3OIyu89BeFJimFw-1
Received: by mail-qk1-f200.google.com with SMTP id
 f20-20020a05620a409400b006b5fc740485so8682612qko.12
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 01:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tzWrGyrBnCRfJmLYE3x1rC5LOGlmZ8fsg3cSruvLgs0=;
 b=rgQGt1nnk/9Im6BeWGB+qoOQ7q6jPu89TZmgZF6LaXdttQusr1JevyWdb0LbW0hbhE
 Oy0jMZSkp9eAYLDlsvMQ82FXIaSTmBuE93xbwi9fur6aaVhiNxV63FvylzhtAcwk++EP
 3o1cfNv2Bdqw5HRgtk0+fcFtenSIRoWUnzR6rVVso41lHUNofj1GHiXjWXL4mi2+4pbj
 YPA61qEmgNtqH/Nn/GpCbalPC0tAGnxUOYkODit++TCGxw+b/uxP7p4fGXQoUs/Do8er
 BioGfPWldVF5N2XUm0CEY6KN5p8CqXUD++vXNESMbSO/AqYncq8Y9iVkHlJ7Bm0I13P8
 AeIQ==
X-Gm-Message-State: ACgBeo1bcI4KIEKf1EvroQ1wvEBiYV4W/C1RZlbfCSfX3fT8Oin7XUtC
 8oVH678f5xJ8IQ82Vo/BgOcXs9MUzH8uAx+mVah4imCQi357DLx7x5CEf44anvepKLI7X6i1wDD
 Qe92Z3jSYWe5G0DW+TLLskIb0TiOEE0c=
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id
 n17-20020a0cbe91000000b0047401d6b1a4mr13114666qvi.108.1659340981244; 
 Mon, 01 Aug 2022 01:03:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6/c2KJIMNuL63if8WLcSQPzxizMBnCSL7rBw3fd+fRr+2O0HYU3wE6EGxDdzt/mKdU/OCNSP3ftpT6SPbXqUY=
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id
 n17-20020a0cbe91000000b0047401d6b1a4mr13114634qvi.108.1659340981003; Mon, 01
 Aug 2022 01:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-5-eperezma@redhat.com>
 <9cbd4657-2c60-be8c-efce-7c2af47398a0@redhat.com>
In-Reply-To: <9cbd4657-2c60-be8c-efce-7c2af47398a0@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 10:02:25 +0200
Message-ID: <CAJaqyWeLVRUP9t6RRJtSm9HxEfoQbA2Xf7B0kZ6PuPRTVCmgLA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] vdpa: add NetClientState->start() callback
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Eric Blake <eblake@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Jul 26, 2022 at 4:53 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/22 19:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > It allows per-net client operations right after device's successful
> > start.
> >
> > Vhost-vdpa net will use it to add the CVQ buffers to restore the device
> > status.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/net/net.h  | 2 ++
> >   hw/net/vhost_net.c | 7 +++++++
> >   2 files changed, 9 insertions(+)
> >
> > diff --git a/include/net/net.h b/include/net/net.h
> > index 523136c7ac..ad9e80083a 100644
> > --- a/include/net/net.h
> > +++ b/include/net/net.h
> > @@ -44,6 +44,7 @@ typedef struct NICConf {
> >
> >   typedef void (NetPoll)(NetClientState *, bool enable);
> >   typedef bool (NetCanReceive)(NetClientState *);
> > +typedef int (NetStart)(NetClientState *);
> >   typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_=
t);
> >   typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec =
*, int);
> >   typedef void (NetCleanup) (NetClientState *);
> > @@ -71,6 +72,7 @@ typedef struct NetClientInfo {
> >       NetReceive *receive_raw;
> >       NetReceiveIOV *receive_iov;
> >       NetCanReceive *can_receive;
> > +    NetStart *start;
>
>
> I think we probably need a better name here. (start should go with
> DRIVER_OK or SET_VRING_ENABLE)
>
> How about load or other (not a native speaker).
>

At this moment, the plan is to call SET_VRING_ENABLE in this function
in the future. But I'm ok to call it load(), maybe it better reflects
the intention of the function.

Thanks!

> Thanks
>
>
> >       NetCleanup *cleanup;
> >       LinkStatusChanged *link_status_changed;
> >       QueryRxFilter *query_rx_filter;
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index ccac5b7a64..ddd9ee0441 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -274,6 +274,13 @@ static int vhost_net_start_one(struct vhost_net *n=
et,
> >               }
> >           }
> >       }
> > +
> > +    if (net->nc->info->start) {
> > +        r =3D net->nc->info->start(net->nc);
> > +        if (r < 0) {
> > +            goto fail;
> > +        }
> > +    }
> >       return 0;
> >   fail:
> >       file.fd =3D -1;
>


