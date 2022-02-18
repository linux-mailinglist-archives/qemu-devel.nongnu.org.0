Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D04BB837
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:36:47 +0100 (CET)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1Z7-0008LM-Su
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nL192-0007jr-DF
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:09:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nL18x-0001j4-Mi
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645182582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/joZWzWvzHwzd1w3bq1TjRsroCOgeqNZuEZMEo+5/LA=;
 b=OIDcwfIKhNs0eei0yWWHRkkmJaPu6J++HJD3GSj3lBy4Adw4RmrFpeeJudjvZbvQOdqO8B
 NLnvxkQ//bMEMixujxapRScdNDY4NzV3m4I85SaRbXbwYaxmevUIOoYC5ab0aK5+xY2rtd
 7CvNtSEan3hXBUdTXzm/D99tOorO0Ho=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-1s-1S1VdP3WTXCsNqKZ2dQ-1; Fri, 18 Feb 2022 06:09:41 -0500
X-MC-Unique: 1s-1S1VdP3WTXCsNqKZ2dQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 j10-20020a05640211ca00b004090fd8a936so5305252edw.23
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 03:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/joZWzWvzHwzd1w3bq1TjRsroCOgeqNZuEZMEo+5/LA=;
 b=0batJflCj2Fa18jyzt15A+/74C5OW9B/3K9L0LXNtxLGWyECxSUjLNO7pszqRyjmtK
 q0hBn8Ne+vpUCc9nG4rNclr1W3QiQCS+4Hi5ltt04VPyexNunZvpwJz0oVVFSRzsH2jS
 v7sXAYFCfV9tRRKuKH9IsJswtryTM1Ph5wvu3XjQEm7LuGPazFXBNp7rP3QgMYWPsSvd
 JssLgfHoMSCajw501JGw42CUkq2ziT/kEzLy5EFqquBwC9tkXPQfrN75o3X0DfZu17v4
 6mDdvr7PdUq52JOQqqsBPDgKK5RauT6/kSCH+joEJa5Rm1CTOuPNqz6JY09BkkbFe+5C
 dDAA==
X-Gm-Message-State: AOAM532joED8cKsL52teMIGpO/wqqx0ZsAW8PPPHZiU7JN3pwGDBfx8J
 bifE1ud9C4fSC961nHFRxPVa6sAjWbyuHWD00yE1LjPfOYkq6U5/WheRxSzXSpbVCaKCQvwTYEI
 ND3Aq9iCUQActhmE=
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id
 c18-20020aa7df12000000b00410a50bde00mr7597283edy.2.1645182579793; 
 Fri, 18 Feb 2022 03:09:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyloRW3qFNk8zehBNCSPcsgxYt6qohpg1u/B+Tj4ZzraVFFb2wD9pHOe20iJyrIaOT/ShwJuw==
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id
 c18-20020aa7df12000000b00410a50bde00mr7597255edy.2.1645182579537; 
 Fri, 18 Feb 2022 03:09:39 -0800 (PST)
Received: from redhat.com ([2.55.156.211])
 by smtp.gmail.com with ESMTPSA id g6sm2163857ejz.170.2022.02.18.03.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 03:09:37 -0800 (PST)
Date: Fri, 18 Feb 2022 06:09:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gautam Dawar <gautam.dawar@xilinx.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Message-ID: <20220218060804-mutt-send-email-mst@kernel.org>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

I have a question by the way. Would it be hard for xilinx device
to support VIRTIO_F_PARTIAL_ORDER instead of VIRTIO_F_IN_ORDER.

That proposal is on the virtio TC mailing list, but did not
get feedback from any hardware vendors. Feedback would be much
appreciated.

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


