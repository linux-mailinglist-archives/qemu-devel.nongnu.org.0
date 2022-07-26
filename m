Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D09580BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 08:56:52 +0200 (CEST)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGEUt-00030D-4t
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 02:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGETB-0001VV-8p
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:55:05 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:50854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGET0-00014Y-Dm
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:54:57 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R451e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=kangjie.xu@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0VKUI4xp_1658818482; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKUI4xp_1658818482) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 14:54:43 +0800
Message-ID: <fd8457a1-fb49-577c-881e-c5fc50ede7ad@linux.alibaba.com>
Date: Tue, 26 Jul 2022 14:54:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 14/16] virtio-net: support queue_enable for vhost-user
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <591635c6dfa81b8310ae38e56916aa6f3842fc58.1658141552.git.kangjie.xu@linux.alibaba.com>
 <1c676f4c-5618-e944-cf2a-c0e3e5b8b0e9@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst@redhat.com, hengqi@linux.alibaba.com, qemu-devel@nongnu.org,
 xuanzhuo@linux.alibaba.com
In-Reply-To: <1c676f4c-5618-e944-cf2a-c0e3e5b8b0e9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
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


在 2022/7/26 12:25, Jason Wang 写道:
>
> 在 2022/7/18 19:17, Kangjie Xu 写道:
>> Support queue enable in vhost-user scenario. It will be called when
>> a vq reset operation is performed and the vq will be restared.
>>
>> It should be noted that we can restart the vq when the vhost has
>> already started. When launching a new vhost-user device, the vhost
>> is not started and all vqs are not initalized until
>> VIRTIO_PCI_COMMON_STATUS is written. Thus, we should use vhost_started
>> to differentiate the two cases: vq reset and device start.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/net/virtio-net.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 8396e21a67..2c26e2ef73 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -544,6 +544,25 @@ static void virtio_net_queue_reset(VirtIODevice 
>> *vdev, uint32_t queue_index)
>>       assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
>>   }
>>   +static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t 
>> queue_index)
>> +{
>> +    VirtIONet *n = VIRTIO_NET(vdev);
>> +    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
>> +    int r;
>> +
>> +    if (!nc->peer || !vdev->vhost_started) {
>> +        return;
>> +    }
>> +
>> +    if (nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
>> +        r = vhost_virtqueue_restart(vdev, nc, queue_index);
>> +        if (r < 0) {
>> +            error_report("unable to restart vhost net virtqueue: %d, "
>> +                            "when resetting the queue", queue_index);
>> +        }
>> +    }
>> +}
>
>
> So we don't check queue_enable in vhost_dev_start(), does this mean 
> the queue_enable is actually meaningless (since the virtqueue is 
> already started there)?
>
> And another issue is
>
> peet_attach/peer_detach() "abuse" vhost_set_vring_enable(). This 
> probably means we need to invent new type of request instead of 
> re-using VHOST_USER_SET_VRING_ENABLE.
>
> Thanks
>
>
1. Yes, we don't need queue_enable in vhost_dev_start(), queue_enable is 
only useful when restarting the queue. I name it as queue_enable() 
simply because it is called when VIRTIO_PCI_COMMON_Q_ENABLE is written. 
Would it look better if we rename it as "queue_reenable"?

2. I think inventing a new type of vhost-protocol message can be a good 
choice. However, I don't know much about the vhost protocol. If we want 
to add a new message in vhost protocol, except the documentation and the 
code in qemu, Do we need to submit patches to other projects, e.g. some 
projects like virtio-spec?

Thanks

>> +
>>   static void virtio_net_reset(VirtIODevice *vdev)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>> @@ -3781,6 +3800,7 @@ static void virtio_net_class_init(ObjectClass 
>> *klass, void *data)
>>       vdc->bad_features = virtio_net_bad_features;
>>       vdc->reset = virtio_net_reset;
>>       vdc->queue_reset = virtio_net_queue_reset;
>> +    vdc->queue_enable = virtio_net_queue_enable;
>>       vdc->set_status = virtio_net_set_status;
>>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;

