Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22E63CF96
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:08:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0HC2-0008GU-Ba; Wed, 30 Nov 2022 02:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0HBv-0008F0-QM
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:07:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0HBu-0003HK-8f
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669792053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wa/2ymWeGBaC0ARF4vNUXjF8yThdupdz7YkX6Kt9yiw=;
 b=S8vEHcYfZchv7ekbgurJ3IQMEMk1yWjbbkE5gNL7KkYCYbefv6M+chohT2zh7WJmQQxsWZ
 CDUMV5kG1CGWzgzWh4gJb3uIYXvB2/nfyiqbjIziNQ6JnCKhFDE+h31i/DKvA3zHGddtCy
 RfZyRmEhS7u2qBwrGYBL2P8zDftY0zE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-xOVo0Fm5NKyTbxMFiXGeMA-1; Wed, 30 Nov 2022 02:07:31 -0500
X-MC-Unique: xOVo0Fm5NKyTbxMFiXGeMA-1
Received: by mail-ej1-f69.google.com with SMTP id
 ga41-20020a1709070c2900b007aef14e8fd7so8048456ejc.21
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 23:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wa/2ymWeGBaC0ARF4vNUXjF8yThdupdz7YkX6Kt9yiw=;
 b=cPDqZbeFYi1aD1xLI6Xm/o7QU5yzsANPQQrOXPwpH3XknOb6I49qTZEso9cESH59kp
 B8F1Ycp204y14nWyn/J3E3kjsgz6dM1sOzLUEtF4GAZsDEQCPr5cVTbyycrSoUlAsmJe
 DutKeHZFhwIxT8vY/bobG8gNFOPNFbg4bwrGUNkfeVST2Cox6ao4Z0vf1gmQDxpYPA9g
 9wCLeGRxI0Xr/yvPDAe9lIRqCw1awyKMtAQJR05PD/poHjE7clU7faeG/DnuifGdp4FK
 /r6X3Jw2vCSopLsKVXFJWZOX0lUBpBr6J2Zp8X1okTh+9Z1aYfHAjFQqNm8S0yHaUzZh
 4xWg==
X-Gm-Message-State: ANoB5pmJl2170DLWdfA6e8ZxOFjXByEFib9/rW8Z/W90OZSEqM5tOjs+
 QbRWaPTcMSZSL8zXB0MBwhXZOTOzF552Mx/67a7hrSwDKgB1fmdTfeYNLIrPZv2arxSc45+FQ9F
 Bs4ii92Uz5hgxqfGHf7/u5kjAGuYetSA=
X-Received: by 2002:a17:907:cf84:b0:78d:4795:ff1f with SMTP id
 ux4-20020a170907cf8400b0078d4795ff1fmr4940283ejc.331.1669792050241; 
 Tue, 29 Nov 2022 23:07:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DnU1NkxOPrVqEugbRtAsVcn20Esx3dm6XxbuPAq0wHLnzywe1+OOhEjpbaMYGC5wj8S7EOzMOSmHtTVvkXw8=
X-Received: by 2002:a17:907:cf84:b0:78d:4795:ff1f with SMTP id
 ux4-20020a170907cf8400b0078d4795ff1fmr4940258ejc.331.1669792049968; Tue, 29
 Nov 2022 23:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
 <CACGkMEsOJuOM8JW83Ly+b3ZvfAhnOj61CvVz2SeLeLEkpT446Q@mail.gmail.com>
In-Reply-To: <CACGkMEsOJuOM8JW83Ly+b3ZvfAhnOj61CvVz2SeLeLEkpT446Q@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 30 Nov 2022 08:06:53 +0100
Message-ID: <CAJaqyWfTp6QT1amL_724+UN_APgkG+dM28OEHE99v6aojSPU6A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
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

On Wed, Nov 30, 2022 at 8:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Since this capability is emulated by qemu shadowed CVQ cannot forward i=
t
> > to the device. Process all that command within qemu.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 2b4b85d8f8..8172aa8449 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostS=
hadowVirtqueue *svq,
> >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> >                               s->cvq_cmd_out_buffer,
> >                               vhost_vdpa_net_cvq_cmd_len());
> > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(stat=
us));
> > -    if (unlikely(dev_written < 0)) {
> > -        goto out;
> > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_ANNOU=
NCE) {
> > +        /*
> > +         * Guest announce capability is emulated by qemu, so dont forw=
ard to
>
> s/dont/don't/
>

I'll correct it, thanks!

> > +         * the device.
> > +         */
> > +        dev_written =3D sizeof(status);
> > +        *s->status =3D VIRTIO_NET_OK;
>
> I wonder if we should avoid negotiating ANNOUNCE with vDPA parents if
> we do this?
>

I can re-check, but the next patch should avoid it. Even if
negotiated, the parent should never set the announce status bit, since
we never tell the device is a destination device.

But it's better to be on the safe side, I'll recheck.

Thanks!

> Thanks
>
> > +    } else {
> > +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(=
status));
> > +        if (unlikely(dev_written < 0)) {
> > +            goto out;
> > +        }
> >      }
> >
> >      if (unlikely(dev_written < sizeof(status))) {
> > --
> > 2.31.1
> >
>


