Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3CD63EC84
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 10:30:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fsV-0000Np-G5; Thu, 01 Dec 2022 04:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0fsS-0000NX-PR
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0fsQ-0007i1-LJ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669886945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZLVsTjlF7FDeKpKsrw5BdzGg3ShvmYhTBkaHsSUGRw=;
 b=XULggLpKhfdIBrjFSZIjCNZn1uOYKQbanB3tCYS/JiHxnHjuApv94rt9dET0x3/ioAu1wn
 mfn/NanpFYkhYAmBxUW59m1YGfWgYVhI9IGSux4Eq38vDK8egdpcEzI2hFDU85QCSo1PsL
 hI5VHCd0HYFnEzAoKsgX03r3+Eil0Rs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-Ke9QmV-mORmi9OLzXpQOGw-1; Thu, 01 Dec 2022 04:29:04 -0500
X-MC-Unique: Ke9QmV-mORmi9OLzXpQOGw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b6-20020a056402278600b0046bb01fb9c0so560360ede.3
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 01:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZLVsTjlF7FDeKpKsrw5BdzGg3ShvmYhTBkaHsSUGRw=;
 b=RS+m6JQuxfT/fNG8F7ZVDbbUtt/bRyyjwVlGR85PiXboUdHAqmPcCDM5uFzMub5mQT
 kPjDyVUCDdCr5O89LGtEeYJUGD11NWMlNYM5qFEKlSYnP6+ZmIu3YBXcmsbmYzwK6XLU
 4OsTDHa02cxzsjMYNCTr7h60JoEa3PpczajuUZTe0ANwq5CXIO1Jf+TpWHKOFVEzH629
 JKBd/9lEMU3w+GgwOH3fbdHLIJhGfw2rEEoHq5xTlLLO+p9C2FJjXaHHtwEeOCp/XTdW
 oR5g25Fk0WFpFwcXTPO68ed71vXiFFRM2l2Fxdr4+ozJ1OFLSu6D2t6poy1E/b4mf/4y
 088g==
X-Gm-Message-State: ANoB5pmTf2x05ISBP6i9kWYOimAtjoX0RLcTT9osg0Vqrq6+gjHfhrz0
 GD+r5+TBYrEdzYERqlDUaq33fOVQg94dIXy2G65eZLcbwoK18WqFWxQuodUecoTO+RPnD7ad/QP
 7cK4jnywgGR28SPS0q8XjVwdZ9t9cEiE=
X-Received: by 2002:a50:ec9a:0:b0:46b:9049:eab6 with SMTP id
 e26-20020a50ec9a000000b0046b9049eab6mr8929756edr.120.1669886942812; 
 Thu, 01 Dec 2022 01:29:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf54cdEq5sh25T8lkxLGlgmUUDEqXgiMFMqiwgE7rEmeZ+cY/aVGecNM0V3nsHUXcsC6Xp8ORGEWHEcjlosmxck=
X-Received: by 2002:a50:ec9a:0:b0:46b:9049:eab6 with SMTP id
 e26-20020a50ec9a000000b0046b9049eab6mr8929734edr.120.1669886942587; Thu, 01
 Dec 2022 01:29:02 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
 <CACGkMEsOJuOM8JW83Ly+b3ZvfAhnOj61CvVz2SeLeLEkpT446Q@mail.gmail.com>
 <CAJaqyWfTp6QT1amL_724+UN_APgkG+dM28OEHE99v6aojSPU6A@mail.gmail.com>
 <CACGkMEsVN4jHkLojKekB1OAEvoTzMJzv+m4HNR6T8qJUC9VjTQ@mail.gmail.com>
In-Reply-To: <CACGkMEsVN4jHkLojKekB1OAEvoTzMJzv+m4HNR6T8qJUC9VjTQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 1 Dec 2022 10:28:25 +0100
Message-ID: <CAJaqyWdX83jFpGy_qZ8d_07fvaVHJk3TqamoS7NVgkqJjX2X8g@mail.gmail.com>
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

On Thu, Dec 1, 2022 at 9:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 30, 2022 at 3:07 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 8:02 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> > > >
> > > > Since this capability is emulated by qemu shadowed CVQ cannot forwa=
rd it
> > > > to the device. Process all that command within qemu.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  net/vhost-vdpa.c | 15 ++++++++++++---
> > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 2b4b85d8f8..8172aa8449 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vh=
ostShadowVirtqueue *svq,
> > > >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > > >                               s->cvq_cmd_out_buffer,
> > > >                               vhost_vdpa_net_cvq_cmd_len());
> > > > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(=
status));
> > > > -    if (unlikely(dev_written < 0)) {
> > > > -        goto out;
> > > > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_A=
NNOUNCE) {
> > > > +        /*
> > > > +         * Guest announce capability is emulated by qemu, so dont =
forward to
> > >
> > > s/dont/don't/
> > >
> >
> > I'll correct it, thanks!
> >
> > > > +         * the device.
> > > > +         */
> > > > +        dev_written =3D sizeof(status);
> > > > +        *s->status =3D VIRTIO_NET_OK;
> > >
> > > I wonder if we should avoid negotiating ANNOUNCE with vDPA parents if
> > > we do this?
> > >
> >
> > I can re-check, but the next patch should avoid it.
>
> Kind of, it makes sure guest can always see _F_ANNOUNCE. But does it
> prevent _F_ANNOUNCE from being negotiated?
>

It should go like:
* vhost_net_ack_features calls vhost_ack_features with feature_bits =3D
vdpa_feature_bits and features =3D guest acked features.
vhost_ack_features stores in hdev->acked_features only the features
that met features & bit_mask, so it will not store _F_ANNOUNCE.
* vhost_vdpa_set_features is called from vhost_dev_set_features with
features =3D dev->acked_features. Both functions can add features by
themselves (VHOST_F_LOG_ALL, VIRTIO_F_IOMMU_PLATFORM), but no
_F_ANNOUNCE.

Still untested.

> > Even if
> > negotiated, the parent should never set the announce status bit, since
> > we never tell the device is a destination device.
>
> That's the point, do we have such a guarantee? Or I wonder if there's
> any parent that supports _F_ANNOUNCE if yes, how it is supposed to
> work?
>

At the moment it is impossible to work since there is no support for
config interrupt from the device. Even with config interrupt,
something external from qemu should make the device enable the status
bit, since the current migration protocol makes no difference between
to be a migration destination and to start the device from scratch.
Unless it enables the bit maliciously or by mistake.

Just for completion, the current method works with no need of vdpa
device config interrupt support thanks to being 100% emulated in qemu,
which has the support of injecting config interrupts.

Thanks!


