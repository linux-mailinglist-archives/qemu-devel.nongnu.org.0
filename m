Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D176D3CEB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 07:34:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjCo6-0003vF-2I; Mon, 03 Apr 2023 01:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pjCo2-0003u4-6x
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 01:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pjCo0-0007dw-9q
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 01:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680499953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dY4+ROuFQjZ0QTuuuAtF0F2oEcC1Wsnh452W6tOVk8s=;
 b=SXT4aaIseV0exKDabo2tHSqIqhArxZZlsy0P4Zeib6WEBH5r+9y5BgEy6xqX7KlaR3ZhWL
 E/HXf/oVV9uZU1ejf0IRG3qX2p47vXEEHgQpLTJ17uD1+qd4N/nnraU4eyJ6Q84n6NetRn
 mpr6n9hVR/MgI9hdZGkCUv0x3CYiSDo=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-5jVL5sm5PqqdzRTrJRIjwA-1; Mon, 03 Apr 2023 01:32:32 -0400
X-MC-Unique: 5jVL5sm5PqqdzRTrJRIjwA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1802c0ae9bbso5443405fac.5
 for <qemu-devel@nongnu.org>; Sun, 02 Apr 2023 22:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680499952; x=1683091952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dY4+ROuFQjZ0QTuuuAtF0F2oEcC1Wsnh452W6tOVk8s=;
 b=E9nOO67bAIa8OvwOisNIoRutCYXBq5A6E6t7ylgMhOaVfwwv6xStii4eo7QqpHkc9V
 m7FespRKydw/yfaafoBZ4Rt5F3mVGvg/cXjK+SbIlxHYoEuQpw9rEW34kZIW+8S723ac
 sDyZw8/0cLwP9OgW/dxhXKqlFBPbSEscw5/Ov4l5T3czOPrzzD4vZBTMkp3c80m6n6LI
 eA46hIlcB4OoiPuuWSSPPrSBfDVmjuDkpIZ1iky/bmAUXe3u5RPIOp/zVnQ+rodayMvB
 UKPNk2MFSeB3oN4sXIIJIcepUc914PoMOG+6r6ET4loEx1Ma/20wVHOX1IElXMCUi5kS
 STDw==
X-Gm-Message-State: AAQBX9f6xG7BxZhuk23VAH5IqA5g2RJjSsyeOZrjPDqai7Io8Oz39qeI
 SliOG1AUyK1677j1h+q30MN0iQIG6XV5kNTXeaO2tn/ramrb7Q8A9AKJVBgTkWa4hn/w4rTMMDM
 uB+tY4tnGFCCxEQ56rWUIb+bc4Z6XPno=
X-Received: by 2002:a9d:5a11:0:b0:6a1:cbc6:f1b3 with SMTP id
 v17-20020a9d5a11000000b006a1cbc6f1b3mr3526622oth.2.1680499951808; 
 Sun, 02 Apr 2023 22:32:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350amvvIQNdFXuF/w0mLzKPjZFyZP7zko512TCdC/k05c1Cko19R1IO5igbc6pBt+THoei8AIiFLBlLQv7dXvahI=
X-Received: by 2002:a9d:5a11:0:b0:6a1:cbc6:f1b3 with SMTP id
 v17-20020a9d5a11000000b006a1cbc6f1b3mr3526602oth.2.1680499951535; Sun, 02 Apr
 2023 22:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
 <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
 <CACGkMEtsc-73+U4ZojrO0J+anb1CdDjbm37i0HZY_fQmiFNNFA@mail.gmail.com>
 <CAJaqyWeUxm9=Hup58gsBypQXJbeW2BTu3YpV7VDVOA2rXbtPWg@mail.gmail.com>
 <0cc19893-f832-f03a-cbb0-19f053ff8aa7@redhat.com>
 <CAJaqyWfk0x0Sym1wZvm5jKPi6EsyQMXFr3Tnb_StxM25uamoTA@mail.gmail.com>
In-Reply-To: <CAJaqyWfk0x0Sym1wZvm5jKPi6EsyQMXFr3Tnb_StxM25uamoTA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 3 Apr 2023 13:32:20 +0800
Message-ID: <CACGkMEvYcO3aC7CQX00POC7+U6w4Rjekeg+rcY70EVRsToaGGg@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
To: Eugenio Perez Martin <eperezma@redhat.com>
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

On Fri, Mar 31, 2023 at 6:12=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Mar 31, 2023 at 10:00=E2=80=AFAM Jason Wang <jasowang@redhat.com>=
 wrote:
