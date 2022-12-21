Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C565303A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:27:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7xEc-0000m3-LM; Wed, 21 Dec 2022 06:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7xEC-0000kB-96
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7xE8-000339-5E
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671621922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/YoJWYKN+SYp0MCSTREwr7EHlUgm2ulcn2pUEqRREc=;
 b=AejBFUckHhpMMV9pfHDY971WNCuEhCl7b0lCHIlMuBOoiP4P2FsugfQpCprJ4OUj3WvU+A
 HL6hGOZZL/umI/FEhaBqD07R1OW3w25CjYmUg7NSG0ff3OEIbeaej3jHVlyLBJ+34VkhS7
 V48ci5kZfKMzQA7X8HI4b4uhy+f3XxA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-pDlNJnk_OhGSJL77JD5lnQ-1; Wed, 21 Dec 2022 06:25:20 -0500
X-MC-Unique: pDlNJnk_OhGSJL77JD5lnQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bk24-20020a05620a1a1800b006ffcdd05756so11357399qkb.22
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 03:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/YoJWYKN+SYp0MCSTREwr7EHlUgm2ulcn2pUEqRREc=;
 b=L8N0GyrymeYNie+EPwhO+BQRdFn8P2xreYZS0Nzfk6i6pWQ8kA0+yoUCVlGjLNgqc3
 KmPozFlZHRUsy1B5VaaEvl/9MD0D2mTN3yA734iFvzTX8EA7lXXVSGUl2ZLG58kei5oJ
 XRMa6O7UcEPJl94KEaFswpuQ1ab5wfl+F6E+3CBNyQtzmlziDN9qqdqjKpg368K1Apw8
 gKRmOONCwn9Ey2zttE4D6uO1pNxbf4aVtTAMTBUxuffDrCIBFq7M4fzHm5lWJHiLYFYU
 Pz3rqeRAwBJDFDTt8aZnJ2R8Cosfp1g6JqxQvi+gdZf0HdgN0/YF9wwrWbA5wNDL6pxZ
 Bl5w==
X-Gm-Message-State: AFqh2kqydlQIizDoC3fT9YN9GSeowCfrzFJtKtyrjuX3EZB/r3qWQS7J
 1hlH52I2kIkgsbVuYQYZOlxGCYMpLZJUxeQA/SZvHtf4d5BrYVyul0WuQ6o6Bn21TOBA4+yF7P5
 07kc4BlYOamTMnrM=
X-Received: by 2002:a05:6214:2cd6:b0:4c6:ed1d:5988 with SMTP id
 lf22-20020a0562142cd600b004c6ed1d5988mr1897530qvb.49.1671621920390; 
 Wed, 21 Dec 2022 03:25:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgoyC0dx6MS4ybqmcbFX3S19iYgFY/+XFHAvUYIEdlDKmsnBQd4hCt1k1m1FGtp3WE+Ly2MQ==
X-Received: by 2002:a05:6214:2cd6:b0:4c6:ed1d:5988 with SMTP id
 lf22-20020a0562142cd600b004c6ed1d5988mr1897516qvb.49.1671621920127; 
 Wed, 21 Dec 2022 03:25:20 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 bp31-20020a05620a459f00b006bb2cd2f6d1sm10716045qkb.127.2022.12.21.03.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 03:25:19 -0800 (PST)
Date: Wed, 21 Dec 2022 06:25:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v20 08/10] virtio-net: add support for configure interrupt
Message-ID: <20221221062407-mutt-send-email-mst@kernel.org>
References: <20221211172042.3969410-1-lulu@redhat.com>
 <20221211172042.3969410-9-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221211172042.3969410-9-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 12, 2022 at 01:20:40AM +0800, Cindy Lu wrote:
> Add functions to support configure interrupt in virtio_net
> Add the functions to support vhost_net_config_pending
> and vhost_net_config_mask.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>



Causes a bunch of failures including mingw.
See:
https://gitlab.com/mstredhat/qemu/-/pipelines/728492799/failures

lots of:
/builds/mstredhat/qemu/build/../hw/net/virtio-net.c:3366: undefined reference to `vhost_net_config_mask'

Pls fix and repost.


> ---
>  hw/net/vhost_net.c      | 9 +++++++++
>  hw/net/virtio-net.c     | 4 ++--
>  include/net/vhost_net.h | 2 ++
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 043058ff43..6a55f5a473 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -478,6 +478,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
>      vhost_virtqueue_mask(&net->dev, dev, idx, mask);
>  }
>  
> +bool vhost_net_config_pending(VHostNetState *net)
> +{
> +    return vhost_config_pending(&net->dev);
> +}
> +
> +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
> +{
> +    vhost_config_mask(&net->dev, dev, mask);
> +}
>  VHostNetState *get_vhost_net(NetClientState *nc)
>  {
>      VHostNetState *vhost_net = 0;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index bee35d6f9f..ec974f7a76 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3323,7 +3323,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>       */
>  
>      if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> -        return false;
> +        return vhost_net_config_pending(get_vhost_net(nc->peer));
>      }
>      return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>  }
> @@ -3355,9 +3355,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>       */
>  
>      if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> +        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
>          return;
>      }
> -
>      vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
>  }
>  
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 40b9a40074..dbbd0dc04e 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -39,6 +39,8 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
>  bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
>  void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
>                                int idx, bool mask);
> +bool vhost_net_config_pending(VHostNetState *net);
> +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask);
>  int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
>  VHostNetState *get_vhost_net(NetClientState *nc);
>  
> -- 
> 2.34.3


