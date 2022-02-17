Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A24B99B3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:18:48 +0100 (CET)
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKb3r-0004Mh-Qv
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nKb1y-0003Ye-Cg
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nKb1v-0008N7-J5
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645082202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/r2K5bFjmngR7ASpbUvL7mrmtt6WJeERMyxduZi7Tgs=;
 b=UoGCv8w8TqUEE3Wem+CdWADf1v6PMQMMHwjRx1oaY3WX1FWKm1dW8P+tH62I2KNkLnEymZ
 cIaP6+r9tNevOreAfn/Ux/1hqTzFiBNlNltlBKkgQJhMykzNr+oMYt3JCBWGzL3D/VUuY7
 kIzbVL6CV6NKsT2oCZOXOZAqQrZ5W2c=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-J-4Q1MtqOkOrLMTPLCeFLw-1; Thu, 17 Feb 2022 02:16:41 -0500
X-MC-Unique: J-4Q1MtqOkOrLMTPLCeFLw-1
Received: by mail-lf1-f69.google.com with SMTP id
 z24-20020a056512371800b0043ea4caa07cso1533290lfr.17
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 23:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/r2K5bFjmngR7ASpbUvL7mrmtt6WJeERMyxduZi7Tgs=;
 b=bLP8nlAtfnGWWzAP9WZ2M4Ah7bzineqc8+MkJAt/BK38eFlG6b3r0BLmZ3buWmZM0C
 KSo3Jlr7kU5S5uYienjcGdkVmklghvp1ukjRpEJroxbqf9MULYHw2OiGo+9ib8SnBdiu
 jFGhgLw5DDelrttFnUjh1AywYPbr61NuW7bWqXK7rRJ8UqurOXWSSovuBti6ONISvDyL
 zc2HhXj4KHmLaDXqbsIFzEBrUeMpXE3kgvXJDy0xEA+UxsnFz2IlW0jdG+L5+l/gxZvh
 Q9P+uU6RWpZEBByL5PKQEmfSYQ2ny+xgsAeag/htb0IBTqUTrV1eIIgjlhY6a8cbt3h+
 33Pw==
X-Gm-Message-State: AOAM530F9Y1IZ+lBLPC59I8rPMMSpMUxntnKXCYHFOUA2hdZlUODLmSR
 XXLZ1ccjYx5wuBYq7TY3gq05UDbZlP4MBhWGKa9JWzjcR+3ROSsJVsOwrgviQjrKxxnhDSSIwUP
 +v66Mwrw/KMZq9RoEXP7FY02r+lek0+A=
X-Received: by 2002:ac2:5052:0:b0:443:1466:54d1 with SMTP id
 a18-20020ac25052000000b00443146654d1mr1211669lfm.348.1645082199806; 
 Wed, 16 Feb 2022 23:16:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6EdWrCwtKEbouNbtI9s8zlRA8Ewolzp10BCLv0eHQT6N5kDM+fzNT6SVIj/BquU4s6ndgZtK3OE8GNRTe1j4=
X-Received: by 2002:ac2:5052:0:b0:443:1466:54d1 with SMTP id
 a18-20020ac25052000000b00443146654d1mr1211650lfm.348.1645082199498; Wed, 16
 Feb 2022 23:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
In-Reply-To: <20220215072231.2498-3-gdawar@xilinx.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Feb 2022 15:16:28 +0800
Message-ID: <CACGkMEt8UN8vd4KNKM7=Kcx28J2ANvLYN62NNzg9d5pHKhK4sQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
To: Gautam Dawar <gautam.dawar@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 eperezma <eperezma@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 tanujk@xilinx.com, pabloc@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 3:23 PM Gautam Dawar <gautam.dawar@xilinx.com> wrote:
>
> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
> for vhost-vdpa backend when the underlying device supports this
> feature.
> This would aid in reaping performance benefits with HW devices
> that implement this feature. At the same time, it shouldn't have
> any negative impact as vhost-vdpa backend doesn't involve any
> userspace virtqueue operations.
>
> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>
> ---
>  hw/net/virtio-net.c | 10 ++++++++++
>  net/vhost-vdpa.c    |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index cf8ab0f8af..a1089d06f6 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3507,11 +3507,21 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>      nc->rxfilter_notify_enabled = 1;
>
>     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        uint64_t features = BIT_ULL(VIRTIO_F_IN_ORDER);
>          struct virtio_net_config netcfg = {};
> +
>          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
>          vhost_net_set_config(get_vhost_net(nc->peer),
>              (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
> +
> +       /*
> +         * For vhost-vdpa, if underlying device supports IN_ORDER feature,
> +         * make it available for negotiation.
> +         */
> +       features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> +       n->host_features |= features;

This looks like a hack, considering we will finally support in_order.
I wonder if it's better to

1) introduce command line parameters "in_order"
2) fail without vhost-vdpa

?

Thanks

>      }
> +
>      QTAILQ_INIT(&n->rsc_chains);
>      n->qdev = dev;
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 25dd6dd975..2886cba5ec 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -62,6 +62,7 @@ const int vdpa_feature_bits[] = {
>      VIRTIO_NET_F_CTRL_VQ,
>      VIRTIO_F_IOMMU_PLATFORM,
>      VIRTIO_F_RING_PACKED,
> +    VIRTIO_F_IN_ORDER,
>      VIRTIO_NET_F_RSS,
>      VIRTIO_NET_F_HASH_REPORT,
>      VIRTIO_NET_F_GUEST_ANNOUNCE,
> --
> 2.30.1
>


