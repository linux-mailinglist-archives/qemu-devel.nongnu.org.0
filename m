Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6AF6E7F35
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:09:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAMZ-00010p-4T; Wed, 19 Apr 2023 12:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppAMX-00010g-2i
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:08:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppAMV-0000yK-Fj
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681920530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+xzgfEZmjLN9IGCqlrm2xCBg6EGQ1IXuCIdIy/ElL0=;
 b=SREsse8ZqP0qV3z0OMJpAFvZCP8jAZuXNudakFY6IwlARNM0q1rzU/vUZ1Re8z97EwnwyD
 JMCt38qqoRw7d580k5Q92e3hsGcYiIfZw8w7qRaVj7t2Tq7bktC5nyjpsR39U9pZsaTRVQ
 XSRhhN6FvGwuXhC90XSLH/rQDmMRpjc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-Zc44r3hJPC2j3BhGDOEJew-1; Wed, 19 Apr 2023 12:08:49 -0400
X-MC-Unique: Zc44r3hJPC2j3BhGDOEJew-1
Received: by mail-yb1-f197.google.com with SMTP id
 8-20020a250f08000000b00b880000325bso92582ybp.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681920528; x=1684512528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+xzgfEZmjLN9IGCqlrm2xCBg6EGQ1IXuCIdIy/ElL0=;
 b=l9HLV3m1WtJQfgiKPPLQy9q2GfUmQX5irQTjH5VA/qp7WZ0/LFAYv5aG0QO4K92p6u
 6DgASUxjQsezTC+Cy5Ny1fzhAQYfsfMMio8QmnKNtonPMv3djiGnmnYyaNiCjm+FOA10
 fGTlXTxYrT2uVITWsk795/uEKUlQuMXiE3OH8PaNtPlKmN7jQROMtiCgpUzniyOGrxzy
 1UMCJUKzZ9PDgGLlHbIPheBoQq/ul379W7pD0fk0EoVV0QM24LYS2NM0MJAWE0cVKz96
 e5lNimsGy9PAPYqOI/mNXOnCL95V+v/xdUALUF9TgBIGIzG7GoXqabP2eA3lj6gX2Gxd
 dboQ==
X-Gm-Message-State: AAQBX9fQJP7DWi/SAQQe3JU8y/lZEOnUyeB9DWc96nGkEHCfhVJ9rsz5
 IIvD60WrPLJzBvsdLnnq+yO2g9SGFHl2dpnsNOD7Rqjz9APC3w8zhSoWEe82a/ZUnOZcuU/FF25
 mb5a7Kni8Ifky3I8YfSv5cp2HnCh4Xxo=
X-Received: by 2002:a0d:e895:0:b0:552:9fae:d0b with SMTP id
 r143-20020a0de895000000b005529fae0d0bmr3817950ywe.16.1681920528387; 
 Wed, 19 Apr 2023 09:08:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350bWYvZYQVVQwGCfPyziBTcf9PtLY2IM8CIkWaOqgZp5tDPuT1/zpaPsHXHJwOwfYXO6Gu6Y35X7sR68l+O2fpA=
X-Received: by 2002:a0d:e895:0:b0:552:9fae:d0b with SMTP id
 r143-20020a0de895000000b005529fae0d0bmr3817931ywe.16.1681920528135; Wed, 19
 Apr 2023 09:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681819697.git.ray90514@gmail.com>
 <b9a88776ff1f7bc94ff0df9dd99b799ebd1e6d54.1681819697.git.ray90514@gmail.com>
In-Reply-To: <b9a88776ff1f7bc94ff0df9dd99b799ebd1e6d54.1681819697.git.ray90514@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Apr 2023 18:08:12 +0200
Message-ID: <CAJaqyWf1=6u6YTvgAk923nhOz1G7b=ipzH9+Ty2szy-0=_yBRQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] vhost-vdpa: cache device status and features
To: Shao-Chien Chiang <ray90514@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 3:22=E2=80=AFPM Shao-Chien Chiang <ray90514@gmail.c=
om> wrote:
>
> After caching the device status and features, the latency is reduced by 0=
.059 sec.

Can you add more details? Like:
* Initial and final time.
* Times that you repeated the experiment to reach for valid means etc.

And I think it is worth splitting this patch in two, one with status
and other with features. If we find a regression it may help to track
it down.

Thanks!

>
> Signed-off-by: Shao-Chien Chiang <ray90514@gmail.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 16 ++++++++++------
>  include/hw/virtio/vhost-vdpa.h |  2 ++
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index bc6bad23d5..ccde4c7040 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -350,14 +350,11 @@ static int vhost_vdpa_call(struct vhost_dev *dev, u=
nsigned long int request,
>
>  static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>  {
> -    uint8_t s;
> +    struct vhost_vdpa *v =3D dev->opaque;
> +    uint8_t s =3D v->status;
>      int ret;
>
>      trace_vhost_vdpa_add_status(dev, status);
> -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
> -    if (ret < 0) {
> -        return ret;
> -    }
>
>      s |=3D status;
>
> @@ -374,6 +371,7 @@ static int vhost_vdpa_add_status(struct vhost_dev *de=
v, uint8_t status)
>      if (!(s & status)) {
>          return -EIO;
>      }
> +    v->status =3D s;
>
>      return 0;
>  }
> @@ -436,6 +434,8 @@ static int vhost_vdpa_init(struct vhost_dev *dev, voi=
d *opaque, Error **errp)
>      dev->opaque =3D  opaque ;
>      v->listener =3D vhost_vdpa_memory_listener;
>      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> +    v->status =3D 0;
> +    v->features =3D dev->features;
>      vhost_vdpa_init_svq(dev, v);
>
>      error_propagate(&dev->migration_blocker, v->migration_blocker);
> @@ -456,6 +456,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, voi=
d *opaque, Error **errp)
>              return ret;
>          }
>          vhost_svq_valid_features(features, &dev->migration_blocker);
> +        v->features =3D features;
>      }
>
>      /*
> @@ -718,6 +719,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *=
dev)
>      ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>      trace_vhost_vdpa_reset_device(dev, status);
>      v->suspended =3D false;
> +    v->status =3D 0;
>      return ret;
>  }
>
> @@ -1294,8 +1296,10 @@ static int vhost_vdpa_set_vring_call(struct vhost_=
dev *dev,
>  static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                       uint64_t *features)
>  {
> -    int ret =3D vhost_vdpa_get_dev_features(dev, features);
> +    struct vhost_vdpa *v =3D dev->opaque;
> +    int ret =3D 0;
>
> +    *features =3D v->features;
>      if (ret =3D=3D 0) {
>          /* Add SVQ logging capabilities */
>          *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdp=
a.h
> index c278a2a8de..d563630cc9 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -39,6 +39,8 @@ typedef struct vhost_vdpa {
>      MemoryListener listener;
>      struct vhost_vdpa_iova_range iova_range;
>      uint64_t acked_features;
> +    uint64_t features;
> +    uint8_t status;
>      bool shadow_vqs_enabled;
>      /* Vdpa must send shadow addresses as IOTLB key for data queues, not=
 GPA */
>      bool shadow_data;
> --
> 2.25.1
>
>


