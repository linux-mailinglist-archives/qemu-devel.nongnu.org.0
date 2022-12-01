Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA50A63EB47
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:40:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0f6V-0003yM-Co; Thu, 01 Dec 2022 03:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0f6R-0003xn-7f
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:39:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0f6L-00047r-PU
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669883964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swD9k+KJ1mK5VOIBQhoh71pwLDtF0m4aNRcGJGp1yXw=;
 b=fnrofIPYdoQlIBSPADGWA3zgsl+bdiD2xvVTOZDGkf3zwLXCnyLDP0vyjj+7x4rLf1hAOj
 i5qg21Saw4dIBQP/GYYkSLM6TnyedFfV0wgUl8HwakYcv3U0Fz1cyFIKsDly32kW8F1orv
 5zGW102NixYhlLimAxD4NdzHdRXhrVo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-CDqqIqgIOBSxPsx4hn7OYw-1; Thu, 01 Dec 2022 03:39:23 -0500
X-MC-Unique: CDqqIqgIOBSxPsx4hn7OYw-1
Received: by mail-oi1-f200.google.com with SMTP id
 r65-20020acaf344000000b0035a1d791805so773510oih.19
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swD9k+KJ1mK5VOIBQhoh71pwLDtF0m4aNRcGJGp1yXw=;
 b=lfwgMZivAgZxGucWS1wXW/kTpLxzFSb9DtRyQXM2AVs74ZRMf6bvcsZ+B+pb5S1UPb
 VBQMcKr3J8D1f8ah4Ee60ftH3KiP7dXb1c9HAwC/fd/bEuYu0zb9NP7G+cYvdGLxSMEW
 6OqfJ3FROIYpHt2+LOaQJsZ/nRhbOzxg7hDbtkG2Pp2xv/84ef8znyJwGDLPEdsrl3vi
 qsahkzZRwxtAWhvIabUNzzfEs4HFjg3OmZlT52HO4braP0seGfjSbyRYgAfBkst2R3xv
 fIkk135bf7eRu2xlqOorDb3Mesqw77Ph7G8/Wim4JMF2KDX+3eWeaGm8mNr9ZRVoki3z
 PQQg==
X-Gm-Message-State: ANoB5pm9nsS9H1kD9ChwJcqT/s8e70z5l77ml033rjnl3rZVliNcNifw
 2pqgHAfo7hI/Jl91YHYL9E/KG3K2GiEOLtHB2oQu+vkBO9oW8yNxxQzF/83BbA6RF8mx4krqPAb
 Chvsy7oGrCUVC2LYcOoynIsiM7NgM+Sk=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr25964112oab.35.1669883962242; 
 Thu, 01 Dec 2022 00:39:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7o1PCLXv2+Hnikhi2gLqskvFA/LU1QR15Bfw5io3LY87MXccWZo4+NoeDAhVxjgsIV8diLCtb33MHVVSEAHWM=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr25964097oab.35.1669883962022; Thu, 01
 Dec 2022 00:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
 <CACGkMEsOJuOM8JW83Ly+b3ZvfAhnOj61CvVz2SeLeLEkpT446Q@mail.gmail.com>
 <CAJaqyWfTp6QT1amL_724+UN_APgkG+dM28OEHE99v6aojSPU6A@mail.gmail.com>
In-Reply-To: <CAJaqyWfTp6QT1amL_724+UN_APgkG+dM28OEHE99v6aojSPU6A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Dec 2022 16:39:11 +0800
Message-ID: <CACGkMEsVN4jHkLojKekB1OAEvoTzMJzv+m4HNR6T8qJUC9VjTQ@mail.gmail.com>
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

On Wed, Nov 30, 2022 at 3:07 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Nov 30, 2022 at 8:02 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > Since this capability is emulated by qemu shadowed CVQ cannot forward=
 it
> > > to the device. Process all that command within qemu.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  net/vhost-vdpa.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 2b4b85d8f8..8172aa8449 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhos=
tShadowVirtqueue *svq,
> > >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > >                               s->cvq_cmd_out_buffer,
> > >                               vhost_vdpa_net_cvq_cmd_len());
> > > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(st=
atus));
> > > -    if (unlikely(dev_written < 0)) {
> > > -        goto out;
> > > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_ANN=
OUNCE) {
> > > +        /*
> > > +         * Guest announce capability is emulated by qemu, so dont fo=
rward to
> >
> > s/dont/don't/
> >
>
> I'll correct it, thanks!
>
> > > +         * the device.
> > > +         */
> > > +        dev_written =3D sizeof(status);
> > > +        *s->status =3D VIRTIO_NET_OK;
> >
> > I wonder if we should avoid negotiating ANNOUNCE with vDPA parents if
> > we do this?
> >
>
> I can re-check, but the next patch should avoid it.

Kind of, it makes sure guest can always see _F_ANNOUNCE. But does it
prevent _F_ANNOUNCE from being negotiated?

> Even if
> negotiated, the parent should never set the announce status bit, since
> we never tell the device is a destination device.

That's the point, do we have such a guarantee? Or I wonder if there's
any parent that supports _F_ANNOUNCE if yes, how it is supposed to
work?

>
> But it's better to be on the safe side, I'll recheck.

Exactly.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > > +    } else {
> > > +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeo=
f(status));
> > > +        if (unlikely(dev_written < 0)) {
> > > +            goto out;
> > > +        }
> > >      }
> > >
> > >      if (unlikely(dev_written < sizeof(status))) {
> > > --
> > > 2.31.1
> > >
> >
>


