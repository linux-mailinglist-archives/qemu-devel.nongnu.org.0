Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25939575A32
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 06:11:50 +0200 (CEST)
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCCg9-0000ym-9p
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 00:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCev-0007no-RR
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:10:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCCet-0001ZK-GH
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 00:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657858230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThG/6DQurSlKlcv8JQllM++Np3kekw+rUsi5fb+z92Q=;
 b=RoXaujCdyxUCusnluCCNsXxbRKPEmJ5sYvRFsPebTr3iUsTjS0QcWVPeuYcfIxY4RnDNxX
 SA7O20Ck1uQt55BzYvKJ2GFtnxMxpOFjPPmIu8dot2ua8euZ7jFkWBBdEo/BDBG/M0mJuS
 Y/Ablm91yk9LzTgMMT+8p4kSDP28fds=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-2tdu5xDEOZy93q8-6JqOeQ-1; Fri, 15 Jul 2022 00:10:29 -0400
X-MC-Unique: 2tdu5xDEOZy93q8-6JqOeQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 w20-20020a194914000000b00489e66662d1so1425208lfa.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 21:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ThG/6DQurSlKlcv8JQllM++Np3kekw+rUsi5fb+z92Q=;
 b=dAmOBNnVBBSSMwdlWQkG3QFF5Rt8O4PGkQbnF5NtlfV9Lip0cSKuOJi4tdqbPY+s/W
 QHlrhhXF+SKNsYOpa4lDQ1DeHZzjWwGLaLfd873zyjiTE1AiBfGR0o+0ivFUj3DW7tzn
 knLfHweC0kmI4vZdSLQjwane/dbTDlCshFF8I+LqO+rIRRf5h2sAkE8n02r0QZ2FzAnC
 nZNzQHclN+uKT9l6snwZ+jo57503EA2R9J+m+B1yzywxzI2obN5Nxz0iY86odo6KVT5Y
 z3BCHUtPqbLFDudPginhonZ/Eoibt8hREObG6Q8mJgNsxUUQoxOogy0MbYpLRJ5/zOxl
 UkLA==
X-Gm-Message-State: AJIora+wmrYWHtOA/xKpR9xxpg1NPLk6vTt/deRabed5tY1KE9r+usLl
 muusnGw1NDM8CxYmYQt2EJIxlGjLjkvRK14SGZO93Pk/aEGfE1eH7PoBjPi5VbjIleUsNlheu/K
 0SGa3id2CUov5szizHxK/d9lTrgtMXBo=
X-Received: by 2002:a05:6512:313a:b0:489:caea:7e27 with SMTP id
 p26-20020a056512313a00b00489caea7e27mr7125407lfd.397.1657858227518; 
 Thu, 14 Jul 2022 21:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufJnDRmhZRWK6mXGsBvEWXeEHjvMw5NypRaq3pL6d5I2HmyYv1O+TjBWB5bplq5S8ZhoJVgbt0+yb+est1OVk=
X-Received: by 2002:a05:6512:313a:b0:489:caea:7e27 with SMTP id
 p26-20020a056512313a00b00489caea7e27mr7125402lfd.397.1657858227323; Thu, 14
 Jul 2022 21:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-10-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-10-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 12:10:16 +0800
Message-ID: <CACGkMEs7UcNALWttim=3ua0+igNXwQF56kM-QmE3odKY1HojgA@mail.gmail.com>
Subject: Re: [PATCH v2 09/19] vhost: Track number of descs in SVQElement
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Since CVQ will be able to modify elements, the number of descriptors in
> the guest may not match with the number of descriptors exposed. Track
> separately.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
>  hw/virtio/vhost-shadow-virtqueue.c | 10 +++++-----
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index f35d4b8f90..143c86a568 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -17,6 +17,12 @@
>
>  typedef struct SVQElement {
>      VirtQueueElement elem;
> +
> +    /*
> +     * Number of descriptors exposed to the device. May or may not match
> +     * guest's
> +     */
> +    unsigned int ndescs;
>  } SVQElement;

Can we simplify things furtherly by moving ndscs into a dedicated array at =
svq?

Then we don't need to bother with introducing SVQElement.

Thanks

>
>  /* Shadow virtqueue to relay notifications */
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 442ca3cbd3..3b112c4ec8 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -243,10 +243,10 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq,=
 const struct iovec *out_sg,
>                            size_t in_num, SVQElement *svq_elem)
>  {
>      unsigned qemu_head;
> -    unsigned ndescs =3D in_num + out_num;
> +    svq_elem->ndescs =3D in_num + out_num;
>      bool ok;
>
> -    if (unlikely(ndescs > vhost_svq_available_slots(svq))) {
> +    if (unlikely(svq_elem->ndescs > vhost_svq_available_slots(svq))) {
>          return -ENOSPC;
>      }
>
> @@ -393,7 +393,7 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVirtq=
ueue *svq,
>      SVQElement *elem;
>      const vring_used_t *used =3D svq->vring.used;
>      vring_used_elem_t used_elem;
> -    uint16_t last_used, last_used_chain, num;
> +    uint16_t last_used, last_used_chain;
>
>      if (!vhost_svq_more_used(svq)) {
>          return NULL;
> @@ -420,8 +420,8 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVirtq=
ueue *svq,
>      }
>
>      elem =3D svq->ring_id_maps[used_elem.id];
> -    num =3D elem->elem.in_num + elem->elem.out_num;
> -    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, num, used_elem=
.id);
> +    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, elem->ndescs,
> +                                                   used_elem.id);
>      svq->desc_next[last_used_chain] =3D svq->free_head;
>      svq->free_head =3D used_elem.id;
>
> --
> 2.31.1
>


