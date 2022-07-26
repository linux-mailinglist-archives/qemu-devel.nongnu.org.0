Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0C7580C1A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 09:05:54 +0200 (CEST)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGEdd-0005Ld-1h
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 03:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGEa1-0003m2-Oo
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 03:02:10 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:48468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGEZs-0002EW-5o
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 03:02:03 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=kangjie.xu@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0VKUB-km_1658818911; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKUB-km_1658818911) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:01:52 +0800
Message-ID: <649c4b07-6443-e637-a124-52f2e655236d@linux.alibaba.com>
Date: Tue, 26 Jul 2022 15:01:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 07/16] virtio-net: support queue reset
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <c6718441a57198bc22d9861417e5ae69c0a70fdb.1658141552.git.kangjie.xu@linux.alibaba.com>
 <b5fb3193-a0a7-88c2-11b0-700a101c642e@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <b5fb3193-a0a7-88c2-11b0-700a101c642e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/7/26 11:43, Jason Wang 写道:
>
> 在 2022/7/18 19:17, Kangjie Xu 写道:
>> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>
>> virtio-net implements queue reset. Queued packets in the corresponding
>> queue pair are flushed or purged.
>>
>> Queue reset is currently only implemented for non-vhosts.
>>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/net/virtio-net.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 7ad948ee7c..8396e21a67 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -531,6 +531,19 @@ static RxFilterInfo 
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
>> +    qemu_flush_or_purge_queued_packets(nc->peer, true);
>> +    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
>
>
> Let's try to reuse this function in virtio_net_reset().
>
Yeah, I'll fix it.

Thanks.

>
>> +}
>> +
>>   static void virtio_net_reset(VirtIODevice *vdev)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>> @@ -741,6 +754,7 @@ static uint64_t 
>> virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>>       }
>>         if (!get_vhost_net(nc->peer)) {
>> +        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
>
>
> This breaks migration compatibility.
>
> We probably need:
>
> 1) a new command line parameter
> 2) make it disabled for pre-7.2 machine
>
> Thanks
>
>
Sorry, I don't get what is the meaning of "pre-7.2 machine". Could you 
please explain it?

Thanks

>>           return features;
>>       }
>>   @@ -3766,6 +3780,7 @@ static void virtio_net_class_init(ObjectClass 
>> *klass, void *data)
>>       vdc->set_features = virtio_net_set_features;
>>       vdc->bad_features = virtio_net_bad_features;
>>       vdc->reset = virtio_net_reset;
>> +    vdc->queue_reset = virtio_net_queue_reset;
>>       vdc->set_status = virtio_net_set_status;
>>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;

