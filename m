Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902343129A3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:13:43 +0100 (CET)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xvi-0007il-L8
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l8xtg-0006pG-3Z
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 23:11:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l8xtY-00052a-6D
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 23:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612757485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHKe42EyeKo5KGhvEz5Lt4YGJFH5jVYmhnAxfYWv5Ho=;
 b=V1FIBvOg5DkkZX3WZRvxBKWuj8Nywd7rXoC/nfHv0dY05tL8H4MQDIF16GSp437OezTq4s
 qx1Og8T51QMGR7aD5EK/K95fqu//wT7ghU3QxRLXKhZQc+9bFlsvT13qoZh6eRtnDx6iIc
 STOtEpOIK8xFG/0BJlRu/ULC9kMQJg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-hXPDI4G6MieAfiuulYwpvw-1; Sun, 07 Feb 2021 23:11:24 -0500
X-MC-Unique: hXPDI4G6MieAfiuulYwpvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A664801962;
 Mon,  8 Feb 2021 04:11:23 +0000 (UTC)
Received: from [10.72.13.185] (ovpn-13-185.pek2.redhat.com [10.72.13.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 364611002388;
 Mon,  8 Feb 2021 04:11:17 +0000 (UTC)
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
To: Yuri Benditovich <yuri.benditovich@daynix.com>, mst@redhat.com,
 qemu-devel@nongnu.org
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1f0f901c-8ad0-60a4-383f-851fc0f093ff@redhat.com>
Date: Mon, 8 Feb 2021 12:11:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204202915.15925-4-yuri.benditovich@daynix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/5 上午4:29, Yuri Benditovich wrote:
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
> ---
>   hw/net/virtio-net.c | 58 ++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 50 insertions(+), 8 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5150f295e8..b353060e63 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -515,6 +515,15 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
>       return info;
>   }
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
>   static void virtio_net_reset(VirtIODevice *vdev)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> @@ -552,6 +561,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
>               assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
>           }
>       }
> +    virtio_net_allow_vhost(n, true);
>   }
>   
>   static void peer_test_vnet_hdr(VirtIONet *n)
> @@ -689,6 +699,15 @@ static void virtio_net_set_queues(VirtIONet *n)
>       }
>   }
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
>   static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
>   
>   static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> @@ -725,14 +744,14 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>           return features;
>       }
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
>       }
>   
>       return features;
> @@ -872,10 +891,25 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>       error_propagate(errp, err);
>   }
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
>   static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
>       Error *err = NULL;
> +    bool disable_vhost = false;
>       int i;
>   
>       if (n->mtu_bypass_backend &&
> @@ -894,13 +928,21 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>                                                     VIRTIO_F_VERSION_1),
>                                  virtio_has_feature(features,
>                                                     VIRTIO_NET_F_HASH_REPORT));
> -
>       n->rsc4_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
>           virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO4);
>       n->rsc6_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
>           virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
>       n->rss_data.redirect = virtio_has_feature(features, VIRTIO_NET_F_RSS);
>   
> +    if (can_disable_vhost(n)) {
> +        disable_vhost = !check_vhost_features(n, features);
> +    }
> +    if (disable_vhost) {
> +        warn_report("Some of requested features aren't supported by vhost, "
> +                    "vhost is turned off till next reset");
> +        virtio_net_allow_vhost(n, false);
> +    }


This looks more complicated than I expected. See 
virtio_net_vhost_status() we had a fallback there:

         r = vhost_net_start(vdev, n->nic->ncs, queues);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }

I wonder if we can simply depends on this (which is proved to be work 
for the past years) by not clearing dev->acked_features like:

if (!can_disable_vhost(n)) {
     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
} else {
     vdev->backend_features = features;
}

Then we probably don't need other tricks.

Thanks


> +
>       if (n->has_vnet_hdr) {
>           n->curr_guest_offloads =
>               virtio_net_guest_offloads_by_features(features);


