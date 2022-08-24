Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A193B59F17A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:47:16 +0200 (CEST)
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgQF-0002tK-H9
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQgNj-0007x8-U0
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:44:39 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oQgNb-000623-DE
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:44:33 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VN5GOn._1661309054; 
Received: from 30.227.72.120(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VN5GOn._1661309054) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 10:44:15 +0800
Message-ID: <9f8b2e61-d992-46e3-e907-e6253dd78ae6@linux.alibaba.com>
Date: Wed, 24 Aug 2022 10:44:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 10/24] vhost: introduce vhost_dev_virtqueue_restart()
To: Jason Wang <jasowang@redhat.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <df42fc68d6cf780cce0e5d1c0e020cd3b687b42c.1660611460.git.kangjie.xu@linux.alibaba.com>
 <50ef3c5f-4d16-bda4-c002-ba77f7167886@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
In-Reply-To: <50ef3c5f-4d16-bda4-c002-ba77f7167886@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
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


在 2022/8/24 10:37, Jason Wang 写道:
>
> 在 2022/8/16 09:06, Kangjie Xu 写道:
>> Introduce vhost_dev_virtqueue_restart(), which can restart the
>> virtqueue when the vhost has already started running.
>>
>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> ---
>>   hw/virtio/vhost.c         | 13 +++++++++++++
>>   include/hw/virtio/vhost.h |  2 ++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 1bca9ff48d..fc3f550c76 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1913,3 +1913,16 @@ void vhost_dev_virtqueue_stop(struct vhost_dev 
>> *hdev, VirtIODevice *vdev,
>>                             hdev->vqs + idx,
>>                             idx);
>>   }
>> +
>> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice 
>> *vdev,
>> +                                int idx)
>> +{
>> +    const VhostOps *vhost_ops = hdev->vhost_ops;
>> +
>> +    assert(vhost_ops);
>
>
> So we had the comment like:
>
>     /* should only be called after backend is connected */
>
> in vhost_virtqueue_mask().
>
> If this assert has the same reason, let's add a comment here.
>
>
Get it.
>> +
>> +    return vhost_virtqueue_start(hdev,
>> +                                 vdev,
>> +                                 hdev->vqs + idx,
>> +                                 hdev->vq_index + idx);
>
>
> So it just a wrapper of vhost_virtqueue_start(), any value to have a 
> re-start wrapper?
>
> Thanks
>
Because in subsequent patches, to support vhost-user, we will add 
vhost_ops->vhost_set_single_vring_enable() in this function.

Thanks.

>
>> +}
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index 574888440c..b3394b6348 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -291,4 +291,6 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, 
>> uint16_t queue_size,
>>     void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, 
>> VirtIODevice *vdev,
>>                                 int idx);
>> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice 
>> *vdev,
>> +                                int idx);
>>   #endif

