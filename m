Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A476D01BE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:45:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpl7-0003RW-2J; Thu, 30 Mar 2023 06:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1phpl1-0003LJ-5E
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1phpkx-0006Go-Rc
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680173008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7QgJ0jSvjsrCjkBgEVI2JQir+CqZR7LSTn5B8iNC84=;
 b=ftek/9wqmcDNPjSmzUhY4rZniQ+VpSVXmkAZhPRhlqr6J1H1dGdANOSnx5ahYmvyr0YnIC
 NR0usDxuBY1Li1Q5/JaVJrjPwEo5sIoQSrMtFqcGGbriZrFddPZ4HopuNsVSU98EFtC20D
 O76wZFGdmATJFAADa1toPCwuff/y+KM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-yaIxU-RfMMenK91LvfzJKw-1; Thu, 30 Mar 2023 06:43:26 -0400
X-MC-Unique: yaIxU-RfMMenK91LvfzJKw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-54196bfcd5fso180703697b3.4
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680173006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7QgJ0jSvjsrCjkBgEVI2JQir+CqZR7LSTn5B8iNC84=;
 b=TBW17iHubNM11H+oi/eLirtFJv+o9cnJyWNChTmi2AEnr1ZvGLbUT2+p3MB23hFTep
 Ehqr7mIbZa+qfN8cAJkfCBOWEf3uWaXAAxfPJmkP/goqnkl7WE9Bnh7e/af3kxFC8+rh
 Z4BiIT0rVGQEDdRtjEOPZMdha431RmvKrZwQN3Jdu40r/8uV8/Lr0gSuuoaPYpfbaxAY
 3dCOcF9wlRXRyglqWltiYKmAOKwgf3peFpg6IDFx0XcAJkghngyUiqmBD5yIeJd1cUCn
 gghqSW77nJoI/l5rYCa3yOKOJatzsaxGl5TyYXpkjtkqU5x3IoK/WKfCQ6pA0VVIPQN7
 cRaQ==
X-Gm-Message-State: AAQBX9dUTf+k6x+RM9fYc1M/tG1g0NC/JT3Uj+UEw0xPUdGQv87FV0+S
 yLEpDdmz1zskI1BMbolioUEqUHiQcHHpM5HeK0UkfEBPYcmhwjeRCpwTC6TZGP5jsf7u6e9wepT
 XBwRvupU+5kyOj2YqIUhb3y5cTXzaTkw=
X-Received: by 2002:a25:680e:0:b0:b78:3a15:e6fe with SMTP id
 d14-20020a25680e000000b00b783a15e6femr10874142ybc.2.1680173006192; 
 Thu, 30 Mar 2023 03:43:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzokJjNS1mxp2NCgXqm7jy3lnI9Q0pxuKnypBxcbRs3yPD+7qup9O/h8QRJkGgEl2afdsczPmEailtqtuSy9g=
X-Received: by 2002:a25:680e:0:b0:b78:3a15:e6fe with SMTP id
 d14-20020a25680e000000b00b783a15e6femr10874121ybc.2.1680173005946; Thu, 30
 Mar 2023 03:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
 <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
 <CACGkMEtsc-73+U4ZojrO0J+anb1CdDjbm37i0HZY_fQmiFNNFA@mail.gmail.com>
In-Reply-To: <CACGkMEtsc-73+U4ZojrO0J+anb1CdDjbm37i0HZY_fQmiFNNFA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 30 Mar 2023 12:42:49 +0200
Message-ID: <CAJaqyWeUxm9=Hup58gsBypQXJbeW2BTu3YpV7VDVOA2rXbtPWg@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
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

On Thu, Mar 30, 2023 at 8:23=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Thu, Mar 30, 2023 at 2:20=E2=80=AFPM Jason Wang <jasowang@redhat.com> =
wrote:
> >
> > On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@re=
dhat.com> wrote:
> > >
> > > Evaluating it at start time instead of initialization time may make t=
he
> > > guest capable of dynamically adding or removing migration blockers.
> > >
> > > Also, moving to initialization reduces the number of ioctls in the
> > > migration, reducing failure possibilities.
> > >
> > > As a drawback we need to check for CVQ isolation twice: one time with=
 no
> > > MQ negotiated and another one acking it, as long as the device suppor=
ts
> > > it.  This is because Vring ASID / group management is based on vq
> > > indexes, but we don't know the index of CVQ before negotiating MQ.
> >
> > We need to fail if we see a device that can isolate cvq without MQ but
> > not with MQ.
> >
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > > v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolated
> > > ---
> > >  net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++---------=
--
> > >  1 file changed, 151 insertions(+), 43 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 4397c0d4b3..db2c9afcb3 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
> > >
> > >      /* The device always have SVQ enabled */
> > >      bool always_svq;
> > > +
> > > +    /* The device can isolate CVQ in its own ASID if MQ is negotiate=
d */
> > > +    bool cvq_isolated_mq;
> > > +
> > > +    /* The device can isolate CVQ in its own ASID if MQ is not negot=
iated */
> > > +    bool cvq_isolated;
> >
> > As stated above, if we need a device that cvq_isolated_mq^cvq_isolated
> > =3D=3D true, we need to fail. This may reduce the complexity of the cod=
e?
> >
> > Thanks
>
> Since we are the mediation layer, Qemu can alway choose to negotiate
> MQ regardless whether or not it is supported by the guest. In this
> way, we can have a stable virtqueue index for cvq.
>

I think it is a great idea and it simplifies this patch somehow.
However, we need something like the queue mapping [1] to do so :).

To double confirm:
* If the device supports MQ, only probe MQ. If not, only probe !MQ.
* Only store cvq_isolated in VhostVDPAState.

Now, if the device does not negotiate MQ but the device supports MQ:
* All the requests to queue 3 must be redirected to the last queue in
the device. That includes set_vq_address, notifiers regions, etc.

I'm totally ok to go this route but it's not immediate.

Thanks!

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg07157.html


