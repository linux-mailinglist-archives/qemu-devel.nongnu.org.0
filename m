Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A656D807
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 10:31:38 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAopK-0003yC-V5
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 04:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAomd-0001CJ-JV
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAomU-0004Nf-B9
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657528117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0i/hWiy9radgt4vxlT5+KFbHFzTOV5lZH9X5XdD7UPs=;
 b=Fpkn6DM9S6f8mL2WNjAw+CqiUxNIt1NMIxinC0U+iji9fF+5JsmdDZcSwDeGoU12lNBAgl
 ukC/G0tur7VM8buvLup7xBh6uTtJxBiL/Ry5lJJSL1JclFnMYxZQGdzPWuMieFKnawHNoA
 ykbzwX6HxieQHy1kXtC9pne3IpBfxQ8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-8qPHtv7rOxav7zpnV7S_2A-1; Mon, 11 Jul 2022 04:28:35 -0400
X-MC-Unique: 8qPHtv7rOxav7zpnV7S_2A-1
Received: by mail-qt1-f197.google.com with SMTP id
 p25-20020ac87419000000b0031eaaf91124so4473798qtq.20
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 01:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0i/hWiy9radgt4vxlT5+KFbHFzTOV5lZH9X5XdD7UPs=;
 b=w7KRE2V82aLLrK2YwCs1AnhLIYyjlbuiQdNYPXKXxXHyJ9LNByu1FtlELaW+QB+gWm
 QG3rKPQfFdQQo0Fso06yIWpdIIOljcazYTeRcHg+o0QhWWoOxD/3DhUO+zMjRaKlYIyC
 DkfRbcFaYcH/2PYxrebau088uU2n1WlaFwjikUg8/Dy9RJih/LZcfeVoL/DoD5IFXQlL
 yZqbsPzWyMdpA80qGikPvQ4Q63R5lARI/oXLqTxtTcNXo8mog3BnTHDxrhVQikN91/xu
 t9BpbDTCOsqnefbeOkHhcNg2H2VA0i9uv2+nbBTseaAIEZ8wifca6J8Vwf6GfKTvbaSB
 ckQg==
X-Gm-Message-State: AJIora+O63PTkY1gFC7PJH1bhHcf+v1WJzcGN13t5VlWc+3mBfkYYOVB
 dwnbUbF0AqhrBG2L1xlUDIUUVOb/WWaOMBPuxjaIgqO35m35DDfKIBxqN2YshBhQiWtiUsSytzo
 4TEJajoTHvhfLIdwxKIgbpKDbDkWjEc8=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr12690520qtx.370.1657528114559; 
 Mon, 11 Jul 2022 01:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sAlH5wm0ZLBlCS9s+gkCC9V+Kjca900gJ5+JEl8hfWYYQk8EKT9tgpRRcytCvy5XdAc1H0LblfJUcZjAqjhmk=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr12690505qtx.370.1657528114305; Mon, 11
 Jul 2022 01:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-9-eperezma@redhat.com>
 <48852cd1-fe92-81a1-8c35-ec1d8956f1a8@redhat.com>
