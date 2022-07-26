Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3FB580AFE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 08:15:20 +0200 (CEST)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGDqg-0003Fr-Np
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 02:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDnm-0001kO-2s
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:12:18 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:44098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oGDnb-0003yn-J1
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 02:12:11 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R371e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VKU5A4U_1658815916; 
Received: from 30.227.68.147(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VKU5A4U_1658815916) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 14:11:57 +0800
Message-ID: <cb841328-d8a7-657f-e917-d0ca955a470f@linux.alibaba.com>
Date: Tue, 26 Jul 2022 14:11:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 12/16] vhost-net: introduce restart and stop for
 vhost_net's vqs
To: Jason Wang <jasowang@redhat.com>
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <67cdafe53cfd096060957426c307d1580f3fd2e4.1658141552.git.kangjie.xu@linux.alibaba.com>
 <df5a8738-212e-c0f0-8085-288805e4b779@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
In-Reply-To: <df5a8738-212e-c0f0-8085-288805e4b779@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
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


在 2022/7/26 12:16, Jason Wang 写道:
>
> 在 2022/7/18 19:17, Kangjie Xu 写道:
>> Introduce vhost_virtqueue_restart(), which can restart the
>> virtqueue when the vhost net started running before.
>>
>> Introduce vhost_virtqueue_stop(), which can disable the vq
>> and unmap vrings and the desc of the vq. When disabling the
>> vq, the function is blocked and waits for a reply.
>>
>> Combining the two functions, we can reset a virtqueue with a
>> started vhost net.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/net/vhost_net.c      | 55 +++++++++++++++++++++++++++++++++++++++++
>>   include/net/vhost_net.h |  5 ++++
>>   2 files changed, 60 insertions(+)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index ccac5b7a64..4f5f034c11 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -514,3 +514,58 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>> uint16_t mtu)
>>         return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>>   }
>> +
>> +void vhost_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>> +                          int vq_index)
>
>
> Let's rename this as vhost_net_virtqueue_stop()
>
Yeah, I agree.

Thanks

>
>> +{
>> +    VHostNetState *net = get_vhost_net(nc->peer);
>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>> +    int r;
>> +
>> +    assert(vhost_ops);
>> +
>> +    r = vhost_ops->vhost_set_single_vring_enable(&net->dev, 
>> vq_index, 0, true);
>> +    if (r < 0) {
>> +        goto err_queue_disable;
>> +    }
>> +
>> +    vhost_dev_virtqueue_release(&net->dev, vdev, vq_index);
>> +
>> +    return;
>> +
>> +err_queue_disable:
>> +    error_report("Error when releasing the qeuue.");
>> +}
>> +
>> +int vhost_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
>> +                            int vq_index)
>> +{
>> +    VHostNetState *net = get_vhost_net(nc->peer);
>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>> +    int r;
>> +
>> +    if (!net->dev.started) {
>> +        return 0;
>> +    }
>> +
>> +    assert(vhost_ops);
>> +
>> +    r = vhost_dev_virtqueue_restart(&net->dev, vdev, vq_index);
>> +    if (r < 0) {
>> +        goto err_start;
>> +    }
>> +
>> +    r = vhost_ops->vhost_set_single_vring_enable(&net->dev, 
>> vq_index, 1,
>> +                                                 false);
>
>
> So it looks nothing vhost_net specific but vhost. And why not do 
> set_single_vring_enable in vhost_dev_virtqueue_restart() (btw, the 
> name of this function looks confusing).
>
> Thanks
>
>
I thought it was a convention that virtio-net will call vhost_net first, 
and cannot call vhost directly. So I implement it in this way.

It's no probem to move it to vhost. I'll fix it.

Thanks

>> +    if (r < 0) {
>> +        goto err_start;
>> +    }
>> +
>> +    return 0;
>> +
>> +err_start:
>> +    error_report("Error when restarting the queue.");
>> +    vhost_dev_stop(&net->dev, vdev);
>> +
>> +    return r;
>> +}
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index 387e913e4e..fcb09e36ef 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -48,4 +48,9 @@ uint64_t vhost_net_get_acked_features(VHostNetState 
>> *net);
>>     int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>>   +void vhost_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>> +                          int vq_index);
>> +int vhost_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
>> +                            int vq_index);
>> +
>>   #endif

