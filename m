Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BE763CFA2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:19:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0HMY-0005WK-7j; Wed, 30 Nov 2022 02:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0HMA-0005Ob-W9
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:18:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0HM9-0004h0-Gw
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669792687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvxuSajOFNbbnmFm7qk1XuVluQ90QnUKC41cV59VhUY=;
 b=cUsuWxgzzfYgcki/BgupHgvprs6Buk4lzZJnkmpOkVUJ3h3KoenJfogZH/EhGFLnlKl7L+
 BLNYJUbH+zUtJPlXbORZLgDzRBzF4PfaqC+/FuNTio13kddRo0uRUU0nceCXEqU5b0YjYp
 AO/MdACpYuAZaDseOXqkPzoiVC4y/Bw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-Zi5Uk5pxP4upykA9j88OEw-1; Wed, 30 Nov 2022 02:18:04 -0500
X-MC-Unique: Zi5Uk5pxP4upykA9j88OEw-1
Received: by mail-ed1-f70.google.com with SMTP id
 f17-20020a056402355100b00466481256f6so9281435edd.19
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 23:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvxuSajOFNbbnmFm7qk1XuVluQ90QnUKC41cV59VhUY=;
 b=oyx6ymxNYsnKX5IjtwzBsc/quyRXiDnWvmyc7jNUdYlQeEogZKHyWxnQCYGNfnj4kn
 uuh4OB2sb1CXqvHbA8CDqxXVR2kiiPLbCvGdLJlCELqY/CQZQCKBTIR7fkWU4xC6xaxY
 CPcXkS5bnTbIudf2tmn0BaVlVrtRxtw4OvOgUvTCWn+vVgxk9RBwzxx4O/skpMxG0bjO
 Hs945j5DeRWMK8d1wqg8xPaMDb2p9JCW5mgeIqyRsayEdph9x5XOmUszJw+hiQbueIN+
 BfwhKgEi7q4bXn9lii1qNXL9ZWpHk7oEIsl6Rxhn+deX5tsPlnTX79nx+lLab0JV9g0Q
 HPag==
X-Gm-Message-State: ANoB5plv5xActxdqEuboM/M/xtkyJ1GBwdkEdTzTSSZgDkklg4xk/pq3
 F17maS83+ThXWc9k9CAMkZTkpJsIwI4x2/5SUwwloJN1gp20kt4sliw5mL+hdAYE++afFRBFQna
 R92IH0D0D/nQHQmvDQc6AC4YwOYi+Lsk=
X-Received: by 2002:a17:906:2dda:b0:7bd:6149:2097 with SMTP id
 h26-20020a1709062dda00b007bd61492097mr19534418eji.185.1669792683757; 
 Tue, 29 Nov 2022 23:18:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5TdLyeYVRPYNmkB1O4lbEgmgkFYGh+8R+izKZwuvnKiEF40Wn13uAmQAYBQW3KuDv+o1x7VVqpFoIxWGKeIT8=
X-Received: by 2002:a17:906:2dda:b0:7bd:6149:2097 with SMTP id
 h26-20020a1709062dda00b007bd61492097mr19534398eji.185.1669792683496; Tue, 29
 Nov 2022 23:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-4-eperezma@redhat.com>
 <20221130020602-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221130020602-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 30 Nov 2022 08:17:26 +0100
Message-ID: <CAJaqyWc5u5bV4wfpkrB=MnW+PBLCgN_yrGut_VNULJLHHL0q=A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>, 
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
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

On Wed, Nov 30, 2022 at 8:10 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Nov 24, 2022 at 06:33:13PM +0100, Eugenio P=C3=A9rez wrote:
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
> > +         * the device.
> > +         */
>
> Hmm I'm not sure why. We don't forward the status bit to guest?
>

No, the idea is to make this feature entirely emulated by qemu so it
does not depend on device's features to support it.

Thanks!

> > +        dev_written =3D sizeof(status);
> > +        *s->status =3D VIRTIO_NET_OK;
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
>


