Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756C16A84F8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkbj-0001XX-Pj; Thu, 02 Mar 2023 10:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXkbi-0001XM-1E
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXkbg-0005Gt-G0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677769951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xvpj20OaqPV+tTNqnT4a47jgVWbQU5AWf0dybgNpzPY=;
 b=VlE87w4YSYZExyCoMTYKhqVKWFrXrOHzyxCqRXWrzIJTtzzkE1jl1ozd7J7YYWK8SfQslU
 SkouDMAkHjR/1qDVkEuL94q9zo+MNbflhIzPsp8OaK9Jz8BVrzD+X8D3b6QqouorrpxS56
 K9jyypD81PaKeWC4FU0qhtA3wKRh4hg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-kfSviltYOfyUJm19_y7oBQ-1; Thu, 02 Mar 2023 10:12:30 -0500
X-MC-Unique: kfSviltYOfyUJm19_y7oBQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 d185-20020a25e6c2000000b008fa1d22bd55so4377156ybh.21
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 07:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677769949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xvpj20OaqPV+tTNqnT4a47jgVWbQU5AWf0dybgNpzPY=;
 b=8BZ4HSoMxG3N5oQxUd7RRHelXoGWBPealo/6yvJ0+JyvWxj2/2QbyMAGoXmLVSr6ZF
 t25fd8jCO746qBzCuefHMnXAB/2jZlEJwpPP03rYGCYX2MEpHfH4C+8n0/pPM0uLfOoD
 RRTq/rV5KXle0pda+sMmobaYmb60sOpcm1H1zomXLWVi2K0KurVWM4jtCabQYNecaZid
 lDpyptws7ZD0q9troMTFObXn7kE3FdyUYDQVSuOkd6nY5ZnYGh/4zyAjK+qhjUam3cE3
 v98HtaqymkooGSIyl7eNO9YJ5gj0uB7Zo1xO0IbzwoDzXGAT1vSRL8D8n2rKtUHyBW2q
 rKZg==
X-Gm-Message-State: AO0yUKXm7koVNqAQ4InnyGQOArjnfwMgSJ/B8ufIwGDAwGDjOOfdmbGC
 nteJ0XI8U5CQzUGVE/BxDSmHvXgBWRbuKDlRa0pOQ044R0M/+YNxHLZ/l2qSMyWHjBHN/rj5tva
 VRa668FYAh3p3XwH/QRGjmIA12uvppwM=
X-Received: by 2002:a5b:611:0:b0:a48:6236:1be4 with SMTP id
 d17-20020a5b0611000000b00a4862361be4mr5416051ybq.2.1677769948916; 
 Thu, 02 Mar 2023 07:12:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+KfUB4uyDVEey5V9dJqp/t7Xlwm7rkrTxn7d+OG/fx9dTn9EQFkqGKl/wN1phqsY4EaJ+Fe9tC6w/B7sNHnbw=
X-Received: by 2002:a5b:611:0:b0:a48:6236:1be4 with SMTP id
 d17-20020a5b0611000000b00a4862361be4mr5416031ybq.2.1677769948569; Thu, 02 Mar
 2023 07:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-11-eperezma@redhat.com>
 <45482a90-1bb6-fc67-3fbd-86833d7d00c1@redhat.com>
In-Reply-To: <45482a90-1bb6-fc67-3fbd-86833d7d00c1@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Mar 2023 16:11:52 +0100
Message-ID: <CAJaqyWcEzmv2K-FDZJ9jf8tSvfYc2SkhHEBsP3HKM73Mu1nhZw@mail.gmail.com>
Subject: Re: [PATCH v4 10/15] vdpa: disable RAM block discard only for the
 first device
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>, 
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
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

On Mon, Feb 27, 2023 at 9:11 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Although it does not make a big difference, its more correct and
> > simplifies the cleanup path in subsequent patches.
> >
> > Move ram_block_discard_disable(false) call to the top of
> > vhost_vdpa_cleanup because:
> > * We cannot use vhost_vdpa_first_dev after dev->opaque =3D NULL
> >    assignment.
> > * Improve the stack order in cleanup: since it is the last action taken
> >    in init, it should be the first at cleanup.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 25 ++++++++++++++-----------
> >   1 file changed, 14 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 71e3dc21fe..27655e7582 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -431,16 +431,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >       trace_vhost_vdpa_init(dev, opaque);
> >       int ret;
> >
> > -    /*
> > -     * Similar to VFIO, we end up pinning all guest memory and have to
> > -     * disable discarding of RAM.
> > -     */
> > -    ret =3D ram_block_discard_disable(true);
> > -    if (ret) {
> > -        error_report("Cannot set discarding of RAM broken");
> > -        return ret;
> > -    }
> > -
> >       v =3D opaque;
> >       v->dev =3D dev;
> >       dev->opaque =3D  opaque ;
> > @@ -452,6 +442,16 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >           return 0;
> >       }
> >
> > +    /*
> > +     * Similar to VFIO, we end up pinning all guest memory and have to
> > +     * disable discarding of RAM.
> > +     */
> > +    ret =3D ram_block_discard_disable(true);
> > +    if (ret) {
> > +        error_report("Cannot set discarding of RAM broken");
> > +        return ret;
> > +    }
>
>
> We seems to lose the chance to free svq allocated by
> vhost_vdpa_init_svq() in this case?
>

Right, I'll fix it in the next version.

Thanks!

> Thanks
>
>
> > +
> >       vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                  VIRTIO_CONFIG_S_DRIVER);
> >
> > @@ -577,12 +577,15 @@ static int vhost_vdpa_cleanup(struct vhost_dev *d=
ev)
> >       assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDP=
A);
> >       v =3D dev->opaque;
> >       trace_vhost_vdpa_cleanup(dev, v);
> > +    if (vhost_vdpa_first_dev(dev)) {
> > +        ram_block_discard_disable(false);
> > +    }
> > +
> >       vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >       memory_listener_unregister(&v->listener);
> >       vhost_vdpa_svq_cleanup(dev);
> >
> >       dev->opaque =3D NULL;
> > -    ram_block_discard_disable(false);
> >
> >       return 0;
> >   }
>