In-Reply-To: <48852cd1-fe92-81a1-8c35-ec1d8956f1a8@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 11 Jul 2022 10:27:57 +0200
Message-ID: <CAJaqyWftrXQ3bg9LFjC14SYOGP1g_3t-_iekHmBDSvd5XVRKAA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 08/23] vhost: Decouple vhost_svq_add_split from
 VirtQueueElement
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 11, 2022 at 10:00 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/7 02:39, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > VirtQueueElement comes from the guest, but we're heading SVQ to be able
> > to inject element without the guest's knowledge.
> >
> > To do so, make this accept sg buffers directly, instead of using
> > VirtQueueElement.
> >
> > Add vhost_svq_add_element to maintain element convenience
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 38 +++++++++++++++++++++--------=
-
> >   1 file changed, 27 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 2fc5789b73..46d3c1d74f 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -172,30 +172,32 @@ static bool vhost_svq_vring_write_descs(VhostShad=
owVirtqueue *svq, hwaddr *sg,
> >   }
> >
> >   static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
> > -                                VirtQueueElement *elem, unsigned *head=
)
> > +                                const struct iovec *out_sg, size_t out=
_num,
> > +                                const struct iovec *in_sg, size_t in_n=
um,
> > +                                unsigned *head)
> >   {
> >       unsigned avail_idx;
> >       vring_avail_t *avail =3D svq->vring.avail;
> >       bool ok;
> > -    g_autofree hwaddr *sgs =3D g_new(hwaddr, MAX(elem->out_num, elem->=
in_num));
> > +    g_autofree hwaddr *sgs =3D NULL;
>
>
> Is this change a must for this patch? (looks not related to the
> decoupling anyhow)
>

Right, the delay on the variable assignment is an artifact I missed in
the cleaning. I can revert for the next version if any.

With that reverted, can I add the acked-by tag from you?

Thanks!

> Other looks good.
>
> Thanks
>
>
> >
> >       *head =3D svq->free_head;
> >
> >       /* We need some descriptors here */
> > -    if (unlikely(!elem->out_num && !elem->in_num)) {
> > +    if (unlikely(!out_num && !in_num)) {
> >           qemu_log_mask(LOG_GUEST_ERROR,
> >                         "Guest provided element with no descriptors");
> >           return false;
> >       }
> >
> > -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->o=
ut_num,
> > -                                     elem->in_num > 0, false);
> > +    sgs =3D g_new(hwaddr, MAX(out_num, in_num));
> > +    ok =3D vhost_svq_vring_write_descs(svq, sgs, out_sg, out_num, in_n=
um > 0,
> > +                                     false);
> >       if (unlikely(!ok)) {
> >           return false;
> >       }
> >
> > -    ok =3D vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in=
_num, false,
> > -                                     true);
> > +    ok =3D vhost_svq_vring_write_descs(svq, sgs, in_sg, in_num, false,=
 true);
> >       if (unlikely(!ok)) {
> >           /* TODO unwind out_sg */
> >           return false;
> > @@ -223,10 +225,13 @@ static bool vhost_svq_add_split(VhostShadowVirtqu=
eue *svq,
> >    * takes ownership of the element: In case of failure, it is free and=
 the SVQ
> >    * is considered broken.
> >    */
> > -static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement =
*elem)
> > +static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iove=
c *out_sg,
> > +                          size_t out_num, const struct iovec *in_sg,
> > +                          size_t in_num, VirtQueueElement *elem)
> >   {
> >       unsigned qemu_head;
> > -    bool ok =3D vhost_svq_add_split(svq, elem, &qemu_head);
> > +    bool ok =3D vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_nu=
m,
> > +                                  &qemu_head);
> >       if (unlikely(!ok)) {
> >           g_free(elem);
> >           return false;
> > @@ -250,6 +255,18 @@ static void vhost_svq_kick(VhostShadowVirtqueue *s=
vq)
> >       event_notifier_set(&svq->hdev_kick);
> >   }
> >
> > +static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
> > +                                  VirtQueueElement *elem)
> > +{
> > +    bool ok =3D vhost_svq_add(svq, elem->out_sg, elem->out_num, elem->=
in_sg,
> > +                            elem->in_num, elem);
> > +    if (ok) {
> > +        vhost_svq_kick(svq);
> > +    }
> > +
> > +    return ok;
> > +}
> > +
> >   /**
> >    * Forward available buffers.
> >    *
> > @@ -302,12 +319,11 @@ static void vhost_handle_guest_kick(VhostShadowVi=
rtqueue *svq)
> >                   return;
> >               }
> >
> > -            ok =3D vhost_svq_add(svq, elem);
> > +            ok =3D vhost_svq_add_element(svq, g_steal_pointer(&elem));
> >               if (unlikely(!ok)) {
> >                   /* VQ is broken, just return and ignore any other kic=
ks */
> >                   return;
> >               }
> > -            vhost_svq_kick(svq);
> >           }
> >
> >           virtio_queue_set_notification(svq->vq, true);
>


