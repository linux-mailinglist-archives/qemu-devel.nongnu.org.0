Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683845BDA0D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 04:20:43 +0200 (CEST)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaSsM-0007XY-EJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 22:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oaSqr-0004ek-TU
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 22:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oaSqo-00042L-Ne
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 22:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663640346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MEitvUxu8ItCA3viIyJVLdtKBmNSqx7l6oaAjWYN5A=;
 b=ZoZZyuvbFzM7fYCpIApY7K0S/qVe5NnxPOGNLEFAqylFi1uD/PqS5jBL/szKc6ZxhGeGDs
 7JN2kqLc1xa4ywh+rX9g2Paf9Pon61L6RspyTr6SPInm3CURHEm/+0dhR/iUq0hfmVIAIM
 iqm6iULtTZFksoE7gNolcTtv3z3Njn4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-tczELkd2OiCykSa7T5ltlQ-1; Mon, 19 Sep 2022 22:19:05 -0400
X-MC-Unique: tczELkd2OiCykSa7T5ltlQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 v6-20020ab05b46000000b003beeaa937ceso408304uae.9
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 19:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7MEitvUxu8ItCA3viIyJVLdtKBmNSqx7l6oaAjWYN5A=;
 b=WHPEbxpqDTQmuaLnB2dtXH6JcbuIq0a3liRP6xcgRpa4tNWj4tFPt9QI8DG4L6fhV8
 CBtsawUTFWuINpvfQJ+CE4VYyTIMLYZClKu2vRsgnh26awjMcQohP6UicrG/ast1qyKf
 j88Pqjq0g5fYXrX0xsreopDT2IUYYfFzVnBUZIX5WKLs42TbvnmugjauS1joGzgrNNJ2
 /0r9RiKh4lBqSzj48wtguOLwtZb6YhgeAK7vLZ0WW5FQop3h00Xvee04TowPr5/xWH6q
 flUkgAZrOVecfx5TNW/g6V2TqwVyJgMaqY1jrJm1wJ94S3g/EL64FiTlLxnMVdcx1G2s
 6wpA==
X-Gm-Message-State: ACrzQf0zQhwIZijupzrZgClGYhUyuDfxO8t3NC/3A+gZ8vaWZtPcCa3r
 +U/0hHouF1Ek95P1+ViCxIPZ60tBSJm3aTijapS61baor440ID2uFHqJ/RDaKKt6HDQ1NirV94N
 hp8HHTIGAcb2NO9UqfGK9tQa84WiPKF8=
X-Received: by 2002:ab0:6941:0:b0:3b0:3934:2932 with SMTP id
 c1-20020ab06941000000b003b039342932mr7380155uas.76.1663640343208; 
 Mon, 19 Sep 2022 19:19:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72xw3je8ORJ5pDo3FS+Zl6b8Og558uFpcf16SMk0pNjZ30cffS2H6YX3GPRdF7ZSywcQ14iClzhr+FC0kivD0=
X-Received: by 2002:ab0:6941:0:b0:3b0:3934:2932 with SMTP id
 c1-20020ab06941000000b003b039342932mr7380150uas.76.1663640342915; Mon, 19 Sep
 2022 19:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220913090817.212224-1-chenh@yusur.tech>
In-Reply-To: <20220913090817.212224-1-chenh@yusur.tech>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 20 Sep 2022 10:18:51 +0800
Message-ID: <CACGkMEs4nq_J4xXYUH54JMXETELC_i=WDR9UXByWCw6v1xLF4A@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
To: Hao Chen <chenh@yusur.tech>
Cc: mst <mst@redhat.com>, raphael.norwitz@nutanix.com, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, houyl@yusur.tech, 
 zy@yusur.tech, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 13, 2022 at 5:13 PM Hao Chen <chenh@yusur.tech> wrote:
>
> When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
> start the virtual machine through libvirt or qemu, but now, the libvirt or
> qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
> to get the mac address of the vdpa hardware without manual configuration.
>
> Signed-off-by: Hao Chen <chenh@yusur.tech>

Adding Cindy for comments.

Thanks

> ---
>  hw/block/vhost-user-blk.c |  1 -
>  hw/net/virtio-net.c       |  3 ++-
>  hw/virtio/vhost-user.c    | 19 -------------------
>  3 files changed, 2 insertions(+), 21 deletions(-)
>
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 9117222456..5dca4eab09 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
>
>      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
>
> -    s->vhost_user.supports_config = true;
>      ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
>                           errp);
>      if (ret < 0) {
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index dd0d056fde..274ea84644 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -149,7 +149,8 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>       * Is this VDPA? No peer means not VDPA: there's no way to
>       * disconnect/reconnect a VDPA peer.
>       */
> -    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +    if ((nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) ||
> +        (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER)) {
>          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>                                     n->config_size);
>          if (ret != -1) {
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index bd24741be8..8b01078249 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>      }
>
>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> -        bool supports_f_config = vus->supports_config ||
> -            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
>          uint64_t protocol_features;
>
>          dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>           */
>          protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
>
> -        if (supports_f_config) {
> -            if (!virtio_has_feature(protocol_features,
> -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                error_setg(errp, "vhost-user device expecting "
> -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
> -                           "not support it.");
> -                return -EPROTO;
> -            }
> -        } else {
> -            if (virtio_has_feature(protocol_features,
> -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                warn_reportf_err(*errp, "vhost-user backend supports "
> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
> -                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> -            }
> -        }
> -
>          /* final set of protocol features */
>          dev->protocol_features = protocol_features;
>          err = vhost_user_set_protocol_features(dev, dev->protocol_features);
> --
> 2.27.0
>


