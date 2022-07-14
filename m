Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9E574556
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 08:53:34 +0200 (CEST)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBsj7-0005Eh-EX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 02:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBsbx-0000a4-8Z
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 02:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBsbr-0001iG-7r
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 02:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657781161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45/uBJ3XkVb+HV7V/4yo5w1BdLx660KgqsVvVl/a6VA=;
 b=hamShw1fMX/4mHriFogZZ5Blt4Q/Ir6myxZBVnm4fsfR51wHIZzO2P/IFbkAprnEOooATY
 2oTn1z3P/EZeNA4rEmTFxQoowTdFVZwh4q1B81gpLmcpZxIg2t13mRtHLsOgc20OcaZoar
 F/75kl9Nag0tzXHIihSGeBHDhfd0lV4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-grDVzFq9OWCZSeZqgsWrVA-1; Thu, 14 Jul 2022 02:46:00 -0400
X-MC-Unique: grDVzFq9OWCZSeZqgsWrVA-1
Received: by mail-lj1-f200.google.com with SMTP id
 f9-20020a2e9189000000b0025d693b780dso156386ljg.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 23:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=45/uBJ3XkVb+HV7V/4yo5w1BdLx660KgqsVvVl/a6VA=;
 b=6FDvzKb/CbXm7s1KiKZSe46ruwinTr42gB9ceWBtqw4YCehkkv36lnwwn5cfZA5wsP
 6eCdo5qB6DiOJ9Q+h0YiGF4yhq5aJ9BYuhUPBIH2909hnHJp0IKPmY4BVDqjxSBHXKQ/
 q6rqDNFYhLW0lDfrpRjGeRQj+kny4ZhTZ7Z1cH4mHTa1+YuBd2//gxtTJeRaiInXbZjz
 2eksF7HtofnOqNrXZk1MI630jj2l85PHkPG6ACn/Gr3cNudMfzkaMM/lvaNJxsQU28AO
 wwvQ0fBOg+wImR4tlxHvs4yxGyz3tv0ge805KU94LW+ZPFeRrMhZQF6ed2dvLzhMYX6i
 w3Ag==
X-Gm-Message-State: AJIora9oWFLQanuTcY/dLUUlD4m3yKBW5WPJUmtIMcrs0by3aP7klRZb
 moZ6Pp2ScS9DtHrF8ThUyzJ7LYNeHHr3gNHm+tKTALqAdTJpoDDr+Txk7Wg1Beli/uaHh9VZXbS
 /DefkEt6FPZ3PMyYtbUqjF0Nz3NU73gU=
X-Received: by 2002:a05:6512:3d8a:b0:489:c93c:5970 with SMTP id
 k10-20020a0565123d8a00b00489c93c5970mr4347636lfv.575.1657781158421; 
 Wed, 13 Jul 2022 23:45:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTA4Pukgvcn6+wXIkU0I9/Ab2DgYEFbymCUdj2ZosRxNKfaawKC9mIp67vdOeqckmZ8VFaWR1X6j2jUSFM99c=
X-Received: by 2002:a05:6512:3d8a:b0:489:c93c:5970 with SMTP id
 k10-20020a0565123d8a00b00489c93c5970mr4347628lfv.575.1657781158214; Wed, 13
 Jul 2022 23:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220712071524.2144723-1-eperezma@redhat.com>
In-Reply-To: <20220712071524.2144723-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Jul 2022 14:45:47 +0800
Message-ID: <CACGkMEvYZy=nWC4oNTDGp+WPuK_vG8FADUz9=g4U_5gTdOnLtg@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Clean vhost_vdpa_dev_start(dev, false)
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jul 12, 2022 at 3:15 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Return value is never checked and is a clean path, so assume success
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  hw/virtio/vhost-vdpa.c | 33 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 66f054a12c..d6ba4a492a 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -872,41 +872,35 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev =
*dev,
>  /**
>   * Unmap a SVQ area in the device
>   */
> -static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
> +static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>                                        const DMAMap *needle)
>  {
>      const DMAMap *result =3D vhost_iova_tree_find_iova(v->iova_tree, nee=
dle);
>      hwaddr size;
> -    int r;
>
>      if (unlikely(!result)) {
>          error_report("Unable to find SVQ address to unmap");
> -        return false;
> +        return;
>      }
>
>      size =3D ROUND_UP(result->size, qemu_real_host_page_size());
> -    r =3D vhost_vdpa_dma_unmap(v, result->iova, size);
> -    return r =3D=3D 0;
> +    vhost_vdpa_dma_unmap(v, result->iova, size);
>  }
>
> -static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
> +static void vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
>                                         const VhostShadowVirtqueue *svq)
>  {
>      DMAMap needle =3D {};
>      struct vhost_vdpa *v =3D dev->opaque;
>      struct vhost_vring_addr svq_addr;
> -    bool ok;
>
>      vhost_svq_get_vring_addr(svq, &svq_addr);
>
>      needle.translated_addr =3D svq_addr.desc_user_addr;
> -    ok =3D vhost_vdpa_svq_unmap_ring(v, &needle);
> -    if (unlikely(!ok)) {
> -        return false;
> -    }
> +    vhost_vdpa_svq_unmap_ring(v, &needle);
>
>      needle.translated_addr =3D svq_addr.used_user_addr;
> -    return vhost_vdpa_svq_unmap_ring(v, &needle);
> +    vhost_vdpa_svq_unmap_ring(v, &needle);
>  }
>
>  /**
> @@ -1066,23 +1060,19 @@ err:
>      return false;
>  }
>
> -static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
> +static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>  {
>      struct vhost_vdpa *v =3D dev->opaque;
>
>      if (!v->shadow_vqs) {
> -        return true;
> +        return;
>      }
>
>      for (unsigned i =3D 0; i < v->shadow_vqs->len; ++i) {
>          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, i=
);
> -        bool ok =3D vhost_vdpa_svq_unmap_rings(dev, svq);
> -        if (unlikely(!ok)) {
> -            return false;
> -        }
> +        vhost_vdpa_svq_unmap_rings(dev, svq);
>      }
>
> -    return true;
>  }
>
>  static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> @@ -1099,10 +1089,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *=
dev, bool started)
>          }
>          vhost_vdpa_set_vring_ready(dev);
>      } else {
> -        ok =3D vhost_vdpa_svqs_stop(dev);
> -        if (unlikely(!ok)) {
> -            return -1;
> -        }
> +        vhost_vdpa_svqs_stop(dev);
>          vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>      }
>
> --
> 2.31.1
>


