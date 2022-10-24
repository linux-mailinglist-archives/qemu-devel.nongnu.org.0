Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078796099E1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:34:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omneE-0005E2-AQ; Sun, 23 Oct 2022 22:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1omn0O-0000um-PT
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 22:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1omn0M-0002v0-SX
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 22:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666577754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3IyIleP6Ueaqpm0l87Cw2/dZK97bXxDX9MLYqlD9YA=;
 b=VcadB1YJvUkLH2W0wo+lM1eFsORVPZa/cHzItu3dlkJ4hQpEFzLT9cMkqQXKEkKR4vhXXp
 bdxvez2/O41PLwbzPgF3lIkrgi2OjgVMzYaJTBXEHXx7NX1pl/hRBkDzljgPUNduU/oDkX
 eNS78S5BtQW+AbHpw5FY8reUVNtQs0k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-dmRfaw7JMZSDXg0G7FHA8g-1; Sun, 23 Oct 2022 22:15:52 -0400
X-MC-Unique: dmRfaw7JMZSDXg0G7FHA8g-1
Received: by mail-ed1-f71.google.com with SMTP id
 q20-20020a056402519400b004613ae68b7bso7608563edd.5
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 19:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V3IyIleP6Ueaqpm0l87Cw2/dZK97bXxDX9MLYqlD9YA=;
 b=B8aoZve93FKmVayTKSloE6Enfq4FjcfnyC56kEokYRDP4hL+f1HD4BnjnJmC98Xsl+
 kbipuf1xYL1DeCn80g8PlqoH25afSN/8fwWzkajXInGbUudG6KcNY4LhubeXuBZtts9L
 lJ1nIYgUYYdmJaVQp+zMuC63dJcz9cATBLf5GJIRykbc2s2PMnqgo0NtAzs3syvgOVRM
 NCS+1/KE7D1DVrbkNngFVWveea237wkragmM7/Twqeynyz1kVmDGjM6+K7CtRDJF8F/0
 LNN3z17jy//MpN+BIM0wYOQiS6PEcE1xurjUZM91mwH4Fd1gZHrE145xnSTTJwJDJVXV
 QyAw==
X-Gm-Message-State: ACrzQf23vM4IFZ9XAVNbzQ5ptEZUGyBapWRd0nHK7ClBqtyYHl7uaUEL
 dWlkxwhT4w7GmHEyProYc0njNiBT0WCv49EeH3rsjWpVZel3pJXioFVZblk4Y7caugw9zn5K/27
 2K/vo4DmehiqMbX7Md2UDj5OBA9bzo5g=
X-Received: by 2002:a17:906:8a62:b0:78d:a05c:c37f with SMTP id
 hy2-20020a1709068a6200b0078da05cc37fmr25128696ejc.159.1666577751701; 
 Sun, 23 Oct 2022 19:15:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7swKu6tnJA0QynFbo5od86WBRpo1FUMAyF8junVfFc41zvPdOmGqoDf/YjlisSNwLhNCfadEpdxA2A6yb75nI=
X-Received: by 2002:a17:906:8a62:b0:78d:a05c:c37f with SMTP id
 hy2-20020a1709068a6200b0078da05cc37fmr25128672ejc.159.1666577751505; Sun, 23
 Oct 2022 19:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-7-eperezma@redhat.com>
 <CACGkMEuKCXP2DMQWtPFmLnCKYuyDA8LEFbETU==AM_aRvdVM8g@mail.gmail.com>
 <CAJaqyWfFk_yXTJjsvSpqG2XCJvgP7BqjcVediQL0KSDgN5nZ=A@mail.gmail.com>
 <CACGkMEtUBz99zAyreiUgqp7U3BFgFgLi+bPKW1tKZhq7p2+cFQ@mail.gmail.com>
 <CAJaqyWdBtxW8y6Oeji+UJ5QmYTMiy3NP2Q9FaaZyvYR5VyS6TA@mail.gmail.com>
In-Reply-To: <CAJaqyWdBtxW8y6Oeji+UJ5QmYTMiy3NP2Q9FaaZyvYR5VyS6TA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 24 Oct 2022 10:15:38 +0800
Message-ID: <CACGkMEvx687RWph3NT5C9bXk7SSZYaLyyjLjjfH4s1z6aRTdqw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/8] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 5:05 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Oct 21, 2022 at 5:02 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Oct 20, 2022 at 3:01 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Thu, Oct 20, 2022 at 6:35 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > Since this capability is emulated by qemu shadowed CVQ cannot for=
ward it
> > > > > to the device.
> > > >
> > > > I wonder what happens for a device that has GUEST_ANNOUNCE support =
on its own?
> > > >
> > >
> > > If SVQ is enabled the feature is always emulated by qemu by this seri=
es.
> > >
> > > if SVQ is disabled then the device is the one in charge of all of it.
> >
> > Ok, I see.
> >
> > >
> > > > > Process all that command within qemu.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  net/vhost-vdpa.c | 15 ++++++++++++---
> > > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 3374c21b4d..5fda405a66 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -488,9 +488,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(=
VhostShadowVirtqueue *svq,
> > > > >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > > > >                               s->cvq_cmd_out_buffer,
> > > > >                               vhost_vdpa_net_cvq_cmd_len());
> > > > > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeo=
f(status));
> > > > > -    if (unlikely(dev_written < 0)) {
> > > > > -        goto out;
> > > > > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL=
_ANNOUNCE) {
> > > >
> > > > Interesting, I thought we can do better by forbidding the code that
> > > > goes into vhost-vDPA specific code, everything should be set at
> > > > virtio-net.c level.
> > > >
> > >
> > > Do you mean to move the SVQ processing to each handle_output? It's
> > > somehow on the roadmap but I'm not sure if it has more priority than
> > > implementing the different features.
> >
> > Right, but I think we need to find a way to eliminate the casting here.
> >
>
> Would it work to use it this way?
> uint8_t *virtio_net_ctrl_class =3D s->cvq_cmd_out_buffer
> if (*virtio_net_ctrl_class =3D=3D VIRTIO_NET_CTRL_ANNOUNCE) {
>   ...
> }

Something like this, yes.

Thanks

>
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > >
> > > > Thanks
> > > >
> > > > > +        /*
> > > > > +         * Guest announce capability is emulated by qemu, so don=
t forward to
> > > > > +         * the device.
> > > > > +         */
> > > > > +        dev_written =3D sizeof(status);
> > > > > +        *s->status =3D VIRTIO_NET_OK;
> > > > > +    } else {
> > > > > +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, s=
izeof(status));
> > > > > +        if (unlikely(dev_written < 0)) {
> > > > > +            goto out;
> > > > > +        }
> > > > >      }
> > > > >
> > > > >      if (unlikely(dev_written < sizeof(status))) {
> > > > > --
> > > > > 2.31.1
> > > > >
> > > >
> > >
> >
>


