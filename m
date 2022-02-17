Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6F4B99E6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:36:04 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbKd-0006td-QE
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbHg-0005TO-IX
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:33:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbHd-00025w-6A
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645083176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTUBHeOEltOAv+Jkswry3Bekv9Kv6f4tNMJ77KCZN2w=;
 b=ZH77w48fFIhlVOwxrFMKv4j/guMEYkDU4J1jU9kbnz9xLEbjaej+13SLEOX+ZB23O3sFk9
 yFLnImbaPX9T2YG9QzGbn/0r+gIxBUfx55iARoP5zcdR3VckBkJJ5gAukLVHZWfQ0n05k3
 4YOdVsLnka/ntYAPNea3Bz5sQljcL6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-eGgcT4YFMXS-TZU8ZuObgg-1; Thu, 17 Feb 2022 02:32:55 -0500
X-MC-Unique: eGgcT4YFMXS-TZU8ZuObgg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso3846034wmh.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 23:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HTUBHeOEltOAv+Jkswry3Bekv9Kv6f4tNMJ77KCZN2w=;
 b=4+JqhXLHXq+fCFnxbxLCIPk6XlbpbNFbUESzBSVAFL1L7RUXy4WSEjJUCIwfhNQhYH
 o4fkAVDNZoojyqxph2dYrTHKUm09sfMAQ6vupAATsxu/0cEhBAUf+OA2mN67MqeQXH4s
 AxxI4d7OH+mNRZzn11yer9d1T3zOBeP7Wg9pI22uaWxR202QieIzWKb8SxK7W3hpmxPh
 1u56S64RXAETT+8tQUvspCTdot5b/msY8+cOkEMzPqQehyyGVP9vTO+u1+JvacnKAJgH
 PnVzLbAdBi9w/vFXUwpYEq05IUVM3udKFdlne8+1p8u5l/9QU4A7PAwnw8iMEHaz6wQL
 BXww==
X-Gm-Message-State: AOAM531R/VNv9GceYq/MptIiNa1MOiq2fYqp5N7IzhaS9/RSl1dDN4t4
 1cSdKXiouKQNlmDNZoAbVjf4Pca2qlmnVm6qdE8QcG/PEavZgUltSijLtbGivR0cy7V4S80HqOO
 n0Kb1l3dB0BREh6w=
X-Received: by 2002:a5d:6511:0:b0:1e5:9467:e7b5 with SMTP id
 x17-20020a5d6511000000b001e59467e7b5mr1269616wru.307.1645083174098; 
 Wed, 16 Feb 2022 23:32:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOKArqOAq7sqwlMkYY8tfOGJIITqe5IFI9fz2CUh2e2MqQwU7NTAjKIN1c1wleZ/NaXhBm/g==
X-Received: by 2002:a5d:6511:0:b0:1e5:9467:e7b5 with SMTP id
 x17-20020a5d6511000000b001e59467e7b5mr1269599wru.307.1645083173810; 
 Wed, 16 Feb 2022 23:32:53 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id s7sm20959903wrw.71.2022.02.16.23.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 23:32:53 -0800 (PST)
Date: Thu, 17 Feb 2022 02:32:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gautam Dawar <gautam.dawar@xilinx.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Message-ID: <20220217023150-mutt-send-email-mst@kernel.org>
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <20220215072231.2498-3-gdawar@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, gdawar@xilinx.com,
 martinh@xilinx.com, eperezma@redhat.com, hanand@xilinx.com, tanujk@xilinx.com,
 pabloc@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 12:52:31PM +0530, Gautam Dawar wrote:
> This patch adds the ability to negotiate VIRTIO_F_IN_ORDER bit
> for vhost-vdpa backend when the underlying device supports this
> feature.
> This would aid in reaping performance benefits with HW devices
> that implement this feature. At the same time, it shouldn't have
> any negative impact as vhost-vdpa backend doesn't involve any
> userspace virtqueue operations.
> 
> Signed-off-by: Gautam Dawar <gdawar@xilinx.com>

Having features that hardware implements but qemu does not
means we can't migrate between them.
So I'd rather see a userspace implementation.

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
> +	/*
> +         * For vhost-vdpa, if underlying device supports IN_ORDER feature,
> +         * make it available for negotiation.
> +         */
> +	features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> +	n->host_features |= features;
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


