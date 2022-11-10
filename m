Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602DC624A73
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 20:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otD3d-0000og-Hq; Thu, 10 Nov 2022 14:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otD3X-0000oO-Bj
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:17:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otD3V-0006Lh-13
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668107859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oMSSnOT3jdZx1snQpInkWHO3/+RvsFuZis1ow8bm7U=;
 b=XQkSRXGm1TkyKJ/uUCs+goEfFADWzmj0+A1M30i5RSy7DsN8BkTf+VEoBqJhjm2aYJoyL2
 TeBOyslZux8sRMnofWNXnseAnOEBCq/R3x72SxxwM89bo7y8XEWKhXV0rk8pe4SQ+W+bnu
 68cNJ6bMn7K0MR9UFCacsPTnLUJuQ9Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-8SZBUk2cO96CyvI-uwlMkg-1; Thu, 10 Nov 2022 14:17:37 -0500
X-MC-Unique: 8SZBUk2cO96CyvI-uwlMkg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso1420570wmb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 11:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oMSSnOT3jdZx1snQpInkWHO3/+RvsFuZis1ow8bm7U=;
 b=24oMMqax95cCGVSriiIGDvXp/7n8QiDzSh4cyQa63IGFg0V3dNlcO0PR5GoNt1S2iK
 8cTASZaMFHipnkXt5l5eplSuizDJITECB7Tr2SxgDx3cmwQnt0cV1oS9YUW15eRKMaHI
 oY+hfr5EdQjgFIaveeQuCnosb17IC4vcdPxkLx4CoqfaIw3xjQtPVWEJ/eQLWv5WRVyK
 hWvBpZ03OB3NWDWSOoI3v6+OokYyMovMQSLaPmlKsryobrbzT5yBzSUojuOSsUPJBvjC
 eOUMq85xu1g6pEJFjonOEWBAIknsMarQuP0G+79M1LMriROErvG1XxIHAT3PzNz+oPLJ
 lUWg==
X-Gm-Message-State: ACrzQf2FJYKC6kQaQCfIlUexYo8L+gAoXb6HbKGlEa7H0l574POjgrWJ
 qmfM06F+J8JgiUl4GIy9NBQI+vdk+CI5L0cHmdxfncAU1dUOmyh+ed+pAnKnX1ha7ecvHLikuSe
 W+KaZ9wmd7Jeohhg=
X-Received: by 2002:adf:e4cb:0:b0:236:dce2:3604 with SMTP id
 v11-20020adfe4cb000000b00236dce23604mr34273221wrm.525.1668107855857; 
 Thu, 10 Nov 2022 11:17:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4rjieAyYib4inNQV3UXzDLYqWvUnQsvaZjwZDKfsQiR0hM47GLaotdt8UuA699pcKjcjBFNw==
X-Received: by 2002:adf:e4cb:0:b0:236:dce2:3604 with SMTP id
 v11-20020adfe4cb000000b00236dce23604mr34273204wrm.525.1668107855504; 
 Thu, 10 Nov 2022 11:17:35 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 iw2-20020a05600c54c200b003cf77e6091bsm5807087wmb.11.2022.11.10.11.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 11:17:35 -0800 (PST)
Date: Thu, 10 Nov 2022 14:17:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 2/2] vhost-net: Fix the virtio features negotiation flaw
Message-ID: <20221110141415-mutt-send-email-mst@kernel.org>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
 <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sun, Oct 30, 2022 at 09:52:39PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Save the acked_features once it be configured by guest
> virtio driver so it can't miss any features.
> 
> Note that this patch also change the features saving logic
> in chr_closed_bh, which originally backup features no matter
> whether the features are 0 or not, but now do it only if
> features aren't 0.
> 
> As to reset acked_features to 0 if needed, Qemu always
> keeping the backup acked_features up-to-date, and save the
> acked_features after virtio_net_set_features in advance,
> including reset acked_features to 0, so the behavior is
> also covered.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>  hw/net/vhost_net.c      | 9 +++++++++
>  hw/net/virtio-net.c     | 5 +++++
>  include/net/vhost_net.h | 2 ++
>  net/vhost-user.c        | 6 +-----
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d28f8b9..2bffc27 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -141,6 +141,15 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net)
>      return net->dev.acked_features;
>  }
>  
> +void vhost_net_save_acked_features(NetClientState *nc)
> +{
> +    if (nc->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
> +        return;
> +    }
> +
> +    vhost_user_save_acked_features(nc, false);
> +}
> +
>  static int vhost_net_get_fd(NetClientState *backend)
>  {
>      switch (backend->info->type) {
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index e9f696b..5f8f788 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -924,6 +924,11 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>              continue;
>          }
>          vhost_net_ack_features(get_vhost_net(nc->peer), features);
> +        /*
> +         * keep acked_features in NetVhostUserState up-to-date so it
> +         * can't miss any features configured by guest virtio driver.
> +         */
> +        vhost_net_save_acked_features(nc->peer);
>      }
>  
>      if (virtio_has_feature(features, VIRTIO_NET_F_CTRL_VLAN)) {

So when do you want to ack features but *not* save them?

Is the effect of this patch, fundamentally, that guest features
from virtio are always copied to vhost-user?
Do we even need an extra copy in vhost user then?


all this came in with:

commit a463215b087c41d7ca94e51aa347cde523831873
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Mon Jun 6 18:45:05 2016 +0200

    vhost-net: save & restore vhost-user acked features

Marc-André do you remember why we have a copy of features in vhost-user
and not just reuse the features from virtio?


> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 387e913..3a5579b 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -46,6 +46,8 @@ int vhost_set_vring_enable(NetClientState * nc, int enable);
>  
>  uint64_t vhost_net_get_acked_features(VHostNetState *net);
>  
> +void vhost_net_save_acked_features(NetClientState *nc);
> +
>  int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>  
>  #endif
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 74f349c..c512cc9 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -258,11 +258,7 @@ static void chr_closed_bh(void *opaque)
>      s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
>  
>      for (i = queues -1; i >= 0; i--) {
> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
> -
> -        if (s->vhost_net) {
> -            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
> -        }
> +        vhost_user_save_acked_features(ncs[i], false);
>      }
>  
>      qmp_set_link(name, false, &err);
> -- 
> 1.8.3.1


