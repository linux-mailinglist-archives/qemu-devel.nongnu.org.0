Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF5276AA0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 09:20:54 +0200 (CEST)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLLYj-0005A6-3U
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 03:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kLLWo-0004bL-5o
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kLLWm-00078D-Hj
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600931931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZ3/BPUVRwrbQPq6VKw3tMqbd6KhrzQlc7HRater6K8=;
 b=at2QyfZ5xjoWhn9hmeZ5sIZZB/+CHdVtQOOhXcdloNAHhpVe8dOabHBhl6vmGoyzP8uDt7
 N3e62K8ioFIIPe4wRb4wNUmitwDdQhwKnhhZW450T7NNF0RS1oWiWoxVCkLfNLmpu03xRt
 5ZG6kXWaTpAz1MiA2GWdJe79nq9JyI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-xVDVRJ5EP6y336Cj1UMzSg-1; Thu, 24 Sep 2020 03:18:49 -0400
X-MC-Unique: xVDVRJ5EP6y336Cj1UMzSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC06C1882FAA;
 Thu, 24 Sep 2020 07:18:48 +0000 (UTC)
Received: from [10.72.13.193] (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C5F281C40;
 Thu, 24 Sep 2020 07:18:43 +0000 (UTC)
Subject: Re: [PATCH 1/3] virtio-net: Set mac address to hardware if the peer
 is vdpa
To: Cindy Lu <lulu@redhat.com>
References: <20200917155851.20636-1-lulu@redhat.com>
 <b5ac3a30-6d81-117c-37af-e16b9a21ddad@redhat.com>
 <CACLfguUNqfKYb-4Yo6-7Zn4NwYq94WHSKn+2KPX1+W0JH7Re2A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <584a955b-ab7f-75ee-fbcf-fac8a76c368a@redhat.com>
Date: Thu, 24 Sep 2020 15:18:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACLfguUNqfKYb-4Yo6-7Zn4NwYq94WHSKn+2KPX1+W0JH7Re2A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Michael Tsirkin <mst@redhat.com>, qemu-stable@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/22 上午11:01, Cindy Lu wrote:
> On Tue, Sep 22, 2020 at 9:55 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2020/9/17 下午11:58, Cindy Lu wrote:
>>> If the peer's type is vdpa,set the mac address to NIC in virtio_net_device_realize,
>>> Also sometime vdpa get an all 0 macaddress from the hardware, this will cause the traffic down
>>> So we add the check for this part.
>>> if we get an 0 mac address we will use the default mac address instead
>>>
>>> Signed-off-by: Cindy Lu <lulu@redhat.com>
>>> ---
>>>    hw/net/virtio-net.c | 12 +++++++++++-
>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index cb0d27084c..7db9da1482 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>>        struct virtio_net_config netcfg;
>>>        NetClientState *nc = qemu_get_queue(n->nic);
>>> +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
>>>
>>>        int ret = 0;
>>>        memset(&netcfg, 0 , sizeof(struct virtio_net_config));
>>> @@ -151,7 +152,11 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>>>            ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>>>                                       n->config_size);
>>>            if (ret != -1) {
>>> -            memcpy(config, &netcfg, n->config_size);
>>> +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) != 0) {
>>> +                memcpy(config, &netcfg, n->config_size);
>>> +        } else {
>>> +                error_report("Get an all zero mac address from hardware");
>>
>> This is probably a hint that MAC is not properly provisioned.
>>
>> So I guess we can leave this as is, or simply warn until the management
>> interface is finalized.
>>
> Hi Jason, For sure this is NIC card's problem, They cannot provide an
> correct MAC address,
> But if we continue use this 0 mac address will cause this traffic
> down, maybe will cost a lot of effort in debugging
> So I think maybe Just an warn is not enough, We can use the default
> mac address  and let the traffic working


Yes, and it's done by the following code.

But the question is there's no much value for the error here consider 
you've already had a solution.

Thanks


>>> +            }
>>>            }
>>>        }
>>>    }
>>> @@ -3399,6 +3404,11 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>>>        nc = qemu_get_queue(n->nic);
>>>        nc->rxfilter_notify_enabled = 1;
>>>
>>> +   if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
>>> +        struct virtio_net_config netcfg = {};
>>> +        memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
>>> +        virtio_net_set_config(vdev, (uint8_t *)&netcfg);
>>
>> Won't this overwrite all other fields in the netcfg? I think we should
>> only touch mac part.
>>
>> Thanks
>>
>>
> Sure, will fix this
>>> +    }
>>>        QTAILQ_INIT(&n->rsc_chains);
>>>        n->qdev = dev;
>>>
>


