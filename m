Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300559F2F1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 07:06:35 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQib4-0006UA-Ak
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 01:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQiZC-0004xa-6a
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 01:04:38 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:38276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQiZ9-0000Mb-6N
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 01:04:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN5tzVn_1661317465; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN5tzVn_1661317465) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 13:04:26 +0800
Message-ID: <857ecf9e-d082-9523-c06d-085c5937fd2c@linux.alibaba.com>
Date: Wed, 24 Aug 2022 13:04:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 17/24] vhost: vhost-user: update
 vhost_dev_virtqueue_restart()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <8d278f0247085457582a367deb13431c943b8372.1660611460.git.kangjie.xu@linux.alibaba.com>
 <58558a13-b4c7-ff00-2135-a11816b5bebc@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <58558a13-b4c7-ff00-2135-a11816b5bebc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
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


在 2022/8/24 12:03, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Update vhost_dev_virtqueue_restart() for vhost-user scenario.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/virtio/vhost.c | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index a0d6824353..bd90cfe13a 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1937,11 +1937,29 @@ int vhost_dev_virtqueue_restart(struct 
>> vhost_dev *hdev, VirtIODevice *vdev,
>>                                   int idx)
>>   {
>>       const VhostOps *vhost_ops = hdev->vhost_ops;
>> +    int r;
>>         assert(vhost_ops);
>>   -    return vhost_virtqueue_start(hdev,
>> -                                 vdev,
>> -                                 hdev->vqs + idx,
>> -                                 hdev->vq_index + idx);
>> +    r = vhost_virtqueue_start(hdev,
>> +                              vdev,
>> +                              hdev->vqs + idx,
>> +                              hdev->vq_index + idx);
>> +    if (r < 0) {
>> +        goto err_start;
>> +    }
>> +
>> +    if (vhost_ops->vhost_set_single_vring_enable) {
>> +        r = vhost_ops->vhost_set_single_vring_enable(hdev,
>> + hdev->vq_index + idx,
>> +                                                     1);
>
>
> Rethink about the name, I think the current names is kind of confusing:
>
>         .vhost_set_single_vring_enable = 
> vhost_user_set_single_vring_enable,
>         .vhost_set_vring_enable = vhost_user_set_vring_enable,
>
> I wonder if it's better:
>
> 1) rename vhost_set_vring_enable to vhost_set_dev_enable()
>
> then we can
>
> 2) use vhost_set_vring_enable() for per vq enabling?
>
> Thanks
>
>
I agree. It looks better, I will refactor this part.

Thanks.

>> +        if (r < 0) {
>> +            goto err_start;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +
>> +err_start:
>> +    return r;
>>   }

