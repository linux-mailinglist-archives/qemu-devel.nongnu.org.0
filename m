Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E0059F213
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 05:35:16 +0200 (CEST)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhAh-0001JI-OE
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 23:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQh9D-0008Kb-Bz
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 23:33:49 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:36258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQh93-00046H-TU
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 23:33:36 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN5WSkb_1661312004; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN5WSkb_1661312004) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 11:33:26 +0800
Message-ID: <37936da7-0b76-5ec1-2f7e-93e200e29eb2@linux.alibaba.com>
Date: Wed, 24 Aug 2022 11:33:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 11/24] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_stop()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <9f5f233aaef3096fa1715095f3c436bb3c855fe5.1660611460.git.kangjie.xu@linux.alibaba.com>
 <11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
In-Reply-To: <11f8a57c-96e0-6bea-2a1d-f0c7269fa75f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
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


在 2022/8/24 10:40, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Introduce vhost_virtqueue_stop(), which can reset the virtqueue
>> in the device. Then it will unmap vrings and the desc of the
>> virtqueue.
>>
>> This patch only considers the case for vhost-kernel, when
>> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/net/vhost_net.c      | 21 +++++++++++++++++++++
>>   include/net/vhost_net.h |  2 ++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index ccac5b7a64..aa60dd901c 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -514,3 +514,24 @@ int vhost_net_set_mtu(struct vhost_net *net, 
>> uint16_t mtu)
>>         return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>>   }
>> +
>> +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>> +                              int vq_index)
>> +{
>> +    VHostNetState *net = get_vhost_net(nc->peer);
>> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
>> +    struct vhost_vring_file file = { .fd = -1 };
>> +    int idx;
>> +
>> +    assert(vhost_ops);
>> +
>> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
>> +
>> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>> +        file.index = idx;
>> +        int r = vhost_net_set_backend(&net->dev, &file);
>> +        assert(r >= 0);
>> +    }
>
>
> Let's have a vhost_ops here instead of open code it.
>
> Thanks
>
I double-checked it, vhost_net_set_backend is already a wrapper of 
vhost_ops->vhost_net_set_backend().

It seems that, to further simplify it, we can only add idx and fd to the 
parameter list of vhost_net_set_backend().

Thanks

>
>> +
>> +    vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>> +}
>> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>> index 387e913e4e..9b3aaf3814 100644
>> --- a/include/net/vhost_net.h
>> +++ b/include/net/vhost_net.h
>> @@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState 
>> *net);
>>     int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>>   +void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>> +                              int vq_index);
>>   #endif

