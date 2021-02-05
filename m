Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99B310BF8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:40:08 +0100 (CET)
Received: from localhost ([::1]:60376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81LD-0007dF-Pf
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l81K2-0006UF-J7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l81K0-0006w6-SC
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612532332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uocQje0GvsACJsrxI7nGSC09nXzmR8CsNnnjuH6DNOI=;
 b=TawdtDvAJ6HEPc8HY4wHSWreaxeiCnkPSA/S7lpzs4fD3o5w2rvEzC1fgtlVqdtLLZ03Km
 HMxWhdlFqlni9Ujvjq8R8nF8RE/WryKztSaxrlGTawx8/o6UrM6esQF3CkZF6vjxfs+ZiB
 rLaQsFrLQZA9wDb8v/+F6mp2+a8G1IU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-8a33_x0MM2CDRX4jkCF05g-1; Fri, 05 Feb 2021 08:38:50 -0500
X-MC-Unique: 8a33_x0MM2CDRX4jkCF05g-1
Received: by mail-wm1-f71.google.com with SMTP id z25so5596704wml.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 05:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uocQje0GvsACJsrxI7nGSC09nXzmR8CsNnnjuH6DNOI=;
 b=dkXF8p2edd83jChcYe0sZxWiTZgF4yI4aod64jfi8zTVPIipDriFPw8UdEiPyVeqe4
 NT6Od3x1hHEgjKyAYBx9s59joQJhFqFXN6PKvro6X2bHj7BINgZxw+/DT3BIu55jfLsa
 eqq/TJumXk1fCWgQ4+tt98G30ZarC8+pQ7nGFxkJBV9AemwzR4e3iV7kKHMxJW0Y3e4D
 NqYYASW5MMWLphornPdND5RKeBgi3zcMrVNt2WTa+9Iqg79UxUuGjp88jZkY4MNBX9Pt
 J5Z0ehbC3pSQR9LX+hB1houvEL3Hsh9DfonufyWjP+W1u69M6n7Zfm3QmplE1NKwK9bL
 Tamg==
X-Gm-Message-State: AOAM531CvdWWuceyc/ne40Qfsf0X4c2lpxrSpqLFNeKVyuRFPlPlga97
 TtsCK67PVPN3q1g3JEvflx6I4EB9Db/KBB0fOogJcylKxc0v7jP3d4tQbJqAUmNYRj/Ta+0/S/g
 mDZjUl8CHK/dYBH8=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr5130267wre.83.1612532329072; 
 Fri, 05 Feb 2021 05:38:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7EXCH6FZjspnGeLuA17Fo03KNTj6Pj1QCIh/LxiwQ1uezvNizbzEWei1W5yNcyEwGo2PugA==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr5130246wre.83.1612532328832; 
 Fri, 05 Feb 2021 05:38:48 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id 4sm13415242wrr.3.2021.02.05.05.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:38:48 -0800 (PST)
Date: Fri, 5 Feb 2021 08:38:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
Message-ID: <20210205083742-mutt-send-email-mst@kernel.org>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20210204202915.15925-4-yuri.benditovich@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 10:29:15PM +0200, Yuri Benditovich wrote:
> Currently virtio-net silently clears features if they are
> not supported by respective vhost. This may create migration
> problems in future if vhost features on the source and destination
> are different. Implement graceful fallback to no-vhost mode
> when some acked features contradict with vhost. The decision is
> taken on set_features call and the vhost will be disabled
> till next reset (or migration).
> Such fallback is currently enabled only for TAP netdev.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>


Sounds good, but I don't think we should do this if
vhostforce=on is set.

Also, let's document this behaviour with the vhost option so people
are not suprized.

> ---
>  hw/net/virtio-net.c | 58 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5150f295e8..b353060e63 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -515,6 +515,15 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
>      return info;
>  }
>  
> +static void virtio_net_allow_vhost(VirtIONet *n, bool allow)
> +{
> +    int i;
> +    for (i = 0; i < n->max_queues; i++) {
> +        NetClientState *nc = qemu_get_subqueue(n->nic, i)->peer;
> +        nc->vhost_net_disabled = !allow;
> +    }
> +}
> +
>  static void virtio_net_reset(VirtIODevice *vdev)
>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
> @@ -552,6 +561,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
>              assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
>          }
>      }
> +    virtio_net_allow_vhost(n, true);
>  }
>  
>  static void peer_test_vnet_hdr(VirtIONet *n)
> @@ -689,6 +699,15 @@ static void virtio_net_set_queues(VirtIONet *n)
>      }
>  }
>  
> +static bool can_disable_vhost(VirtIONet *n)
> +{
> +    NetClientState *peer = qemu_get_queue(n->nic)->peer;
> +    if (!get_vhost_net(peer)) {
> +        return false;
> +    }
> +    return !peer || peer->info->type == NET_CLIENT_DRIVER_TAP;
> +}
> +
>  static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
>  
>  static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> @@ -725,14 +744,14 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>          return features;
>      }
>  
> -    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> -    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
> -    features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> -    vdev->backend_features = features;
> +    vdev->backend_features = vhost_net_get_features(get_vhost_net(nc->peer), features);
>  
> -    if (n->mtu_bypass_backend &&
> -            (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
> -        features |= (1ULL << VIRTIO_NET_F_MTU);
> +    if (!can_disable_vhost(n)) {
> +        features = vdev->backend_features;
> +        if (n->mtu_bypass_backend &&
> +                (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
> +            features |= (1ULL << VIRTIO_NET_F_MTU);
> +        }
>      }
>  
>      return features;
> @@ -872,10 +891,25 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>      error_propagate(errp, err);
>  }
>  
> +static bool check_vhost_features(VirtIONet *n, uint64_t features)
> +{
> +    NetClientState *nc = qemu_get_queue(n->nic);
> +    uint64_t filtered;
> +    if (n->rss_data.redirect) {
> +        return false;
> +    }
> +    filtered = vhost_net_get_features(get_vhost_net(nc->peer), features);
> +    if (filtered != features) {
> +        return false;
> +    }
> +    return true;
> +}
> +
>  static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
>      Error *err = NULL;
> +    bool disable_vhost = false;
>      int i;
>  
>      if (n->mtu_bypass_backend &&
> @@ -894,13 +928,21 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>                                                    VIRTIO_F_VERSION_1),
>                                 virtio_has_feature(features,
>                                                    VIRTIO_NET_F_HASH_REPORT));
> -
>      n->rsc4_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
>          virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO4);
>      n->rsc6_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
>          virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
>      n->rss_data.redirect = virtio_has_feature(features, VIRTIO_NET_F_RSS);
>  
> +    if (can_disable_vhost(n)) {
> +        disable_vhost = !check_vhost_features(n, features);
> +    }
> +    if (disable_vhost) {
> +        warn_report("Some of requested features aren't supported by vhost, "
> +                    "vhost is turned off till next reset");
> +        virtio_net_allow_vhost(n, false);
> +    }
> +
>      if (n->has_vnet_hdr) {
>          n->curr_guest_offloads =
>              virtio_net_guest_offloads_by_features(features);
> -- 
> 2.17.1


