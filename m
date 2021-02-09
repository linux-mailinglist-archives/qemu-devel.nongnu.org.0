Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD485314729
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 04:46:51 +0100 (CET)
Received: from localhost ([::1]:57162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9JzG-0001p9-Uz
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 22:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9Jxo-0001O3-W8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 22:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9Jxl-0003LV-Dx
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 22:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612842316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBTf3FjFdUMeawaxUiFXlKO+Je85xoDu7QaLiU7M1YM=;
 b=XcU86XI2hRRp8QnhskPTlp34uGxI3snve4V6mOehLZYB8sEKQiRSuDaZXzgU/Mc+VPlUKc
 zP2+hcJOGvl+K31OCkVWqA1STyluRCgsJQMbaKNKKgehC7JwpIKv+gABx8lqfT4b5sKaHh
 yDVp3FlI1EEvlMyEy6IUmZQNdFsaf4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-7WSaeBfYNg-7LgEjyj9HUA-1; Mon, 08 Feb 2021 22:45:14 -0500
X-MC-Unique: 7WSaeBfYNg-7LgEjyj9HUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE2285B6C1;
 Tue,  9 Feb 2021 03:45:13 +0000 (UTC)
Received: from [10.72.13.32] (ovpn-13-32.pek2.redhat.com [10.72.13.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C5D35D734;
 Tue,  9 Feb 2021 03:45:04 +0000 (UTC)
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
To: Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
 <1f0f901c-8ad0-60a4-383f-851fc0f093ff@redhat.com>
 <CAOEp5Oco51MuLDEsxFrLtVpOWa1r7vrwLstAkJozfbt+AbVauQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c5a1113b-8c26-a48f-b4af-fcceb9bad77c@redhat.com>
Date: Tue, 9 Feb 2021 11:45:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOEp5Oco51MuLDEsxFrLtVpOWa1r7vrwLstAkJozfbt+AbVauQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/9 上午3:59, Yuri Benditovich wrote:
> On Mon, Feb 8, 2021 at 6:11 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2021/2/5 上午4:29, Yuri Benditovich wrote:
>>> Currently virtio-net silently clears features if they are
>>> not supported by respective vhost. This may create migration
>>> problems in future if vhost features on the source and destination
>>> are different. Implement graceful fallback to no-vhost mode
>>> when some acked features contradict with vhost. The decision is
>>> taken on set_features call and the vhost will be disabled
>>> till next reset (or migration).
>>> Such fallback is currently enabled only for TAP netdev.
>>>
>>> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
>>> ---
>>>    hw/net/virtio-net.c | 58 ++++++++++++++++++++++++++++++++++++++-------
>>>    1 file changed, 50 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index 5150f295e8..b353060e63 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -515,6 +515,15 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
>>>        return info;
>>>    }
>>>
>>> +static void virtio_net_allow_vhost(VirtIONet *n, bool allow)
>>> +{
>>> +    int i;
>>> +    for (i = 0; i < n->max_queues; i++) {
>>> +        NetClientState *nc = qemu_get_subqueue(n->nic, i)->peer;
>>> +        nc->vhost_net_disabled = !allow;
>>> +    }
>>> +}
>>> +
>>>    static void virtio_net_reset(VirtIODevice *vdev)
>>>    {
>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>> @@ -552,6 +561,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
>>>                assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
>>>            }
>>>        }
>>> +    virtio_net_allow_vhost(n, true);
>>>    }
>>>
>>>    static void peer_test_vnet_hdr(VirtIONet *n)
>>> @@ -689,6 +699,15 @@ static void virtio_net_set_queues(VirtIONet *n)
>>>        }
>>>    }
>>>
>>> +static bool can_disable_vhost(VirtIONet *n)
>>> +{
>>> +    NetClientState *peer = qemu_get_queue(n->nic)->peer;
>>> +    if (!get_vhost_net(peer)) {
>>> +        return false;
>>> +    }
>>> +    return !peer || peer->info->type == NET_CLIENT_DRIVER_TAP;
>>> +}
>>> +
>>>    static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
>>>
>>>    static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>>> @@ -725,14 +744,14 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>>>            return features;
>>>        }
>>>
>>> -    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
>>> -    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
>>> -    features = vhost_net_get_features(get_vhost_net(nc->peer), features);
>>> -    vdev->backend_features = features;
>>> +    vdev->backend_features = vhost_net_get_features(get_vhost_net(nc->peer), features);
>>>
>>> -    if (n->mtu_bypass_backend &&
>>> -            (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
>>> -        features |= (1ULL << VIRTIO_NET_F_MTU);
>>> +    if (!can_disable_vhost(n)) {
>>> +        features = vdev->backend_features;
>>> +        if (n->mtu_bypass_backend &&
>>> +                (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
>>> +            features |= (1ULL << VIRTIO_NET_F_MTU);
>>> +        }
>>>        }
>>>
>>>        return features;
>>> @@ -872,10 +891,25 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>>>        error_propagate(errp, err);
>>>    }
>>>
>>> +static bool check_vhost_features(VirtIONet *n, uint64_t features)
>>> +{
>>> +    NetClientState *nc = qemu_get_queue(n->nic);
>>> +    uint64_t filtered;
>>> +    if (n->rss_data.redirect) {
>>> +        return false;
>>> +    }
>>> +    filtered = vhost_net_get_features(get_vhost_net(nc->peer), features);
>>> +    if (filtered != features) {
>>> +        return false;
>>> +    }
>>> +    return true;
>>> +}
>>> +
>>>    static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>>>    {
>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>>        Error *err = NULL;
>>> +    bool disable_vhost = false;
>>>        int i;
>>>
>>>        if (n->mtu_bypass_backend &&
>>> @@ -894,13 +928,21 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>>>                                                      VIRTIO_F_VERSION_1),
>>>                                   virtio_has_feature(features,
>>>                                                      VIRTIO_NET_F_HASH_REPORT));
>>> -
>>>        n->rsc4_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
>>>            virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO4);
>>>        n->rsc6_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
>>>            virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
>>>        n->rss_data.redirect = virtio_has_feature(features, VIRTIO_NET_F_RSS);
>>>
>>> +    if (can_disable_vhost(n)) {
>>> +        disable_vhost = !check_vhost_features(n, features);
>>> +    }
>>> +    if (disable_vhost) {
>>> +        warn_report("Some of requested features aren't supported by vhost, "
>>> +                    "vhost is turned off till next reset");
>>> +        virtio_net_allow_vhost(n, false);
>>> +    }
>>
>> This looks more complicated than I expected. See
>> virtio_net_vhost_status() we had a fallback there:
>>
>>           r = vhost_net_start(vdev, n->nic->ncs, queues);
>>           if (r < 0) {
>>               error_report("unable to start vhost net: %d: "
>>                            "falling back on userspace virtio", -r);
>>               n->vhost_started = 0;
>>           }
>>
>> I wonder if we can simply depends on this (which is proved to be work
>> for the past years) by not clearing dev->acked_features like:
>>
>> if (!can_disable_vhost(n)) {
>>       features = vhost_net_get_features(get_vhost_net(nc->peer), features);
>> } else {
>>       vdev->backend_features = features;
>> }
>>
>> Then we probably don't need other tricks.
> Of course we can.
> But I would prefer to make things more clear, i.e. make
> get_vhost_net() always return a meaningful result, even (as an
> example) in procedures called from set_feature() after the
> vhost_disabled is set.
> Otherwise people can rely on get_vhost_net() and call its methods
> which potentially can do something that we do not expect.
> In some places in the code (also in future) we'll need to check not
> only get_vhost_net() but also is_vhost_disabled. IMO, not too elegant,
> but possible.


I see.


> Of course, being a decision maker, you can request to do it simpler
> and do not maintain a consistent result of get_vhost_net().
> But then please tell it explicitly.


So the reason that I prefer the above simple checks is that we've 
already had two falling backs points in virtio_net_vhost_status():

1) for vnet_hdr_swap:

         if (n->needs_vnet_hdr_swap) {
             error_report("backend does not support %s vnet headers; "
                          "falling back on userspace virtio",
                          virtio_is_big_endian(vdev) ? "BE" : "LE");
             return;
         }

2) for all of the other cases:

         n->vhost_started = 1;
         r = vhost_net_start(vdev, n->nic->ncs, queues);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }

So it's better to have a consistent way:

1) Introduce the variable disable_vhost as you suggest

or

2) falling back by checking the return status of vhost_net_start()

In this case, 2) looks much more easier than convert all the falling 
backs to 1).

Thanks


>
>> Thanks
>>
>>
>>> +
>>>        if (n->has_vnet_hdr) {
>>>            n->curr_guest_offloads =
>>>                virtio_net_guest_offloads_by_features(features);


