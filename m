Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365DF325688
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:19:09 +0100 (CET)
Received: from localhost ([::1]:59224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFMAF-0002D9-NV
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lFM64-0000jA-6g
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:14:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lFM61-0007gL-Dj
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614280483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XDYVDP2wL5+xQv6A6xt2WqZQiuHr2AAcS7cRxAlYvo8=;
 b=C/ZIKSMYNgB1uAKdZCKgaczbNtsJDsfBAseSkK098/8rg282XtG0kPuVwDO9qD20ABFbVa
 LBMgfDauVtCZqakH1HkJit6kfomz070uaV8WJpIJhNnRP6jC1HtB1d/GBJdnUGCgxyIr9e
 y9QmsJeKL0s6PxRpxtadHZj6wbjp1ZQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-7vUyZnrzODO1qeBPEwV_Rg-1; Thu, 25 Feb 2021 14:14:40 -0500
X-MC-Unique: 7vUyZnrzODO1qeBPEwV_Rg-1
Received: by mail-ej1-f69.google.com with SMTP id hx26so2944228ejc.3
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 11:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XDYVDP2wL5+xQv6A6xt2WqZQiuHr2AAcS7cRxAlYvo8=;
 b=A6AsGZHhI/c1OT7RoYx62xH+AgWaApHmSxfCyxZu9FkYMYzh1oIfbyB+MAeGpCIRAe
 KDitr+FQhfo+I32TUCNjWGTAqPSlLkIlcFNc6GUrnPQPiEFkXyxrqpZ2qHiDmgoBGFly
 MVPin1yXUjeeojTFT5XriH9Lq5o7Er6+Sje7wvYymvJRdWVfaOBcDVHWaLq1kGuqdBL+
 GnBDv9CMjpaZWZMKr8tQ0rhH+mPNlUw53IfCSHUhjA7UZ5nqQVcwY5s4JPR/ZEnX5F/D
 gwWmobrX3kdGjKTBIOvb5eeIQErxy7goADcUVfTn3aDI4/rrDSesMFANdSgPquu3wQYW
 PTjA==
X-Gm-Message-State: AOAM531OuVQkFwYk50rU2gCiUR+bgPWzxBf7tv6peTozhN+VLLQDIq70
 em3rpvDo/PJOM+ZZXmqk+kD87HiFPnO748xBtzAVOv8nKlh8jt4qORRL0nfzYWn9WNBAatx8bBx
 ORKdTh7lKrqhfjGM=
X-Received: by 2002:aa7:c80e:: with SMTP id a14mr4661368edt.295.1614280479387; 
 Thu, 25 Feb 2021 11:14:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqi2Us2rNZroDiiYV3xef7z0hDS+O0brltxVhNsYY6YQfea+ikce4hJKzMQx49Iwrf41y+oQ==
X-Received: by 2002:aa7:c80e:: with SMTP id a14mr4661349edt.295.1614280479220; 
 Thu, 25 Feb 2021 11:14:39 -0800 (PST)
Received: from redhat.com (212.116.168.114.static.012.net.il.
 [212.116.168.114])
 by smtp.gmail.com with ESMTPSA id ga5sm3443775ejb.114.2021.02.25.11.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 11:14:38 -0800 (PST)
Date: Thu, 25 Feb 2021 14:14:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v5 1/1] virtio-net: Add check for mac address while peer
 is vdpa
Message-ID: <20210225141203-mutt-send-email-mst@kernel.org>
References: <20210225165506.18321-1-lulu@redhat.com>
 <20210225165506.18321-2-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225165506.18321-2-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma@redhat.com, jasowang@redhat.com, amorenoz@redhat.com,
 qemu-devel@nongnu.org, Sean Mooney <smooney@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 26, 2021 at 12:55:06AM +0800, Cindy Lu wrote:
> While peer is vdpa, sometime qemu get an all zero mac address from the hardware,
> This is not a legal value. Add the check for this.if we get an zero mac address.
> qemu will use the default mac address or the mac address from qemu cmdline
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

I guess I will have to rewrite the comments and commit log :(

It is all saying what does the patch do. We want it to rather
give motivation.

Sean could you please comment on whether this patch fixes your
config?

> ---
>  hw/net/virtio-net.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 9179013ac4..8f36ca5066 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>      VirtIONet *n = VIRTIO_NET(vdev);
>      struct virtio_net_config netcfg;
>      NetClientState *nc = qemu_get_queue(n->nic);
> +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
>  
>      int ret = 0;
>      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> @@ -151,6 +152,15 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>                                     n->config_size);
>          if (ret != -1) {
> +            /*
> +             * Here is a work around, the 0 mac address is not a legal value.
> +             * if we got this from hardware, qemu will use the mac address
> +             * saved in VirtIONet->mac.
> +             */
> +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
> +                info_report("Get an all zero mac address from hardware");
> +                memcpy(netcfg.mac, n->mac, ETH_ALEN);
> +            }
>              memcpy(config, &netcfg, n->config_size);
>          }
>      }
> -- 
> 2.21.3


