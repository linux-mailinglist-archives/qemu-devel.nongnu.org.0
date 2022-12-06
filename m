Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6B643DA3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:31:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SPu-0000NV-FU; Tue, 06 Dec 2022 02:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2SPS-0000MS-Cg
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:30:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2SPP-00050I-L6
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670311827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgZG+T//1/aIzDbPBGSTvYYN6iyDnKTpZWsoR4pmNxg=;
 b=JXnDm8X0WwZ9n9EWySYwlwMQa/BYqqBnQGbNZqJPrJAtDTviOVvqxgNFTCk9cTPJn1mWni
 cwaoXX7pYjICA/3MYFYC/OtA1M9373kijn1xM2A/lo2jcC8GwSGEuMSSEFe0XlJtil43mP
 VD32pfdUifO6CfmbiKWcjp76EryUhfQ=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-9Rm5-HwkOXS4LPUADXQCOQ-1; Tue, 06 Dec 2022 02:30:26 -0500
X-MC-Unique: 9Rm5-HwkOXS4LPUADXQCOQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-144a21f5c25so2275158fac.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgZG+T//1/aIzDbPBGSTvYYN6iyDnKTpZWsoR4pmNxg=;
 b=5m7uCvd4rOU2iEf9ulpNxfWN75jmVh/2jLAnwYp7RkbtPzYBFgZGj67oytoWHprvbu
 6MMhIr1hSYJheFEoiViU0xU1Bs4F9pRFIS2C9d6N8DaG5XW0sTpFWBVBCtNEJCi+C+P/
 mNC+AVy0L0056KB69tLk7E8SvEEYik6xSLmlxRDKbbXvhbIndNqp+P3e40+dE3/n0F6I
 MZfbRlLTb2xOsrn89k/lapmGg+/8EJKGJeHYTRYiGcxwxDO/ovwn96ahLtJQF6qxXior
 1mAAwoQSX+T+pM05gHKbHcJc48dU2ncX066jWun1ygOTIMwdzvMzzGNy4Oq4ytoWkVbz
 z8tA==
X-Gm-Message-State: ANoB5pntR5KCknpR3Dwpkte2/darsqbnSuZUQp812jtXEWZ3F1PyGtoZ
 VL1Y06D+7FsufpGL1uCZcvJhIBG3MYsRQqoyjDlWXc6cplxAEp1hY0znIUC+2/iwp3Ion3RXGD6
 gGjWfLOxw45ZsylaQXhuUTN1ErMOByDc=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr42932886otb.237.1670311825307; 
 Mon, 05 Dec 2022 23:30:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf45Tg2Qh3BTYNf9lHxDOngvKk63faAP8ohUmpugSAQ7vWLuvVnvQSd1RY9Sj/LzGnatwjzS6TB5q7R0f+CjGag=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr42932879otb.237.1670311825085; Mon, 05
 Dec 2022 23:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
 <CACGkMEsOJuOM8JW83Ly+b3ZvfAhnOj61CvVz2SeLeLEkpT446Q@mail.gmail.com>
 <CAJaqyWfTp6QT1amL_724+UN_APgkG+dM28OEHE99v6aojSPU6A@mail.gmail.com>
 <CACGkMEsVN4jHkLojKekB1OAEvoTzMJzv+m4HNR6T8qJUC9VjTQ@mail.gmail.com>
 <CAJaqyWdX83jFpGy_qZ8d_07fvaVHJk3TqamoS7NVgkqJjX2X8g@mail.gmail.com>
 <CACGkMEs79=D7CEcRV7SEjLBxArerPDaC2eTodCkrCPcq8oj_Tg@mail.gmail.com>
 <CAJaqyWfuAJXChmPu57W9NDz6gCaYnbyBGf-2H7=dzaK2Xix_uA@mail.gmail.com>
In-Reply-To: <CAJaqyWfuAJXChmPu57W9NDz6gCaYnbyBGf-2H7=dzaK2Xix_uA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Dec 2022 15:30:14 +0800
Message-ID: <CACGkMEuxu9dYyQCtCKOTWtCYgW=WObmNLxekCcF4CH-US9CZYg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
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

On Mon, Dec 5, 2022 at 9:07 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Mon, Dec 5, 2022 at 5:27 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Dec 1, 2022 at 5:29 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Thu, Dec 1, 2022 at 9:39 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > > On Wed, Nov 30, 2022 at 3:07 PM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Wed, Nov 30, 2022 at 8:02 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > > > > >
> > > > > > On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@re=
dhat.com> wrote:
> > > > > > >
> > > > > > > Since this capability is emulated by qemu shadowed CVQ cannot=
 forward it
