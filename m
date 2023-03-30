Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9136CFB76
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 08:25:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phlhR-0003v5-Fm; Thu, 30 Mar 2023 02:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phlhQ-0003uu-3V
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:23:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phlhO-0002KW-Jl
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680157429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcpT7i4pAPirtPzApmM0g3ToxEzEQhFnpKo8xhl3i04=;
 b=bM85ZOLPxtofk7mcYWcFc6WYw+/7J+9EH1GsaWv86wMbQtNOJefB1tEs0o3WqPz3/ddHv0
 uFu+O4azpZssMwwTyptBO76sx3OG1NC5nOOEu0w15FmM7XA4n5i6QZ04hDla3pNerEQYNL
 KJHNrboQCcbkdIkV2tA8/nCC28eSzBM=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-34AbS3DGN2mcrhSjLFb3jg-1; Thu, 30 Mar 2023 02:23:47 -0400
X-MC-Unique: 34AbS3DGN2mcrhSjLFb3jg-1
Received: by mail-oo1-f69.google.com with SMTP id
 u16-20020a4ad0d0000000b005374bfedd1fso4928381oor.11
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 23:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680157426; x=1682749426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcpT7i4pAPirtPzApmM0g3ToxEzEQhFnpKo8xhl3i04=;
 b=KyrscjZf1Zs5T/OndyhpycxnqMgNXcLwgu3hXofmNbInJJe3upJ36faOxrJA1qDae2
 MgvHR53pcgt7mkspL3bcvdqnyEri7pVvtLIO6eC1tlwLTu+FWkkPSqThgE1gglFdSd+/
 k6eID9bz8p8N1RSluQy12FtpR7M/BMeaqINOaT96PcqSf4zxP7n/tbuoy7UuAPBnREHc
 4FccVzEQPncViw+DTsb+clqW2Fqb8BF/rPAevyT1JdKmX3fi+ErnBOuuTi1k3Sh0btHi
 frvKaRNHB7cCO9WFwCrc6c85HyG2Zt0xPzMqdLIlJ8uBBBa9gn0cM/zjxgKmaFWN/tde
 KnHg==
X-Gm-Message-State: AAQBX9cP8fq5r4jZ5cve3sZZcm08yFdqrVfnowfnRM2nxdHkpQ6RibQH
 6BE+MGMlnL9janmJkxLsAU9KhYCr03jAS6psITmpgJItJM9e8sfIzYY38CqzbEuCN/bmamH/JT2
 4QsWFNQc9Nipsn7dIzu93J3j5oj5vNW8=
X-Received: by 2002:a05:6830:119:b0:69f:15f4:aa8 with SMTP id
 i25-20020a056830011900b0069f15f40aa8mr1589462otp.0.1680157426774; 
 Wed, 29 Mar 2023 23:23:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350aU8XDiHRtktCoVdfOtrphYH1sVqPhxXzRKGRtHFVGRW7J1DBvFhutVWp0baPfKRMHDehYy3CL0pWYtzbQiddc=
X-Received: by 2002:a05:6830:119:b0:69f:15f4:aa8 with SMTP id
 i25-20020a056830011900b0069f15f40aa8mr1589455otp.0.1680157426557; Wed, 29 Mar
 2023 23:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
 <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
In-Reply-To: <CACGkMEu=8tx-5kDh5HRt2bHtL9W=cPODgUeOXXAyRxoOusW5jw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Mar 2023 14:23:35 +0800
Message-ID: <CACGkMEtsc-73+U4ZojrO0J+anb1CdDjbm37i0HZY_fQmiFNNFA@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Mar 30, 2023 at 2:20=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@redh=
at.com> wrote:
> >
> > Evaluating it at start time instead of initialization time may make the
> > guest capable of dynamically adding or removing migration blockers.
> >
> > Also, moving to initialization reduces the number of ioctls in the
> > migration, reducing failure possibilities.
> >
> > As a drawback we need to check for CVQ isolation twice: one time with n=
o
> > MQ negotiated and another one acking it, as long as the device supports
> > it.  This is because Vring ASID / group management is based on vq
> > indexes, but we don't know the index of CVQ before negotiating MQ.
>
> We need to fail if we see a device that can isolate cvq without MQ but
> not with MQ.
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolated
> > ---
> >  net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 151 insertions(+), 43 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 4397c0d4b3..db2c9afcb3 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
> >
> >      /* The device always have SVQ enabled */
> >      bool always_svq;
> > +
> > +    /* The device can isolate CVQ in its own ASID if MQ is negotiated =
*/
> > +    bool cvq_isolated_mq;
> > +
> > +    /* The device can isolate CVQ in its own ASID if MQ is not negotia=
ted */
> > +    bool cvq_isolated;
>
> As stated above, if we need a device that cvq_isolated_mq^cvq_isolated
> =3D=3D true, we need to fail. This may reduce the complexity of the code?
>
> Thanks

Since we are the mediation layer, Qemu can alway choose to negotiate
MQ regardless whether or not it is supported by the guest. In this
way, we can have a stable virtqueue index for cvq.

Thanks