> >
> >
> > =E5=9C=A8 2023/3/30 18:42, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Thu, Mar 30, 2023 at 8:23=E2=80=AFAM Jason Wang <jasowang@redhat.c=
om> wrote:
> > >> On Thu, Mar 30, 2023 at 2:20=E2=80=AFPM Jason Wang <jasowang@redhat.=
com> wrote:
> > >>> On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezm=
a@redhat.com> wrote:
> > >>>> Evaluating it at start time instead of initialization time may mak=
e the
> > >>>> guest capable of dynamically adding or removing migration blockers=
.
> > >>>>
> > >>>> Also, moving to initialization reduces the number of ioctls in the
> > >>>> migration, reducing failure possibilities.
> > >>>>
> > >>>> As a drawback we need to check for CVQ isolation twice: one time w=
ith no
> > >>>> MQ negotiated and another one acking it, as long as the device sup=
ports
> > >>>> it.  This is because Vring ASID / group management is based on vq
> > >>>> indexes, but we don't know the index of CVQ before negotiating MQ.
> > >>> We need to fail if we see a device that can isolate cvq without MQ =
but
> > >>> not with MQ.
> > >>>
> > >>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>>> ---
> > >>>> v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolat=
ed
> > >>>> ---
> > >>>>   net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++-----=
------
> > >>>>   1 file changed, 151 insertions(+), 43 deletions(-)
> > >>>>
> > >>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > >>>> index 4397c0d4b3..db2c9afcb3 100644
> > >>>> --- a/net/vhost-vdpa.c
> > >>>> +++ b/net/vhost-vdpa.c
> > >>>> @@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
> > >>>>
> > >>>>       /* The device always have SVQ enabled */
> > >>>>       bool always_svq;
> > >>>> +
> > >>>> +    /* The device can isolate CVQ in its own ASID if MQ is negoti=
ated */
> > >>>> +    bool cvq_isolated_mq;
> > >>>> +
> > >>>> +    /* The device can isolate CVQ in its own ASID if MQ is not ne=
gotiated */
> > >>>> +    bool cvq_isolated;
> > >>> As stated above, if we need a device that cvq_isolated_mq^cvq_isola=
ted
> > >>> =3D=3D true, we need to fail. This may reduce the complexity of the=
 code?
> > >>>
> > >>> Thanks
> > >> Since we are the mediation layer, Qemu can alway choose to negotiate
> > >> MQ regardless whether or not it is supported by the guest. In this
> > >> way, we can have a stable virtqueue index for cvq.
> > >>
> > > I think it is a great idea and it simplifies this patch somehow.
> > > However, we need something like the queue mapping [1] to do so :).
> > >
> > > To double confirm:
> > > * If the device supports MQ, only probe MQ. If not, only probe !MQ.
> > > * Only store cvq_isolated in VhostVDPAState.
> > >
> > > Now, if the device does not negotiate MQ but the device supports MQ:
> >
> >
> > I'm not sure I understand here, if device supports MQ it should accepts
> > MQ or we can fail the initialization here.
> >
>
> My fault, I wanted to say "if the device offers MQ but the driver does
> not acks it".
>
> >
> > > * All the requests to queue 3 must be redirected to the last queue in
> > > the device. That includes set_vq_address, notifiers regions, etc.
> >
> >
> > This also means we will only mediate the case:
> >
> > 1) Qemu emulated virtio-net has 1 queue but device support multiple que=
ue
> >
> > but not
> >
> > 2) Qemu emulated virtio-net has M queue but device support N queue (N>M=
)
> >
>
> Right.
>
> >
> > >
> > > I'm totally ok to go this route but it's not immediate.
> >
> >
> > Yes but I mean, we can start from failing the device if
> > cvq_isolated_mq^cvq_isolated =3D=3D true
> >
>
> So probe the two cases but set VhostVDPAState->cvq_isolated =3D
> cvq_isolated && cvq_mq_isolated then? No map involved that way, and
> all parents should behave that way.
>
> > (or I wonder if we can meet this condition for any existing parents).
>
> I don't think so, but I think we need to probe the two anyway.
> Otherwise we may change the dataplane asid too.

Just to make sure we are at the same page, I meant we could fail the
initialization of vhost-vDPA is the device:

1) can isolate cvq in the case of singqueue but not multiqueue

or

2) can isolate cvq in the case of multiqueue but not single queue

Because I don't think there are any parents that have such a buggy
implementation.

Thanks

>
> Thanks!
>