> > > > > > > to the device. Process all that command within qemu.
> > > > > > >
> > > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > > ---
> > > > > > >  net/vhost-vdpa.c | 15 ++++++++++++---
> > > > > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > > > index 2b4b85d8f8..8172aa8449 100644
> > > > > > > --- a/net/vhost-vdpa.c
> > > > > > > +++ b/net/vhost-vdpa.c
> > > > > > > @@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_av=
ail(VhostShadowVirtqueue *svq,
> > > > > > >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, =
0,
> > > > > > >                               s->cvq_cmd_out_buffer,
> > > > > > >                               vhost_vdpa_net_cvq_cmd_len());
> > > > > > > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, s=
izeof(status));
> > > > > > > -    if (unlikely(dev_written < 0)) {
> > > > > > > -        goto out;
> > > > > > > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_=
CTRL_ANNOUNCE) {
> > > > > > > +        /*
> > > > > > > +         * Guest announce capability is emulated by qemu, so=
 dont forward to
> > > > > >
> > > > > > s/dont/don't/
> > > > > >
> > > > >
> > > > > I'll correct it, thanks!
> > > > >
> > > > > > > +         * the device.
> > > > > > > +         */
> > > > > > > +        dev_written =3D sizeof(status);
> > > > > > > +        *s->status =3D VIRTIO_NET_OK;
> > > > > >
> > > > > > I wonder if we should avoid negotiating ANNOUNCE with vDPA pare=
nts if
> > > > > > we do this?
> > > > > >
> > > > >
> > > > > I can re-check, but the next patch should avoid it.
> > > >
> > > > Kind of, it makes sure guest can always see _F_ANNOUNCE. But does i=
t
> > > > prevent _F_ANNOUNCE from being negotiated?
> > > >
> > >
> > > It should go like:
> > > * vhost_net_ack_features calls vhost_ack_features with feature_bits =
=3D
> > > vdpa_feature_bits and features =3D guest acked features.
> > > vhost_ack_features stores in hdev->acked_features only the features
> > > that met features & bit_mask, so it will not store _F_ANNOUNCE.
> > > * vhost_vdpa_set_features is called from vhost_dev_set_features with
> > > features =3D dev->acked_features. Both functions can add features by
> > > themselves (VHOST_F_LOG_ALL, VIRTIO_F_IOMMU_PLATFORM), but no
> > > _F_ANNOUNCE.
> > >
> > > Still untested.
> >
> > Ok.
> >
> > >
> > > > > Even if
> > > > > negotiated, the parent should never set the announce status bit, =
since
> > > > > we never tell the device is a destination device.
> > > >
> > > > That's the point, do we have such a guarantee? Or I wonder if there=
's
> > > > any parent that supports _F_ANNOUNCE if yes, how it is supposed to
> > > > work?
> > > >
> > >
> > > At the moment it is impossible to work since there is no support for
> > > config interrupt from the device. Even with config interrupt,
> > > something external from qemu should make the device enable the status
> > > bit, since the current migration protocol makes no difference between
> > > to be a migration destination and to start the device from scratch.
> > > Unless it enables the bit maliciously or by mistake.
> > >
> > > Just for completion, the current method works with no need of vdpa
> > > device config interrupt support thanks to being 100% emulated in qemu=
,
> > > which has the support of injecting config interrupts.
> >
> > Ok, rethink this feature, I think I can find one use case for
> > _F_ANNOUNCE, that is, the migration is totally done through the vDPA
> > device (DPU) itself.
> >
>
> To make sure we are on the same page, this migration would save some
> things like transfer the status through qemu, but it is not possible
> at the moment. A few things need to be developed for that to make it
> possible.

Somehow, it means the DPU is in charge of doing all the migration.

>
> The default behavior is to emulate the announce feature / status bit
> at the moment, so no ack to the device is needed. If we want that
> passthrough, a new parameter or similar needs to be developed, so the
> feature is negotiated with the device and not emulated in get_config.
>
> Is that accurate?

Yes.

Thanks

>
> Thanks!
>
> > I think we can go forward and revisit this issue in the future.
> >
> > Thanks
> >
> > >
> > > Thanks!
> > >
> >
>


