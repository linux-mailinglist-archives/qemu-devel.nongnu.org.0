Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A5444D62
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 03:47:51 +0100 (CET)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miSn8-0000RK-Iu
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 22:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSlX-00083L-AX
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miSlR-0007i4-Of
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 22:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635993964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YP/yOLmMm/sWLcuNtjBeezZwq4HiR5P1pp8C19wTJiQ=;
 b=iB2ZpwAg6fMs4VzUQ05QXenks/VmLSfy0Y74HVDEXz/eOaGDO3T7ELYJ5+C1jlXhlLc1fC
 Qut4pl1KSFftJSy9P6bHOkIT2kjKNk/1jIeNOD6sI/lruA+HTCxPcnxCZJML0TiybCnzDj
 nzGTHASVQHRbdJx/jH4VnEmAsBugcec=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-HP7mclnqPPyynwkRx2LsjA-1; Wed, 03 Nov 2021 22:46:01 -0400
X-MC-Unique: HP7mclnqPPyynwkRx2LsjA-1
Received: by mail-lf1-f71.google.com with SMTP id
 i1-20020a056512340100b003fdd5b951e0so1339096lfr.22
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 19:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YP/yOLmMm/sWLcuNtjBeezZwq4HiR5P1pp8C19wTJiQ=;
 b=Hh07djP2i36IsG1rbUQN9D2ZsRKCeu6/5s0Ox60aZgnCgkyaPkRxukYfSR1/l7hiMG
 W5K5Q+r321VjoMBAnL4ogHBK6U2fMHJYGOuWk6gLNaoJke7Ja+UWhUo/vIkYUe5IaJnI
 /W6Vv+6WT0txRiKyedUq3PYRfsV9nR2K+mq1627gUTlOuseCuPSlTjHqpSTJ1I3/1mOA
 GqNM730CnJC6mkYUCa64vBCBcE8kNBJQxSaBvb9TWb8B1Gr1F2XLSxVh0EkVMVtw8Dcm
 cbaPGrl9AJdWIkHuIwTL57DwUyglSbBir3o3pdzt3cOcNJMW157gkJ0opDWUzZvs4rbr
 UA6w==
X-Gm-Message-State: AOAM530f1imbquNvpZ/QIuBdw00V0TTPQ2g1oTIt6YLonA6AOUFUOYd0
 pn5NGNU+GwUeYaHKyNA5V6/G8/8MhUCNO6AbPvdzcDzClVfqD1wgwc8qDr8OYe4VHiAUUkvA4aW
 UoCwdgA4iu/i3d51yxQDPXpjvL5B1G6Q=
X-Received: by 2002:a2e:9155:: with SMTP id q21mr51176302ljg.217.1635993959401; 
 Wed, 03 Nov 2021 19:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfV89rTEhGJqt9GpD1p4fATa1S2uVJ8VSNXBi9pcXywQqnmJpLQRtpg8bMcz89hznG4kdsGYphhQ8zFLfp10A=
X-Received: by 2002:a2e:9155:: with SMTP id q21mr51176279ljg.217.1635993959152; 
 Wed, 03 Nov 2021 19:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211103100131.1983272-1-eperezma@redhat.com>
 <20211103100131.1983272-2-eperezma@redhat.com>
In-Reply-To: <20211103100131.1983272-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Nov 2021 10:45:48 +0800
Message-ID: <CACGkMEsUvRP7uw3zdxbHjmEVqaFXTmgYS8DJP+AY-XJqxwmt1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] vhost: Rename last_index to last_vq_index
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 6:01 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The doc of this field points out that last_index is the last vq index.
> Since last_index can cause confusion if seen out of context, renaming
> to last_vq_index, aligning with vq_index.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  include/hw/virtio/vhost.h | 2 +-
>  hw/net/vhost_net.c        | 4 ++--
>  hw/virtio/vhost-vdpa.c    | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 3fa0b554ef..8a79833b54 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -75,7 +75,7 @@ struct vhost_dev {
>      /* the first virtqueue which would be used by this vhost dev */
>      int vq_index;
>      /* the last vq index for the virtio device (not vhost) */
> -    int last_index;
> +    int last_vq_index;
>      /* if non-zero, minimum required value for max_queues */
>      int num_queues;
>      uint64_t features;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 0d888f29a6..081946dc93 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -232,10 +232,10 @@ fail:
>  }
>
>  static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index,
> -                                   int last_index)
> +                                   int last_vq_index)
>  {
>      net->dev.vq_index =3D vq_index;
> -    net->dev.last_index =3D last_index;
> +    net->dev.last_vq_index =3D last_vq_index;
>  }
>
>  static int vhost_net_start_one(struct vhost_net *net,
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 12661fd5b1..a1831b27ca 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -632,7 +632,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev=
, bool started)
>          vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>      }
>
> -    if (dev->vq_index + dev->nvqs !=3D dev->last_index) {
> +    if (dev->vq_index + dev->nvqs !=3D dev->last_vq_index) {
>          return 0;
>      }
>
> --
> 2.27.0
>


