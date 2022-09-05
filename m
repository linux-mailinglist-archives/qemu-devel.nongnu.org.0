Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACD15AD0B2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:55:06 +0200 (CEST)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9kv-0005Gu-P1
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oV9Ip-0004Io-TO
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:26:04 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:56641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oV9Ij-0006JS-IM
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:25:59 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VOQTQk9_1662373550; 
Received: from 30.227.174.138(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VOQTQk9_1662373550) by smtp.aliyun-inc.com;
 Mon, 05 Sep 2022 18:25:51 +0800
Message-ID: <e7abf1e6-b7e7-bc45-d795-9e8fe3aa8567@linux.alibaba.com>
Date: Mon, 5 Sep 2022 18:25:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 13/15] virtio-net: support queue reset
To: Jason Wang <jasowang@redhat.com>
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <8577963f4b72f30c5dd1adfe661b08e57d26c453.1661414345.git.kangjie.xu@linux.alibaba.com>
 <8e7c93bc-2430-f0fb-d425-5e43fde23c14@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <8e7c93bc-2430-f0fb-d425-5e43fde23c14@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -108
X-Spam_score: -10.9
X-Spam_bar: ----------
X-Spam_report: (-10.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/9/5 16:30, Jason Wang 写道:
>
> 在 2022/8/25 16:08, Kangjie Xu 写道:
>> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>
>> virtio-net and vhost-kernel implement queue reset.
>> Queued packets in the corresponding queue pair are flushed
>> or purged.
>>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> ---
>>   hw/net/virtio-net.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 27b59c0ad6..d774a3e652 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -540,6 +540,23 @@ static RxFilterInfo 
>> *virtio_net_query_rxfilter(NetClientState *nc)
>>       return info;
>>   }
>>   +static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t 
>> queue_index)
>> +{
>> +    VirtIONet *n = VIRTIO_NET(vdev);
>> +    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
>> +
>> +    if (!nc->peer) {
>> +        return;
>> +    }
>> +
>> +    if (get_vhost_net(nc->peer) &&
>> +        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
>> +        vhost_net_virtqueue_reset(vdev, nc, queue_index);
>> +    }
>> +
>> +    flush_or_purge_queued_packets(nc);
>
>
> But the codes doesn't prevent the usersapce datapath from being used? 
> (e.g vhost=off)
>
> E.g vhost_net_start_one() had:
>
>     if (net->nc->info->poll) {
>         net->nc->info->poll(net->nc, false);
>     }
>
> And I will wonder if it's better to consider to:
>
> 1) factor out the per virtqueue start/stop from 
> vhost_net_start/stop_one()
>
> 2) simply use the helper factored out via step 1)
>
> Thanks
>
Will update it based on your suggestions.

Thanks

>
>> +}
>> +
>>   static void virtio_net_reset(VirtIODevice *vdev)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>> @@ -3784,6 +3801,7 @@ static void virtio_net_class_init(ObjectClass 
>> *klass, void *data)
>>       vdc->set_features = virtio_net_set_features;
>>       vdc->bad_features = virtio_net_bad_features;
>>       vdc->reset = virtio_net_reset;
>> +    vdc->queue_reset = virtio_net_queue_reset;
>>       vdc->set_status = virtio_net_set_status;
>>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;

